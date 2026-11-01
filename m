Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793536162;
	b=RKnvKo57uprHWYsrY1AcsQtO5t7hW3AL2Uzou0vlLzW6Mo2gJkxQNuDVXo9KwQkAFflT
	 bCFw7jXAuGRE2ukKFlheV/IGhQUlAaUfLucHSXUZbAKppYIFFMA6GC00kJc9AKKigXDE7
	 R8dUHI7wljbPQspCyOLzMFeOsSc0CbaAgCAGsGc4yZ7o0UeylKj3PT75nv6V0Roibw8iN
	 cywUpzXqiHxRqHw+3RDGblV5mGTH16ZluBlbdWnUwl2dWGjpWr2GRBKJA6l958P70GdbQ
	 433xo81annfFk426SOhkRiUe90blvvq6TBvlypK6n1M83hKPnJX9OwlH7V2q9x/nTnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793536162;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=s8dsnJvXNjRIGa6l77NdEqyDxusRBzLvXdPjG/1gIKc=;
	b=uX68jwqQgH+FZDqImN2KJmsKohdclo34lVT7pQJRVZ/pQ9W1iGbzNkHzWZa+5AA9xS6A
	 vFmziFVbI/IDL8YXGWC2Lw2B1UGtHFjm8CZzfBJJI97n597u9du+4RB/T6VrMeXue9yjf
	 jpYrj+3w38gdn6PdkHaOQ1QRhX7eUYZogeMy93nYd7YJmaqgrrx5XuyIXqQQojALghbzb
	 LTrdSTfwM3x+199S/Ki/9ZmEVp88bRlVeNkjVAWfd9UG4FsK38z3hffDkm0we9gz0yVHq
	 QRA6Ui+CxJSzUJvivt2UGVzsETUPdZRIRXNW7errCeETEuSwSxh8xsF5Aup3Y4I5fYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Vm35cPdf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="cWP4JYH/";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4075C606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 12:29:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4075C606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Vm35cPdf;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cWP4JYH/
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A1BH1Ki3823632
	for <linux-kernel@vger.kernel.org>; Sun, 1 Nov 2026 12:29:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=s8dsnJvXNjRIGa6l77NdEqyDxusRBzLvXdP
	jG/1gIKc=; b=Vm35cPdf/OCNzZbB9Yv6/9Sf+Cb0BeS4T7Dy9xmBpoo22HGzIj5
	076j9gQuMG26epiGfIVv2kw9deA/ZS5NcI+8S6r6ZPmHyEUyjlb71Em34b4Es7q2
	+PgiF0z5lRDnAkgP3TYcOk+CglZGuDiBGJZx3s+9E7VFPtLHSTSERAEEwI82Q74j
	UHbMezTqEX1NuZmSc306LCfVv70SehfTNO12dKOjuWKkuMYBP4sHpaIsDQGFg+VT
	e8xpZ2/wC1H6eBudbmmB9jMyy67pFPiNVIaMNtv1sbSfTFHPrQXT+Q/5Dz2a2tKD
	cHJxvEWGdVTNX4wjTwkypvk+9Yn4j0NaVMA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn8q7u9rc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 12:29:14 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-944138ed63fso354911685a.3
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 04:29:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793536154; x=1794140954; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=s8dsnJvXNjRIGa6l77NdEqyDxusRBzLvXdPjG/1gIKc=;
        b=cWP4JYH/6xEZPM3roQRNcnmkofsbcKqgf1ARmCVCtI3m7FOqWJ1r+dDMM9ErAIxfWE
         1SO4nWKKVXlpY3GBXCa7yAJgjHGzlNmcvVKycETkHXkk5mbpu4S9emakkzoodwOhdGtW
         BV8vbMq3+lFQW8nXdLqp6uTnFo+w4FVKm8N61mE4gF2UmdkeSqct28EG48Gf4mrQBlUo
         ChR+RhOE8XkO6yiQM4slI1Y4+l1QLe/33U4Rt+IYTq0VYMLpPLk4lZGaCg3vEj+Eeoox
         uUEKde+H45t8P9UojiNifLb6TzlTqJZDnS8Fwo0QahgUAJAGQxMULx0yUXeBBn+Meab/
         0pqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793536154; x=1794140954;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s8dsnJvXNjRIGa6l77NdEqyDxusRBzLvXdPjG/1gIKc=;
        b=NV6EK9FzpYPHPLgpNB1Jpa3C3i6TGyVWW+BambZe4yaDc7PCFyo+9UbmXRNBklaMKQ
         Q2kD++6HXHsbDDpV1UAirgPJTL/ZVbDV8paw4DKAGqN4+z6Q57ragpvk9TzOR0SY24e+
         brfix8VjdEqNOdZn6gaoSUk0jJzLgkzzOvtjzNcAvABl21RRuyXaDsZJjqM2NLqptehe
         0qNQWc7UM+E3Uc9/cXAUac8wDPepO4HUhQ8sFioBxT4NceeZyk8111PfHo47jC0U0X0E
         /CXKub+Fv6vu9eGubF1JfcXZD7Vq7NNmaz1eUV2tL95JOjBZtNMq3JS4V1DYlE5AoKKC
         oBhQ==
X-Forwarded-Encrypted: i=1; AKwUvBz6W3aaysctXsxzrJ+Q3+SWr08hpnehtrkOzYAQXy6DLnjuO4ZoepK8DDdnGLAVJCxXhhSUngSwNgXvrow=@vger.kernel.org
X-Gm-Message-State: AFq9FYL6fgW9aTCNl/lOs/Ox7lFP1c1rtQl612gcBIjlo0aSnkEEnNuD
	Y6/tqWgzLUoizVRude4ovEcOQw/ChB6tBjJRc5rIpxIYDiPZ9Ue0fAcPF1j4zs0dyztS3Ej99Xo
	CFVTm/jRicUfO4U8NtCQEognEQMhjexMsz0Ie7wwmhg3jFoFpVxazqS67vsqgbJHtBqU=
X-Gm-Gg: AYBFou0g3ruGHBMNHzWhzBshvXdeMDrdZCvrQMusWG5qcHTLJFfpEEMXIjrVJRRHHrD
	2usX6nUfX8A1KledTwsNAwxnpshk1YVvAqesmyZSnwQuqGHoMSdN22nuKzvCE3teMOKOIisnIOE
	yC/oHfaDGb2jVDYL16AYPc/nI9N2iTt7F/+NHDbmI16p0qmJcA+7eIEH5bYWgFBpLVH+PyH1JYW
	KQY66Oj426koH7bryZid0dpEnFzwX+IjB/wqkG/i/PJtAlAUmPJFuwka+2Z1UtLDK9ZA0oiS15i
	M6ZbBbzcmg3D3HeA0W3OAN/kwP7gUn2Mu7BYnfdMxb1SF4Sl6+kgnwPaAvX817tIWKWCn0wu0Ir
	eIzBco43uJe2+x9AckRRazQMH8BHHDgtWOUOUXRk2dFAq7OugwGoZANKqlNxzEw==
X-Received: by 2002:a05:620a:2b43:b0:93f:6c76:215 with SMTP id af79cd13be357-94421796431mr1213755285a.50.1793536154272;
        Sun, 01 Nov 2026 04:29:14 -0800 (PST)
X-Received: by 2002:a05:620a:2b43:b0:93f:6c76:215 with SMTP id af79cd13be357-94421796431mr1213753885a.50.1793536153866;
        Sun, 01 Nov 2026 04:29:13 -0800 (PST)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ab69b54742sm393940855e9.15.2026.11.01.04.29.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 04:29:13 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Dinh Nguyen <dinguyen@kernel.org>,
        Matthew Gerlach <matthew.gerlach@altera.com>,
        Mahesh Rao <mahesh.rao@altera.com>, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sashiko <sashiko-bot@kernel.org>, stable@vger.kernel.org
Subject: [PATCH] firmware: stratix10-svc: Use proper atomic to fix possible double free
Date: Sun,  1 Nov 2026 13:29:09 +0100
Message-ID: <20261101122908.46723-2-krzysztof.kozlowski@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1647; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=8aIv4dRno7qZlMA1TydRB9YSJce/oU99Ln3ksfP4pQY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq5zCUjkpuRaruYRY3MVdxSu22es5QWUbHY3QR5
 BjENfIp8pSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaucwlAAKCRDBN2bmhouD
 13UjD/4pY1h6hXmVnCa+9pjZVt2gNeO0qs+lpFp7H695VY3+WajOlEEIEFEtLWyZ9mJQtbVTXC9
 wPKkyxfAnJxValX4718rhfAGKph4j3uH7n6ykO4ktEXUYXCMZBTeBWSfWhPqzDqRmZp8P+yZkfn
 0lLy17/M3y7EeWGlRq1SAnAqLTPueKZkjWnTNjjQ9z4QKnTQZ2Zqgb7IwHOPcLu+gqdOG6VI76l
 9TSuhQHvkmt275GUVell3R5Bfzolu3mmZ8fegn9BwXqz2ZATU8DDM1ONhZ79pXkHsLTmdNK+QNk
 3R72UPIZAJkhU90z7uGHt/3Xz+aa5fv/vJZQhvwFXvfq1goDS0aitiyqj/pjTl/WX8SbcvmI/j9
 9olR79YpevkEdc/gC60FfqIOtwQ+HCRwea0cXMIwxLWEx9oaaZBImhjaSp/P1/AFavOzlv9bgC8
 WlDIAsWsGyDpoF+87kPaEPDIHuyr2tDf7Vlx/CHQGLQI73ouQ0s5Jqh7Jb1SQzgMdAqE5WuBxq9
 lPH0CL80YSsdgAV2k7dpra2QLfHrwOwraVsboPjxnuEnoBfUw7ToGQetJWFAydLDi0shR00+UpB
 vvhttHCim6mzEwSQMUK12xj7cFZwk+bx1PiEqiStU7t4Qa1u6wZoiIg8K/LXtBbBkPoRjdOT+2B Rk/J3eXd4ntJ1Fg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: c62MB5cRdZEzFXxIu7GGxlhaeGDkzEoF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAxMDA0OSBTYWx0ZWRfX3wDLBGiNgUSx
 qLwzp6ucFtCphImqrOPgu00oimGnvHSeeUtbXO+p8bhweLmbXxyKHvOTI8YqdJIftW3Xv9mjSrh
 C7GZAhu+t4N3J7w3hV1HvPViPqAPKjo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAxMDA0OSBTYWx0ZWRfXzoWiP+LQQ2ZS
 ktMmrUBWA5FPZnnmTZwXp53iEJgs+Wp1zbS2AqSPYqdrlNdSWCHNdxd1zLZ2cDthEMjs0+JZksY
 JWpXSA8+fW0mM9b3d4XCPwfwuHcHprI/AjyyRIVDw7CXIfivwwaTjRhq/cmrqtw/2dlEBSgfKrq
 2amW/H5xZ9CCaqKSbc/F+06jJ3ak/kS1pdS6LUv2dDKKVpfchUY7ebcYxKQOC7WY2LfJyQ/VQ2R
 qyX5q/KKx4E19AdM4xVtxNdXO9TiO4DFjt5sLJS3w1gK6F7ES09hXihIiufOmxW2tCRyC7jFXkW
 7YUNCmJZZS38P95SV5PDQJwqrIqQd9Qa7iFtHueau8XY1I/+yTKqaRYoZAMnjImL8naLFV1AlrJ
 IA+uiOzt8T7mtMRWQMVlUOVOL5muSYYYHKFUtdBHGB17z9oo2Oxnisw2gmFGxylDY311VnHD1MT
 K46t7Mw+8kx3nXGpVkg==
X-Proofpoint-GUID: c62MB5cRdZEzFXxIu7GGxlhaeGDkzEoF
X-Authority-Analysis: v=2.4 cv=PucG/AM3 c=1 sm=1 tr=0 ts=6ae7309a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=c92rfblmAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=sb1Ve6MsGh9o-rpR10MA:9
 a=PEH46H7Ffwr30OY-TuGO:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-01_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611010049

Doing atomic_dec() and then separate atomic_read() leaves small race
window leading to double free in stratix10_svc_remove_async_client():

CPU 0                               CPU 1
=====                               =====
refcount == 2

stratix10_svc_remove_async_client() stratix10_svc_remove_async_client()
atomic_dec(&refcount);
                                    atomic_dec(&refcount);
if (atomic_read(&refcount) == 0)
  kfree(achan);
                                    if (atomic_read(&refcount) == 0)
                                      kfree(achan); // double free

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-506b1474-e503-4085-b62a-929cde036317
Fixes: bcb9f4f07061 ("firmware: stratix10-svc: Add support for async communication")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/firmware/stratix10-svc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/firmware/stratix10-svc.c b/drivers/firmware/stratix10-svc.c
index 88391ea161ed..aca4d354bdd7 100644
--- a/drivers/firmware/stratix10-svc.c
+++ b/drivers/firmware/stratix10-svc.c
@@ -1444,8 +1444,7 @@ int stratix10_svc_remove_async_client(struct stratix10_svc_chan *chan)
 	}
 
 	if (achan == actrl->common_async_chan) {
-		atomic_dec(&actrl->common_achan_refcount);
-		if (atomic_read(&actrl->common_achan_refcount) == 0) {
+		if (atomic_dec_and_test(&actrl->common_achan_refcount)) {
 			ida_destroy(&achan->job_id_pool);
 			ida_free(&actrl->async_id_pool,
 				 achan->async_client_id);
-- 
2.53.0

