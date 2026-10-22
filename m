Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.30
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792685458;
	b=F39v8FvKb9uBqavbf02wySRsHdA9p5CPXMJhvrZjwt+1SElv3qGORVHEt2O2Z+HigWk5
	 2AdltjbmI6E0W3LCj1D1OAiaXcbd8DsmrgP3soxvXE6Eo6Aa9x46CIwsu7Hx+JAK+FPGL
	 NdiFxq2BebqA0V0KK/GLoBMBxibSP4jwh6YtLWWNCB91mGGYFbqMCma9SmHpEegcIM8+Y
	 9F19aOLOYXFRJcWrdVXfMZC3SjrDVnARU8u7nZ0cQZ1RXK9qjL1AmkGQ0p6gZfJYX+6gI
	 y/4DLrqPCOrsC4+brKDxKVJCxuOXJKl7v/wusmaLMJvTr3LDza7Zp5wQLft67QZjVlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792685458;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=Co6eDYKk8IPN/9s3Hazm6D79Q0aT4q9Rf8hjYlsuRkU=;
	b=5CAgs9q3s6nAMcrca2UBcgQNIlZ8YGl44AyWbRFVh2y/k25dxSdDnxmHh2TM424TAnmh
	 tyTuICyyFQyLwRFECrBoxSscg1Y8PkdG/4gIxkGp4A5Xw63kz2LltzibsZSS8z0K0vbim
	 iUOlH7S6n48FgEpYFzyi6EWhqyASd4Ofg+IKnMKrSzbGwWYVz16fYQF0xLjI/It+zA7R+
	 odhp0PLuaVvyUCk0ZC4RENY0B8GZO8z9GH7jSJgbe+vLwSKsHAvAth1wAWrsQCOumaO+z
	 gHnsQfKyzBlNPi26ospo+fTsNhkI7EWnTtdfrBOOzKUXGow2SWOF+/RylOlMIP+DJuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=protonmail.com;
	spf=pass smtp.mailfrom=protonmail.com;
	dkim=pass header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=H6oo81Ot;
	arc=none smtp.remote-ip=109.224.244.30
Received: from mail-24430.protonmail.ch (mail-24430.protonmail.ch [109.224.244.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86FFD606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 16:10:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86FFD606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=H6oo81Ot
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1792685455; x=1792944655;
	bh=Co6eDYKk8IPN/9s3Hazm6D79Q0aT4q9Rf8hjYlsuRkU=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=H6oo81Ot8Ts0+5TF5zA2or2zUkYXRa+SysyfnN/wE74gfQd/QMuVB2PfFbB3Y3fyi
	 LP3XJrZMjsu5e8RussQ8zizMjpi0iqyRGK4kCQj205GH5Gm3sbZbTOWAAQLJRynCCD
	 tEAR5/6rtoZJdso3QzrRmuQ/HHfniBy2sG1KiOVz0hb+pkaVzPS8E+VKSnLzTiu8DM
	 IBSWi39y1Z5MY1eet1/1isVdMeVjbm/gF/aSkcc0e0uvdQEmwA2PUGLzmM2T/GfFNc
	 sIjzGRfaxQMhwnND5d1BuS5Dxbm1N8thSongkxz3d4dgGm3JyfMPjrBFJ/cl6yuII6
	 mvMCusYndL1Kg==
Date: Thu, 22 Oct 2026 16:10:50 +0000
To: "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>
From: Jari Ruusu <jariruusu@protonmail.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Announce loop-AES-v3.8k file/swap crypto package
Message-ID: <qT_dp1nX4gUxLWZJZNpUypK4gL0sHtBtd_J4VuwH8_DmYHe2DGyao5tSCy9o0Mj-p78v2ac2hqcsr_f4hiUGm_4BP9xiP25RaN6miBASR6w=@protonmail.com>
Feedback-ID: 22639318:user:proton
X-Pm-Message-ID: 15057aa9cf4a7ffc9219eabc19d84ba5e5d725fa
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

loop-AES changes since previous release:
- Worked around kernel interface changes on 7.3 kernels.
=20
bzip2 compressed tarball is here:
=20
    https://loop-aes.sourceforge.net/loop-AES/loop-AES-v3.8k.tar.bz2
    md5sum fdc2cbb4694dd9a8c951e59a53182da9
=20
    https://loop-aes.sourceforge.net/loop-AES/loop-AES-v3.8k.tar.bz2.sign

--
Jari Ruusu=C2=A0 4096R/8132F189 12D6 4C3A DCDA 0AA4 27BD=C2=A0 ACDF F073 3C=
80 8132 F189

