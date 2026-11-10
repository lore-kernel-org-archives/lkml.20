Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794320080;
	b=C3bcUEorj6F9WgUZt1WmJFY6IO0Gx2UcsKZgYrGtsj+RQyP4U0QeZT4Gkrzj8L1axCn8
	 2rxWdcdcSKQ9kmCtae1T4RD6BT4mQHZSuSRTeXD5vL8SAU9uG/6nn7j/c/BrEbw4FCKYk
	 KItZsE67Wm50dWkWRuFbArl1rYYYNHgloKpt2hN37KmWIECB+Y80e9Fcnv0w87nvQ1C96
	 1i7eVzHurpgdJ2IESkhgnxn3lkLXRDr966q2YmuhCK10fbuniei8NS8WExwlU5incb5eJ
	 qoWYhYTS98gtERmeutJyo54B2mLJGC+RoY4aVeYxoDDHShMfUNJ5fUXpd+KjSbej68A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794320080;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=HlXgeWxFCsYVgmI1LCtDvAKQFHLkVa3Met4qvlNiqkE=;
	b=ffu1/CDX5xohSzaXpmlzQMTxSBOPFtE+bHS/Ysud8McXlPlFKq1NXr6qT/lixPpVZxSc
	 Ks9KVSaBiBvGaDlP3zg1mS6vH2HW0vAVAFrKUas65rau8akgwt2Y/P47RjaDg+kgbQWPt
	 RCSh0FIedit57EiozkI2md8XxZ3YfdeuYOvFB/SUXBqCGl5LnCIsmC1bJ29+LgCQWhMMK
	 2klAoaJCxD1VeBXNl4rRUmuuxWgdmD6Jj0sWtfz53kW+LyVhnG6dWAF6QVPVhcMUnY96n
	 FqrSHbJNpUnQj3YAsD+vGtrJ0FPrwuNWA0DnyDeFG/RydJf2PVNzJaGcq/b8UucjLsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Gv8VFnF6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PSA1ltgi;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6877F606A325
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:14:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6877F606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Gv8VFnF6;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PSA1ltgi
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AABA6vZ3217024
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:14:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=HlXgeWxFCsYVgmI1LCtDvAKQFHLkVa3Met4
	qvlNiqkE=; b=Gv8VFnF69MbsW9vjFEEIFjHErJrOmXFrnaDY34cdITUuPULs3Er
	YMsWBM99bRUWQqmmrSwvEz0tK+xPGNdLhrK9io3en+EcIEl8StCc8i5+vcxEenIh
	PzDKhkPZPgZB5v3G82Ve3vt7XV7z4WEEIyF44JVKTbP4wz1vju/tImxXTlgwmKYz
	u/2TsomGWP+ngHE0lIUiQCBUwZ5tH6vvOi0iHcunWUETVuuA9xG3Va1d5Y2QjKEI
	b0AclNkqk8sOypWeJyU866qi4ACDkgGeuHS/Mu1TY9sP4+mWXz3vR7oHDGGpzTpG
	702TtTvRm1uVK9EjbEnBKgkDFedquWY9hDg==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huvtda0gh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:14:38 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-99077a0be0bso784630241.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 06:14:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794320078; x=1794924878; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HlXgeWxFCsYVgmI1LCtDvAKQFHLkVa3Met4qvlNiqkE=;
        b=PSA1ltgiG/2ivCu2rZ+huElYfV/dffBYyc+FfNsFa6D5AkvfwgxSxkT55C2R7EoSx3
         pL9j2DsjtUqZY47d+26gCykfvP/BcBH6ccTwj2uMK1I9hVbUkfceskbJ9CI1PrIKxg8i
         gF7ise+xPflj9JRZrQjXBuN0TWj8roQnmm5CDCoViAL13GwTB7qUp1/p2MJ1jHi6SqJ9
         3JkBsOsgvZtrFt+xQ8zSV8Z2uDTQHgBi/atApErXvvg635fKK5FYRt3tsHZ6r2t2N4mr
         Aa3/bcjTx4tLtXvuFeEetXx9MYNcNMgNGsdS4MqxJmr7whIKDFMob7Z4gmMH02On4PCB
         96rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794320078; x=1794924878;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HlXgeWxFCsYVgmI1LCtDvAKQFHLkVa3Met4qvlNiqkE=;
        b=NYnVK4TJ0yIkV5S9t5FlA5O43L88f4tOYW1BWIHFZd0pUSTXmI2KHPOjghoA7sxqbJ
         6+DvGeR4AF+NgWSShZBaVvzXqPzzaH6M3K33iaw8VTi97ZEqXjgN2EzjYZTeV51opy6g
         T2VNezP9WPAp/dENGZDxMJGhk5WyQhDli6u1XQsEseLtIsSt9EiYG7ju7MRmYNCyeZNa
         DF+i4HOnwmWZt1cw8308FbU408q0Mu3ONOFPXqhJ63X+/5z3mQEhBO7Sj+lINntrqz7k
         vWfCLQAYAAerETGjaxBkOxprr6EKC2t7cJD4udMd1RT9R3xr+rLUOgbwm4PgTE1S0HRl
         Wgqw==
X-Forwarded-Encrypted: i=1; AL+hErEsI0jZs9KRFTOAdRQH93eqqyKQkYZUZ8Eh/Rh93bnQ/x6fcMVGNBvFqm6SfC1fqb6MBN/d653QBci8x58=@vger.kernel.org
X-Gm-Message-State: APuU4Z/973xUc+NU8v92scd01q/zjpMl3tSd385zcAo3n+kqIJXwmC0H
	+IazaPxEa7TM5EiM6OWNZ8ScLLXMImA4oGT0FBFCAqZy9jL4Z+b7yb4j2HOPduFOGtSv8SGWXL4
	6Lydeg5l82+YVFXbJ/NM0u7cf+SqX8AMkwubcF/jYp8hcnmpxPTgkpvLnf9BjRQC6Uro=
X-Gm-Gg: AYBFou2TfnoGexW4TuvbnLGrpC1J4UQT7AQ2kA98WcirQUxTx39dClToWZuIXMJGV2X
	JWN6RkXGSHIuKOaBuGNvwYVZAOkUK6FEqSP5U6ebwJn7YpYPMKBN/oGGbPyeL7y0b2ne5KpWUB4
	1vAMdjvNgddzfz0/EVXmKS2/OaQt8iDLqqR993WTyi5lDI20kTrru5+ACyTq1GS9DTJjc+t0XjY
	eR7piK4Llj4mqMHF9lwE0neQqr1HhCJ3fleQfN8dUmfykPmnx92Rh4LpUtBP8+Rv34/UJJBTgjN
	kd8+F0HCZgu/ABHBWrFYnsZwZhJdXBKk7+yYT4LwBv5lXPGUIiOVTwhR+sgJdo592wAR2CtKMCa
	sx+hC4BxCyZmxlOZvGg90mRP4DVI0ZYE8Q00muzLP1Y6p0icsF5IfriwiV+Q5Fw==
X-Received: by 2002:a05:6102:6a91:b0:7d2:cdd6:6c8 with SMTP id ada2fe7eead31-7d301bb97afmr720181137.21.1794320077613;
        Tue, 10 Nov 2026 06:14:37 -0800 (PST)
X-Received: by 2002:a05:6102:6a91:b0:7d2:cdd6:6c8 with SMTP id ada2fe7eead31-7d301bb97afmr720163137.21.1794320076998;
        Tue, 10 Nov 2026 06:14:36 -0800 (PST)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49884b99869sm4024355f8f.4.2026.11.10.06.14.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 06:14:35 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, workflows@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v3] docs: submitting-patches: Clarify partial review tags
Date: Tue, 10 Nov 2026 15:14:30 +0100
Message-ID: <20261110141429.149451-2-krzysztof.kozlowski@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2607; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=Zm5ucH3QzyK+131MnhFZbkBIkNzuwWp2O1N8ZiDdMT8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq8ybFMVJitws7oWjWSIEkO9r5Dx825g3GPOQ9R
 aA8n55mkX+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCavMmxQAKCRDBN2bmhouD
 10F4D/94N+fw39TgUThBNGBN+e6BIMIw+Im+v1KD4Iqi8iglWXjTO1VZOTudNUW+hTe7X0/JObr
 LT5AZQmur5IWg24i3tmC0lMmOW3NO/cJw5TjLu3oWS9tnQmPxpBV3XeELJBTnsedk3up5CyF3Id
 AFa2mMkZ/gRZgbqvWHeygUBo35+ilZa4kFdJVJ3CNrstlaiN63xDPeB/nAuFoP3fEDty1dSyC4H
 HgUtjRF3PJ0yj0W2dZSsEiMcV0i4l6Trq1vfxVhXjlQb+dA32W2GCadodHN60kbydS+vfuj52ac
 Tuh7j9LySbvNlSPHy00zFvirrwe4jrajT03wkRmz96Cx9F93JResnfEuOMPOjqusyr+IKpLEvBL
 DT6kG5+oOAtAzMEPXoI5vvI10YCvFmmtnp12yqGbybCF4+ZJ1O54hcd69IlBhWjyMvSvUhLtYxJ
 1Gq/AjWWJxSGTYb3dYL4YTCrV+ji53GngJLv4itS7r7vH7UeKSOzbSCSLnt3GWdKQuSVvv54+eA
 ZgSOIQG3XoH/FymnBqHM6k8uWXvpGEOpqlSfpXInUjgRJF0uHudGkI9Ttnv9UZYHUnYnt6x+Lrt
 hNRZsD+5erYMDhN9YRo9iPtB3sZltkKOlBCfTAJwsraTLMMWqUcO5kVwUxqcBlT3dEbJm1Hlnjw KY7ngzQH951TQUw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: xCvd5bxgzLvDi6hJ8hP3_7Dg74H7yit8
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA1NiBTYWx0ZWRfX26DeTDIwNV7U
 T+z/zWz2s+53r1fsvvJ6gD2v0aQt4OIvkm72hYDGkC2/SbhoNYLQUcPPmc78lhHhQY56z5thF5P
 b6OGvU+kaqsXQ9OIG8AgQ1Ae1nh8tQE=
X-Proofpoint-ORIG-GUID: xCvd5bxgzLvDi6hJ8hP3_7Dg74H7yit8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA1NiBTYWx0ZWRfX1YIhFlo3SSha
 4UnPAm2pTGuxApG6pDiiNufCHXk6FB3mu6KXiv7nS1VluZ6km5F8dx9HhxTEAAPcdvgSvUjYhd+
 TqyREcSqfkpRXiZ+mKEy827OpAxagZPPfS7f3zHdlADRHP6ZNR9q5ZKLOK/x9NOnPMc+LHWtn6S
 r0B1WN2DEfyrtq1iQ0fa8UIheOLGSX+f7dV0vMI41M7awmQ49p3SQVNT/EK72dL2hyyKLLqu3Gg
 nUr55e1geAGczAK7IW1JXrBpMb900NNAuckF3VWF7pK33mVTM0dTiYhKAs/GTLl4DL4L6eJBJeX
 zqRQ6dbZdoSfSQ+Xs7DsyAmH0YU63AIaHXJ+Ef0jQHmdYb9gF/cpZYdh06JdjmnZKifw8wD2gjK
 DRExfG3xbm955byPF//4Gyxmq22nKHEPY/xbQ6waZ7lssP9qif1ncUmy3NaSateOprb7pfsBsbh
 j4VQruuYKHGDdslDcXw==
X-Authority-Analysis: v=2.4 cv=ArR7T+9P c=1 sm=1 tr=0 ts=6af326ce cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=QyXUC8HyAAAA:8
 a=EUspDBNiAAAA:8 a=QIhr-27iAAAA:8 a=LDBv8-xUAAAA:8 a=QtS_tYemhZOPClHeaekA:9
 a=TD8TdBvy0hsOASGTdmB-:22 a=cgaYBWEFosGJW4rWv5Lf:22 a=DZeXCJrVpAJBw65Qk4Ds:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 phishscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100056

Refactoring of driver subsystems or some core driver parts often come
with change of the actual drivers.  If that happens within one patch,
people giving "Reviewed-by" tag only to piece of the patch, like one
driver, and ignoring the rest including the main concept of the patch,
are not really reviewing "the patch".

As explained in the Submitting Patches document, the "Reviewer's
statement of oversight" is for patch as in "entire patch" meaning:

  (a) I have carried out a technical review of this patch to
      evaluate its appropriateness and readiness for inclusion into
      the mainline kernel.

The sentence is explicit, exhaustive and complete, meaning it does not
allow implicit variations like: "this patch or part of this patch".

Reviewing pieces of the patch while ignoring the main part of it, is
much closer to Acknowledgment, thus Ack or at least "Reviewed-by" should
be followed by '# subpart' suffix.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
Changes in v3:
1. Minor commit msg adjustments
2. Use  Driver X author <foo@example.org> # for Driver
3. Tag

Changes in v2:
1. Few grammar fixes in text and commit msg.
2. Mention the "# subpart-name" marker solution.

Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 Documentation/process/submitting-patches.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
index f271d7413f72..040f81b2bedf 100644
--- a/Documentation/process/submitting-patches.rst
+++ b/Documentation/process/submitting-patches.rst
@@ -585,6 +585,11 @@ serves to give credit to reviewers and to inform maintainers of the degree of
 review which has been done on the patch.  Reviewed-by: tags, when supplied by
 reviewers known to understand the subject area and to perform thorough reviews,
 will normally increase the likelihood of your patch getting into the kernel.
+If the reviewer checks only a piece of the patch, leaving the rest unreviewed,
+especially skipping the main concept of the patch, then more appropriate is
+an Acked-by tag or adding a "# subpart-name" marker after the Reviewed-by tag:
+
+	Reviewed-by: Driver X Reviewer <foo@example.org> # for Driver
 
 Both Tested-by and Reviewed-by tags, once received on mailing list from tester
 or reviewer, should be added by author to the applicable patches when sending
-- 
2.53.0

