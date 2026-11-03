Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793717815;
	b=j3DP42jCnfx7UYCxxYz225d3w59jGOCEFJ5dailpQlX+zOmTuOnFyf7Bb0kIvIDkN/du
	 fQ3EBJptWINVavyidEhDdCj/q0bWam6x+4+qGkRQa7XLDx/xU3LyuMfoR5lTkIcrIzzjp
	 aPkhC35kH0HviANU1D6UntB10O7pdPV7zbmQxK0B7cQkUDbVCn1vVR+r5khekwCwa6UNv
	 b6FSMyMCL/R9jXFZpbWo2Ijcr4jkxP48qlfHHL6xwX9uWeVFCG2dp+z1GgHL3Bu6qDX9h
	 if/pv7sq312ZK8M//x+bCHEYz66UWKJU36m9BR2tSI/V7MDHU1WL30L+hcc450anEsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793717815;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=lnK9cNxarT5IGLjO8Msq2uGG6ZCud5JN62cvdJDIdoo=;
	b=IoJEIkh67sTIe/FatAkoisHY5AATtWYfrWteO/lSO7Qyi5vSsN2qb4sgGMsvxXjL0i2Q
	 vqb8IlUMqTepNmWVFw9HvaLwssDouNRaynJv3xe4BElnR9/nXYHwYN0D7MKU24tn23pY6
	 qjqdRNvJWJmeWdmNgi2ke3VCEynJ/aFlQsE1eCfAsv+fqNY15rIt1mpHAekvQhinWiPi3
	 gAIdnrCh/3iiJNzLVpsFwpGcpzFPnjCtUACymx4pcUTAJ07lHOPbapK4tyf1ejplTwK/U
	 lcKcggBcK9b4JeL/tDL9HqNvX5DJOvKGyWY2B5QpyzL/Tg6N2PLQzR3aR3g+K7oTEeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fgcP0nU1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Cl2hQRud;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B1E0606B24F
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 14:56:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B1E0606B24F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fgcP0nU1;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Cl2hQRud
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3EAEpD3689962
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 14:56:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=lnK9cNxarT5IGLjO8Msq2uGG6ZCud5JN62c
	vdJDIdoo=; b=fgcP0nU1jYJOP9wnLSJ34pDx907ZC1KadQBycUzKNOL38aWFkHl
	9AwVzOB9WKo7VtkLDmPXG5LftKj2c4jdG4v54ZSUOYWpKJ4Oe704CVM8jWgIFUsS
	5oVhwbdCM679WxADjh394ffo6u7Nv48JwUtmxDU2qGzA7Bn3gXU61il69ZdnpteY
	2ZoUy7CDKqsxrHWuCaLTKObIxCkReBrBjqoCnG+fC+sn/Eiu//iAbUgIflAmcBMd
	H1GPciAPWXK0SQnznRJ026FoEz6J1WAAF0PPJKl/H+BiEj5BwsX8T2jc7j0vEaRl
	ll6MyU+GQE9IEpxmMbV0bSENyDk3WyR98gQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq6m9at6c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 14:56:53 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cb93c874bso147723885a.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 06:56:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793717812; x=1794322612; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lnK9cNxarT5IGLjO8Msq2uGG6ZCud5JN62cvdJDIdoo=;
        b=Cl2hQRudG44CLbQhV9AoPOrhHOfg+SsOhDFBhML143IfTBBukzEQCRApoilq6GEOvE
         /iqhAh2Oib0UOqldKQgvHYDmNlwausVNx7biEHIi4Mu78foGrYGZpI1L1ST4B41u9/ck
         HzGCy9FCpNFlKipGn+PwQdnzbIxUKZ0LWtnt3MJXLhRJ4arW2/Y8wDDtWoulzPkHDNkz
         qkeIa/R0Z8MW4iGy30McrbfkUqVDu5rg69hHfikFKT7aomjbxTsldcYH5PCCyejIANqf
         M8AjHgvJob4H7YTdrbAP93N/Do+HXnhJjXtjlNw670zLS24AUc07rvdD0B3oyH33iUWv
         BPaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793717812; x=1794322612;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lnK9cNxarT5IGLjO8Msq2uGG6ZCud5JN62cvdJDIdoo=;
        b=nPFovtWWFHfzhV/zKdsur1B67vr1kiFeC+r5g1aVe7LPOBHVyTp4kAGaMVzqN+X5Ob
         BzjkOhTdruF8TXVBV3JFmJyiy5WqsJwQ3vbxteW53IoPh564voir+LBbAjKIlPdp8MqL
         VagIleoijVNUVQ5OY82wIuLyAlsxxcJPEv0WDmaIMpElaoR4a2OP3TNGMo6gnqfG/yeI
         gDMSPshtLFTCVut9FCFtzyjqhZlMIlElvC+gpp1hzsp4RYLQbTjdixoMDUGSLpI7e99G
         AV3jrMCku3oazz6oH0BOWTwsQb3jwouFsKp8uOSz8CpVnihKz3WPfnQEIvvtrHQ7X054
         PXMQ==
X-Forwarded-Encrypted: i=1; AKwUvBxkSOMcou48T0CfjMmmL+0HxRhct01F/UjWvX4uNPazRq37ULE9buceJq1XgRgRfogK5N9O2GQ5Ajj9UpQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Q0dhvPcRZ1mXGlbxGUT5Z3N6McSPMY1Xk7wcWeuXoBR+yK9p2
	tyYvU9d2Ez4qMIAv+Tpdm5Mv0/wUnbkXSvUhWeteo3RXPZ15NUpa7WJPFneT8Ib6M3HYF4lYiv7
	ruWu9F4pVeM1FPIAsiYUJ/tDbDnqvV6NoAiubFj3riN07dO/GQ8U4FYN/OUXchwGzmzE=
X-Gm-Gg: AYBFou3FT+7cv/UtUF2mYt8Arah+g5bXaTgc/cQZyYceWucC9/97JT+Zt5ZiHI5+pLc
	Zyinri71SyIJxs/Tb1QDm8iiTiW3mSCNP2UnLnVhx/yI9BxVR6KLsb1Ny7IXBE1Iuxzlf7JR6bH
	oUMAqkA1vywIKYYzPFOdMX9Cak25qhYcW4p/MFSnPGs7V5ucXAOMVOPfSJksHuq4zljRB1kuT4H
	4Ox13wk+ya0m1aESxWQT7WVulLU8YyBF/lczmQEkrtcws0d5AZDUS//YSpf4SkM+qZZ0ob0Ce1e
	C675d2u+y2vbfBfy2HvkGlL0CAQ979ypBnlSZSFlwAuiMa5rgx1gMA/yH5OPbcwhjAWpLHx16GL
	5vVrEwGoFMN6S8chxYAX79Md5xNRIJy2KR+DVlP3WEh77UyX5t8qp4pN88bO2Sw==
X-Received: by 2002:a05:620a:4492:b0:945:c430:1c09 with SMTP id af79cd13be357-945c4301ff5mr454831685a.37.1793717812260;
        Tue, 03 Nov 2026 06:56:52 -0800 (PST)
X-Received: by 2002:a05:620a:4492:b0:945:c430:1c09 with SMTP id af79cd13be357-945c4301ff5mr454829185a.37.1793717811835;
        Tue, 03 Nov 2026 06:56:51 -0800 (PST)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a82cebdbsm69772645e9.3.2026.11.03.06.56.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 06:56:50 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Andy Gross <andy.gross@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        stable@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v3 1/3] soc: qcom: apr: Reject packets with header size larger than packet size
Date: Tue,  3 Nov 2026 15:56:36 +0100
Message-ID: <20261103145635.309032-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2138; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=brLsQ5FQCOSS/Rl7j7/iKzfxezF6HgBn+lqAUQwMLds=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq6fYjmScZL4nxD57jA2v88TZxblr6T0YGtq7sA
 h9mP/aUo8eJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaun2IwAKCRDBN2bmhouD
 13OKD/9Ad96aCWnLc/po7LE6/YPWAeZodb6j+Zy18EtgTINbWBYIC076NLO08VzuSB5jIrvUv96
 6+MVbhfr/5oHhoofW4UAIbpwNBHlnIZ8PWUuqUrxLPTpZIAvONta5cfU4cDUFXXx7ggSEeO0TSQ
 ygk4dRmpQWcTyjRcTADWh/ofjxPMvqQClD9dX05LHB8xHUQHSSNGkHAEBONqXrqepN5UWjj9rpT
 1KDJ1d9rmziFo68O0OnEaYctHrOUoAvJzMfjFR7w5sL7ThwkdTjaFDSdVkdRbAnK8arT4bmyAn8
 IZY+3MGLy7Gox4DMD1SuUbrEhHitkb4s0Jvu6RYFjv9PUFwrWhu9SKwkVv5Kdvs+5emskJ+yTsy
 QwwUvx/4jPdUJykQde+ihkaB5T2cKcIc8wTWtmAiFNHhWMqkzp3/y4uEndgxlBWsqj0cT3TS49g
 jvClAr05/HJKR60ffJpGRi1lRh8iT0qcOeyKpuByAhRkTsxkobPXQhzWU/HmqkmThIZ+YWlIjfT
 MTX2q/3AbFpMWyNDnCRaHMX7AZUjByPFWsjsP6b3jsDS349C+CyV8IXbFLK5P3xwXRsXVYFvJ+A
 S2mDfJWuKnQ37OlzGqMBWt9Y468sjqbzeLUEY2Fqpn6wfTTLIxn8/NQMzOTMSBIvbGbD8Eq6mIe U8jbaVAvX3YgLbQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: N3K7P2SxzS0VO0-uXqKmzVqHSIqlynNX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA1OSBTYWx0ZWRfX9E+wpadockQm
 zyuI9wUkFN7AMDIzaLcpS2dFe6CeNd0ymputaU6FHZbpzYso3Qmu9xrViAwRslr8GCLpPbn9zvc
 z8VrqOca5CW0hlx6DPyaF1la7+uz1mQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA1OSBTYWx0ZWRfX6G8TXJnbxt97
 ivSgIzyRcY3qYZouEB4Mr3P3+4+8Q1/BX5EBxt+4SdJ9xnT1e3r3lEw573CS8T47ttAi1wCdPEE
 S9iwX0oI8BEEEeaOPTtajUHpZLHJsYhGzuONG13wbkzE+PyxBG9bmyRsOSs8ep7d8KN75eGoAsK
 9fBtxCeBrhSUNjCin2Wnsx/jReLpBIoqx9R7Hh4K5oe6LGtTx2vSfB9zXX+8wk/Rr4eUbOE6hiu
 UoJ52r9BhLxzbNde8e1FdjjRnhk+W6macVkQZPAaHkmHFe2k6nk3II31pY4DcYagdnUBONykZlN
 NNQF1xijsdY+X1KaAxKhcrfI7PkvKkdbOmss4inmgjoJxTlc02W+ahfRXTxwK0rkuqhDdF/c0tZ
 BMZxepRCPQ6R9vJiSQUe9bvLg58Pw3DbcciXKHtu3JSwxC8gR94JokDmavFZKhby1baFXri+T1Q
 nU0NXExGwX5KC1BdknQ==
X-Authority-Analysis: v=2.4 cv=C7B8WgP+ c=1 sm=1 tr=0 ts=6ae9f635 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=c92rfblmAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=fiEMaWzmfHqX7dR_b_IA:9
 a=PEH46H7Ffwr30OY-TuGO:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-ORIG-GUID: N3K7P2SxzS0VO0-uXqKmzVqHSIqlynNX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_03,2026-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030059

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

Changes in v3:
1. None, resending because I threaded it wrongly.

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

