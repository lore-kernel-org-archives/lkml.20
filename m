Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A882546EF6A
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 06:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791529144; cv=none; b=EfQac7gSo7rMZgQPA0N9sN4Pdnlafh+qUY0RaPCDac60GAA4yg/eui/1GPApcQHUchjAzqn/Z0HYDoMeSXzLAUK1NuVful21iNS9DIGmQRkTd/yjQUFQvKScLC7Eh3FFX8gSsp1hlJ9lIcwtLfuET9MMquwUPkTAIuOtZHPqTwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791529144; c=relaxed/simple;
	bh=IOjHlqFSMQ0MmAV3d2gcVGpzjfBYf3KEQXWf/p3Rpjs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gvMg8J1El4CnD8e2Il7OuLRJyt7kY8/qC3+rkzhF0FVnlfEkc63Sqd1HtfszErvWAdI4KDkeEE9jzsg20Y9oHcFzaSqQdY4Rh+cEPjcwQIRNsVggqrQEHqzLuzBIDJRo05/iYYHey+hUIUdTO5UN77wDQ8eJXE7Tfk4BOp+WNhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ERr4tilj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jDgMwY/B; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ERr4tilj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jDgMwY/B"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6993H8Jr1597940
	for <linux-kernel@vger.kernel.org>; Fri, 9 Oct 2026 06:59:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gPp8dh3SRUrtAc4BnflTSjw+sAzjTbJP8WpIn3ZnuDU=; b=ERr4tiljZINya6eD
	HVFKeOyuKNI0453YDwHwCbdGAXnKne8Pt11BSmv2Wva+OMOinjPheiYy00z2PfPE
	DrO4+ypAIigOJiuAcMppHnIz2CToebobp6B6JsKyUqVAohjd6IvAa+kWhnV0faRZ
	AU7b+ja/vb1XVf5fUknUzN9l/VRwCeWmbrA1Pz13crVNiwafMBUMy01lWYZzMRlT
	ORVLeAeAiFqk0hr5nF34TBYlydVH+dGtVlY3sOs5xWGSE9gAhYn6Tootv8hh8ES5
	EssZFdjHiJ7aQ8c9e+beQ1AT4hSbOWX65k0uvu2XhA6EBJSjNTXkUdgWAlb58IgW
	bRGHJQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6nufs4u6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 06:59:01 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc7e0321ec1so6535205a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 23:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791529141; x=1792133941; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gPp8dh3SRUrtAc4BnflTSjw+sAzjTbJP8WpIn3ZnuDU=;
        b=jDgMwY/BiJH1+gzcFT1UJFVQAah3RL4+HchVUU4zoFv631pkTNyJecUN9bdj3c6ueH
         1pDqrSHPn7scWomBqagC/qi5st1pjnhOm45AsE21MvfxbfuysiJgwo4d4Caao/uNPX1N
         4UDxGoqJTk7NdjjTGJY3tvlBRrC7shCK+phfb/pa0RqqO9eav2QMi5o14FF86y7wHtq9
         DK4Nl+TmMEhRyLMxYNthTLFo5ST0Szs8kAdBrd7IODd655SI39C7iNcS0+Hje5+mAUJP
         31Z2AJ1NhsabgW3Whxv3cdXA+QddWXCYq4WqYHmHvnGuQXrRULCj7fAFa5fIsihbxPSI
         4WWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791529141; x=1792133941;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gPp8dh3SRUrtAc4BnflTSjw+sAzjTbJP8WpIn3ZnuDU=;
        b=yMV6mkaiXZbXzDXsIt0OkwcY/T37U7utwovpXoIb14UtsUzlF3N1zyhr5A12T38m5I
         rnC7ONlk5kN3NxS7vdwBsLujXQX2Kv6gjsw1uq1oXOh92nGZCTUWoOkJX2mv8wh4Kp+d
         eA2W+HQl2yZ6jXxdRVSt1BjwY5TVdihHtSJfz87t957qpcydb6yrvjgEsw6T55uEf5rZ
         Io8NnZGT+ZY8AXwgTqZWEbkW+zcoKgnrLQ653cUcHKHhOOR2zHE4FS7+XkgfEZnGMUQl
         +V+BspT1YUaNzy6Mtnm1MY0W5m606VZoXiuGTMc4e6MkP/qrjqRLJJkoP6qhOGWmOoMP
         iYtA==
X-Forwarded-Encrypted: i=1; AKwUvBztLtHCAi1FKuYmCgpWI9N6TgHHR6Wstu42HrhwpYA8/loW3GgvhTH+CtVSMQnKAyQT46tiK1NqoYRe/wo=@vger.kernel.org
X-Gm-Message-State: AFuF++naacd9YRqfzQJiSIxby+Vbi/w34njmRDkF5+ScrtTXKCTE4+6M
	/Fdodf9Oa3fTtbX8Pi5/+vpIQZLsh8vHz0mLOLTDan2zQC2uaKpeu7m8uSzhnOSkdSkgP4ZteQL
	43FAVx1kDWZBERbAVs2l7S9zfX9FYHx5tDnagUjSRrv0aovnzaFIx3sSQOaK/9C9+U3U=
X-Gm-Gg: AYBFou14xDsZu8nxw6e+JjgovnxJD15Z/b+xEFtq2CwsLBfNkeNPsBpU57bf67nJTJG
	3+MbejLiFCIpLm7u6NFXSn90UKMO5FjihsmyiFDdEAfkmxYpogruB2XCcsJdyOhPRdmZkGxk/u6
	HOf4gPV/prsQTvfAcS/o2BPBc4184QGadmG7IAe+Lw76sUojoU1y+V9/YfK5gg2vX/Bc4WprBJ3
	A2pPBLBYBeXADwJ2gNtO5z0xNFgChmycHzQHbUw7BObr20kkumu7qy+D7WMcCYbGwubeMqGhXHU
	Z8yJmcwVGtSiAPcSL98l3iJ1rtumQKcbYTTrcirGn5nCnDR4w9nR6rjLRbmYcVrtXySZuKBS4c0
	OhIbiKwkZ+4Gu4DHEC+rU
X-Received: by 2002:a05:6a21:150d:b0:3e1:6af3:59ca with SMTP id adf61e73a8af0-3e16bf027a1mr768116637.65.1791529141199;
        Thu, 08 Oct 2026 23:59:01 -0700 (PDT)
X-Received: by 2002:a05:6a21:150d:b0:3e1:6af3:59ca with SMTP id adf61e73a8af0-3e16bf027a1mr768093637.65.1791529140751;
        Thu, 08 Oct 2026 23:59:00 -0700 (PDT)
Received: from [10.213.103.163] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3d9e088efsm499980a12.11.2026.10.08.23.58.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 23:59:00 -0700 (PDT)
From: Naresh Maramaina <naresh.maramaina@oss.qualcomm.com>
Date: Fri, 09 Oct 2026 12:27:54 +0530
Subject: [PATCH 2/4] dmaengine: qcom: gpi: Calculate UART TRE count per
 direction
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-add-gpi-dma-support-for-uart-v1-2-c69e728df686@oss.qualcomm.com>
References: <20261009-add-gpi-dma-support-for-uart-v1-0-c69e728df686@oss.qualcomm.com>
In-Reply-To: <20261009-add-gpi-dma-support-for-uart-v1-0-c69e728df686@oss.qualcomm.com>
To: konrad.dybcio@oss.qualcomm.com, Vinod Koul <vkoul@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Aniket Randive <aniket.randive@oss.qualcomm.com>,
        chandana.chiluveru@oss.qualcomm.com, jyothi.seerapu@oss.qualcomm.com,
        praveen.talari@oss.qualcomm.com,
        Naresh Maramaina <naresh.maramaina@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791529122; l=2448;
 i=naresh.maramaina@oss.qualcomm.com; s=20260316; h=from:subject:message-id;
 bh=IOjHlqFSMQ0MmAV3d2gcVGpzjfBYf3KEQXWf/p3Rpjs=;
 b=6Ah1Kd69FHKZ6gVF/SVsdk7mG7vNo+dmYlrKRCzjvBycimyXBH7xP4gK9XMUSHVAbeplet2nQ
 NAlWnk5Pj9JDzMB03GgRlfLiO6L5GXd+lrMSRk7HARD+XkAQ/0bva3g
X-Developer-Key: i=naresh.maramaina@oss.qualcomm.com; a=ed25519;
 pk=j7iST9yrLbsgWcWrqdlUNIOWl2WBl4wV1q35/n9SCkg=
X-Authority-Analysis: v=2.4 cv=afn0Dhot c=1 sm=1 tr=0 ts=6ac890b5 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=NStepDoXY9MTWkGviXUA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAyNyBTYWx0ZWRfXzoXNsvvp1SDc
 enltx/6tcwCfJabjnuL15dC4mR+FKr4/r5kWnB3emeWA2czSE9RZfV1zX/uuR096ilrJ2plK9V1
 9dN2YLhkzhLA3r9hTdhjhg2V6Qk9Yao=
X-Proofpoint-GUID: NhxhoRWecifV_q99RzCb6C8xTpiTqqlu
X-Proofpoint-ORIG-GUID: NhxhoRWecifV_q99RzCb6C8xTpiTqqlu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAyNyBTYWx0ZWRfX/R7myLCzSamv
 XpygXOY+QYh9Vp2iNj32xft71EduLN6PDrU48vMrOYZf4cPUwXqJqNkwyNWCzdPt7ESjrYhbYGl
 Mq1H74sdORi6VufG2h8gYOolAWmAb6vtGycwuVbErXTDP9UiKITFABSLuygu15nF+fht00oIkB0
 yM6fFGCjrmc7BxIhYO9VExJkHSRZcFde99pYW3SdcUnfT9D4n8KsKQLeRxgWXRPGfdxSGSFVJD4
 FiuL2/2+aTCncYMT1f6wtiTPPhIKkXOondj+U4qvggUuaCByFOueJKKLn/LJYNayZaRzfSoAM/3
 FZ3yjI+68aGOngwdek7uR9VJEeTvQI9QgQmY6P9fjd97Ch/3x2qFTG0fTq+nXufa1HsubViBOLg
 4ylnkUvXzCC0sYtu5q8jFcN8poKmZvbqKTGk+lBYHgRFw02ciB1zw/WLJ6ZqtfAhnzZj5inxolO
 AJzVnvjvRtDRiAXNLUQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_02,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090027

The common TRE-count logic assumes RX transfers need only one TRE and
uses a single configuration flag. That matches SPI and I2C, but not
UART: UART RX may need an extra CONFIG0 TRE, and UART RX and TX track
configuration updates independently.

Move the TRE-count calculation into a protocol-specific helper. Keep
the existing SPI and I2C behavior, and use the UART RX or TX
configuration flag for UART transfers.

Signed-off-by: Naresh Maramaina <naresh.maramaina@oss.qualcomm.com>
---
 drivers/dma/qcom/gpi.c | 40 +++++++++++++++++++++++++++++++++-------
 1 file changed, 33 insertions(+), 7 deletions(-)

diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
index fb26a286e5df..f72b80bf5553 100644
--- a/drivers/dma/qcom/gpi.c
+++ b/drivers/dma/qcom/gpi.c
@@ -1882,6 +1882,35 @@ gpi_create_serial_tre(struct gchan *chan, struct gpi_desc *desc,
 	return tre_idx;
 }
 
+/* Calculate the number of TREs required for this transfer. */
+static u32 gpi_get_nr_tre(struct gchan *gchan,
+			  enum dma_transfer_direction direction)
+{
+	const struct gpi_serial_config *serial;
+	u32 nr_tre = MAX_TRE;
+	u8 set_config = true;
+
+	switch (gchan->protocol) {
+	case QCOM_GPI_SPI:
+	case QCOM_GPI_I2C:
+		set_config = *(u32 *)gchan->config;
+
+		if (direction == DMA_DEV_TO_MEM)
+			return 1;
+		break;
+	case QCOM_GPI_UART:
+		serial = gchan->config;
+		set_config = (direction == DMA_DEV_TO_MEM) ?
+					  serial->set_rx_config : serial->set_tx_config;
+		break;
+	}
+
+	if (!set_config)
+		nr_tre -= 1;
+
+	return nr_tre;
+}
+
 /* copy tre into transfer ring */
 static struct dma_async_tx_descriptor *
 gpi_prep_slave_sg(struct dma_chan *chan, struct scatterlist *sgl,
@@ -1894,7 +1923,6 @@ gpi_prep_slave_sg(struct dma_chan *chan, struct scatterlist *sgl,
 	struct gpi_ring *ch_ring = &gchan->ch_ring;
 	struct gpi_desc *gpi_desc;
 	u32 nr, nr_tre = 0;
-	u8 set_config;
 	int i;
 
 	gpii->ieob_set = false;
@@ -1908,12 +1936,10 @@ gpi_prep_slave_sg(struct dma_chan *chan, struct scatterlist *sgl,
 		return NULL;
 	}
 
-	nr_tre = 3;
-	set_config = *(u32 *)gchan->config;
-	if (!set_config)
-		nr_tre = 2;
-	if (direction == DMA_DEV_TO_MEM) /* rx */
-		nr_tre = 1;
+	if (!gchan->config)
+		return NULL;
+
+	nr_tre = gpi_get_nr_tre(gchan, direction);
 
 	/* calculate # of elements required & available */
 	nr = gpi_ring_num_elements_avail(ch_ring);

-- 
2.34.1

