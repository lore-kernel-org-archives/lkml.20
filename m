Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792746155;
	b=iLHTaJg1ziEFN4uPby01z9R6PsxbcnKVGsk4gxrwIqIl9lWTz9e9WkGx82OoxlJcipTx
	 mjn4kR4K2aBTVDHM3pXkFUdNT+N2amUgNpwNU86OFF2rs+ccsIxzcsQ6nLjGB7rdQRu9L
	 wdrJXztnSIZfYJao37UvWr7j+S2Jcu68ZNIV8RWIujqD90mEiQTnNqDCQCrROy/DLrrny
	 yZhbs4lVHqV3cK11xDUTRHdz//3rkU+n8KZRMRMawpc25SD6Fg14GL9WQNUMll9lMCTRc
	 sRF8jGv7a7qw1LOlaJGon9+ILoD1fZfjddD5ItbquQTZQTpsUdkgZliQNVODGAIoyvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792746155;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=8W2Ztl1Ru6WUtOrWa2GjLbkwbA+l5960sGvM7MImZEc=;
	b=ww0q1OTVlDKLbHUtPhM4eV8RDjJHpjdXz43j6Yq6QC7hxrc5FW822+P4wXthjP7/FaW3
	 SruHkQVV+Sup9nRU5GYXUQzVwGBYe0uMLBxXQxYE8zdV7YgTtQibQ+zeIxnq6Qme1xr3R
	 ReAeor1TjkYLr2XugGOz2QWHtvboJHuBv9hHc5HQ6iE6aZCQ0BQCBjgR6D2egq+ryNyoh
	 /kJnWughwCYu5+/7JLlYExiu4r3EHTvpookTaHo0IjRLPpTwrbmgqboxPh/wNaRY7+Pd8
	 t0pqdX16pPiGpCtMJi4TjaNIVivoFvawkIPDamTzFOeccceo7kHEMlG8qgt1ZyOprKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MzHQAA5c;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P3TLefwg;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 124F7606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 09:02:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 124F7606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MzHQAA5c;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P3TLefwg
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N7FUqA588011
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 09:02:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=8W2Ztl1Ru6WUtOrWa2GjLb
	kwbA+l5960sGvM7MImZEc=; b=MzHQAA5ceP4GBO1qmggP3nFzB+ZdpamOrGHLT5
	IdbTd5t46Bydl+X8p+ConErVYsa0eP/J74BJ2mJCB+EwqfGoWsaWbn21T27D6hzY
	fuOWMO/IPdzPVdp3rvcRpkC74/GHrvl0h19jiEgOdujiyxPfeEFUfOkE0ZI0HHRP
	we2x861tUwlDh2Zcm3YV1hpoj12xxQMl4dj/O1O6hNAAcDM6n2tDLvWDCTy5QgJQ
	4us5ufaX3trxKes7d00yokwxS8il6NfL6ARqKwnhcqAWFGgcDTTtOZhb9QiZJzOX
	iiVzVsr6XpUWgl8TZBf3lfuFF+o11kYwBd4kv8AzP9tY5pcw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfsmatb3u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 09:02:34 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91becce058aso19629936d6.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 02:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792746153; x=1793350953; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8W2Ztl1Ru6WUtOrWa2GjLbkwbA+l5960sGvM7MImZEc=;
        b=P3TLefwgjSXyoWGfRoEAzqsuTwFiYeEzzk6aAWLRRhiya4HbJkiSuXXuAoD0yo32v0
         3AZuSb0ckj9Dhd0L6uEg9zzW2q+mKns8KVIrio6hOsxNuDkw9KIna3s2GGAhBGIdzf4W
         HKILBZl7VfokWLqYGKcE+E6F1GGE6PoILMfc3UxN2GWtPbaJ2KZy/fVFjEIMTge6fGMJ
         geO50sJmFieEhcOYCdbDcNpuuNhCswHEdZGXl9YLTWzwOtlXQUlo4ZoFW50yp4Yz9w9L
         WHzkzOvnoCE7lGR9sGouYOyTkDGb8gUCYo9vMUdBWEn38yHYqQ2wk2V/lD6ULpRsjduh
         Lqwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792746153; x=1793350953;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8W2Ztl1Ru6WUtOrWa2GjLbkwbA+l5960sGvM7MImZEc=;
        b=OMBGEVSq4cC6KSeVKaKm0vx3r/0YWfnNOn7lmC3FR7eXPG9uwaikMQJ9hRLH+1otL7
         8WDEkWvY/TcMvq+MZ4F16MO2a9V7LcrgP4+H1vvTK2VPt8z6v+jcMJ162T9ioZUMHHia
         XI6LFZtZ9kLdndAnDUeFNRKzZrupzy0i6MJFkbeLIH7BScIjaqQpUNXA9PFKGCmFx+0j
         ecTgyZV/cynIJm3nlfuCiR+cQ6WQ9rx8pgfwaMwHyVhdEXL7BYwMto3D0YaampWsHDNy
         B8rA0tDm2xy8Grzz+yShuXYInV9FBxHKsLcI8RnUaC7Dqq+GJgE1wvq4Sv8CUDfim+J7
         X+NA==
X-Forwarded-Encrypted: i=1; AKwUvBw2nwURhydoKyCvuGH3cp7XcpfYJyEDFSJ4+y/qy4vDL6JVzjDdk9Y46I84f8JtXdXx5fF7kLm9lw5xrls=@vger.kernel.org
X-Gm-Message-State: AFq9FYItVtBb33yxGwvDpYY+e/+W3kb3Gl51PEpn5K1DEmh+Rl1/D2Lt
	zL1cI7Euc6KMoWpLfOCXZT+9X/zvGTqDdpgreUn9qsmRrU9413y231R80EhzzZ+AV9A0v7UpJck
	mKr3hEDdJyk9oLniLm3y1UeTY3o6BojIllbuVfUvLT0LIE0yxX0AhBltkrvsMz2pVYhY=
X-Gm-Gg: AYBFou3ifvfNr2FSqFyYYptwHIcQGdyCIyiyH2H5mg5rM9owTOFYMuop3R2GolewxdU
	SlwIuGYd0bDqGv6+DJH4vfO3OX7bUaQ2FvWOAboJ/AH4Z4gC1yzobhr/Ww5inCU45qBM4f47lrV
	r6EGRTyCvzToOLtvspeDuFK7oO/oqwE4ap6oylRU2ORfg+fIjTBQqfyRC0y5Itt/x7phfkv+BSt
	D3QKELK0oYNbtexB5OYcmq+xTiiDVZMbk2wf3jEMYFmQEtpa0uzLdkXOPlge1Q0AeZ05selppVw
	wS9hjIG0HyxktyX/o51g05QhOWfzUpa8+PMkQBwMdDCwmbaLLEKKSFFnDbsD8/fyhh+j4ug+YaD
	49W0DYzmnYTtnznu11nQoBqn/9MSt
X-Received: by 2002:a05:620a:450b:b0:93f:115:7338 with SMTP id af79cd13be357-93f6f8796d2mr286961585a.54.1792746153146;
        Fri, 23 Oct 2026 02:02:33 -0700 (PDT)
X-Received: by 2002:a05:620a:450b:b0:93f:115:7338 with SMTP id af79cd13be357-93f6f8796d2mr286957385a.54.1792746152617;
        Fri, 23 Oct 2026 02:02:32 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a215437d4asm23076245e9.3.2026.10.23.02.02.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 02:02:31 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH 0/3] arm64: dts: qcom: sa8255p: add ethernet nodes
Date: Fri, 23 Oct 2026 11:02:21 +0200
Message-Id: <20261023-sa8255p-emac-dts-v1-0-a34d778ce9ac@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAJ4i22oC/3WP0YqDQAxFf0XmeSOT6KhIKfsfSx+mmurA6qgZS
 0vx3zutLPuy+xK4Cffk3ocSXhyLqpOHWvjqxPkxCvxIVNPbsWNwbdSKNBWoiUBsRcZMwINtoA0
 C7bkxhDkhlYWKtmnhi7u9kV+nXS88r5Ec9qU6W2Fo/DC4UCcj3wL80F/+gUXs+2+dHPYDGk1Zi
 ZiWhFVWAoL0PHYxoE+71X96kXRe7feLmcZx/I+T/8YPPUz9Ha5YgIYiQ32xsQdX5g/aadueBKn
 lCSkBAAA=
X-Change-ID: 20261022-sa8255p-emac-dts-dbc521421276
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2447;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=RCKtRuKFrR7tGXSvR+VOJ0TS+wAcLe2hylKIV4cNKmM=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq2yKjD+FzEB0z7TSHAVjvTmQXHm2qerhgN6dXd
 AbTbbAZ5U6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCatsiowAKCRAFnS7L/zaE
 w8d2D/wNDEtZzRy7jn6lzojLtaiBXzd5mY3y1IqsxfoY+aadKSLVvBgphSOaPhb80fkLhOXTz2T
 lHehHjK2hkHa0QW9uz+H43bvogsUBwmCnV+NCwNYOKHUxkcsdGrhoDgeuO1mGdCAIiIFLB0BShF
 y//KtdPrHndS3Qk2sO0ZoFIe2r5JM+iwUIoTaOD0JdMV1H59v72lB1p53xGVP3+kUz+gfhmBdpA
 3p4ZN98H79GldtdbTFP211uA8NhWS4MnjXftDuyJVf013TeoQ65WIWMgXo8tO852cw3iO1PgfA4
 yFWVTWAEvOHFFEy88DQKWyFDkkwf2j7elXx//bHcFZ/zhXqozNY7ZXVJL/d/2FLZ3nLIxhjjcuy
 jWnAIV11UWdtBtyZtVLAO8j10eD+blQOQku0+NZBwIYW/UoiJunenREBCOwd68yoD39GU2CgMIu
 cbUq13y13O+aL1Znt8bdUfq7tqPX5UtiS/ykHmyXbv53ViRvm8iAlzLBI5Pvzg2ZQfBEumNGq62
 BWQiP5ClSsS2+atiNE4PO4zG1HqIHCoIf1/n/iUQHT5L7Xz38DkhCL+Msm4b8ts414cFFUb6BMz
 CUtPzW0MPBkKrsqyVhioh9JACmliAjXpVqFyiiinBogccPOHyXvOr5lDfTj0FzX5etvoHJsOiqW
 vUKZM8efPUgOsmA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=V7LoQuni c=1 sm=1 tr=0 ts=6adb22aa cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=fcLLu9nwmMbFcDYE2AgA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzNSBTYWx0ZWRfX9Xdx/pK9HQ3M
 SPyeuQsPwwD/VjXqPhPgI1GFQNvLjAUgwqvlJXE2Ib3Ev0SN5l50ozO5s9H8U09vnAeqmNkdloT
 B1pEFZ7ww0VdOdoJvcCB+KqQY3JDntA=
X-Proofpoint-GUID: zghh4pzn_rJopAjz659MkmjnBCmwTvNf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzNSBTYWx0ZWRfX/XBmhwLJ3UxO
 6AX5gZwxTgxTSqRVHXKQNBijeNPLTpC4endKCC3Xs4Ra/rBIavPiolYvz8h5RAUBiQv2s1ptFX6
 OJI6K4AKYoHnAas6HwuvRF5/7cANsxd5ZOFrb9CUopiklZSv6OkV3YGxSvrHXCIakuNGafVvzpc
 YzuYfJNItiBRiS08md1IzjG7dyNL81IoMyj02xeGhFnpKtE0qit1sNR9GRLxk9exmYY1wY4zDqi
 kWOMQkPuaYyALB9XAuYIMLXF+SVtlceUrE2ACl/DnZspAyYxDBdpuJJddD++5HaT3hZ15vN8KoG
 IyMYVV/XW0xH2lkC/3qBKKJtHxFPG97WOGRpmZ7SSJ/oWY1sI7VI8oS/qe9qoU8f6X/Um0pfFBh
 sQLO1OOsaHTpSwTmDWe7yCXHZLotnYfWNHSwJBjJE0h34HQYD2zu/LW58jhqkC9PCfMtbwMeVzJ
 xqww5W3ofBclOi8XCPg==
X-Proofpoint-ORIG-GUID: zghh4pzn_rJopAjz659MkmjnBCmwTvNf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230035

This series adds the ethernet nodes for the gearvm variant of lemans and
enables them on the ride development board.

The first patch is a fix to the iommu SID mask - it was wrong all along
but only triggered a crash with recent firmware. This should be queued
for v7.4 and backported to stable branches. The second patch should be
squashed with Shaun's series. The third adds the ethernet nodes.

This series is rebased on top of linux-next with the necessary EMAC
changes already queued for upstream. It depends on the series adding
base support for sa8255p[1] and the SGMII PHY series that's pending on
the list but has been positively reviewed[2].

[1] https://lore.kernel.org/all/20261015023711.721837-1-shengchao.guo@oss.qualcomm.com/
[2] https://lore.kernel.org/all/20261014-sa8255p-eth-phy-v16-0-6310fac52e85@oss.qualcomm.com/

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Bartosz Golaszewski (3):
      arm64: dts: qcom: lemans: fix iommus SID mask for ethernet nodes
      arm64: dts: qcom: lemans: make the emac compatible specific to the embedded variant
      arm64: dts: qcom: lemans-sa8255p: add ethernet nodes

 arch/arm64/boot/dts/qcom/lemans-embedded.dtsi    |   2 +
 arch/arm64/boot/dts/qcom/lemans-gearvm.dtsi      |  28 +++
 arch/arm64/boot/dts/qcom/lemans-sa8255p-ride.dts | 213 +++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/lemans.dtsi             |   6 +-
 4 files changed, 245 insertions(+), 4 deletions(-)
---
base-commit: db4ba5d3b1ed0db55a16ce32764f8c9855013db8
change-id: 20261022-sa8255p-emac-dts-dbc521421276
prerequisite-message-id: <20261015023711.721837-1-shengchao.guo@oss.qualcomm.com>
prerequisite-patch-id: dc952656b431f0bf8e2411ee14f50e7884cabfa1
prerequisite-patch-id: 27868f2a4c4ab6fcc455b250f3cda1cf1c7801c9
prerequisite-patch-id: 341b5a589bd5eb68854ad203e1facd93e1b74192
prerequisite-patch-id: 18b6ae4d5a6da83554473326a956fd03c7571b7b
prerequisite-patch-id: 5293d5db8a1231f0c1d4ebc0e9aad6862e8c06d0
prerequisite-patch-id: 7391f02c4b57ae6afb088fae3150ea215bfa594c
prerequisite-patch-id: 5666ecb900181a3877c902983bb1c3ec3c3058a2
prerequisite-message-id: <20261014-sa8255p-eth-phy-v16-0-6310fac52e85@oss.qualcomm.com>
prerequisite-patch-id: 16cabeddf5ca2469ab9eddf6acfe1b86c625d11f
prerequisite-patch-id: 0a76ec6a2e4431d679f4918b3d469c9644dd660f

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

