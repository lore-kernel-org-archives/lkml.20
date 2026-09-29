Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C71D6513556
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 10:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790677923; cv=none; b=HJtL0qg42vfvJm+aCvLGmvonhb4Gyr46LUBZG9dPSKb6gCm7C/bnuygdQl/xYJDw7m/3sti3li2jInNVUE8ZpMkT1APXyU2HBhv4Sks6IpuGgXTMsfWu8uGgf7a7AraLNmI5GycjCrfDJNYRZnK44U73yu/VFU0ucJTSa0SxSgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790677923; c=relaxed/simple;
	bh=IH5VHP8PlJx1l0p+Guv+UYdwTidwqn/CA/t4WgQLJ6M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Afd415EIkBQXchvp07HA05q16gzPRQs42FXpbGV7cvAgMHOwuaz3d75WqO6L5d5hEJdHTGnB3WIxCxDT87g0FSj5Vxa7EZ0kNP/ZUBQxkomi0mW0hxrSWpCB233n5Qj4hBhY3wIOsOfM82clZiu925yG33txOmxRDh/FJChqMow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R4WWFITE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V6Rch51m; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R4WWFITE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V6Rch51m"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T7ToFu3435129
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 10:31:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PaGcr6dPkxjT8OOUNQPS0fduIi0Haz1qrdIAgjta42Q=; b=R4WWFITEKb+ehCNn
	JjHEHKjyz2o5nSM4yvI9WTO14syJC9mFAwC9eTjA+CppFd1mEYhhKm3jwGdv8tie
	3Ttz/+ictCsDKm/UYV+stCnsKxAujVDVTd0vnN+FBPLmqmC2n907IDg3tvTIVbg+
	oFNSAOJbA+tRaB8JYfAEYJFUK01DpVIziu/tkC0ru1iCywBvD06MY5MGuxyIrpWn
	EAps2FxGNuhhKhf7/7DCfDXtlLmeekVZ3XgDA7UcdBOWFb4+JPAjh5CCiVUvskBP
	HchiAjLGnQa94m9D8jdRTdCETxwODDKYkHda21/G4kZaGitA4sn7BiDZYgyUdAhi
	Z4fPTQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyvwnbhf8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 10:31:38 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc795ad1f5aso2180700a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 03:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790677897; x=1791282697; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PaGcr6dPkxjT8OOUNQPS0fduIi0Haz1qrdIAgjta42Q=;
        b=V6Rch51m2/e1HmRcM6wxxbRsiLDCGDBwS8MPoupG+dVCPl9vxrR9pXhRVeEqJkopL9
         DBa228+MZcfG/OjWGDWPQE0eBqbICH0DVQ6EQk+3hkDjPrA+xpQdee1QBXQ/iRVpH3dK
         oSBK8rrMBvUb97jb9zvE+mEj8vMxrdpkqN50v1znfoKoOy28EN1jts3T+azGHlTFR0Kb
         u8aBTPhnTPaYN4/+m8Qz8ylWgPXAz2a05vsXTBGAhhQref7zcuWwZXBOz2J+CzLBLB8J
         uE3BkfPgwszPKG+U+Bsprfu2k6RZqUgpF68V3qJeSPfI1q0Bm4yWs64nxyO3Lqa3Tp1U
         WjGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790677897; x=1791282697;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PaGcr6dPkxjT8OOUNQPS0fduIi0Haz1qrdIAgjta42Q=;
        b=ZHXAy1ZdwUk/zO4x3WIactD0W8d4qN68PhyXiZ+iM1mPh6XGfgq+kENTFgdHAFA/bU
         bFU9Mz7emLRxph85n4RQecodIxwXzlhhQ2TVgrkHn2bat5eAHiWa5jgUt54Af6UkBpdc
         4DPd0AIIDuzcOlNZaf1IRCK0LA75nYGLTIEGSn3SmVtF1Uynh2Lzdi0BdWhFCwmlSk/4
         nZUKLHCEY/ME12RzUTKN8fjadcbyfwMwtFle/bJyraNwzz8b7cZnvVV5AwwFw38zxcjR
         UTNKSaZU949EbRE+wlY3mntPTwlyHLXYOf6wW2Fcm/X7MWZkn5ypnt1K55FK4shxuDeS
         95xA==
X-Forwarded-Encrypted: i=1; AKwUvBwk5u07jvFKucL4WMuo+m581sdrCiBJoW0of6Ay+SQbWU4S7TQMe3vjfDcqeueoGmC7z6jyvBscshaxeG8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIICvj+fP8KTmlMme0RMpvWImti+f2Mts78hl50865/SbS823Ev
	Nw6C4xHeHlaGYY7z16jD9YcVeYZwl3tECDNJ92O+KfyNvuHlUwjhG1o7XX8lFiuIBxl0wsS76RX
	kL9WYWrmDtz9LU6zInnoRNLI6G0lTM7ICSxJjsj6JT7bafVgARoRi2OcQrFyxrNwp5sg=
X-Gm-Gg: AYBFou0g126oTMBFEq7zydWjXS5plTXInAiVTTTLeSoPkXDe6BvMFda1pSa4+fKI+Lu
	veH10EXqgM0UVRptf+mO8j5s4M+0I+MhCY0qC5Z2/i3OYbLBJ9yyrZ/7NWmO0sXY5peV3uCdeRQ
	z41ph1Qq7LvA3EDUnywHCtPtSuXBit9hLFb9Pcv/9r2xJm7rCPiVmzmkADZy6er05GIsWjbozj1
	sy0RuhollnnbDVdktvEgn4AbnZpQn7VJ2xVPoE06z0p/pNhVmTrSkiCYMw6WXDDXv9ZsBk3nks3
	uti4cTy6ca0dUYdrg1BZOeyZdDTbGhlV5kVNzl5ZUSZGs4kL6XYeigwCodjmeF6D61cgKhv766K
	x0dcPGWgTv8eBCg==
X-Received: by 2002:a17:90a:716:b0:3a4:a054:3d24 with SMTP id 98e67ed59e1d1-3a4a0544638mr1037496a91.60.1790677897426;
        Tue, 29 Sep 2026 03:31:37 -0700 (PDT)
X-Received: by 2002:a17:90a:716:b0:3a4:a054:3d24 with SMTP id 98e67ed59e1d1-3a4a0544638mr1037477a91.60.1790677896971;
        Tue, 29 Sep 2026 03:31:36 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a492dfc5absm2470791a91.3.2026.09.29.03.31.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 03:31:36 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 16:01:22 +0530
Subject: [PATCH 2/2] arm64: dts: qcom: sm8750: Add watchdog node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-sm8750-watchdog-v1-2-ea06d5dc7e54@oss.qualcomm.com>
References: <20260929-sm8750-watchdog-v1-0-ea06d5dc7e54@oss.qualcomm.com>
In-Reply-To: <20260929-sm8750-watchdog-v1-0-ea06d5dc7e54@oss.qualcomm.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790677883; l=842;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=IH5VHP8PlJx1l0p+Guv+UYdwTidwqn/CA/t4WgQLJ6M=;
 b=mNr/z8bk5wr+wP+42cFBtlNK9/4qCofqS1YEA5f51Ao/KAtZXXOyEqMj4hgh8wtlZWmBiqq7u
 tV+3x/3phAmCEltZEVJU8V4jf22bagHdkN9dPT3kFBkBR9Kcjdv9EkX
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-ORIG-GUID: xR068F6NFHMgXnAMC2CSswICZbAVLv6W
X-Authority-Analysis: v=2.4 cv=W42txhWk c=1 sm=1 tr=0 ts=6abb938a cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=kZvZsOVO2oU7rQrdTw8A:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA0MSBTYWx0ZWRfXyS84M7MLfj9i
 WKy2JrxmkL4z1qaBlfgYJwUPDYIqB8s7nmT53X5Oq0JeuCdbWw7vJpQqequ1M4JzEHiUKoLaBVI
 OfeKZWqalv8d/wuxxDxpOJ1W+BvU9mwC+ptNj9oTi8F5z18+xfAdpc4JislCu+1qt+WUXlo8mu3
 HsppeELCif3K0PRUI09t/FIroFWN2Yud/OyCoZGTwsMrQdS1A3A1uGyima9vod8VVU00HZdWPQD
 pobIBO9GLtBdfxJs4qIBgdiCn5xtcudue49E0L9kSEJ1vJuo1narkKshWuZiztHGUKJ+iJS0vrZ
 mw8fcGE+GOb+HFLZlcJX0gGNy7ehfk5/X23V62BgYqmPCvVRR4M5urPSzG9ipBh+b6+j5utfgm1
 llmqAKL70UzvqXrsLXYpGtoJ0aP4QiFtEhDra2PhGK4E+Eh3i1gtl/BZW9bT9Bxqu5fS1XOSisn
 oTuGXIh16I2Vx15b48Q==
X-Proofpoint-GUID: xR068F6NFHMgXnAMC2CSswICZbAVLv6W
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA0MSBTYWx0ZWRfX4v9KKlA0O28x
 eaHK0DmHwa9tlJyHrmvj7BzI6fKQ/tDh23dJ66KnIlLO1V51G1W+71bjhvP6yBgTfds9bZEt01H
 7ZKoasjr+5C+plekeNYBwk6q8Y5y/0M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290041

Add a node for the watchdog on the SM8750 SoC.

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index 8ed5fa4d24fc..53125e5dc4cc 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -6006,6 +6006,13 @@ cpucp_mbox: mailbox@16430000 {
 			#mbox-cells = <1>;
 		};
 
+		watchdog@16410000 {
+			compatible = "qcom,apss-wdt-sm8750", "qcom,kpss-wdt";
+			reg = <0x0 0x16410000 0x0 0x1000>;
+			clocks = <&sleep_clk>;
+			interrupts = <GIC_SPI 0 IRQ_TYPE_EDGE_RISING>;
+		};
+
 		apps_rsc: rsc@16500000 {
 			compatible = "qcom,rpmh-rsc";
 			reg = <0x0 0x16500000 0x0 0x10000>,

-- 
2.34.1

