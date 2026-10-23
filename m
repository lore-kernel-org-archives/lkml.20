Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792756746;
	b=R4Be1z+b7lQAe0HAh77kt5VdGTCjFhhlqkxvqoZFi2f0nwN/VCqQc1Ab0dj7J5CCCcd8
	 tV3NGUVNMaVko8GQb9v5Dj5H+uu/6UCuk0JWNeaC2sSX+M/JQ+E68HNKX0Xbixvw7KEtL
	 7ctPq0BkceK2Yp/pyHCH2QycZRC7eyjvLKBM4Ay9pok6yNkHofzOKqCIH3j9ETEJBYkYL
	 qj1ZLyd2xieOWUHChLU480mGh8cbwXTiFZUyx6q/6d7cqadqiroC5SwctdY8Nc86ryOFX
	 yTqwHBOXFEa5/dWaATZQA/ml38e9RRzWC4KIQlgUfKn1PJpa3tQWR1Big1R4jSn0SdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792756746;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=r1RgB/u4FYOFJ9I2v8cUNm1qwVXOej45AdlSUJ7c9/o=;
	b=b5kO8ywmw96+SDlYCu32EARvk6popaJgmEsrip1XNbRwZHZGMN7xsYE47g60akNRGwps
	 +ttDOcVDYqAFj1fTQuM4pM2qvykWAIyh7rnNJi+GplLEVCy0SGw9y3c6TaynLV6j5y/RN
	 8ZJHF0CC2xwFjRzPFuHTLZCgA6DqzRm9n5mbzxQWiM+h761KIJr4i+GZGhml18duNmT/P
	 eIMqbpmldT3WlsoJHY9OXpk1guO2hp4AKQgL9N403CtjWu8O0XkSo3CqCcWBcEZVBQXvi
	 2tMcFK4a5T3fFzdYhbPpn5LIVyxdk0wHyPXr61mS4CFerQHXiKR+NyyocYAJFTggZ4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eKH2JYuL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dl3qYVK5;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0AF5606A320
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 11:59:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0AF5606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eKH2JYuL;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dl3qYVK5
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NAARx63550447
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 11:59:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r1RgB/u4FYOFJ9I2v8cUNm1qwVXOej45AdlSUJ7c9/o=; b=eKH2JYuL8vVAOhTe
	EcoKGbCgLCKN3DiGqlfrYPLTKRtWNvrJJBwqV/uOQMdg5ErLJQVenDE85CMtHD12
	As5qVQMIjkByp4QI720JNVUT8CSpS3L+hgoX5GGHR19zbVCTZ5NDOKOO1nAn+ere
	wUn7IjSg3frFL8I9RuGWw8j2bkEpGP2ZH+Xx4BQbxrqiAch1tREnNPDjt3EoOBND
	2KD4griMj0hRV0iJ5D7cvbkey/JnRmuW1kYYRnFXwSs3uBr0KS6Vl35SPAdurUpt
	UVH2S3x1vY0BdJuM48KPa57obMNvLpnn8iwjSXcuy2FJSjXbT5u2FZWm999Vu/Ed
	OS5lng==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmrbh95-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 11:59:05 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-341eff9e381so2144171eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 04:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792756744; x=1793361544; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r1RgB/u4FYOFJ9I2v8cUNm1qwVXOej45AdlSUJ7c9/o=;
        b=dl3qYVK5M9pOXYNGvRZdeao/OB1oyoCTgzPO03hdHDLIMjF/FnFoHXga+4QAbh7hl4
         une4OVS42Jczi4nU5ZV7iD8pJGNLM0HYf3LDfELV9O1GzbkairwxHzePtn3wdUVeBcUj
         5s0EbAI4O0/IIU0hAvL/hcwX1f3lCanzfBXUo0yXIjhuxUIesTqR8Q04/JNZeySmBAAH
         B+yR6QUrdTu5EFyv76mzD0RvwtIkxr7vg0us4EyS36i+RUe6FbLX8sYitjq8BDTZkQxU
         y4mr6lXR2WX1LJfZhytBP1+NcFbVX2oHKoZcxDM3WHb9VoO3hMTjUUJgxAUBHuTkUgj3
         Yz3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792756744; x=1793361544;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r1RgB/u4FYOFJ9I2v8cUNm1qwVXOej45AdlSUJ7c9/o=;
        b=OPu3o0NjPfFkZhKdQ4G2x5rPjnQPdDcpZwxplcLPv4ZhNTur1aXsz95CGn2cWde0Av
         tynf5L+qmqMWM6h+RGa/GTO/+fdPMdRPc2bIMgbSBRAV7e7oPR2NhPSwwhSioy3GPATR
         X/7ol82LMhusec05T5Zx8bQKafuBMj3LfK7cDn445o6DoH28Sx43AaQaN4sHwzKCoHod
         WEBCxvEsvPcY2lusvNhQqVx8P3Fu3x2adv9vsCgxpZJLWMOdAl8h4Im+eotuygkx0HUf
         jO8VdISYBqToq6J1kKm6gcJY4+klezar6Jzb7/chJgpVePABpGuHoU9tTGZW+yYLCxhE
         ORbw==
X-Forwarded-Encrypted: i=1; AKwUvBwlBbQFwOmcsXZAuzOZ+W7FPOsnPSAtImsm8thiQL9UfOAmL9IiW8GdN5SZbUn+ZbftKn6btgpGbdh7HOM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLY9rdmjQ5vxswTCFV4yEn8VLm/y9/7YEe0GGDg2w5UZpursrDZ
	SCyNSErE5eWY3PP0q2FDPEOOrlwCkK/XtkeWsJn8HWEsbt2jdx3gaBNzhwcSJDjzXnwe3NFIi0B
	rXUyPIr/XcJXtvWIyjy55yJ6dS+wdhHcSvcuyXXP3IdsHG+3k1abOXEqreFnu9zytMA8=
X-Gm-Gg: AYBFou3hH2Kw6qkVK+WfYVDWg4lq2ru4RxpTivas1M1pTjVKWIB7dLnwYh+Io77bu0O
	k4HZXrScd7XcdEG5fC5oxBbu9rH3E8CKM9xWOeD3AnaOK2D+k5GFt68lejwz1G3wfQDx59RvWHQ
	H5Z7OADKzT+cQKdhu4KqcvjdrrMldarJ7TXlrf1lAGszh+NcrcF1fI9r1kVWiHfC0sUB6ZlfV52
	HeAyxUN8VZ92+kX/0IIY5p+9bB0mO8vV7oKyuCgLAyyHofOtxFP5kt2+i5RNPLPed8U1Qq84jqQ
	KRW9v4AfGqAHtzM1Q4ucFp9Yoee/wUlOb3Y9FO9HnibzMM/pPYUfDGBN1SoqG8F77VHP0+BYWFZ
	sXnH6Tw1S3eNrvrBnuEdC7Lwz42e4kWda9g==
X-Received: by 2002:a05:693c:83cc:20b0:366:703c:5f0e with SMTP id 5a478bee46e88-369d98cf32cmr3125596eec.35.1792756744193;
        Fri, 23 Oct 2026 04:59:04 -0700 (PDT)
X-Received: by 2002:a05:693c:83cc:20b0:366:703c:5f0e with SMTP id 5a478bee46e88-369d98cf32cmr3125553eec.35.1792756743505;
        Fri, 23 Oct 2026 04:59:03 -0700 (PDT)
Received: from hu-arandive-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369d9d5ea64sm8786134eec.5.2026.10.23.04.58.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 04:59:03 -0700 (PDT)
From: Aniket Randive <aniket.randive@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 17:27:57 +0530
Subject: [PATCH v2 1/3] dmaengine: qcom: gpi: Add I2C bus recovery opcode
 support
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
Message-Id: <20261023-20260826_aniket_randive_oss_qualcomm_com-v2-1-93572b453d6f@oss.qualcomm.com>
References: <20261023-20260826_aniket_randive_oss_qualcomm_com-v2-0-93572b453d6f@oss.qualcomm.com>
In-Reply-To: <20261023-20260826_aniket_randive_oss_qualcomm_com-v2-0-93572b453d6f@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: naresh.maramaina@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org,
        Aniket Randive <aniket.randive@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792756735; l=3967;
 i=aniket.randive@oss.qualcomm.com; s=20260325; h=from:subject:message-id;
 bh=PKo2E5lKF0uiNOiX1SRbwpsFnqDtSbzKLjXeWX31X+U=;
 b=brNNiZEDteQb4CFP7id0C5NhBneYvT2iQpHW1zf9NMsf6TrevSuuWss+WiONX9IDVOASzd1y8
 SG/khm7i2iEBgep/hlN+zjnGSgpJSZ+3ASHoTzh646TEM5Okxy2N7ec
X-Developer-Key: i=aniket.randive@oss.qualcomm.com; a=ed25519;
 pk=4o37X1ZqGbCO/T2SR8kq/HnWvq0yb1RUlFuNukovbQk=
X-Proofpoint-GUID: x_9Dnr2tLjHMrsrLbuN61SVtLHIqSWLS
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA0NiBTYWx0ZWRfX5pAGZGt3lS9G
 5ZBt4KACCHVQE9yvBf3QAKqUPEb8xYln6R1Q73waR2xVJAaS/w6IJIrqZJevkk1LEZtiV+cn/fT
 aoDJnQRVU1U334yixB0Gpzj4pVweIRw=
X-Authority-Analysis: v=2.4 cv=VNZIDNPX c=1 sm=1 tr=0 ts=6adb4c09 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=6qpgm5iOkbbos6gE2JIA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA0NiBTYWx0ZWRfXzWzLpsPUTo64
 ZGecwpvct0cj88xgTzb4stxZeXYozPjrU+Tap9bB8VC99YCpdr7h6YOtZXHbI3kcmUhhYn0vQek
 LyPtspqYcQIESYSwx+btfeSc8g+IGi5ZJ6Ot9FMFy9VxkcYaix6m1kUnYMn/TmdaOpl72NUSeE4
 3zWhbkoM540aAodhoSXnyKp0BKO0G1qCtWmBhLtDh1r6NuXsCEDiZ8oywNRCJOw76H5sTeDnK0N
 ZFqZl2siQoYJLZwEJEIiHS7nSrRN0PEhiF3U2wyWvofRV1VSOkYMWZE/KketfG/51Rki4vqz1ix
 on8Xv141k3eQ1134zKc6WVAoJdGALoPXtXSuXsslFNa7hyIjvahfGegPip4TdWYqvJ13mvhxaFR
 7PL1pdF0mHH0i+zF2TTFnVmJNASnxtYUfhpt1IU6tH+N7YOU1IGrCJPbkvqp3694E8PW+a4BNXp
 v2FPUA8ITszLLtzpN5Q==
X-Proofpoint-ORIG-GUID: x_9Dnr2tLjHMrsrLbuN61SVtLHIqSWLS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230046

The I2C_BUS_CLEAR and I2C_STOP_ON_BUS GENI sequencer opcodes release a
stuck I2C bus, but the GPI DMA driver has no way to emit these
zero-payload control commands, so an I2C controller using GPI DMA
cannot recover the bus.

Add I2C_BUS_CLEAR and I2C_STOP_ON_BUS to enum i2c_op so I2C drivers can
request them through gpi_i2c_config.op. Handle them in
gpi_create_i2c_tre() by emitting a CONFIG TRE (when set_config is set)
followed by a GO TRE with IEOT set and no DMA TRE, and reserve the
matching number of ring entries in gpi_prep_slave_sg().

Signed-off-by: Aniket Randive <aniket.randive@oss.qualcomm.com>
---
 drivers/dma/qcom/gpi.c             | 30 ++++++++++++++++++++++++++++++
 drivers/i2c/busses/i2c-qcom-geni.c |  2 --
 include/linux/dma/qcom-gpi-dma.h   |  2 ++
 3 files changed, 32 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
index c41bfac65ddf..394e7287f6e9 100644
--- a/drivers/dma/qcom/gpi.c
+++ b/drivers/dma/qcom/gpi.c
@@ -1620,6 +1620,17 @@ gpi_peripheral_config(struct dma_chan *chan, struct dma_slave_config *config)
 	return 0;
 }
 
+static void gpi_create_i2c_go_recovery_tre(struct gpi_i2c_config *i2c,
+					   struct gpi_tre *tre)
+{
+	tre->dword[0] = u32_encode_bits(i2c->op, TRE_I2C_GO_CMD);
+	tre->dword[1] = 0;
+	tre->dword[2] = 0;
+
+	tre->dword[3] = u32_encode_bits(TRE_TYPE_GO, TRE_FLAGS_TYPE);
+	tre->dword[3] |= u32_encode_bits(1, TRE_FLAGS_IEOT);
+}
+
 static int gpi_create_i2c_tre(struct gchan *chan, struct gpi_desc *desc,
 			      struct scatterlist *sgl, enum dma_transfer_direction direction,
 			      unsigned long flags)
@@ -1650,6 +1661,12 @@ static int gpi_create_i2c_tre(struct gchan *chan, struct gpi_desc *desc,
 		tre->dword[3] |= u32_encode_bits(1, TRE_FLAGS_CHAIN);
 	}
 
+	if (i2c->op == I2C_BUS_CLEAR || i2c->op == I2C_STOP_ON_BUS) {
+		gpi_create_i2c_go_recovery_tre(i2c, &desc->tre[tre_idx]);
+		tre_idx++;
+		goto log_tre;
+	}
+
 	/* create the GO tre for Tx */
 	if (i2c->op == I2C_WRITE) {
 		tre = &desc->tre[tre_idx];
@@ -1692,6 +1709,7 @@ static int gpi_create_i2c_tre(struct gchan *chan, struct gpi_desc *desc,
 			tre->dword[3] |= u32_encode_bits(1, TRE_FLAGS_BEI);
 	}
 
+log_tre:
 	for (i = 0; i < tre_idx; i++)
 		dev_dbg(dev, "TRE:%d %x:%x:%x:%x\n", i, desc->tre[i].dword[0],
 			desc->tre[i].dword[1], desc->tre[i].dword[2], desc->tre[i].dword[3]);
@@ -1825,6 +1843,18 @@ gpi_prep_slave_sg(struct dma_chan *chan, struct scatterlist *sgl,
 		nr_tre = 2;
 	if (direction == DMA_DEV_TO_MEM) /* rx */
 		nr_tre = 1;
+	/*
+	 * Recovery opcodes do not require DMA data TREs, only CONFIG
+	 * (for set_config) and GO TREs. Since gpi_prep_slave_sg() is
+	 * shared with SPI, verify the channel is I2C before accessing
+	 * the configuration data.
+	 */
+	if (gchan->protocol == QCOM_GPI_I2C) {
+		struct gpi_i2c_config *i2c = gchan->config;
+
+		if (i2c->op == I2C_BUS_CLEAR || i2c->op == I2C_STOP_ON_BUS)
+			nr_tre = set_config ? 2 : 1;
+	}
 
 	/* calculate # of elements required & available */
 	nr = gpi_ring_num_elements_avail(ch_ring);
diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 5cc47b670bd1..60b6273f538c 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -34,8 +34,6 @@
 #define I2C_READ		0x2
 #define I2C_WRITE_READ		0x3
 #define I2C_ADDR_ONLY		0x4
-#define I2C_BUS_CLEAR		0x6
-#define I2C_STOP_ON_BUS		0x7
 /* M_CMD params for I2C */
 #define PRE_CMD_DELAY		BIT(0)
 #define TIMESTAMP_BEFORE	BIT(1)
diff --git a/include/linux/dma/qcom-gpi-dma.h b/include/linux/dma/qcom-gpi-dma.h
index 332be28427e4..b9b75c302825 100644
--- a/include/linux/dma/qcom-gpi-dma.h
+++ b/include/linux/dma/qcom-gpi-dma.h
@@ -52,6 +52,8 @@ struct gpi_spi_config {
 enum i2c_op {
 	I2C_WRITE = 1,
 	I2C_READ,
+	I2C_BUS_CLEAR = 6,
+	I2C_STOP_ON_BUS,
 };
 
 /**

-- 
2.34.1

