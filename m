Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA3E34B0482
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 17:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787853115; cv=none; b=ogT65HBqTV4W+GyBnanljtUcLcgGgqz5CQjafjWqwoP5//n59VpPZ5x/S63ba9+zq0c0MR3Glg43p6VcBx8BO7l6D7WKLS5UInk9LxuChqNKsIlQWDLxYFf6EUK27S9oSKBl81lJ+OPNpJgOa87ZG+LQYR2LHKFXFOGPK6pF0Gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787853115; c=relaxed/simple;
	bh=PwVD29DtUH4dIGkOMbXE9qMjiF+K6OUxLIjMJeof/6o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s2S7XYTYuhF2xl5FdxA7Lq+ASPUbMa3pfy2CBG7uvZZN+goGCWtj/cesIvLxfsIi5WPLGQjH0wXN0CQ+t3bbRfd5/6g3PbY6tFUT1WuflRFG6DlPFyPJdpu4dx2VFPWBV7OW24tcJnph6Fs22g95VIz/I5jNnESUZ92iibTH15Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OrkbTqbq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vqxf4+Q9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OrkbTqbq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vqxf4+Q9"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RHXnjt1568596
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 17:51:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zPYfTHbFrfi2XEod5q3VXPMVscV9WPdiBhHDyk/uC10=; b=OrkbTqbqWLWzXeag
	Y6XXLkqEaCKKrZXZSJD6fFjtW+arBtUSejC8LlmqYkZGo1Frz97/GS1qSFnEmtLp
	YhrS3g+zXKYkgfs1iz7sBl3HodoWvnfSxpf3d3QydT3ID2gs/poLNXfgasgEgg10
	t+YK2IuDEzUmvUKW9QjXGbXwuvWLH3IeXv99ppVoX0J2C2ppS54vIS3+q3ZdVudY
	m0SKc4O5tMYH8nOyLYvthdbfXn9AbPA1yXp2B+SjKwFpFdAi0xOGqA3yl5XOTNYx
	Ci3O4TFE+r8M9WC7Ms4Byt5ElEsXMDCIoIeBuEyNX788p2kTP1/3bvUN36Zvjosg
	JgAG6g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ga8m5m9qn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 17:51:53 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d6f75c1219so1667805ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 10:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787853112; x=1788457912; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zPYfTHbFrfi2XEod5q3VXPMVscV9WPdiBhHDyk/uC10=;
        b=Vqxf4+Q92MctupiPADBLZjeOED9mwvhAgX6482IhIK2+2jpKRSdusIL/uAL65lJWSe
         WC0E+B1MnRztc7g9iVuFg4AbmybXr7aUX5/kdNuoPidNOqM76MU+uq+ZWd8FCRa9Fh5o
         k+ItmAGImDDxTHuuuXVmiv4CzYSdHOHrkWeGCNbH9851+fQoVqWMeCaGry32QRDH940Q
         KzwudAX4Q7b/cSPDsAv1u8jKEd1L+deWyzNtQ9A15Aqlz1E3dGGT/HWdrwAal5tcdQfh
         iFbAI65bCf7Xe5Rrh2nHtjX4drIQWayWeZ11rrQH48Os4NnwlicgpMsMeIGzNpADIvdO
         PSIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787853113; x=1788457913;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zPYfTHbFrfi2XEod5q3VXPMVscV9WPdiBhHDyk/uC10=;
        b=J2Lf+4eplOLrEu6f+tNnjeySU87jGkgq8gy1zfRFfpcBqAKQK2U8tNQhM4j5pESFm1
         vKRLx86SOndi2mhqweTfo7yP/QptjumJCZbPTD0xtp+TnWjjVYEbem/zHQr2LhEIvOqZ
         FBthNMOgbFq6J6/DjP1Y0oY7DLYfdwQYSWiz7NXwVS2val22sF4X53SbpdG1rznMqNJl
         me3w9HyR7x/opcjxWTmRylpjMwR4CVHnpahRenBXRxy4efZWPm9o2m/xAbbBjIsux6Ij
         fq+Z+xvVkP/lchBR4OVRTImJ4DOjP8LBlGNfsY7MJokvxj5YhXONezDAS04pDQoLhfzd
         QT/w==
X-Forwarded-Encrypted: i=1; AHgh+RqYh6OSoBFUwtgT9rfHoQpmx4djOxZPAw+f0+8tgYdLoXHZonAqv1gvdnobB0E6iOxy4KaWTQpEQG+K8IY=@vger.kernel.org
X-Gm-Message-State: AFuF++kQWfdFHVqEi4o/+94Guzb23Qx+hrXasNuVcHVmAZilQWI6nJXU
	JFGkJ94EfogXrgKi+7G4+onqgq7Q+1WwbtAWOXYeyf8XsTQvehzAY77mHWZYRilGxIBR6AhRTsg
	cE3BQESpz8Es+A/tcdxIbaIPaCeuanoFVAj93KstyfTHO/jouJYQ9wgbLYt7c9aPksuw=
X-Gm-Gg: AR+sD10auP4XbqnGpMA/RRB+MPBqctv8tmNlaxcFRjyvylUkOPPh4XkII1skvD53k29
	+YNJJR1KObAp3bn7X5w28zcUHWLF6IK1FyFYnAjLE3zXRJ7g1nMstdpu6C88dBZQZXM27SFl3Dh
	fSW3Zyeajmclm8+7phB9PdrWpvmpPy9ITGMtlD7SnLH+5ntY2zZEU3Zp7CFnlXfluAVLm9tRRn1
	dlaeqB4EjrC35f05ab5gQXsWJs7csmDx0/mBbPPhDNJBynHVkOytLY7eYU2qQ1l/zu/rGfAzfef
	+Ts0tqnPpk0lqx3TFirwj9/2ZfEAT2bkYJo8hGBqxnIN/GczZ0j4yegoMDLyMSNyAqy50k34BxM
	RIUWKx94EOLvWkq5AYrRiPjqChFe1f0FtxpPfpuboi7EHAtZ0BkYrKs5COW0I6auFUI4XBdcjQe
	uJpNhTOETJQ/ZXZapdsaSuQQ4=
X-Received: by 2002:a17:902:d588:b0:2d7:1e07:4859 with SMTP id d9443c01a7336-2d74dbe40e6mr13925165ad.2.1787853112432;
        Thu, 27 Aug 2026 10:51:52 -0700 (PDT)
X-Received: by 2002:a17:902:d588:b0:2d7:1e07:4859 with SMTP id d9443c01a7336-2d74dbe40e6mr13924515ad.2.1787853112019;
        Thu, 27 Aug 2026 10:51:52 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283d60d25esm23889316eec.4.2026.08.27.10.51.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 10:51:51 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 23:21:07 +0530
Subject: [PATCH v5 04/15] dt-bindings: clock: qcom,rpmhcc: Add Kuno RPMh
 clock controller
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-kuno-soc-support-v5-4-6d47636a8f09@oss.qualcomm.com>
References: <20260827-kuno-soc-support-v5-0-6d47636a8f09@oss.qualcomm.com>
In-Reply-To: <20260827-kuno-soc-support-v5-0-6d47636a8f09@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787853069; l=902;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=PwVD29DtUH4dIGkOMbXE9qMjiF+K6OUxLIjMJeof/6o=;
 b=624VoE6RT/CK7yFN44c4vo43lHBpjAc7wHgne3hVVyn8wYeeopVl6LTMwJWZJuoDMQFApxSf7
 MCtWLZ/tVAvDZQGkWqsNg8O2BvuWsSs/K3ckjUs5KoziGaqjuojV5us
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-ORIG-GUID: CZ2rb2TiZ9eEaxBpOMm3QCqjDFmCzUWl
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDE1MSBTYWx0ZWRfXzfwUUSyEa18X
 Gg8gtE2dgG5MEN3IEA+/5dWsU2EXaF6MMczM6FFRKXKH3X60bL1xMZVkQJc157r5J3OUi/rOqqv
 LsVrgoW1mOPZzVPXD8rqfxIMLyn46Fc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDE1MSBTYWx0ZWRfXz7eZTaZzvRFl
 tyyWHLe8RHqPSb3d7eoP2T0ZnXT5RrXkYffiHYYj3Gr874PEOTe693QsSwSRaAEyLYTQ/Y4YDQT
 8wJo7E2IiygX/R1h1yhUiCfq4dViHqEJBLTgohiKKb4oTDBBof3zIUn+o8g6ZzDq+VBGuqM1g5C
 S6IxT0B4ueNdUWoyoarHlpwpg5OATxS9uP+OeehqyTo+JGTFMqrlvyLKBUjk3Y2vw0H0bWU7Auw
 jLOXAdUSsvAkpRBsHzF4sFiw/btKA0aR99CARAH2eAPcvEsWwc7NCbdKtr7V2zWw8JQ03sS/BWA
 pwcbAuKByb4Q/B1ipB7rza8yC5dQotfV3NpK3tqXUgWyIck9/kHKR7MXIrejPNIW38XQWOYx1dC
 SaEvKN/0tcHEj/WH1aGciTxIYGWVYX25T6ry2G17fiqyYkTwY7jO1ozrUIlg6D3hhI9TG7dP1eD
 /pAJ1Nj6tbmKxaxWDEQ==
X-Proofpoint-GUID: CZ2rb2TiZ9eEaxBpOMm3QCqjDFmCzUWl
X-Authority-Analysis: v=2.4 cv=SomgLvO0 c=1 sm=1 tr=0 ts=6a907939 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=VE4QQHX-7aIn0oL__EwA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_07,2026-08-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 phishscore=0 spamscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270151

Document the RPMh clock controller compatible for the Qualcomm Kuno SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index 2b446aca5207..9d521ac9c33f 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -22,6 +22,7 @@ properties:
           - qcom,glymur-rpmh-clk
           - qcom,hawi-rpmh-clk
           - qcom,kaanapali-rpmh-clk
+          - qcom,kuno-rpmh-clk
           - qcom,milos-rpmh-clk
           - qcom,nord-rpmh-clk
           - qcom,qcs615-rpmh-clk

-- 
2.43.0

