Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793353657;
	b=GN4cniM1+yeD+C821L/ZKRPvCzB1ao6PIKbtmTRgIwvbEgo9CYzE8f52Krb+6Ln3yz9B
	 W0st00R5TxYVSmgOZSBCMKiFXLeSUxxSP6/TLkbHQ2A+lybPtC1xFbIK6j1LiDQnATcVA
	 If2l+7Hab+YBMTVNQmPRFpl9tne7GXHUS4lNmaslzushrNkhJUPEGtb4+6SzbZ5gZA9En
	 ByTqNr3ufaOpnx34gOgVxP8OhEeYnunk2ZkVZk9bGO+w+NtPv3oVKT2BLtNrh8fYWudA4
	 Hez3yyEaQOZSJmcRwmN6GeLNkjrVfbSr1xCYo7uMmcTuegYZ28aA+8ocyh1QBWpP/HA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793353657;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=yAuzy/PmCFCD96ZvLiIzUHqzkYoqgYKNYRzD5tr14vw=;
	b=jA9cwXr1C23sEEFrAan0ZtzXSB7kqIWDl8e00Hissuv/o3DKTzd9GmxHqa5tjkb3FoZ8
	 X1aIG8lNQ2Zq1HNn0EvrAm8EqmyauB/rK/yT3rldmESQPqzh+Cwp4ohf3rnKg7zsFUc90
	 9cpjRJUhv573iXBGrt7zrnrXRzdxW051SQ7yC2T7ljerHgpwCW9HFFOx+Wb0HWQEQU6C6
	 ZwjAZMeo1QEP6ZV8fmdhuzmTlSrXO9NcgtoRnT/h1YqAyLzfpRo2w/t39euj7lZsklpi6
	 R8c7zt72pQt9EWiNspU5r/PVl+fwOBBF1RF1ZqcCAxrrdrvYgmR0nY8fqyfWS6snV6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F33gHJe7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WEt1MuEh;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A0B7606A322
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:47:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A0B7606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F33gHJe7;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WEt1MuEh
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U8F9642374161
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:47:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=yAuzy/PmCFCD96ZvLiIzUH
	qzkYoqgYKNYRzD5tr14vw=; b=F33gHJe7W6G8acXNd7x6T0F3xPC62qRzTmHY50
	nP8dnv15vNczyHdGjPHaPhhQzO4weA0HvuAbJyks6USNDJjRpU0hKzB8jX3gCx63
	UnC1OFxLfLXJS57O98aXgRNZPdreuEM3vWY/qB0mhtoMzWWda3OFc+5YBz75a8sS
	MlkkTVAKp+fpbUEbMYzy+WXE/8SeQaP/G/EOKCukmYoDsQjUw/flCY0mxRisnI4a
	+j38uyGBZT+Dc8rM/bmphjYA95N/achpt0LfdfUzrT9JTAYRcj1ctJn95XuZf5XV
	TBL8SgjJGsy4lvVUSXtOowXQsSnnxrL5oG7FtrczdQOhGhRg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qja7c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:47:35 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f5844cb60so106386185a.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 02:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793353655; x=1793958455; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yAuzy/PmCFCD96ZvLiIzUHqzkYoqgYKNYRzD5tr14vw=;
        b=WEt1MuEh6Zlykbu3vcNIDwfU9JTFVZJDwsisw8P+aoBmVtGLIyAlEFNLrLM3M/BwRM
         p/HQTc6wF8I0riSCJ4149rYUmBosE5bB0uHJoFE2n8oWwsNWa706kxhNLzpjuqAcCgmQ
         /XslZfWnFmDXv8fLDGM4XO6kNpIwutS5dH57khzRminD6J/ilRdKoi1cRxnEbBRbmisy
         QPXX7vuc3x5Wxavw5ryW6dAvytjWVlD+rPUwgIXXHIxUMsqiGXBfO6SmDbr9bmDrJGaP
         dg7RbSUA7eGIP5oC2UB/4HajFh0aosdHdA6akqTQvNHhXnqTcp1RNR6EwGw4emXF3eX0
         OFxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793353655; x=1793958455;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=yAuzy/PmCFCD96ZvLiIzUHqzkYoqgYKNYRzD5tr14vw=;
        b=Or5ur41kufOC7BZs4VYj4vEoi1xoI5AhcnuT08X5zMEQ3kdGnXtXERnEZe1Dv2QvC/
         F72tK70WCF86EUEQ7wtXpqGDqPwQFayJaKHR+bkUYWYjuT4s+MVK5fr+FuL0BdGS2++u
         XGrb6hQObceKHeJvH2ZPTAHeHY5X141QkHcv14B0KerZ8qFH4OIF/AzgkWR1gVFq1NV3
         k+FSgtYQE4N8IQabj0/SstwCWRHA65YkqIbo1WliozgiuPz+MWMRrapfOLUgMgBhlqnB
         z1RQjWQEdwoAGMTm4v8sxqkIoW9uifRdmbvNAkys3AWEo1eb3CFUzgRhhTjTI74jL1W6
         mjnw==
X-Forwarded-Encrypted: i=1; AKwUvBwDte8clZPyRxYtNbsN+3ToEL9aDMY2x2lorKVwCKkXdeSa7ohpK4MGGzu4gPzMpA+0jZiUDSaaLDZlsJs=@vger.kernel.org
X-Gm-Message-State: AFq9FYI7/b5L/gL/W5LOoAWMMueGUj4Ub9m8tZWBPUuE4l9QlTEg974/
	HsTHllN2/PaAwDifJ4lzQTI6IYLgdynJ7AKl6MKF9oOuzI1LYE/UfLjVUghhbMEQDTcqqFRhceB
	1X8UzfpPLy5s3pJPQtnduioUNNC69JOuEFTJldfwGu95Ws+xcAv/KBz6BhONVlpgLXa0=
X-Gm-Gg: AYBFou1qOwurTGtTRjsUpaz3EZmKyR7Kh3oKU7er4Uk4KosXNOwCC78NC+EaLG5WupA
	QfgL3NGd7dgkWckp0AG15k/BSaosBw1n/ltivxIwjs7bb2ObWmeUNIBo+sJSzedYhC3+i7z8Zsf
	u7Lcq2UR1wbxLsU8jd0G/Wn8X0BSYGsuC1i3VRJT2unxqrJv+ruPfR6rswIaqD0y/5vKC5/+Nr7
	lQU0rSojRpHY0ei/toRnrJuCfa0vn+iyFXuse7UTBTbNpkR9SfA5eCRS4QM/o57FZ/4XMOwYgw0
	SsV5fbDtoaGbBkfCnDeqaEbzhl703qn9MyBNMIVg4IopIu8P1KL816F9Jmtmwl3z2w6k0aPovoI
	6vdceOs1Ah/+RsBZXrJjk7iz3gBER418tMNRh9FgT+EVRnGjgzOlnZvoddCaSf0dpXQgx0JayvM
	jqteuNp3hmvF7gFvArRLOzmElD9xpdyZS2gP3ED8/Sk9HGgO2ifU4uzHQYSuCUm4KAKOmmsjUQm
	qG0gSF0eHqPEI69rABke/6HAySP
X-Received: by 2002:a05:620a:2628:b0:93a:1196:ce5 with SMTP id af79cd13be357-944133c93b4mr695058885a.33.1793353654704;
        Fri, 30 Oct 2026 02:47:34 -0700 (PDT)
X-Received: by 2002:a05:620a:2628:b0:93a:1196:ce5 with SMTP id af79cd13be357-944133c93b4mr695056685a.33.1793353654246;
        Fri, 30 Oct 2026 02:47:34 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:9d77:8e43:b62f:d85d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abeb77c132sm35354695e9.1.2026.10.30.02.47.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 02:47:33 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 10:47:31 +0100
Subject: [PATCH v2] media: qcom: camss: vfe: Clear active buffer pointers
 after flushing
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
Message-Id: <20261030-camss-fix-v2-1-51fe96b348cf@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIALJn5GoC/22MQQrCMBBFr1JmbcokLQ1x5T1KFyGZ2oBpNKNFK
 bm7sWs3H97j83ZgyoEYzs0OmbbAIa0V1KkBt9j1SiL4yqBQDRI7FM5GZjGHt+iNVoPRNBskqP9
 7pqqP1jhVXgI/U/4c6U3+7L/KJoUU5JzU2PXKo78k5vbxsjeXYmzrwFRK+QJeRiTUqQAAAA==
X-Change-ID: 20261030-camss-fix-4972697ef90e
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Todor Tomov <todor.too@gmail.com>, Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=KsrYSmWN c=1 sm=1 tr=0 ts=6ae467b7 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=c92rfblmAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=3pNaL92NREA4lOQ_sX4A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-ORIG-GUID: -BkXwhw0zQwSi4r3eulf2aPvvi4JhPWD
X-Proofpoint-GUID: -BkXwhw0zQwSi4r3eulf2aPvvi4JhPWD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAzOCBTYWx0ZWRfX78OGMd6gMKLP
 ixWJC5OcltsWdElcntqud2QotBV6NWXmINVIAnPvX9QGCQpYy+LNpYYoFN5F8SX+HIgdvJRdS7S
 czXfJkvElloQMbKb4/WpyyQ7w+PAzzm8bpRo+mI3rHGPpUQMgGtoVtYpy+5nxdiKUvUiR7H97Rh
 X/Kb+ouwSZBUXcr6ReGeMfoHJjxWxnmPI9JKqeuhNivCu7PZS3GvpL4Gw2v/DCyI+qz2315+/Pe
 x2VgqDi/cNUQhtISV8+GiIr4tBaie0TmtdIjnNO803+/6UNI1RyZwPRQq7pqXjwihPiEaB2e7Ye
 jwPncWmiVydscxsLAqTl9d+5J0IngbQmpv9sKscefOoxS4DppkBNx8tfI9nESrw4xkFBi/5rk1G
 FlgWZ69HDYMJ6thpDqjM9k/Jd+gmuCKNeqNjVtaL/bbMmWqKjMfAj29YAmSk6qgn5nVAhqUu3wh
 9aC3Wqrc8IsriXuT2GA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAzOCBTYWx0ZWRfXzfl8pLtjdepe
 n09dtEyIjAD/oCMcJBl1SFrETtkIzRxTkFDQAJOrz827FiFiyAyOW7JlOdkjnYBB22AuzYEDkse
 qo6iGQjKqjv9Fh4GeyB3zXLpYfX/OzI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300038

vfe_flush_buffers() returns all active buffers to vb2 but it leaves
output->buf[0] and output->buf[1] pointing to the completed buffers
despite the lost of ownership.

This can lead to subsequent flush or completion paths operating on
stale state and potentially completing the same buffer more than once.

Clear the buffer pointers explicitly.

Note: vfe_enable_output_v2 is supposed to overwrite those pointers with
pending buffers when streaming is restarted, but nothing guarantees that
enough pending buffers will be available to overwrite all entries.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-e617a776-3d96-47cb-8d60-a769340c25a7
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Fixes: 4c98a5f57f90 ("media: camss: Add VFE files")
---
Changes in v2:
- Remove unrelated changes/diff from this patch
- Link to v1: https://lore.kernel.org/r/20261030-camss-fix-v1-1-ecc170342d0d@oss.qualcomm.com
---
 drivers/media/platform/qcom/camss/camss-vfe.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 2680a9914765fa2c8f3c2b38a5f4f0e0bcf4d873..8e297e2bcafcbf30b09fc2ad6e57f484a4e41898 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -1187,11 +1187,15 @@ int vfe_flush_buffers(struct camss_video *vid,
 
 	vfe_buf_flush_pending(output, state);
 
-	if (output->buf[0])
+	if (output->buf[0]) {
 		vb2_buffer_done(&output->buf[0]->vb.vb2_buf, state);
+		output->buf[0] = NULL;
+	}
 
-	if (output->buf[1])
+	if (output->buf[1]) {
 		vb2_buffer_done(&output->buf[1]->vb.vb2_buf, state);
+		output->buf[1] = NULL;
+	}
 
 	if (output->last_buffer) {
 		vb2_buffer_done(&output->last_buffer->vb.vb2_buf, state);

---
base-commit: f1ac44c32cba88ad65dcecd4a279661d14e93651
change-id: 20261030-camss-fix-4972697ef90e

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>

