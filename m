Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96E47491581
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 09:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363934; cv=none; b=GOf3ooQa7W2a2Qamr9UECavXj0Vr0cFAIJJMMCXDDsf4uBPZFTClpQccM/nX4yqC4YFEABDkYQt7e4T6ertntSMkfPyCZKEnH3HxasauHRZAZaMkONIOBM48zR4mddX2z+XZK1N8OECP9qt5rO583ekLzPANZylX1dJA7lsNpPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363934; c=relaxed/simple;
	bh=o5oMWdlrxTsRlmHOBCOZYGSUWpstGq1VRL0Ihw6vWro=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=W+G1JiTnAU+YaK7u3HC7amFdjULH8wfRdd6BUcMqLd+R2n4xcfv6RousLsJaFrEcEmHXIiU1rGcI/FZkL+Q3+H26qUmI/CkwL4vJpiGW2hOMB+3lZqyjQSonp1JMSwzwnfL9OfAgOIMAd0jI5XkOlg4I3JhF4tdn9G/VKGwEHxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AFkMoETG reason="signature verification failed"; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AFkMoETG"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jahs1873499
	for <linux-kernel@vger.kernel.org>; Wed, 7 Oct 2026 09:02:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=vf6YFVaTEQg
	R6onACOGmwSOqqweT/zzISJg73uugZWI=; b=AFkMoETGrPBVySR23V2yQ7qaOuG
	l2QSMgqKauKCzk64DgQaA3YhRyZo3DfJB+VktD5EX5BKP57szF6kfCGbbUyFCkYk
	78h5PDV6Op4/qQCH1JJOoytZOrOs9HlpZltAc+POU160VAE883d+JxLWHNaP2RlE
	uyH+/9kDYD/l9GkUpCLimzV788/Vmnr3xAeWZA2a0Y4vJJN1J86fRf2eCz6KN+aQ
	uPdbL7owxVeEJFtLi6llxRKl2SYigIH+5pjXw2z0JV0WFH/xVoGP1PREHhzmLNNo
	HP8GIyU8RTFALGsK2WHErd4fooNyLSPElLsIqZ2fXvQns1UqU0d7ySkjLLw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5fw8rnqq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 09:02:48 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93e834ff4d0so560159685a.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 02:02:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791363768; x=1791968568;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vf6YFVaTEQgR6onACOGmwSOqqweT/zzISJg73uugZWI=;
        b=LHrd/Of4Tq6T54HW40R8Whkd/bovYFXf+iEUdX4O33WZJj3IsCUmDuy1JIQZEG1tZ1
         f1jb/LKBeIkoYpW1u3bkEphHBsXKAUDMlT2HepVebFzV0SW18+6qBGxjUi6h9uxzfhgZ
         Ed0KZe8z8mQktDDVvUZz9ukz3uQTJJ0WdpN41kzdxtrM+Sl1ILA/84/1Yo2vH2zolupJ
         xdkUBtZavIRmWfZfJR1mGnCvs1d5xeo81KthF67Zq5HBMlWpPTXAhjzjq8Ux5Q4C7FDJ
         /6rgmgLe5R7CPaAdAlGetCPPcZyLtAQZfHwUtZ0OniS9yKViCw+i29l2wGA1OsumYF0S
         FInQ==
X-Forwarded-Encrypted: i=1; AKwUvByuHmDWCFow/4DiueUeiDc1JiNSTH0RsUm7cO/u4gkDQIsQJCYCysUcbiJ5Z0NAPoe2MXmKzoSgTHo/6b4=@vger.kernel.org
X-Gm-Message-State: AFuF++mnEjeLMCtxyF+c89gJdvXd0ifA7TJ8EC+TjrfOcXcGcAtOp2FD
	4fEzbOd8e0sMm7Vu5X37pfYA9U5/qahf2HHUr1N14nUDuCuin5vNbISBUlsGjegYCQzexI1Mzyp
	OOj5q0JEu83ICeqREXoasYi3DIWGQHySdycNj9QdNI17jeHOasp7QVdrgtb+ClpPE6GM=
X-Gm-Gg: AYBFou0l/lCuDGgXjvU8OfUU69AmcbBcSKyMAt0DRpbHoAOltB6Z4fyvFnIrJIgkG+m
	y7lX7uPbj0QpEt1r1toiFNvYsxZ1ZQCeQGGJMHUGTFWOz3BRKq/c1Dg77sCTVRNeiM6gjWwFms3
	ttDkY6Dk4dctLIDbAriZIa4mqpXF+/5oCpYlgYWkDZPBCFEVZlKRLBNaEyisPV55J8CP37E5e6V
	uTlG9l56bQ+3A3eKGXqowZKX+2JR3/dNNUC9e7w6IjQqa1Dwp1qvLuW0+kg6VNhhopgbD+FBnE/
	6LY+iskc7IAljDUWm9HAW/7OLQ1sU/IkUMtywXypD8whBv64l2Rss46SzrI=
X-Received: by 2002:a05:620a:17a3:b0:93e:646c:9133 with SMTP id af79cd13be357-93e9b7f7793mr303007785a.64.1791363767596;
        Wed, 07 Oct 2026 02:02:47 -0700 (PDT)
X-Received: by 2002:a05:620a:17a3:b0:93e:646c:9133 with SMTP id af79cd13be357-93e9b7f7793mr303000385a.64.1791363766962;
        Wed, 07 Oct 2026 02:02:46 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3188d412besm4197366b.80.2026.10.07.02.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:02:46 -0700 (PDT)
From: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        Yuchan Nam <entropy1110@gmail.com>,
        Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
        Robert Foss <rfoss@kernel.org>, hariram.purushothaman@oss.qualcomm.com,
        pshrotri@qti.qualcomm.com, johannes.goede@oss.qualcomm.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>
Subject: [PATCH RESEND 35/45] arm64: dts: qcom: use SA8775P IFE resources
Date: Wed,  7 Oct 2026 12:00:31 +0300
Message-Id: <20261007090041.3732717-36-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261007090041.3732717-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261007090041.3732717-1-gjorgji.rosikopulos@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX95nGZArifb6t
 /uYozK0G2hVGTCYC1PbjGkpVmsX+6fMyiKTYyxvTKD4hAXV4k/6PgvzTsqXX/UpZH+iqNYXN0Zj
 hHG8v4WjeLaUmTGVMnCH+slyNw82ZKo=
X-Proofpoint-ORIG-GUID: 6-SggbLuJNdpSl4gIK_bvqDd_sWHr89F
X-Proofpoint-GUID: 6-SggbLuJNdpSl4gIK_bvqDd_sWHr89F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX1u4ownWzMOAm
 e/4qzhwkEiZHtpyfrjXm44B7ucpRcNdvKOMryElwNKbDdWeWNgVJj6X6LTcXWAOxD9GdhkEDAdA
 gxtd5ejy0AWOUVvw9dNka4uw2528tbQke3OOZCjzwBsJAmImSYNMPPuqP6m1cTk6tXcdmplHH9t
 YIR4WtSvme1eFBDelnSzBokt62T+kHUraRgAnTnhi000H4jih5Q7gWOm0B3b8j8NFViK70RLLeo
 OtaxNEnSBPMKRFfn7K+U3X5GtbXXXFdsdeMqzT+AymtBVXmHkShWu1tse+fz/TUZN4wbiH248hr
 W78TdC8BMa3pUg76kNMnoB9N5jrGwitDljIs2z9OdMgVhACp+S1z3mzyClbmp8mnmEskaf/IUjY
 yAi0ZMnPCgZ8KsTFIhVLOuZtT5fyz4bcdlg19ZOEF+XEHnvK+NZ3zz++n2PuMzfN9EuolkepQy3
 GjgMdHsDdcxjwDHcPnQ==
X-Authority-Analysis: v=2.4 cv=Af0kjHXG c=1 sm=1 tr=0 ts=6ac60ab8 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=-SsTkY4pZgJ_H_-AmIoA:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070035

From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

Select the local SA8775P CAMSS pixel-path compatible for hardware
validation. This commit is not part of the upstream series.

Co-developed-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Signed-off-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Co-developed-by: Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>
Signed-off-by: Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>
Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 695eae1b7256..59be841b89ec 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -5167,7 +5167,7 @@ cci3_i2c1: i2c-bus@1 {
 		};
 
 		camss: isp@ac78000 {
-			compatible = "qcom,sa8775p-camss";
+			compatible = "qcom,sa8775p-camss-pix";
 
 			reg = <0x0 0xac78000 0x0 0x1000>,
 			      <0x0 0xac7a000 0x0 0x0f00>,
-- 
2.34.1

