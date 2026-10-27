Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.159
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793116482;
	b=iEVf+sVySiSwC+zM4bvKfXa9SmATu8gA/tYhT7Cm9dHauH90KkBlzk6xSO1NC2aqJzVh
	 0lRRS0chX3l7BdBprkYsIZXd3dw8JhjvIPLhkaBWD/DBeVwNxGyYJuDjFLjl/gHk7iiPk
	 9A+xNxpPDLA3kxemdBrjsqPCziDtLza7cLiYDx681JVEpID58sSc8s0YRVoRuZLee6bIj
	 4csFsh4qW3/B1WRkbJvRmMe/cwforjDg5tCxadPCkHL+dCEISzHgvKbpEXezuRrcKb3cd
	 eBw2w7Xm9RWT6CBiWXOuCYNhxEg2qg2wm3O4QPGASwHOUzBjMdtbWEeHhLuinrWJJdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793116482;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=zc2Y0aB+Bo5/T9cHNhSV0KeCxq1DKGPEpfI2FnZKVqU=;
	b=Y1ikB7zwfRl3CybSfHtrGLyhWEeLPjq+KU5IRUjRo519Gehjxs/w7rWJcJQzVcTQwd7r
	 n0FzT/SvzYE5eI6lnxfE7B+L4vNJPQmKDUnd9dlp28NmExtDqgv3KdSfJCMqB+Xmx8Cyd
	 PatRZIfRVPy1xCxhdVtY0wtQ5J6Hqd4562p4HRZ5nlBUvodLCxJx0Onbfeb8EfVqq9U2F
	 jKt/VcPYAkre4+q15/ITdB/p6NHP4daRMBPcTp+59z6801bgpj/h+zwYwUv0Hsu4E1SJ8
	 DbzdlGqi0/sc1oJKXj5EfQu257hcgJkrqeXgbIzQLu17A0Z5ZCqvf7vFEmLeuvEJnhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=dHD3+mxH;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=PZl2WY4q;
	arc=none smtp.remote-ip=202.12.124.159
Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F07B606A331
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:54:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F07B606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=dHD3+mxH;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=PZl2WY4q
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 13B7B7A0193
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:54:40 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Tue, 27 Oct 2026 11:54:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1793116471;
	 x=1793202871; bh=zc2Y0aB+Bo5/T9cHNhSV0KeCxq1DKGPEpfI2FnZKVqU=; b=
	dHD3+mxHPAiH2NrGJ1l24aUW5rBT5AbeiLU4fXDZeZn1DyMrg3uSfIRjA7wk/Kbn
	LfAMSKMNohMwyds0v0tiRRMd8rlTWiRDuiCgSogczys/yi6tJQKmT3NEdaHYwF6c
	c6pxa3Qcf2qEG4h+8mVJCgfZnr6dAu3gQxNADpI70BxsS/3wq9MVTEUh+cfrpblF
	fA6ko1SqdDGZVzJ1KCGa3mOi6MbM8vs+bBkQwxlXYZPSjvnhKCYdCo1kBMxysOBl
	oEjxbjjnh3Hb/U6s2NMj3jBUivQI6dT7bVY8mVez4sCv84B2ajUGpO7UdcyoLUo9
	xz/fA5SnbPPUQJ/r79Ur4Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1793116471; x=
	1793202871; bh=zc2Y0aB+Bo5/T9cHNhSV0KeCxq1DKGPEpfI2FnZKVqU=; b=P
	Zl2WY4qdul5MbY/MisBNFOfu3VMz/mjp3CXNnvCEjuWFgEgZeL5Q0iPvW/Q0rL6Q
	afUh8qbq7cWqnM6eKLcQj3TNfMW8ycb3QwPmdeEXpYEDX8iF0R0fKu0yufP6aEZq
	wSQGsXmf793Ipv/23SbrStnjGosuVFXJ2Vkm+d3DzFjj9zbbBef5j8blC7yMrGVM
	sBr6FxqOkilPQ77JbGOkr67+6ewD0G8cfeIHv8lmwJoGkzbXWk1Y2EGUIRNAw2EC
	cWtpCIF0wCfBcDJWK50+20iZR7k9nKupY8yV4LH6kUI4QlVdTxFR5fcSwjrYWX1s
	izf8aH59T4FRhiOmrg7zQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793116471; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:OFikqZLuSQVzM6dUDQqAt3zAeInHs4xVwMBi+xCERxCtZ0t
	7CqEmxbcYjbCVmiVPPZ5H2oTnwBaTq2uEfa0AeN1P8RxazaagdvfJCUQzy5JF0FP
	yiLBiEVWnsMuFU1bNHhRL0t/52swZAPMFNjVpsiDWq+9MYaXydpexyBqLXBO8Syb
	FPU+g6rO3Dy//NFpE/OMlT24pLL13Wq+QXiEIQJBAQQ7D9D2AeF3xAOeP5mfQStJ
	8dOYssBX5tY3hZM1MZ8DzDF1IjN1I9AxwXYZJRwanKMs/C5Jcc4zAcV4hP/8TayV
	mNmNfNZIa44nn0rM+DtV1gA+t+XbC7l7aiLDOtg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:AgM4FqiH11BV9fQVUL9u3/eO+kN98/FniGgujr6RY2E=:f47dZaDggYMdFPbuQgE+SBbi6CmcsJqnv88mG+bUX5c=;
X-ME-Sender: <xms:MMngag_Ei5n6TwahEowzN6PDZ_HqnwqoG0VwvUOL7lDkFP2BIRGIMg>
    <xme:MMngajjICo4Sajzls514FG684I7gft-Xdq1lo6n_gCrJNywKYzDBvWiAHGL8_QIoK
    diyLiU0rKFIWyKvNiIs81OgKcNAPqpwiOMWHFZRR2WHIA5uJDcD2-fW>
X-ME-Proxy-Cause: dmFkZTF76KCNUTCOmAW/xHffWwQ0Ytqe9sOua9J0OVKp0CRZBwnZeqyGeHF8d7ILayayFe
    s3xj1eXI6jlIvCs30e+tKKvgs61QuX/JKrfFbPKt6XDozyiFgkz38/P38Rg2fZ64HFIat1
    cLlDDY/0+u9E6cf+j9R1QG9A6zfvvgT/StzBp8266YJ3eodYMW+w9nKnaD3leriCAuF0vg
    FwspQnczEk24L6FYxVZgHOQswpBtyQpLIeaF7mM0Ol7i4HqGzSgHcFKWLF60ZGQXIAWPvQ
    I0zgJ+c2sXZ2KNIdysh9LEJp8L83DBI9ctG8moKjLbaJd3b/4wLmT8voNF5imKxEHxJ+eJ
    awGr2pyNx80U7VPgr2TiscyO8hB+sK7oRYnjlJCZyJTeEvU2z2e5QObmTonXBBA8qlK6PP
    GxHxpIF39ox9vQjAotjQRg6U/XNRieZcgQYTx29uFZh2jpd++QqeW78Zd06GUOQkvhj3CH
    8N2V/toLcxQG9RAuJ7L495dls7p7a+ejU/ykaGyMbWLWrO0VDq02iE8fwjlRNEMidC6LcS
    2KRiKHD+wtSQH9NWxE7dIjFWYrLb87r/kiE8f2BJuzJSeEg2pdIIiwcBAfbHZO3nbv040I
    NOkVmgwHb+3E2b/9Cf2l0ffX+qjBNWFr1rwT8LWOgyFechZ11hKOXN6CThLQ
X-ME-Proxy: <xmx:M8ngarjWJBpZXTaIkT0SmHZYVCTShQRmf5dLrYXl0Ilu5VpeCAasgA>
    <xmx:M8ngatkb7G8jLXaaT6SO9Vt1FxdM6did3zgu9aH0OMFhW6_4mKiOmw>
    <xmx:M8ngakpZ6rY3m5-yIMjgYDiJjZOHItpLLh95XOcS9l_UdT392h9F-g>
    <xmx:M8ngapK-vsnW_r1Q3TEOvM85zcHpWTT6J4ytXs_Aqlv9aM4UXxSOIg>
    <xmx:N8ngagU7_QKwC3gX_DrQxWK1K3jVpZTn8M5CloNgRFo5i3I6sKYlbCNy>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 9283C32A0093; Tue, 27 Oct 2026 11:54:24 -0400 (EDT)
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
X-ThreadId: AT4aMw9TC0YB
Date: Tue, 27 Oct 2026 16:54:03 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Arnd Bergmann" <arnd@kernel.org>, "Sunil Goutham" <sgoutham@marvell.com>,
 "Ratheesh Kannoth" <rkannoth@marvell.com>,
 "Geetha sowjanya" <gakula@marvell.com>,
 "Subbaraya Sundeep Bhatta" <sbhatta@marvell.com>,
 "Andrew Lunn" <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>,
 "Eric Dumazet" <edumazet@kernel.org>, "Jakub Kicinski" <kuba@kernel.org>,
 "Paolo Abeni" <pabeni@redhat.com>
Cc: "Suman Ghosh" <sumang@marvell.com>,
 "Nitin Shetty J" <nshettyj@marvell.com>, hariprasad <hkelam@marvell.com>,
 "Jiangshan Yi" <yijiangshan@kylinos.cn>, Netdev <netdev@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Message-Id: <cfd64161-a4e7-429f-b9dd-09b27e22deda@app.fastmail.com>
In-Reply-To: <20261027151737.386155-1-arnd@kernel.org>
References: <20261027151737.386155-1-arnd@kernel.org>
Subject: Re: [PATCH] net: octeontx2: fix building without DEBUGFS
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Oct 27, 2026, at 16:17, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> This error came up on my randconfig tests this week:
>
> drivers/net/ethernet/marvell/octeontx2/af/cn20k/debugfs.c: In function 
> 'npc_cn20k_debugfs_init':
> drivers/net/ethernet/marvell/octeontx2/af/cn20k/debugfs.c:392:55: 
> error: 'struct rvu' has no member named 'rvu_dbg'; did you mean 
> 'rvu_dl'?
>   392 |         debugfs_create_file("mcam_layout", 0444, 
> rvu->rvu_dbg.npc,
>

Please ignore this patch, it was not the correct version. I'll send v2.

      Arnd
