Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DE6833F5A9
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 11:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788002927; cv=none; b=a9g7zca8Ui3qPGs/WLfkUxkCfOp0jS9YbFTugCNrKrhhU6i8lSl6BDIVIx1v+SeTcM5A2yw9JpY/KOUkplguh0pM2yoiErB54i7SM6jkEvk1NUXBn4PGlVEUd4AvrS6uj5x9rIXSX+BIJFA9OlJTLIaVa88wAWdY4wO1Ryd0wsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788002927; c=relaxed/simple;
	bh=0bpyv1yVYeB1qINnAc1+dgrvcbRmFu0CZJ0RD2BfBjc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=F83gL+EviBgB/kiyN3s53egHa0GM9eqiXz9ORD4mvPoGkiHlFFZZmXOgkZiHB+pQFChUzFF1sGUsbd3fK66xq5ZBlj0ONf3iCCV/bX1R4NZn3ZbXQDSvEHByRtB2alqEeviW2Z4uFvvp03FsraBMXfyEc7nhYiUMKd5Wi0Y13uQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F2XZ8Pkn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BsXnTqUr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F2XZ8Pkn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BsXnTqUr"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67TBCdbk1806789
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 11:28:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=lMMJEaWftxY4zk1Z9wBOix
	MJ83mhI4sd4d3i8gp1QiE=; b=F2XZ8PknP+UvIgiK3gXd0VSrpIoiNHXQiPQYWs
	PnZZp8WnMxuhsE8zFIebeB70HRo0Yx0NuFOmBc5KoAbQyRYlGBtX4kpnCG5JtGDs
	DGKvMYQK034TAGpj3RIPqXR7rFJKeLRtBhrGB9v+GBIvx6xioB49keRZLf4pN3uF
	iC/bu9RroJg8QmN5NSiDSZt8puF7ou2wFbL8VaDLUtKN6YGZ0xdbYeW1G1Z75Lzj
	7RCMoZEdZ/rt3D/lEokSUzn8apJJ5nmBb3ZUdyJHNtjCbNt623//bgdPUFbc16oR
	Vzc2bSlQQFaAAm/r9pRMiFT6qH6ojgCQismeBb8c9wz2W2CQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqgygts2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 11:28:44 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-53000c06184so2805271cf.3
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 04:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788002924; x=1788607724; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lMMJEaWftxY4zk1Z9wBOixMJ83mhI4sd4d3i8gp1QiE=;
        b=BsXnTqUrFSKLfpDf47Cyd1rkjggyqzZGty1NZfNP/jQjgERdkpK5sL2ktLutebnCvu
         XtEF0L7FN37dF/AKU00eB+Rp0Fhpfpvt/R893pIahp4SGu4cEcpEpQOzFk3mooFvSZje
         dAcQvUlxgUvx3t/av2yzpLyW5GV3gzvCPAo+B0tPF1qeyYTGoVuD6kCoegHA1Kw6z8+1
         RQH2IzaYtiern8ZelNqUo1CMdUGjmSdSWmSRxb9PjRs5iK45Y4oiWsiYvSfToO1QaOPp
         JYqWzXVOM4hWOYHZ/7wkYGT7zNKxPlB//uv6bN0I/QEv6foA9u0V1N17YoCpfAzlBv7D
         m0Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788002924; x=1788607724;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=lMMJEaWftxY4zk1Z9wBOixMJ83mhI4sd4d3i8gp1QiE=;
        b=LgypxeOkdDwJuh3NAAGW6iGMFVDZonD5wZ0RY9w4vHJLBbIMUXLE7XjskcgD16F0n8
         bM8VtIMJlcvDd5XiGI9S9HIWRDlccZtv0ALBv1hHqlHf42dD7LsxlpukhPPTzRDm8RSj
         mR0hU9Zc6ohbON+R03TiQakpOIKnxQ3UmpQhDhboj36ylYRXBz9JKM3KePnibWlt2Kpz
         IYeqtTZ/SEsbSeDFp0+RsqBg7UUTS+sXdcPEScITXkl2dEr+np5SKBC2QDbiE/L3pB8i
         ARZ/j/RU/lp/GJ9ASBAJdLDeQcOn/zj4a4Mi6b6H05JRGNyBz4VaMCYdrEHHkBdmgvpK
         +Djg==
X-Gm-Message-State: AFuF++mHlrYOHOQxJ3AtrVzasZxO3Hv1rEA7SRgK7FjGUP/JsFPM8d4n
	gaq4aoWkUth8bgJ+YbQoO/AaRcbNVzyUXU2Gywv1JpmDFQpTzYeiszEbQHTep77ixATaukFwcy1
	9gtA6hRaFo6tsj5tii8CgWznz87G9dkL76zh9x2wm6NK/+iZhCTi4XkcQ7dXmxyJ9p0cv9gvsvI
	w=
X-Gm-Gg: AR+sD10zlo4yjtfE2drbwSQw2JH8Z4cW538M8OJW5iN4EtoMwzlIBGULJKVBs5LXdb+
	4y94JSaCvtmZFRj99UHW8FuqHVviSCYNtSn8mLi9CR+AEz7tzWNjYqkFFZrZY3dgdSqOGjAJjjg
	GDaZNHBMFuXn/DnRuPfhe/xoqBkPVdUOkQYSSntYGxEMJ6WdruXDoGt9kCu8/rh0sh+h/RWZqNo
	ozXTpPpfUcJkFvnVuTzP/+yPDW18UEez9a0s9f14CsjDqDSSpEvI25FM44PdZvcvm9a4MngGh8T
	Pav+Sq7jwrCW5Y0lW2HcczPtVrJzDBuv/Rv5W+d6p2xO1JEDXl7xHF1NEfx3/GvAA67U7X1oqjZ
	5z16Rf1yT7A==
X-Received: by 2002:ac8:7f0d:0:b0:51c:1132:c80d with SMTP id d75a77b69052e-52fb96ee491mr137642621cf.28.1788002924227;
        Sat, 29 Aug 2026 04:28:44 -0700 (PDT)
X-Received: by 2002:ac8:7f0d:0:b0:51c:1132:c80d with SMTP id d75a77b69052e-52fb96ee491mr137642311cf.28.1788002923814;
        Sat, 29 Aug 2026 04:28:43 -0700 (PDT)
Received: from localhost ([86.149.41.185])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4843310ab41sm2259491f8f.7.2026.08.29.04.28.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 04:28:42 -0700 (PDT)
From: Christopher Obbard <chris.obbard@oss.qualcomm.com>
Date: Sat, 29 Aug 2026 12:28:23 +0100
Subject: [PATCH v2] mailmap: update entry for Christopher Obbard
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260829-update-mail-oss-qualcomm-v2-1-1670c515f225@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42NzQ6CMBCEX4Xs2SX9E6Mn38NwqLCVTYBiC0RD+
 u5WEu9eJvlmMjMbRApMES7FBoFWjuzHDOpQQNPZ8UHIbWZQQlXipAwuU2tnwsFyjz5GfC62b/w
 woG7IuEoYY5yEXJ8COX7t07c6c8dx9uG9P63y6/4xukqUeBZaW6XNvT26a47LX1xmgTql9AEln
 KldxwAAAA==
X-Change-ID: 20260724-update-mail-oss-qualcomm-3ce4f60444f1
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org,
        Christopher Obbard <chris.obbard@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1483;
 i=chris.obbard@oss.qualcomm.com; h=from:subject:message-id;
 bh=0bpyv1yVYeB1qINnAc1+dgrvcbRmFu0CZJ0RD2BfBjc=;
 b=owEBbQKS/ZANAwAKAWNNxPBocEb4AcsmYgBqksJa6zyfNQz9IFenGSdjKFypHKrUhphO5vTHj
 zz1+UmWg42JAjMEAAEKAB0WIQTxi9yLbCX5CqI9UXRjTcTwaHBG+AUCapLCWgAKCRBjTcTwaHBG
 +EQvD/9j/iiQnArcM7AUrUonMINJIRzyiy8Pozc6pWKG+ecl0M59T9oCsDDIkYR8gJVUAbCbFcH
 LS0s/claXKf/Uao/0pzsABEiSGNpyPLpuEORFK/fxxHyZRb2fR2LtUFeA5y2rngZ8S3UiklxAs9
 fD2UnTl3gcDMaTnw0C4px5l+cN5sjCrmH4J8GSfJU9cpwjXl5/rbk/+hC1k4MNwTRZ9eR/lIu4i
 p1O7qchKU5XctRgSFhUvj2uSyPqSG7nFs0cQ6UAPHyFOzY0TYSkm+YQqulMX3+eqvunx9lZXW6o
 LrIEejRaU8vF71Ay5dORP/HCHyFDxrq+bxNGPexlacNRiet6PklXDV+dgkuoQ1D8QETHpZxf83+
 sdYSEgf/4I0mKdmVe889FFYBH3LYsnyoYQOL8vkJiel/G+uYSYsXnLr7K566fm2XbN1yYE7/Zzy
 BEl3fKDBJ+qcNshxmUMgTMDiBrIaS+rKEZ5uXliFxkRFOgr/BE20cmkkJ3aZrrho9wM8XHHw181
 OIPAWeroO1DXfFTGb2bbnb/DM+fw+6T5HUh8zm5qwKMxCAiOZfmwxeFshX/83VzyYmLk1jIByQc
 wFkMn8opWNKtTT3BVE/Y/o6I3Vt6s4MJXFkGMBBlSxn4+YW2Ag79j2McAcYJAy2/1KDd1Q40AZO
 iJozZqGYuURR+6Q==
X-Developer-Key: i=chris.obbard@oss.qualcomm.com; a=openpgp;
 fpr=F18BDC8B6C25F90AA23D5174634DC4F0687046F8
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI5MDA5OCBTYWx0ZWRfX9BUX0TOaO8vq
 73KkSfvDVab6K4z0BKqqsDF75ZCut1KUeaCQF+R08aMNeldxRaE+XBUntJ+pCgazNstd3v44s0W
 QfzGtILmrVWUD677AfV+knLzNp7Nnrk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI5MDA5OCBTYWx0ZWRfX0szXRnwNrioC
 OttOZJAqrC0uZblr6oFw8O0m40XV8XyBoKkL7MyYpzKQ685gcUpfz9EirZCI6+g06VoTXwtm2G5
 G2etkuwUsDScxe6tsG0Zr8gssg2ovzLhiHx5FeTHmZrtdfkjEDdS8PFYuJf3R0VGhtSbZQr884s
 aiqZsiWgGzx3mvJGuuI3qZD5CaQESl7ausOMmt3+xQZ6xlnye0GBlHiFnlNtWxVlnLloDV5CGhV
 r953KzUM3HfPRVMhFqXvN8zfhpF83jy53U4p85nCifHzkRb0FR8XRCxVPSiaSg4ViSVzi9l7NB7
 1zP2Q06kyX85ssJDwZmEVexT5Qmxb3CbCH/aahAz0JQLNlhwRp6wI2MXF69p6R8EUifqUII4yuz
 TT/omm94SrNvQFVai//si25WB4iwM6xBwQumbg//BCFi7yEY11OlkhDZMXJqWwub4AA7l5xl7ex
 ULetoSy+7h1YTRvKfsw==
X-Proofpoint-ORIG-GUID: zaTOkxttvYq4Pkc2xbiPseL3KnxOaUT3
X-Authority-Analysis: v=2.4 cv=R5Ez39RX c=1 sm=1 tr=0 ts=6a92c26c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=1ZqYAqmp+mGnO5v9BrvPnw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=1UX6Do5GAAAA:8 a=tNIM7thpAAAA:8
 a=pGLkceISAAAA:8 a=KKAkSRfTAAAA:8 a=QX4gbG5DAAAA:8 a=QyXUC8HyAAAA:8
 a=LG5T7v2SAAAA:8 a=B7FWZfKwpMBTBuYAiawA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=Et2XPkok5AAZYJIKzHr1:22 a=Hj2ravQqDRfZqFUSZohz:22
 a=cvBusfyB2V15izCimMoJ:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: zaTOkxttvYq4Pkc2xbiPseL3KnxOaUT3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-29_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 impostorscore=0 spamscore=0
 bulkscore=0 adultscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608290098

I have changed employer; update my mailmap entry to point at my new
email address.

Signed-off-by: Christopher Obbard <chris.obbard@oss.qualcomm.com>
---
Changes in v2:
- Add Andrew Morton to distribution list as there is no obvious maintainer for .mailmap.
- Rebase on master.
- Link to v1: https://lore.kernel.org/r/20260724-update-mail-oss-qualcomm-v1-1-9033a234bd5f@oss.qualcomm.com

Cc: linux-kernel@vger.kernel.org
---
 .mailmap | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/.mailmap b/.mailmap
index 8fb9f3898d7a..2f3a24410d9a 100644
--- a/.mailmap
+++ b/.mailmap
@@ -210,7 +210,8 @@ Christophe Leroy <chleroy@kernel.org> <christophe.leroy@c-s.fr>
 Christophe Leroy <chleroy@kernel.org> <christophe.leroy@csgroup.eu>
 Christophe Leroy <chleroy@kernel.org> <christophe.leroy2@cs-soprasteria.com>
 Christophe Ricard <christophe.ricard@gmail.com>
-Christopher Obbard <christopher.obbard@linaro.org> <chris.obbard@collabora.com>
+Christopher Obbard <chris.obbard@oss.qualcomm.com> <chris.obbard@collabora.com>
+Christopher Obbard <chris.obbard@oss.qualcomm.com> <christopher.obbard@linaro.org>
 Christoph Hellwig <hch@lst.de>
 Christoph Manszewski <c.manszewski@gmail.com> <christoph.manszewski@intel.com>
 Christoph Paasch <cpaasch@openai.com> <christoph.paasch@gmail.com>

---
base-commit: cf72cbb39da84b6f02f90c07f33b102fc10b16f0
change-id: 20260724-update-mail-oss-qualcomm-3ce4f60444f1

Best regards,
--  
Thanks!

