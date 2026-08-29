Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A733136606A
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 19:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788032491; cv=none; b=eiBs8qsrSQaQkgarvb6sJnQ92eRcn5z2N605TtXIaX7Ykf728bfpxMhODASi+aGSCNtgZkmoU+uMMs2S1OOU0aOffX357bqjlyKhgEqyebopBWuPudZcl4XUCKcPaY6YnqJIEzTs7qG5y2CCtHevbkbi5IvKLgo7fBYS4ckvwWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788032491; c=relaxed/simple;
	bh=Jwc+N+RbC/87sl8XYmsrEN6YP76o/LSd2aUUOiwIpJU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oycbBHzAPqFCR1G1eeIcBRUf1d+sb91wLT8XbM1H7UDZeuF18/CBvXvdmn7LCBsgVIVdNw91UFRnDQ4X2NE1rlRBAp8IonUE+JFAn8LD3f8UQhWjJNhvMTN61uWProAss1E3LgaBBEPV7xPwh0z/ptUqvrHArqeRiWDKpS4Du4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T1PQ4I8Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CqbaNmEI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T1PQ4I8Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CqbaNmEI"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67TIK07B2021085
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 19:41:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=FH+a3+sk3H6VaF9NIcKqUQaDhB9NJhZrunn
	DLN/w26A=; b=T1PQ4I8Q9qWQPka9RuZtZ56l7OtsU+dfZrJOz+kakN814EMO5SX
	3pxhLdUnabqyuFDX/oBlNV4KyeyKeglwYtOlx/xsN93ndMoqJE3hM6ewl3S6tZJm
	hU6T+ZelhR5/l5wWAUk0qTau3oVw/7rZAVcQaFxo1vxPpyQCD5GjAh5ovTGnSUbQ
	vwL9QL0RzxP3vB+iVeEZwru29ZzyXucOyoffr+6FlnEhjRx2rHTeNDy4Jnfx0vyN
	CgWducqyrS+mIx0IHXM3U/c7456dv9VFCgUhtHAp+OYLvHfhQmwhKwGF9+2XBY4C
	7hcrmVVvmcn9PxI2rWm9rHiIdoXZV2l7CSw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbr6dsj4r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 19:41:28 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52ffe24490bso13918871cf.1
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 12:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788032488; x=1788637288; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FH+a3+sk3H6VaF9NIcKqUQaDhB9NJhZrunnDLN/w26A=;
        b=CqbaNmEI7k4mII07eSYz/GpbEn0bu+INuGb3H4rHXp79QZagMGl7cEM5Lhntfi7N8e
         WX33eu+FCAqudE/Fu1oL+PNvXHKLaY/Vi1ooNeGtzkuAqmP8pkWZ1m9EUjdvRusTsawN
         LN7uiZ4GXevLM76//1H24ZScgjhdLoXKXF53yz5PsIAIZ4WG8L5HAfIJyEocE5m4/m2M
         VpG7KHhqi6w0ML+vzVvjEG54OJoFMUkJLrAf7k4qionU9/953QUL3EZawmK3AuhKUWWn
         uMfBv8TQ8vLUJ/LOUQAA6bG9HrhVEXzYWHkzZubt46iYKgo4T5r/x1uky6iIoiMLT3xY
         DVew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788032488; x=1788637288;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FH+a3+sk3H6VaF9NIcKqUQaDhB9NJhZrunnDLN/w26A=;
        b=E6uzTAHdnXXFXJVsTBbQNHD7rEXpOVC+lKOQ1eJLEt43R7q3n2pnHMkONov0NSSBK7
         YrVbjjdbJE401OYIkkBTCUmATn1wk8iVwNvYMIqo66omKyvyZvgBpv84fxhp5ypCvBvW
         HBr3ck0KjQrf4yKOz4CsKjZF8+B/uDAAYrerVganNgseuikSKs8Uht+6gMm7SXmqmbUV
         IlUkhqTYcUUFrQKMli9Hxo+jdg27zsphJZ5IlhBo3Ve8csoAK/qPuuJHW/Z61fHM/H+T
         oG2aR+ZVcFdjuNuIl/i/8drjvKrLCaG2SAD6aguqwIoE0ePyn6+jctYrDFaDAON3eM2C
         gF7Q==
X-Forwarded-Encrypted: i=1; AHgh+Rr3cgJiMF2bln3WMLQQnvicpEg1GqU4Co92ZvZohkwSxT7uFUseLP13G7+6Vcm4GRubfyAVzNA2+TTg+dg=@vger.kernel.org
X-Gm-Message-State: AFuF++nuyEmjRz6iFPNa7oeTnMA6wVQUXoo3QoDXzloL+DyRqOf5PG5y
	zDUo78FhXbXfyBElekthtBvMXCndsBSrvcjb50V0HWE25C3FeE+dgjNgXCGf3ZX54dp/IU/o39J
	8oLur7lHANL+qWxsu6ni58Gcv+nGsCI5JUbWXoGoQSjJUpmydi1ePz6e0j8P+2CCQWmk=
X-Gm-Gg: AR+sD11ojpkXBBv/KjMzCypqWfVrNOHZFGLtGBiiWpsn3Lj2bgoJLKOoJPntY1QNdz6
	bXSwjRyFI75BeuZ1PufnuJVXfseVrBsXIyYYWyzib8zmNmkJn03V1MNCYTc8f+i/O+UgvC2NY+y
	kngTLngXwO7SmOH8CdG1eSFJHQ3d6/lBMgN9yGPjMVGpm7WEviDE3/NDH1HdIffC25++JB4NU8g
	y6GmAbJNpdVacecmdYZCfix3ZoWV+12XoGKsNai2wVdEEcLEIL3AOONlQ5CndJupnMWAL6TIQil
	6K7+68CAA9VpwCcFd7yDbwsCsm499gqFpH2OA+w4R3FfdNsw6AyqJl9P7BST6Wtx7rmyOZiL/cM
	jho05PFtYM2yWwBw=
X-Received: by 2002:a05:622a:30c:b0:52f:a2c0:1451 with SMTP id d75a77b69052e-52fb93d17e4mr179442971cf.7.1788032487779;
        Sat, 29 Aug 2026 12:41:27 -0700 (PDT)
X-Received: by 2002:a05:622a:30c:b0:52f:a2c0:1451 with SMTP id d75a77b69052e-52fb93d17e4mr179442551cf.7.1788032487295;
        Sat, 29 Aug 2026 12:41:27 -0700 (PDT)
Received: from quoll ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b49cc61cfsm255293995e9.6.2026.08.29.12.41.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 12:41:26 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] ARM: dts: vexpress-v2p-ca5s: Replace spaces indentation with tabs
Date: Sat, 29 Aug 2026 21:41:22 +0200
Message-ID: <20260829194121.107988-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=906; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=Jwc+N+RbC/87sl8XYmsrEN6YP76o/LSd2aUUOiwIpJU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqkzXhz4Lrehjos+ZwfOwcRyf+/LQ1LjTZQar3X
 ul8U8kyiBqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCapM14QAKCRDBN2bmhouD
 115CD/9Z7kbeDsNcTxmBstu9LpGXU+YYsTlq0l+F1qf15cR6vnKuyEsjjeSnWb2iU4HzGAnNroH
 Xa+9iS3LmYOlQ13EfRZAtPHQGo9ZvqSRTLUC5VbEtd+SOVr4oQVyHSaXqDRyytsBazln+YcrTok
 ScUwj8pvP5B0oCuJf8mLKupkN6GhCf9l7riwYlt8YDSE0wgOtOzvY24HuklXxqjEhNyvbHP6/0N
 mWoi15+mqlg8CTeyGI1bbLPvDttwXzQXeinNuhPbfZovnhdC5nlCKirJnCyqdVpFH727c0cHZV9
 rm+6HJ5OH1U9AYvItO0iNteWLJxYcnjFx+SeFpRDvhAVl0mz2/+O1SdWNOaMA6KAcLpuqnhIhv0
 0OCtA9gpM7wc9ItWzuHDARHIYWk4Vo4iRA84Bgpjt3XKMSGQgu4qHbw5QHeaufJU6+0In+qO4bv
 LGYyvrWK4O0SHaXS/xmjwx9qRg14xb1DxCRo1s1ysPZfSiOHjdQoh+SCXPzpulS9NiSTijQW1Ug
 QGv5rpAIQtMiCkE+g4IL5lhg64XMOFKGEOEuPkPnANVlUU9Unhe5kq493biy/gWyWTxXL+gzgIr
 g22GrIUDGCgavJu8tbly6e9gLUltMzhTeFRb9hEzZv7f+fqLaO6kKXMSjQBFE3J+l+RwRO3dwMT p336Oa3emrU99KA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI5MDE3MCBTYWx0ZWRfXwoGovNekLN52
 QNO/SNcTYzX0VvLlao9a/pNg/EemGH819ZZYElmbMszBCcjCD9rJzOZRNziabQtMHDELp8w+am8
 aXFylMoxTextso6kX/bPHnXe8uP9/NnlErqBA1sIMHStwcyrS1Dqivaq5dNAzE6aX0gPvQMBUHy
 yBjNu06g8LRYvaP3mdLORABcVIaYNedv1ah1d7bH7xv33Nd3JG3C9mOIQrXTYzYalgpaU+Is4Uz
 /bom+SlPvlE0emI6l+WtAW0eAo5j/hOzbYgO9t5GP5Z3YwqLQWTAhGh4sM1exR+o9kevA2Id2YA
 e2vII16S4lnyH+LIiGljWs2XXIp2EGD/p3rI/0A+QuXHqWZ55oNLS86HURgD0nGSbzu3hoZ43nH
 D0P0poSSZraFVf0EBUbjhlNah2ULt79rAdAaHe40aZ618gMS3x1MXUrg5fJ26HR36cOefBQXhFX
 118pX83P3Ap+AYW5uSw==
X-Proofpoint-GUID: i3tvJdjC_bouPJTBDskwiGGUHHd2p_ye
X-Authority-Analysis: v=2.4 cv=Zakt8MVA c=1 sm=1 tr=0 ts=6a9335e8 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=JjGN2f0IYHD0VWcqIQwA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI5MDE3MCBTYWx0ZWRfX+2ZCW83R97I8
 haKADkGpP7Eos9eGTW8Opz62FL3pATAVRu7j3NIQ4Qy9LE+DXvTbHBlcfV7jCROrFNsQt5/H+FY
 UgBL0VduBTfR1gS2m4pdmNHonkx0Bf8=
X-Proofpoint-ORIG-GUID: i3tvJdjC_bouPJTBDskwiGGUHHd2p_ye
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-29_05,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608290170

Replace excessive spaces for aligning indentation into tabs.  This will
be reported by dt-style-check ("[mixed-indent-chars] too many space
characters in indent (more than 7)").

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm/boot/dts/arm/vexpress-v2p-ca5s.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/arm/vexpress-v2p-ca5s.dts b/arch/arm/boot/dts/arm/vexpress-v2p-ca5s.dts
index e3896253f33e..41a98ba33e80 100644
--- a/arch/arm/boot/dts/arm/vexpress-v2p-ca5s.dts
+++ b/arch/arm/boot/dts/arm/vexpress-v2p-ca5s.dts
@@ -106,7 +106,7 @@ timer@2c000600 {
 
 	timer@2c000200 {
 		compatible = "arm,cortex-a5-global-timer",
-		             "arm,cortex-a9-global-timer";
+			     "arm,cortex-a9-global-timer";
 		reg = <0x2c000200 0x20>;
 		interrupts = <1 11 0x304>;
 		clocks = <&cpu_clk>;
-- 
2.53.0

