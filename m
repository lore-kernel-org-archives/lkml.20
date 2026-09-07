Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA50037B3F9
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 05:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788759989; cv=none; b=aZQcbPCbDCP8rtRrw9R9J+ht4eDCPcZAYsziGMFy0Ihnvy3///UxAXBOwDdxRRvgQmFru0fb1B8XWTyWkP8LaMiPH60eXQoY5jiH/5pu8keL/ExivOhSojlHnfr4eZFSZh4HoyvcfLhw5KpNSXXmDuoZnXH9EICVGQjEDb4kz2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788759989; c=relaxed/simple;
	bh=SfJosVhKNJCy6SmyYSbzyePHCfGk8HW6DTp3hKzhqrY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=t/CoOQmoXyLaqtDh9zNM2HjHyK8ODPJbmJ2GBKNvgTrfC7Dp4wEIHiNfjjU8uiAlb733anqtQ73G6IIlQ1FE9ixRcOW/90alf077TNusw8+Tmk9PauWC5e2LjaQzj/cGqr7CtXU88iZ/Ev1un0LTAdR4GC8oYUIqQNHf5lwAPE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R08Hm582; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RjFiCR7g; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R08Hm582";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RjFiCR7g"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6875Ufq53121903
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 05:46:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Q4wrn6viJ00nxDXtCMsWNJ
	V3W7jPHdI5I+YOB3g6u+w=; b=R08Hm582mcpT7ADjSwmfC9cZCZE8HA8lxJh/2X
	mE3hgAndL+JoLUcma2ad7UnxnuTKjBOy9LQf18pUrz6Hj7tZ8jJ6r7LWF14eGO8s
	Ps4+xBAtD6Nv9DbKStm1+kFUsldnrh8q1JmyPJw52O9v0xiDAJbh9RNJUryEn8za
	w1sr/t3if1JDw5Pl2beHTTQvCSjr8pdcGTnT86waTxuG37MUe2ECbKtGCS2bc4qt
	wo4wN9ETuJh6a9lc+jUHfCPJz/hqF2jMm09kYxtW/+uKZyFqYUGgqJYPDCXzOEiB
	KiUFcPlnIiRLCNPLmvAqW5jnp0FekHmR7OZwaOCw++sid+cQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghq66g1m5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 05:46:26 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-396638f9a18so1287942a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 22:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788759986; x=1789364786; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Q4wrn6viJ00nxDXtCMsWNJV3W7jPHdI5I+YOB3g6u+w=;
        b=RjFiCR7gwdCnJG/16DXxqUaGNotj/XCsf8nFF3wg/52KLLcwOOSTsNLMDb3aILJk1S
         X0dPGjcgZdXdfcdeqxZMhabHGsviRy/E+9wqKutwYO2NC76oth7gW7TkGuM1llO1TrNw
         /YV5+h/Qm0sBPafG1zrb5X1ShoO3Kb564QTQsC/W+xEGKdzSXr1Y+ADkaXYAUw6C4YK+
         LDTc9nxqIOIu2CqomHrU44YcRzYlTrTJmlTNEOq8oDSq4L1fZpFN5VyO7gsUO0hxekXJ
         jDxcw0SKG/arFqBP1/7OylsNB5zSAaMW7cRUnO+SSh2RP+MVlhIKWbBN+cKNjKtuyyr2
         Baaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788759986; x=1789364786;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Q4wrn6viJ00nxDXtCMsWNJV3W7jPHdI5I+YOB3g6u+w=;
        b=IZIduB03PNXX5W3S5pIKWUkqt5khzDRHvTL42xwP8207zhfqCqu9sjfp1Pr4jDUPW2
         YZlxb00G3/b9dUR5hqV+PTzdrMAkQqpb+k0lD2Jx2FXAxoW2hgcszw4ctiZ75MeE649K
         pUjwCEEdO5dH1buDNPUbJy9eT5NU4GiLMvRctwcpTFjlOaoFSWx+paGlTssdzGDXKqct
         6k9svlVfovA13xPHba8nqO8f68g51iD2LeFrD21tutNswvx9A3qZA+EtlTe0rA1jYcIN
         bNWpjv9HwdiYsqabmzxR577aSrE0QAjKFQkGo3dfcXZYUbMDzunXm/K7KOqvOhX3VJRI
         ud/g==
X-Gm-Message-State: AFuF++kYVXA3jKsPRTQzFL/x0hWfTW9F//1rOsoGpX3JRQOv1lBnR6Ax
	laz9LhUu3sFRXKpuKAjehC55XxTkuvldEm0IOLvfsx0DknH5pzpt3M+6XjoMTgVR6y/yEHyDciN
	Z0G4CpvZKnnq38fpAT/jPXeK3A2pRbpkksw5ciiWVW7Lfdiab0nvBU//Tcxh/P/04bbM=
X-Gm-Gg: AYBFou3NkZZofdtc6mO4CdnFn0rp0JJf2pQ5V/DqWsaoeVwY1gmz/J9mRG5cxNTGIb7
	pY1DrLPGf7ojqn5k2a6hwM0vlumyURIMXddokO+iPoPP0/dhDa1I7Sqrmz2Eitnvp9DAfgg9AUR
	9QjbuazFoIKK/PwvxGa4aDsnPYCdPBwiqUBCAdgECIvts4sECDtCkyM8wKMN8oAuE/1qL1PUeFI
	NvGEXx5SA4wmsX040yJFRjzOqKy2UR6fpcXEcUMetkvHfbwjrtjvbRXHEUP4HtvykI1kJ5YVyjd
	LxnCHkWBBXPumFjuJtvN9RdSHK4JSBh9vKNSwb2guCYUPcpElopbI/wfW0Jj/xjYgmUAlM8Q4y3
	CE38JDhFmCNpqU8pcJVD0jtALvXhzTIGfer6w
X-Received: by 2002:a17:90b:2ccd:b0:398:9c00:29f0 with SMTP id 98e67ed59e1d1-39b2628fc25mr33982045a91.24.1788759985742;
        Sun, 06 Sep 2026 22:46:25 -0700 (PDT)
X-Received: by 2002:a17:90b:2ccd:b0:398:9c00:29f0 with SMTP id 98e67ed59e1d1-39b2628fc25mr33981993a91.24.1788759985322;
        Sun, 06 Sep 2026 22:46:25 -0700 (PDT)
Received: from hu-ssmaurya-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b8f44d7sm24022589eec.22.2026.09.06.22.46.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 22:46:24 -0700 (PDT)
From: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
Subject: [PATCH v2 0/2] regulator: rpi-panel-v2: Add required vcc-supply
Date: Mon, 07 Sep 2026 11:16:06 +0530
Message-Id: <20260907-rpi_reg-v2-0-0c59aa60d31f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJ5PnmoC/yXM0QpAMBTG8VfRubZa0xivIsnm4LhAZ0hp7264/
 NX/+27wyIQequQGxpM8rUuEShNwU7eMKKiPBiVVLktZCN6oZRyFcbkx2mYatYVYb4wDXd9T3fz
 2h53R7e8cQngAE9FdLGsAAAA=
X-Change-ID: 20260907-rpi_reg-8c6885b35e5b
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Shashank Maurya <shashank.maurya@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788759980; l=1700;
 i=shashank.maurya@oss.qualcomm.com; s=20260828; h=from:subject:message-id;
 bh=SfJosVhKNJCy6SmyYSbzyePHCfGk8HW6DTp3hKzhqrY=;
 b=aM4ZeAqC/OnBVtphNYrAhbU8cdn1h2Mi1mDpLrR5goJTp5yDeRgftyN1MbzAm2KFcdh1fSFon
 EW+GkhWJDvtD+bo5cMDevFlEhTzyCSYtNlUpwqgphtRM0dOghqEKZmg
X-Developer-Key: i=shashank.maurya@oss.qualcomm.com; a=ed25519;
 pk=xld72d+QYBwDMDcn3+QLCb5AUsj/D0j8klGIuxWd860=
X-Authority-Analysis: v=2.4 cv=QPhYgALL c=1 sm=1 tr=0 ts=6a9e4fb2 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8 a=Q-fNiiVtAAAA:8 a=b3CbU_ItAAAA:8
 a=JfrnYn6hAAAA:8 a=EUspDBNiAAAA:8 a=jWvc-858a9c_bLaJeVMA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=Rv2g8BkzVjQTVhhssdqe:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: tXAB-oJ8FXY7gh9PXSLjSZmPJBvhm225
X-Proofpoint-ORIG-GUID: tXAB-oJ8FXY7gh9PXSLjSZmPJBvhm225
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA2MCBTYWx0ZWRfX4n5P7LG3j+uZ
 UCK6hFb1RVRns0iOU1uRDi6/IARUZ0WxiJocXFbMYwuiTPc/O6nV/u4RXqJqJHRJAoatDFNP76L
 +ThcHOhoF9rKVxWf1LS36iNg49H0VBU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA2MCBTYWx0ZWRfX3tsw4YuoqxW4
 DzufP17mPt276v2I0IuLup+GqSuPPpX05W7YAVEyN1My5ywQVy0MGVATVWy8EYWiuDIUMWrJR2G
 HrwbdMiTQa34/nA4Iz8D8pje6UtzOIfK5tKep9ncpwjuL3Jxbx4M3QudRyMEfik/WeXBs0K964p
 YhkIKeY6pJU0rnIc3GvD2Ql2LrFO5sEm9VGdD41nPjKhSOBR4nD++xKWk4bSq5z/nOsINxBoTm6
 PFxAahcpNisZyGYYpZqaHe6A9OamJw1jIFYrrFOR6+xWzARZegsECdEkGrqNjTmCZ03nbd3jzMJ
 ve6UsDNMVqBvjiOOdSXryjYWFV43kb0Bj10tSDoUAYLPeiGKi7YjED3Etv8jnzchShlU+5x7hqk
 GlLmag2KyUrp95JS9HKiJkdR58SN0s+TOlx64k1jY+yBJ8W7Io78ahiedO2CiUpzC6aogDmtCIF
 RJs23DZESWF3XVxIMSA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_01,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 adultscore=0 spamscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070060

This series adds a required vcc-supply property to both the dt-binding
and the driver:

- Patch 1/2: dt-bindings - documents the vcc-supply property and
    marks it required in the schema.
  - Patch 2/2: driver - uses devm_regulator_get() to obtain and enable
    the vcc supply at the start of probe, before any I2C access.

---
Changes in v2:
  - Made vcc-supply required instead of optional (devm_regulator_get()
    instead of devm_regulator_get_optional()).
  - Added vcc-supply to the required list in the dt-binding schema.

Changes in v1:
  - Initial submission with optional vcc-supply support.

To: Liam Girdwood <lgirdwood@gmail.com>
To: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>
To: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-rpi-kernel@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org

---
Shashank Maurya (2):
      dt-bindings: regulator: rpi-panel-v2: Add required vcc-supply property
      regulator: rpi-panel-v2: Add required vcc-supply support

 .../raspberrypi,7inch-touchscreen-panel-regulator-v2.yaml    |  5 +++++
 drivers/regulator/rpi-panel-v2-regulator.c                   | 12 ++++++++++++
 2 files changed, 17 insertions(+)
---
base-commit: bd2a0c2d8c49ffb7acfcb0c1177af355ea417caf
change-id: 20260907-rpi_reg-8c6885b35e5b

Best regards,
--  
Shashank Maurya <shashank.maurya@oss.qualcomm.com>

