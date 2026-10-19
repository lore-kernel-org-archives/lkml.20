Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2FD2534E01
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792420769; cv=none; b=VCcrT0+YVnZxVPyOXMytZr5fyeL+LqUoljrMzr/GRsUPtdzfSDUvFqlBGZ2/hOzlDAaMCVd/ONbZrwSZh1ClrVM7sm7KQAIYgcWIhkPAyCvd70qHR+pKQp2ANgRV/aT69bAOXYdz7vFi6nVWr/Aj5nltk7SnUEKiLPetlrHlWZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792420769; c=relaxed/simple;
	bh=BK0a94vpBIqq+Gxmo6AjIyQcf/Pq7YHz9PAFVnNn7/w=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CRR2kOxWU27bIQg02c3SauvUPGWbRIpJqlkLGvnw/QlPSDRtK6iCZdQg9/3ofCiY8SmWw0OhimFHsHYLO8Dx2IQRzsvdzdcig8jOML/Qo9N2qOYl+I7nqf1NX5r0eYPQ80oye2db+Bix4lKwEb0MhI81JjZFAW4WOwbN2VNM3do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Roc6lFKI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M4YaDF3y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Roc6lFKI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M4YaDF3y"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JE0RXj2925906
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:39:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=XPPtczvSoEHhQY+cig7W/K
	qPdn1W/lyGMJa9A5JB7s8=; b=Roc6lFKIzuPtgF+hMjzXBapJDNv107XVjqlzWj
	st58SXh6HtsKbg+/fw6Gb/buLevJbduJxFMNpGi0/RZ4bCCUBRV2niW/SMuG5por
	9mQ3ssw6JJzlUhvhdPZxs174rGQUlH7EnQMnmX8dsNNEZmWYimAOZiEuC1k6gWIZ
	LbyzrRUhLCd7kM36F99i3EvubRGQyxGXNl7E9ZAkDjYiDOiThU7m5ALEnqGuJ8LC
	47sHCXccLZcGgiW+rTdJ63hXcZqAyByIDpLzP6H750wTAWbN+06WTluLBJoB871g
	sXC0Yor3CwbhnFYa79LtdD5XoJ9JoOMtAkPBDQTNnUla4P/A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hd5w1b9mr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:39:26 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f322ef7d3so365853685a.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792420766; x=1793025566; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XPPtczvSoEHhQY+cig7W/KqPdn1W/lyGMJa9A5JB7s8=;
        b=M4YaDF3yxzfyp+LNjzm0ReH7RHXeyoJ2iVKUB36nIa+KwZkd7cR7yNGwVbojggncoo
         VutC/aE6pYOucBbVX8S7l/i1mqy1epL+hPUO3Dx+70lf4NEQKQVrxSzilvH/slS+LR6R
         d5tPgk8M9vA7rqUItSS1EvrMoz5JXXdmMXU85iItGlosaRNPkgBn52Vj6eGiZxJ7hAao
         bawFl1ytqV5WlhMrftuwUlaRpjS6Utoa0DkBTu9BCI1eZIj+4Rbw/33NOtTqoE9XL1Of
         etnVFV5Ks65TKZrsqicnzq3wVPNRd/HWSbhtTjW221ABX7DdQsaAtsMimD7feFpsTLCV
         SDyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792420766; x=1793025566;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XPPtczvSoEHhQY+cig7W/KqPdn1W/lyGMJa9A5JB7s8=;
        b=K+VRlmzmilm6cKT3m6C1c8A5JzFj4Pk61iDW2/pFvibGu1GCoKcOSZBBN1dJtUsjax
         k2HYQn0cKVbEvn2bf5khc4im7q9s1kO4mEVt7pNaXFnzGo+xsu4E1lObQoDUUFVIquVT
         JJoHxV6Mof34psZjGGcrzj6EctB/RLZuZuNW3IqORXlhQwheUMO+qpAAOQENRwgH+/sX
         19eNEsk9w64bcxc+WngutUkzgZEo25mJojZrtgk9LOXpRMoFcj3kjtMrY45EJP4L7vu+
         1wDvyJ2OadDZX31kK+/NAAkpvx1Mv1JmGANsAKAaSOrab/M8qHqEwwtxH+OBJICSPWw+
         tDqg==
X-Forwarded-Encrypted: i=1; AKwUvBy2dcJ366jawOSEKPyXJL+JXfdDv9Vb/D0q0m+5Qo9Hj1agMVLL2zH1goJuJAEYLqHHq62gM1lVjMU5BfY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ3FlKFEuDg3YtRSM/IXp3udlM54aFalH5RKmOmM0cSQRlDE8vV
	GdUMa3zAy2GJ3TP5rlaAN2G2B1aSZ9nFT6iTSbqSl9SqrcJLNJMxdQl1gff2EYhn2WUKnsqLQal
	aekoEGZAhmhPhI4wOzI0ZF7cB4EX0lGNh3V/bVnZ1vrcMML5tR2VZLYfQ+wVSEPgi20w=
X-Gm-Gg: AYBFou0L5lfcE28ZjofRG46C33XWXLEGL5QSOQQ8BiWI+qVPN0AhZXCdmp7qxe/ssNz
	5sgzdc6UeJpKdkhvi1dO4+SvLuljegCGZOzOqY2K4/ZnVfLUt6BjTSHiWoFswvrjhdyjVSvmiGQ
	gcDaZsEoY3Q5/rHieD4dXH0cHQm0YQBK26WFodCKjBtCmp7M+i7J1xv8AXzt7H7xyWuM9ibsZU2
	8+4AKly7CJmRo4HBH3bJEcOPyiD/KpO4xBMil5t/dvRzTcUSsvMp0qc8VswbwGZq8U24kC3vsdA
	SRjtiCxQ5VgW94wuOnABZnt9TdfBnXXBBytYUUMERCgG90LZCX5k1YUMAE/10ivza9ymr/hEaKX
	4f8KkplYsCDGHjY7EXkVUf3fh6Bk57nLsDKfnkzN3Sbj5hVGDTMjdDh2fZZ6JAdU4iViaJZhtUU
	CEgqKRfdwPL//c
X-Received: by 2002:a05:620a:460d:b0:93e:c12c:9b6c with SMTP id af79cd13be357-93f29dcd9eemr1253703085a.71.1792420766112;
        Mon, 19 Oct 2026 07:39:26 -0700 (PDT)
X-Received: by 2002:a05:620a:460d:b0:93e:c12c:9b6c with SMTP id af79cd13be357-93f29dcd9eemr1253697085a.71.1792420765536;
        Mon, 19 Oct 2026 07:39:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be4a63aa17sm2033436e87.69.2026.10.19.07.39.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 07:39:23 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 0/3] soc: qcom: several fixes for SAW handling
Date: Mon, 19 Oct 2026 17:39:18 +0300
Message-Id: <20261019-fix-qcom-saw-v1-0-9c7ba3fc2493@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJcr1moC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDA0NL3bTMCt3C5Pxc3eLEct1Uc6M0S+NUEwNLS0MloJaColSgPNi46Fg
 Iv7g0KSs1uQRkhlJtLQAhVRrecAAAAA==
X-Change-ID: 20261019-fix-qcom-saw-e72f93e40991
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephan Gerhold <stephan@gerhold.net>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Clark Williams <clrkwllms@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ilia Lin <ilialin@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-rt-devel@lists.linux.dev
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=890;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=BK0a94vpBIqq+Gxmo6AjIyQcf/Pq7YHz9PAFVnNn7/w=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq1iuYzRVL0ke5C33T1RCmCyShLjhc6mUBz32Aq
 ewKg4KUL3KJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatYrmAAKCRCLPIo+Aiko
 1QnoB/9eg0scekKTAPMUeSZCqAnsQL/zdctCrGvIJVOBndJQU/FgISZGKU5P4+frLT8ziSGDmts
 3vvrXdyce5JBeYB3ykwL0JxVROy3a+mONoFoa15ayN3wh+Kv8N92dU6UikOYqszgSOjSyVMBbtz
 rJEEqvquWyfsHIooInqpg/8g09xaATcAMnejw8EecsddLjbquUdliCxjD6LRvz9QD1d6EgAH1VW
 6AHI5FZ/Q+EUmA0tUPZ1iFumCZ92chlzlSPnlVfMlbCnp/5WS4q0kK4F0R6T5cVefas0b97jshI
 KyQwK4A5x2ce16mgKUys+S5cdYYo8wBMHJDDGZC42KM1bmdP
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1OCBTYWx0ZWRfXzEiCDDr06Tx9
 Wit7XH2ge1G1qD85KKYR+MY8oczp7qtCf2OlqQsB8Nl3tMtp9hNoM3su+xuLwEz7SDRtAucoiW+
 RjMKoIMqRktlcHSxr/rXFdZRriJeJog=
X-Authority-Analysis: v=2.4 cv=KuPYSmWN c=1 sm=1 tr=0 ts=6ad62b9e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=Tsnwx_13wjLmqCL3704A:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1OCBTYWx0ZWRfX9ja3v6uIxDr5
 3yg46cezFUhKJfPTL6rpUSPrn4DfTrn/IFvHIcQBoOSUfZeY23DeSooGCO4X+KorR8OqRhQdEud
 WFkcLDOUQRErSRgDNGv9TIQbENvRffZ/UHJy61Tv3QZTx6iWjPG6ZrnKTJvjkeDVX1gJZJAiYvM
 6DncKokFTDul0DK8RrPyszDS7MgtyePuCQHKNC7ixxjLyZQWdXeANJ/15yJOAAkMvRAJ7R8JEgy
 Kzx9L71fk3GUO2bg3R36kHnwTwFwQ2qcjujHBC66BUgImvXx5+L7goUnItCc9CmvptScSNNWGIO
 yGNRw46WVSk5Mgj7xg5MHEjfnE1GS7xWRcJUPp8KSxAHsolOkqJdeTRcu87P0G+8NrmiSLXkpJI
 N74owbWi4IuMZ2o7hs1BmleMttXFve8w1NXvj0oHFM45aXvzd40RU4KR7Ya8vMY3dRDdiQzdjHr
 Q8ysn3Oqy/nFUIq2HUQ==
X-Proofpoint-ORIG-GUID: _pVUonQgqOEyI5_PwMlmsYjyJcCMjB1g
X-Proofpoint-GUID: _pVUonQgqOEyI5_PwMlmsYjyJcCMjB1g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190058

The Qualcomm MSM8996 / MSM8998 / SDM660 platforms use SPM / SAW core to
handle lower-power modes and to program core voltage regulators. Apply
several small fixes to drivers for that core.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (3):
      soc: qcom: spm: fix the SDM660 silver L2 AVS control value
      soc: qcom: spm: don't clobber the SAW control registers
      regulator: qcom_spmi: don't take a sleeping lock in the SAW IPI

 drivers/regulator/Kconfig               |  1 +
 drivers/regulator/qcom_spmi-regulator.c | 35 +++++++++++++++++++++++++--------
 drivers/soc/qcom/spm.c                  | 10 ++++++----
 3 files changed, 34 insertions(+), 12 deletions(-)
---
base-commit: 2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64
change-id: 20261019-fix-qcom-saw-e72f93e40991

Best regards,
--  
With best wishes
Dmitry

