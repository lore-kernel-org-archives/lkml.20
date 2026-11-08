Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.152
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794141803;
	b=4GhwcWJfIK7z823On24yj5gMe+8g7794jaJPEEp8N4Gb4Cl4YSZCv3S5EBUpUcep7d3e
	 b3/on2iS0BClw6AejoPc7JW7OdgngY+Cj6IaEimLb2sDzpBeSyM2fgoZHpZsqAWeGBl+W
	 1vFnhsm62GaZEpjFUCffm2SOPaD5pwFEoOe9y48Am9QoSoX9P7BBnx7sEaFmRDlnbQjwH
	 k9eIO9D+aZLW1MftkZdLC1TWvGofK8mW/uVFnr78ZFeSSUSIVjf0ViV8rgumIZAatG+B3
	 jylrzDzwbx75N6+pCw/NeUFPqQ8CAaaOLWoXBJxN3iq6Jehh0Iknog5pNy2Q5zJMYxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794141803;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=ELV4WaZPKEW6RedY+bisgqITnReELZDv8Lzb+X2pXls=;
	b=rTMBNAZAesCItOxTJ1ecjGB96OdXgs4lFDFhRgN+y332HH+l9i55Cki6pHSIy08cSlxB
	 wYwhOYFmU/YUB+fdVuFVKkMra8KIXutybBJ8vDmXXjeJ8XXPxkZFl5VphSrB5MxtoaOBv
	 f10vUo/N9rdGlxqg4Jxj9sdTp3iKKsTU15JSqWyY+z+YPDzg4O2slH7VNA5jBszNvU+NI
	 0eJ+CYzUzllW+pSr/EURqV4TGjD7EuPDh8tP5N3UYHKIY6YpxAaNP2AfxW+0t42UUmF8w
	 bM8hKkytsjbjROVftIVrubCh0/nazNn+0wwdAzShHZtHQQfiU0j738Md5UwBO+LeSMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jannau.net;
	spf=pass smtp.mailfrom=jannau.net;
	dkim=pass header.d=jannau.net header.i=@jannau.net header.a=rsa-sha256 header.s=fm1 header.b=MTPR3LVI;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Ypyi3rG0;
	arc=none smtp.remote-ip=103.168.172.152
Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57756606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 12:43:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57756606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jannau.net header.i=@jannau.net header.a=rsa-sha256 header.s=fm1 header.b=MTPR3LVI;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Ypyi3rG0
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 726881400098
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 07:43:21 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Sun, 08 Nov 2026 07:43:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1794141801; x=1794228201; bh=EL
	V4WaZPKEW6RedY+bisgqITnReELZDv8Lzb+X2pXls=; b=MTPR3LVIBJSm2ydnB8
	l5P/VLa+udJbSGbCwuc3ceVr6RPuHeh1tl489j0TXnsPsC5SD13HtYU0+3Anh+P3
	q/XD86GfAHEGPV1MK8tXhwn7caFNpj/50UOewQa1RhY2xTCAKjCChbsxH081j3YR
	q/jhQ8dIONp1XwB8GRsXDJiiv9JyJq0aVRPoPiWwEjDKq1LniRhqqHSf3F1A+W0q
	sYdp48aJSm+XgmaoF94PrCF+3GWVU/Ke26aTppg4+5aV6VGTxQM6fVQ67HACAOOz
	fof6U6md/MJPZJznbPYjV2w2+0UaUgBemLQElmijaPD4BxrajE8nItBbWBRjxlfS
	vcZw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1794141801; x=1794228201; bh=ELV4WaZPKEW6RedY+bisgqITnReE
	LZDv8Lzb+X2pXls=; b=Ypyi3rG0m6ObI8wZAJyzWGtU3EiQ1jKH1eUdNiT0MgnG
	vc3Fvo390GWMrWaTX+zMyFu3kkK7JMmp/EUm/9lJDu52mTYQ0RL7a/zaCKAH9VWP
	So2DYNkgJqeue4q7Xq5YPdaD3EG7cX1r194MeD1TKMGxd4cr1TkvOwyGVHoBXKfl
	BecjkIckXsqYlYnCCFivVvsz1+KjuNnDCQS7+ZWdZFEDfPh5GhMNlMiqAlzJUiub
	21aTKX9v+fLtzrXrTmZj2t72JZ52FCcH9Pk28xsF9aP+qgj4q6IRD5tHu28ne91e
	+x3mmFQkiNcdaRf78Yld00VCiNSCzVoOl3xurNhM9g==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=jannau.net a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794141801; d=jannau.net;
	mf=PGpAamFubmF1Lm5ldD4=;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:TlhtKBiSqLi40LmRMX+5xoKaZfW97BNElRf+m5pch1Acz08
	5ixPNj+5F1FEbf5echkiwa4ohiBl7KLweZ75PWv9kOFAZEc082NCSvEy6vWA2cth
	eYvYeVdVs+FxWb3sVs+8cLM5ALO9Q7TW+dqT7Y/9WtKa8YFMkGcJkCCC3KjUqM3l
	jqBie9s6VCCFt9jtyiqBN7wwCfjxfZ2U4cqyjmW495GpeOb0XDARyyn9jKMYVRst
	lWst5cEOQ0Zexz2rEKIsbe5COKgYufA0hsf7rVOm9U+IbfZ4wE47bhzRQWfyNgfx
	7XdlNG2yAilDI765EvEJbmcsWLuHkIRP8bFdNJQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=10;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:mZTj8iYLHGoPcvuebOnfDaix/uPi0W+eL95NbCpVOcg=:oYVO2ze/ZTC9cBMs5eJUM1hd9QHewk+aoxr2ik4yLA4=;
X-ME-Sender: <xms:aG7wak_tyieW8AR-X3cWONqMQ8FqBtHAtQhzbQbBg6PWQxNPBgmUiQ>
    <xme:aG7wait8cmL6jDtcn79Psgjrw9SNyO0jMrJf3GfIJ_iOkZLHYHvOZHx1q4X-Ws1Ga
    9ClL6yJlMu_RA8tBs2wAWaIsSiEmspup6_uprN7nE1OgiUMmbHmXeT6>
X-ME-Received: <xmr:aG7wak3psRuaLEYWANpgJv_1PmER5utfEMFRmeHLNgW51v2doj4ak-lAxn2QDITfSGW7AS4LBI5xmSkuPW5pjunqifh-YY_6mD9MtA>
X-ME-Proxy-Cause: dmFkZTGZRcNheF8M7yjHO64Z9o8VBihvTBUvhpIg+KEjZ7CfKhbikhsCI3r+nl69zWFT5G
    poOMftHM1KgifJcSNNS68ROF46zdyWxCAc4EMy2RRejAozpmnlj7ZjNTw/wdqU2oUxRL7G
    A2xJO9yNkK3oxNOLGwnu+c1HinnHgWOVqjLj06U5hoOAgrK5i0UBvWGkBBMsd7IafVSPz2
    anX4+EdwKxWAIz8P4lLKheUBHtq31vKC3e5ZHIjXsn7SqeW9q1EKwQWyKFcRVZpIK7qxgJ
    eRWIQlz/4QQQ2Fye3RdeAsuGCpd1uGS041i4wGx+F7GIps+pMl83U6iSv1KG3pp9XQBQbF
    FZrUBgJAo80feOjoWa4Tudo7eJXYKogXtyO5XUlQF4qrOzmquBRr6qMYtZVdZ1w38eb3NE
    zuTIQDHhmIlf/KTcXmK829oC6wm1CAWfwCua0Hjhjtp5hWZUtfm1+aPSmo2kJztxUdSA5a
    e2y7jvzs7Key7IpvlnYrnKrjHqZeUv6papfG2Kr0cWoFcoypeFTL2zvO6gI4wf+Gn225OH
    WtLN0qP9MANOBWeZXOAmcHA4uJ8FDMnXHKyPTT4C0iu0r5u3QQNUI/FRC6gyHlTocaW1Fq
    dxw/t9o0KR6sPSUFad+Lh8WdIneUqVIKbiJ716QGi/X+rRbRMAKIBrIf597A
X-ME-Proxy: <xmx:aG7wanSUyT3l8_aUrU-ne40PKZ5N5-uyrnSF-dtCX4dnKZuVwXXBSQ>
    <xmx:aG7waocvn2YPzD2dWBP4riKjybtc9K1iahN6Ejt1n2NnMHvCv1lrCg>
    <xmx:aG7waocMZ_tbNrNSBQy5nEfkIOeMFfwKtds03k7Wlc89aV-WsoRhUg>
    <xmx:aG7wai3j4zUMogU9kOWcbzJe2WwUliQKfdi_Azb8mxAnabGFUYasrw>
    <xmx:aW7wap5o0YAvCUDg6Sy0s_S1eHF1zkLbR7BpXoiJXSbge07_Y8HSsWrm>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 8 Nov 2026 07:43:20 -0500 (EST)
From: Janne Grunau <j@jannau.net>
Subject: [PATCH v2 0/2] net: atlantic: AQC113: Fix regression on Apple
 silicon systems
Date: Sun, 08 Nov 2026 13:42:53 +0100
Message-Id: <20261108-net-atlantic-aq113-apple-l2-filter-slots-v2-0-0b988d031c78@jannau.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/52NQQ6CMBBFr2Jm7RimtQiuvIdhUWGQMU3BthIN4
 e5WjuDiL95fvLdA5CAc4bxbIPAsUUafQe130A7W3xmlywyqUCXloeeENjnrk7Ron0Qa7TQ5Rqe
 wF5c4YHRjiljqozJkWqOpgqybAvfy3lLXJvMgMY3hs5Vn+r1/RGbCAruT4rq+lbWp9OVhvbevQ
 zZAs67rFzF//2nhAAAA
X-Change-ID: 20261026-net-atlantic-aq113-apple-l2-filter-slots-6342515c5318
To: Sukhdeep Singh <sukhdeeps@marvell.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Janne Grunau <j@jannau.net>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2447; i=j@jannau.net;
 s=yk2025; h=from:subject:message-id;
 bh=oYVO2ze/ZTC9cBMs5eJUM1hd9QHewk+aoxr2ik4yLA4=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhqwPedGu2ol7lrdvK/zVnfp4sv6cKgPRXUs/HLu3v86rz
 YhPzCa4o5SFQYyLQVZMkSVJ+2UHw+oaxZjaB2Ewc1iZQIYwcHEKwETuvWBkuOfF0qW//WhOQbP4
 X21Z/3OX36VpHHt0PVg1p3jlU43b4owM2zpiHzj0ZoSwt1knlyUrcsnHZ76LnyS3WPy+YXxpsgg
 XAA==
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419

Hej,

commit 6c1ca112a6e4 ("net: atlantic: fix AQC113 HW init: ART, L2 filter
slot, MAC address") broke data transmission on Apple silicon systems
with integrated AQC113. The commit uses the queried filter caps from the
firmware which may result in using L2 filter slots starting from
`l2_filters_base_index`.
hw_atl_b0_hw_packet_filter_set() is not aware of this change and enables
/disables L2 filter slots starting from index 0. When the firmware
reported `l2_filters_base_index` is high enough (9 on Apple systems) it
will likely disable the L2 filter for the NIC's own MAC address
resulting in a complete loss of data transmission.
Another issue is that the number of available L2 filter slots might
smaller than AQ_HW_MULTICAST_ADDRESS_MAX (32). This is the case on Apple
systems with `l2_filter_count` == 29. To avoid -EBADRQC when L2 filters
run out query the number of filter slots from the hardware.

The fixes in this series restores Ethernet data transmission on an Apple
M1 Max Mac Studio and supersedes my previous "fix" in [1].

Link:
https://lore.kernel.org/r/20261024-net-atlantic-aq113-apple-regression-v1-1-b8305415a8b1@jannau.net [1]

Signed-off-by: Janne Grunau <j@jannau.net>
---
Changes in v2:
- Leave atl_b0 as is and copy hw_atl_b0_hw_packet_filter_set to hw_atl2
  to adapt it
- Enable L2 filters for multicast addresses correctly
- Query the number of available L2 filter slots from HW to avoid
  -EBADRQC if it exceeds `l2_filter_count - 1` and use promiscuous mode
  instead in aq_nic_set_multicast_list()
- Link to v1: https://lore.kernel.org/r/20261026-net-atlantic-aq113-apple-l2-filter-slots-v1-0-d72e99b69583@jannau.net

---
Janne Grunau (2):
      net: atlantic: AQC113: Fix hw_atl2_hw_acket_filter_set for L2 filter base index > 0
      net: atlantic: AQC113: Limit multicast filters to available slots

 drivers/net/ethernet/aquantia/atlantic/aq_hw.h     |  2 +
 drivers/net/ethernet/aquantia/atlantic/aq_nic.c    |  7 ++--
 .../ethernet/aquantia/atlantic/hw_atl/hw_atl_a0.c  |  7 ++++
 .../ethernet/aquantia/atlantic/hw_atl/hw_atl_b0.c  |  7 ++++
 .../ethernet/aquantia/atlantic/hw_atl2/hw_atl2.c   | 46 +++++++++++++++++++++-
 5 files changed, 64 insertions(+), 5 deletions(-)
---
base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
change-id: 20261026-net-atlantic-aq113-apple-l2-filter-slots-6342515c5318

Best regards,
-- 
Janne Grunau <j@jannau.net>

