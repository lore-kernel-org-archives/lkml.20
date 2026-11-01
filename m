Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.144
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793569658;
	b=CXCHb43N2HmPLvWPjmU1vt4vts7ASS3pBGdOyvqBWzL6J4+GBGDmTGdv95P3P+W92+xy
	 XTTn7FGqTHcF6D0hHkUKNg0zz+vb32YYwssWWzqtCPCE6JD4HqN0c4JxoWQ8TUdtp+RZW
	 ejCbEQqwXBX0nKKiCOh5M+vOOddzWAvgBxxjh/vHUA1yBfo5pLCeZ7UXDAjYG5mUENFfp
	 88FzWXcOvJBp7CQg+Irn1saQzDnnMq5zWlsela74E2Zd6KsW55PUKsK2Ad5o2KB8W+ldt
	 VfXZh7BIqCK7iIDQlsPeS43BlxyF4/NwL4wKCkjVcpyA6tBjsNxgxzHv0CKCEJ1oQ6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793569658;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=TfQ2I+R1RGUPFEWLUKI19YZg1UU3i8pVJ5KkC7O7TAI=;
	b=OnRbGSaAfgJW8sa1nONfRyrpVrvNWrHd6c51qTotql9QCGGhMjFPz7SRpopzLHK0FKAa
	 j9ZoE1srLTMFYO2RpWLaDGgKjuKHFNrw7Wr+Z9nv8q4IlOClq2lyVfA8ZUyra+G/jdPzj
	 GDG0LmxQzM3/N4mQLrVc+QUl256aLRU4mmc0a/9xcKVdaEEa+Lfgg/QBtexLZd9iacB9z
	 /M6nlhlKkVdRJJBs2ByP97xVJnBRGYolhDpOHlR6PYWxGkedfmDWMuVny895l3xR7pXu0
	 P5323yv0Zh/YDdr1LodHoS2CT4CACx7nasXuYbOoQMw/p/hCHSIVkQ+t/3TR0mAQY9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fastmail.org;
	spf=pass smtp.mailfrom=fastmail.org;
	dkim=pass header.d=fastmail.org header.i=@fastmail.org header.a=rsa-sha256 header.s=fm2 header.b="OAgnY/1L";
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=NFjlWA8Q;
	arc=none smtp.remote-ip=202.12.124.144
Received: from fout-b1-smtp.messagingengine.com (fout-b1-smtp.messagingengine.com [202.12.124.144])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0656606A326
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 21:47:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0656606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fastmail.org header.i=@fastmail.org header.a=rsa-sha256 header.s=fm2 header.b=OAgnY/1L;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=NFjlWA8Q
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.stl.internal (Postfix) with ESMTP id 34BA01D001C4
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 16:47:37 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Sun, 01 Nov 2026 16:47:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1793569656; x=
	1793656056; bh=TfQ2I+R1RGUPFEWLUKI19YZg1UU3i8pVJ5KkC7O7TAI=; b=O
	AgnY/1LXV2bgTsNbzOulc6cfzZFWwN/yAb0gpnYH/RVgsPjYNOayHJLjOGSUV923
	y/e3e2xwlTnNZW3rTYXu5F0b+UDTr+1vqY4QgGR2sMlhrliyVE6MFaXh/l69a0/H
	rK/9W5qr1SlAP1zlRINdc9v4490Pi5c+1UUhwRZQp6kVGjEg/sFImlhgbO19uHDX
	QiQCpkqdcoI5rk2+6A9w4nK+ajlOY/DVs07qB3P9+a4S/m3xfRd90zEtosTpQKAM
	8l9X7vDUEO7RLJOEbl8C3a0MlovhhLa/7HHZAKH99FNYf3zFvpEWn0NNWr/XQDGk
	KaZKUnjNuP/ZO1cyeOj0w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1793569656; x=1793656056; bh=T
	fQ2I+R1RGUPFEWLUKI19YZg1UU3i8pVJ5KkC7O7TAI=; b=NFjlWA8QRwwHP2TOp
	chRteRFIsiiRVV0GBUzNQmy9UeUzIxGJ71VOul4WSakbZlpf0/ovy4I8JuRiwYzt
	uIzwjAJuSpnT8CAP2bbCHek+VcPQfW0XhWhCLJfemzEtLrAaWw1w9OaNva3nx/lU
	sK3PzglpcksS3eOUvnOOkSSGRs5+ZnjFJHhpWZJkhXjTR2CeAKwyz6Rx8wcKz/xO
	/yQKY44DM9UzveT8Fex6dZa/qWmJmvAgiuQ7iOPW111Fm5Aopm0k6CxBhUNtFWu3
	/NMQ9r/U1/X7oly7EEne/1BHEgymxS/wabdcIlk1GyvMb12bTlNQGFLS6SaQQrqj
	UivfA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=fastmail.org a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793569656; d=fastmail.org;
	mf=PGljYkBmYXN0bWFpbC5vcmc+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:C2hIlo/akGwwJfyY3Wn2A253cin535mTWsDW46YeX7Itp51
	Y5BbxWr1LEGe+kQCS0xfMVsnlGtPApuzELfwPhTIr9Nwaqcnzz9CnPRkuGl2/6F8
	YuWkkYRcKZ4AW5BxIGUJjEcZs3JXUzPF2cBaCCi3+WqNCvLwc381rxQbuiTTv3OC
	xNjRqrkmRlcij3pEsSoRLW0CipthFTAFIWV5YPwQukelVO05uyuHi6Euo6LdmDsw
	UA+bHmtunkOcvrC+R0za52TXsu+q44t05Y2y0lDGDmulXWPO+m6HwsWxZy4i/y0F
	f435Jh13tqkq1vGaC9c2yGVeLPZHiqUmb2bzYsg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:p/o4aGb9mNGCizzP1jh+fyrKnTQL0euSFdWfqc2dNEo=:TfQ2I+R1RGUPFEWLUKI19YZg1UU3i8pVJ5KkC7O7TAI=;
X-ME-Sender: <xms:eLPnam4QIAbRp4ohE-gwHvTeVsaHMfihbfDs5rvsGOs5imhQjJcLxA>
    <xme:eLPnapNCv9cUEU8-Tj9Pj4lu70itkDCFt6HDM8qTpLmqMpCOJNqDRJAZqbtm5qsj8
    DgRCSsLHMwoVaR6tadB7Pshc0ubrxGWa6X1GkyN8XAGAaz4_TY1zg>
X-ME-Received: <xmr:eLPnass5OfJo43pgatwwnrwxXL13p4kfyoGz70_-1yrAMPxh-ZJSXuwC0FUwy4G8>
X-ME-Proxy-Cause: dmFkZTGn2xXB2HLZ4YG+2m4cCu3T+TF8EMbT2RfZDXxvr8XeapbMGc2tt2OmjZApSH7Bs5
    6STFEuwR4yMzUkRBosK2ckc1pIkAVcyDj01QKJ8lHtpexEdF+jfqTD61/Dm3HQFJGPwRd+
    2BBqeeFvlhNGTAAZsK24h+tqccnSZHyidJb+fOoCkpMcZc//joLmaOK2V8Yis+pllG9TtR
    fuOCK/BrhK+CtNBdut/bqICydSt6NWd38Tr0W0Fq6EAawrB66Nw6MMeUnEBsSK0z/NVlDb
    ieZodpSyaYccqAUNi0tKlPo4aZJ9aB/EVoOSzRW+ztLK9HsCZpxEbRj6bbSMYTNq2OhmNW
    2J3RapX7ljOcb4TpqsegIrHbflCvSsP6ffJh9ErghEcSB1A0Og2H+3Nez7QPjqEncx0NIC
    /yqadKg6YzFelYwPT5HBDsYBulBjPSFEbr5e8GdEJNM6g+FexhEFI+x7NojRFXyed15c94
    OTmdwRF6JF3ew/HO34j194xMeNEINc6qpQcS6UJqcctJ2/WmVjhuNnytCJ0pkd6Uos6RvD
    EVUZ0vMjOxFzWRc7JQGTGUns69IhE1t+nhdtgjYNp6MQbStyTfdV+x73u1vWpkulhEHs/0
    ycg2qNlPjbWhfwZlzBePSriuaCwwK5fwCfm7J5OJd5nDkIdAOq51wbRdpuEA
X-ME-Proxy: <xmx:eLPnakYcnmz5_M9Q0HCYEd4IQv5CUkYLvGy3N4rfjTe_h6iOro2u2A>
    <xmx:eLPnamxkSR-d3qBA_M42aMaoIsf_wnHh9H8ai7cSpVgsX7RxlabYTQ>
    <xmx:eLPnakjO1nzBd9FKpBE-B6PtBs6e8Z12Zxkp1swB_XRaAK7TnN8KiQ>
    <xmx:eLPnaqlgbqpusqygZAidgkLTYteHgveJhkjy4-oooaO4rpkjFGqWUA>
    <xmx:eLPnanUHYjEmpDekA7MhOdZ6XT0JA3ztCCq1ld9hQLA5Hh4Ecp8DTQFF>
Feedback-ID: ib53e4b78:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 1 Nov 2026 16:47:35 -0500 (EST)
From: Ian Bridges <icb@fastmail.org>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Tom Talpey <tom@talpey.com>,
	ChenXiaoSong <chenxiaosong@chenxiaosong.com>,
	linux-cifs@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] ksmbd: fix DACL evaluation for denies and guest sessions
Date: Sun,  1 Nov 2026 15:47:19 -0600
Message-ID: <20261101214719.732224-1-icb@fastmail.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <CAKYAXd_S5aDNPXTjmkfHG55SvzgCGuYn0ZGfgOesoSB0moMHRA@mail.gmail.com>
References: <20261030020523.302085-1-icb@fastmail.org> <CAKYAXd_S5aDNPXTjmkfHG55SvzgCGuYn0ZGfgOesoSB0moMHRA@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Namjae,

Please drop this series.

Your point on 2/2 was right. Working through it and Sashiko's comments
showed that the series depends on other issues that need to be fixed
first.

I will send patches for those issues, then resend fixes for these bugs
once those patches are merged.

Thanks for the review,
Ian
