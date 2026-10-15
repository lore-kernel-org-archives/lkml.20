Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3767A525A9B
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 12:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792069144; cv=none; b=EIt1CDzoqkPQNBoxZub7rij1IgnrkXC4b7iggPQIbSh3XIwJIgyaQhlP+b7QqsrWYreV+Hmype7q6VgXQRzhLZCiShAvz82QNT1Q7gYjHtKhulukXV1EumawVSoeahttSQPWYDYr0hRMelkTvK7XQDg08v6/woJFV/t72skC/So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792069144; c=relaxed/simple;
	bh=IfB0Yx8qIxej6QlE/yP3xJHhbwTmYhCiqc6qKYoTiIo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QcaRkFvA6fYsUn4bOqxIksbJmNWS152jZTeonZpY8piPqM3JzP5JqDgkxIAcu6gZrFH6BRvRKtoQvTHdQZmMhniwo7/viii4VfGU7KDNRFvQz5CpwS/q5jB+urXOPjAo4AfyoVdQbQIrd2Lk6MDX6m/K/07Kd5+9Vcwcek+S5/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R33TJxhr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=djwn+eqv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R33TJxhr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="djwn+eqv"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jKxB4077497
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 12:58:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cdafT9IpEe/qFVZ9tLxGA53KW5ipDMs+AxnCUnfifFg=; b=R33TJxhr9jNjXlaM
	ZlAkymb3LdVxZWYyu5glml/gQFZBgYVAL1WNE/QIabtRi8geFH3Z9ZrNQ0OEMiq4
	gDzfu8E6n4ifDtkycbiC4+DhU04xnLD2HQ/QYeffDKuAh9hPk7Q1aDe7fmF1Sb+R
	e7uanS19PfOB6HLcUzoVaRtAwyr9+qfL66FTNTT0kuHw9RiW4ZRbeku4HCjhYDtx
	nciDCc5oopJHMH+UftFQ9ep42x57wWMhu1ykpjWSCMbaQGJfIU1Sz9XwkH5jN33j
	tQJjA8xjd1hF9UxBzMGWI5gmrRf1/4ngqaX3AuYm3u47SYwyQKiqVR8o/Zy3jae7
	84AQDA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4havbc0sq6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 12:58:59 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cfc52ddc55so21322625ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 05:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792069139; x=1792673939; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cdafT9IpEe/qFVZ9tLxGA53KW5ipDMs+AxnCUnfifFg=;
        b=djwn+eqveYOtAeJBlOesUTdhMskTBAHkWM9aYqyxqyMGzvt/D20AjSSdewaqT3ciuS
         akb9X+ijHFO/1AIw3zJvMPDEIQnGYyz+IWl73r/kbRhaj0Eg+cni6HAVy6jcLLsHvMFW
         BbeLqGbHrNdyvH/ah+53/tUKwEuLXB/82Bs42t5MQc3gKJwzQb1KTd+w0I5WmzC+yRmj
         q/iQ0wLuiPM2RwmClnHJqO1U8ww5nvRmQ6ySowEWj0suHCy+C6GZMWOs4JkeOQuCHCZx
         dM1ngaeEfpnDMCYpTJ/ROQehnPKM8ZVljkrjAZK528TcQdQlANlJS3FFcgz+VZPmBKlt
         lVPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792069139; x=1792673939;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cdafT9IpEe/qFVZ9tLxGA53KW5ipDMs+AxnCUnfifFg=;
        b=JJGjnD/hGrs89Ic6kdp4Nv0/oPX8BYY8/gdh636QffC+BVFb177VfwWsoBPEhxF6c4
         Dkqsy7ytJ4U3B6QQ2DtdRKm0LkKtl1FPoNuLh3Ej8CsFgYyxqYs78ffyhN/iPh3cmtb0
         zIlMe5ggxas1ydDoU4/3L//sjM8OQ6rZGkT6wrGoq27bReIKdXUZRCgf0UnRAPU+Afe/
         OipxGLGTc9PoZSKyTh3oJggc+/WYbRrNXzGSRZCJCzPe1qPvZ0r2BT17ZfPmO0CFEfGH
         LdOjGtXc3SVvR0NTLcb16IAWHg0WW6QBD7uUIrKgXEitAFEC/o549J2uYXvPLHWACSrG
         g1Yg==
X-Forwarded-Encrypted: i=1; AKwUvBy0viBOIjm5y0e7tGRBJzBPMYMLYTdRxZPdqBTqRWFLIqV7wS9McRfOcgTVC4pCOhOlB0RjiQjoRV/Tajc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLoi/WA7KzxjstjlCJuj4uzHauK3B4ZhVtYGNmPkJI8dQAS+zFV
	X6TQJPHseInFttg2soBQ0Vr1F7HSJ1bC9Qu9QuPlYIHl3IdNC2GtgUIR0u84vzXJwP5XE0UOspS
	v7T8xuhGGJY5P3YbBZ0q/x5Lku3Nek7c3FkrmylwltPKaM0VpbjXxH7Avu3uZPIzc9MUc/worXb
	I=
X-Gm-Gg: AYBFou1wIAe3snqCatp8zawJuVjwmayy60ZLW9CSebUexUyyrThl8IzZWC31ULYQuNB
	hYCU09AZOA5b6vPghzYmFBlyYIMVWqzJGTINAeQhdNtUQBZFpUSza2xUHELGLdvhfM4blVXKNgN
	KVEIe9mnZ5YQv04WFz73MiPBqvq9DmgPevMoBw4i3jDqqslqKnKjZ4Tp6c3uCe4NPzw92hdKAfk
	okz7NQ4p61sfbmt1Z2Z7OSSuxOybUHKhTDc0j8DyV22jG1BDmIuZWz0jTk3WFyzjDmn3RL86Sxh
	PKLvDG80N5UGdMnodFQ5ycKF9l1dFtzc6ypChFyoR70wdr+R9VFQEynH81sC2SXoxhgz8edpZBr
	cv1bnWD7ALpgOz9xUYhQj1axKFYIJSIb9Iw==
X-Received: by 2002:a17:902:e844:b0:2e9:3dd2:a90c with SMTP id d9443c01a7336-2e93dd2c030mr46203605ad.20.1792069138737;
        Thu, 15 Oct 2026 05:58:58 -0700 (PDT)
X-Received: by 2002:a17:902:e844:b0:2e9:3dd2:a90c with SMTP id d9443c01a7336-2e93dd2c030mr46203185ad.20.1792069138151;
        Thu, 15 Oct 2026 05:58:58 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8d8dsm79691705ad.52.2026.10.15.05.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 05:58:57 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 18:28:23 +0530
Subject: [PATCH v3 3/8] soc: qcom: geni-se: Remove OPP rate reset from
 resource deactivation
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-derive_clk_perf_tbl_from_perf_domain_opp_table-v3-3-5da1096243c9@oss.qualcomm.com>
References: <20261015-derive_clk_perf_tbl_from_perf_domain_opp_table-v3-0-5da1096243c9@oss.qualcomm.com>
In-Reply-To: <20261015-derive_clk_perf_tbl_from_perf_domain_opp_table-v3-0-5da1096243c9@oss.qualcomm.com>
To: konrad.dybcio@oss.qualcomm.com, Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: mukesh.savaliya@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-i2c@vger.kernel.org,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792069108; l=1581;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=IfB0Yx8qIxej6QlE/yP3xJHhbwTmYhCiqc6qKYoTiIo=;
 b=Zd6cbJzhVcfg5m7L592QpSVIs3TRLPdOEmoQnflylQwBkeX2I0dQtln64gsDM/IUxq1NCdFzq
 zvQKI9Tl6pCCXzMkBBOYEO0FnTGm8FbKdcm+SuJek/e5nZsnofoLMfw
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Authority-Analysis: v=2.4 cv=QbvzLcbv c=1 sm=1 tr=0 ts=6ad0ce13 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=dehDsB7WAhqrwfXEkZwA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1MSBTYWx0ZWRfX7RPagQsyDr2C
 dJvUto7OaJDfUTiulK8iwr1fACq+OQ0ELVGimBHyjiPKwwJKhd3BY53VLxlQI/F2E4BjaNCCmNO
 EOOZ8zkMsJ6t4CVciKXtSFFmFfyCfpI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1MSBTYWx0ZWRfXz0QyUhKO4Cl7
 q3mB82unmoQcytPGVnLsPDpXc2WW5cPekh0JuIU9CC4brvoed6biB+8Pd08Y3L2UWws33RCWKy/
 ZamDCvrPOgL5RJ+AbLyf0sBufZ+FqNir7srtDHK9UUdhq1TSTublsAVJUvr+AaaPD24UtwxPD9l
 JteGvv2o2bz70asvCj1x3jEEXtPJIjzhRGWHYoxfAuiiXXGSSd+50yDoT2KfGtcQglDfQGyvUrF
 G4AR5LR9ehhJbcjwtczJAIjUW6+7zvgpqJOuvXulUYua8FWlMd20QWT9jTkLlEQ1UXXAXXQ6gps
 /oY+/g9Gs0VXMSVh9hOFMjLJv68gp/Z8BUsPqMztxgB9L8GYsNAntnJqZQQ2pU7j0kQKBdvnkT9
 uRbEZUZn3zBQ9yNslFFGat+cT2pfdpK+d/oBSNJ1Mc1H0G9wYVxnh1xTA5mFaJnb1043we10Q9R
 vKvD3GO25Ile7AQR/HQ==
X-Proofpoint-ORIG-GUID: eDcAOpCR5E14dEYd994mVCHmxyUh9_io
X-Proofpoint-GUID: eDcAOpCR5E14dEYd994mVCHmxyUh9_io
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 phishscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150051

Remove the dev_pm_opp_set_rate(se->dev, 0) call from
geni_se_resources_deactivate().

OPP resource management should be controlled by the consumer driver.
Additionally, clocks are already disabled by geni_se_clks_off(), making
the OPP rate reset unnecessary during resource deactivation.

Reviewed-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/soc/qcom/qcom-geni-se.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
index 97905bd6d363..6163c19c6cf8 100644
--- a/drivers/soc/qcom/qcom-geni-se.c
+++ b/drivers/soc/qcom/qcom-geni-se.c
@@ -1043,8 +1043,8 @@ EXPORT_SYMBOL_GPL(geni_icc_disable);
  * geni_se_resources_deactivate() - Deactivate GENI SE device resources
  * @se: Pointer to the geni_se structure
  *
- * Deactivates device resources for power saving: OPP rate to 0, pin control
- * to sleep state, turns off clocks, and disables interconnect. Skips ACPI devices.
+ * Deactivates device resources for power saving: pin control to sleep
+ * state, turns off clocks, and disables interconnect. Skips ACPI devices.
  *
  * Return: 0 on success, negative error code on failure
  */
@@ -1055,9 +1055,6 @@ int geni_se_resources_deactivate(struct geni_se *se)
 	if (has_acpi_companion(se->dev))
 		return 0;
 
-	if (se->has_opp)
-		dev_pm_opp_set_rate(se->dev, 0);
-
 	ret = pinctrl_pm_select_sleep_state(se->dev);
 	if (ret)
 		return ret;

-- 
2.34.1

