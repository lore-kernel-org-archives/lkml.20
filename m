Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794213409;
	b=BUz9xAQrT/vSNVQNT9JgdaSnng2lQNqf6MVPCtKfbjpCI8UMgqe3SWF+E6Ctls7hrCVp
	 8deVEtSSKbJLbLXZn8caKJdQ7qN2GxFbTLuC1/oXo2Z6fFKDhIk9tZZcTVJX/M7uFgiDS
	 7wvXJ2uNNOfe2St+XSDUJpF4iipwtpOZlS+Rsr1jJ63aX9aSe60wJkBCI4uMFFb/9LIIE
	 kSqSp+CAyw7bFJQGzNJ7QAAanyjs2AMUrlUgb7LQu0oYcTdCPQDDLBZXfUs0LN+mxwfEV
	 fnRw4NB5fBfpninjKDiIXeOp8XdvTXWp5iUcxtffsW/PxXH+1kRbEZ2/6DlzMmubrOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794213409;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=uOzLF8eLJwbDK4JWDPkveOiofSVzTZ67nNELT64ujSw=;
	b=X4yd+2fdDPYY+QuPUtvq/4jKrE+fhDSsaWO9kWkMxNWLSzoQbNsFWnEZw7B+Ju3UVU2h
	 WvVa14y1Z1JJI5VwBihi8VtQiVggSbYoyIr45D9xH6q0hgSGu3PSspyDGhEWEyA21PNlt
	 1Cms41hANqd59z32Or5PKpZkYCj4nmmcL0r5hcuLuLDzFZNkNgUDbpJb+fQPFy7z0muSS
	 DzrnNPTX3DSLrxlqQCd07ROBXdesnwqu9+5iXs828wwzanXg0CRWFuKUOhH2kEdMearut
	 Rjq6g1MMwQK7D0hyw1CaldeLJrVBWHEAxzxAtOEEN7tP5AvtrMkpnyBabhauKnH2yJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mwisdeFY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="O/FD+yEI";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 296D5606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 08:36:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 296D5606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mwisdeFY;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O/FD+yEI
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A96A0Ik3580985
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 08:36:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=uOzLF8eLJwbDK4JWDPkveO
	iofSVzTZ67nNELT64ujSw=; b=mwisdeFYZ3VpAKZaSQkU8o6V7IrJP/+j12zvkk
	xHCXqoF1J3VRCOEL3HHyBv62ai+Ym1fK5xjf2OUGuNPip7IaPEt+TUc32Xx4+g28
	r6fqOmvN2h+o2xoqmJQmYv02jgGldWV6MRG9K04S42DSpn9PmvjXlkKfolD3rph4
	AaCVOUoib426xLhTtv0TYKzhx5Opj4XNCqUtWPlyKCLTHcrY0zyjuT+v8NBlonw/
	b3wdYMxV0FcZjppuuDIE8oUetLY4c7RULCDk9GxW8r4hvqqJiVQrKTQVAzCHrCoH
	Hpp7a/p+sbe1eeXFLOiOuodkOwXA/xMq7SAxN8iHqmfNJfrA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsv735dk8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 08:36:48 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f26dd2165so63613785a.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 00:36:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794213407; x=1794818207; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uOzLF8eLJwbDK4JWDPkveOiofSVzTZ67nNELT64ujSw=;
        b=O/FD+yEIytl9NS8Iqtq+61ae+bHAxHDxtCKL6VYiC6d6sn+VNDe5G6LDd8XJT3GfmB
         iXy2e14HYHMZxfpoeOCGBQeDTWjWgp8zxMQOSwu8G9p2ldhK1VcFgOPHeCBz0dHo8ihZ
         VE6nV486rVxxDqvjsU3b4oHeClLRS1TtqZJXXLjY5scF7vFtJaTg3F5ugLgRWJnnimto
         P1WdSbqIdlOX+nqvfLqLj5IJSFPzo5wgs7mpw41nSKm9s7G4IaTOmpW2Ev3UfnLvfxme
         C6+/aU1vzhPC3tzwitlH+oHqm4eauvPpMkyf4PZpefdW7WbDVKPIg2IUNfzyKAmpTO3R
         p7JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794213407; x=1794818207;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uOzLF8eLJwbDK4JWDPkveOiofSVzTZ67nNELT64ujSw=;
        b=PCrPhNLptimXdAMFIbuc8Z4wH8mqqDd3rr4vx7K329pnGew86NZM1y55e9lk3RjMdQ
         ysdRiW8jVPKJR6OaezEc5u40hCOYhTI5HW8xJbLkVKna0oLwdpVFoDGsOcVfJtCNHR/D
         T9n5ZMeMlsqLm9ysmRAv+MBeoySvEqJay6L971dqk3KE+xEI8KTicX0ErmMsX5vr8/9f
         pYPHLBKAbG/zcEihqZakfrlmNN4qaGQvySLcnMNeZJHw5cNd1i8YIZ3PPBS0XvJ7rbIG
         P9SZaNwaXP4OhOAkTNdgSSVhFxAeVClHez7hsYaERovwnwoVtMxQ9dXJZeN6VTkUvS8Q
         X/OA==
X-Forwarded-Encrypted: i=1; AL+hErFw7+4Y1ZpU+3m+5bhUOxZmvFFrtlnNxvkoeHUH1IbxXWoN8mg530HL+K6lRJOI9PpW4eBZR+vaApr50Z8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8lK2h+fXjbpSUCQVdf8u8bkrVxXLEx6dXi1zm30aqAONZN3Wql
	z6/qpkIZNzSxNtY+D17Bax5t9JjhDwKIdcSlW2c+qTCd3DE98ScESxoEswzvrUaPDi6TJIk6f0X
	Fj23FgfAUTNiUe1ZDeXVtWdpH9DbTEdNVbJw3Q/a7SQfx3o5fvxm6jtuqtLzBlL/cZXg=
X-Gm-Gg: AYBFou2alDX5588Vr6AKtNuG++EHtUNl7BJmxbEXvNKasjb9VnZNzN0lRuPaJq9KfMH
	rXyxg0PEyTfKUSNuaZ2cUktXfxHsTXLeQn+RkyEW23z7WvhrgnItPVLFer3QyNEpiQXA4xAs0h+
	hDm2wetm4UMBbXxK6pHamI+td9LXSDmty9epFzGfW+QY7DHxeBokjOUARhwo/jMxQnzg2I74jIt
	+8/yk5YII+3MOMz2OvhtdBfnaPeoCSD2u+9cAzD7Ym2K7YJmIw3AXh2+7iKebLKSQj71IT5WpQF
	+DGM3zlgWN8b3Nf1u/U6NEbQM4IrgORMWLbUDCSrNn6YzQZuqAWO5h7DS8fnruhVGn5Pb5Ncnvy
	z437dJBoN9rYFC9MkG5NKJqj/QfUBnDWqi8pnyIG8TCGs7YcNg/iU3S41qROB8HVGuAgTQJ3uCz
	Lafc06qxJBBC13QloUNdSCoZQ30OFeroDVt1I=
X-Received: by 2002:a05:620a:3188:b0:93b:ef24:bc8c with SMTP id af79cd13be357-9478424cf8fmr541944285a.47.1794213407062;
        Mon, 09 Nov 2026 00:36:47 -0800 (PST)
X-Received: by 2002:a05:620a:3188:b0:93b:ef24:bc8c with SMTP id af79cd13be357-9478424cf8fmr541940785a.47.1794213406477;
        Mon, 09 Nov 2026 00:36:46 -0800 (PST)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-94782dc37e5sm418223385a.34.2026.11.09.00.36.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 00:36:46 -0800 (PST)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Subject: [PATCH v5 0/3] drm/msm/dpu: Add INT2 GDSC power domain support for
 Kaanapali
Date: Mon, 09 Nov 2026 16:36:34 +0800
Message-Id: <20261109-msm_gdsc2-v5-0-4a3159b5e4b8@oss.qualcomm.com>
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
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIABKG8WoC/3XPzWrDMAwH8FcpPs9Flj/T095jjGFbTmtYmjVOw
 0bJu89JYcuhvRj+kvhJvrGShpwKO+xubEhTLrk/16Bfdiye/PmYeKaaGQIasAi8K93HkUpEHkO
 DEgCtR2J1/mtIbf5erbf3ex7S5VrJ8V5kwZfEY991eTzsiNqkRQAPrabYJCV0jBidJ0dBWC2RS
 KEJbLFOuYz98LOeOYkVe3DRJDhwZZx1xpCJAV77UvaXq/9clu7rs2IT/gON0FsAK1BLFqUNTjp
 8Asg/QIBQW0BWoBWJTFMbSpgngNoAKLeAWr4AwXgrSCXZPgDmef4F/U8KvLgBAAA=
X-Change-ID: 20260720-msm_gdsc2-cb9230027a2d
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Joonhoe Kim <26rote@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794213397; l=3262;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=8pqsefRv58up0CB5hfDBMDlXVCBA9MTDI8e9At11oCI=;
 b=N/GRBrc36YIjEbo+kUgkWNMws3DqmS3uLiQiPv9kHTIpVEuPBsx9WVt48drQi2PuyGAjmVmnN
 7oqKN4rq9blAXEvRiPHV7GbnMesopQTvzuTLU7XEVY/3WiD23d2Z4W+
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAzNCBTYWx0ZWRfXz7UEnASGGp3H
 zOAntWYO+pFfCiQ4QOIET6ODovtaWVFBbOP8dwhSWQKhs4exz+EBX3qE7e3gXocmA6TuE8FacqZ
 r1gbQtUtkZSSEf/DzD2sJM/3bPNb6pSYKpcZN2WUxJjJexyuXt3oxyuVpAPhYy4NAkuS9xrAZHa
 nfbUGWRUkQWCzQLwoE4bpcRw/In/mmt7MvHH9gJORQC6hIIZzg+TKaoSTzO5O9IUWoH1jBD5kYa
 cS27Tm8am9NC6EkiKJildmRwDzbmq2efAGL0C4vldXBZmg4E8imxBI5TlqewrJBPXFCvddLPiyX
 1aUtkuZYSjRnrA6DcGkolZAuej8BCTTC1j87CfABLy1xu014pgRBxP/xnCk9CntAEZ66bNHf0n6
 2OGZhBYNoR3PZvIf5BhsezQSTz5Sqi7hT8M9kpI2jhm0ZSTzX29JoMi2e032BLUVqBswXvLVgBI
 RHmgEBFSTlSgZYSFopQ==
X-Proofpoint-ORIG-GUID: 9yIJWPgW7l-zWwAhvQ1xbBIoQAgMfSP4
X-Authority-Analysis: v=2.4 cv=bcb+w+PB c=1 sm=1 tr=0 ts=6af18620 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=d2OlSeRB4JJFOaS-wp4A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAzNCBTYWx0ZWRfX7RtZBwnnUzXb
 /JdGkzIKxnlLTtgKlatKPvCgqUOeB9hmhbwcyR2Ed09RaIsRAnwz7kcfL4LKsKC6VvdV7YaqB2q
 FewHpMdEQ1g8fJcE8xUxj+PySHpzepY=
X-Proofpoint-GUID: 9yIJWPgW7l-zWwAhvQ1xbBIoQAgMfSP4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015
 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090034

Kaanapali (SM8850) has an additional INT2 GDSC that powers a
subset of DPU source pipes (VIG2/VIG3/DMA5). Without enabling
it, those pipes remain inaccessible.

This series describes CORE and INT2 as the DPU power domains,
updates the DT bindings accordingly, and explicitly attaches both
domains in the DPU driver. DPU performance-state votes on CORE
are propagated through the genpd hierarchy to MMCX.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
Changes in v5:
- Use 'contains:' for compatible matching in the if-condition (Krzysztof)
- Move power-domain-names items to top-level properties; only constrain
  minItems in then-block (Krzysztof)
- Link to v4: https://lore.kernel.org/r/20261023-msm_gdsc2-v4-0-40b6a71d4e3f@oss.qualcomm.com

Changes in v4:
- Keep the widest power-domain constraint in the common schema (Krzysztof)
- Link to v3: https://lore.kernel.org/r/20261014-msm_gdsc2-v3-0-f1ed69014416@oss.qualcomm.com

Changes in v3:
- Replaced MMCX with CORE as the DPU power domain, keeping INT2 as the second domain
  (Dmitry)
- Used generic "core" and "int2" power-domain names (Dmitry)
- Propagated DPU OPP votes from CORE to its parent MMCX domain
- Updated the Kaanapali MDSS example and fixed issues reported by dt_binding_check
- Link to v2: https://lore.kernel.org/r/20260915-msm_gdsc2-v2-0-9157237b8382@oss.qualcomm.com

Changes in v2:
- Moved INT2 GDSC from MDSS to DPU, as it only powers DPU-local source pipes (Dmitry)
- Dropped Glymur — only Kaanapali actually needs INT2 GDSC
- Used if/then in DT binding to restrict second power domain to Kaanapali compatible only (Dmitry, Krzysztof)
- Dropped PD_FLAG_NO_DEV_LINK, let device link auto-attach handle INT2 as runtime-PM supplier (Dmitry)
- Link to v1: https://lore.kernel.org/r/20260720-msm_gdsc2-v1-0-4687866d6cb0@oss.qualcomm.com

---
Yongxing Mou (3):
      dt-bindings: display: msm: Add INT2 GDSC to Kaanapali DPU
      drm/msm/dpu: Attach CORE and INT2 power domains on Kaanapali
      arm64: dts: qcom: Add INT2 GDSC to Kaanapali DPU

 .../bindings/display/msm/dpu-common.yaml           |  3 +-
 .../bindings/display/msm/qcom,kaanapali-mdss.yaml  |  4 ++-
 .../bindings/display/msm/qcom,msm8998-dpu.yaml     |  3 ++
 .../bindings/display/msm/qcom,qcm2290-dpu.yaml     |  3 ++
 .../bindings/display/msm/qcom,sc7180-dpu.yaml      |  3 ++
 .../bindings/display/msm/qcom,sc7280-dpu.yaml      |  3 ++
 .../bindings/display/msm/qcom,sc8180x-dpu.yaml     |  3 ++
 .../bindings/display/msm/qcom,sdm845-dpu.yaml      |  3 ++
 .../bindings/display/msm/qcom,sm6115-dpu.yaml      |  3 ++
 .../bindings/display/msm/qcom,sm6150-dpu.yaml      |  3 ++
 .../bindings/display/msm/qcom,sm7150-dpu.yaml      |  3 ++
 .../bindings/display/msm/qcom,sm8150-dpu.yaml      |  3 ++
 .../bindings/display/msm/qcom,sm8650-dpu.yaml      | 34 ++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/kaanapali.dtsi            |  4 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            | 32 ++++++++++++++++++++
 15 files changed, 104 insertions(+), 3 deletions(-)
---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
change-id: 20260720-msm_gdsc2-cb9230027a2d

Best regards,
-- 
Yongxing Mou <yongxing.mou@oss.qualcomm.com>

