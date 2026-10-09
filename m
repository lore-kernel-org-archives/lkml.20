Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EABC49B5C3
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 13:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791551594; cv=none; b=aZWpZGbS9lWMONV0AUXP9vXcDtXHHVJ2xh8OVATIn6pahxH4kLLHSgnwMPDC9qeBy5zy5VpApt0k0yrjH3+L+xkh9UqUVKwwN++g/pV6hgNKDVBJewfsFb09CqJed6zQnl25fIoZf7AzeXlefJKHXikDAcOeQF1hgJK9bEGQibc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791551594; c=relaxed/simple;
	bh=UEbmskBorYmmQbDJ+gVJYn7vft9oRXM2EpvvWF/gsyc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=V0gJyfKehEJusTztlmXiXCKCzFebZw9hfjepZuHdWsaoxu9V6bSzrBn/KuoWPP2HetwperNyDJ8P8XRSG6m3rKy/dP0gC1fU/+25dP3yb3Afteka4ro2v6Zi5m2WjmujOt0Vj4Vkyzo5aye/tRj5J2DlDlpIWLsiOHETcl/ytd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SgOestXW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gxqnNDCt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SgOestXW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gxqnNDCt"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6998KOCY3977808
	for <linux-kernel@vger.kernel.org>; Fri, 9 Oct 2026 13:13:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Y39uACIITAm3E86iuyCJQO
	h04AK3pIwWRty/9TUNn4g=; b=SgOestXW8KQ7k3easDcL6nYb3wUjQIYZo8F9dt
	ZjR8waHgtDWl5oubLJJyOxMhng0Xp7Gj9pG/ATFPJPT1IP8g1iIZlyQcHO5K7foJ
	TVPMKEArVefQvizentDt2O1yPNVnf/lILsdFiQ3xJCVZIbu9ht3Jm52gs88L4uy9
	r9V7TRDgUsoxEbxqiKDang3CIOGAMC/gR0OzDcq4TKcz/X4kBgQXr9gUK7hf8mIR
	GC/wUtB1qARkf53XMtkqe4wzxL8OU3S9z9mpscc8LxsPLfqlqRu2i3Ebg6+B0IQj
	wEGAiJhgqWV88ijQwiC3z7+WQ7R+nDUrQjzHa+MXzq3PDzDA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6ev5byfe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 13:13:11 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-88629a452e0so5145711b3a.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 06:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791551590; x=1792156390; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Y39uACIITAm3E86iuyCJQOh04AK3pIwWRty/9TUNn4g=;
        b=gxqnNDCtkYCacJr5bkhQdEvDhGcvG5P1Sum2YEYGwO5GCnwuze7UmYj5gt48h5oKfG
         zAujH9vuOkgw5YKyLpq+Haaqd58fwabxErjxhPKOB6R7FYt34ODFEM0E1vVkj7mfqh9C
         wC+s3y51ZDjWIU68oYWyrYVj8gUN5co7Y+E6Rpe5c7PiGFTY2BLlH69PJOTkdK8KpYS9
         36eJMUTl4ucj1X45LCINmHy2ReO9Uk6wVNiCI/9nN35TIsKY4wejrBBRulHvnIJYuHLq
         N1LWKso14HWC6uUBLpezZeuo6hU+oU+La3f3hNPuRbheHdvSwRuV7dRK8zmAMg9GFHMm
         fQvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791551590; x=1792156390;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Y39uACIITAm3E86iuyCJQOh04AK3pIwWRty/9TUNn4g=;
        b=c2ML/mD7Rp0yKhBTLMjQFsCCtYbWs8U8J2GbkfXld1VoA88Lw3KkCNT4xk6zD8Zdq/
         5ta/m78DW05zBGxN69A4wZMDS4cEc7kkQIthGjmJxUUnkkfuepnYQg1pUH0kAy4Npo4h
         rkQjGScCLht3H7R94j4D58W2rpiOu8urngqulKv8qS4KLJjVAfJhv8gVIzaT9sAIk1zB
         r8qZmCEcpooodQ2WuthZ7Q09yE5eGhgDK4HLlBe9Oyl9Vl8TpUfO6FNd8OpmhVnT8xfy
         rOQjpRmEuj3wXIvWaNvRTRbc2ky6NTGMaQh513mf1jRWkcwOyv8VNRQ6ppzLyTQLaDF7
         Am+g==
X-Forwarded-Encrypted: i=1; AKwUvBw2PzmngyZoDMkxOL0exDBNURw8q/TP5xj5S4JhjLuJTxUJlHdqMnQ9PTx6prQ7cPqoP0lGwWckXzL5fYI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIBBRvaOMM+TtasgXWcOsvWx6f1Oht6NDZpEfANUB+8DAxbPhA/
	Mvzeumk7dJJOiOI7qvYoIOKjOH90KGbbXZZG5koyncD/Fo8hc1MAW01BGCdWq8AKBqgK2SlfbEx
	zoJL3rB8cnTeTaGuTlvMj5BnPNP5Hy26tqbp8NilvAJN0MhkG2v/RPEjmK9fM/GCBjoY=
X-Gm-Gg: AYBFou1r1KKUdLxGsrygo2Kypoo6UAXlG1dTfe+A9S2/cWGDRKLKzFRNKVE+OPrxGZl
	bhdnT3aklVqSku4EXLVd0DcGTYyy4EVVsG2IYCaV/BeFEgEsOm95nEMNNA9gh4+AlWQ0/KVwUwO
	aUXGNZj+PJOxV4WYMsk/clFyjkoM6YncCO8l0KRSAdGA5IPKddiiro38P/A/nPwFJp9OYdn/aWd
	4EH15q6gJbPl/YubXsaffUpXk34KITYh6oNROqLxk7yempbLfj0unYs5C8syWBzGWrGjAf3/j4R
	fTj6Qg3Cp9Zn3EEk+iSRpkIlru2sbxEEOMoe6K4LUicNWpWe25nJz0G/3WrCr/W8G2Cmq702Rcq
	5sCTRpoweuozPlomZDsDwtP/y3p+0jP3fX4LI
X-Received: by 2002:a05:6a00:18a2:b0:890:b18c:521f with SMTP id d2e1a72fcca58-897c7cd32b7mr1816399b3a.50.1791551590525;
        Fri, 09 Oct 2026 06:13:10 -0700 (PDT)
X-Received: by 2002:a05:6a00:18a2:b0:890:b18c:521f with SMTP id d2e1a72fcca58-897c7cd32b7mr1816365b3a.50.1791551590026;
        Fri, 09 Oct 2026 06:13:10 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c4b8ec86sm939053b3a.61.2026.10.09.06.13.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 06:13:09 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Subject: [PATCH v3 0/7] ASoC: qcom: Add Nord audio support
Date: Fri, 09 Oct 2026 18:42:46 +0530
Message-Id: <20261009-nord-asoc-driver-support-v3-v3-0-0c1897f21ccf@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE7oyGoC/32NzQqDMBAGX0Vy7kr8IWpPfY/iQZO1plRjd1Vax
 HdvYum1sCwMfMxsgpEssjhHmyBcLVs3eshOkdB9M94QrPEsUpmqRMoKRkcGGnYaDNkVCXiZJkc
 zrBkUCbamKotcaiW8YSLs7OuwX+sv89LeUc9BGRa95dnR+8ivSdj9SuWfUhpOgmxVV2CVSyXNx
 THHz6V5aDcMsX+i3vf9A7npFzDfAAAA
X-Change-ID: 20261009-nord-asoc-driver-support-v3-71ebd98740c6
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Srinivas Kandagatla <srini@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791551582; l=2975;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=UEbmskBorYmmQbDJ+gVJYn7vft9oRXM2EpvvWF/gsyc=;
 b=JyJx1aPN6oQlpiEa8pgospxLDqs5jow+1PRDhP0bSYgmWIwNtrwMMSEx3p5JVXhM7Fy5gUkc/
 A4+kS7/HySHDoQBfy9kIoivfARDL2fw83bB8w2/wNhYlROwNBiXQAif
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA1MiBTYWx0ZWRfX9ML/WfjxLgJr
 DmsauZ4rP617DGzv6b5lp2JdfgphhYpIKmhtFnGA3ov7xm7+hpWdCtlD92rI4bU7qjzXCTDhfYk
 2sUNCr2fHdjYogQH+V6Sn3fDkG54A3I=
X-Authority-Analysis: v=2.4 cv=MMT1C8Zl c=1 sm=1 tr=0 ts=6ac8e867 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=sozttTNsAAAA:8 a=pGLkceISAAAA:8
 a=VwQbUJbxAAAA:8 a=iox4zFpeAAAA:8 a=3s0VHmhASnHXix99wlEA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=FO4_E8m0qiDe52t0p3_H:22 a=WzC6qhA0u3u7Ye7llzcV:22
X-Proofpoint-GUID: UGxpCVpjzsVcPhpt3fALGwjQQDT0TMAZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA1MiBTYWx0ZWRfX86zUC5gs2O2j
 WTd8rom+tKT/3SE7oPtZWtkStvmyR80zqsP0CFLplOkBgP1ZxR4qUH1LzF+sGcABJSY/5f1gUK0
 NRDNtUkdxfVg1P3ckeMSrwmNhFI7Sb56GHmZMO2+z3673DJDHyHepvKwl+poa794ricvsWOoubh
 bU0ddn0tMl8gmNmRZHSDyauZDAHYwUzUsCBeQsAZe/shdYqH8KMrjR1fif7ASI/fdoFAxnRNZFa
 36sGC8SODI/JCb6HbINN6ra7Co/jQCgIxUm+/d9XjRvJ/ogP07wHYEYZESpBvitCXWJGhTtrvej
 bdhsVSwL3vECcNNgl4w1KsDjabLQskmOXIeLkSir6uWcubYzshYYoqNDsF1AVJFM7khcka8WMhm
 veVYObeeKUQ4mXUeCGhLT2ef+OsH+5Tvp5iX+YqWx3yvEJPUCqXmLnMwEEJ2LPGYi93f/v1PRNK
 h2A/RG2nKj27FtefnGg==
X-Proofpoint-ORIG-GUID: UGxpCVpjzsVcPhpt3fALGwjQQDT0TMAZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_03,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090052

This series adds audio support for the Qualcomm Nord Ride and
RRD boards and includes the required machine driver, device tree
binding updates, and codec improvements needed for the board's
external audio codec configuration.

Nord Ride uses a PCM1681 DAC for playback and an ADAU1979 ADC for capture.
Compared to other SC8280XP based platforms, Nord Ride requires
board-specific DAI format and codec clock configuration to support
the external PCM1681 DAC and ADAU1979 ADC.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
Changes in v3:
- Enabled PCM1681 VCC1, VCC2 and VDD supplies, as suggested Konrad.
- Link to v2: https://patch.msgid.link/20261008-nord-asoc-driver-support-v2-v2-0-0b6f7e94060d@oss.qualcomm.com

Changes in v2:
- Dropped patch 1 from v1, as the ADAU1979 codec change has already been applied.
- Moved the compatible string from the board-specific file to the SoC file, as suggested by Shawn.
- Added runtime PM support to the PCM1681 codec to manage the SCK clock sequence.
- Added TDM support to the PCM1681 codec.
- Added the required POR delay to the PCM1681 codec, as suggested by Mark Brown.
- Replaced LPASS DAI IDs with QAIF DAI IDs.
- Link to v1: https://patch.msgid.link/20260907-nord-asoc-driver-support-v1-0-997d3b20cf43@oss.qualcomm.com

To: Shenghao Ding <shenghao-ding@ti.com>
To: Kevin Lu <kevin-lu@ti.com>
To: Baojun Xu <baojun.xu@ti.com>
To: Sen Wang <sen@ti.com>
To: Liam Girdwood <lgirdwood@gmail.com>
To: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>
To: Takashi Iwai <tiwai@suse.com>
To: Srinivas Kandagatla <srini@kernel.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: linux-sound@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org

---
Mohammad Rafi Shaik (5):
      ASoC: dt-bindings: ti,pcm1681: Document the optional SCK clock
      ASoC: codec: pcm1681: Add optional SCK clock and runtime PM support
      ASoC: codec: pcm1681: Add TDM support
      ASoC: dt-bindings: qcom,sm8250: Add Nord sound card
      ASoC: qcom: sc8280xp: Add Nord sound card support

Shawn Guo (2):
      ASoC: dt-bindings: ti,pcm1681: Document the PCM1681 supplies
      ASoC: codec: pcm1681: Enable the PCM1681 supplies

 .../devicetree/bindings/sound/qcom,sm8250.yaml     |   1 +
 .../devicetree/bindings/sound/ti,pcm1681.yaml      |  16 +++
 sound/soc/codecs/pcm1681.c                         | 157 +++++++++++++++++++--
 sound/soc/qcom/sc8280xp.c                          |  51 +++++++
 4 files changed, 217 insertions(+), 8 deletions(-)
---
base-commit: 62d9f9ffdfd44e88010412bf8f23732f0a93a9be
change-id: 20261009-nord-asoc-driver-support-v3-71ebd98740c6

Best regards,
--  
Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

