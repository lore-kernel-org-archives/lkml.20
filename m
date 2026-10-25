Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792933849;
	b=q6AE7h47dYYZ60FISWXDiaSbQ5qO+3y6OFvMllwM9c5lE/SdNoezTNym/bKqQxHCXDS2
	 ovE4ZM32Kyw9l04oDzQMBnNlNiGQMbz8dSri749eWuUiJ0g20B1hqcLTyZlJUG8x+MJ6T
	 WzoLFmNx3Z9R70Sz2IEKO7IQKGsOZK/gRgCLJoJy4oMLBkey/7TYfDobhV2W6s3IS/rJ+
	 3uYEHllNVSClaA0wq///EIDN8PKfgq1KnU3Q/2MKSpvGpk0Em0Bw5L9/SdonqoQgHzRCG
	 XcOSLq+QQ2znQSWWz5Qol4SOYFw7Ych3f3Tb0vga+US5VSgtabVCdJbjIGx56l0nxTw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792933849;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=vWsvI+WhZ/eBQ+bJmj0eGRitrJCJTUhFaPA/quTsmaQ=;
	b=KeHuC9ycF50dzyB/ieCHTbevIybCN+E3DMEUY8cZSqJAcO59BOIi/OQCCwz2a56ojZum
	 x1YM02XNE4dMeuWtZQKQyDbvdg1r+XbbLalr4p2DUpcCtyaMP8jOLhzk3/1Vo9Hfvfz6a
	 KUN21KLMHUTPbEWQ86Gvd3LLEe4UVBzk9f5Q+IBahfA1vKZ6HqRpWHvqKztDBs3HdrZrk
	 LUkZR7ul/yN0dOY3nbADZaollpMjFKRWbffDOCIwj4WH+scVaWmPqfk1yyJ9oa65+2m0+
	 uVjmUyBSRmtdhF0NunifCFviUiaiqhmlHMv+6hfwFI/0l99cnzFoImRhDWe6BOvNTag==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aS0mT9lT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.182
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDCB4606A321
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 13:10:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDCB4606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aS0mT9lT
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-5364648ae07so27943141cf.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 06:10:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792933848; cv=none;
        d=google.com; s=arc-20260327;
        b=Zz4XgFm+zp29OrndrbKHlkTcpAn38xLHPra/rUJTEX9NfHTW7A1vZULhM8cYgJVfg6
         i5oQY1UdcQO23FJ+1N8tWYVAEd8myvmrtC/EUoNRtNIfwO1x3V5UoPGzBUVuoEcdEJDc
         /pRlXu1D/uf/Ktj81wSru/VvuX90889DK7OjGq+rzaX2EgI17EDyGNojzVFAr4rh9zSF
         VG3ri4r3gtX0yR4C2yZjGJ0+qgjP+9nVpjey/QU8t4V+57iwEhESlQZmID4ahOTgCmZw
         nBiu18sTBZff+QrSK1x2AoPeEb0WoPbNW/ZoUFtHOCcNl/4yMgn3VUgD+o91COfWrS+x
         VogQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=vWsvI+WhZ/eBQ+bJmj0eGRitrJCJTUhFaPA/quTsmaQ=;
        fh=gJq4rWi8JQZF5gAVlcGDBqkgK7kEYjT0Y4cRb7IbK1A=;
        b=q4iOr4bgoQ8GxwAxp9uIVD6wCiiyqKgQTKRSlmKTZ4/hQV6n9g/jg404o/lyXjkrPw
         qd/nKtEpQbtWcGfcSGhT/VeTPwYb2ErRTSu1QwAiFc1pqeLY2cT9rJjw8XShMTasKN2N
         Ng7Ply+YaQ35H4vy8v7HKhleiyzkKVoPDqhNkHnfbxit2a6z3hfbTZPChO6yfLkZYhsf
         Sxk/19SQ77VSjNKIA/vpIcc+JIGYVK8/UmBLe55TiC97GiO5fPajfu5EH2bDJrHs6Gsu
         u+dBuVz1HbZhBvWcYAzUBevWfQaq8UT1qy4eyWNWbshi5YO50MkaRlthReJtZXNtxBQA
         +8zA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792933848; x=1793538648; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vWsvI+WhZ/eBQ+bJmj0eGRitrJCJTUhFaPA/quTsmaQ=;
        b=aS0mT9lTrQZMpxtqfZBjxGMaks+hTpRYEU6OKbUfSyi8ZWIzKcYOOxBas2QBhmCYzR
         ++r0YSLdUM/ldxZP1Tgg/7g9RpSe6Bg2p5aLRy50nSs5ZfOlCoPfJ07Q2Cu+tCAutFWe
         SpIfEYmLYxoHLlu7LmHIs4vnV8bTEVuHLUzuRnTc9ynlDQoaj3L2l+3bGErskjlSZzuF
         45NzEwCZGKg6HYssHJ1K8A9G52HlVEFWUFL6JcQ2LmrvZS1vC+EJYxq0I4QVodGyBJDM
         cn3OCTU9n78L/cRaDJSlN/IK8XAb+BtIkzx6jAAGccR50ZrxHamJAasGhPW9IJ2wLTcj
         vHCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792933848; x=1793538648;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vWsvI+WhZ/eBQ+bJmj0eGRitrJCJTUhFaPA/quTsmaQ=;
        b=i8pYxMb+1jIjl8ysawUUvR1Zn08w+2PdcqQUNFEYqLH64F9qx94x8BasRdTcwkpMSO
         Nt2APottsmUBPu6cIygaJRKWDIPhLs2yF7Vliss2JPIKQYg7wtoUWBAMLmV1IMMcd8o4
         eHVc4LzXfxwFNwOfmDClxg6UWKBYDYxT6oc5iRNf9Yx3S9KkMZJfON85Yuitn/FpJRzz
         grkl87teZjtzhVJlOyeXNU94A+/XTv0wlu7naYQzEZBh+l2DKiemx+JJWE8vFtxQitAp
         Iqxcv0+W/ulQg0mGLtt7mEi8MXpnumTz3A+LKOIr9C3Fxn+KmvDWRrxEYiJRUIUSjcp2
         2byw==
X-Forwarded-Encrypted: i=1; AKwUvByEpup4ysiKlFFuSCcRplMwRTpDS00eWU9HM8U/+JtSV8aLKdl6kfFL35576qUo7g07LsW8VbvVdYzM4mo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIF2m/GRmfr3LXYd6zMe6QdNRYe4BkNYghCyqfxzJY789o4VXx1
	T+FQv8rbI3BqQNZqXwsloRC7YUeNzfkReCB910yTevXfemuBepaZ6eSxI7O4bbV+2xEQU3z+21e
	NDMtSjyn5pUbIcJeaeMguS9erANXC7OM=
X-Gm-Gg: AYBFou0ShjLOJBlr2K9Il9MMefL/ftljrE6l/697vLuLqnrsLOJmKH5wJ2YeP2/7z0I
	IDeqf8Hz0UJSmlxO1/glmH60kLJWXEg6q+n5fseJ4raYOAO3jxYC8UbkIymH9YNSNMKnM9zk275
	oQOriwKS2MTxLR3lyqXSAGITjapNJabtrDNWsQrdxeVNtHC9+LXmI/4R3/YM0/ZFqF0K1aRteyQ
	6Hc1v/PoXswEIy1fc2k/w2BIyb0pteajcuYVb1OUsV6+bjgYRgP/G48WAVnuoTJ7TAabFK2wewr
	kCUgkfb97pVE3EEg4DnQ5AB7hDxp5ao+EAFSEsWxshZJw3udaLIG0hFtrNLxnu0xBsujeKAkGHD
	HOIP1eGfy8dap6TMaoKNIRXJjAGHRqk6B7F5tf5J7QfuY5swmwlITtw/+N2VrZMKXio/JjkYyOP
	dfMVLyrMfJfEyKyqXB27HAsgeffzVD82ShLJ/efLc8gjDIwyUX5+4ID/cApN79D+VLQ51KLp6Y
X-Received: by 2002:ac8:5fc5:0:b0:535:2447:3d03 with SMTP id
 d75a77b69052e-5383b5a1483mr65514591cf.35.1792933847628; Sun, 25 Oct 2026
 06:10:47 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015125644.12908-1-danielmaraboo@gmail.com>
 <20261015125644.12908-2-danielmaraboo@gmail.com> <atQ_mXYNqs4tnDpW@wyuan.org>
 <79dd90f0.11f3f.1a15272eff3.Coremail.dzm91@hust.edu.cn> <CAMAsx6eb3X7GLheOaVoumORnvKftFYkU0VHynZYyx9m74+CTTw@mail.gmail.com>
 <40aeaf0a-6e04-461c-a507-52f791b45541@hust.edu.cn> <CAMAsx6fk=k1aXT3gvyZ4k8hG9KN+YCmvEc42LGdmm3Y+p2J1_g@mail.gmail.com>
 <8ff98b43-248e-4568-a5fc-6f84f9cdbe33@hust.edu.cn>
In-Reply-To: <8ff98b43-248e-4568-a5fc-6f84f9cdbe33@hust.edu.cn>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Sun, 25 Oct 2026 10:10:36 -0300
X-Gm-Features: AclHuK8bHcc4Z-qSdqWJEwmIBsb6YWn-kuRE8Y87S9rU-feLwPs47WKKAFHvhfc
Message-ID: <CAMAsx6fha-ZKkiph+nG14hbNduGs=G3qRjHNUNxLSktTTQY+gA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] docs: doc-guide: add a guide for translators
To: dzm91@hust.edu.cn
Cc: wy@wyuan.org, jani.nikula@linux.intel.com, alexs@kernel.org, 
	corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	si.yanteng@linux.dev, chenyou910331@gmail.com, federico.vaga@vaga.pv.it, 
	akiyks@gmail.com, carlos.bilbao@kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

(Resending to the list: my previous reply went only to Dongliang.)

On Sun, Oct 25, 2026 at 11:22 +0800, Dongliang Mu wrote:
> Good job. I will quickly verify them and send a patch to move them.

Thanks. To avoid overlap, could you confirm which languages your patch
covers? I understand zh_CN, and that zh_TW is already handled by
Chen-Yu's series. That leaves:

- sp_SP: process/magic-number.rst and wrappers/memory-barriers.rst;
- the .txt files in ja_JP and ko_KR (stable_api_nonsense.txt and
stable_kernel_rules.txt), which I think are for their maintainers
to convert or drop.

> It seems the original English documentation moves fast. I would
> write a script or skill to check this relationship maybe daily or
> weekly.

A periodic check like that would be useful, especially once the guide
states the path mirroring as a rule.

For v3 of the guide, this is what I plan, based on the discussion so
far:

- state the path mirroring as a rule for translations of English
documents, and exempt documents that exist only in a translation,
such as a glossary or a language-specific how-to (Chen-Yu);
- describe ":Original:" as optional, and not needed when the path
mirrors the original, instead of showing it in the header example
(Jani, Weijie, Dongliang);
- drop the generic parts of the sections on writing documentation
and sending patches, and link to doc-guide/sphinx.rst and
process/submitting-patches.rst instead, keeping only the points
specific to translations (Federico).

Federico, I did not see an answer to my last message about this last
point. Is keeping those short translation-specific notes fine with you?

Since v3 only states the rule and does not depend on the moves, I
intend to send it without waiting for them to land. Dongliang, you
suggested removing ":Original:" only after all translations follow
the style; v3 only says it is optional, so I believe this is
compatible. Please tell me if you would rather I wait.

If anyone has other comments on v2 that I have not covered, please
let me know. I will send v3 in a few days.

Thanks,
Daniel
