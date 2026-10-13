Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C56CA23392D
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 07:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791875405; cv=none; b=WHp34p87PFJRPUp25BgiUmtKX+v9yBS7qo6B+qZKlfwv0ahr5bCRGkqXzEsmTmw38vHyFQSLmS+xNtT1uoYF1nZaIUIT5IKOydTwl2itJAiXX0fRmD5KLaQ93ZAI6eqPq3eSYiforsuLO+C1A7z76mFAgLcsrH9BtaeTkc0+f2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791875405; c=relaxed/simple;
	bh=nmI30fUqVCpCFxi02t5avDZqwUXNluqW5vIrqB2mefM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=IfHQLN6L3IOUDQlBycp3PvRE5XatrQ6Jy/YDxNzUoAkYEpIK5y/95hg7dl+BYOM3Zyf4OGokM7X6yA5XySMggNnRjjfG4/35k1c9vd3tMppnuZqaRM1DVNaHg329JdyyFI/Q3xr76izj0Jar1LQ9wO+TBYNvJsnab/FjywvoYn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YalTV4DJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HAf/TM/2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YalTV4DJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HAf/TM/2"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D20u7U302956
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 07:09:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=jTJ7ttvv6RXcjrHzxgguvw
	Xv0PAtR9MrUXhp1lcfF9k=; b=YalTV4DJXKLnh8iH0sMkv0jEn03HirkUNp0ooX
	jpUckRKxuwYvowpKeFQHhT69h0IPk47fm90fDghwUD4O03fMVNTExikcFOUBulLT
	V+B4K2iJngc4IAypjmfSU6bq5iMFW91+eb44+Yb8WbFDmVc3YJ9tk5VbyQxCuJRO
	Qz1+/u1oIqiZcZ4omsPS8CIFmEYk5xaojgby5SfYEZ/A6A6ixvN72e3uGkyYJSW9
	HEutH/3RodjzSYCnTBtOavKwanpkaj0i6XiEtq09ywSzAWEbt0h7FyNteLDHyjtQ
	mt5WBYLXGuyeJWpZIVcwe8hoRI27xj/lMaf1Y3vHST/3o2Dw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h98sq9hhm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 07:09:57 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-35c01f3ae4eso2811668eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 00:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791875396; x=1792480196; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jTJ7ttvv6RXcjrHzxgguvwXv0PAtR9MrUXhp1lcfF9k=;
        b=HAf/TM/2CkHrJnjsvFcnmv05Y/LUXYLVlcaGOgeXV1gCBNeHZOisKrcU9JBh2ZHfm/
         kmMDMuWpTewyJzWffZG7U0+eVfAj4AvLHSNPFoKHOYFybpdGZsqbXj5BsfLKafXF9h7g
         JUIAi+KNDwVTESZ92PhvyhX5U50IA7lGfMMj0HbFD0UlKr6hlj2kWCzzBezEkAZTUi/E
         +6rw6JzLkuUChjrM8DoT7xUx1XC+YeFyn20b9ajPxHBHEP5OFCn3LZt8hGIAZzZPiM8m
         M410gqOYhKUoeraJUXP5HHJtTqhLHISElMlyuuImuzPwCpWLuapeW3UelqiYX6eWFZT1
         T2TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791875396; x=1792480196;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jTJ7ttvv6RXcjrHzxgguvwXv0PAtR9MrUXhp1lcfF9k=;
        b=Jz9hINvg75rx/4h6uivVTizgVu3wR8sS/0vv3SUoGW7A/m3WOuGQPcgmIzx2MT27MM
         rs5QofBYSte25tfdi/12jcEovpDz3HQ0WPq8zCVCJ7R9EVoBrjOtutvPY8vPt3R6rwd4
         nDb33I6qAP8RL3I3aZ7TOTx1dYEtkfitBXfErRz369tUXX5UIiglKeg9u/uAykGd1nqf
         x768/I2dLlbaXeeMKvgHjCoWivXRRwgIk0UhSaL447wnZCzxFKNka+Z617s7KeRcY5WJ
         yixTNlR9xU3wNC1bUyYpGhsT/Av1KLBfSh7iXwyEMyncBBElkCyfkNLi0nSmFF6BpVNg
         6lEg==
X-Gm-Message-State: AFq9FYLcfvcGLEb7zIs5uas6Wk3aJdhJjUUw0V/L6Nx8HFIKi2QtcCAC
	5lJePaAmp8kJg2Pc/0+/7gs8thmqK0J+XysWj6eOitag91xaM4tin1q7JvcCpoSVBeTgdGSamUU
	AyVzSvytxs19bR48oNmdOboKh+djBuge5CnJPCCL4TSXJ4+MUTl5TkxDsUOXUjQs1zNs=
X-Gm-Gg: AYBFou0PKIy+mmj6+9OcgIfNhJJQ9RH8izmu75x0okJTCNGs3pNZerZdYafo1awV/HS
	c5qoJCumVbVtUnftjx8BQfBVNvQqcfPrz6QE+QFYW9FqGXfJIO2kHTXRkaqHomLRPuP9SG/xwGZ
	RrX6mt+JjWkTVyrx/bVjSDvoyfMeNhx9UFa+IPMljz2pMLXapt/Lox6R5m7pZ+3r7sjd55hQ2Xo
	++jLLdQiFYgMXuD/EFZHxEs7psbFUsZvgVZ6cRXvcVnMsKyZJpp671UPJVhnTFm5j8JoMJLQE2D
	2uDSIOpmJ1L+TvR0Eb1P09oRJy6CnXc644yG3jETSj9x2N0QiqqNl+qe+XbcVE/unvYvuMu++iN
	8bQ0GydnJAzuuUTror2OVl2HTrG2ci2L3DL9yW0flp7IOz0LrfbpI6pzVislfOeCXbtpSteYrPT
	WpBI06E1YClGE5aUchliryu6Czu9s3xQ==
X-Received: by 2002:a05:7301:77cc:b0:357:e9:dcea with SMTP id 5a478bee46e88-35700e9df2fmr13673130eec.15.1791875396383;
        Tue, 13 Oct 2026 00:09:56 -0700 (PDT)
X-Received: by 2002:a05:7301:77cc:b0:357:e9:dcea with SMTP id 5a478bee46e88-35700e9df2fmr13673046eec.15.1791875394852;
        Tue, 13 Oct 2026 00:09:54 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cab27d5sm46081248eec.17.2026.10.13.00.09.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 00:09:54 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH v2 0/3] Enable icc-clk support for Qualcomm ipq5210
Date: Tue, 13 Oct 2026 12:39:42 +0530
Message-Id: <20261013-icc-v2-0-196b219e25c1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADbZzWoC/y2OSw6DIBCGr2JYFwNUqHXVezQuBMc6SSsKaGyMd
 y9iN5N8k/+1EQ8OwZMq24iDBT3aIYK4ZMT0zfACim1kIphQnPErRWNoIfm906VSqmxJVI4OOlx
 TyrOO3KMP1n1T6MKPb/IzyYvkx3GSgjO6cMqoluzG2k5DodjDep9Pc/M29vPJ4yH1fuY7mOY4L
 pwlRDce6CHCUGUDrIH+B4ro2H9O7Tor1gAAAA==
X-Change-ID: 20261013-icc-4519fb86668d
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAyOCBTYWx0ZWRfX69TfbYmLov7l
 znsDqrc9J+rqPrjU8Dkdw09idiRlIqpc3ZSM3crZwfeTHL1cYuouJfjPFTGg7IKpz+5cDQZiQ3+
 fC+pNI/LxIFNMON+ccOtyMmZZ3zX/bbZF66vG+q70u/UIAq8xEgDpl4A0LgZIoB84pA6j/dTmXC
 RvRjfSqKzcoE11dLzBpWOPQieEQmC35HrQrDHF4enP+CMzkrkmVV594RHGmoTcoS6V5MjIKSY5c
 kHcki0jFEj2gCzUtRVOwHFlE+A4CYygPlvdhJnFWqwcGD+MNYdRFHuHHwiFHMKOjmdrCzJOm+lH
 LNi6PmfuTMzhlmVMB1dfOYpW2BuGDMq5W+mon56Dvly6vUcp350fCOVjqVWug+DdodqnGB/WwHi
 Jy/O9zXBFg3geQq+EUBPWUCwhYwLSyr0Yr77/YDPQHkmWq9/Jo/FZC+n5Gy+4prRVAgI/mV9j+x
 BzviqLRDm3fHk9MlpBw==
X-Authority-Analysis: v=2.4 cv=JN+uIMKb c=1 sm=1 tr=0 ts=6acdd945 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=wl81dVeC2YmWyYG1D1AA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAyOCBTYWx0ZWRfX7JFMTFBKTiS0
 3zPgcIkwd8+74dbyYZ0BgB3zMpZ8a/jZA0w7mMBELXTcPy1XxaclME2Eyb3xy8xD9MO73MXsUji
 QXMmJ4XzJHJB2Wpd3DQcp+O1dOqzqVQ=
X-Proofpoint-ORIG-GUID: Epc318peqqHYLqztxzgyzJE-FKrGDI3p
X-Proofpoint-GUID: Epc318peqqHYLqztxzgyzJE-FKrGDI3p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130028

Add relevant master/slave ids and update the gcc-ipq5210 driver to enable
icc-clk support.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
Changes in v2:
- No code changes
- Rebased to top of tree
- Pick Reviewed-by & Acked-by
- Link to v1: https://lore.kernel.org/r/20260514-icc-ipq5210-v1-0-b5070dfbe460@oss.qualcomm.com

---
Varadarajan Narayanan (3):
      dt-bindings: interconnect: Add Qualcomm ipq5210 support
      clk: qcom: ipq5210: Use icc-clk for enabling NoC related clocks
      arm64: dts: qcom: ipq5210: Enable interconnect capability to clock controller

 arch/arm64/boot/dts/qcom/ipq5210.dtsi           |  1 +
 drivers/clk/qcom/gcc-ipq5210.c                  | 16 ++++++++++++++++
 include/dt-bindings/interconnect/qcom,ipq5210.h | 16 ++++++++++++++++
 3 files changed, 33 insertions(+)
---
base-commit: 5ed59b3a5cb64e0ba357275df4862258e3872c8a
change-id: 20261013-icc-4519fb86668d

Best regards,
-- 
Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>

