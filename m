Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 653A336AB77
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 20:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789330731; cv=none; b=V5ZYa6UlEqThaOZvAtGYnWQa1bnnVacDvvHwEcEWFp2LkMdXaVc43GPLbpmxHIekMUctwsh/w1kM47B2fQKj/Bwww1CSpllf7ANBrEX8lk/tyvllkE5lU4HiCgNYKKYFYntcox0X3OmsnrK6eQmL9Mvo7NMUNQ1gMc9dVWN46yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789330731; c=relaxed/simple;
	bh=FCsM4SZPsa9sU+Tf0jKlCbkbpZoWu7eCILvezrdZJP4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LLPauF+bA8g93QRlY7BVqY7dI4PrBT1ooZMas4QwTwJaZXS76duoRwDdlWFA55ly2+XhRQq6l5isvJxXr2pLWnjKwNjnzCY46m7/cIAfvXYRX8bvDqrJRIalfveSrSGwQR7w5LCDtUpsoQCyZa83+dslNdVCBk3UucGNPw+WUXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BrABeSY1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O0MrbKMF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BrABeSY1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O0MrbKMF"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DJxfhH2526950
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 20:18:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=nXH3YsdC31I
	SX+t8/e3TLXrJZQ/UV2nsXGmqyk9K/i0=; b=BrABeSY1C9r+nKwVLDLszP3sWBn
	j0SmcgK7rOQ9fKgW/6WM73ZM0it4m0psUVTbep0O0cQbSjx9aptQh5+CcWs1qH9+
	MmMnvyPhS+4tdBb9Wwe+KAA6a3inVIWS1oSXopAxKGTryaMG+3oCGUjoCROqNRCb
	eQr+M0zWE4k5CqagC5S5GN6L0ydKW7J2nkL403GvVRoPRFPH0vrRZDDPfJTrSavW
	LTkmDiVt35MsTaDfMU/gXfdjrF9wcqbOi+M1R254WD7+zK2ATmttqjX6m+66avTF
	lpELG9F67QhIZrXHCtypyOCqDQ91115BYOew4860OSLuxbCp8nlvn7STtCg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9dc1sh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 20:18:49 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a1bffc2eeso149729985a.2
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 13:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789330728; x=1789935528; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nXH3YsdC31ISX+t8/e3TLXrJZQ/UV2nsXGmqyk9K/i0=;
        b=O0MrbKMFzWMaLQ17azgg4Z1wFgCBZ/YYeb7o4QCWXpXG81jZbpv6nXawb+Q7CicDOO
         4Iyi+ZXmwyYg2KUAmA1PFouEKPqot/8gjK+T4NKatR3Gp8NlLH2tXtFXrLz4mamt+p/J
         Ih+k9/dSBcNUhkOWjMMfyi3N0e+qT1z9m4G5qzKlE8dbnVio2PMdyfE5TkznzgXVNYNH
         Smg8vb8sBzd2i7JClf2MOrgVs7qQooWh2VjKkkPmpbaJxgdHfjJn1FV21/zkWDuJzHvq
         plc1/XVeQ6H56vgKBjZzG9F3Aeo7ifKcZ5qlZqNaT6mjTh2WrtKjj4jHJQKOFKtIq+D9
         smkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789330728; x=1789935528;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nXH3YsdC31ISX+t8/e3TLXrJZQ/UV2nsXGmqyk9K/i0=;
        b=PYPKb1zkQe649SRxXyud/hUBIe9Qgm/Hah7aFooRMLdecs65jZ7kCn5MGWKXqqvARX
         sXFc6jfH/4rlWiFuQJEigb2Rrg3yUXln4BFhqL4nMeMewEZoM3RH3WZpjBnO/ZsX/K+6
         bnXb3Qb0mSSLE+FKvj44IqQYzuJoMCT9VsVW3dTmWalUPVRKFUP3Gvn921RHZOjNJNCN
         z9W5I7ugV784iy2x1wNfpooOYdRtRc0cmWchDtNp3297pFwq6BEobg5QzuGNP4izXsIg
         QdED9DDrtLLDFiRppDXqXLRMJAAVDWlYeqdCjgrDvd9sQCvIDhQyzSjvvw2oEqj4tYUf
         Rr4w==
X-Forwarded-Encrypted: i=1; AKwUvByIrCMCxPsT1aDYN2NKFIwaAAYK6irWBZdCcNccERRNjoVxcN90WBveLb97FueFSXqLPqEfkCZEdZuCrRo=@vger.kernel.org
X-Gm-Message-State: AFuF++k+zSLAoC4LkpTPU4ciT6+whLm4TFY89WGiW3fhzxAd4FcRguEL
	8VSz6vS0N7ERalRUu17S9eaEngqGuUQrvrBYjWWdJOA/2UbuZcltDvwvo1LT2Ve743lMiltPjl2
	Fw0eEN9WwMgCRqd8BPrvpzMkQABQaxQ9cQZEby+SIpNUSfJuQMWqEVL116G+snYEZ5LM=
X-Gm-Gg: AYBFou2lF6SZUFSQXvdFMAXlPlnvSBh8YLIMxlTJCVwGCSEz/vq0XsWoQqky04M/oAo
	+ZZCrBRK0/0CipaBAjXYd1fDrWy80c5QwllQz36g5vKjkTUW25fubrDKbzqBl1SyGzsdQZDSnZf
	kR9P/CrZxELp1B7LePXk8JLAahEqcA7cap6fVvUuGiLJPxJ/w9+swQqMRROASUjt1jp+laYkww8
	pRX2PNnVqRFKgHYOiFxXP5NH1GCo7GxluripGkNR6xgMGQz+CR5lw7QwuTZWCrDTXcmFmHMmH8u
	K31b4UH5S18FgCpr2JqcKgw9/01M+0qZwoafDasuqZVx7AVweIHk5rlQSjaV0/wGJjZU5hND/KH
	lf4Lmuq8KN0E5GA==
X-Received: by 2002:a05:620a:44c7:b0:92e:8310:7369 with SMTP id af79cd13be357-93a0386b492mr1280752885a.37.1789330728567;
        Sun, 13 Sep 2026 13:18:48 -0700 (PDT)
X-Received: by 2002:a05:620a:44c7:b0:92e:8310:7369 with SMTP id af79cd13be357-93a0386b492mr1280747585a.37.1789330728166;
        Sun, 13 Sep 2026 13:18:48 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb32d3c7sm20143821f8f.10.2026.09.13.13.18.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 13:18:47 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        mpearson-lenovo@squebb.ca, abel.vesa@oss.qualcomm.com,
        sibi.sankar@oss.qualcomm.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 1/4] dt-bindings: arm: qcom: add Lenovo ThinkPad T14s Gen 7 (Mahua)
Date: Sun, 13 Sep 2026 21:18:32 +0100
Message-ID: <20260913201835.250085-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260913201835.250085-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260913201835.250085-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDI4OCBTYWx0ZWRfXyeqjfeQZCLPP
 ZKh+ELe3tzGs3/zzeoSX+SG5INUfBBsTOGOrHXVy7loOXtYOv2aQf7jqpDUE+kbtFrbHAdYFXIG
 Cu4EOKuAeLHmaguNytLq7B80ukm4x/0xOTR7S9zX0VGU0FAIl+EgOsBKQk9lhgtzrxG7Wh31Rst
 1OrTJvcEOIdt27Ik0xSoDTJnpRuzuS1Uqu9a0RtJoxfKC0JBXeTqOP8eYt2hXZUJ5OnkwF2dG8y
 VbURaFc/2lV1SHP+k2kMfS6Ma5bGTOnfLy1TaGC2DD0Rn8DjNsauwzKIdBm7T49LkB+vBruxTZ3
 hpbAHd0GesXBYDaDw1YqeL/7F6Ml/DhFRwAmaSo0jBwHArZ+hbBhVOeTumM2hnPFDQ+E92hvVQ+
 K2n0hRDnFAFR2SUSkPQH24Fp8aq3qcLWkGNEHpQ7u3udbhd3szY6XIky88jDvGbsqpLEHcUqD8Z
 CJv8mm3olikNzjv4yMw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDI4OCBTYWx0ZWRfXy4CNcHZuSOx7
 3ON3yny1VtaMQc69MEqbs83Id2gst5SJ4atlNUJMqh8yTcSmsY0NftBbYV2GvA2y6tPiXaPi3o+
 COicADqbAUJ+3S8jgQR19EsuY1mzzP0=
X-Proofpoint-GUID: u7k-b3u1RCnT3B1yTwfWHDvo_cNusAS8
X-Authority-Analysis: v=2.4 cv=OeUNnRTY c=1 sm=1 tr=0 ts=6aa70529 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=8N0tIHAAogdkaPae8N0A:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: u7k-b3u1RCnT3B1yTwfWHDvo_cNusAS8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_07,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609130288

Add lenovo,thinkpad-t14s-gen7 as a board compatible under qcom,mahua.
The T14s Gen 7 uses the Mahua SoC (a 12-core variant of Glymur with
cluster2 / cpu12-cpu17 fused off) rather than Glymur proper, matching
what the platform's ACPI MADT dump reports (12 enabled + 6 disabled
processors).

Assisted-by: Claude:claude-opus-4-7
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 5ccb571520d1..52b9163be357 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -178,6 +178,7 @@ properties:
 
       - items:
           - enum:
+              - lenovo,thinkpad-t14s-gen7
               - qcom,mahua-crd
           - const: qcom,mahua
 
-- 
2.53.0

