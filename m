Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6293364E84
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 21:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787867447; cv=none; b=VcgNri5+hnwQOCXDZXZWmBwNxZkxvRImpIgFdleau63Uw0wrdl1gNVDRl5gmGKnuLOoZLCnAF5iEJliRaerHZxe+8Kde/2t3I1nViW7be+KkwzfrO21NeRetrbGWdl/nLRULGOiPHC8kVYnxbxvDlhdBGPF1wHUhEYquAfkztDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787867447; c=relaxed/simple;
	bh=C1ScAVXGqizWHISwSvqFI+Pombiwkz6s3sB6XZM3ljM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B/lD3D/kmhu32eKUoCJNdNYvE5x7EyPOPXpINEHQCu3ETPUBxSz8vJRVSv0M5EV6UOqDSSuDx+GzIZwsmYNzjcknE3jNdARygHQNjq11gxZ3LXzpqEjCEYn5PQ+jNyYZmZaOrcei7PV8tBPVg/HtIUHfRNPnbKQym+wJGmF8OA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gMbz80ZP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dTN1rhpn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gMbz80ZP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dTN1rhpn"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RJLoKx547107
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 21:50:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=q1J85jAU480nkRQHABV5e0xfslV1RLCJfhR
	jqhP+oXA=; b=gMbz80ZP4Ql6KklApEFpVEAJl+vD4EA/79j7lcKeJIh0YVUVsv/
	ytp9LhIBVrz1pW2aHHu6nEo0jb9uvimL9oJdswQolwpvA4PV+Z9GIb6VbCL9xe0p
	zSJpAkzR5Q9Ac3I57RZb02ZfCkpEsnT/vx3DWkloOKWw7hSoBA93+R9z9TfsNpvm
	cUhMborRo3kzaSnEEAoCm+ctfaa/MkqWoUp9nY46+yX4ETpJ0owLHxwWNOpCiBUF
	ltnYpfaaULRKsWcsHZAfZJXP4qB+QNlAarZLKSkBnAYSQXSGPRYDnuzPBR3GzlaD
	wCv0wqX9ZcpcefjyT4n2gu7ui5C0ouQtXkg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gak562r8j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 21:50:44 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52dd69b00cfso4836581cf.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 14:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787867444; x=1788472244; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=q1J85jAU480nkRQHABV5e0xfslV1RLCJfhRjqhP+oXA=;
        b=dTN1rhpnKmNfJI0bDPUaszLickbC20barDwnFfE9bYZxsnbfv1Fb05V+RqsctzJ8nT
         hdt5MHnMPDPlhaRzSZcxZJVcg8f97wRn96wkqDk1yj0GBrQNONqHDx4V5nD/yLg0c6Fk
         Zk45YQjnLYMTJ2SDHaLUthQmF0ocDbf/IAXiUwSp6ATN0RCOj+v5LhL34SlNwZKfsj9X
         PukYj1OuTaDDBxi8sbajkRWKq77gTvjdxc1eGCVuiIlEVIXZOOdr1C0jBIS5IzwurfZA
         tvSIEiD1oZntePRn/fok6QxpYexjpG0HU8mxjoPpGZcmvBXMZSjL7eed4Fne2SefV/6M
         WPng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787867444; x=1788472244;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q1J85jAU480nkRQHABV5e0xfslV1RLCJfhRjqhP+oXA=;
        b=LHfnY+rDhD6u4DRnCpJOEq09bEj60CpfU4QyRXscLnkbSMXzNDUyWgMvG9o4Ez4bu7
         D12DbbE54NFbOLb+N4fZptpD0MmurrpeaNJRvkX2NPZr7gqxWQlyzQ646S6K96tmt7ax
         unVLJgniQDFwS03RJ4ujpA+OSDUHNES0tghGsaHyuhWzhfq+17E6XOJ6+P2pP3cp9W/9
         gWtmWp7lh7dgWHAxVxLGvrr1Xk8zD8Mwa8InL0UgBUVqjcwqX/ATYPAliipQ0cTf2nG6
         LrSNyvlImObHse5AhPR9vlIqjixmx85SbvREjGSGQSMMgmi3LaKkiQPMMXFc/V1Du5er
         WCJA==
X-Forwarded-Encrypted: i=1; AHgh+RowBjrnhTQJBt/rUak36LdFyaP66Hn8UZTIa3PsaHR2bn6WasbCMa9FbacrW42QiF4rj1JzIPe9f3AWcoY=@vger.kernel.org
X-Gm-Message-State: AFuF++lc++s1GgoV8bSyvfO10SvtpNoE+aSwQBDaOdxfoKLN7khv8Vqh
	s5WVs3iAJ6L578ViVTPnCd04kXrJTgqIoz0692hBMaw5/o/GF//HY5Gd+s6VwKcsNuEZ6/vFoOx
	coHH2eM3KKi/8opIbh0TZ3YP2TDT3K7xnV9RkZeMsYTIB0Dy6dXPNnZsdkjJADAceQu7CYX4c9v
	c=
X-Gm-Gg: AR+sD11h5+ygky7TX+g1EQOmz16d3jf7SA8yGDTtDgqxUnbpp1x6Qzhz8rNVpRGOt1s
	5CKw5yIOAYj+BhrJ0zleutkMXWqvCzW4oBudbKxynMetmUZn8vieiJQOiMJN8Qj9faE35qizEJF
	qkYYrGm0nShsm4BhJu7A9XPkEsjGuahrQTrEEtU4/ZsqkiKnCezAN7qu2f6b+Rru8ejP6w1Tvrv
	LdUXg8x/dRHpz6inmjlpYwvxdnlO3GKAGHlHRM1eQBgCZ3IMugtNIOLscCalReUd+l2ejj0lic2
	lpXq6m8XkceNOygrT4XGoY3qQ9VhNLYWRHxnPt9qAHbK1L/BYaDpJR1QRXTdJKyaZRdvc58r80J
	MigYVY47xKHp8zec=
X-Received: by 2002:a05:622a:2507:b0:51c:1e46:711a with SMTP id d75a77b69052e-52fb95e9223mr32770211cf.24.1787867439054;
        Thu, 27 Aug 2026 14:50:39 -0700 (PDT)
X-Received: by 2002:a05:622a:2507:b0:51c:1e46:711a with SMTP id d75a77b69052e-52fb95e9223mr32769521cf.24.1787867438526;
        Thu, 27 Aug 2026 14:50:38 -0700 (PDT)
Received: from quoll ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b94dcaf61sm1261435e9.4.2026.08.27.14.50.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 14:50:37 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: qcom: sdm845-oneplus: Drop redundant status=okay
Date: Thu, 27 Aug 2026 23:50:02 +0200
Message-ID: <20260827215001.34184-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=702; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=C1ScAVXGqizWHISwSvqFI+Pombiwkz6s3sB6XZM3ljM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqkLEJBfeSdGx5LyuHQUK+yJZk9GXbb7Yi8/aBq
 1ZIZ61Qp7eJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCapCxCQAKCRDBN2bmhouD
 18c2EACF//Ar+37STpdRJjelbC12XOkUkuksaoF51Qq4rWH8Ibq6joAbAIW7RTHARdvwrpgtoGD
 HFLBdwuI+ic4VzN4cwPSqOsPD43j3ULmJImjvg/pwBiQHw6BJfsS1vDMM8pGK62VMN7sl7bKQwv
 LWD77p2UKcw64oyOvARLOxrhEvAsW6QkkhEV7Rd9wJz7p2ZyF3c/aCyg1pv6SpK0x7grM8Snhgp
 sYglhCwkq5FZet2QncCtGPHKR6igdxGQ3jkagSzAdOfPOFNMFjXq6kwbi+QxtiDyQsSceOHPN8y
 XP+pNhR5R9FdGQmvHGlTN2XQ9QAa2VWsu4baZrq5Nm5HLF/bwWgqRWA2NOfMJ5lm3kId6rtFGu6
 pI2OF9kJh8SKLSMsahkVMIHXncY1ppkSeuqlXH0b87xxA6JE5v51aU0b6o1HdYsC6HrP56LP50V
 gWtBj7R2o8mNQnVw103RsevfxGpcCJaCrVRhPSwxyKRnICXWXLFiSOvHq10K75MWfKjuhZkuDpu
 N+EPb9ARAYErVIbPDCEDeG6XYJGLOjZ1JL+Y/5Wj1SLnI3nTf890UjZMCfHFCO1PsZcP7oVAnqX
 OSx9AfIroAwVljqeE3P42VPJOu26S2HK235sresIPFfPopyjsvVlxCLUWS4uD43PYdw0O+snF16 fMJlAThzaBuFfqA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDE4NCBTYWx0ZWRfX3F50lJFv+wZD
 Z3nmw8fF0EGCcm49m6R1D8jBbIYaI01/5ChiKJG2pYh2g1jbC3I958UQLuUMpzgcMMheGTaYnCs
 y19wp2/D1U7s1Lj+2oXgt2KlTXms+pc=
X-Proofpoint-ORIG-GUID: 8GgfgX6-RR-JbsQRgG-mOd60nwXdWEn9
X-Proofpoint-GUID: 8GgfgX6-RR-JbsQRgG-mOd60nwXdWEn9
X-Authority-Analysis: v=2.4 cv=G+Ms1dk5 c=1 sm=1 tr=0 ts=6a90b134 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=9VaQ_ZmEn04Xv8QsgdMA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDE4NCBTYWx0ZWRfXyyRju2Aofu+0
 cvxpbPdHnPlywxmlxI2YGImG5WBDfzQvh+FX4YxeMIMST3w+a+jV7exOlXl21sYaECsQQUYOFbC
 SAQXvNotgoTCo6UjI16Zrnf/l8H4YrEyd+SBH7qyOLfpbX1cyEVVPHOyjhKkFIbpVfTJPU9+hp5
 mHx8qWHYhoSrCAHvmeHTCvQPPppmP9mgqywGFU4fybtqSA8PSO/po8ZOK12F2pyzhyUA2hIDnrA
 FP6uO57uIs9fUf+Z5lRJEHxS8Y9n4TutZY0Tz7nlWMYRPNx39mULs7vazXd/YlLkyQOmYjQDQlv
 qXUAGIFY+XF70E/Dbn6zuMl9ocAuBUskROS8cWXUpDbl/sU/h2zkrkx9rDMz8LEP+e61/A2O/Qr
 pB8c/zPLjgAJ9a46xTsxnfGRM28UvS3FIdS4waxtx3I/sr1kmZ8BvuPfolXY93kJFa1lNgQvVVS
 14hJ2SRirIOftt7AYwg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_08,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015 bulkscore=0
 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270184

New nodes does not need to set the status as "okay", so drop one from
fuel gauge.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
index 439779f308e3..d98e3b2f1c30 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
@@ -510,7 +510,6 @@ &i2c10 {
 
 	bq27441_fg: bq27441-battery@55 {
 		compatible = "ti,bq27411";
-		status = "okay";
 		reg = <0x55>;
 	};
 };
-- 
2.53.0

