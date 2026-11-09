Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794218895;
	b=2kLnbSA/JGuNPOlUQ5l8OQyQbMSNbiLletoNAmI9NX1h48xPbaC5JX91tugys18+dVYO
	 GQ/Slj8LB+eU5Tpr1KnFzvLkeiZEgb3IoW5H3HJ22zIcHX5bkBH8E1J6Hwsa1R0Q0czML
	 NPbHuc9pzCLQ0MW3lU0HvNTAW5WoylCbx5IsGhn0qeObXWRKQUA7C3iVcBGSxz7A/EmOG
	 maTyt0LvPC4PbOUajg3xitiWB4ptWBtzx1KqDdM/G4VFWLuan8DaKM/4zP6Z8WJCMI3bB
	 SqTJojVw+SLCQiWWNTkQNa5EKpYPyq6TCTNe52Zd8wFFjzikLgZGR/WdtujEjYHwvZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794218895;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=fDSOUSQM9GLIrvCsvZZiq5SNqpo1e4NgIoTy9VWeUjg=;
	b=Ntqvt18WvBVXxboFt5tNfL+lYoMTG1Vjr3NpLwsRFvmRGNLYkdZu9kNemxJI/VxVsG+7
	 B2Vn6qoIpeskjn1jJvkPuTtWi7qVvFQUkFs5CcjwNjNBX480BZkRPIE214XKwR7GdPJNJ
	 IcZSTR7C/cTjFF2tQUFhQp0GAyxNd2KaAyijKWucpRKnjASSC1mKDnwWBtyW5Xmo1sJVK
	 ktNfryBqJqmbfWvIIC86TfWmTWr5o0S/9pJrZWXW40hqOvwgc430SN1vyQGETNoRWrtQc
	 ZiB1F+jL73JwMc5cCLynWsmRpJpmp03ctSH2UJIRSmNfvLWmZbWdXi5AzTeYVYHLeFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ppeEQm7r;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UOFpGDUv;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BB00606D83C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 10:08:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BB00606D83C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ppeEQm7r;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UOFpGDUv
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A99ukJM4130893
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 10:08:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fDSOUSQM9GLIrvCsvZZiq5SNqpo1e4NgIoTy9VWeUjg=; b=ppeEQm7rR7p7BPUY
	Kci1Awb2YtMG6qsDnCfqu96oRFwOLHYtJLPkvgpzGGfzZEUlTV57uHLKpJZuDuoN
	nuziQeeLPEGNJUcu5wVZ7Ak9UPkqcFjg+4wpgLM1iB5N27yVBhsuTgxs2nAohKvl
	7vuMoeQ+4Rl4YJ7VCSWIYenx5vzTcLsNTzhFbsalA872sgdGVqbq4QAFeXwAjWkD
	Y59JLLtaOH3YT8vfM7pNHK11/2dwmskRorfkisn15MO/TEFfS8V4vRVIubQh48aq
	M64iHku2DIagIPfFSqPTQKytP77EUo4iw/d9r9ntQaaSpbd64FGifcgJw2KrT7Ml
	BV7B2A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hu6x2h5xr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 10:08:13 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ac0ae43900so807794a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 02:08:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794218892; x=1794823692; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fDSOUSQM9GLIrvCsvZZiq5SNqpo1e4NgIoTy9VWeUjg=;
        b=UOFpGDUvy6cPE1TUgWFxNv1dgGzhPR7qaQOqjpxM+GKhNpk0UiGAdotQuNOeutuZVO
         SCIex4bbm9vJ0aCutZnNnceGPjWyZRy2zRsB2b2GglRAZDSAW5WOtyfktWFAckJ6BCFd
         Yn9goGaUwE/dJ4sBsP9BM+HKk5s4XCq/kG9DrwIpDoozZ+uJEKUD3ZYu8EHI/fsIdRnk
         gWGoNvwP7WEiWSD+1+nqjQP1nOt0qrhJF0rpEERr7TD5CGV6Ryo1Fwosumq3qYiavDQM
         /MZI6ykGRr1FTnhk/xQ3woADa+ihyhyciMEzSFTEN5S9KM4nCev2GdBCKJ6BOOH0hraA
         TNSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794218892; x=1794823692;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fDSOUSQM9GLIrvCsvZZiq5SNqpo1e4NgIoTy9VWeUjg=;
        b=NyoP76pbPn5IB5MTKMVPPp5CkMn+VCyP0fZp2woHGCPZ08ledjJUuLuKxpUkQE+n4V
         UcGN3XQpXc99tNE/85qHm6Pt+mFIKq7vWaPfrdvnxMJ0qfqj1WmSv3ZDIF6RJzCwRKgM
         Dvtzq+Havjcxo2inZIdB14SZUjHffXD5V8RwUZJuyS7wDFPfpKHLKEAb0qDf5rFXPdvE
         2Jvmdy/i8kQHoRFJI0RFhpCEyBmRgfaARZgKKjTfQNmfLMQGEo6TPCuFMQpMCEPRBChM
         38QMiuxenD8ujtEstsph9a8Yl58HDQ6Gz23PCVXCfcsIZ3a5dc/z6D1yt1htpTpEohS3
         K92g==
X-Forwarded-Encrypted: i=1; AL+hErGdOf1FbEc/+SkpHrYgcAbTf1BQ0Brke4V2RrqZTkIATU9IvnuqPhgGb7Za13kkilXYAhhn6dVnoFwdeR0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+QPH3o0HXoqLkb2C01T6JfDA2I5wkw5czqcULKgh1e0z6R+aoX
	lVhRe2D4eIqgzOyUeF0w3++QEkrqvH16ab8volJxzvCInORPtf89DP92jqfR+KR8gGYQqEpWEWn
	bmNu6SxqbN964ylBriO3T9MM5J3SED6qWAVvPrEEeJV6GMK3kQwcmL/iXLkCDBi9RyXA=
X-Gm-Gg: AYBFou0A8CWUEnohMg1BzhvWB4gne43e4cmkCNke+DN+hn5CavtShrTPiMmbkzUZNBs
	JP7ijHqQ8purL/YAikbM0VuJpSYe7xBkuuYwmahPKLYdZBEKxKKmKPNcWFDPV3Gu9m0mvRE3FJ+
	kocYyYgvWPrlIgdmOPd1RqhGiSML1uPBm2umy22QzpFrzPNlkb2j82wC0ZPAvdj33dYArnm0V1g
	JnKQjY+fNE7/TgRQSXvuPH6OaktLMV9tgUV0FYZvrYtB1mcApJ9UiWovdoqyfAgNRNFio72CJLz
	8pEQt22Y3gaEakzbl2hCRmmFdU6CCMUN0xMzMiYBtNXbRK3Cgb9ID7x1qBDh/H7uscyV+E0l0jk
	Ayy//NHDHLz/s+tvcZpyZF0s1PaiD8wpM3l9dtjE2NGi2noyLndfeaROCY1px4sHOZJogkKI4fS
	cMZbFRnEUNWlxMZ30ptosUXCM1LspP
X-Received: by 2002:a17:90b:4b0f:b0:3b0:9984:18c9 with SMTP id 98e67ed59e1d1-3b12d2cba5cmr3185588a91.11.1794218892343;
        Mon, 09 Nov 2026 02:08:12 -0800 (PST)
X-Received: by 2002:a17:90b:4b0f:b0:3b0:9984:18c9 with SMTP id 98e67ed59e1d1-3b12d2cba5cmr3185541a91.11.1794218891857;
        Mon, 09 Nov 2026 02:08:11 -0800 (PST)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1054a53e4sm10034531a91.0.2026.11.09.02.08.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 02:08:11 -0800 (PST)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Mon, 09 Nov 2026 18:05:39 +0800
Subject: [PATCH v5 7/7] arm64: dts: qcom: nord: Add MPAM MSC nodes for the
 L2 caches
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
Message-Id: <20261109-mpam-resctrl-dt-knp-support-v5-7-150335a79381@oss.qualcomm.com>
References: <20261109-mpam-resctrl-dt-knp-support-v5-0-150335a79381@oss.qualcomm.com>
In-Reply-To: <20261109-mpam-resctrl-dt-knp-support-v5-0-150335a79381@oss.qualcomm.com>
To: James Morse <james.morse@arm.com>, Rob Herring <robh@kernel.org>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Ben Horgan <ben.horgan@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Fenghua Yu <fenghuay@nvidia.com>, Jonathan Cameron <jic23@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Gavin Shan <gshan@redhat.com>
Cc: Yin Li <yin.li@oss.qualcomm.com>, Andre Przywara <andre.przywara@arm.com>,
        Drew Fustini <fustini@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
        trilok.soni@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        ganapatrao.kulkarni@oss.qualcomm.com,
        Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
        Huang Yiwei <huang.yiwei@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
        devicetree@vger.kernel.org, Ping Li <leeonion.muyu@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794218820; l=3176;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=ZaVhC2MFnbu/kTiLZ4O2AmrSppiPduQJFEif++uRdyk=;
 b=u/FERFaskIqPAl5lMELjNtPiriNj3T5fZ59uO++4QSA9Qs5HQiSwNeAUgh2JrMcmT6/6c/Rgg
 YM83twlxNzsAGhVgsRFiHTCDFOBHKzfQ5hgK+cLg1j86Sd6luy6L9KF
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Authority-Analysis: v=2.4 cv=TMjQ2Fla c=1 sm=1 tr=0 ts=6af19b8d cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=SOWVPGG40zWAznzFnVgA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA0MCBTYWx0ZWRfX8YbZZR9J2R25
 ZC0mPIsQPe1R3huNO4Cwn+naazZ/mSInhKG9yT2m/lJ1TFtORQMzBpZ1xF+xvcWY72/oxVp68Gn
 mNtBReZda2WXzNUk4zynXQaCA7GbVzfrPemqCyW/HB6wrfagOoHiawss5Rys3B++a2Jz7Vf+JwD
 xD9Hg2emOJOQHRNw0kWnBEtEbe9kVjExKW8VhGm2rtAH14GefsjJXcAw6lt8FA/p3arKROIf8w2
 VNkUyww/W8XMItpMOBeiCFjeOa64wcME3v4HbxZ+Awsce1bNqlFQgkrKSvPGEDKR40ZwrgtQ4aN
 WfN0LEV26KpUYGRV3yC+U+da+Huzw2f6D52gTXDy4nwypcj2azt0jTOPEO9PxaK/z52cKFvoZRM
 +rMw4KH0TXk/EH49G9xMvFlpaW4tITsGOiB7hjEnWTITFhgHO7lBj7eSpwAs5S5KukLZJIY0K5N
 +e8HBaFRTCT1NMxXzVw==
X-Proofpoint-GUID: -Bmvd46U8ErbTW3C9wSwI1y3xEZr-l1a
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA0MCBTYWx0ZWRfX0NEROeOXtSGH
 xQkhNzKLDKQWBxQ2eWrlrbb/4GtIsPrTxvFYVDG6cICZpUobbDmRphmIeBFc2WGJXLWT3y0tDhC
 Pczf9uOrd5SnvQ+5juBbL/wMhp1/+lw=
X-Proofpoint-ORIG-GUID: -Bmvd46U8ErbTW3C9wSwI1y3xEZr-l1a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090040

Add an MPAM MSC device node for each L2 cache. Each MSC is nested
directly under its L2 cache node so that the cache node is the MSC's
parent device and its CPU affinity is derived from that cache.

The L2 cache nodes are placed directly under the root node rather than
under their CPU nodes, to allow the MSC register region to be mapped:
CPU nodes do not provide an MMIO address space, so an MSC nested under
a CPU-parented cache node cannot be mapped.

Co-developed-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
Signed-off-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord.dtsi | 72 ++++++++++++++++++++++++++++----------
 1 file changed, 54 insertions(+), 18 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qcom/nord.dtsi
index fdbe290350dd..285c6a3e5cb7 100644
--- a/arch/arm64/boot/dts/qcom/nord.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord.dtsi
@@ -23,12 +23,6 @@ cpu0: cpu@0 {
 			power-domain-names = "psci", "perf";
 			next-level-cache = <&l2_0>;
 			#cooling-cells = <2>;
-
-			l2_0: l2-cache {
-				compatible = "cache";
-				cache-level = <2>;
-				cache-unified;
-			};
 		};
 
 		cpu1: cpu@100 {
@@ -95,12 +89,6 @@ cpu6: cpu@10000 {
 			enable-method = "psci";
 			next-level-cache = <&l2_10000>;
 			#cooling-cells = <2>;
-
-			l2_10000: l2-cache {
-				compatible = "cache";
-				cache-level = <2>;
-				cache-unified;
-			};
 		};
 
 		cpu7: cpu@10100 {
@@ -167,12 +155,6 @@ cpu12: cpu@20000 {
 			power-domain-names = "psci", "perf";
 			next-level-cache = <&l2_20000>;
 			#cooling-cells = <2>;
-
-			l2_20000: l2-cache {
-				compatible = "cache";
-				cache-level = <2>;
-				cache-unified;
-			};
 		};
 
 		cpu13: cpu@20100 {
@@ -907,6 +889,60 @@ dump_mem: mem-dump-region {
 		};
 	};
 
+	l2_0: cache@19870000 {
+		compatible = "qcom,nord-l2-cache", "cache";
+		cache-level = <2>;
+		cache-unified;
+		cache-size = <0xc00000>;
+		reg = <0x0 0x19870000 0x0 0x2000>;
+		ranges = <0x0 0x0 0x19870000 0x2000>;
+
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		msc@0 {
+			compatible = "arm,mpam-msc";
+			reg = <0x0 0x2000>;
+			arm,not-ready-us = <1>;
+		};
+	};
+
+	l2_10000: cache@1a870000 {
+		compatible = "qcom,nord-l2-cache", "cache";
+		cache-level = <2>;
+		cache-unified;
+		cache-size = <0xc00000>;
+		reg = <0x0 0x1a870000 0x0 0x2000>;
+		ranges = <0x0 0x0 0x1a870000 0x2000>;
+
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		msc@0 {
+			compatible = "arm,mpam-msc";
+			reg = <0x0 0x2000>;
+			arm,not-ready-us = <1>;
+		};
+	};
+
+	l2_20000: cache@1b870000 {
+		compatible = "qcom,nord-l2-cache", "cache";
+		cache-level = <2>;
+		cache-unified;
+		cache-size = <0xc00000>;
+		reg = <0x0 0x1b870000 0x0 0x2000>;
+		ranges = <0x0 0x0 0x1b870000 0x2000>;
+
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		msc@0 {
+			compatible = "arm,mpam-msc";
+			reg = <0x0 0x2000>;
+			arm,not-ready-us = <1>;
+		};
+	};
+
 	soc: soc@0 {
 		compatible = "simple-bus";
 		#address-cells = <2>;

-- 
2.34.1

