Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794924817;
	b=aoeMZ/CIBkdrAkPPyLm9rZ2ZveVaetLzKyueCQGlr4K9kyJ4oHaGX2cQ278IMrxaKqVt
	 2lkA5me8zxmjR0oDbcnmUQ7xIH1nvXYHsjsz9uDESrJMKkm6ycVwm8TJTZe95j/1Dvudl
	 oW4Aojyq+Pbem3FMCtbdQA+z6INxpv4kC166kJe1S6Qh7nf1Y1zCK4HF630H3qILm6H2s
	 YNbBKx1N5hdfqfsslUfySoNVHcEctJ9BkTXCz2sY3U7JOowKY9ipDTklSEiToGUrjqzg9
	 pDLVSpcrptqznMmPAGvuzoiyfbBI10Ua19LpaY/KxLrOM0oeXHD8wq9icMyfSnQ/4Jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794924817;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:In-Reply-To:References:User-Agent:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=XnDg3LSvvLKOhODP50y+bXUFTm0xPYEfsjQv/OxLyvY=;
	b=FCxbUeeqYh49D8bllStybIKRal2t0PBWkg60LoVCaar36LBxUtX5cFKX5Z/dADts8G0a
	 kJVBJmDqqlguCwKSxW3F9EPOwdDi7An7T32QrCjJhXv32EaG2TPIFGRN/cNMHG8u8307k
	 vb0KeuMz/FrgYOR3VmGJnL0zLu/jhR1PtQ0cKaWLkJMpVXZ//xZAnMrlV2RdVF6+fhrp+
	 CM1MwzccrPO/G6zej7JJJLfzPhmM8OkkQbRrt/ih87QW4hXiygtdgyIy6uESDyFNuNhMZ
	 f3YGLtkU/aB4AWm2/hvPxF1AZO34gw1poZM1cCWMx5dcSxWC7fihJbF8eg8sAO+lVTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=T8RtQEgD;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FD68606A884
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:13:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FD68606A884
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=T8RtQEgD
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 063A41A167C;
	Tue, 17 Nov 2026 14:13:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C4FE45FC81;
	Tue, 17 Nov 2026 14:13:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C008411BC0024;
	Tue, 17 Nov 2026 15:13:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794924813; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=XnDg3LSvvLKOhODP50y+bXUFTm0xPYEfsjQv/OxLyvY=;
	b=T8RtQEgDk82tB+T2G8WcDM83qbuxQWJx50BVnv5ZQSuXl8L3T+hASktHtCiSVsWRwsRvne
	08/HM2XY+9JfRhDzrK4adoxW/gZ2cOcEg5ycMusHDq62o1vSWPPkMevMd+H6PzgV09rbqo
	Wv1vzevpnUlPkR9m8wjg6K8ac6TPgzAQrRhY+GCDAie0a03yg9L29AbsFSIj+h8yv0VtYH
	hThFiJGiXDewVXgYOPX7+SoinmumDzsWHRk8zTmP0aBNWvOjcmk5o1S25Vtj9yvRSEV3Ac
	TIkIjlLdLXWTYCwQ7gm/DZG2g9tIEspLPORS9mwLwOG8P6eo9MOlcytVEnU/kQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank.Li@oss.nxp.com
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Frank Li <Frank.Li@nxp.com>,  Alok Tiwari
 <alok.a.tiwari@oracle.com>,  Runyu Xiao <runyu.xiao@seu.edu.cn>,  Chen Ni
 <nichen@iscas.ac.cn>,  Kees Cook <kees+treewide@kernel.org>,  Hemanth
 Selam <hemanth.selam@gmail.com>,  linux-mtd@lists.infradead.org (open
 list:CADENCE NAND DRIVER),  linux-kernel@vger.kernel.org (open list),
  imx@lists.linux.dev
Subject: Re: [PATCH 1/1] mtd: nand: raw: use dmaengine accessor API functions
In-Reply-To: <20261111202502.3860647-1-Frank.Li@oss.nxp.com> (Frank Li's
	message of "Wed, 11 Nov 2026 15:24:45 -0500")
References: <20261111202502.3860647-1-Frank.Li@oss.nxp.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Tue, 17 Nov 2026 15:13:25 +0100
Message-ID: <87bj7nlf5m.fsf@bootlin.com>
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
X-Last-TLS-Session-Version: TLSv1.3

On 11/11/2026 at 15:24:45 -05, Frank.Li@oss.nxp.com wrote:

> From: Frank Li <Frank.Li@nxp.com>
>
> Use dmaengine_get_dma_device() instead of directly accessing chan->device
> and use dmaengine_prep_dma_memcpy() instead of calling the function point=
er
> directly. This follows the dmaengine API convention of using accessor
> helpers to decouple drivers from internal dmaengine structures.
>
> Affects cadence-nand-controller and fsmc_nand drivers.
>
> No functional change and prepare to move struct dma_device to private.
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

I will fix the subject when applying (nand: raw: -> rawnand:)

Thanks,
Miqu=C3=A8l
