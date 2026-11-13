Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.230.72
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794560538;
	b=TaXbvLwlb8YEtFZPBuLj281YLNkX5ndPV+Ta8eGEXHMc9dxqgYhPfoP8YGYwGHD1G1qi
	 7sQx2WJ3j3Xbcql2qmBDz/kOgMPT7ILz3mXZQUDjVfCIVxq0KDVioWtaIJQBfQ1FkdDj1
	 +NcXMmmU0Ev4w0m5rLnemBOMzL7ys+xMpStM9q8fYB4azZ5moBD+ZtFjm1tnUzqC2XQ6X
	 MCJKF8c/YfH1nS2CS363LqkpVRrFQBCExtyTAxQyAYjgqOG/ce0OMtWWVfMbySdytZevJ
	 K0YyJfqJxpyVIP+R/ghNAlzGxkO0CkmKhDVpOsTcdI5sWlJ1ZDoUpVhTLAO68l0QXmQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794560538;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=ShlP1QFQYWNs/RofmHP2lRmg95fTwvmsIbJOEo+1Nkc=;
	b=3FvEn0MOOomwn8FbF89Dhnff2ymhy5MWiMIzZN/aV8Ak/oLW1Gq81iEtdOZBXtEX4Gr8
	 9iiS7fzF4vDSyOEk02vraDqpO7Cw+0dmgdBdqwxYc/L7ScLj50fOfGQA3yYTWjQQIpMfm
	 DmfRNPmLyQkw0Hzc891hxd1YjdMeTexMTSPeWX87XUGmoapbjahnhObFouUlWyrPWEmSL
	 d6xYehXaZYWsSjMz4geXWCOyIjzhPkV6+GMECypVzv5jJPMqbcINy2fxTLpNksOgaL2Wt
	 OSZ4///rHwxg96BBFYaRPN30+LFmTH/ohEZMSXkFIlxs5xCV9W4+TifF46IFCxspajA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NKhNeKUb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.230.72
Received: from mail-lr2-f8.google.com (mail-lr2-f8.google.com [74.125.230.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A89606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:02:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7A89606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NKhNeKUb
Received: by mail-lr2-f8.google.com with SMTP id 38308e7fff4ca-3adf0220e61so4768101fa.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 01:02:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794560536; cv=none;
        d=google.com; s=arc-20260327;
        b=Qi9nPDX5AQG6N1OZSlLPBDh3/pv29Nt61y4VA3L+gTOmgPzmK8g8Fpl/iLaGQz7lvf
         tfCUrhccArgmvxQwf4Tl8TahasfidyZUurkqiZMVNNKv2uZxYn4QEsCaoO6eZF8tOUj4
         7LDQ80vpt7QJ8AqihXnkw7houiCyYFwM2Cb7LZRenHKcdsc/2psL6jgDjXvV7RP9Uh8q
         jS/yUJi4PwS/sPls1M8EHsmLax/tfaL+O6VlhpbFf3c7utFkU4VLK61YFxHDnpyVIWQy
         X9QPhtwOBkyO8htxooWuqfj7InohDj6mx8WThnXfHG4yE4dftzz2asAI+iYh3Ea+o81I
         GXng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ShlP1QFQYWNs/RofmHP2lRmg95fTwvmsIbJOEo+1Nkc=;
        fh=vm452+FK7xII37m/S1waQGVq7mI03QD0FfGZ5CZUfCM=;
        b=JIAizgdxOjPbcWAgj5VygPPSR7IToCsV7y8iHCa9X2/pFHkvn2bqHyiNJT+a7/nM3P
         Lh3GuRqZA8Xt2ftjcncwjAL1OwgkmKBgqJZxLkGi+HVGbbNhBUAXu7LXBsfeKG2OyR6/
         AqgwB+CWKCWZLm1ShCADzQizePaWifZlYID4kigo+7XDevXOtlNnvKpBrR67lO37jAF0
         fpKMRuy0qQ/xbVnJJFZRyfTLJ3D3JBuuM6KUW8WtTcySlLzv/XhpDR8QhDTRy5IPx7xD
         rKi/yNWMGKS+xZM8HN3wBNGhtJUh62UsQIPCrH/J/zweF53AsZq6/fNsrVKObJCR3RmW
         HyHw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794560536; x=1795165336; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ShlP1QFQYWNs/RofmHP2lRmg95fTwvmsIbJOEo+1Nkc=;
        b=NKhNeKUbz3nV9Y9Yq+59eD30vV280zDQg1sNyOEYIieLDElmHLs20LCcnzkf5MbhIW
         takXOiZtaYPjbmUNZZmzo1fnPIK3Ji8Q0Zz0NV5f23skw/D780ekbqMBEbR7felmUIq9
         HUVpvoq+TMkZOEf2bJXM3quhu1v/eIEEZlBBJOiV4+XyZG2T2voHsb5A7G+x5pKeft3j
         E4SnyXHi4htLkxcKF9S4j/vwUxhki6m/p0eMfN+WBBrK4kXnb+7DU10i1mdZahBBA6xo
         +2EUnmtDpivWbrgWEh+mj0UhVHKh9r3xL4XDWbPvFZw2XXGZeNsSGQc+KaZxYEVL4J0C
         F5JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794560536; x=1795165336;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ShlP1QFQYWNs/RofmHP2lRmg95fTwvmsIbJOEo+1Nkc=;
        b=IxiVyQaoFFcA8GoGzJdvswbdL5qVjf9bszFycmu881ZwenKk5RHrfn2l2KHna+IkMF
         5zEK4/VK8z5xx2P2Zgxc5x/fAx4JuSbPjhBLCBXjxqWGa0G7WtSUKskBY+eB8ZBp+b0O
         c28qZR6NyRP3m3ehDvaVlVArrBIMMwroE2xU/IW5eiQCvvzixYsOX5SehJ6lnqslmtZZ
         k9cEhi8mKaj3OgNF57MA41/1TNZH3Rwt8UGib7OKsqinS+f987A1TKU8V7nfPhQNvXnP
         O4uaMRHs+ISiZNWjmUE1BjJTDMSza9Md8a/0NjLEtxEgTrPPn9j72mSrnjD3NUpOaDIP
         mpkA==
X-Forwarded-Encrypted: i=1; AL+hErFSvEaK982USIBzZQRSy30afKQ64v7fBL9dEwf5IRFvpiQZTTMH2PsAfvgeQ/3FnSnaJi2bQv1yrz6Agf4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/9IU/2GiFnhvT0GUZGVckfiLQh/wl17j1JhH0nmIfmL9BnMlE8
	lWZCze+b58gNk6mPLE5wWW4W1VMofLRwSP4arE5X1uY42I9Xf593cxS6iMqbI72aayDQ2ISZC12
	JiwVIT/+poPfR3GBq+fdVBqt0YQ5yFbw=
X-Gm-Gg: AYBFou1N1lY9S1qWZccu58DLnLlxPGsA4N4aMufTaXWFHRoK5jpG5Q8d0Qt+gh+dUZ4
	v+t0Ucdt3ybRHj9m6qMankMsZmDhcG/Zm4vgBUwDghDioSGpn36xRcsZyY233AonyPnM8yYHhLV
	hU1jdZWfOrlJ4VLt9WkhVKIt/Tk4MlQsIA3B/8eNDP2/i/e75KCcf/Hr0nsmfBCA5qE0emgD9Vr
	WUijlf0z0dlh63JFf4aB3svFpYiH+VUD37AZvovVFex7dmCVofebkRq/olpGI9NUXIR2FV/rMdz
	Nbp5Hn52/rNGxeA9SOJaH77QGQ3hJwFO2uRbS2/FJc7i4OJMcsvQfpQVrUPX971+YSrjdQSZtsy
	iDuygyJxQBWcsfH6zu1RfeSlUfc4xr6LnnD9oHbt4JY/vtbzYFtay3lyjxU4=
X-Received: by 2002:a05:6512:b85:b0:5c1:4974:c153 with SMTP id
 2adb3069b0e04-5c1707740dbmr682345e87.27.1794560535586; Fri, 13 Nov 2026
 01:02:15 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113021845.1697485-1-w1355457260@gmail.com> <avbAkhu1V5wiVTkY@kekkonen.localdomain>
In-Reply-To: <avbAkhu1V5wiVTkY@kekkonen.localdomain>
From: z Y <w1355457260@gmail.com>
Date: Fri, 13 Nov 2026 17:02:04 +0800
X-Gm-Features: AclHuK-ejvsvZRZ1-nlBgJMJsxD4K4EbVb5r9KS4oPiuqrt78W2Z9owTA57KJlg
Message-ID: <CABG6VKNUs3m1t+8OytB_UQ1_j+DZ2pP+C25qV6-q11jfdJwLhg@mail.gmail.com>
Subject: Re: [PATCH v2] media: media-entity: make media_entity_cleanup() a
 no-op macro without MC
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Biren Pandya <birenpandya@gmail.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> I'd still call the argument "entity". Without MC, you can e.g. pass the
> macro multiple arguments otherwise. I can make the change while applying.

Agreed, naming it `entity` is better. I used a variadic macro only to
avoid checkpatch's MACRO_ARG_UNUSED warning; please feel free to change
it while applying.

Thanks,
Zixin
