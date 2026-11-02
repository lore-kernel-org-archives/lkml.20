Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793615491;
	b=Sag5GrKqwK3km/kIdzwAf71In9xwxDPYIAxPqn8ytDeGoj4H9MIu5zTcHVtKgvngcg/7
	 v7Pqs33hqWKhBxSyi9rS5Wb24EysFhfjf5hyXmJQIzc6DcyPEZYm2HBzhPGxZgcpemubA
	 gxjmJzsiU1Fb5wCzuQwPVPS49ZjdxzsaECtoiQoB/gVsfVBFloNv4ui87zDabR6isWOQO
	 y3hRXvKIkuFQDRfuwAPW/StHbN3B+i67no4HvSyhWxgOcTM2Ch+tX2plxYm+STdG+6ISR
	 CP9fMYb6OEjeqMeI+JJS4fbWsGeG8KZfHKa5e4xasinYq7r2Zfw8rLK5+YSfbt3fcdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793615491;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=X6G6eDi1zFvPjRe676iwk5aDRyp3vEtrjiUQ2k5SddU=;
	b=mdp6gHYD7L1oU3pogoehP/9a/u72x4vzkf5qpdUhuGygmL+pVOTjvL8oVguSvIs3wFRe
	 hJnZTqiM/mDqp0KJWnJqXfDbd7EMp7Mpti2SrncxlyX0pAsxTylnvh1TMfbeCbh1cJFCi
	 xCHtn9K5z+akVu1CndoaSogrds3xiug3pEXiKI8y1dCts9GmMvGVX22htckpZ56OXpujx
	 xFnQUrwRoJcLpMhOpzIlv3sivmeLWJFuPPYVkcfpxQBPWGsDwq7QFa5ozWFna/eDriDLP
	 wX3DSU+kuiYgSF9xKgnSbF+ZBZsMmCGhhGqLaKSNFWAip4aulR67NWmrtn+S3+2YhmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c0WNWCEm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eakWM2x+;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E875606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 10:31:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E875606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c0WNWCEm;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eakWM2x+
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29A6BH2466622
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 10:31:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=X6G6eDi1zFvPjRe676iwk5
	aDRyp3vEtrjiUQ2k5SddU=; b=c0WNWCEmf6PuG5yqMvD+XbsBL10l9uPueD4R0Z
	GmQBiRyFG1lIi6+bL/Gk6Q8Of9yD2xIrzF/NzFkiKzo9IlHr1JeuzcTXGIjKuveG
	doEFnvIDapjoYLwO9CoRs9FdUc+EYcIfEgysfec46tMHvLsamo1UsAW6JnjK37vt
	Z9Myiq/1jlputvFZOgNNVgOgpJrUskv67npg+rgLye9uJ8GLCSk5qaS/7mj4krdl
	YUWJTwTum99S+3qsIB8dKWskKcMVl9SeghqV64pi2rylZSV+Q53iM4LCc/YFYlUr
	Nkz3tAYEchLAKWTrnDZWZ6rQXzU1dDyIAdnC/O9d/GktlTQg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpk9rhbfm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 10:31:30 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cb7f9bb86so576657185a.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 02:31:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793615489; x=1794220289; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=X6G6eDi1zFvPjRe676iwk5aDRyp3vEtrjiUQ2k5SddU=;
        b=eakWM2x+wZ5380a4XXbHhNnZvesEyB3ywGsgqEFV9vVTeoXi88FiAVxfZpH/CYt38T
         +jWgPlpnI6guUuQ9lSbOjtTJ0QUsQFuOUp1CVko+pxOWIykmBM6WLOQn8sn2iWg4jBCX
         YIoniu+GcBwIaKOB4QM89diVZ/d6quY7/HAZNvmd/JXkuqYoleppBGA0nHOLv72vfq/M
         VNjhluuVJkGdCOUp5QxW4dn1MKgA0nN+ga4jmWeYOsRngePCZeeT4aa16VhR7dfhMjzL
         CK5KGZd0lHHO48HtSvUc065T9uLu85q91g0g8F3XYGR8vc/xQrKQ5fcjNwslLz5j75M/
         7fBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793615489; x=1794220289;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=X6G6eDi1zFvPjRe676iwk5aDRyp3vEtrjiUQ2k5SddU=;
        b=r4h/sX2FZTe6rJLIM0V9/z2lU7WVevrrDsRNu4Rn1gc1eI2Q6zHA3kQGlNom4CkJGn
         feDi8LfTHqRFRqkrRtPFQPlLorDIg2vpTM3UtLJo5h/D4Dz5p5kzHl2UHpkZFAQhhLZQ
         uNsS7vZX6nPNHAB3v2qnp51D5eESY6sW4CVg3k9B2eU3wPxk0RP5LLJMUBYso50T6kH7
         bkfyxYw272FNfXXeHugzYlbYxOlcs0Eg/FaswOn1yhbEMaVvU2hE4UBRAvHPrMy1PpDw
         66Xg+4dRIaLgdCGzLW14EDN0WwCy5NMaN7GH0nDz644eT/j7NZnJ3M03vdMsOAmq1v3I
         kM9g==
X-Forwarded-Encrypted: i=1; AKwUvBx/vZhaNKlE01xms5kLbbNi/J6uqGX+MVnAnRIhUbO5h8e1Y547qQ70tvbUBccxcZCMK8AD+gRy3WFuYdI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLeEIRpCT+7LsRan0a5HH5I5so0ibEtVG7dyEKecgfYAL0bYZ2Z
	Z5f6lFjGrsHIE8riuo3NbUuD6HZZcglw0ah5IrTRrDt68O+wCESvy2t7Oki6oU6UT0LHmGMUlJY
	3A2fFvj26VB5VlIbTcoZZ6cGuUCiS+p12+sNTsklNInN6LkmW0HXWMcH0Z7xWsOVkofc=
X-Gm-Gg: AYBFou1G6JigTDNDZDCsCgcLAPFrUioZPWMCXyMCf99XrGK980JG+8IUn6U4dkmPo+8
	zg0xvX5j3c97lHw4NcecdZqV252C7++hWUuGe++alY8i931kQL4J8vta7X4wz+qF99p2LMAa+Fk
	EDHLmBwVcAOMW+I+ybe6PWsOaVPzB5oeST3NyyNDpt8KZfFiuH3olZgLOWUXQVGaHLqro4M9e4j
	/IisyxYVWclOtYQuXQ6/LG0MzGuMb64/W127VKP7t5jWemOY33N8oyz8nW0DUrONScRRFRe64Gh
	o/dofCwRmZVz07wkpubWrFE17PeAxqlaof+Ohz019iI3G38GSOdnfj1P9OJfdG3bYBvcRFwiMhR
	0GJDmyL8TUZa5wq7sZkdflPkJl3SQMc2K24CHTH73f+Bzlt0fN3ZbinSvU0Vj13xBJ4u+gp9XjC
	W88w==
X-Received: by 2002:a05:620a:260e:b0:93e:6b9e:6167 with SMTP id af79cd13be357-9442171c757mr1422081085a.16.1793615489200;
        Mon, 02 Nov 2026 02:31:29 -0800 (PST)
X-Received: by 2002:a05:620a:260e:b0:93e:6b9e:6167 with SMTP id af79cd13be357-9442171c757mr1422078285a.16.1793615488619;
        Mon, 02 Nov 2026 02:31:28 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7c5063e3sm327847885e9.0.2026.11.02.02.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 02:31:27 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v17 0/2] phy: qcom: add the SGMII SerDes PHY for
 firmware-managed systems
Date: Mon, 02 Nov 2026 11:31:19 +0100
Message-Id: <20261102-sa8255p-eth-phy-v17-0-aa138f2912a0@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHdm6GoC/2WNwQ6CMBBEf4Xs2SVttQU8+R+GwwYX20RobZFIC
 P9uJd68TDKTmTcrJI6OE5yLFSLPLjk/ZiOrQwGdpfHO6G45ACWUkUIoTFQrrQPyZDHYBQ0J0zR
 9U1NFkFchcu/eO/LaZm9dmnxc9odZmm/8g8nTHywXUKA5StFTpxXX+uJTKp8venR+GMos0G7b9
 gGjr1fvuAAAAA==
X-Change-ID: 20261002-sa8255p-eth-phy-6a0699f98a7a
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5874;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=8vCGy9/7sKiImVi9rZA9qfojhdTV0k1wjZeJxbHjq0c=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq6GZ7BAH01WmS/Wo3hQftVOORD0nMG3Oa8gZN+
 CZlk9qlqDiJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCauhmewAKCRAFnS7L/zaE
 w6XbD/4qsZmO+n0YYpPG6B/gYIJ6y32akfpdd7Dk84S3weLaSFH4W3jsTLeZPK8LJqjkugwpnz0
 Khv6lhbMkDLe3xXS2zVjZ44aMnNWRzkX6Pi7kFUxQhZ2SE3Wjs1R1zXNh6V/zYQu45Tt2me2sg6
 SM12QUULzctYv+P47VC1nwrpgX+weOYpFF3giebPWDG8WDm7TzsEDOi0F/xnoCfpvRvKsi8V+jK
 LbW7zIzrXSxWrERy3cQxALg/V465nzERV7pji6wPFunuivCupBoJeM1nofY9/hJKTrTJiT3dg1K
 BpV9OyhVEtt5GczvDs+WVDt9+7mkdPxfuV6Y2Y+fTKgdosDONwu32sqHJhIkR7YFovwLlXf3muL
 T9Znh4HO1GLWdBO/0EW4Dh9R2JNrxIfGYDfYMlXZOaE4+tIhXqEinKR6MKZjEZEYDB0jT/itXb8
 u+z/reErzBAU895wL+5dRuQEe+mGBVOu2xKWdyLC+EjrGjywn1vWgEMbV2JCXtfTPXk+9uUXrDO
 SD4SdolJiyL0YyIlItMhEuscqrx8DWT+5GjUAwnAjCK5oIpEF7POpIoNx22cMc3ol9SGl8dg5J3
 skrzowDb4tPucXw4U9i3FgxXO0OaVDS8+lFI7KU8pj5sh1mAEVksZhCehyxojui+l13eZCRoaol
 OCyJQKultaV3o6Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: lBAP3UprPRa0b_NnLGFm_qbx_7s2yGQI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0MSBTYWx0ZWRfX7avF5BPeKxDJ
 pPziwys6VkVLpzr7j3RW1OGGFPE+SLT4Ij22KLY6a+UUFVp5NbCztG9QSMG4tmJR9hsJ/RIkJ2Z
 +4wdm/S0Sv6jr4prscHf+qwQrL7YWuqJdx5RuHhTGOLDDzAJ6eX24OQk6yY7pTwugVzRAkDvpNf
 ESv410jJTx67LcGwV8JAkPDjbjvW/a2MFJAtvpf+aiAP7c1lgNwMWAC8rDqOSh+qELP5+ER4XHp
 Ht3LS4oT5sjTyye9DyM4Ww2IjTJN9+8FuyC4oJZRZZwMDa6bV0ZjgyCIBlrFqg+0/SxO/mr6+QZ
 I7UEj7cHuGWJIo26qy6it66gVH6Jx4lrICXeN9yqI4IoXr46ZMdSpjNSBqJdW2aj4Vv7dMqS5gF
 A2L66tVEUKQixEZT8u6uFHSPMms/Yao5JY/OI5H829f6hf0STXlS+PCVHoC5wm5xfT5+yNa4tny
 jshi5Tip5h5sek6tZ5w==
X-Proofpoint-GUID: lBAP3UprPRa0b_NnLGFm_qbx_7s2yGQI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0MSBTYWx0ZWRfX1PWskSE1mxNI
 30bitDB9Nzto2E2uNAP+UcZ26JzD3yMqzzv+1+wHDcr5jDbwfd0Bq8Md73tB6iDobBbsJOozB7u
 6KTP+LBflS3AiXQhvJ0o9QH6aVIryFI=
X-Authority-Analysis: v=2.4 cv=LvwHWXdc c=1 sm=1 tr=0 ts=6ae86682 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=PHq6YzTAAAAA:8
 a=h8s98YD0dNPsP74th3cA:9 a=fjkezMsj8msYObTX:21 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=FO4_E8m0qiDe52t0p3_H:22 a=cvBusfyB2V15izCimMoJ:22
 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020041

As Jakub suggested: I'm sending this separately targetting the PHY tree
as there are no build-time dependencies on the rest of the series.

Vinod: this should be good to go, there were no more sashiko comments
and this is just a rebase + a commit message tweak.

Add support for the firmware-managed variant of the Serdes PHY present
on the Qualcomm sa8255p platforms.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v17:
- Extended the commit message for patch 2 (Manivannan)
- Rebased on top of v7.4-rc1
- Link to v16: https://patch.msgid.link/20261014-sa8255p-eth-phy-v16-0-6310fac52e85@oss.qualcomm.com

Changes in v16:
- Split out the PHY patches into a separate series
- Set the SerDes line rate through the OPP API
- Link to v15: https://patch.msgid.link/20260923-qcom-sa8255p-emac-v15-0-e82f33720737@oss.qualcomm.com

Changes in v15:
- Squash patches 6 and 7 to avoid a potential hang-on-resume regression
  (Sashiko)
- Fix the AUTONEG_DISABLE early return path in forced mode (Sashiko)
- Fix Kconfig dependencies on generic power domains (Sashiko)
- Set the performance level back to 0 on unbind in the PHY driver
  (Sashiko)
- Use devm_pm_runtime_enable() where applicable
- Link to v14: https://patch.msgid.link/20260908-qcom-sa8255p-emac-v14-0-ec212b747a7d@oss.qualcomm.com

Changes in v14:
- let genpd's own runtime suspend/resume callbacks own the perf state entirely
  by calling dev_pm_genpd_set_performance_state() in set_mode()
  unconditionally in the sgmii PHY driver
- drop usleep_range() from the PHY driver when setting the state as the level
  setting is already synchronous
- add missing power-domains limits for ma35d1/k3-dwmac
- fix ordering of clearing the sgmii loopback
- configure the wrapper clocks synchronously in scmi setup
- Link to v13: https://patch.msgid.link/20260713-qcom-sa8255p-emac-v13-0-119f8699ef8e@oss.qualcomm.com

Changes in v13:
- Reapply OPP on speed change in the PHY driver
- Use linux/device-id/of.h instead of mod_devicetable.h
- Fix the "invalid PTP clock rate" warning on sa8255p
- Add commits necessary to allow correct link speed change with SCMI
- Link to v12: https://patch.msgid.link/20260706-qcom-sa8255p-emac-v12-0-e3ab1ecf2901@oss.qualcomm.com

Changes in v12:
- Drop the power-domain-names from the SGMII PHY DT bindings
- Add missing Kconfig dependency on PM for the new SGMII PHY driver
- Link to v11: https://patch.msgid.link/20260629-qcom-sa8255p-emac-v11-0-1b7fb95b51f9@oss.qualcomm.com

Changes in v11:
- Take a new approach: add a dedicated driver for the firmware-managed
  SGMII PHY and simplify changes made to the MAC driver
- Link to v10: https://patch.msgid.link/20260323-qcom-sa8255p-emac-v10-0-79302b238a16@oss.qualcomm.com

Changes in v10:
- Fix unit address in DT example
- Link to v9: https://patch.msgid.link/20260316-qcom-sa8255p-emac-v9-0-c58934e76ff2@oss.qualcomm.com

Changes in v9:
- Rebase on top of current linux-next again
- Link to v8: https://patch.msgid.link/20260311-qcom-sa8255p-emac-v8-0-58227bcf1018@oss.qualcomm.com

Changes in v8:
- Rebase on top of recent changes in linux-next which required an
  extensive rework
- Drop partial R-b tags
- Link to v7: https://patch.msgid.link/20260306-qcom-sa8255p-emac-v7-0-d6a3013094b7@oss.qualcomm.com

Changes in v7:
- Restored the correct authorship after learning git uses .mailmap for
  the --author switch
- Rebased on top of changes from Russell
- Fixed resource management issues in error paths
- Link to v6: https://lore.kernel.org/r/20260112-qcom-sa8255p-emac-v6-0-86a3d4b2ad83@oss.qualcomm.com

Changes in v6:
- Fix $id value in the bindings
- Drop patch 3/8 from the series
- Update init/exit callback signatures
- Link to v5: https://lore.kernel.org/r/20251107-qcom-sa8255p-emac-v5-0-01d3e3aaf388@linaro.org
- Link to v6: https://lore.kernel.org/r/20251219-qcom-sa8255p-emac-v6-0-487f1082461e@oss.qualcomm.com

Changes in v5:
- Name the DT binding document after the new compatbile
- Add missing space
- Make the power-domains limits stricter
- Link to v4: https://lore.kernel.org/r/20251104-qcom-sa8255p-emac-v4-0-f76660087cea@linaro.org

Changes in v4:
- Remove the phys property from the SCMI bindings
- Mark the power-domain-names property as required
- Set maxItems for power-domains to 1 for all existing bindings to
  maintain the current requirements after modifying the value in the
  top-level document
- Link to v3: https://lore.kernel.org/r/20251027-qcom-sa8255p-emac-v3-0-75767b9230ab@linaro.org

Changes in v3:
- Drop 'power' and 'perf' prefixes from power domain names
- Rebase on top of Russell's changes to dwmac
- Rebase on top of even more changes from Russell that are not yet
  in next (E1vB6ld-0000000BIPy-2Qi4@rmk-PC.armlinux.org.uk)
- Link to v2: https://lore.kernel.org/all/20251008-qcom-sa8255p-emac-v2-0-92bc29309fce@linaro.org/

Changes in v2:
- Fix the power-domains property in DT bindings
- Rework the DT bindings example
- Drop the DTS patch, it will go upstream separately
- Link to v1: https://lore.kernel.org/r/20250910-qcom-sa8255p-emac-v1-0-32a79cf1e668@linaro.org

---
Bartosz Golaszewski (2):
      dt-bindings: phy: document the serdes PHY on sa8255p
      phy: qcom: add the SGMII SerDes PHY driver for SCMI systems

 .../bindings/phy/qcom,sa8255p-dwmac-sgmii-phy.yaml |  50 +++++++++
 drivers/phy/qualcomm/Kconfig                       |  11 ++
 drivers/phy/qualcomm/Makefile                      |   1 +
 drivers/phy/qualcomm/phy-qcom-sgmii-eth-scmi.c     | 113 +++++++++++++++++++++
 4 files changed, 175 insertions(+)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261002-sa8255p-eth-phy-6a0699f98a7a

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

