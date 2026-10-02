Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB451EEB3
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 13:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790946196; cv=none; b=AF+RdiRMMR9Kk7T3V3+Qca7RmaOVNhqDJ7WwPHX20FhanXaCY5aodBSgPv2ZCNNlw5PLhD13umMwFUbyGeGeLFXGoJxwmi+baAIIqj22dmWAMBesgXdk3aoo766tSsHbgR+deTJwJij1oXRKrw+vhpmrPVi3SqkubKjEoqSpp+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790946196; c=relaxed/simple;
	bh=G88MQNCCk6+2kZL7bQs1s3QaPljp1R/z4iWolXLINHY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qC5BavgNvywreskqdiTYGGQJidOuvr8shPprFKmLwfeCN9ZOa4OTMm9ZI0uDz0dC4WJ8/w2Ti09T3XdgN5oZviwHmqo3yxwmg8oJ61JDzUstte3epqUDx6GdGbGIp8ckw0QhGZPGuRGWdWJbrGKcHTjZL+45ie9MIq5PVaJsJdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R6Xo5hkr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TegXK1ZX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R6Xo5hkr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TegXK1ZX"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6929nj0U1434226
	for <linux-kernel@vger.kernel.org>; Fri, 2 Oct 2026 13:03:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=GP30sOCRIKoAeEz/cHgB2U
	Qvyt440qgWZHWaH/mf8u8=; b=R6Xo5hkriee5XE9TdlSXmvkMzS3TvgHZFH4Dwv
	0gBCJ3mkLJLkPJAOG2WfTKHpoQJpVOv+X8bv8oWFs7jMU8VjomAvr3OuAct48PdK
	1PJozOtTz6aX808DI6mG4CJnp6qf137aXUN6d1TYuOs9aHQXxlxAHMdlgyZZAKxT
	x1NtSH6kJ+3jLFpcquPVvYHGwd3jZHoPKc5oX+W6SisE9w1eTH4E8kEh5GXV+6Si
	IjLwsrjM1OgjZfAesLzaHs0nUMMTVuytNOfazxptGlJvXwIm+pPZAEd/2GWdxRj6
	jjvB86RWK+kUs56dl8DV4bwFrmn0ytUEi0TdeX26z8uhz4Rg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h20sh2cek-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 13:03:10 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30c0d568830so14694868eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 06:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790946189; x=1791550989; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GP30sOCRIKoAeEz/cHgB2UQvyt440qgWZHWaH/mf8u8=;
        b=TegXK1ZXVNdizw3FFtxb4AjbrufOhVBD9yXN5ORakOB/ixPfO+IlNlOUwHsMutT9ea
         Pe14WfmslC27kOYl6hvzf1LG2SjsBtV1JzsdabpiqWuumWdzzzSYKvR5VTxoY8YiraC1
         FcMWU5ilIi1SFgecufwBbPSRybzdmasJhppBRbV8ESshHD2FCKAHtyYQZfvnbvoM417i
         65gVbBAAT8sL8osyeKTo7vCmCx83v1Lba5zQKDN+ZY00ExQr23kZ6Y4MuVXDCDt+uuZj
         8ULcn1f9iuSAlnEq/YbX0NWlIti1qqhyLVtfH0vUXDrp8KO5RM7C8ONkbkTUI3RDnP3z
         kAyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790946189; x=1791550989;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GP30sOCRIKoAeEz/cHgB2UQvyt440qgWZHWaH/mf8u8=;
        b=N3LNnwezZwqYJlpEz3bS4XlnejcgaUS6oFdCtNQXHl2CGZgkn3weBHleaBBNHPbcnd
         en4tOGODdNa325aPtM+pTfGpaFBy4h+5gxU43ztQu6y54oasr/wQWaPBLMv3iKm2Psst
         P/Kx5FBbATw08tbyK9BoVdJ8EToVNIoFou4hE8lv2rr+j13jYC0uqMvsTGD6w7nxza1T
         iLJuL8J4eV32ueCv+cUZGqSE8ftde/5zR8NHOBFNkd0h9kveF+BYcHoa+cPv+0lpW/KX
         kyFyYyeciPmdmMU25tkteAA2Sxfixm3M9MMJ89vlHgPAc4bnERpvU2J6M6SYybs252ae
         65jA==
X-Forwarded-Encrypted: i=1; AKwUvBy2ptZk8ObXgTo56oTtDmtc9SBt3Agi+CuE1P7iO3OF0RNqUpvDGNxeJLknLD6GvMafvwOKIOvPFYihS14=@vger.kernel.org
X-Gm-Message-State: AFuF++mnXnvuetXUseCxU858uGy3vfBXkEUxSDPX+1z+9oWc9RY+OuW1
	aj2vFzHZ0h8P+V/Fpuk+zsPERFzJ1uhM7JgO7YrgOHjhkkO3rqEoLYivOKJ8xUR7hfeqysByJmd
	kubUSOWV25tLNSAkusKm2BnK5gRcoqIXDWI3AKS3xqVDwauV9OljXfBAMeWwM7COifELADiEBKs
	g=
X-Gm-Gg: AYBFou2nsyw5WkuhFZ/jfoff4DxF8oDn4LQZnBB5X4A9LLLpwDzLKfMsXEvxC6/FDPq
	Fb9EOO5YnSo88FYsIpko1JEeQis9xajl3ll5oqgrnsjREDb1SsSC+IfLgbH0uGnS+zf7xT7cPeQ
	3NypYBhVszp6rl78F5fJnua2Fnh+BJA5F3dTJzKIbcO3XkgDupVi0n8RWyTAcCiRll70b5IgmIa
	wcswVpQao5TIh9prkgmRs8B22ojVYPB3HiHuqnbMhgHB3jDVvCIDsEzJ+2HomiKhNOmrne/19Vi
	HHCmtMMjf2swoL2yuZLoVQB2TTkQ2jMQo3228YoA3XJUOinY3L/Mr6TicbadxoyycKE6b9fzIBR
	hYJPz3nI/oIkBvVnqIKT+gAQRGmSf7jzu6Gnzk/sYk8vjVYCo2VetbcNnjxaKsFsheytge/hZqf
	2FFsdvVKkWY9vPMCMqlYS1oKhI/2L5JfHHIQ==
X-Received: by 2002:a05:7301:f2a:b0:343:fdea:998 with SMTP id 5a478bee46e88-34f150e38fcmr2658525eec.19.1790946189392;
        Fri, 02 Oct 2026 06:03:09 -0700 (PDT)
X-Received: by 2002:a05:7301:f2a:b0:343:fdea:998 with SMTP id 5a478bee46e88-34f150e38fcmr2658491eec.19.1790946188750;
        Fri, 02 Oct 2026 06:03:08 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3510752b575sm4217543eec.6.2026.10.02.06.03.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 06:03:08 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Subject: [PATCH v2 0/5] Add support for reporting boot status on Qualcomm
 IPQ9574 and IPQ5332
Date: Fri, 02 Oct 2026 18:33:01 +0530
Message-Id: <20261002-imem_restart_reason-v2-0-61703c6362e3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIWrv2oC/22NQQrCMBBFryJZmzITSCWuvIcUSePURkyjmbQop
 Xc3rVs3Mzz4/79ZMCVPLI67WSSaPPs4FFD7nXC9HW4k/bWwUKBqMMpIHyhcEnG2KZdvOQ4StdO
 t0Z2x2orSfCbq/HtbPTc/5rG9k8vr1JroPeeYPpt2wjW3GRAA/xomlCAPptNYG6gB4RSZq9doH
 y6GUJUjmmVZvontxmXPAAAA
X-Change-ID: 20260929-imem_restart_reason-15c5b95f9a5a
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA1MSBTYWx0ZWRfX6Enp4IbEzVjk
 n/yOAw+8JtN0S1DwW7OC8tbpO+kaXjhrwVtEJl3zDpXm72UMuxS9C4ecfbJJaFrnM7/SFdW/KEh
 C1KNcfd783WtOYMV7tWqEA6RxMpB3QM=
X-Authority-Analysis: v=2.4 cv=IpmL47/g c=1 sm=1 tr=0 ts=6abfab8e cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=BUjP7g0EBgjMYpCN6FUA:9
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA1MSBTYWx0ZWRfX3YR5f6jq+lQn
 +95WhE4thEnkVoa+BMpBkcBmj0u9MxAGB70W3K+6VVYdrzSIxor9deKo6NmeAwK73LgeF+CC8or
 X79NIgUX9596BB45f1edYQDLPZX+tJIxZIoW6sf5aQnNSwt4QtyDfUtkr4Z595yAMDYXOJUjdLF
 BiuGHooXlDION1cFKcKOF2YNVaMol3jHyMXnRatytEWLyalKkh1mwXJ5znaZbpMd5XfmeVIy4eJ
 p20aAsJwOUTq1m1sKP5ZqY7f+3rqMd6UeWaDK60rfvTfIAao8sFwG4phArU7YJtreOYNnftkDxV
 WN5+CLnC+e2+FbkJnV4NJ1J2NDQxmWD+jn7sY+KC3ikTa8g6sq0I1puG2ZVbRB/ZcWdrqe1Z/nz
 wuaM4mMJwem+asxmW+GHpKPK+T8Hoa/OqjSre3Zxa98kDqf2/ydfp/6A1U8PWFkFzrofQJMDjUt
 FH3oIcLNZGlg7apB5Tg==
X-Proofpoint-GUID: 2WS-XECRnxgPn9gR0MR3qTm7mVaN-SwQ
X-Proofpoint-ORIG-GUID: 2WS-XECRnxgPn9gR0MR3qTm7mVaN-SwQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_03,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0 spamscore=0
 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020051

Similar to IPQ5424, add the IMEM node and the restart-reason child node
on IPQ9574 and IPQ5332 to enable reporting of watchdog boot status.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v2:
- Placed the compatibles in alphabetical order
- Fixed the unit-address in the restartreason-sram node in 4/5 and 5/5
- Link to v1: https://patch.msgid.link/20261001-imem_restart_reason-v1-0-79f516906010@oss.qualcomm.com

To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Abel Vesa <abelvesa@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org

---
Kathiravan Thirumoorthy (5):
      dt-bindings: sram: Document IMEM found in Qualcomm's IPQ9574 and IPQ5332
      arm64: dts: qcom: ipq9574: add the IMEM node
      arm64: dts: qcom: ipq5332: add the IMEM node
      arm64: dts: qcom: ipq9574: add support to get watchdog bootstatus from IMEM
      arm64: dts: qcom: ipq5332: add support to get watchdog bootstatus from IMEM

 Documentation/devicetree/bindings/sram/sram.yaml |  2 ++
 arch/arm64/boot/dts/qcom/ipq5332.dtsi            | 16 ++++++++++++++++
 arch/arm64/boot/dts/qcom/ipq9574.dtsi            | 16 ++++++++++++++++
 3 files changed, 34 insertions(+)
---
base-commit: 6c2cb8b8b843d216ab549b678a0d8831c43153e0
change-id: 20260929-imem_restart_reason-15c5b95f9a5a

Best regards,
--  
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

