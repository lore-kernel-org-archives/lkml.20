Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com [74.125.230.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B8B731F9B4
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 03:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790134621; cv=pass; b=oWcqFdWgiYxgBa+0YIvnpI9knTmzhlGPhMbXP0hooznkbruTJrdJlW9U69YUiEf794xVzUnJMcB6WnSWk3CCFa0uuLDEieuA05bANycErVymLCRgBRCDL+4Iq30gpslwjeghKBcuFDWF8S0N3mHmOxhd4aipQY1G9pnQcVvGUWM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790134621; c=relaxed/simple;
	bh=/qxBJcYhlELi+GidH3qhbk7cum0tkPI9mCj4Z/HQ8Ac=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=stAxUe06ElBcqIQ0rypKqAAqNJ74BKNpw52gI18pheuvxbph8Ab8Gxe53vfOvdfPcNiVF4ztmLiIIy/Q0loNx5nMUm1u9IjQHHMXirEnWzmozKym7JlO9ghPWB9nL7dkxJ/wesJ9fF6OCbeARe7cK4rtbb7LEc4oWcez2ZpZx4M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J8gnLMZG; arc=pass smtp.client-ip=74.125.230.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J8gnLMZG"
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a30521ef15so3142421fa.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 20:36:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790134618; cv=none;
        d=google.com; s=arc-20260327;
        b=oebIMPeCTVEifU1FTnJDsd7qwlyjunN9en30w74KLPh0f24+a/r97eDosg5A3mE+PR
         hzezjjervIKWHW91fFmzlcH8FofX120gTn6wcDwD6bqu9jDAmkT9huii9QJLXZlrZsLL
         yLOrIiiy3t+GdQ6plnXquG8wVFhJJvpfMMwPR0RnNq8f3GZHt6UaeCl19QNl0UC9TFvi
         9vRKCgwuM4X5j4bziKRA4jn0DdxFR1GVrNuLSQ0a5CvVJnmXBlvw+IoHc8I+URoghmPI
         XnPpLHbBNtNsKQtQpZQ1XRb7UFvMizlQ6b8Sx0i4356P0p0MpTYYGC5Z5cMApurrXJkB
         8a/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KKLo74+Yco7BdhiMxFzPPDsZ4m2F2BSHmO+5yWtfCh0=;
        fh=oB018fasXzL5c1B9giS2Eh3aGqXFBC7dmnnv+dewGX0=;
        b=cKIPbkJ0e1tcBvO9ijYqSbQJtvUry7n2QJpvW1M2s+MMoYBQ4XZ/ZubC5+VbB3IFg4
         7f/rbWaF9AdT71PUpKKVd3Y+DWNs/TDujBetFYdyj9snzvskbEwYmGrVmcVXFfcxUtv1
         jFrbNPy2EIPLsZpXZY3adA31xiSwPbBskm9QwNVnsvtt1c3xy2BIAMYx8LwjK3m/gIk1
         IYj0P7n7F3JQ/tlzHtRYuR9dDytYdCfto+LxHZ2rLq5AeUUcdZL5SCuXfh2zXbRsKMUP
         mdnUJykoDBIPFz5T75yFJQT6vstwELtkReKzAQsNI/qHq4No5wbwoxJY6M0J6EUhwVAo
         68pg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790134618; x=1790739418; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KKLo74+Yco7BdhiMxFzPPDsZ4m2F2BSHmO+5yWtfCh0=;
        b=J8gnLMZGJSzKKxfrP0xLJQh1ke+4QeZ+Bi94U9xYJRnFywKkssyoZi6LgEfSsuLrUt
         bSuRJhmsSYR5kMiTGxrihAZMNALUqhgDIGpiecEwcfZtzLLTvEq+wvCwiUjsmwRMmAS+
         PPoDb0XVuQGrVKHeMTyLJtsifoauw7drtuijA47NsCfOZY+pL0/02g0eA1V6dl8O+r2q
         nLm79EQPnuaCeDEIC3MRnF6oJqfZ8uDQWsakrUlYE9ZRQ2K2nX79V6RKoObBtsA5+dju
         b1e8ePaL6/G0UBsxXWKA8IhcQ2OmQ8F2IZvLj/CvBm26x6xrGPXAkOvKrKEZ0L4gdXt3
         me9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790134618; x=1790739418;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KKLo74+Yco7BdhiMxFzPPDsZ4m2F2BSHmO+5yWtfCh0=;
        b=d1dXLPq9Hk2sjWQYjQS/X/FgHgbuzO9IOYBQv6sFI5F3Lni+2ACubzbTxgFWfdZtBt
         pX8aTZIQWTnaryWqGskBtIts4/gc3j/4PwTjczZwvIbx9GQ2rC+U4zINRAEw6putZWF/
         R3B2phNfJoNIwwStg9hl8Oz7GNdDMP4obV+PBTW+z3rqpzQLGItwRhr4/tW+Hfio0XDF
         T5W53rZks1rQEe1q9gJVPc56KlG29B198OURxal/l/vi36UpK9yc2L7pwys5rLQGiPe/
         9U8K3WQxOF/9AkFBAbiPBVT7D8ON1el/Kgn5pAkttuAjymwxoCbd8RXec2zc3ducKhJ8
         yWtw==
X-Forwarded-Encrypted: i=1; AKwUvBxVxg9l60Ex/xd60Q+BfK2D5GSUYdN3n7CinauHTzhRwTPl/7dJBq80hJqxr6m4ZzmkbzsxRtO/CGazQYU=@vger.kernel.org
X-Gm-Message-State: AFuF++kfPOPCkeAB3VgZsBqT4D8TmmBrR8ZptMcZCnO5J1U78DWkBO3h
	LdkNHCBD3JOMBf72wG6fWgsI9dYN+yoPdxbiZXzeOKXlVEl8FoccRDs00mKAqJhzWAoiD7BgIEb
	PLLj6huC6iVtSN3NCgXVo4d/+xmKQol4=
X-Gm-Gg: AYBFou3AQkgJPmWzEfFPxxf7QLzwlRFjpQ4Q3bgSGNXPxcHzsQH5igwZUcXO0SP9gKD
	vX9rpyjYk636px3857mWHYb16UtnUEdtHDBuw0H9crCkuIlaD2oarH4sPncjh3fUb7fiFnUK5+G
	iAOgEpiDRrZBKUQd4Ojy2313FlUKqYE4FOxti72i0fUjfE2O7tB0hfvSJoNqL+ONew86iyPP1nW
	Bh+utlBLELN3KePNgtN6SYBOnw7CaXyhW9Ev8ShL57sHZbIBT1iO1wEcvEvqvm7jZ32LX3vB5Wv
	dBEkBXuxLC1VwR5wCiqmfwvObJC0J+arzsGUrfyWQkMQgNDmCMB4D9B++z5iTiNbeqW3d+q5ltU
	R6jeDjTV0+LaocqhKrh9Rw0H6GhP5G2sTWZeQXVNt9J6ECw==
X-Received: by 2002:a2e:a551:0:b0:3a6:1694:821c with SMTP id
 38308e7fff4ca-3a63058afafmr2505641fa.10.1790134617663; Tue, 22 Sep 2026
 20:36:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921235951.3214-3-sigefriedhyy@gmail.com> <179012275019.2160803.2891956767256297440@kernel.org>
In-Reply-To: <179012275019.2160803.2891956767256297440@kernel.org>
From: Yuyang Huang <sigefriedhyy@gmail.com>
Date: Wed, 23 Sep 2026 12:36:45 +0900
X-Gm-Features: AclHuK-zDvybSnCH8-kv7q6WcLVB5cerfLjhFVuKxLvzAY4a2aHZ-j22ZbzjjFM
Message-ID: <CA+7S2vLXOO7+KJUnBFK9++TxKBtHgVdBtEaqx6sQpuqS5ZYsQw@mail.gmail.com>
Subject: Re: [PATCH net-next v6 2/4] net: add AF_PACKET multicast dumps
To: netdev-bot+sashiko@kernel.org
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, dsahern@kernel.org, 
	donald.hunter@gmail.com, edumazet@google.com, idosch@nvidia.com, 
	jacob.e.keller@intel.com, kuba@kernel.org, kuniyu@google.com, 
	nicolas.dichtel@6wind.com, nickgarlis@gmail.com, pabeni@redhat.com, 
	sd@queasysnail.net, shuah@kernel.org, horms@kernel.org, sdf.kernel@gmail.com, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> - [Medium] dev_mc_dump()/dev_mc_dump_dev() resume a paused dump with a
>   bare positional index into dev->mc (ctx->addr_idx / *s_addr_idx) and=E2=
=80=A6

Same point Nicolas raised. I will fix it in patchset v7.

> - [Low] uAPI vs netlink YAML spec out of sync: the patch adds
>   IFA_F_GLOBAL (0x1000), emits IFA_FLAGS/IFA_TARGET_NETNSID in=E2=80=A6

The spec update is the next patch of the series.
