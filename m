Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793680184;
	b=wXbcvDLXrzP9nxbOPkezrmQWiSHCBmCqrEY8h71ZI9lp46/kr1zT5MtlW5riQ0ifx+1u
	 O2zO5L1n/IAEqJKvzScsp341SHokK5rUv9UU55DOtK+Pl/53276rwKqqhUNYU6AhtuwCt
	 Fgqzcrbwc4zKIl0wU3VtEZbX7jAMKoJDPSh0vU+UbYT8FfmZS1lkeJyXDMlgzSzz5ngQo
	 hJpnurlle5WKQ2CqfhV6FtI/ikoo7cwOWLMVxMqgN/g5RTmqoU+2ppyed44KG6ZOcx7FY
	 1FAxeknn7tRByZLvkD7r0EQkGamwtgYkIsbRgHLEHH1nTpxU5VukGnakROoK8x95/Ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793680184;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=5fa84Lc84hi7l987KSSRjen6bFmSqsIbaY7MG3bop8Q=;
	b=ilZNrerYVAOmme/cw8ecRhv8ibaGPFNoofm0Jgddd3PiIN9qEpuGePefJijV9SskrmIC
	 vwzsF2kH7jJTemMkiM9M7SxIfd0ab+3ENhDsKb9Chp8boziCxH9/0TiIbionTuA4g/qMg
	 bqyaplE44PCIswpTV34JekyFLWsKT0SunHuOz6Ti2JYq7t/lyz76uWuQAo3TjgosvXxyA
	 SBWHw3dP8uK0ZvQXy0kdPBxIEWP5mPeEUxEYDXwdRIRLUueDSM4/ASnHCw5fbNHzybQLK
	 b04GBDrhpH58Kfpl8HXoE/uCI8A4H1Sz9HomQb2Yav4/nKZBasUb67DzZyiGUSMl+xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sakamocchi.jp;
	spf=pass smtp.mailfrom=sakamocchi.jp;
	dkim=pass header.d=sakamocchi.jp header.i=@sakamocchi.jp header.a=rsa-sha256 header.s=fm2 header.b="mo/ilsrt";
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=DytbgnM5;
	arc=none smtp.remote-ip=202.12.124.151
Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C85606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 04:29:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60C85606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.a=rsa-sha256 header.s=fm2 header.b=mo/ilsrt;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=DytbgnM5
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 9920B1D00134
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 23:29:42 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Mon, 02 Nov 2026 23:29:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1793680182; x=
	1793766582; bh=5fa84Lc84hi7l987KSSRjen6bFmSqsIbaY7MG3bop8Q=; b=m
	o/ilsrt6VItJpEdBIdeVl/zJVOft/QwDidm5v9KGTamfSD/MDA4KYC3Cu9IcasZF
	ulYy6jZ7JxEMbXLpAI1e+RtBVu7EZQayOaf7HPRYqNmW6GbxOEGaByuW73SeUnLk
	FO3Oy4+Z3b/cNGVSliqlu1LVpk5Bhpy5hdc9J3JrNTZ+Bl5wGnBJw4IoRdbWl7pQ
	Tq946lcvY7ItdSInGSpfOMtMO98wikOCex5Y8jSmbKiM5o9dnzA8hEEAeHNAxn3p
	xzVWxI8Fz5yQ21zi9H6EjZJqJmmGFCCXBghH8IskwNYwxBF1kcLSso2chpmdOEac
	XISHqOxEfCG1yhYFlH5lA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1793680182; x=1793766582; bh=5
	fa84Lc84hi7l987KSSRjen6bFmSqsIbaY7MG3bop8Q=; b=DytbgnM5DviNZd/pm
	njien0Fjeh5HdmMu52dlt0RcK3s5alz41wUxzlC48COVgkr8V+Y5S0Kvk5ZXVdUr
	S8evlbQyBz/j6U9/EFkJQvbJ21z8FWN0mDyx7wVaPm2zK2YiKxYutaAHDdLFOLYa
	0DHGBNL9zIlDn6efbPXSIQSjXb/fs/WKdQfAcUuIwSqDHDwmf7gd+DufauCkec/U
	f9H/7qifKvFcl0UWeYYio0qo/6S5nzF8xOSnWJTb77dhW/I8wExVzVxtN056sKC2
	aKy6RzEN/vR4UKRw2MH7sw1TemzI3G6vRXTFEdOD5QZLGo+cB/mGhaknbkOWACiE
	5IyKw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=sakamocchi.jp a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793680182; d=sakamocchi.jp;
	mf=PG8tdGFrYXNoaUBzYWthbW9jY2hpLmpwPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:H62ejJ0+nhDl1XiCSgXwyBTdJpIOeoU/DSBYGwQo/XPO0rX
	EaE8fay2LjOag/U1quQH4CE9/hVOSHsbGByB6KnbWMkrsQMeyEas3Jju5Z0tkpgN
	bAi0KqJVkAEOoCFH2QORWg2azl3yyL69dE81oc/SCXx6/rsWxIiwB1kb6jchuByE
	qtRp3b0vHLgfblKFVlZxhUJ2xXLiDdldBQSHBS3cIdHSlj69r2nVCP8/sCnXnflV
	nG0t4vW5m9ebINjdEBABfT5NHewxmNF/mLZLX18GbkOV6kfayXor3IwGvj/1YcwW
	s7+/6JhbYA9KFdZdMs+Da+wnr3RlNzAV0ry7rPQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:hNXL1z+AN7j81giZNeaxhsLq+wbyciwpc+xW757PLdA=:ACHTdDVED2Y5ji5uwMLfpTGBduI/RdYFg/UHWDua4sI=;
X-ME-Sender: <xms:NmPpaq5B-Z13nTpM82MNL5O1uohjqewWgrxYcXzQFLAaIcrTNjZZfw>
    <xme:NmPpah2UZczt-UdFakkuBVSn4ew6X3QnrS0-hv2kHkQr5Me1Dx5fGiv7X2XLMRa6R
    OBXvtCbLc_0W4cXhlaiY2cZ8e1jJ8TTcbMIkOmVqmPDD8cY604VwET1>
X-ME-Received: <xmr:NmPpahCc1OTNjNzZCjCUJNd4yUEoafEVNWnzzeaGq4ZhE-cn9NCIPm4DGK182kjIIDCZFmx5j5pd7_R_U-SDHpamhpHJbb6PHpeemX7Ra_79>
X-ME-Proxy-Cause: dmFkZTFW70MjVLWzZbbHLAwQl54RRy5yYW8ytyMsOVRlHTtvsFWtLwSy+C0GWMBc5uv7YC
    8nLvYKRLza+rEF+zC3+mV+Al1JHFpkZGypcOTMhRfR6RaWAjfNSujLusOZKhNhIfUsQ9TD
    JMBnBkXox2mIOygxg+vtmKWDEDcI9ck5vtxF7XLwSRslXyYBvd9YLOwEBBla1DF05GnG15
    Qh/Ycu7Nru32uqWqK3c8tiOrG/cjV9s3FR8k7y6YOQYM3dmo919DKaBdHOLNVxd5F1lFBw
    3VzSz85wcU8utGKIcvFD7/o5A0a7hcXWpTlj4cQdSYozydzGjhJirvXAQ9imqZRtSaCOpw
    FGxIewIuLeMnziOaVdb2JxokkiGUfkG6y0/qyPXUy+qLalqu3mXFsJy9/WOdvOZcI+x0IU
    HO1GBsrXNgKhtq3h052ONuvBCGQTZ9v9PlZi7sdPDC6r9cNTHImyXIq70hxVOvzxSCmUD/
    MNJLxHscdBPMROgpemFBsfAu1g5v3PXz+LWwugodkP/zE1TsvmVFBWb8uNCf/2j/E6uagX
    1Ty0zIdGPB0PfUPrHJv4x3Bqv0rmxn1cHOLSTfTB+hKk8DvtA2YOAvQzZ33Gfkm4iRvmKz
    t6PtYI8XYakelevTrZiUoPLoTrOLCNtT5tU11XWYTZUW/NrSl1zjAJNS8cOg
X-ME-Proxy: <xmx:NmPpaj2-FM9Hb8b1rO4Q-srrSkgvx8ycUTDC3C_GchSHFG2Ke6jzUg>
    <xmx:NmPparuAkPDuv1TFB9qqs_xFaxdUcv-_dZ91xkSqoQL-djKqBBDDQQ>
    <xmx:NmPpaj7JZMm3Yt1mAsmgpLlByozM_fQ1ZwpGzLjZ7RH14AaDTLFriA>
    <xmx:NmPpasJrXcolldYNclHQjBf3RrFDIdQ30c8XDJ_u5ncNDtTYafAVTw>
    <xmx:NmPpavanhUS9GJ14Ls8U590raO6lyZ0DeHEtjwduCeYs8vt5rinwVkLM>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 2 Nov 2026 23:29:41 -0500 (EST)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/8] firewire: cdev: add annotations for compiler-based context analysis
Date: Tue,  3 Nov 2026 13:29:31 +0900
Message-ID: <20261103042939.1231773-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261102041913.1187814-1-o-takashi@sakamocchi.jp>
References: <20261102041913.1187814-1-o-takashi@sakamocchi.jp>
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

Hi,

This series prepares the cdev layer for compiler-based context analysis
by adding the necessary annotations.

It also adds a __counted_by() annotation as well as cleanup functions to
simplify resource allocation and error handling.

Changes from v1:
* Drop the changes to iso_context_mutex for now and revisit them in future
  work


Thanks

Takashi Sakamoto (8):
  firewire: core: add context analysis annotations for address handler
  firewire: cdev: add context analysis annotations for phy_receiver_list
  firewire: cdev: annotate data length in inbound_transaction_resource
  firewire: core: add context analysis annotation to
    queue_bus_reset_event()
  firewire: cdev: add context analysis annotations for client shutdown
    flag and event list
  firewire: cdev: use cleanup function for outbound transaction event
    allocation
  firewire: cdev: use cleanup function for descriptor_resource
    allocation
  firewire: cdev: enable compiler-based context analysis

 drivers/firewire/Makefile           |  1 +
 drivers/firewire/core-cdev.c        | 63 +++++++++++++----------------
 drivers/firewire/core-transaction.c | 12 ++++--
 3 files changed, 36 insertions(+), 40 deletions(-)


base-commit: 3110316fb834e17670ba2690ee75fb05d92b3ef1
-- 
2.53.0

