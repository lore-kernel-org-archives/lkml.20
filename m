Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 277B24A43E6
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 14:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788360328; cv=none; b=E/d/o98tx4TGocc+UWzQKAoFGrXLv6FE2WRVUTqoIQIAS+gEKfmhjxqgYe8Zx2YjxfCW3FIiqhbPgRAsI2+koxjaF2ry9Y01m1ZUQ//03hfl0uIPrGiGagB7Q7c4fY0Zc/1bvE60r7k/lC8aG3LcHZAYNcThIMIL0UMO0ZPyCHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788360328; c=relaxed/simple;
	bh=2XSYd+uMeH5gLakhM/d5Rj7ofyalwIJWFXM60UvRoyg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=J1JczfdKojizv73l3KtAyTBwGhWPK87tmOS29XdCpmvigPVG17HodsaTe6SHXOTi7mADXx+9UTHfpqQDg83EMpKK1e8uTTVanBmWSR0sMT1dHGUis51v6qGQrbUEgUiIzY03vsUjUNc3fiQY06sgUMMl4TahY2bogDVR2RKxyuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RKLaWNSk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e7aJaJhu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RKLaWNSk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e7aJaJhu"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682CRJpw1491371
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 14:45:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=FCRacwcNCuuftR2uomAhOs
	TH/tlq0gfZo384jWYVro4=; b=RKLaWNSkFGtMRs9GGg5f+9U6pUEUbPfgikOSKN
	eOSmiA9uy/EcXwjzZ9oaSVxX3fG2RE44XFotftIw8ogU9s/65A96PAJ80wKy/9Ad
	5mCBBbzaS8rbmt3TA3XmMWiXuCTl8MotAxEPby7WTb2tNJHNiqCI1VebjLlSfAuy
	eYhxyOaA6OJ8Dxt9A3pLgtdTqFfW3T40wYuoErBas+MwWjaLAF5GGSmob/Zj+4Kv
	3cvdW4z6i6nLF/44icmDiHFbH6gukSCPfqtK1Qimc9cMEgspeMrkz0DCyzfJHiLK
	CL3gh/avw2t0q/Y4s1LB6z/7mO7qsK+kmajXQu8XUJTMNLhA==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4geb562nh3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 14:45:23 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7f4e4b52404so1097134a34.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 07:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788360322; x=1788965122; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FCRacwcNCuuftR2uomAhOsTH/tlq0gfZo384jWYVro4=;
        b=e7aJaJhuoi7njUWSvTmgGEF3e4MR99wWfmtfw53m4FrptdZx5PRvQ1RLqAFks/QNSG
         2O93VkoIOP3iZBEu33UgkkE2tKCv2PNOgqKrEyt+tLQHsMoYz/XlKZK+fdWBz54ZeWLW
         hL/PbYFNnTG52b/5v2qhTOoQ/zgB0d8AyNBEQY40ZaAmizjvCwJs6wrqqBUoVHwQ1CRW
         aUBdyd+laxVXZ28k7zdbbTkB1JqSWnRn+C1GePGHx5HicMG5KMD0O2AkEJ9+O7ClcQxB
         4VtfEHDbmq2G9f8cK1QRheawfNeERm1zELxg5wPrUh78cDD8oCFMpNUXQLrkZl+udPDE
         RAVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788360322; x=1788965122;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=FCRacwcNCuuftR2uomAhOsTH/tlq0gfZo384jWYVro4=;
        b=ahOOPpybLg3vokB7qHX/7WJW316mUTw0Sh0iqk7kmPUWU8cL99zQedNqAG6ONw6DeG
         kLzi9rGTeAQh7EfK6YjzrQt2qvaITqCizjysT1b64mwfUi/UgEg3MsVOGAf/CkCpMKb8
         c5jpK5ieEcj7IkRX+VQEr6tIfwEhqAhC5MVUKygYnBLfYjzkL4cyuMDtU7Nn/0xA6YKq
         FpckoZIln6NnW7qheHh528GfEyiGA/i87FwSEg2c+RN5qgDGxuC/D+ALhnASSJ4e35UW
         PN/3CCNWQyDWq0uIxZFtjdqpLAHcTmaf5QGV5aAvftTPLSg0rvCC7D3wqrkFFZkPKyin
         lRsg==
X-Forwarded-Encrypted: i=1; AHgh+RoFTWSzCLtHMYiAEfBmwnWty7TdhJJaE22LLYWsQX4/GfrN4ZnqEq4GQZy9AqtWArTdCv0jBI1h16NAALg=@vger.kernel.org
X-Gm-Message-State: AFuF++kKltEB/oEiqWhkJLd31oubY9Wj73r6o6t88BW/S4GdXNxiwyqq
	NEUNqSLvH7BIMuDzEZhNlt+teKcxYx3XDZJQgJVVUFUtZ090EXIZZsbxAyEdgBZv49CLN34VCoC
	TdjkWMwXodvFRyMyLe9C0LOOuX2mQ+5MO07vFeOAODZ4e73PcOn6T/z8PNAxd8xssQ44=
X-Gm-Gg: AR+sD12Zqg4buy7GyYyvnZHgQlGiuWkZ79D9uAncO+H84qkLSdqDIsbQcWPC/dwc5YY
	yv/dNyigDwZXJalrOXuB5zm20HHqKvTcR8pSQNJQykUxDUCN6xC73jwzlaUw4qyiWtO7IAU7J2n
	6tYIQz1yEjm1SRpGLmxIaKo3OmzdcviMKOivLZJf2igDvoEEvXNupqEgOC7feqWl+jHcq39XRii
	W2vr+m2mqISoQzQygvR0zsYJ8QMyfKrAkmA8nhOVg374zXYJoFSso/sY/m0awbqN92BgN1DQfjv
	CzY/PrlYU5HY9999xyPLYPCe+rlPCWAwpWhoCAFcWd6CS2VLLXyqWrwk3xzja8RP7THbYTyz5cI
	zWYWfDRel7IdN3oQLEwbCfTeN7ksAlo4qQZY=
X-Received: by 2002:a05:6830:2644:b0:7f4:bae7:b00d with SMTP id 46e09a7af769-7f77c3d32edmr5060979a34.0.1788360322526;
        Wed, 02 Sep 2026 07:45:22 -0700 (PDT)
X-Received: by 2002:a05:6830:2644:b0:7f4:bae7:b00d with SMTP id 46e09a7af769-7f77c3d32edmr5060940a34.0.1788360322056;
        Wed, 02 Sep 2026 07:45:22 -0700 (PDT)
Received: from hu-arandive-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f74caad7d0sm2427286a34.4.2026.09.02.07.45.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 07:45:21 -0700 (PDT)
From: Aniket Randive <aniket.randive@oss.qualcomm.com>
Date: Wed, 02 Sep 2026 20:15:13 +0530
Subject: [PATCH v1] i2c: qcom-geni: Clear stale TX/RX buffer pointers after
 GPI cleanup
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-i2c_double_free-v1-1-0f582ef32e55@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAHg2mGoC/yWMQQrCMBQFr1Le2sBPFpV4FZHSJK/1i7SS2CKU3
 t1olzMws6EwKwsuzYbMVYvOUwV7ahDv/TTSaKoMJ64VL9aoi12al/BkN2TSiO+DBH9maxNq9co
 c9PM/XrFa3A5XlvBgfP9W2Pcvh+vTu3cAAAA=
X-Change-ID: 20260901-i2c_double_free-09ab0b97e61d
To: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: naresh.maramaina@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Aniket Randive <aniket.randive@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788360318; l=1839;
 i=aniket.randive@oss.qualcomm.com; s=20260325; h=from:subject:message-id;
 bh=2XSYd+uMeH5gLakhM/d5Rj7ofyalwIJWFXM60UvRoyg=;
 b=5h5W2YkcbVmFfnSC4JOb1Q8CMLT5cgcG6+5iN5wnZ4Kjh9MosBoBn34wkyqzQ3tWv++9eOARf
 uqY3rd7vp34B9x4DJT+vvgt3M8GZqgeYsVJDl6p63tPILpAw7dAaf2i
X-Developer-Key: i=aniket.randive@oss.qualcomm.com; a=ed25519;
 pk=4o37X1ZqGbCO/T2SR8kq/HnWvq0yb1RUlFuNukovbQk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDEzMCBTYWx0ZWRfXx2piJklEOug3
 n1LsSnkTi6yj9m1pL3n4YLNRaMExuxywWCrLfOic10rFhtRb+CkIVPb4RjUtfc8l9KgFin8tfFi
 cRThNpruuQTSBb5iO3oStlLqxka6MNA8a/vfzcGXigGv9X4clEJy9GkUZRYY68T82yisXQW5SKC
 0Nw3z5w9bYFrN8pcVGlTCaZZKp9yndQYZA/cnkXb/Hmm8Lj2UINRHABP0XPtW07zhDXZvufWcqv
 f/cr6fB2yfUzMTtmTaH3Cfgo4P9p/Y7G4qJPhKfdr2CGPsceSi/a4qLAE2Ti7fd1ZW83MZwFYlB
 8AXf+acERMuYjxwN6s/Dd2iflEILvzD6nx7/MRndXa9cf4bx4NlPA32IPxyMu2oYev56l0FZ5P0
 sqZNdQgV6gGQ1g642xOZb7bKeGLKfVrdsod3AIdVnw+jEksMxQU+xfSqqNt8p68luJMRGF2dQsV
 G/Z4/p5R/Ai7Ic0arbg==
X-Proofpoint-GUID: NF_Rm-KF_Ae9L9CgkTpZOhbDJnfWqa1n
X-Authority-Analysis: v=2.4 cv=D8N37PRj c=1 sm=1 tr=0 ts=6a983683 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=jmCgmGzY3TN8gweiy70A:9 a=QEXdDO2ut3YA:10
 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-ORIG-GUID: NF_Rm-KF_Ae9L9CgkTpZOhbDJnfWqa1n
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDEzMCBTYWx0ZWRfX3WwDL4m3+j1j
 LWdwx9mgPKlxg3zSTB/DQs4oNBwDQRhZoKTsATGjNJZptqj5AaNeZ6vLOwie+qcZedyrp5hJLBb
 HNDgPF2+4DhR+SSIbI5cXlqPs8b6Shc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_03,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 spamscore=0 phishscore=0 adultscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020130

The TX and RX buffer pointers are reused across messages in a GPI
transfer. After a buffer is unmapped and freed, the pointer is left
unchanged. A later message can reuse the stale pointer in the cleanup
path, causing a double unmap and double free.

This can happen when a READ message is followed by a WRITE message,
leaving a stale RX buffer pointer behind. A similar issue can occur for
the TX buffer when a mapping or allocation failure prevents the pointer
from being updated before the error path runs.

Clear tx_buf and rx_buf after unmapping and freeing them. This ensures
later iterations and error paths only see a valid buffer pointer or
NULL, preventing double unmap and double free issues.

Signed-off-by: Aniket Randive <aniket.randive@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 942cfeee99ba..4965872b47d5 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -911,10 +911,13 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
 			goto err;
 		}
 
-		if (!gi2c->is_tx_multi_desc_xfer)
+		if (!gi2c->is_tx_multi_desc_xfer) {
 			geni_i2c_gpi_unmap(gi2c, &msgs[i], tx_buf, tx_addr, rx_buf, rx_addr);
-		else if (tx_multi_xfer->unmap_msg_cnt != tx_multi_xfer->irq_cnt)
+			tx_buf = NULL;
+			rx_buf = NULL;
+		} else if (tx_multi_xfer->unmap_msg_cnt != tx_multi_xfer->irq_cnt) {
 			geni_i2c_gpi_multi_desc_unmap(gi2c, msgs, &peripheral);
+		}
 	}
 
 	return num;

---
base-commit: 89c07d98716a13454ec3fd9f97689e812cc71bd4
change-id: 20260901-i2c_double_free-09ab0b97e61d

Best regards,
--  
Aniket Randive <aniket.randive@oss.qualcomm.com>

