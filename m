Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.146
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793352418;
	b=vTQ3zUCXpJgwM5DzjpbrL1Se0qOfplUZda1ZgQOs3sissDF/Sf8fYKK2pi8xPgIlzpeS
	 R6rnfZAJHA+iKUwQPwsmnn7VR2RlQn4iAfhkKbrea6wj7i0mRlkdGK+QbPjzv9yXH1aLH
	 4+r50j3wJ12pH0jQDshDfJ5UlHQLoiqLvpm3nUcxikMdy7MAbuMkOyl/8b7V20tvsfebp
	 +VtudaJEvLTgv6fPR8osFe5efUVgsSe9l6uJoEstEAx9em1EQvpbkoibtnIVptKTBDAQy
	 Mjj/GVRHrTFl8lbDBkpv0PJHGAicUj5rEa2YAsGkOsgGfIACK86FcAucUesN6QlfkCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793352418;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=q6xEct3/Tvw/ILT4uLuSMRuS/JTgGJM/Yn19K9L9EIw=;
	b=gwIiUyE1XOJIKo9hXyaa42E+rc8mIrrAj+7tKATQWiWMKOgrBBjHenTygk9TaZfrXJDR
	 bjW3gu7gyG76h8VgKl42HZhP9sOqIfkhW0MM00EES3SOUOEDwJv+WHT08fipO6Av+1pvS
	 VgIYhb5M6gWSUQmMlM1zsq84u89Vmo+Wt4XWWrUc1YlyF7vB6/JLH+TJaPU+VH7Z/YgeJ
	 Glwr8yQKjVIdFSA3WBYcwrge8MJEB1TtWtLj0Qwg5P5cJDijL1OYHkSIaOmj9ZEuqpIX/
	 YyxupXTa0nBtDrY4PAHFYdTYo0IR9eyyL+Zu3Xe+Lx5a9g1F4KqfXkBVBH/xulKuK8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=A4gWONdB;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=Geiq5UlT;
	arc=none smtp.remote-ip=103.168.172.146
Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA5E9606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:26:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA5E9606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=A4gWONdB;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=Geiq5UlT
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.phl.internal (Postfix) with ESMTP id 88A35EC01E3
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 05:26:55 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Fri, 30 Oct 2026 05:26:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1793352413;
	 x=1793438813; bh=q6xEct3/Tvw/ILT4uLuSMRuS/JTgGJM/Yn19K9L9EIw=; b=
	A4gWONdBdW02zw5P67yQysOdxGsmoptqn5cqpA5aVkE/3miAG9UH09FEkzJatthp
	fG0OuG5d1JeGTGiisqOFYAE0lZ4xLJ9KJMwbTZSWatu713S/o9WV2cQq+TsmRwkC
	Iy4BdsDy/gy/E30AlmQ3Xbn5N5N2t6BR/lggUIhvtjWqYDd8DTyVYpEMY1IIYnal
	vU6r06v5ttgqbyv6ethNWygLLBqe3d1lmMp02ULiYp4xdszVjd7lNhIEjKs2+0WJ
	nb/4vtBx/bMLMlJH+hSrkJCAvtZWLERdIBk/ZUkMP/EFaaWjUN3o2QoeQsHsHn+X
	VIN5bDZuLOjF5DragM8UiQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1793352413; x=
	1793438813; bh=q6xEct3/Tvw/ILT4uLuSMRuS/JTgGJM/Yn19K9L9EIw=; b=G
	eiq5UlTo+rtM/j9aMBD64ps3UzXSENMldIxxqF5j4jFpw+7d/5YSPyOA358eQzhM
	V1i40oyv+ZFXCE1m25nggUOO6PfPRsWLpZuMYFWXVflKjiil5QoAsQdNochjK+Ek
	SmS9XPi4KszVkVxh8T2Rttecw1J6XNt0wval118sWhvL8M1wT553Yrx3XLzxNopV
	/E5t9K9sab/3xxtnC9vlVkkvJ93omaLjdz0nNwhPKWhbzK5cAAImlcIiLc7tbDVb
	gJARSfnN2kO0cROHu7V/qNWBl/ZmUDqj1x0Eqdirvm05G6eK1DqJpI6S8bR3d0xe
	YuTOYRpychBAJVj/6ZgBg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793352413; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:XD0a0gtvVTIYQx1rMkjDwMOzMi4o3RT8MGHpZrK5Ai8HpVm
	j6WZiTyPuRJLUSd/iBULR3UvIx73yvpl6RBZnZ+Hv2InA4mewhihaJrZV2ydvZOo
	uwGriiTdlWKkZ4BPmEcG5UVXKfbAx5SwYwWljBLJL8gx6VWKaq4D74Sa1/TNlohY
	GnGI2jhnL7DQ3mUdbW+5e5NL9XMjSv320xHvXRn/UYJAgC+/S1BSYnoAz68hLzvo
	jZ/l8kUmxFDCwR/niAGH9kcb87mtDPBJWHoLwi89p6ge2lw/Gb37AeGv9sfpva1a
	RSKSFm12eR1QXgFaWSoqsRNvJhFdRolyVVwY32Q==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:0+EPRUV970s4OZlHmTFKm3gsiY+sGHAHhdCQA0i95dE=:gmvX2jCLTU6mOxO7BXHnTbWLt36sxfk/auN8dImB3hc=;
X-ME-Sender: <xms:22Lkan27EPJq1S1e3n4t9bRh6QWabSJXsX-sas-rPGMHdCZCUOp3Lw>
    <xme:22Lkag72XDJTIgKFOTGrl27XVB6zYEu2zWY12aICbb2yoPdmt2uWMDR6-_Z-vQnml
    vod8hLFUdDb2sHi-nMevM2Onlz2NmMV_lXeqkaJjWMbo-1SaPSXoPo>
X-ME-Proxy-Cause: dmFkZTEtKm7TbVpyHutLdLiHabetxGk25DJ5oQjpMmX6aXHRVHS8CHuvwQZW52KAI1ZPcw
    6mPMOQbdBcr/ISBXdK4cqc6VI0p5tQSHD6rDcdUy5ak4DhaT3aWv5I1vP6vvaaWsmc5qS7
    CdiRyxmpzvowlSJrcfd0Yism3nn4u3OtljTmhN0U8ZlizmTyifhulCi5fxWMde2EqZiaBz
    cp1hkpdvV7pT5ndePDtguGK/TWIwoTGJws58vqo9EMrlVCyRxm6CFp/ajz7OYfGH9psjNA
    7ka0ryZzpSDBoCfb92+GdfOCJhiUNxH3XavedO5Kda1aBXakRbauvJN3vn7YupvdgtMuLo
    /SLAg1EeGGix+kFBHpduIgAaFzxoaElfF0RMmGwDz1Pc6YcAs4oqJtJBFaatuSAKMYCHya
    BrVZTpAcUG0tMpxlfNPSUvXY6waU1IDGicm2M2SQQVXWD9pV6NTxDqcHkGjUI33mTcM1m3
    PGMHMcVBxuOH5VeAODceYbabIRcsrutekPDVL7mFfbMzbMaT3oXkiCbi4lTtGxJvdazdf2
    s75kJupYjzKIY0NlvhCIu2Tz9Af7pMMHTXJXRtDCcrz+FA3+TnZyYVeQ1fgGnnLp7Raqcl
    gn2ZX2XaGeoZDVL8E4KijwDlwKB2VOmUDJBKOnCsWsbeYKljfpyIbffP0bBw
X-ME-Proxy: <xmx:3GLkakBilv2Edi4ANwVlwyjRu2FX1LJWSrMWbjly_g_q92VRPGi8bQ>
    <xmx:3GLkaveuSSxhF1WTWoNdLC1rgQn73QNXheUddnteAy6abAtl0VoWjg>
    <xmx:3GLkajKxfuIKxeadHbb0Gt3MaozUimdDZ8RdOHGL_8Z51zgfayNc-g>
    <xmx:3GLkaq2frfDJyBqAt7eY5jTQyje-M8-GVF8W52vZxsHQI-pt0o37xA>
    <xmx:3WLkaprSOdcF_v7_5FcDxfYn1I-QtTdUjJRmfE6n7fgMkzaGZmHHRxFr>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 45F4B32A0093; Fri, 30 Oct 2026 05:26:51 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-ThreadId: AkBENj9svcUo
Date: Fri, 30 Oct 2026 10:26:30 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Julian Vetter" <julian@outer-limits.org>,
 "David S . Miller" <davem@davemloft.net>,
 "Andreas Larsson" <andreas@gaisler.com>
Cc: sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org
Message-Id: <29541187-7232-48b9-86af-1cc4398713d3@app.fastmail.com>
In-Reply-To: <82307061-8bbb-4e42-89cf-cb0b5ab1442f@outer-limits.org>
References: <20261029145309.132218-1-julian@outer-limits.org>
 <e26b3c92-5213-44f3-8914-5ee8fb2d662a@app.fastmail.com>
 <82307061-8bbb-4e42-89cf-cb0b5ab1442f@outer-limits.org>
Subject: Re: [PATCH] sparc: Remove IO memcpy and memset from sparc code
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, Oct 30, 2026, at 10:03, Julian Vetter wrote:
> On 10/29/26 16:13, Arnd Bergmann wrote:
>
> thank you for your reply! I'm not sure, but to me it seems unlikely that 
> the PCI host bridge swaps. On sparc64 readl()/readq() use the flag 
> ASI_PHYS_BYPASS_EC_E_L, so they work on little-endian data. The CPU does 
> the byte swap here. The __raw_*() accessors use ASI_PHYS_BYPASS_EC_E, 
> which does not swap (which are used in lib/io_memcpy.c as well), so they 
> return the data in address order. 

Ok, good. I missed the '_L' bit and assumed they were the same.

In this case your patch looks good.

> And other I/O functions, e.g., readsl()/writesl() and 
> ioread32_rep()/iowrite32_rep() end up in insl()/outsl() in 
> arch/sparc/lib/PeeCeeI.c, which copy buffers with 
> __raw_readl()/__raw_writel(). And __ioread32_copy()/__iowrite32_copy() 
> in lib/iomap_copy.c use the __raw_ accessors on sparc64 as well.
>
> But that's just from me looking at the code and compiling the 
> sparc32_defconfig and sparc64_defconfig. I have no sparc platform, so 
> can't test it. Maybe some sparc expert can comment.

I'm sure it's fine then. For your patch:

Reviewed-by: Arnd Bergman <arnd@arndb.de>
