Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02BB535CB9C
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 17:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787764804; cv=none; b=E84jsA6wIS209IyKHSlbGsHPamlGMp5HyIOFiW0E2K2bDwov2QUrfKZENHC2MbQTR+Bcz17SDTxlA+5OQGhF/1xgZs4NCshlvBPCVIQJhf4YExp02eUm5wynPXMbp6TGkYFtCK5Rzzryue6TvjMQgRhh2SpD3dYXtTCLvZxfOTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787764804; c=relaxed/simple;
	bh=wv1LRyJF436NBZkqYSed99dO660pUkPBSqfpXcjqKUI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=KOCKKJw6KgTruzlo1vr5NoCpM8Vdq9Akhlno95NVqlO1NZtK9mVQpDm6l4SnwO0VSHRueaDvUtUGWglsII1GkhlcTgjI2Ir1USCI2y9pjEdWHu+zUMweQyuo6l2Iu6ZsFqanDhyJx19/as4x4HeF7iU9vV/PElyDL/DZe7k3oAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i0cHsH5M; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cj4ti7Zz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i0cHsH5M";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Cj4ti7Zz"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QGuwnG1008255
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 17:19:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=tD1u+02Zr5j6+6GAngHUQW
	gDuBEpH+yAUOjfilb1Lg0=; b=i0cHsH5Myr654BX2GGBptirO3vrAjd5cAQBJde
	uVVvhy1rtvbnlMYolAarMYZ6XyeRnV3FeOqDhOryG+ENNmT2WIvGX7mSDS77nSla
	sr51ENigQoc03d+4PlJt3xh4J2tOjCphPQgj1kMcDcfnVAOVCwRSFbKHJBFgDnj4
	ROs/r1Xll35Buy6JDnqQCbWU1lS86ti6bkHXnG/1w5OU0gIBjIAHNnz/Pt4rtvSL
	wj0JNOr80ZYXLoOdp/se0IIzkpDczg9z5idEWeBFkmEx/lXL/VY7eU3Wz2vf0wND
	NrhBlSp9b4HquIWJwdXo4QCCV1bkhsJhHGlRAjzGcFA9QzWQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9smxax31-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 17:19:39 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc1c5810451so1270566a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 10:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787764779; x=1788369579; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tD1u+02Zr5j6+6GAngHUQWgDuBEpH+yAUOjfilb1Lg0=;
        b=Cj4ti7ZzjmDqvnae/WtTN5LHC6F9Md6SXmtHcIf6UN7i6mbynf+yjI43R+neoAcy+x
         kHCtAjvOBVP+2fw3uskRFqM6YDOmvw/OgAvVclr95pmcONNnUbOJplvvubBcyUEA2ppO
         eiNCsXnJq2zxRpr5tniGPg1GbjkEkecZLhq6nGNk5NoWZ4i4/l/6PdYezPWULJAWSFsC
         vkmq0ZbpORsc4kQY4UuHa4bP5TlZMRP++xQjICtNSeSCu7IMe6YVB/OyUP7ldvWxFFXe
         NaIhovmAS55xe3oOlR649oOC7kvSRThMdMRmgx0WQCqcqwRefEUbMyrbbgy/jhHF1l7h
         FEnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787764779; x=1788369579;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=tD1u+02Zr5j6+6GAngHUQWgDuBEpH+yAUOjfilb1Lg0=;
        b=SNv44W1x1h3bABBFvaWMRAqh+INogFTLCcXqHtnh001heyJI+hlvheja7oqYFIHmwZ
         CU9GkW80vHGA0PWLr3tOJrCcJ52euPFoqVXWQ4WiGBIgNThKdM4wFgeskLw7nZjWqjgY
         HVikiPxUT6ld/blEFeTuJeqzi7a0B9XugXPQomRNVjDlyCMDsNy9QDXbK28aex5F192T
         SpBIYitTx1o98KvpUolLGzsQQ8KsJqXKZhCPPofX8kdBJ/qx67ou5tWEdvHrSaM779MG
         6xLaDdaPzSkH9hrTFscLO9+M72ErlPimyXsYLIuC4BkBqlwrO0QgQgzZ7h/kVgYes33E
         wx4g==
X-Forwarded-Encrypted: i=1; AHgh+Rou5nWQ2BkzCnky+ln+ODieEEDZ0lCVe3HH149/Kzdy4/WnCdGwehj3aSMMf4UD4WsQsP9kWFFNko5dyrg=@vger.kernel.org
X-Gm-Message-State: AFuF++lR6t6mHMRSL93ep78H4/L2Gf1a8DMEkygJHJY4tZa2+ZTay4Vv
	0Xaqw/cquDSahrV0IfRhvDqNWb30i6ME54NesgvCzpVj/9NOQVhKP+e5gX/MPrsVawPa/NiTgy+
	ZcEunDFWBioXWIEM7LZ3PbN/vRRNBkD5qaegsNkTZLKBGlFyMVNGBjnKZ62Q/iqiC+vk=
X-Gm-Gg: AR+sD10FQdb+IkW5lTEKNkepDc5jjIk52BgiBXQNxOZK9BcjHWeWVenGXgOqbjUXxMY
	/EI8o5xYG6n64RdmXg27eiBLYwPX/Bg6lSjQyRtUtA3KdbWasZRWZlc7ri52uwmDIihLET8tIGa
	ttZ1LJilH9i7f0xX6KGehYwiOgfx/5xycXfOKJcJMrWwSWC5jUwe8IDcN9sUkQb1dJoA8VDV9ZH
	RAVHV3iFf7AsXkrj1v6IcI6XXq9ESQSmcAPx6GBVyYT5qb5BJFjWrVUy4RN4epewpYh5AtlchiI
	hx/iOj4bSaRDk4hsZ0Iu6nS95hE5/ZZme2atTlSVwPn3IZ0MxuBZQnwvnBOmOyI1hxZ/FyGWoOR
	+yBM5IAecbaYxXloAyT6F7cmP0EqbMX/j15w+G8iOOKxDL91+jQ==
X-Received: by 2002:a05:6a00:8d86:b0:848:2eac:bfb2 with SMTP id d2e1a72fcca58-853748a0551mr17568199b3a.13.1787764779098;
        Wed, 26 Aug 2026 10:19:39 -0700 (PDT)
X-Received: by 2002:a05:6a00:8d86:b0:848:2eac:bfb2 with SMTP id d2e1a72fcca58-853748a0551mr17568124b3a.13.1787764778636;
        Wed, 26 Aug 2026 10:19:38 -0700 (PDT)
Received: from hu-aletran-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8535d345ecesm1206968b3a.59.2026.08.26.10.19.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 10:19:37 -0700 (PDT)
From: Alex Tran <alex.tran@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 10:19:26 -0700
Subject: [PATCH] i2c: busses: i2c-qcom-geni: Use resume and get pm runtime
 interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-i2c-qcom-geni-pm-runtime-resume-get-v1-1-25ee55d1f0c8@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAB0gj2oC/yXNwQrCMBCE4Vcpe3ahjVjEVxEPbTJNV0haN4kIp
 e9utKfhu/yzUYIKEt2ajRRvSbLEiu7UkJ2H6MHiqsm0pm+v5sJiLL/sEtgjCq+BtcQsAaxIpY5
 HZuem0QLd0J8d1dKqmOTzf7k/DqcyPmHzL037/gU4ciwRhwAAAA==
X-Change-ID: 20260825-i2c-qcom-geni-pm-runtime-resume-get-ddfbcee1a63d
To: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, Alex Tran <alex.tran@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787764777; l=1272;
 i=alex.tran@oss.qualcomm.com; h=from:subject:message-id;
 bh=wv1LRyJF436NBZkqYSed99dO660pUkPBSqfpXcjqKUI=;
 b=rR/0L1/u4biv+fJMMwzDwAWDhrZnvz6R2e9sjXqUg7saAttIuhJzroOjxA3XmHOqWkHZnqbRA
 Dua4wX1Mu9kBo+6FbKoLALLdm0mDhfW3nAjYUr4yFgw57UKVppZYeF7
X-Developer-Key: i=alex.tran@oss.qualcomm.com; a=ed25519;
 pk=vKab/gw1fXij5UviWoglv+ho+H/oOiTHyETCLfayPE0=
X-Authority-Analysis: v=2.4 cv=O/oJeh9W c=1 sm=1 tr=0 ts=6a8f202b cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=qnW5PnHyz4QdMw9lHNoA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: umuH7820X3RJGRyUt2XEmlaA9-HHt4Yf
X-Proofpoint-ORIG-GUID: umuH7820X3RJGRyUt2XEmlaA9-HHt4Yf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDE0NCBTYWx0ZWRfX/BcwtKmO6+G4
 0cksO37ULJRgi/wtO99Clpv+7+8KuIJHy773ttqsbB62NpgXfklPyeKOljFoUgOybjagQD6pEsG
 PCgtKv4tUtVqLezeODMHmpxLqEWMFsquwyzPpsJgH2LbRbB9Pz819l3Zl8BABnAbw+SPNZG68Lg
 etegLREQLBLh1H7nEEJxHZNANbNkyBtw8QI3HbdxTquC2l7GbUW1s1yjbmvA5Z35vBby6u2jwQW
 ERYpR3unp5AVpgOELZK7Q0LHy6tlOsz3v/usSUOYYGw9/6t4v0vQpLRJrSEZibF0LhJWSxiGwNx
 MeTxaIen55NPrGkqAESHcs9DTtvkKw/ODFQH/UfwQbEC3TeYc31SkmGOWgkIOL9sY8GSRmYpajG
 6o3b9l8xgZ+7yEDyXylXtzPC6l1x9ezl5uAPl3Bsd33m/J2HsBbRhx6gedym/vdVNGRuNliz50A
 wr1pwZIq+yHaGcRjwWw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDE0NCBTYWx0ZWRfXyUYPrnTIQveM
 F4GXpvfd/rjNyIXpEvUm+WViFNE2tmi5ONCXKPcVnU8+YHJm8bDJDaxFXYKhrIWpxxpH/TSQNZg
 YgjvQIWT5IANqCVKxqg3XFTz37rfggc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_05,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260144

Utilize the provided pm_runtime_resume_and_get api
to increase the usage count and call the rpm resume
callback. Upon failure, the function takes care of
calling pm_runtime_put_noidle. Remove the explicit
call to put no idle.

Signed-off-by: Alex Tran <alex.tran@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 658636c1ee0e..d5f4de3e0a9d 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -963,10 +963,9 @@ static int geni_i2c_xfer(struct i2c_adapter *adap,
 	struct geni_i2c_dev *gi2c = i2c_get_adapdata(adap);
 	int ret;
 
-	ret = pm_runtime_get_sync(gi2c->se.dev);
+	ret = pm_runtime_resume_and_get(gi2c->se.dev);
 	if (ret < 0) {
 		dev_err(gi2c->se.dev, "error turning SE resources:%d\n", ret);
-		pm_runtime_put_noidle(gi2c->se.dev);
 		/* Set device in suspended since resume failed */
 		pm_runtime_set_suspended(gi2c->se.dev);
 		return ret;

---
base-commit: 45c13f3f9e3bb15fd89ff2864c6f627a3b4b4229
change-id: 20260825-i2c-qcom-geni-pm-runtime-resume-get-ddfbcee1a63d

Best regards,
--  
Alex Tran <alex.tran@oss.qualcomm.com>

