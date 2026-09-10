Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFAC23BFE50
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789021252; cv=none; b=UsVqXIp4BBC+MD46sdgyAKgQYsq0PuBx9uDOKD7b3a+YE5iC5JxXJP4J9vJGqm7iXf/HEylAQcI4fnYg7PC/3lZ6yr5mU4e//8dtMzLJ2iwdcd4FH0p/yf/d35RgzzIMmvMzMPI1xCW6AcRKcS3+7WENcF22P8I3e74e/Ak28hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789021252; c=relaxed/simple;
	bh=Nzli8Pi5yo58CtlDylHzM+Mem6Z2JfVTDgKp9rmb7FE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OuNbvhhh/0fIhuiBYeHU2vtyxJRDWtpt+2umlR91FbQ070K3RTQb5A90+tsapTIK3MfIHA+bhArq7WDAdSdsiFIa+N0gMSoAbKdf5DEAftK/taGuzZ1qNNB2WhPY4YFFiNhXYYbWoyqsGiRgbMWB1pHqA5D9F3e4SlPSq50669A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o6bSDLPb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CgIErZ5Y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o6bSDLPb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CgIErZ5Y"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A5Gqk3810318
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:20:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=IMgojOZAp1zHy28WUhd6qU
	yHHwf/BwfPPmDHrlPp4uY=; b=o6bSDLPbstbhjTLbpRSYAZtCstYY8ksoC+Ux2S
	aIiir4/p+vqTjx9Y1OobJIb0T4qR3eACjSGyIn9KcfePN9jJyJcvs3aGVkM9N/Ai
	4SpkrI8bFznR9XiRvXxYRDZ/gwlhxilj5733W7lI4ni/SU5a1mRYc6dgHNb0Kx2Y
	cGDrkksXkhHwlZDmt6nq1cX+8A0RcP2nyLWiN7tXOBHf2gocgdHONFzggY50m2La
	1ewB1nM8dgWmo7rKUsmWTpR5CynZ9GNSdsntzV4jcuuTtgwEJBNZxr0nkVL/k+Qy
	YQ/fEAo17DWyMXBE7fFE9Gix66AbdBrald12laHV4LEvqfuw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcydjcn8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:20:47 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39b6416441eso8450381a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 23:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789021247; x=1789626047; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IMgojOZAp1zHy28WUhd6qUyHHwf/BwfPPmDHrlPp4uY=;
        b=CgIErZ5Yk33zUNC45Q++0bJi0BDHDUJTzcAglrCzFCJqJds2HgjA9ZwryBzKZ5GT7H
         U+1o7PhcLrGKHL4m87QHQwpc25Bw6/GMo7o02MhbNPrBLgw1SRF0h1ca4WdpAz19/PNS
         cCkJsr0Kpjeiw/a4ITtVGbguCIGAx26jq3OINAcWJC+jDbONWG6rZr8HxxR2slSy0sCK
         Fiql9C7GpsTz5EKW8xFqNDXzh8r6E+BwCrIxAODtg817TDA7eBLdzVuD/F43anD8Ex/8
         aAWeRKoyt8ZmUmNIKjLIJ6fSaYZnbi0Gh+mNDVNGBcQ0RWM28fMCK39wdavFjQC4nFc1
         zyOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789021247; x=1789626047;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IMgojOZAp1zHy28WUhd6qUyHHwf/BwfPPmDHrlPp4uY=;
        b=oskI5n4a+q2NisXTvxWGawFlzW46J0A3O2SRkJqXB8wCKClw93oFzKPQn5KRo6Uaq6
         tTntxi96yvg/7SQ+kx9z/ajynFpa0YRtMcsIf0/5WUGSCzQRlmKUOomCtKUO0Fej9YSu
         SPxflx26Xbe09ulUmBOCabYwG1uQ/pRSSYkzXSmLjzU18osyUoPOwyAKqiuwYfO0k6EV
         z/eyj6XIZnOK6iyjuwK5iOLSSeAnuxk2OA2xB47sd7T9c0pGKio23S8RWKAzfc/8WqJj
         LeMEoU6KGpLDBvbu7HYILlBygOfaqO1hkZ0iY5jUpa2jKtXSxRtcOCCFRuHKs+9gT+I9
         oG9Q==
X-Forwarded-Encrypted: i=1; AKwUvBzZLgfwmKPx1PorleWVRpkwq6JThS1tluOFOFYAbcr7KgvOxYVU0bMPRiXLnIkf+aqX/Mkv2MbdApcbCOo=@vger.kernel.org
X-Gm-Message-State: AFuF++n+HpyIjwZxtCZVRtyHv5D4Ig/TNa2kxDun1inSap21x7IycE6l
	O/rVI2hupiAvpLnoHYciMPe9lgv5Tn81bzHCNuP5nmQyvT6MzevZ1uYHzELRjjdfXT9XSzUgOY4
	22wIFmyAe0YDek6ik3ToKhJX8i3lgqZzvBNP7L/v1T8NoEmBAhzWNrCK5oCMoMc1OTWc=
X-Gm-Gg: AYBFou1F+6qgljNafq0zIuxOsODE+VP4lPGrr15kTcMMBQlK/1zUP+yvioQnzn2YTdG
	12vnfJVS95wP8lCxfGX/TUUmDM4SS8ZvFJzK6bZMzZaVmU86UoTI83QGU5pZJE13Xr+eUBMPsPO
	XZo18rPdWEueMzadguuEaFDzNIsb6vfgldzwLd28b0SrycSCUoPFSXJMWdpK003E9YkaXkQqeRY
	4Zhxj1gQ/ke58Sxe5/hxXT3TIlR9EOy3ZuSfP+bzUNwzNh/98TwMZ/ue7r7q1h16lv4G9tbcdZw
	nzYE9wZaUtsTTeHj7EdqQihrypi3F3UffiTHf3k+5ol6OG7hfn+6syhi5FKHeA6wGL9cZmnEDMj
	omN6u7iJa1FFp0cv8kP920T9CjZnpUNgn1pa7
X-Received: by 2002:a17:90a:d403:b0:39b:61f1:8032 with SMTP id 98e67ed59e1d1-39d70ae19f2mr8651314a91.16.1789021246940;
        Wed, 09 Sep 2026 23:20:46 -0700 (PDT)
X-Received: by 2002:a17:90a:d403:b0:39b:61f1:8032 with SMTP id 98e67ed59e1d1-39d70ae19f2mr8651247a91.16.1789021246424;
        Wed, 09 Sep 2026 23:20:46 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339befe870sm54709946eec.30.2026.09.09.23.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 23:20:45 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Subject: [PATCH v2 0/2] soundwire: qcom: Add Shikra soundwire support
Date: Thu, 10 Sep 2026 11:50:13 +0530
Message-Id: <20260910-shikra_soundwire_support-v2-0-f98c9a6ea1e1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB1MomoC/yWNyw6CMBREf8V0bZuWN678D0NIpcVesRR7ATWEf
 7fAZpKTzMxZCGoPGsnltBCvZ0BwfYDofCKNkf1DU1CBScSjjJeCUzTQeVmjm3r1Aa9rnIbB+ZG
 WmVKFiHmRJ5KE+eB1C9/9+lYdjNP9qZtx+9saBnB0/re7Z7H1Dk3GC5GncZKyWIgiIBXUOiOtl
 Yp52QJDI6G7OkT2nuSrcdayEKRa1/UPnv6pf9IAAAA=
X-Change-ID: 20260910-shikra_soundwire_support-96dd8130874a
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Rao Mandadapu <quic_srivasam@quicinc.com>,
        Vinod Koul <vkoul@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789021241; l=2468;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=Nzli8Pi5yo58CtlDylHzM+Mem6Z2JfVTDgKp9rmb7FE=;
 b=7Undh+yiyBlfrOJb5bqA53EWwjeC+ABvwYoSnbmVCMS4O0H+c3bqDNgVIKEIW9WxW57M1uVbM
 4Fc1YroyuqJBw9ZCdLKN7gBh7zOImaVvnDJZ2QbxDHSIx1I2V5ba0p/
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDA2NCBTYWx0ZWRfXz0p28KTXcXQQ
 KlgYmy5p5wVsLx0/NhvkIrbWTIKiS+MryWAU8zXJR34At0QLf681+wNN2LxRqtOI5OY29aS6ERI
 OcYF6GjIoNik/8AFzRakuDAh4KYgXkE=
X-Authority-Analysis: v=2.4 cv=UJNIjyfy c=1 sm=1 tr=0 ts=6aa24c3f cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=QyXUC8HyAAAA:8 a=Q10Gi985DRLpIu94YWsA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=FO4_E8m0qiDe52t0p3_H:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: I6cL-nfn-bE6CB7DJSvIAmMs_b_YrW6p
X-Proofpoint-ORIG-GUID: I6cL-nfn-bE6CB7DJSvIAmMs_b_YrW6p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDA2NCBTYWx0ZWRfX9SUWXgASzPkE
 DWb8ZoYmMBk0GIB8JlOm7l89NkuizF+ePkMLRnWJtrUFu0K5dHAH6oeIa8kwoa5kRomBGWjqFfW
 Ajp2Q21hwFSyLant7p32jJ5Hd6BKIagR27ubdx78vakr/ynspXRFNTIq2ercgJ+4jpbunFA1HJ+
 dvTJpIMbEFckqbmVezc+xsFiZkLKV/mBQvvoqVDEhi3cShjal9ynioCatYDAV0uDXHC/8iEqT56
 f8KT0mmP1y4znD2lSPoVGjQW2QVZjzjaMIgLX8XXkW6UfvA9fQv6W0YOyqH6zQoU5Q/yCLA8elP
 8/I4T9zMyHSaCerR1M5rjK46opUmcd4eP2H8uDzEDFHOX0MIpxZ+P4k8svdLqRCbM9lvfOJT/ED
 B8VJSXBabHeTMDaBvUqTz7VmUzmMvGRqJreuwX+B5qmq4egBt9LXF2IzjmK1icyX2HHcjRUrubB
 9AlOfBJV7ASbMfPVTiQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100064

This series adds support for the Shikra SoundWire controller.

Unlike existing Qualcomm platforms, Shikra assigns the SoundWire master
controller to EE0 instead of EE1. On SoundWire v2.0 and later hardware,
FIFO, and status registers are banked per Execution Environment (EE),
making the register layout dependent on the EE assignment.

To support this difference, the series introduces a dedicated
qcom,shikra-soundwire compatible and updates the driver to select
the appropriate register layout based on SoC match data. Existing
Soc's continue to use the default EE1 configuration without any
functional changes.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
Changes in v2:
- Drop qcom,swr-master-ee-val DT property; the EE assignment is a
  fixed SoC integration detail, not a board-level property. Encode
  it in qcom_swrm_data match data instead and introduce a dedicated
  qcom,shikra-soundwire compatible to select EE0 at probe time.
- Remove the dt-bindings patch for qcom,swr-master-ee-val (no longer needed).
- Apply EE stride offset to SWRM_V2_0_CLK_CTRL in qcom_swrm_init()
  and swrm_runtime_resume() for correctness on EE0.
- Remove the mmio guard from the INTERRUPT_CPU_EN write; always enable
  CPU IRQs for the selected EE window.
- Link to v1: https://patch.msgid.link/20260608175345.3118060-1-mohammad.rafi.shaik@oss.qualcomm.com

To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>
To: Rao Mandadapu <quic_srivasam@quicinc.com>
To: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-sound@vger.kernel.org

---
Mohammad Rafi Shaik (2):
      dt-bindings: soundwire: qcom: add qcom,shikra-soundwire compatible
      soundwire: qcom: add EE-aware register layout for Shikra

 .../bindings/soundwire/qcom,soundwire.yaml         |  1 +
 drivers/soundwire/qcom.c                           | 85 ++++++++++++++++++----
 2 files changed, 72 insertions(+), 14 deletions(-)
---
base-commit: c68a982815dcce5464e3bf2a31ac94f5146c04ca
change-id: 20260910-shikra_soundwire_support-96dd8130874a

Best regards,
--  
Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

