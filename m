Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793560617;
	b=QefxYB6JpHJPAdDUG7O3i2mf309X36ahR/840JtA0rtEeOBBP3Cz/qG3iNEF5LECLjLL
	 vUIIiTm+DwfmatLZjgoaikuhBRBZGmgBy8aES+F4Qrwg4+sNeuhJyJOkZDF6aZaNPbzPA
	 QVrsTDZtT5RQJC09awMlbi7BrCidy4DRgXnRSefMtdFG8X8AKGeMrhmsdzrsYT2LeQBll
	 fyDqqoX4bBs4AQ/118SxtOMGcFrzQvGLqXPm2YJE69zoj58iAk/mueHIWTBMMMGe9H98j
	 pT1Q3X0eeNqBMBPMs7Mq1yM2a/ubhfTZTyzwmqf2yFsrkWLGYiloY6B+bNtAvvFMpew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793560617;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=UOs1j22LjLE1SIXla0/ZeRPDc93Djkkb3vt/+irTwsM=;
	b=lH7wuWrIeBXq+q8K1CVZaE4FLvUndbfPvibNa+DUvs/eRRvS6ARMj6OZ7/PuJCF9VaT8
	 E+49My5FZKqW1XXz8xnLfXjaFpLUArq8PYeOm7Vy2Ze/l7y1XiGX8WiH/XRLyUTPpIs60
	 30RDSIoMN+TAgQbgQKcFQHeL/YwGuiWjSlxzLxrd97lWHcJ/hVnH1QUN18dRifO+d0tzd
	 OuiCF5mK2BQlEvxN5krTITqG7+9ZvaCz/CHVKADdrql3m5JGEHca3PzSRjlYG+b1vSp1F
	 ivu76UgH5Z/JsPoKRDcnLXm5Ozvime01OlmBn0b3vntneU0ZTUiUqDi4169XGkg1xbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Lj/u2+tg";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bBLSzuTP;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04813606A326
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 19:16:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04813606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Lj/u2+tg;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bBLSzuTP
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A1HQPh84030526
	for <linux-kernel@vger.kernel.org>; Sun, 1 Nov 2026 19:16:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=UOs1j22LjLE
	1SIXla0/ZeRPDc93Djkkb3vt/+irTwsM=; b=Lj/u2+tgp0cEoJGTBhM2RPfzUbd
	ZdX1QbQH2xav3dUclBCjHtSqspvB31kN3ImJf/6GK/s7QWBIIPIPaQF2yi0T0rh6
	v90h9lDTJp2Z+UjPqCH6hQZi5hGm6/217zhNPn1a7UtWNURuF+O7UkMqQ3j43fuw
	69qaPPf6VcvCs78nyhhe2QIVeSk4ff2uH26zSl5sdUJmTjQoqvXVu4GuyiZNt7ha
	qTqFVWGaevtnibDyl6/hO6DizgJtS/PkudXSS9t0kiBO3gDvONPABPrqJT1CqLO3
	p0Ba0ciC1z7s7/spva0JueoylYMMx7z+6PK+jUevJZPTvU5Y532pBBbrVWg==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn9gk3trr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 19:16:56 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5eabedcf97fso358236e0c.2
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 11:16:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793560615; x=1794165415; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UOs1j22LjLE1SIXla0/ZeRPDc93Djkkb3vt/+irTwsM=;
        b=bBLSzuTPHA5+PA/yByTKS6PHYF0Ij1RKieMLlrc8+KuEnB3iP9tDzqvKJzE3yoUEUI
         D1nfH31Jz3EN9EDck60ztIg5tTTZWxmEglBuTvdlbO22orUGVODg+U6fc9LYj/vpMvNc
         UfiiPvwbSjGU9/+sUFTAx9UWRaebHyk5UftI4Uyv2tz78Zk3nJp9HYlwlfZkf5oAb0bA
         6HczoDrXvVb4/0rkxdsrQvqmBQVri+Felbps3cavRrFOLTVut6AjjLTcJgUJmkoWFXuX
         ySxe0jEtjve5Bo/MIdn3BppC6zIHjXdr6Lt+hJVE0jNZgxziFbDb4/5NmvY8Lp9W/a86
         WfIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793560615; x=1794165415;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UOs1j22LjLE1SIXla0/ZeRPDc93Djkkb3vt/+irTwsM=;
        b=Z+KxO+vQWQOhvus6bwN9ILVob5HHk7RYbQUUcNWx9OLmnQUVIgN/nK3BzXx0eAf2Fd
         3FPuwebZRRIVupZtZdp2OaYTbpTO4hA0wyHk77qI+7ZwVZtrqrd07dAh+DfDY/9B7abu
         maA8IJzsOtjBtR9X6nkpJHswcl+CajPbb+e5C0vMUVIlmOm1EvkrXOJsv/akIN+lPc+X
         Y6gVQzL675scVo3JJG+yBrmnkxbD67Er4ZfBVMjjzPb2X4Ks0OWeOjbfs7byYN1F4Kgn
         M24HbfIABahWTIInCBhVqV/Sh1qLg5wFunp6f2P0sIYwl60c+NuSK7UnMF2f2BZiWHrp
         efMw==
X-Forwarded-Encrypted: i=1; AKwUvBy0GfLiQ9DXbXfcpjgLd8U6oS6Rf7i9BOfZs98KOOujyH7u+/g7Z7v78GLGufE/ZtDPW3RB/zCXM6Wmtpg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8SEqUYobItUuDf4UMiIm3mEwPmkhYkaPY6nON0T1GFINfI0k/d
	IjtoYJ8MBsLzzlo9lAbIR3I4r9pXuI1SRmWgH/mc2cN0/OGKw75fBKDVQMaeraoWPXolpNqRdB6
	VcTy5tFaDtwvAI9Xx22Uj8g5leDRR6YThZz8IWvuTZU8TorRbI+W7hxkEicYR7MlWbVU=
X-Gm-Gg: AYBFou3GtX92coIyDscBUajpU1d1W7nLC9nbX6mdSb/at+dTjxgYcZ6FVAHQ7Ly4Ngj
	vLu9MKdp4884oIsvmeRtfff1iVEyiJOxQhFXaeryjZgDrAjWMhpjyg7NSrzoP4TIJHgZo2g+cPX
	CCh8byX78BsMj/bYF/gbfUNeMJ+tuJxmfcM6iZExBmbo7NBSywGP8kGT6PdnfLeYDSiDhJxCgD1
	8Moj8Gdh60LqMhUync/IX7D8HiRccHMOqwGYIfVCbpWG07eRYzFOlhOnQWidfHwnUrEL+s5SFKH
	22IR6VjhRlolTX54SQ3tZolAlGt2erpYwhVhsJv5r4gDPg+SVC0mlSEFpEUitoJMopTRAFSIj7x
	bEOq2YbsWaeNg2hpodKeIosd7mDy8S663g95USOTX4kyzvtQCSUj/22ZfK1SLgQ==
X-Received: by 2002:a05:6102:524a:b0:7cc:1ace:fd11 with SMTP id ada2fe7eead31-7d0726359b5mr2913457137.8.1793560615075;
        Sun, 01 Nov 2026 11:16:55 -0800 (PST)
X-Received: by 2002:a05:6102:524a:b0:7cc:1ace:fd11 with SMTP id ada2fe7eead31-7d0726359b5mr2913435137.8.1793560614547;
        Sun, 01 Nov 2026 11:16:54 -0800 (PST)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3f9sm17168223f8f.4.2026.11.01.11.16.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 11:16:53 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Boris Brezillon <bbrezillon@kernel.org>,
        Mark Brown <broonie@kernel.org>, Andy Gross <andy.gross@linaro.org>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        stable@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v2] soc: qcom: apr: Reject packets with header size larger than packet size
Date: Sun,  1 Nov 2026 20:07:35 +0100
Message-ID: <20261101190733.121473-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261101190733.121473-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20261101190733.121473-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2069; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=kJg/rvfiN7UDl3v4JnVjo0T2/XuVJN1WlSd/w2seENE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq5436kMlPdugyAQucba+rGuml7G8LnGlzYcMDi
 r4C/KyVAy+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaueN+gAKCRDBN2bmhouD
 15SKD/9rfYsZQDHFYT5ukKYAd98y0gH0XOt/ww0qCH7VHPI2mp+aO43S7bAAR9v2TZQMN9tZvaN
 co6HZNn83E4znnaaNg/VZOPQxHhCVPJXaECLpRQrSXNMY7WjtUZXqTPI4jEh7E6szRxHSjnmXAv
 s2ZfruTWiVVLTP8U2Vhnzm77fOCbgwSiLo00BgWXyZ7s+7oIRT4A+E6xXaFb0d4APn6pE68CvI/
 XYhX+5XPv/V5Urs4iA+8QloZYddAXx6VwwCA009u8ksU8lgWVbMS0bc194nLIzfAxvggB69IDQ1
 m46Ji4vqediUExfubRsPPpEi+lHkQnquo2FAockRKUyKLbsb5+j5+czLQaj4GKFl0wIoiOCdBmD
 n957wW1OyUvoXuVtH80dFF4PyOpOxSGfTkGaBp/UfLKgYe40k/j+piY0reZjaQgT7FC4786AFRB
 YW9pptUes2+3a3J/BI2k1J90Xf6K3LJCbvmRwFDxGuhE0k2hQZog7xa6xlhr7mmmn5i8s11hRW8
 nQn3v/wC+6w8BXQU8prrKv0l5Tc8nYqeFwmUfqgWDKkX3Ehw2yP+m7s6zIBEznYHV12uqPTaIj9
 5j8/M2Cs7jkxmWliJG5JOIeg5UwpUMhNB0P0youYObuv3hpKMiAEjhxJXrNB4IE87U6puXTtaQD uT9sTflUQQlTrRA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: EOsZe7jz3YFLAkVjswQ_-onjoJlrZNn1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAxMDA3NiBTYWx0ZWRfX/tRDq/c56S5w
 NhGnjPI5rpLDN7yKG2unJaBFBr79NtsYl/Z6gnx4MQEvomPu2SSVvVVKHXnofgNAVd+CA5i1u9Z
 I5yOFI67mcQPluw2Um7X+EUfG1YXMQofSv0SiOoP5BEuteVSUAq40djXyNU20VUtxjO5KPJsh2+
 c+WFcAxFJUlgyqr0NEGIrsXh6otWQQluDUgwV3n/Mp8yXhEWjrB1mCUL2ui9gAGwi5BiLAWXfG/
 AvfRwX8MElYOLJhSqJPDpVjHI+3Tl+wF/dlMyTusvsQlq3mfyj3QZ+EG708MycT06RJpcf6Z8Yg
 TI+8qR5Rq3w1r/dDveKHNlZlegZWSaigZMmSz2ZnvYTnw9bSP2RrzXbaV1WM0ZLEZyC6T2CTKTn
 SUk2lHokBjKYkxzk6aAg94rbzqRDEgrDzT0R/bWpDaS7jrmQAYZJ7s3IRnvUgxWq+IVn48zKtVr
 C8PkfipevO4v2mBHlXQ==
X-Authority-Analysis: v=2.4 cv=HNBWhYtv c=1 sm=1 tr=0 ts=6ae79028 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=c92rfblmAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=fiEMaWzmfHqX7dR_b_IA:9
 a=tNoRWFLymzeba-QzToBc:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAxMDA3NiBTYWx0ZWRfXzjlg4kGqpkZU
 PwBrCc+E3M93qZ2GHULO6zUz5H8Oz8EywEMyNz1QOW5cZuQbutzvxGayjyIKIqPrS7eguwduHAY
 oX4Y+hPPYM7VQvjlBVsd8zxq7acwtlg=
X-Proofpoint-ORIG-GUID: EOsZe7jz3YFLAkVjswQ_-onjoJlrZNn1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-01_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 adultscore=0 suspectscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611010076

apr_do_rx_callback() and gpr_do_rx_callback() validate the header size
and the packet size separately, but never check that the header fits
within the packet.  Both sizes are u16, so with a malformed packet where
the header size exceeds the packet size, the subtraction computing
resp.payload_size gets promoted to int and becomes negative.

Further check "resp.payload_size > 0" would fail, leading to
resp.payload left uninitialized (stack value).  Reject such packets as
having a wrong packet size, although unlikely that firmware would
produce such packets.

Fixes: 6adba21eb434 ("soc: qcom: Add APR bus driver")
Fixes: ec1471a898cc ("soc: qcom: apr: Add GPR support")
Cc: stable@vger.kernel.org
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-82d40745-1593-4c20-8432-d86099836525
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. Test for <=, because hdr==pkt size still would leave the response
   payload uninitialized.
---
 drivers/soc/qcom/apr.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/qcom/apr.c b/drivers/soc/qcom/apr.c
index 2d5645ff9919..e303562526d4 100644
--- a/drivers/soc/qcom/apr.c
+++ b/drivers/soc/qcom/apr.c
@@ -210,7 +210,8 @@ static int apr_do_rx_callback(struct packet_router *apr, struct apr_rx_buf *abuf
 		return -EINVAL;
 	}
 
-	if (hdr->pkt_size < APR_HDR_SIZE || hdr->pkt_size != len) {
+	if (hdr->pkt_size < APR_HDR_SIZE || hdr->pkt_size != len ||
+	    hdr->pkt_size <= hdr_size) {
 		dev_err(apr->dev, "APR: Wrong packet size\n");
 		return -EINVAL;
 	}
@@ -280,7 +281,8 @@ static int gpr_do_rx_callback(struct packet_router *gpr, struct apr_rx_buf *abuf
 		return -EINVAL;
 	}
 
-	if (hdr->pkt_size < GPR_PKT_HEADER_BYTE_SIZE || hdr->pkt_size != len) {
+	if (hdr->pkt_size < GPR_PKT_HEADER_BYTE_SIZE || hdr->pkt_size != len ||
+	    hdr->pkt_size <= hdr_size * 4) {
 		dev_err(gpr->dev, "GPR: Wrong packet size\n");
 		return -EINVAL;
 	}
-- 
2.53.0

