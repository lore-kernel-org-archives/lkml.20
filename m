Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794655787;
	b=j/33xAHD7FaTmioqmgPzf4PRh/SFAglowDZ6f64rNVcLkikcQ8odmZIqPa2Id0qsI6Ns
	 SZ77wibViXhlImQFj3ByvnPjpSKpZZBV1Voj9p6uLkPr5dBey7GZu5xnz1yzih2TWk+W4
	 gUR1MYOGxH5nWbje/rCKE3qLX1I9ww921W456oiEjxpSjCreICuruyomGCtU1HB/MbDJv
	 PDI5vM64rOGXlofiA14zXXAiE6Hi7XMQBoWsUXBSXWyukBjhfndW/G4InshJMpf+ujl8Z
	 tGZtx15BtlQSCVK4Qm9bMQK4RcTdW6lO08+jn3WOXRWNGbKQTY3MCaqEDrBR8/EFMLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794655787;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=lYQtc23/hKZH4TPph2Tg/sdYM2XjGYrgayP6INE2B3Y=;
	b=Hk+4LAhHTkh+8uYKYf8RGCgnNGs3ixffNuBAlmM3UsLz6d+sJ5BRVmiaRZZjUObvnTld
	 0q/YywJqC8cMYJhtH2orTwQF7W8tI1UT7OIkjM6IC/bMxxalx3G/sn4Y285ZrJ+qIHZmY
	 6VK5muiJlFCyeuykE98P3Gdqt7SgYi5aJ753vrwTu4fvn1jIJDMbnAimXCvWGkAA//FgR
	 ayweSfQdzg0eF/zPfNU0emOpWB5FfWNbH5O3wQL90Ks/4T7lE4JYcwzNvda4uZMNGdb+0
	 zJMMAxZq4paPVagSxvhWi0J4e+7oeSEpfOERux/h/c5PZQ3Y4hmNz6szwrYjnr1qzZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FSseDSFt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CsmurW09;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B98FC606A331
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 11:29:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B98FC606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FSseDSFt;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CsmurW09
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AE9wcKf3379816
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 11:29:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=lYQtc23/hKZH4TPph2Tg/s
	dYM2XjGYrgayP6INE2B3Y=; b=FSseDSFtSrbE/ZEObvOskyvhpmmjHY81VDlbST
	HbiG1FCI3IiF2am29IVbc8qKBv6ykYErJRatxcPY64Ye1Lpd7SINxsaYiWC9T8mq
	YoIS9QWrBWgmNFwNGFm4s1ESHjwdz9lBw4lYq3Brq1NqbIavVqZpX9VwO/JQw8dt
	tLJGN9/vBZ8uXpzxBVcFLxrwvLnLAlZ9/K9rwWqYdqdP+09M+7yqZZnxlIJSQ0wO
	dKxjCcvhRSR1ceivt6fWOWvTntJu56enG/FJxuuqjYoGCVWKpPUY4uewMRxeZQjD
	+l65zxarLsws7Lb6gKb/AJvtLNuYD8c21thdMTdqcHnIZAsw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhnx0my0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 11:29:44 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91eb7d1472cso39710646d6.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 03:29:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794655784; x=1795260584; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lYQtc23/hKZH4TPph2Tg/sdYM2XjGYrgayP6INE2B3Y=;
        b=CsmurW09VtrN4RkxdlfWE8JfwHsp6oC9OUK03OqYlDZH8dlT2t2G5LnUWhKxE7FKJV
         6qFmeKQJCL0aN/Iariy4K4maGsS64lTKbwKdkLJjr+bN+gKBYgURxidHb2M+vMgl/bAw
         dTIglg5EcU+p9O9Nh63vsVuG2IRz9yzIq3mEV1wWx1pLXLgzV1oxmBZSWxxIlNGxDDNU
         CgIPxSzWWcei7otPPD3jMyLl0d8hj+G6I1DH+8CIBGXf5fundBvBNTYaBOdyAJg3tV4Z
         zhIoKOfJflMLEbL8sSTxEfGseUF9UWcNbtFG3qVeUBx/OzdLj0iCX0K9En0fWKOJ20E2
         UqeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794655784; x=1795260584;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lYQtc23/hKZH4TPph2Tg/sdYM2XjGYrgayP6INE2B3Y=;
        b=pyXeld1ucQUCT4ifGBAcogLxLQlr1DJ15+wy7mHcgCDTnYMtOwZWwlqH/o882G6XDv
         6ZHuJOsHm2YuRSQOCQvMi0oO2hmjcESeaiFISO0vgbQfJAiW9jGJpNQdm9mn/ZR3Ndvc
         DZcud3g7MPCOHxPbdmCnD4fLzIg5BMBTifFr/nuNtPJA2Jj7bVhuiqGGBHI1/rwqC/7P
         EBKo5ObPcolbmKBsdPcK9wh39SIRZi419b/QPizgnTJZB/b0RbGp4VvOKtik5BUAC4lA
         Uu9qX4lGVvp9KRe8xtTuEqvIRS5yD15V2SYxet8opihU8oB/FppPKy3iUnefo4Qazt+v
         XLdA==
X-Forwarded-Encrypted: i=1; AL+hErHG3YFTy3i4hC3WfDivS76uoceb9oLPPt5nVgi7McDSMHeKhVmL2KRVM+83E9NZaRl2ky2eaCQ8yi8KMdA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+OhJyjR4982ON8aHbX/pxNy52ybiX8HTJrPWBjd5f93XrES0KB
	vbz8sY+OwuvhGTBCqBTJDn3TiKTdYWhCKeRi9yNQmhl0jLpaKxulnrSM7kbz/oSZE4825buk9LQ
	MWNvATa4n86ntXMeFgabdqgSrcoEisx6JPLMHGlkLQXLe3PPxvQCWAtFEB3KpC7C1ziY=
X-Gm-Gg: AYBFou2LJ5gXXOytIOJaEQJnVVApy4ku+75eWZWqBcSPK8hj9lKHQbpLYEGntZBQhL/
	Z4LBprte2bTLaibz1GkUn1mtHEPGpPKmQ1eoWi9cGYqG7kb6DaaNG3c6+V+fpMEbq6tURwxH+lh
	09mt1QLKDiGy/ANJ54mI1OrwIDhmVlHZKPN73ZtaKi7yDOjiLXcm+vEf4qiNGmjNcu4nDnzT39E
	u7VUJ93a0X41CLd/TITgxr6ClsycEOU3tYu2d9PcEDdwF8dSor/EPGRg1bnBGmELA4E2UM+9BaD
	k9480jX7BcD/ekB/9rXryCMwweab2fEg8XYOi0pQOMyrevMZI/LlpkrC8mA3qUNI2guBQsGyY0o
	gQnqLeXj+IRYm275mf0+vrf3XmJBi47lE3sqjpEL/MBX5OX3NQ257ZVtS751glnM9TH/FgGy+GW
	vefovauDuCK0UUdjGcJnyKZyIOMX+oLsFlSwqPauOm
X-Received: by 2002:a05:6214:3292:b0:91f:136e:e90c with SMTP id 6a1803df08f44-91f24244031mr71337616d6.53.1794655783798;
        Sat, 14 Nov 2026 03:29:43 -0800 (PST)
X-Received: by 2002:a05:6214:3292:b0:91f:136e:e90c with SMTP id 6a1803df08f44-91f24244031mr71337486d6.53.1794655783390;
        Sat, 14 Nov 2026 03:29:43 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d7ba48sm41389746d6.28.2026.11.14.03.29.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 03:29:42 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Subject: [PATCH v7 00/23] Add CAMSS support for SM8750 and Eliza
Date: Sat, 14 Nov 2026 19:29:17 +0800
Message-Id: <20261114-add-support-for-camss-on-sm8750-v7-0-8ff2a11835f6@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAA1G+GoC/y3NQQ6CMBCF4auQrh3SoqXIynsYFgMdtNFS7AAxM
 dzdgm4m+d9ivo9gio5Y1NlHRFocuzCkMIdMdHccbgTOphaFLLRSRQloLfA8jiFO0IcIHXpmCAO
 wr4yWoGXZnSwdS1tVIn0ZI/XuvQvX5teRXnOCpt8oPDHjDtVZYkqVHHggDjji0/2BpdAgQVkjz
 702/dHIS2DOXzM+u+B9ns6mtcgE2+CmOqtO2LZnrVsllWjW9Qvko7h27QAAAA==
X-Change-ID: 20251126-add-support-for-camss-on-sm8750-506c4de36d88
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Frank Li <Frank.Li@nxp.com>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794655774; l=5989;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=ZF5h2lHCofFCc9Gv68CDYvEz04GrgoDbg7RhcIPuRMM=;
 b=51IvPApOHKdKWHF7Jj4MH9xxNAuThn5MH/FiwFoot3dFIWqUd+ZiZEL0UWyJYHVkPuOWhdB9w
 bBSZOCqQmz7CRt/UmCWit27f6wBrFiYd2yDDZH39RRTfC6Qgn89VW/g
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA0NSBTYWx0ZWRfXw4pS1kH60Ndg
 u7Aq9Jm5izAHqW8CAIsU/lNO3WS9Do6due0gk8M0ExB8EHHDWHkK+pEImGAUVvgQA1oXZhuSgB9
 eguQnkFWMJk0K0tmj1OkRh6UlWOSfxmrLk9MliKfa5Ib8UINqmaVTSAlZZ6mejAn67RnraV8qPs
 F0k8JYLPbfbERMki0nLpUIl94xTn0e/TOTP8iUCnFoSL8IYr1RVKas+sx78Xv2sru+t/APIYBVd
 EcB8loeqBsMyhZ9/PzsnU7e/E9MBLbOnehjw3ckgV56Lc6Zb5XuDzg1fYFJ0gdwK1clYlNPL38G
 BjXzPqvssnd1WxktnMdFmOm4TQhLqYt48LFhJ4SOjkg6Emny2haQnndOAMjbWYyKleVo5hG/mIz
 m8uQu9Fhux8PQx59wg8IQBFVaKYKMZ1+gZK7WA2Qtf3fkBHlPV3sGrfxbMGYXsVDZmojOlFDTKI
 BuPSvZ+AqzYJ2gFOKoQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA0NSBTYWx0ZWRfX+Us3rK1EEMMn
 wjQoCZ6KIYUFmRnj5AR1WPi8QQbV8fDLNopXcsxTR1nvKJL3LsqU9nuu3CKTdphpQmMU4LdJmnk
 oKbNVDrB3Q+8F0Ls0+XfQeXNfyO2KW4=
X-Proofpoint-ORIG-GUID: 38zscE9i0rfPi_pm5xJSFd1w6YLfW6f7
X-Proofpoint-GUID: 38zscE9i0rfPi_pm5xJSFd1w6YLfW6f7
X-Authority-Analysis: v=2.4 cv=Jr5kP84C c=1 sm=1 tr=0 ts=6af84628 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ZzokZsKx-LV0YXTnLPAA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140045

This series adds CAMSS support for the Qualcomm SM8750 and Eliza SoCs.

SM8750 has CSID 980 and VFE 980. Eliza has CSID 970 and VFE 970, which
are register compatible with 980 apart from the VFE RDI write master
client IDs, so Eliza reuses the SM8750 CSID and VFE support. Both SoCs
have TPG v2.3.0. The CSIPHYs are described as standalone
phy-qcom-mipi-csi2 devices, linked to CAMSS through the OF graph.

SM8750 has 6 CSIPHYs, 3 CSID + 2 CSID Lite, 3 VFE + 2 VFE Lite and 3 TPGs.
Eliza has 4 CSIPHYs, 3 CSID + 1 CSID Lite, 3 VFE + 1 VFE Lite and 2 TPGs.

The series depends on the Kaanapali CAMSS series.
https://lore.kernel.org/all/20261112-kaanapali-camss-v25-0-1d709f57f370@oss.qualcomm.com/

Changes in v7:
- Rework the bindings: describe the SM8750 CSI2 PHY with its own
  "qcom,sm8750-csi2-phy" compatible (plus the matching phy-qcom-mipi-csi2
  entry) and move the CSIPHYs out of CAMSS as sibling PHY devices linked
  through the OF graph. Drop the Reviewed-by tags of the CAMSS binding
  - Krzysztof
- Add the "top" register region to the CAMSS binding, a PM clock list for
  SM8750, and include the CSID clock scaling patch - Loic
- Clean up the CAMSS binding (reg-names, clock names, unused clocks and
  interconnects, iommus description) and reuse the SA8775P TPG resources
  - Vladimir, bod
- Rework CSID 980 and move VFE 980 into its own camss-vfe-980.c with
  dedicated SM8750 resources, dropping its Reviewed-by - bod
- Drop the two-phase CSIPHY patch, the CSIPHYs are now handled by the
  standalone PHY driver
- Add the SM8750 DTS and Eliza support (bindings, driver and DTS)
- Link to v6: https://lore.kernel.org/r/20260721-add-support-for-camss-on-sm8750-v6-0-a5f841061d18@oss.qualcomm.com

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
Hangxiang Ma (11):
      dt-bindings: phy: qcom,x1e80100-csi2-phy: Add SM8750 CSI2 PHY
      dt-bindings: media: qcom,sm8750-camss: Add SM8750 CAMSS
      phy: qcom-mipi-csi2: Add SM8750 support
      media: qcom: camss: Add SM8750 compatible
      media: qcom: camss: Add PM clock definitions for SM8750
      media: qcom: camss: csid: Add support for CSID 980
      media: qcom: camss: vfe: Add support for VFE 980
      media: qcom: camss: tpg: Add support for v2.3.0 TPG
      arm64: dts: qcom: sm8750: Add CAMSS and CSIPHY block definitions
      arm64: dts: qcom: sm8750: Add CCI definitions
      arm64: dts: qcom: sm8750: Add camera MCLK pinctrl

Loic Poulain (1):
      media: qcom: camss: csid: Scale the clocks with the CSI-2 link rate

Wenmeng Liu (11):
      dt-bindings: phy: qcom,x1e80100-csi2-phy: Add Eliza CSI2 PHY
      dt-bindings: media: qcom,eliza-camss: Add Eliza CAMSS
      dt-bindings: i2c: qcom-cci: Document Eliza compatible
      media: qcom: camss: Add Eliza compatible
      arm64: dts: qcom: sm8750-qrd: Enable S5KJN1 camera sensor
      arm64: dts: qcom: eliza: Add CAMSS and CSIPHY block definitions
      arm64: dts: qcom: eliza: Add CCI definitions
      arm64: dts: qcom: eliza: Add camera MCLK pinctrl
      arm64: dts: qcom: eliza-mtp: Add PM8010 PMICs
      arm64: dts: qcom: eliza-mtp: Enable rear camera
      arm64: dts: qcom: eliza-evk-imx577-camera: Add DT overlay

 .../devicetree/bindings/i2c/qcom,i2c-cci.yaml      |   2 +
 .../bindings/media/qcom,eliza-camss.yaml           | 282 ++++++++
 .../bindings/media/qcom,sm8750-camss.yaml          | 297 +++++++++
 .../bindings/phy/qcom,x1e80100-csi2-phy.yaml       |   9 +-
 arch/arm64/boot/dts/qcom/Makefile                  |   4 +
 .../boot/dts/qcom/eliza-evk-imx577-camera.dtso     |  85 +++
 arch/arm64/boot/dts/qcom/eliza-mtp.dts             | 188 ++++++
 arch/arm64/boot/dts/qcom/eliza.dtsi                | 512 ++++++++++++++
 arch/arm64/boot/dts/qcom/pm8010-eliza.dtsi         |  81 +++
 arch/arm64/boot/dts/qcom/sm8750-qrd.dts            |  72 ++
 arch/arm64/boot/dts/qcom/sm8750.dtsi               | 735 +++++++++++++++++++++
 drivers/media/platform/qcom/camss/Makefile         |   2 +
 drivers/media/platform/qcom/camss/camss-csid-980.c | 478 ++++++++++++++
 drivers/media/platform/qcom/camss/camss-csid.c     | 208 ++++--
 drivers/media/platform/qcom/camss/camss-csid.h     |   1 +
 drivers/media/platform/qcom/camss/camss-tpg-gen1.c |   5 +-
 drivers/media/platform/qcom/camss/camss-vfe-980.c  | 216 ++++++
 drivers/media/platform/qcom/camss/camss-vfe.c      |   4 +
 drivers/media/platform/qcom/camss/camss-vfe.h      |   1 +
 drivers/media/platform/qcom/camss/camss.c          | 229 +++++++
 drivers/media/platform/qcom/camss/camss.h          |   2 +
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c     |   1 +
 22 files changed, 3370 insertions(+), 44 deletions(-)
---
base-commit: 84abb955b1015477aa11a96e2f3ac1b938b77f48
change-id: 20251126-add-support-for-camss-on-sm8750-506c4de36d88
prerequisite-message-id: 20261112-kaanapali-camss-v25-0-1d709f57f370@oss.qualcomm.com
prerequisite-patch-id: 6108fea87bf95e2911f09bbe7e95fa536c3ce397
prerequisite-patch-id: b347ad60c475f3035b04ec76741e0f1b5f095580
prerequisite-patch-id: a38055fcd5b32fbf7f7f03301a48b4ad8601386b
prerequisite-patch-id: 5faef8cef855ce6fa00e2c7f10f125431ede40a4
prerequisite-patch-id: ddf0ddaef84c2d088d08f17de8d20f6b966ace37
prerequisite-patch-id: 5d7b6860d43c9215836a0d50fb27d2d003d0bfd8
prerequisite-patch-id: 610b107ca35300b00e8edae31dfb959a4501ff66
prerequisite-patch-id: 0bfebf965372eab19b73ad9629cec919795b557a
prerequisite-patch-id: d386de6329dabce0b0a459384d28bf290e170552
prerequisite-patch-id: 702e37b99095301ba1dfb2b48a92f33575178d32
prerequisite-patch-id: bc7b2ea560fb0a75ae9b2858a40f7340cc63bebb
prerequisite-patch-id: 83a0f9a6655a615e796ab850955ff764b9dbbf03
prerequisite-patch-id: a579bc3d977dd6869ddd7e78247982e89bd3e86e
prerequisite-patch-id: 4ab7713c2b3b3df586b644772b04d33152f57a4c
prerequisite-patch-id: cf1743d9aeaa627ed310a663621e172a4c095837

Best regards,
-- 
Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>

