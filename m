Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.157
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792460830;
	b=ZEv00MCuY2LWTGPzy1Ve84FJbo7OPZFtWzZwCkhQEDUh07RjoBANJI6Zm6ALl3pYDLC7
	 drND85Pr6p1tqt4wW/1mh3DYYcDSIumNwTHSeeulywFNKI22M4XKqmYmOZsHBg/1p5McE
	 tBSZaeNMsOR54srKQkHTb15J6QHY32Xce3t1tlz2Fkdmr0s4I5bTzpPdjY0ZhML95erKO
	 uKm9Kxrwwva0XbklPfuFG9r2Ld+DEqEbioJj0IXw8pKLHrEF/FYYWE/NAlmDsd1j/RafR
	 M6uvLpcfyaX9us+jNUM0kOFBhKoI3xbs872pPjpohjPnZqQCyv6DLTqH0EeMYuyqn1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792460830;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:From:To:Cc:Subject:Message-ID:Mail-Followup-To:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=a//JYMSgX5gdFOPNNFdEi0q04WdGyS8VWuNy9LhISKo=;
	b=XgcHBXOZQHQqSaaGhchX0jnAhMU6hkAWv7ZkbvcxjETuDIWK7ELzpdliNiuayOqPDyl3
	 DO9uPtOykiur9NRDsfDdgS+YL0AH39uBjNFnNJQul9Jy4fkUM9Jd3J079YdcWzsKEXXcA
	 DdEmigkZqmqFr2L95R1Bkh3k30RGy+0qWoOa1Im1BC/hW6Ij4TX5eqJMFR9nb9Mc7AO62
	 /FGw2koHXqYbqO6WdyQj0RQ2xoZ9kVBLHI0SONQDob2Rg36GXbkGNteg56jxPTrCqB6Dc
	 RDQUwwLS0MR4jsgS4OyuddsobjnBaTQ5IX+s1QJSetb9hVgRkrh4rhwInpmVcHH7C3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sakamocchi.jp;
	spf=pass smtp.mailfrom=sakamocchi.jp;
	dkim=pass header.d=sakamocchi.jp header.i=@sakamocchi.jp header.a=rsa-sha256 header.s=fm2 header.b=IlX+lEGW;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=ejA8S4cH;
	arc=none smtp.remote-ip=103.168.172.157
Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D849A606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 01:47:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D849A606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.a=rsa-sha256 header.s=fm2 header.b=IlX+lEGW;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=ejA8S4cH
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 262BC14000B8
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 21:47:09 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Mon, 19 Oct 2026 21:47:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1792460829; x=
	1792547229; bh=a//JYMSgX5gdFOPNNFdEi0q04WdGyS8VWuNy9LhISKo=; b=I
	lX+lEGWinhqAyAoGeeAsmYDQb03KAcfgRXrCmDADYhjUAXpNzO/s1O25CKli7gK2
	qNbR2gXkZzDglAmcaMbHwbEvYTtgFBFgtTjomHuWZHoZTLMWetxnv0Hg2VfgV9NZ
	4TQoG+mdE8OiFkz0s97HjYkhA7M0RZ7IDLG/wkHZWHQuq1K9Hq6G+V5IVSJEGWLn
	yIM8OKo+QZPE0KiGXrmxLLDi/JxzU27MkViNw8dllCxy+l5wnqLld8282b8MRlzN
	wl58l32fXot5QfjZ5/s5p81B/ogo02DTgs1nS56Fp0uX0APHpmDnrb0JcFGpATZP
	YHTaPpJusawwH7X+eqfkQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1792460829; x=1792547229; bh=a//JYMSgX5gdFOPNNFdEi0q04WdGyS8VWuN
	y9LhISKo=; b=ejA8S4cHC9uoK/6DNA8FDUK2kja5db2GcjkmMTamtPytLZt1AYZ
	JM2ODx2X1dBdGzFHFb0RY/JNCc2cO15jgDE8hOURiZkJO1Bc67TRSrY1ZYOtoA1M
	cD8nmzqsuzg086/XIlnsnmn+NT+opEcc6DkFj3xzL0+YCu8/aOplUn7XoIpD4mPV
	S2AMuemuawIw/jv+iNzhzFXJBTDvHBEkXNF4LzjJfYNJ2N45ei7+6k1vBb6KpQrB
	56EbTgyAPYtsdT+OyV0Fxtu3vOlrlPomfGyB7hB8jEiEGQOdlDTWrzrPcrYePTQj
	OSwWtGPqf+YFff2sQKV1ClfsMgItA6BVWTw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=sign d=sakamocchi.jp a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792460829; d=sakamocchi.jp;
	mf=PG8tdGFrYXNoaUBzYWthbW9jY2hpLmpwPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:E4ZlGpAGhjF+M3BKUEs5BHG+YVLwmZq9Weho6Cht7BxorBr
	wvgcLLgdi2INmH7Pb66ADxiUYHoy1LPUuexmVrOjoczlaffMIJOsM8kwUe6VAmHq
	ZauwiwMpO5uaR5oIx0eGjElas1g65loCRe0EbGwJKqL3ghdMhzAtgCHu0BSUGPzJ
	0AtBeGKKPi1gxPHNYmHNI63UJJG9kxxsxXErutdfqGwzHLLDXc1ek8sNn5jfX5fm
	ezOJVCn4oKftkzAA1+finp675PmPU8M2zpFgiGU1Z4TzQHtxyjsS7zjDZWSnx4ue
	IJgZ7vC19ncgftlH/y4+FvDALm8KEwU7ejJem4Q==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=mi-m=1; hc=13;
	hn=cc,content-disposition,content-type,date,feedback-id,from,
	in-reply-to,mail-followup-to,message-id,mime-version,references,
	subject,to;
Message-Instance: m=1; h=sha256:XaPx95b//hRmuHra4vlwjcbUFt0iZBFNNQNYknJbFv4=:rEcGG14CQUuY2zsdQZdDRQ4flS4TfJnFavnPPClRYD0=;
X-ME-Sender: <xms:HcjWarnhTebGBUjt_cJ3FteMwRpiJR4y3wx4VE392hTwB_Z4U4ysjw>
    <xme:HcjWasyaW7RSeGEP73r35NCwQ2zK9NwmGsFEMBEaJ4Swufivokb1JqWQmJaTnnrcq
    F4bv8ryNMnC785KhTc9rM2FVNqKC-UqMiXaeILAYF1Z3RfmFeLUjLfR>
X-ME-Received: <xmr:HcjWapOu6p2lYrHM09PzqJ6UJPuejhHr5Qmp6Po4-K-5sI0wEZGzQLxT9uoEgyQ6k9MfIjMlS415EjD7eY9HnZtDx6xP>
X-ME-Proxy-Cause: dmFkZTGy7mA9XdN0aisaZsUgDFVqX9lSNO7kTyoiSJfZx8dJogQVFJ8eeVjBsH3J8ov2O4
    FxlHy1TxO5hwZbjp1VAFI/7TT6ZrnmKux5ZNeE4CaXyS5CLg81uRIHT1/8Hdwicr4I09fZ
    ZqxARVbDEc/0lrzfGF6tDZSOPTuOJg0CUexoX/9c/wFOEBZOq8DZBPSWfrbigSK9HPdfKA
    nqjB6zcM83uizQcqZerTKRezFZOdi3U5+8y8uiNPkwVw/rA5AOHqNvb+cdA+BQRsW3Exmw
    Zxl0qry508ILmX0Llh1fF22bzezayPLLfmTgzB1A0ggGV1bHIXNduxBKydG2P0XMsr3oU1
    DGarwj6Qp4Tt3vVnZL2+NGjd/BmXBAuueMeGfDhfTE1thgCM8/UjqOSBmOTItSZ8/cEpj2
    S25xd7sUokGDhNuH4asOC7amjLTqLPKnqtSt+quOxlt7+zbcPionWba5/xCk6g6ac9yA/h
    OTTUbJksIdDn1+v+T246ueiAhn99iDMb7FyWVwl3hIUwmDGtZ5mpeeXoVwosaTsPmJMRzS
    va+M99BIYTzymzX17DRWFLQfSXgUh5AsXP51o9FZgOkSscceT3IE4A/O4kI/HhZ/kFH8OB
    J1IrHTfrf27pKsagcCG6oW2kt0+DeAuyLKVvyZfy6rA/GbONnl3PaaaqZT1A
X-ME-Proxy: <xmx:HcjWagRS4BwqjWi2IJn59liCwLqEaWj_tcOSAHLy7YjXRtqFaZKAqg>
    <xmx:HcjWanY2d8T6V6sCLX_ts-6MLr1FZq3_A8k7R53X-yw4ysTH_M44tg>
    <xmx:HcjWat0rSvxjlxqUnKCJohXvu8m82tPoqPOgOTh9tyGGEG92BIerGQ>
    <xmx:HcjWanVDN1lVaLEsZbirYtbZKn3fmpdyyoYumTbZulhoH1olKC4-Pw>
    <xmx:HcjWat7k07GBBoNkZA2dfQgihxZVRA1R8zNsWWxm3QkYTnqSfnw4tgr_>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 19 Oct 2026 21:47:08 -0400 (EDT)
Date: Tue, 20 Oct 2026 10:47:06 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] firewire: core: misc fixes
Message-ID: <20261020014706.GA339928@sakamocchi.jp>
Mail-Followup-To: linux1394-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org
References: <20261019122555.328060-1-o-takashi@sakamocchi.jp>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261019122555.328060-1-o-takashi@sakamocchi.jp>

On Mon, Oct 19, 2026 at 09:25:53PM +0900, Takashi Sakamoto wrote:
> Hi,
> 
> This series fixes a few bugs introduced by recent changes.
> 
> Takashi Sakamoto (2):
>   firewire: core: adjust context_unsafe() usage for lockdep checks
>   firewire: core: replace drain_workqueue() with flush_workqueue()
> 
>  drivers/firewire/core-card.c        | 4 ++--
>  drivers/firewire/core-transaction.c | 3 ++-
>  2 files changed, 4 insertions(+), 3 deletions(-)

Applied to for-next branch.


Regards

Takashi Sakamoto
