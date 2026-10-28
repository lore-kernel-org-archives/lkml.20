Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.160.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793172681;
	b=hX4UlMhAtqVcCyHLi1DbDB76altYbRcgRz6DOz3X0mwEnUCsM700phyec317jlKGUpl7
	 l9xLCDQXQQYJLT1bQamT0w/gK3Wo7BWVdBoDwF+LzSQYWRdW+0X6WNPhXarJnR1AfCPWc
	 7qlbpdaB1fWUXivWGu5nKGB15GDIEIq+9J3f5PYKOyElg+VSQmorVVn9ALSnEleUBGpGE
	 tYE1M5PFGb3zRdVbS5dv2XHRNvI+xj3yKDRghOnsuzo9rlcY9DJ2vu/4x4I9TSpv3r7Wd
	 fjpYVRxDxR1yJrkDo3029JJy4aoSUV7io37h3L5ug7RBGevMScchIpn8vbbzzdCbrZg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793172681;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=iQiRq8EKSN+1zf5BDWbuoLAXrrO/KbsY0yobASx/cqk=;
	b=aCynEQ8yfbqg9KIjhXHZ8lyz3W3aS5yS+MKzyrmlH0V/PXoew3hDZZlevCDCaROgPDRe
	 JYJ3OKf9MAmsfsHufjtmu9CHHehmqKTwq/i8rwIaoTx+wZoyeVQqYOrIa/yskngIiyNF0
	 Z2TBm/antHJdXXnSrnsIL/AFYz958VFXupDbBSSBmZliimu3mLWi8ScHpz/2h+pLWxEMw
	 uu09/DoeapE/EYj3GqfEqHIr+qKurGASaKri4EAZMjMY0qspAiQv9xN2LlqWPzNVB0wH4
	 T8xFE7MsdB71WCbi5SO50JhEoJtwFAYn8nGK2Mj5o+xGtELmNTETAc6jXgFYTtyYm+g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FKnU1Sso;
	arc=fail smtp.remote-ip=209.85.160.45
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD13F606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 07:31:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD13F606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FKnU1Sso
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-451a49abd8aso681882fac.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 00:31:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793172679; cv=none;
        d=google.com; s=arc-20260327;
        b=k5FQXt7PRv0sBX2vawSWpgTA5YkhKomhaw5xeaEKSUBeEE0dWmddJKeaK/zh4Gqb85
         1eCHGH2NXMgs5mo04nRYfoea0MSaZGi/4Y/LP1drvFUFEhelpWhqmQBnAl1s+ZxxTxCA
         cmD+e8UUJJqu2pqNWdjcg+/Fu6vPEgI4JUH9zYk7Wr+XMu10yKjqjRAgYwlZzNzKeTSf
         77wJpkTAc9IP/qfjYrZ6Dfkaz3aaWGytc8gCvXbMrloG7xZHu9On6/isaTYbdro+0wch
         0q2+wUcaNANHT3tT+qVkEyRMG+FLZnGh8TDqQ1WsDc3kVdiM0JScYIgoup8XG7Lw8DPW
         88Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=iQiRq8EKSN+1zf5BDWbuoLAXrrO/KbsY0yobASx/cqk=;
        fh=mU4sAcDKXcKFD8b1UugOaOdYkIo+3a5Git/Rp/FtuBI=;
        b=Jwgc+PiTHlFTtuvvjG+FCsnL6TdAy9U/NYrfgKpyCAiE2csd1zWs6qLbMy4e2v1/12
         bWW1Cwa7KBQ5aKXwnVOQSOvuDYN2CK8wOilpvgAXM4wpEDvwBDTYvL2PEDH9kxsxBgpl
         mGMDzXv3h52Z/i7mc5P2AgRNYNoq/Uzc9hgrFZWzUuQ99/q3sSxjUd79iBXTnaJfGhsp
         EEbirUVuWzj0aV0He9KKuD52kEvOJhFKRmHexmGpbCq4YJKU6UEdz7A9L3Ym/Xgwb8+t
         C4cDcswMahI2NhKPL3zv9cwTMsPae/kkvG3lOOV9TohwTPqij2a/jbHlDwST4fTv3+Wj
         hNtA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793172679; x=1793777479; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iQiRq8EKSN+1zf5BDWbuoLAXrrO/KbsY0yobASx/cqk=;
        b=FKnU1SsoPuGX+StKWmKt7J7HvPblKKLOtilzEO5GTGGePk7/KWpDL30MiKHiqCwoBh
         sMy/HyJf3jtP3bCKvI14IiyrrbZonCfGypiYrmXasI8bjrZkkb1X59TxPKmjKitKmp4v
         33/EiDLw5jAhxVRV/1sKzKoiM/2Mnz5wRigtpEFc2VInjst/az5hRCJpdN2StfZnGIsR
         6IK/HrFtvoYYoptH0QeBfWAS57ywQf94NhFrHbpkmovzSuH7gqyZfyrGccHR3KCNR7NK
         0KwIdRzuYRknvuxWjgHce2hT1vfyS6jxc2cFMlCd3G/FPzmZBMvUNTds8qGDReZdRVBT
         23VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793172679; x=1793777479;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iQiRq8EKSN+1zf5BDWbuoLAXrrO/KbsY0yobASx/cqk=;
        b=m4o55Da3wRXp3zO2YdOy9jFKzjiOZEvA18zYbpGVroSNpWF8FXPNu+pf6vwhqKLohv
         QiFAdQPqqeHDTnG9kYGMayaZVtsEba6wM9bI13iauQFQc96fuX6NEdd8WtootXbALUS1
         vE8+s9+Ue93SRI+/n6MJlU1M7JVX7VAZhIOVFnMJE33jOkzEuka03hD3/3ClerFpjmFf
         nSGjPzptt9Kk1/h92KDeXLTOYf8xTVMmkPLN1WvNnCykcbiqzA7tCCu5laQNmw2fqACQ
         E38wIU5dTZ3YuxKUKz4mI10iZ5v5xp4RSsFDZ/Wi7rIYPLXpVE6UZFKzckV2gjYcaPPc
         nIFg==
X-Forwarded-Encrypted: i=1; AKwUvBwaE/BcyFMOk8FZsFQgv9hsVQwklMduWe7yyxTZH2ioh+iuUmnzHfMnHdHtbVD7TtzsAGnIgp5Zd2+2sdk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIYncHcJASu9pyq+iWTcbST8RYz8Rf3xaUtInsINvEowRL/EUVH
	jgSVw6+SWt0LOfY0rOB3i+01BfMKsBwo0i7JncMzANf64FR8zhtDJSLt1Z+XfQJoyjczywgKt5a
	Ja4F8k9WANem9lNieagiwTMliDdNh5r3K4vWu
X-Gm-Gg: AYBFou2x98vXag+NmRODkakTP2GIXcWhau/rajHBEX1ymTFV24OkscM7MfnzMt2/PWD
	HgH2HCUy/jaFCTsq54qqWOvfE3pQd7r0J9gtAgiNLlOOD5g8VT7dk54laQLw1gpJSMj+rjxfiMh
	+Us9pe3m3njivv6xJBpqM4plF2i7tdpQ8BEqJkdO0iK5DthKnN2urACk8yOriHWEZRnmd+iZh5M
	tbtaRYCipWlJ1dss/Ny0fYSBjPnnENW6KZ4fcmKFqVLZqrxMlOnTx+cQn/GAYm/JR0F2ay3NZ8P
	WkgUQZwDdkbD1bygVzSqS8SFwCRWYUY8x+aD+EQWv5UsIEJJE4/ZWUJmJuos40rv+Q+m84UBhg2
	ABn6dhOSHzT9xgd1wJJae8PcKONSDwa2I+s0SI/O5Zpl85FhrJwbEAKuRPg==
X-Received: by 2002:a05:6870:218e:b0:46a:ce42:d731 with SMTP id
 586e51a60fabf-4a8bb7d77admr1252875fac.9.1793172679566; Wed, 28 Oct 2026
 00:31:19 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CALXu0UcEbcHbb4F+pKG1vM5XmgTcuHiLn8Y6y_hQJAYjMdZeMg@mail.gmail.com>
 <20261027143533.180820-1-f3lix.dev@gmx.de>
In-Reply-To: <20261027143533.180820-1-f3lix.dev@gmx.de>
From: Cedric Blancher <cedric.blancher@gmail.com>
Date: Wed, 28 Oct 2026 08:31:00 +0100
X-Gm-Features: AclHuK9UoVaQruvJjCET-Yt7SwQ9SDO36FxYl3cJcTyHOQZwZzOj5cWWTcS4LB0
Message-ID: <CALXu0UcCpGT5n6ou_do4bFB=g8_MzB85724DvPTR68g_RhHkgg@mail.gmail.com>
Subject: Re: [PATCH] NFSv4.2: request mode after CLONE
To: Felix Hoffmann <f3lix.dev@gmx.de>
Cc: Trond Myklebust <trondmy@kernel.org>, Anna Schumaker <anna@kernel.org>, 
	Peng Tao <tao.peng@primarydata.com>, linux-nfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 27 Oct 2026 at 15:36, Felix Hoffmann <f3lix.dev@gmx.de> wrote:
>
> Hi Ced,
>
> Thanks for checking. No, I have not reported or submitted this issue to
> FreeBSD, libnfs, or any other NFS client implementation. I only submitted
> it here for the Linux NFS client.
>
> Do you think I should report it to them as well?

Yes, please. How should interoperability over work otherwise? NFSv4.1
is already a pretty fragmented mess, and interoperability is a big
issue.

Ced
-- 
Cedric Blancher <cedric.blancher@gmail.com>
[https://plus.google.com/u/0/+CedricBlancher/]
Institute Pasteur
