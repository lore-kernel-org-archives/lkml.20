Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF421643B
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 03:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788061661; cv=none; b=aQ3ZoZSl7aPM3ba9Fh2vniI/d9W3eRiiyvZu41wAc/qAITGitTqCKAgkRQPGW+vNQwZGns26IRhhwa+my1Hlm55Zv/o//ABSK57zEoloLI4P5rKGXDaDvmFrL/IUjqlqdAS+GRqk6D6lD7U/TXv0+u5eoqEqSoxR8v3ymN2T+5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788061661; c=relaxed/simple;
	bh=RZhefy0Bru+3z6+0XZb/9fKH1WWUBSNbqtpfus9KhRI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e8amRZPVqUCy48jd2R6P909ctiP8LquFctH8x3R3rCABfGblYpOQABoxqJcPh6/Uka6eLahHkrS7kaTLJs2W0grsF7XrzbvnjMwdfwEh6I88kUMcxX/KGCZ4tbdPupFvQmH41EbTWsF7szzy14Kb0aAiXBl0dg++XAdP986dR3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hn3cyGjF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LPNRviSq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hn3cyGjF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LPNRviSq"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67U2S9sb414279
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 03:47:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=jHJJEw2EtiBlaQK9tLUvewM+mPfWsn35SgN
	iG8dIxo8=; b=hn3cyGjFJLwi24X75Y3rmwKbbhGtpQwbGcWaS4tSrnYlFpjD7wS
	Ihgr2fcD0aeH73tfDatMHwenzo8OCNeSv/AL3Rod2v122Sq8IjrVeMdBa5w6pSA0
	HSIBIvkL43F3z3tAMXhJQsNZRTVSplXTmr5IJfPdXgRUNGa6izFftL1+0DqLJX6X
	fImMKbPlkrp+Bbs/iowW8E/0XRhR7Ki/5zK9LmHkO+9bnalwZgUMJ8GMTAFmIa4C
	ukvXFkMzuoILgGaQGJTnFkLcG3FM5A6847ywkK2j+WWSycZvgQV0q8Rj0jvzqfK6
	TQge4biOHz/9DWAyGPAEK/YMWBDV1yHJwqA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqhmt9ej-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 03:47:39 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c85798977dcso3092116a12.0
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 20:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788061659; x=1788666459; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jHJJEw2EtiBlaQK9tLUvewM+mPfWsn35SgNiG8dIxo8=;
        b=LPNRviSqwYdZHmb7A1kPkgCYHC3s3l+/XUKZeeF3Rf+B+baldZ4KyoSo++SZEDl/AX
         I0+sHSL5MDeqgQf07NElZnni03ae8YYGzzXQ1+NcuwIe0UcqhNx0tNBZkL74EKP5C3gH
         6BchpisaWU6jWviVKainTyKykWGY4IkbiIjWCCI4w8PfFSbyczG/Uy8foUYIawQf0uTs
         VN5LP3qVU1wUt4NxNGeIic4FRFY2Td+AmY6BzvIhA2x0iv7S/kXP0xggMjl0FHSOanVk
         ApeZdTzxpHmxkzcLO4VoHxHRiFwneaHgRZSQUbttRbYrE7Ev4apBU+TBMvj/0iDs7aIb
         pTQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788061659; x=1788666459;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jHJJEw2EtiBlaQK9tLUvewM+mPfWsn35SgNiG8dIxo8=;
        b=IrBzJbfOaxrfEv3TrGFdR1fykB2w/rZ8zTGnKKjpVRBWWsSdojGOanFTsksCTXRzi1
         3uO23pzPQBMyzy9adYS7U3RbinyfYpS5oBL3fggJORyEA/ILmYRwzdADdLAUSMhXkcnW
         xGMA9Nqs02q2CRPvBt7QxNiCwgO9NzFc8y0UrTSTZ1Q/OUfU3qvIvCU89JVD27ImKsel
         fYJJpWEOaruHqQ97RFBqA2SQPASc9nj4wFvob+538L2VfOUVk7/Dtz8uEhvNsaG4eYjw
         aOOUvzxwbZwfIo47C3T4b6Z5XipE7Ndarih5GFF9URmoD3ihtOrSfdm8UujElC7pd7VU
         vjDg==
X-Forwarded-Encrypted: i=1; AHgh+RrGuurdjEwAyTEpoWFJCcHCZrK/oub4lyv3OBJYvbkJskGirHCMDB03s9boDxbSHA6+MOARnKUfY+VIxv0=@vger.kernel.org
X-Gm-Message-State: AFuF++lO5aOnr81FwMEcGxYvGQ3CuT98+L+lN5YXAzzCL1lgj6/nFYmv
	8ktOx5a8obozDPjzUq6rHfT5Jis4bFV+9+vRXXRJoUnAggiDaEgMSXgpa5cOkd3LCE1oQ3qriKj
	TXC3ijjc6NGln8ch1XcIGgtko7HPd+PCaNLLv+bc6OSRWAua4DQNFKdb2KGQsRGK5M84=
X-Gm-Gg: AR+sD13qghe3NUW59L6gkxMQNe1F4G9ImFJj88AFngDaENo2Due4D+Jx/cP88gpYJX4
	DIR/LYAQdO6lYv29b9qwJGvx25uUoYJQenryzkFQnu5J5rcJtANt/1VqXRxtJZTU1qOjH671PsX
	NA4AqaSMJsP3lGZlSDl885ntPS0t9ghJDGVqUbRLDD2T+LN+J3Z0VBtxns4c7IFkW80efJOXWif
	sf3Bv1y7M5ljIgPv6tzJ/Kgwl3VqC3+UDPStohRdnyPUGfzO1sUW2PgUjnboP2asN9509dMvnzP
	67vJ51UDmoipRgY72jn3W2xXOVoKE4TJNH1S7GnhebZuculgeVSzqQrjI4cJKonJHV9205FjK8C
	EirMg8iNHkrdKU8c4q1HP4SpQ1r0HNfSxL6fD7vxAXAG+RzyI9cfriESbJZrj
X-Received: by 2002:a05:6a21:6b17:b0:3c4:1c9f:d7e with SMTP id adf61e73a8af0-3d26657278fmr32456198637.6.1788061658703;
        Sat, 29 Aug 2026 20:47:38 -0700 (PDT)
X-Received: by 2002:a05:6a21:6b17:b0:3c4:1c9f:d7e with SMTP id adf61e73a8af0-3d26657278fmr32456170637.6.1788061658310;
        Sat, 29 Aug 2026 20:47:38 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f8094dasm20956768eec.13.2026.08.29.20.47.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 20:47:38 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        mfd@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: mfd: qcom,spmi-pmic: Document PMAU0102
Date: Sun, 30 Aug 2026 11:47:19 +0800
Message-ID: <20260830034719.140213-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMwMDAyOSBTYWx0ZWRfXwg7PXHlL1Qfq
 Wggg1C02uqYgFLyYnFXize73Ny3GwaD2I4fIv92DWvG5VjTKiUyzrHQO+gRdSwLfH9Hhc+bOXjb
 OgLfikCLlfmp+6vG7BdZoZ2urz426CZb9VSmRVMSz6pPflpTKYURECYhlsYHSCAqz/GaMgfiuE7
 P2Q+1EBNWWVnCNp76MqW0NLZY7ZAA2iWk4PQ5jMnrBzzItKEiWgi2axAKw+sr0lBZWymHdn/yHl
 q8c2t6b4SXDf3nXB96TYDQCDxDXiGmLw4tsjgUGea/5YJkN9AKK4MbZ+ChCFIxkFuZ+1gCc3ZZI
 z4RkfSNkPLhsFeuYAWPKBdndAox72Crd6y+4oZ8+m9lVIov+jnAdpw5Q7Cdl/TwjOvfcY7mzo7y
 4vrcIEjx9VzWhxkJbLYA+QruBYNz5slEOX6dhSwu4XW98MwUELxBb8FbePYPWn2m6/UbZexw68t
 j4tXZh63Q/SZvdKYpjg==
X-Proofpoint-ORIG-GUID: fe_W14fzZ-egstHoPEMizm6qusA4IYl7
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMwMDAyOSBTYWx0ZWRfX1jE7KDxnHBsm
 1ia4NaUNEkJ27VvxK97U5hvMbFSXGMHydpI4caFBBkBoBD3QL7ttPVsl/1NaGNyu+qr+PlFSgic
 iD0dftAb+oI9rh1loZ86HFWJ8NT3iP4=
X-Proofpoint-GUID: fe_W14fzZ-egstHoPEMizm6qusA4IYl7
X-Authority-Analysis: v=2.4 cv=bpl8wkai c=1 sm=1 tr=0 ts=6a93a7db cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=GXJ8kvFa_VRzmclzPfYA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-30_01,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 bulkscore=0 impostorscore=0
 adultscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608300029

From: Dhruvin Rajpura <drajpura@qti.qualcomm.com>

Add compatible for Qualcomm PMAU0102 PMIC that is used on Nord platform.

Signed-off-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
index 5e0ed30a9a46..f6534e9e9912 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
@@ -74,6 +74,7 @@ properties:
           - qcom,pm8994
           - qcom,pm8998
           - qcom,pma8084
+          - qcom,pmau0102
           - qcom,pmc8180
           - qcom,pmc8180c
           - qcom,pmc8380
-- 
2.43.0

