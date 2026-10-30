Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793391232;
	b=dlwcfNLwtZJeksgveWKSgzrCDT+wfkrjOWU8zEGjS/eUY/BH+lBQZDjxI1BjAbKTCkKE
	 WRMMWaZr77lShroxbcc5q9viI2uM7QaHAtWR7T5BMaew4aUeVVGTqeuJ0JxXgRJmxBzSa
	 MYM61Zf/Ywy12UQ3FeOZoT0tSOZtNTDrHLaboJYUAyy0QXGM7rmizHqf9Tzm+O1OyjG8r
	 7a/H5NQrwmtBR513VtYtfxEUELY7m5wYWip1kmBkshvAgtI/KcmG4Tl93a3ban7LNN64j
	 +OXefujFgbpX+0p1SYAwRlugUGD5sNXe97wvrwFJA3oOeHtBN9weTYTHLo3my1wS9lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793391232;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=HA1eqb/XMMKqnq98MchSvo7KllgtgAWstr/4IblL2f4=;
	b=aT9vShKlWjno68kk8l9m3jenqH7r+fs+O42t2zE0X8RFdOe4oXKwkOKr/CJT6LdT1SZu
	 rtlN4sonet/pjXrxM2DKaHZLjB75NjBMO5yVzaGlbo+VQIVPpP3z5fbETEW3De2tpoTgr
	 qWhnJZmxjm8/X6vSOs3lCvD4Iz2n5yWvsXVeyS0BOe8iKQRM6p2ZHRusWXUshmaHY/xEy
	 3QIMxFcX9GJ08RDK3ofqFmyxwPyZwSBrxHTLineEAXR+UtmAKBc3uNv/TGYEsrnZSTJo9
	 c1BTohSnwv9MW6WqaqVFj7c6i8W+JrKc9O+K3HV9bEqspnuqHjTYnHdREuch+XF0wEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lkgSY1M8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bg95L2Ou;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1536606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 20:13:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1536606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lkgSY1M8;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bg95L2Ou
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UIjHtL3059942
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 20:13:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=HA1eqb/XMMKqnq98MchSvo
	7KllgtgAWstr/4IblL2f4=; b=lkgSY1M8cPxKpiTP/XBWmg2OyBpx5lmPo6d6fk
	gWV3HBZLnpGUSj6z2Ma27dg8OF9gpW3F1OA8GpccA5GXswYYk6JiJVERpKsTGr7i
	VQLAGCuKsRm1NJLoqXasC8nibNT/sRbTv9cfw/twGk7dBlXHSqodkshRMmQygExU
	W0jevctbtKQd0gxeOUga0qkgkIM0kG4NUOOLptUR8GFjUNO3jcwRuSgEm6pcGad/
	wWVEjUvHwdD/hpjPxBlYLF6jGbIykPpy0StL4CzJWwGD9bTP4INNw64amc6aAzwJ
	X6nAq79kZdiUMyFj5TMejR2yI4uRPOpDi1t+/cbVQbjhpxqg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn0sxg8f4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 20:13:50 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36a223755e4so4299624eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 13:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793391230; x=1793996030; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HA1eqb/XMMKqnq98MchSvo7KllgtgAWstr/4IblL2f4=;
        b=bg95L2Ou1sl3OLs/lLJbqMddsEs18v8FHO1Xhl9Wh86u90t2KAr9xJprTrYA6rVe4E
         PhqjA7rWAU8LMYq0/DCmvgcYUPYqT7CyaFSXss2BFc+7TsQI3Fru2EeHwqdn9NVkHk8K
         sSYSHbg9EDreL9TGcvaonbiCEX9fZEjDcn2K75rwGKPO6tesFmqK3BxV447dleAe0MDp
         kjQGFLe41Wt5gn9wriaZDw8qws/GNibCblKWctMIoSbpap9299hyU9AnY1wEeOeNa9vz
         wn/Iu+UNVP/Ry3fZKwP8TzMhFx64pdfZRV4mCtz4leOsVfy4mHX2YmIx0hxK5paQFmfy
         377w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793391230; x=1793996030;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=HA1eqb/XMMKqnq98MchSvo7KllgtgAWstr/4IblL2f4=;
        b=rk/O8Hxvf4jTyVyqbnrWtfvCCCDjA71pVF0y0TWxW+HuQ3awaN3N/j/Z/xCqlC1JmL
         ZPaTpr/G4hwSuci5pOFB5YVieEkOghmEvOE4XRzKcVK/k8eS3go2MyTpyJwr42VOlbEP
         t2E9qpBSI8rI5JxUSfKqwGJiBlzhBMXf7RPMdFe+mASg5fzU2yVyKsGdzrjFt0lSlykd
         YBV8/jEJ8hhTyT24RzypMpkaxxfUM2+el8awxYlYGLPrjxSSSrCiQoJszQkpoQf1ZhEy
         fk92w7NjbZtLRyi/nYgpkquK4HvbzQjLXXeao02wyL7QxGfTuST9ofzhQvSe0FfoKW09
         mGJg==
X-Forwarded-Encrypted: i=1; AKwUvBxo9MXwSA5QaWa6UhIsP/29azd6Zwuch+Adx8zVIp4zc9yxvSTlUHm9oueLawKdplNFCpbuMogWDTEKY9o=@vger.kernel.org
X-Gm-Message-State: AFq9FYJbVTCIXMJT6Q/frXDuM3duuafVbHrG794LfgDKSoUYhFWtlZNK
	o6j7i6XyTNOxL5QjrLjYR0mZ004hPQFKwILJS41Q+hNVWjvE/BSsdNEy+255Zi92CQ/pZz9k3/g
	o7EZ/JfKl6kaL2wjfAJdZ6Ywbd3n4g9lSpx0kMCv3hJutFrr0fWzN6halLI6388BFzOBMQ8VXj/
	0=
X-Gm-Gg: AYBFou3/+VS4VcMTKnWBrkaPacWZQ7KAufPxDDPWCVKNwM4Q5S4s8z9vZ+Jv2isDwQD
	lcL9/aT7Leq0c1XIl6bPETVtYjy7/TjhSYuHg02Nq0JgS97I5JZBr0ckBN7oocmU0PgB/Gt7T6n
	ZKnIpi+E4PB10Da++VnHU/0bC48g0X2AGAW7aj9sBXKm1+XlzTHAQeAY3Wozd7R4iBpoVfwJZb+
	cnpKqa5pQbcZf6wpTYMRg8x8q5ztJqT5Mdo0mejE3FQz0Amkcnx+CmZaEo5TlfkJqhcPGKP/2yX
	RAVSkwpd+1u9iPm9kedMdZyCPu2ITeJStzhhTtE79CgTrLNRSNn5/65wlGLLGLZ/jzYIk0NztnW
	nY7RtAq79/nFRDYw14LVbCpsiiyYvbjBmaY/kNkVQBNUrXHIo4ZeuOLA/Hgat2dNkoH8GqK+E87
	Gsmaudd7Y=
X-Received: by 2002:a05:7300:3b1a:b0:351:52ec:60ee with SMTP id 5a478bee46e88-36a423f04b7mr7266634eec.28.1793391229285;
        Fri, 30 Oct 2026 13:13:49 -0700 (PDT)
X-Received: by 2002:a05:7300:3b1a:b0:351:52ec:60ee with SMTP id 5a478bee46e88-36a423f04b7mr7266584eec.28.1793391228573;
        Fri, 30 Oct 2026 13:13:48 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a4291e38fsm10830527eec.15.2026.10.30.13.13.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 13:13:47 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Sat, 31 Oct 2026 01:43:06 +0530
Subject: [PATCH] media: iris: Fix encoder reference buffer size calculation
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
Message-Id: <20261031-fix_enc_ref_buf_calc-v1-1-54dcba5977a8@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFH65GoC/yXM4QpFQBCG4VvR/LY1bCi3Im2MWUZa2j1OSu7d4
 ufT1/eeENgLB6iTEzz/JcjqIrI0AZo6N7KSIRpyzMsMNSorh2FHxrM1/W4NdQspQq50oSsstYV
 43eIqx5tt2s9h72em39OC67oBln8WgHgAAAA=
X-Change-ID: 20261030-fix_enc_ref_buf_calc-c0e73537063f
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793391224; l=1534;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=FkrOlZDI4iemUsKsTYD08B3bK3zXEhsXGUqFdQMVOME=;
 b=TeQZNyEQxtWmQVIiYDHCHhn6k+6czHWhBNKa6y7Pk2TgVsh5QA6cnRpt3JP8gkvh+MGsiolWL
 wri65eXtzUgDLxHavH6m6oTKKG+NjbdN1+4pILk+k4WDVS9rh6Q4Jz7
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA4MCBTYWx0ZWRfXwp2r2MRvfux1
 vVScsEtIWa6VEjHU8ASJv2QxmrAHPHPXpOsWRTw5/w2Bu1t3ia2Fldj8yN0msDLFKWMca67SfNg
 LtWRLAQgIJjN5yIOcfsvCNK5YmQaR1EETOrQ2JTh3hRPs84x3QBUbE7SM3n2ZQJ4clKUaz25VB5
 vnwZ0F0LSqv2t1IE18VuQ3j+a4pmw7/MgCBiMg4wAhJSQCV/Co28ZcwWM0L0NqOpoi5zQPs7y7i
 XkVfrmKF+6VpVeKCGwc7biT7pbiD7m9lTutP4TUj28hQ1LqpLcoNMjdGP9RwYUdJoAV5fksYIcE
 qc14kjqhdlPkEO1NBkZAbhyRQA0suL5oqzS8w8KJGVseuBA+wDgoxzVKBCpbCSZQPa0/U9ERsco
 15EeIA8C4Z5FrwuGAB9RkGJpv84Ek5cPwpm4IKfT73tlc9N32WWGxbQggxLkiS2ZFSn4jFFW9FD
 mgBQE066ZO6nVcXQ8TQ==
X-Proofpoint-ORIG-GUID: QENL6cz8EeLJfwUlQJi0hHHVELdokKZJ
X-Proofpoint-GUID: QENL6cz8EeLJfwUlQJi0hHHVELdokKZJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA4MCBTYWx0ZWRfXxjg3EZ/SvxT6
 zNcR+iyOAiDvrlHYdvlrHfb9n/1dyAjuupOPQ4GLvS0lOruRLvybeinoubUx3Bp5B+wES86Z0iI
 tn8GqbTCZhbs1lUbJceQOdycaMbv1N0=
X-Authority-Analysis: v=2.4 cv=ap0nmiZV c=1 sm=1 tr=0 ts=6ae4fa7e cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=55WMKUh_GWMeySVVs5YA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300080

For frame widths that are not multiples of 128, such as 864, the
encoder reference buffer size is underestimated. As a result, the
firmware reports a session error when starting the encode session.

The encoder requires the reference buffer width to be aligned to 128,
but the current calculation aligns it to only 32. Align the width to
128 when calculating the reference buffer size.

Fixes: 61528e86687e ("media: iris: Allocate and queue internal buffers for encoder video device")
Cc: stable@vger.kernel.org
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
index a8170e5fa9e6..2eaa2218f6a4 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
@@ -1517,7 +1517,7 @@ u32 size_enc_ref_buffer(u32 frame_width, u32 frame_height)
 {
 	u32 u_chroma_buffer_height = ALIGN(frame_height >> 1, 32);
 	u32 u_buffer_height = ALIGN(frame_height, 32);
-	u32 u_buffer_width = ALIGN(frame_width, 32);
+	u32 u_buffer_width = ALIGN(frame_width, 128);
 
 	return (u_buffer_height + u_chroma_buffer_height) * u_buffer_width;
 }

---
base-commit: 7649ba73f9e7e1e04d0b46213e39c79ae09dd55c
change-id: 20261030-fix_enc_ref_buf_calc-c0e73537063f

Best regards,
--  
Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

