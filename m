Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792568232;
	b=jKtO8xgk/J1/DMahGm9Yl/tGYvPLClgcg4qxCwHk/REoGpWulxOa0/7nNeCLSpu1Ef6U
	 bX0zlT4x+ymg1HHgK6HZUJ1xfTgukdP8KER0Ha+Yp+3RkULewjVoL9F74WjhxIWde0P3c
	 8bfsMX27YCCvXjCpvfxJVqDhnXGM7VYZEAvo79iuOPPr17dotrf9jAxQY+VSUittI+eVZ
	 r/Ckb8UCLZRspgaS0yBap8u8T08RcYgCTDVbNIjRbnZG/FkoRP2oZXoMX9ttj+qX8WMhM
	 MR/7ekeLxlsZVv65uebH6bKTQ5gU2jGgpHgXY3/rAdA/OJlBnsQusPtuJa3aRCt0M2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792568232;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=JIfSGlO/jG3IouXioNzaM4+ZE05BwBZCaWel7qB4uN8=;
	b=KjhpOS3l7Jw0DYmeX9IwQO5EQVLfcFDOAHt3qAbtmOSsL41WhKvim550cDj+8hzBU0YZ
	 GNszB7JjNXTlmhppa/KvKRJU+mgs2XX10wIH5eLhC63K0rqeXviRX+tl4BzQidlJzxcUj
	 Z4mO6VrR30NnzopaFkcBKgWPxFt5BicQcsLIh+kRtboy33y3r5HO0HXvO70SpD2e5Nkgf
	 gotW3wm4sVD6z7kCY+H3B0aG1AlUvsj3ln8N+2rIABG0eRDkHMgvnrvjDlcr6IVoXtO+x
	 P1ZuIvNXime9+7Nhl9S28PimVkfq3pNDwyKFb0RRP2J7i1RB27wBtPBkMc+Jbarazhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eSPmCIGv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BH4mUFxn;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D0A7606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 07:37:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D0A7606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eSPmCIGv;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BH4mUFxn
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5jOGN3573330
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 07:37:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=JIfSGlO/jG3IouXioNzaM4+ZE05BwBZCaWe
	l7qB4uN8=; b=eSPmCIGv9OEppJdMHqrGPqiV8wCu9d187Eh/9VFPGW89rbPKFuk
	SgZ32OKgGqxFjqLpqcd/gXgqj8bi7EY7wNS407fhgrEJmrq1ZIrP2ZFBuHlnEuDD
	Feeaee3Y3yHhZtfhF3SNQKmmwVSaxvtlILvctvkT7j359xQqCHXKtR6BWWY7VFwY
	HdvH5MtcdwyxvFNbXP9j85wD0qRCJ0UXoixFgVhWeKrGDqTwLmksrvPJk5V3gfJi
	EVzyn+MWx1gUDBKghaj3ba98TVwapUp+xdHNLRbNYmVzGXjDnGxCCdDwCvb7muwC
	B87UgaDDYtUDncI7nxBRGfbIgf1n88fmDMA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hed9htknu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 07:37:10 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-366c279b454so889834eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 00:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792568229; x=1793173029; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JIfSGlO/jG3IouXioNzaM4+ZE05BwBZCaWel7qB4uN8=;
        b=BH4mUFxn0ULmvuyBws4GKxkoKPIQaDyFYZ2+v24z02ShETiOLe15Vb1qIa1V+hXC7m
         JP2SK3eAPhS4MbRUgZtBPgEn/olph9YZcFsioETCtVk54ITPXJOjn8s7hNsjqS117wSa
         feFv6qzdj1ZLKB0INiU0M5Os7/z8EPaTG60NQ2rpJU9CPMVVNcLf6WTTG27DAdLvD6wc
         VVm/wZK7CGfihHO39pPF1DsI7BLTtse9vVBAWKnQ9P63Sl+hdyLeanbkuVXns3zl6Lfs
         xc1k3g+zsGMJSvij+zGnASWp21VnDf9TW2lCJHcAz5fLhco3h8Q0nlCSdD9eii0ujmbz
         ioEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792568229; x=1793173029;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JIfSGlO/jG3IouXioNzaM4+ZE05BwBZCaWel7qB4uN8=;
        b=XO//iNQRUUuixvbNZE0tFoo1t60CkhKYINVTu1SlTMoLsCCqg3H5+cEg+BfPa4NARA
         SN8bk8rTZ5rvUl/+BEyjKQl+Pnz3qzz3/EQtSSaHaKDiteEnSFd3pSVyI94+n5v48mZW
         Dn8tdPkYXVYP7eI8q+SYsmBtkpuqPuz5sAu2AUqS2rWa7Q80suxmiPWtq6wkdiOU0c7F
         L8sL91JqjF09lZc8dQIto9oU4dUPQNkdqX3G3h2nlLwOmwJ1Jhv5wfyGR1DlvyjvUHWc
         qBtyz2fyHU60LvpIgOsA5YIPtGbKURK3TjfOinaPN9xJUFUJxdAoifJ7XKtKib4y1TJ7
         Z64g==
X-Forwarded-Encrypted: i=1; AKwUvByAOz4E7iVqhTzxyAbLoves7u+wjL6uHPhz3v9qhmNKeKH9WiUX8LgYDBHMGjRpJNvw/Oi2QvKVHRy36Z4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ5uExasHDeozYYj9tssXOUroZUmKG1DgUPFQtrH5D4+AJ9Rz7q
	6y4hn1+2auGC0OU5QT3f59Ob008vKVKrdAJF4+Uer73hT/SJ3YBoqDaXmgq6/EX0I7PlOB6OddS
	qBPVbk1lbsmpvkN8aPQ55RYUehgY3ZzHFk6rM/7b224OfsEJ3e8JND0wvE4lKSQuA7PI=
X-Gm-Gg: AYBFou0nFH2Fpo5B4zNZp0V+aaAGgFGiP8/eDb9i2uPKSG6P2ShIrhsGrkOlXjaBkBq
	5YSb4ZkBfyKB9x2hh92HfMCsSGp2hB5dItQCNUNOHYTo5xV4k0HK+tdpJxNT1n9MLdqoLIxtOo6
	jCynu870zOH+z8U+qPW/PXOUaKyIH+pTrvGPbwrpZmJmcNwVn8oYsFQpzkPnDUSbmi+NTPGtu90
	t7VvytPKU7aKKQblYgTMrLx2X+asfrkq0cpow1eNVdwYx7wXIA25Fr/7fwfpSPqlfVr4V0es5ve
	Q+WkvkGETKM8xvHVS//CofjOWn+UW7s9MR0TTmo7LgDwEzMPuyIJRWCOzyoBpplcSqbwrZV72yz
	CXkdJtCmjqVI5z50al+35lSemyWnQ6xHZhpP7azp87mCEkzkEDoUQpjk18vY=
X-Received: by 2002:a05:7022:7e84:b0:143:4450:e1e6 with SMTP id a92af1059eb24-190a7660d75mr1788371c88.35.1792568228873;
        Wed, 21 Oct 2026 00:37:08 -0700 (PDT)
X-Received: by 2002:a05:7022:7e84:b0:143:4450:e1e6 with SMTP id a92af1059eb24-190a7660d75mr1788331c88.35.1792568228241;
        Wed, 21 Oct 2026 00:37:08 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903bf5d0a1sm4042471c88.14.2026.10.21.00.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 00:37:07 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH RFC v2 0/5] arm64: dts: qcom: Add audio support for Nord platform
Date: Wed, 21 Oct 2026 15:36:28 +0800
Message-ID: <20261021073633.2163128-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=YuKa1IYX c=1 sm=1 tr=0 ts=6ad86ba6 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=zx-u8faYscwgyrAVXPQA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzMCBTYWx0ZWRfX7LQ6xdLkLHWP
 dvZFvi1YqGjdzVYrQ00kI11NA2FwInUgYbmjx5on40KuUWcFtSeNHGoi7wJYp2wm4ewTLhHMFKK
 mUy8hh8lvkhgUwM3DelAjtjQ/w5jQ0g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzMCBTYWx0ZWRfX5gFGjn9gyvr+
 pbnFmxUKT34Swp/UrU4hmnXjgLpdpWU1J37fPMEAot9y/YOpT+VN/S3QAWKPv1nHap0cZ4xPcVV
 AEBx8v8Qa8Jh7Od8bI8Psx93TGpjuf9JjDNxNqoLlWjp8zRF90rKO0OZtUVHGboCee6Lp4bcTye
 kg9v6F4fgFO/wEYJbtdVvpfepyFvH/RFZYf7j0hPptV/1cTd1TSMqftV04fzZKYDbK6gTMLtvBi
 uB/IH9iJ19963KplJG5Dp9ZL46Gou3BSE5gxAKHMzMSSRY2gzX0nCpTG7KPgdh2Y7ycj1MdjJsN
 /iLR6iNUgUoamqq898ILbmg/b+saLZndNG+hlmJV7AzAkZjddYwi6BIW6jfz1BGr1EptOaL272Y
 Gh3o3+cGj2UxXLetZxRPO9Aqs6ydb3jJ5k5lCUTZD0IXlRabvg4o7V35SRd4U+ep+qcn3KRn1ZS
 CsdgozerOQMBPsZfToQ==
X-Proofpoint-GUID: 6aLLVKx2_CMR348g4CuKJqOnjMe9hLCb
X-Proofpoint-ORIG-GUID: 6aLLVKx2_CMR348g4CuKJqOnjMe9hLCb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015
 phishscore=0 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210030

This series enables audio playback and capture on the Nord RRD and
Nord Ride (nord-ride-embedded) boards.

Dependencies:
- [PATCH v5 0/7] arm64: dts: qcom: nord: Add remoteproc and PMIC support
  https://lore.kernel.org/all/20261014063953.549379-1-shengchao.guo@oss.qualcomm.com/

Changes in v2:
- Rebase on next-20261020 and drop Assisted-by: LLM
- Tag the series with RFC due to dependencies
- New patch for pd-mapper change (not a DTS one but targeting Bjorn
  as well)
- New patch for i2c18 pad drive strength change
- Support both playback and capture in TDM mode, 4/4 channels for
  playback/capture on RRD, 6/4 channels on Ride
- Use lowercase hex for iommus property in q6apmdai
- Control DAC_ENABLE and CLICK_POP_MUTE_N via regulator-fixed
  and simple-audio-amplifier
- Recreate RRD patch from scratch (mimic the new nord-ride-embedded)

Mohammad Rafi Shaik (3):
  soc: qcom: pd-mapper: Add support for Nord
  arm64: dts: qcom: nord: Add gpr node
  arm64: dts: qcom: nord-ride-embedded: Add sound support

Shawn Guo (2):
  arm64: dts: qcom: nord-embedded: Raise i2c18 pad drive strength
  arm64: dts: qcom: nord-rrd: Add sound support

 arch/arm64/boot/dts/qcom/nord-embedded.dtsi   |  32 +++-
 .../boot/dts/qcom/nord-ride-embedded.dts      | 166 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/nord-rrd.dts         | 153 ++++++++++++++++
 arch/arm64/boot/dts/qcom/nord.dtsi            |  40 +++++
 drivers/soc/qcom/qcom_pd_mapper.c             |  14 ++
 5 files changed, 404 insertions(+), 1 deletion(-)

-- 
2.43.0

