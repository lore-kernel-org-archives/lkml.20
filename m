Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793193862;
	b=cWK+X/pcy6wJSHB/dKe0b8AAqYqX5O0H3ep38QhGgJ3Iz7tvfk5hzNDpppBIyyjJsU85
	 geDa8CFnBKv7wen1wlajTaNj+MKPABcecgZTqCovk5R1ZBneNkmmRsjWSc3ofzOlzyZNa
	 rxqdrkYtOKmWcIKgplXtDpGz8qEMbpJtbpwZV8xFbJe7EisrLMmXpruP9iyfVALvJ6a4+
	 Fibzh7sP6v8Ic0q9aAUAXAghicljraHMXrFfWcjoRkVHPLWzTNNsabofbV63HoUcnWtMJ
	 +ePmB/UfBwJZKbYiDUrzLg37nwop2TxwAKkDsJAoPpopHf1ymmU5+0VoZaIIrsPyM2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793193862;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=QSj8rOP+2chmhd4OaxMY8VQerZ+RGTF3X9Nqn35HPWY=;
	b=qAqObgRuo/dfGZ608OuASlefUX0pUwfKOaNmplt7eEXJsu1HSztLIjA2us3yt1bRr5yU
	 g+VhZSnwHieNDgWe3RTnlJOTfrIwSvDZWCsU2EogBtvJWIamUq4123hB0IJcX+EfGEr9w
	 PYU00lRRABpru0Q4O+n2BV0PTQWvInjGUnY0HNVMzVaV9u3GiN+QMCh3k7t5Gk/Bgqq2Y
	 L8n8AV0KDGyolcL00wkaB+mALj9psLCmgB6sprgiQmXmWMhjaBVzPoq8Pdm9FPc4LAc0w
	 YAuHXtEA5Fp/DFHJLE84uMD3dsqkyIW0mS/7Uuo+glqfYFD4lAPsjx2VGLwiuY64vtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IHvZhKV2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=joKTF+B5;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9776E606A327
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:24:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9776E606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IHvZhKV2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=joKTF+B5
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBe926994831
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:24:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=QSj8rOP+2ch
	mhd4OaxMY8VQerZ+RGTF3X9Nqn35HPWY=; b=IHvZhKV2Nu7BJokwsqkIlNoxoeS
	bkqPrfGjXnhUohH08rH/pmuej9nYBQUdaCtILj7rQOTfXFiQyvnT1enzAwFGTd+B
	ogrXV8LqBy31Dt+y9XvSwBmYJsH6PjJVrHjf7u3k68HO+qcmnLQfcJ3/PH9wKjcb
	fCAMroASGnwNbvC0UFq+m8Ccz0GB+X/wzDh08feAHWB8lw0tgT5tcHe4YsN5e6/f
	Z6u2MAiOphz6WkX/wy8X9NBIgke69dhHM4zy2i7DmBJIjYj0MG7XbNGvdXgyO5pK
	9nPYCzqdqQRTizTpCadS1X10/UvWe3RIyqk9eH5aRpIEU5Iwh/8VDDvRu8A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk82tt7wu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:24:20 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9308eafb465so168575485a.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 06:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793193860; x=1793798660; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QSj8rOP+2chmhd4OaxMY8VQerZ+RGTF3X9Nqn35HPWY=;
        b=joKTF+B5z7aTpudTGV9wQtmBen5Q1QtIs6fkz1UpBP4rGFJAKL5P+NZRQFoTlgmjhI
         26VRqIJbL1Yc4GXYsyKyrEFCramB+SE2Xqdb4Mb5DnFZYD0AOC+mvQ38mStjZgymJKpn
         47hvtwu+/1H+eIP2uPLy96Pmx+qp1i79/lOr/plNoFnHwB2glrv8Mx0f1OPXPXhXY3bf
         oF26SWT19r3CWKj+gbeWAOCP1rVdrArn5H0Dj9bx2RX8j7e2ZFQvO3IB9u+/qph0xAqQ
         wztIRyjHgSLgwldvidCZEoeNIjipKVXs8P+Zvrl0HDb5lY+5AumZApJYSrR0iK/CPO2V
         k1fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793193860; x=1793798660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QSj8rOP+2chmhd4OaxMY8VQerZ+RGTF3X9Nqn35HPWY=;
        b=POyDlzti/GjR3NgaL9pcWkx+2bbGI7Gj/RbGtso7FUpaWpxtwet2oUz6C2nsVDthqH
         DlrBWKCuCp4j0cT5Ab9xa8nWQSN9rJW0Um6DTfTWCFxEsvd0aKlRQ8wB45dgy3hIQ190
         aQ4Xdu7v+2KZ/nzBK+dugR/COszPSmJ1Yz5BhPtTivZ+ZHmHI3+KecKGvxe0/qNw+RWB
         msOhIEItK9oYYnHgoE5WvfqWeVJlE2R3VILjA40FGE7uJJil7iZyhWUhz9ZxruuDI2SN
         c7192OAV3SprwW1olM54U1ju5rznKFabF+Fwxs2PLYF68Hj26KOFO+uP3gigvR3Rj/al
         NeZQ==
X-Forwarded-Encrypted: i=1; AKwUvByjzt8QOxqkK+4cmUjLNcq4SG7QkcPKBh8AacU9gz3uG5sGDQ2GLfHe9RARLp/1Mge4PpCNjYo7L6W47sE=@vger.kernel.org
X-Gm-Message-State: AFq9FYK6P1ObV5vmTGjmoqr+4oZNCQtC6CKrarPrdrM8buDpMapr+oq6
	G0p0vPaZr3K+BMHx4tVL9OT+BYkdGGd/VEjA0xSZxTLZ4eqOCW0lOCf4r/SqIDVvYoGex30u1aV
	oNBVXsIJ4ze2JGTIJ8Pqc1izx0BbxdydYE3OTm0aK5baVt09CUjugr1YfxbcjIbsrnbfBydj6VO
	mThg==
X-Gm-Gg: AYBFou3g79ym2vt3xhP8pTK2ur6DRjDtNcby7hLLH3Dey1M3h4RFv70MapOKc9ORhnd
	K0dPm5xBifomWrcW26xdGp0KTI5Y36ygIaGVNZFBHGlsf///OiclA2CPxXeqyl5MG5S0H5nmFPb
	/LiIere0ChM8dEaxjyCCXqAUYExeOpmmokFk22K72KeVMzdcmiDBpQ0ekTMnpEutyk2aj+OrQqy
	pTWR6BYyubM+S1oPSdwPr8GW3QGeP9BOwKem1ewV+L8ht21CPTPsnJ9J4xEW1/RCVsJr23KO9yu
	+VxyXHSaJO4ud5N3U7/YJsprj4P5lDnOGiY8Yc+qkUrldJ8GShynWzn+XPmUEFptWITRfrSQniy
	1B7Kg9v9bM5W5FuPmZRuoJ7Bsifa+vL1Ru3xAjkM2L8IB0UUONG0hUFGEBCYNjTOJ3GkB8mnouQ
	==
X-Received: by 2002:a05:620a:2720:b0:93f:26f6:6bab with SMTP id af79cd13be357-94408a80789mr303300085a.18.1793193859885;
        Wed, 28 Oct 2026 06:24:19 -0700 (PDT)
X-Received: by 2002:a05:620a:2720:b0:93f:26f6:6bab with SMTP id af79cd13be357-94408a80789mr303298085a.18.1793193859393;
        Wed, 28 Oct 2026 06:24:19 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b496435c7esm1457824a12.29.2026.10.28.06.24.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 06:24:18 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: atanas.filipov@oss.qualcomm.com,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 5/6] media: qcom: camss: sm8250: set the VFE AREG clock rate from the VFE
Date: Wed, 28 Oct 2026 15:24:02 +0200
Message-Id: <20261028132403.3505037-6-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261028132403.3505037-1-atanas.filipov@oss.qualcomm.com>
References: <20261028132403.3505037-1-atanas.filipov@oss.qualcomm.com>
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
X-Proofpoint-GUID: GQiQyojclvq8L6oj3uq0qMObHnOefghX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1MyBTYWx0ZWRfX9mltlhPje9Ci
 6VzNA8t9FmWMBCdmu6D03/jNSKfrRWiyEFw0suRxtQYSV2sftR2ANf0WUCS3XV4ciHA8nYvE+1J
 BViFEF1FcYiuAqwH3vtMcZFAZCcBEYA=
X-Authority-Analysis: v=2.4 cv=Tr1zFzXh c=1 sm=1 tr=0 ts=6ae1f784 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=QxXRlGHHTI4QcL78iLwA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: GQiQyojclvq8L6oj3uq0qMObHnOefghX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1MyBTYWx0ZWRfX+qUpbXsGHKu6
 P+X7uT9NBZtN8kCUwJf1x/9zFK9RdXqKLu3nDEGrlZYKDVrWNsSUYqImRo4nmppeiXXojI6YZ94
 T6HyZqw7Kklqr6vRU8KDPk+MZeA0W+grx+LmkccTP1zL3W0Lj8jYGWTz4Je3mQ5Mt3aoDP05OSv
 KMJEpdqadOAEtML8uqZ3F3DcA886qTWOxFQocWAaCUHwMeP9AYj0xlO20qVoFT3IIB6j0MXDTZN
 CC6jh1UaKxjlGwtuwgxHYss6w+771+WA1m1TSPyFoMy5nIdzW9mQdPH/OeRTexsvJ1IZbek+8eL
 MLqn+32hK2vqU2mBpBao+RG4+DKb/++ixteQ1xU5tgAqE/ksC82Am1MaOB5Q8ZV3Mk+zwOUiqAn
 r5LJNZu7RV46y8LscO5p2SfS4We/Owu1vG5quz/gT0mWiBp4x5bzSt8MUPh4nd4GLwEnsTNT/OJ
 sA7idiFcPjC8O7vJzDg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1015 phishscore=0
 impostorscore=0 malwarescore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280053

The SM8250 VFE AREG clock lists four rates, 100, 200, 300 and 400 MHz,
in both the VFE and the CSID resources. The VFE only enables it, as
vfe_match_clock_names() does not match the AREG clock name, so its rate
is set by the CSID, which always selects the lowest one.

Match the VFE AREG clock in vfe_match_clock_names(), list a single
400 MHz rate for it and drop its levels from the CSID resources. The
AREG clocks of VFE0 and VFE1 are separate clocks on the fast AHB
source, so a fixed rate keeps one VFE from lowering it under the other.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-vfe.c | 3 +++
 drivers/media/platform/qcom/camss/camss.c     | 8 ++++----
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 46674bc30e6a..6cc5d4e2aaf2 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -907,12 +907,15 @@ static int vfe_match_clock_names(struct vfe_device *vfe,
 {
 	char vfe_name[7]; /* vfeXXX\0 */
 	char vfe_lite_name[12]; /* vfe_liteXXX\0 */
+	char vfe_areg_name[12]; /* vfeXXX_areg\0 */
 
 	snprintf(vfe_name, sizeof(vfe_name), "vfe%d", vfe->id);
 	snprintf(vfe_lite_name, sizeof(vfe_lite_name), "vfe_lite%d", vfe->id);
+	snprintf(vfe_areg_name, sizeof(vfe_areg_name), "vfe%d_areg", vfe->id);
 
 	return (!strcmp(clock->name, vfe_name) ||
 		!strcmp(clock->name, vfe_lite_name) ||
+		!strcmp(clock->name, vfe_areg_name) ||
 		!strcmp(clock->name, "vfe_lite") ||
 		!strcmp(clock->name, "camnoc_axi") ||
 		!strcmp(clock->name, "camnoc_rt_axi"));
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 7fe12049b78a..9e29b713288f 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -2053,7 +2053,7 @@ static const struct camss_subdev_resources csid_res_8250[] = {
 		.clock_rate = { { 400000000 },
 				{ 400000000 },
 				{ 0 },
-				{ 100000000, 200000000, 300000000, 400000000 },
+				{ 0 },
 				{ 0 } },
 		.reg = { "csid0" },
 		.interrupt = { "csid0" },
@@ -2070,7 +2070,7 @@ static const struct camss_subdev_resources csid_res_8250[] = {
 		.clock_rate = { { 400000000 },
 				{ 400000000 },
 				{ 0 },
-				{ 100000000, 200000000, 300000000, 400000000 },
+				{ 0 },
 				{ 0 } },
 		.reg = { "csid1" },
 		.interrupt = { "csid1" },
@@ -2128,7 +2128,7 @@ static const struct camss_subdev_resources vfe_res_8250[] = {
 				{ 19200000 },
 				{ 0 },
 				{ 0 },
-				{ 100000000, 200000000, 300000000, 400000000 },
+				{ 400000000 },
 				{ 350000000, 475000000, 576000000, 720000000 },
 				{ 0 },
 				{ 0 } },
@@ -2154,7 +2154,7 @@ static const struct camss_subdev_resources vfe_res_8250[] = {
 				{ 19200000 },
 				{ 0 },
 				{ 0 },
-				{ 100000000, 200000000, 300000000, 400000000 },
+				{ 400000000 },
 				{ 350000000, 475000000, 576000000, 720000000 },
 				{ 0 },
 				{ 0 } },
-- 
2.34.1

