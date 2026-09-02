Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 683024AA590
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 20:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788381827; cv=none; b=C2c5tTClM0xsx/ML+j77l+BZfCSCgOtHFEaeh+yAFBh3S/o7VW8vQ4tepWrqiGUU0RHDVfMuob4l7diUzdd0NbTJaRbIBZF7ylzFXmW2NTBGDEkVrNVYPU/Gs3AZOVlCVjD4ddPvIQhmDqDXWy+z3SD/+w7o/AX475oaFIveOuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788381827; c=relaxed/simple;
	bh=SqSuCAqAoJo4m3BRAa24mfP8LToosIg7AMbpyd/Rz14=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bQiVIRbNDDtiJqm/+2Uwla6MTHdDQfrgSfLWrITuyC/aKWljPmlqHs0sxHaarPdL/6aoFV0XUV8JUi86Q6NTGSqgvd3uiBVOyt/YKvp9MiATNZNL2FMYJCf0Hd6EwwlUsPPV8eZH72TVXdWjgVsCHE6y+6rmmI/dzprGOj1VDAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EUkHkLXO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kl8RasA0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EUkHkLXO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kl8RasA0"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682KHDqU1962715
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 20:43:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Kv1BbOIDcZVOW+7BugINSZ9l/isrxt1DEye
	ye6JanL8=; b=EUkHkLXOo1yk7R89qUaWd8S0PZm96m+wqEmRQ3aqsmwKlIDgsXK
	LebB/v5XnoXpN20FvDgh0gnUiwrpVw5nOCtSmGOgc/ZQnWC+S6mzkm7Gov5CpEgJ
	zvCmvUVlO+39doOYpDxsn+ftE6wDqkBOfsVJLSmodNxi9NtwFfujSvTmvR3L5QNK
	Q0Sbwo4+i/OhoGXw4ZzTLbi7AoErDAhFqObefzpwT9gGAm3Mn+5RXwEwZelD93zb
	XwWDI+GqcIiqOSXi3+/qKJPD8gOSpHZtAfRfeaCHEqJ/y5cMSrkP2qDP3N7E6aqO
	aerU7iNitZpXPOlK8dMawsZFJLdHEIU1S9Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemj4su9q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 20:43:44 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cfc52ddc55so25137285ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 13:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788381823; x=1788986623; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Kv1BbOIDcZVOW+7BugINSZ9l/isrxt1DEyeye6JanL8=;
        b=kl8RasA0BZTTGt0A9Rqw4jOIk0yjU8ZdzfxfbRKwYFeaRk/0y4CqejqxZvA5xXOShO
         z3GhE0nJnFAN2T1mzleVpko+fVi8G9I2WDA/ADpM5qRplVSsbQHti7DcE1eYhxIB4Y1h
         82SA+LC6Fu24bmcs2CHHrEZYrh+9h59UsPfyqmQZbINXc6psCLbmbC3d9zN5trNAATCJ
         5/8khheHW9qjFpHq9vvqAxHPag7j1RVmduw0ZhB2J965HKQgFjOs5OQVyEsdRIOtzWcB
         SgHq8uuvxMkcMa0DUN5jX5TOThgcuqoKG+MMOY/qEmuNRDFCEs66eJ/LReJHBUTaPi0o
         6IYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788381823; x=1788986623;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kv1BbOIDcZVOW+7BugINSZ9l/isrxt1DEyeye6JanL8=;
        b=jLd1LbLuIgnzYyuStBIj7fJGBIZpQeEnNan/QOjHvljfwijHONb5YrcuXkkm/8TYrk
         uICtjbnXI5VruOTfPxUNf2ylxHeAPjkG1jNEAUKs2q0YovjKph6hL1FVOlAqprPTRL+R
         0rcPA5sdWjVaTBOyI6PtL77blqq8pkkFkxodTT4AdaFVumJ1bRLlDr0DIZ/Ys5ePVRcb
         IwbWlNcsRbt+hRyqZRdwR6n5aq+NRfq4w9xJqdkeqNPbhV828VSZxQlrIOLqylnejUmA
         NeKPHG+88S4JmCyoaGL/m98/6rZabg+uy2Bm+XbQG2Xipxv6gWE1g8pON4Cd0ysf79cF
         LIDg==
X-Forwarded-Encrypted: i=1; AKwUvBxTK8GYCQAzsB+d5zPPo/YF+RkO9N73DQ6OcMIaAguKw2PECaAbLtsEHN9Q26Tvy5mWSfloluNYDQhatWE=@vger.kernel.org
X-Gm-Message-State: AFuF++mtOcy/4QLKcC8p04DQr11jBtKqBsm2bZtoZkr6F2kmF/KJr+PY
	ryAJut2Mg5oTR+gfg/2wEW3N+aJX9y7Ep0i7d2a1vjj+17CHqq+mJxIuqSDtGKbPhImyD2XuS6Y
	BGM9fbqB/e04rdBYimPFnw3F5JYxX6Y3dt8J7gDsUKfXjFRjheJNski+TBkRDUI22xwE=
X-Gm-Gg: AYBFou2TEaeDes8FzPFLqh4rVn3cZjq5XEWeiOHlKDUP6CGxFMRcjPEqxqtS+j5aU3A
	8OrHPM2PV1RyyBwrXWnzCEmI8HMwunXwRjZQ2XG3wrLjCQD7swmYDditARJSNQ0eedbjMh9M77f
	ffyxoFMDN8EWyEF4x+pSu3Vek6U+lK5w03WGgBeFL5VbnV/VwHS1gd6s40cFHNHZJOA1mRpXuVl
	OV4jOmGN9YGwqaS/PZ/JqA5DEGDdtY/XhoFGeDG2zlJN1jIBvjo5fPv0nk+kKyikLYhi9FdUEOq
	gFPOUtaLfJyrTD/KT4hp+kIkOqm5qv4oXHHR51IEFDDUXUBuogdjpPgAzM5Vyi1ILfg0mDcLV83
	7Xoyyr3SpyH+mmzFlLg5tKW+tqis=
X-Received: by 2002:a17:903:8c5:b0:2da:eec1:758e with SMTP id d9443c01a7336-2daeec1830fmr94688215ad.22.1788381823144;
        Wed, 02 Sep 2026 13:43:43 -0700 (PDT)
X-Received: by 2002:a17:903:8c5:b0:2da:eec1:758e with SMTP id d9443c01a7336-2daeec1830fmr94687725ad.22.1788381822695;
        Wed, 02 Sep 2026 13:43:42 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33255d39d21sm613338eec.16.2026.09.02.13.43.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 13:43:42 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 0/3] remoteproc: Hawi CDSP support with per-PD proxy performance states
Date: Thu,  3 Sep 2026 02:13:31 +0530
Message-ID: <20260902204334.2061226-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE4MyBTYWx0ZWRfXzqxLU8KwikN0
 excRKDRX97mpswES13ufEcborrPOupvvOXsB2VZ2f93BJj80X7j1Gtn3jDyyijnCfBuoPE/fpRA
 s4nDtnWEe8gHdKsV6BCGZ1YIieAUlT7pQ/gR5AmVcq786GgamCQi9/zMv8qh0r8Xb5l7GwuHGoS
 buUDJrQm+P2WA1BhkAl1JkAEJqxZWPeATws5lxBQ+Q03jHmJQ5jctGp+6LfAnvcm0fDNIPNFLYB
 pNebIzuwAeQyD5x4A7MZnbvZVW63ExVpU4Ij8X/anGj0ak86adrXJz6JJpY4UAR6c3J48gIti9M
 SCb03d6UjsfsR4SI9ywL9cSJD3i+s5z5RSPuL3AANboTt6YJfgdVJfVBQjzatUYpKG6t0bW2hxE
 HaoSa0ehKx9FjXPEM94zfdWr15r8k/cBaESNOHk4Taon63iqR2J0sp9Mys/5A9MjNNC356tqUcS
 U++wXRXaLjDsSYU8jag==
X-Proofpoint-ORIG-GUID: -NkFZLO17MgM-Afkfr2SbwadOMBFgx7a
X-Authority-Analysis: v=2.4 cv=MdhcfZ/f c=1 sm=1 tr=0 ts=6a988a80 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=BoqisLAphY285m0AAnYA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: -NkFZLO17MgM-Afkfr2SbwadOMBFgx7a
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE4MyBTYWx0ZWRfX+TDSuB2alwjt
 lr+PZEIBi/tlw1I7yKJv1AVBh2MYMKiLYeK46MhQ4pPcVh3mUflpnLHdjKhNsK8/P8U7cwuk5PI
 ZGSj78koxwFwRoPvVri+yhh78guqaew=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_05,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 phishscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020183

qcom,hawi-cdsp-pas was initially grouped as a fallback to
qcom,sm8550-cdsp-pas on the hardware-level compatibility. Bringup revealed
that the NSP proxy power domain on Hawi requires a specific RPMH
performance level below what sm8550 already supports, breaking the
compatibility contract the fallback string implies.  Remove
qcom,hawi-cdsp-pas from the sm8550-cdsp-pas fallback items block, add it to
the standalone compatible enum, and extend the existing cx/mxc/nsp
power-domain constraint to cover it explicitly.

The fix is two-part: first, propagate the dev_pm_genpd_set_performance_state()
return value so the failure becomes visible instead of silently proceeding
with firmware load.  Second, introduce a per-PD performance state table
in qcom_pas_data so platforms can declare explicit RPMH levels for each
proxy domain.  Platforms that omit the table retain the existing INT_MAX
behaviour.  Hawi CDSP declares CX/MXC at TURBO and NSP at NOM, matching
the hardware requirement.

The binding and DTS are updated in tandem: qcom,hawi-cdsp-pas is made a
standalone compatible (dropped from the sm8550-cdsp-pas fallback group)
because the proxy PD behaviour diverges from sm8550, breaking the
compatibility contract the fallback string implies.

---
Changes in v2:
  - Propagating the err dev_pm_genpd_set_performance_state() as a
    separate commit.
  - Added a binding correction for hawi as it  should be
    standalone one instead of falling back to sm8550.
  - Add num_proxy_pd_performance_states count field with a WARN_ON in
    probe to catch mismatch between the array size and the actual proxy
    PD count at boot time, returning -EINVAL if they diverge.
  - [v1] https://lore.kernel.org/lkml/20260828181311.4038346-3-mukesh.ojha@oss.qualcomm.com/

Mukesh Ojha (3):
  remoteproc: qcom_q6v5_pas: propagate
    dev_pm_genpd_set_performance_state() errors
  dt-bindings: remoteproc: qcom,sm8550-pas: make qcom,hawi-cdsp-pas
    standalone
  remoteproc: qcom_q6v5_pas: add per-PD proxy performance states for
    Hawi CDSP

 .../bindings/remoteproc/qcom,sm8550-pas.yaml  |  3 +-
 drivers/remoteproc/qcom_q6v5_pas.c            | 52 ++++++++++++++++++-
 2 files changed, 53 insertions(+), 2 deletions(-)

-- 
2.55.0

