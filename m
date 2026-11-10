Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794277648;
	b=QByL/Bewmp4ltg8xmcVIerdWSZhM0h204Tc5TXSClBSKf5nbYFp0Ni5cL5rzl4KUdgpU
	 NCFBYGgDaz7hFX5NmEcQ6uzGhmbubWV62Y3qAG/vG546NF5Fh9fcvBZGRAXZ/kSkY+hM+
	 kNn4oHzG+PQIUQqhKntrcobAe+l1ZPnqjcWjv+JPMzOmNhOxyPvXvYfKy9M//fFdrwym8
	 ASb+ENn171PnKwfk0nooYC2LMd7xob7gVUbAuF8zTasPacCv6XD4V2NtIVwlhXIv6kIWI
	 D5IGh7dmg7Pc28Tea0lGsOPRvzW4roJXbOEgqQCv9HFswuREEXB7hdKje2IuSgdu0VA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794277648;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type:Content-Transfer-Encoding;
	bh=wcMdtWhwbH+i17pMxbWC/5jbOqh7i02BoP1LoVU1BXE=;
	b=Re347pQVJRNltDc1l1NJS1JSJdJmj+L8acqrd7ePozq0mi14xf1BchsrI44omE8JLZLO
	 /wFdRBAC60HiDB/AUsNkqnZaKs5QCZ8fS8fUGMrOzIoHgHpWSZ7iw6VQ4UoYML3Kznsq2
	 8ule3PagIT0Z8hxgs1lnQJz8FjSQMZGFsHy6AnYITQWyA1UBjDoB1EOAmTecjuYU2mKff
	 ypXWLzel+MRiyDsv/rXCULR/fuxwEmnI/H7wP9+dMim6kTg3vP9eXcpzRCN3XiYPTc1MI
	 v23jfxgmTZ+nYAUfYrkdmYNY0+/vWlnW1DQTMILQSK+2wj2mIZ/HiumOZAxyfqZcGmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=alepacheco.dev;
	spf=pass smtp.mailfrom=alepacheco.dev;
	dkim=pass header.d=alepacheco.dev header.i=@alepacheco.dev header.a=rsa-sha256 header.s=fm1 header.b="T9/ZZjHX";
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Ruo21dyn;
	arc=none smtp.remote-ip=103.168.172.138
Received: from flow-a3-smtp.messagingengine.com (flow-a3-smtp.messagingengine.com [103.168.172.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57080606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 02:27:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57080606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alepacheco.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alepacheco.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=alepacheco.dev header.i=@alepacheco.dev header.a=rsa-sha256 header.s=fm1 header.b=T9/ZZjHX;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Ruo21dyn
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailflow.phl.internal (Postfix) with ESMTP id 826A31380EDA
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 21:27:26 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Mon, 09 Nov 2026 21:27:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alepacheco.dev;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm1;
	 t=1794277646; x=1794281246; bh=wcMdtWhwbH+i17pMxbWC/5jbOqh7i02B
	oP1LoVU1BXE=; b=T9/ZZjHXVRReSkrLci/bwMlEMsf4KpIRZwqdDIIcCDNexa1W
	0xMbNExTaovZpGSyqakpUuyFDr+RJH3NNiT670CWysm28GupyrzfhjLlQhv1BNbC
	VY1+aTiWhDkOTd4yDa0Jn9FQZb0RJbyXgxaa057OrjHt5ytM0I9oclwYQ8dmwsPS
	PUyAf3f8H8rNf9BxK/E/CcO5TofwFzRVlVKyZtqY+N5T6QAWxT2twlSVR97IciW0
	lEKec07feLv8hMrLbEgTLq2cO3zmfhV9BCx7Mr9Jkw8cgU/KrtE0AYLb1WMTKSEA
	q203FAyTOkgJAcJ3xVaB/YmcrqKsXEecf9zbWg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794277646; x=
	1794281246; bh=wcMdtWhwbH+i17pMxbWC/5jbOqh7i02BoP1LoVU1BXE=; b=R
	uo21dynuetAFkx5L8M7OAdTxThB5fj2uhZTLmi0wrfoCv/PlNy/gBgHiPicVULc9
	d4FwdARhEX0HOpLX45T/0bpyuuWdtgLf5LdZ4JacRFnL+XpSak0OIWBey1zsJX9R
	j7EWCJZWLyWk9ecl0dC0MCiLLFjh1pEiJNZp72pY1nn6n/vZIobV2pCTCC+3YlYo
	W8XXH9Nc6e4CCFICy0cgNbVbFla6y1bpOzGV+JFx6dvpHQsVdRra/ax6yPW6+z7P
	Q5hw/lIoFTf5MVHHrCIkZQtbPUzznFhGNE2oYgYBwp/Z5dMn0Bx94yv84yZh6vNt
	RnOX2bptXzu+SPnSod8Vw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=alepacheco.dev a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794277646; d=alepacheco.dev;
	mf=PGFsZUBhbGVwYWNoZWNvLmRldj4=;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:Jgf8se8MscP4E8yfAFB4YDA/pAnbXR+onAPkeGZlNKNesz8
	b7zIU7Kq+OmC/otm4TUSzhFdvtWxQBoLVf7uNOzSb+lsyEcxy8idqkezcaCTzY+H
	riPy4T1jR6mG76cnW7EVa16+1AbjB1WwpUNvaYFhgYxMmoKfMBdUzIcf+Tpd7uYG
	VzXqQAYqtEQMcDyDSo+K32B9tsbC6+P0Fa6G80vYZ2W8d1y7lNh2mT2LC75huOqJ
	HnkVd0KMNXg2kEb6ynnnFH3IW+4AeJD6R1uoi3m5w2S0n/j3TfNA77t+Wxt5DLek
	6NijtJF2lpK8qyx4Y5LRy5TrTk9Sql1HSxYMAMA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:1ADbDRoYCI8KEYDIUqsRSajRYTh3YgiwWwPgWvJOS+s=:wcMdtWhwbH+i17pMxbWC/5jbOqh7i02BoP1LoVU1BXE=;
X-ME-Sender: <xms:DYHyaiCw0aO9y6CDc8UzDUdRSbABtFzQVjRdrPWDIco1BIzzTir8_A>
    <xme:DYHyanWRkx2j0LzS-QOhYl16pJqRsjWvgKJWqQ6EYuSEm6eJhtDioekJ8Jm6hbVvu
    l8su2EBCXY6NR3lxzpynHhV55rcdVl2ioP3AdTM849fgamDfpqivOo>
X-ME-Proxy-Cause: dmFkZTFRpDl/acqBcuq+rA3OIXXypyscQmDtdFrysMzU4XceyfpueFmFsazOts/1NBkc1f
    OGyG9gHcxwDGNxXvim2PcP07s2U2eYENVBMG2dXVecQ25bJyVKqUClH2933Ul5VnKfFgEO
    q1RkUXny3zklpdHRR5D1NvPrecND846gRyQJ8v2BSrJmayvyw6kQezXzIicti4P1+CKf/+
    x6qaBIqXURgkSEmjlDI4pbsr6mn1egjTfr+qHI1vO4AJL974RFNfE9/tLJ5K/AjvIv/Oki
    PfIHEl2WUa3jgyz294TrLte7xWbVDJVr2WYrQztonsLun0W/EEMghVG1d4eGYKma8TCzYO
    CD8oYcEn+3dipe6IBii/BFayykgJclpn5gpDKwmKZErFu7SI8N/Gmei4a2tTwfXWYub3H0
    VZWe/CYHKPyLIt47WJ6dFe0pLkV+4w7OVbSmMqo+E+9VXaTqFuvAczgmXaaimIrzx66kLc
    LFqEK8ZkiBn2PWyG2Lv4rvzY4QbjLpoyrWgduUs2xHdxvLFCwsXW9jnEWrC8/qIWGskLOC
    4hxD+nvOiTUr6uMiP3awRVnSJkakYww7tFpNwp0MWrs7a0cmCJsJkdAoFAYWzErLLqyH4F
    lEh0moy/Fd9riOLe0ck1WNHkoMd0PtLZw/j0AVmg3/z8WlHaKrP1Fb0xNXTg
X-ME-Proxy: <xmx:DYHyarrtLdzRrT4_cc79rzfXc-CdV7ODsoEs6p7WUHFh3z7ACoL5KQ>
    <xmx:DYHyahGiMcX1K7TWQQPN8ohPEt4XLpVhWA6AjCWIoYKDKndmLGuIOQ>
    <xmx:DYHyartaVDtN19IsLBQl37748sVPCA_pR2QmeBvDkJGTFJI63QwLWQ>
    <xmx:DYHyajWK__WVYxSgU03woVjr668HtCl5jFOVz_N0-V8g7gKOmstA5g>
    <xmx:DoHyav62g26GPZq7dtR21-T0_6E2SrtKLKHUnJKP3TJEucialDc0LUNg>
Feedback-ID: if58e4a8f:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 942CC700065; Mon,  9 Nov 2026 21:27:25 -0500 (EST)
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
Date: Mon, 09 Nov 2026 21:27:25 -0500
From: "Alejandro Pacheco" <ale@alepacheco.dev>
To: "Richard Weinberger" <richard@nod.at>,
 "David Woodhouse" <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Message-Id: <d1220d53-17d3-4ff2-b145-09047eeb7e23@alepacheco.dev>
In-Reply-To: <e979229f-af42-42c3-987a-c2ed289d8fda@alepacheco.dev>
References: <e979229f-af42-42c3-987a-c2ed289d8fda@alepacheco.dev>
Subject: Re: [PATCH] jffs2: reject uncompressed nodes whose csize and dsize differ
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi Richard, David,

Gentle ping on this one. It still applies cleanly on top of
v7.4-rc2. Please let me know if you would like anything changed.

Thanks,
Alejandro
