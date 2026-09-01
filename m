Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 918CE41E6CE
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 15:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788276207; cv=none; b=Qx4XE4c871FuVOJ2MS89o24fCLEAcIbE04sQWqRHXegbYCoS4RkPDrVcRXpSknA5wBsJrYc3QhDVpIZGAZ61PQFZTYr9GOpA738m9pui7mVZZjHwMjn2Ia/lzRXbHYPT5u3cDM7t1FZwjkKHj2W3Ja4jhIJIcUTC0ob8TcCYiTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788276207; c=relaxed/simple;
	bh=T4zyejV5117qdy9dqEq+zOPv+7e+CzTvpZD8haDST3A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=LFxG5am8IefFZ5yIqgoeVfdHP0GUbrbVqHq7u199GXsIqElVTqUudOLpg9NuZ4hGBGptsX+5RQAWBaLUeBkOs8Im4siHkBzdH1uqe6eaLffTW6Nv3rD+dDYbzd0TIwupseX8wqD5sjrRIbZ19DnulL9hXFLSpUOJBHyeSnh3qRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BG4MTk15; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bkd7ekHV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BG4MTk15";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bkd7ekHV"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681E8ffa3002493
	for <linux-kernel@vger.kernel.org>; Tue, 1 Sep 2026 15:23:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=CvsCp8vxzXRT+34RQWYirv
	xRtl7bpIDhNcvHwwgurxE=; b=BG4MTk151wgfk7DDVmZ1Eb0UP37VMFsyt52gbE
	ruxlSq9/CuCOKHqFnkix4vua4WZs1LUS62oDMJyywJXDf3H+W4lCQswYLe5Sal3z
	KaZHD9XJoUX4SK/DjKtIqahWguy7mak6PinfuSn1HWadm1LCWuEt0lELVVBxPdS4
	0UT8Z1m/zU1JLQE32NqjtNEsUXzony5L6j6FB6y2/azepg1oNx5X3fNLVMePMcc+
	Ea/8Kng4aRc/8CVUXOiP/fVoSoYca0/HZe3MUksrAlG0Q9a7BWHfELe6i2GV8UWp
	GpwVT40fjD5iQX6W3FcMFRyhG83wsSR8WQu1cnGkadzbuL5A==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdqbh2twf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 15:23:24 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-73a8aba30a4so916402137.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 08:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788276204; x=1788881004; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CvsCp8vxzXRT+34RQWYirvxRtl7bpIDhNcvHwwgurxE=;
        b=Bkd7ekHV9CwFmmBPKmT27Is9gKI0PoZ+dgBzctxg6HzLWHfU1VyXjlcITf46/EAO40
         Qcc58kChyKW/Qqlr5ZpaXe+YcMk983erAyEvzuaAVzwIM9S2VTa5bs8oHRy7JQKZZNGJ
         nBy7XJoXdNSKy6fxaBKY1X0FoFoViUdW/tCkdWu8w9AK+fez2Xg/ht2Pd0I7SLXhjGzv
         QGbqjXkWq0OwYUGgRTC3s5UNCpQy3968xBhf3JvvGfj9REzxmghI/rjgiHM6tsGFQCQX
         eVKkakS8DU28MnYg0KbTerbYiTrHDmZEalziRObrC4ZT46TjyZdN5BCSspaNOmLxPi8d
         MYvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788276204; x=1788881004;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=CvsCp8vxzXRT+34RQWYirvxRtl7bpIDhNcvHwwgurxE=;
        b=ZHEH4Fi/7OMkZQHlnKeJ5hpmbI6F3VxJiaVktr6zZgiq59+X0qRrXoTdlAFV0kJ4GV
         8yyUEu4gqmRm+WMDOnVbUEZbxRZuA98PrH5yA1injeeIVas4l+I0yNQ2KDFdjSBGYCPV
         6yvK2IM8fphheHqP/sH8sy5LvIHNkjfAoffOHc/vKWU4AmYlycEP9Yc3Kt1oNQ5qDEL+
         G42RM4MgGokdlaIrbhAVhGa9ItwCIQVMUbO6mQDFk7wix7X13dd2d7SQIY3h4U0HCsEz
         KE0aipLuWB9IEBU/P/dvysmnSiUz1dTJmSNCaIFvdldxZzn2JUQBtAkAKxmLDzlgzNGF
         wrUQ==
X-Forwarded-Encrypted: i=1; AHgh+Row6k2Gy4KLbveAXawkHnaPiQtl3igc5wCb63bIWG6FOsEkC6t8yaE1TexasPkq8sZwsP/HEx62gzcqEqw=@vger.kernel.org
X-Gm-Message-State: AFuF++lqNpApZftiu2xQUnggb3ktONNY9WouOGCCHmwnV1WvEk7yJ7h1
	Ww2U+03io0lmRTtPhUA7K6IXF0WCrukQ20a1D34WxjVmz7O3EV6zGOuwt3gr6oSX4rFHt2kaq4g
	6SVoED6L6bnb/XCrgXqKvzswoZdMrNdtkXw0PYd9AIb439DijS7DDkUpYrAz4n9V+T1c=
X-Gm-Gg: AR+sD11zIWjnldVEulptqSdhTuDR0gETmangzEdkfZPExRlzX0M+LGOUV4yr+lokXht
	Fd17bVRliNhk8McXMx16CF/qcOvc3eJe4ILN8pzN42BjZV/d9PFvWtjvgskYuOa7QptjG5+Uue+
	TqOEUVTz4xiHUL21H2cixRLM94bHKa3vePnYrSHY0k9yW1dOjEz4PF5HO9ml4Zikhdh5J38mpkV
	GfzeMl2pkvwZ9hyxrZt+vdsIF0iuaRuGJPVJX1OWwwe+kdL9D5psGAK2BeZ8rmJ/vi6XHd+RotU
	pEqWTXDmBI7dGDpSnGG5zDaUsQA1lBgcnHcznAMbDBO0IlLkZb2YSzXkYMKDPsUJCOHEq+UqAxW
	7ejYUGy0IXY57ye0sgey6fazcRHO1xLy+i0n0KZH9T3Tp/980flwmyCNMUchTCk2hIC6uUuRijf
	lHW7dG74jxS+dHhtbDCUJQ/tpqks0QIbVmFUaEStAXs/r1Bneav14=
X-Received: by 2002:a05:6102:44e:b0:738:f27:43fc with SMTP id ada2fe7eead31-78a027fb048mr1454507137.2.1788276203563;
        Tue, 01 Sep 2026 08:23:23 -0700 (PDT)
X-Received: by 2002:a05:6102:44e:b0:738:f27:43fc with SMTP id ada2fe7eead31-78a027fb048mr1454492137.2.1788276203066;
        Tue, 01 Sep 2026 08:23:23 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:75b2:b8ff:76bc:21b5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce089c2sm74403535e9.2.2026.09.01.08.23.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 08:23:22 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 01 Sep 2026 17:23:18 +0200
Subject: [PATCH] remoteproc: qcom_common: load pd_mapper before booting the
 DSP
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-fix-ath10k-remoteproc-crash-v1-1-c615a1ccb67c@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAOXtlmoC/x3MQQqDMBBG4avIrDswGaygVyldhPi3GYpGJlIK4
 t0bXH7weAdVuKHS1B3k+Fq1sjaEW0cpx/UNtrmZVHSQUQK/7Mdxz0E+7FjKjs1L4uSxZu5VAO3
 vA0aldtgcLb/uj+d5/gFB4xZjbQAAAA==
X-Change-ID: 20260901-fix-ath10k-remoteproc-crash-420ee2456e92
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>, Chris Lew <quic_clew@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDEzNiBTYWx0ZWRfX5Z6LypFEQRvp
 O9bJvVAByGD+EP3CkhuxW405wxq2556HsGlIfPmvQaxFhN2K3S5qRhkoqSoNhRf1taDGChkHMss
 m3ovM83T7/lpCa/8xvXFSH+lg2YIgtc=
X-Authority-Analysis: v=2.4 cv=R9wz39RX c=1 sm=1 tr=0 ts=6a96edec cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=QPX1PbDhblCrr_0_TUoA:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: _4GZqn2rI21_qRYIDMwiKuVkvUT2Fd7Z
X-Proofpoint-ORIG-GUID: _4GZqn2rI21_qRYIDMwiKuVkvUT2Fd7Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDEzNiBTYWx0ZWRfX8gTt/xEOCRBg
 0ui5BibcjlFYrmxuHXYRGxJODFaMFNh1sA1ADysChqPdVF/gmiaEF9KDn1p7OcxWlBMmui7hVi2
 QPuImfa9S81SHcBsDj0ZD3bY/zbxYtzzU0U0sntsNTgJdqOEK+QLlo5MUVwvocPBh2GSju5vifA
 pxFwLrp35/dWGf8iZpVSNPKKvMjlgUfC+v5tb+BNkMsVKgRZUHwigvLqCc36/xVPWgmU8Pry+uR
 lGezt8bHHjUgNKUnvek2deYfJ5bYAGBp9AhyDXICDPrqQPsY1CBothhgUDOzVPwihz0oo465GJ7
 0oJR60dVvFdU4IxFXPx2OZpmXs6kJ/Vj9x2Wc1/3yN5OtIMEdgWbOnk+/gEGu6zClYarG1d0wvn
 t1n/R08k6aAx03nEv1A3mOQWosHyGgwLG8Zt+c+ArfFl9DIFd/LijCjDU81m1M/DwcLtc7kuRzb
 C1XcgOiDAsfx92C1zmQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_04,2026-09-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010136

The pd-mapper auxiliary device is created by the Qualcomm remoteproc
framework, but the qcom_pd_mapper module that binds to it may be loaded
later (asynchronously).

As a result, the remote processor can be brought up before the PD Mapper
service becomes available. When this happens, firmware running on the
remote processor may attempt to access the PD Mapper service before it is
ready, leading to failures such as firmware crashes or watchdog timeouts.

Declare qcom_pd_mapper as a pre-soft dependency of qcom_common so that
the PD Mapper module is loaded before the remoteproc DSP is brought up.
This gives qcom_pd_mapper an opportunity to bind to the pd-mapper
auxiliary device and make the PD Mapper service available before the
remote processor starts accessing it.

The soft dependency only enforces module load ordering and does not
create a hard dependency. If qcom_pd_mapper is unavailable, modprobe
will still load qcom_common. Likewise, it does not guarantee that
qcom_pd_mapper has completed probing before the remote processor boots,
but in practice it eliminates the observed boot-time race by ensuring
the mapper is loaded first.

Without this ordering, WiFi and modem watchdog timeouts are observed
during cold boot on Agatti and Arduino UNO Q platforms.

[   19.955751] remoteproc remoteproc0: powering up modem
[   20.069985] remoteproc remoteproc0: Booting fw image qcom/qcm2290/modem.mbn, size 8881672
[   20.310311] remoteproc remoteproc0: remote processor modem is now up
[   60.320801] qcom_q6v5_pas 6080000.remoteproc: fatal error received: dog_hal_common.c:173:DOG detects stalled initialization, triage with IMAGE OWNER
[   60.320868] remoteproc remoteproc0: crash detected in modem: type fatal error
[   60.320881] remoteproc remoteproc0: handling crash #1 in modem

The modem eventually recovers after the crash, but this delays the
availability of the WiFi feature.

Fixes: 5b9f51b200dc ("remoteproc: qcom: enable in-kernel PD mapper")
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_common.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/remoteproc/qcom_common.c b/drivers/remoteproc/qcom_common.c
index 5294e327f1587efc917eb01dde59bd1e723c225e..0dfe9f16eed328807f178e0399b11f2c819bb270 100644
--- a/drivers/remoteproc/qcom_common.c
+++ b/drivers/remoteproc/qcom_common.c
@@ -627,3 +627,6 @@ EXPORT_SYMBOL_GPL(qcom_remove_pdm_subdev);
 
 MODULE_DESCRIPTION("Qualcomm Remoteproc helper driver");
 MODULE_LICENSE("GPL v2");
+
+/* Ensure the PD mapper is loaded before remote processor bring-up */
+MODULE_SOFTDEP("pre: qcom_pd_mapper");

---
base-commit: 786262be6048deab760f68c8acc2c85607165894
change-id: 20260901-fix-ath10k-remoteproc-crash-420ee2456e92

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>

