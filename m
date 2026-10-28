Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793188111;
	b=npfnK1Jw/1H17tJbcMs9dDUY+icYVmjTsO3BncDB6adP2m2k7oEDzhH9urCJfIsmkBK5
	 jTr6z7GS+GMiW8S1xvpSKcHL+X7kyg8unB7CLiuciYhL4IsfTMKPvM1jkJklviDE45jmn
	 T0XjFsBlEdDEbNePaUGsuiOySLqds6L9utE6JUjQwASgtOrVcOsYBbTyIrMkh0VTH+ViV
	 CGnB1EnwKY2HVkJGz9M1Epes06ma0JA47Yo0cXRHvPvz06rFEwfca3lUzXhfBTAIbCxoQ
	 NzZJSLrShJbUSETiOgtkewQXn0NxGXnVYrHLpF7tgjrCJsKLoe27kDdiIzyhoyUZ0GQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793188111;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=gk3Y1DE54vx+474+Yzmdg4fyyjQx7MEGk73ueeUupgo=;
	b=JtvQUW1TAd5vAzlkoaZMWt858VvOyLflmVwXrDyY0dsAaG9YD3E63lFp88sfmfp5TASA
	 irjNExo9NiJnEedWdLOkzwk5e5/hLnfV8uhvJT+6NGN98IYu52czxuWDRexF35fo5Qefr
	 1R5W0Iu/YQQlFBRL1OyfgFohh4aalN6ohS+623bUbeGEH7OQ7Sn3wSf35ZMB+1ZTJVGgo
	 ZTclCQimM7yJ9hMMZUgrfawTbBRL9xxmuhlnX6B3GkONlzs0oKQ1gTXgYnRpcZ2/36LSE
	 9qkW56x/4vzrKIRlVYETGgkGCfiBuNkT9G27VXFhLqetSadqmYycLpXYepKDWpK2Gzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BPCNdJwD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bn6P3afa;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30814606A31F
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 11:48:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30814606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BPCNdJwD;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bn6P3afa
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBe88G1012067
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 11:48:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gk3Y1DE54vx+474+Yzmdg4fyyjQx7MEGk73ueeUupgo=; b=BPCNdJwD35hChuwT
	JQOnqjp4G0M2tcP2sveGVgO1bOK0Bi6WszVbz4yjet+bzzstrO+Ga2YJLSteeRj8
	zCm42pWeQz72IU8i+1ECjHGVVZNtf5PwqQyYDJtMfes91o39rKJijOyGDco56M5c
	ogvPLGrZdMsmdhqKBAHevYqq7Jk4f+rjk1ThiBEwpAPPnQcyoCUJGE7t7Afj6m/N
	D4R4C0yWpbs5VzefSQuBsgs2ggSgQKBi5cJctkqN/ZcdugzgaV6IUGLI8Ad61d9u
	x8JtSyATjx5267hYSLyKBKxmrERSXui9G+D2B3OU1FZ9jO3U/BOjx5raAkVnvOHh
	VSY5GQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkfehg86s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 11:48:28 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e869e00005so10696555ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 04:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793188108; x=1793792908; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gk3Y1DE54vx+474+Yzmdg4fyyjQx7MEGk73ueeUupgo=;
        b=bn6P3afa4ok+thlXjBr+0YaDGdiX9PJmq8LlhwhqIG6MRazwHEdEs/BYAjZTO+xAY/
         fRTEFHmaBPiGW/6ANQDax8A/jGdgWJfHn2xzpa2LPJpBazpmltSnKUnq7qcMeklS7Z7F
         0HL/GghM4Ve5cWBDKdidj50e1dSwNKcC9OtukqWa2uQpaluOAmxu7qaEXRLnht7yZEP6
         rlGIg80aFdpa0SAsRJTIuWF1CSqOffRpUDPMnLwYUZrMLoZkI0zFWuZb//WtJm/4wOhJ
         fbY1/mzCWU21zAyQOWWZ3J0AFjeYxz/+lIHfJEmAW+zDwOvGC71KdHa/NlI0W9LPmIFa
         pSmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793188108; x=1793792908;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gk3Y1DE54vx+474+Yzmdg4fyyjQx7MEGk73ueeUupgo=;
        b=goIkOc2ixaQPq5Zu9ITBccz5E0enGp4K+VHInGPmhyekA6FCKRX4oebg0SyglNR/hB
         H3M1Krm1Ii/+d+YBhXAi7j7oQSAULPH5IhJM5nTBF8vcwcUvSKZ73SqjtAZsU3tL3+Yk
         OV2yOg4uZj4jkhcgF9v671MLIBwqMZHkN5vs3tiJUiygnlOC3dceGYIC8anyrB7KRjOe
         rSlUnh6tV/UHrKESSOXkI/rqzViFC5nxT2ZOBtIT8caYmkb426PTNMlMk7EW3O1EhkoS
         cBe9ur1PlgZ50T42Fgrj/M6zXm6/x1I/iKNj21xN1wBBhD+RfeAuiUBA5DTk2XZcwGPl
         UdzA==
X-Forwarded-Encrypted: i=1; AKwUvBwWRWKPnsoXCwymt5rnCMFFrgDQXa07Q6Dm1pYpr7QybiYXPBlSzcv3eev6TczmSl5Cj7hLzuFm7cJH+zE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ+17SFecRYM26v4zxhBLjXPa3SMSoA3gP1DsUoVsMVRTOTtyiJ
	hER+NJVEHKOgRTjTcccqAbOJCoeDM4iKm5uL8W/EmHL82bRIcl6sU5Nt8kw33zFGlod6PUbFAmV
	gG6LORakTFEbYgGjEUpEi9C1boYzNZZT8CbD+YCN48JzmvDUNbtqXBhlYNmGIt/i8Crk=
X-Gm-Gg: AYBFou3iD/PBgHymp0SlWvnPMXeMuhwAPUn2e1EwBA/4BTa2oT33yv7jIVAjqZZCp54
	yDYOKKZD6PW0GrvJ4G7Pn5UQz2nNlrgOgDZGOZGTFX4Mgbfv4YfE0SOxJ2YbGYdY3inRZKEo3Vz
	6quu9jqdfqye3gVgSTnkrEGTggxksSsampBhjESl5ZXzvUoTO0UqZ8MU2hJ3jzDTOpNyffPq8GS
	WJNN9nGDN/NFONBwFlmZhcsDGGlgJEGMwLddEGEsh0MwvLzFwQg4y5cdC33ZiYd/g8JMXOv30m8
	Jc95Y/ICo9WSg7MfCFed9VyM/WLqPytlsvpJJKtr6f2Nmh9HDCgI4vGRqnUtMlqmVscO5na3wuy
	BGl7nX69e6HWJ+7HH/CK020SNEpLB5KmIQ5+IMtfYl2sopPJL5qkxiibH9mbp0YgMPclNEpuv8C
	tuAEqQzLoDZXqsVSJjntAH8WzRfddZ
X-Received: by 2002:a17:903:2b06:b0:2e9:5714:6087 with SMTP id d9443c01a7336-2eb00156635mr19432945ad.5.1793188108007;
        Wed, 28 Oct 2026 04:48:28 -0700 (PDT)
X-Received: by 2002:a17:903:2b06:b0:2e9:5714:6087 with SMTP id d9443c01a7336-2eb00156635mr19432715ad.5.1793188107526;
        Wed, 28 Oct 2026 04:48:27 -0700 (PDT)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6c37551sm21207715ad.51.2026.10.28.04.48.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 04:48:27 -0700 (PDT)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 19:45:46 +0800
Subject: [PATCH DNM v4 6/6] arm64: dts: qcom: kaanapali: Add MPAM MSC nodes
 for the L2 caches
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
Message-Id: <20261028-mpam-resctrl-dt-knp-support-v4-6-bdda1e445cba@oss.qualcomm.com>
References: <20261028-mpam-resctrl-dt-knp-support-v4-0-bdda1e445cba@oss.qualcomm.com>
In-Reply-To: <20261028-mpam-resctrl-dt-knp-support-v4-0-bdda1e445cba@oss.qualcomm.com>
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
        devicetree@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793188049; l=2980;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=EIpg2fIGRMBRydrB5ptmJ7TII/dpx+YM1XoZaljDCw4=;
 b=x/J3ue5uV1wMxc65LI2QTgcNRDwtcWB8n7h0nyP0eO1K1PUyDd6XfFsaaNBgUK2zJSIqu8/PW
 qhoFFd1vmHqBIA1YzSyn/HzTI0xkTspyTgNaiZf1+/H9UOE3fkw1nRm
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA0NiBTYWx0ZWRfX6bDnAKjbuO5U
 gkvkKWU6vYC8lSMnpRxfK/7Ys83WEQv1rZIdin1p1ylQGoIF5F4X4HZMK82auG8Qm9n6PUWtB43
 GjePH5inxYj3K6OQl66zOyYVn5QXseMK4lNpq/cM4APTVyAxc4ItMeEKff4Vf1BxehxkTNpfOpc
 fOxWCCYuX9XaJj7Oz2Cy0ecz5mIdah4eOuq2SUSX+0ZlJiCKV/IRvwPAvAczEZMMTww0wrccmq7
 uVuGXWJe0tNiRx36n6iEj7opSCUwmYVQ9M2o+GmCMCfdpFQJEd3ibbwbMKSMHbg392IbuHH8Var
 VAXCjTOUBPRBz92riPDGwbX2ReujpIcGtYs4jo/FZK34DtcVjSUEulYXmqYVdvWRpoI1gkCbNPJ
 /wcKqYjy5Cvf3PN/C6ZBgTEZD0K6+yQLAj63P7ggIYO02/PotRe3tHMjGK+21Lw68iK0uVqSpaZ
 FOc1cR46OLgIlVHJ0nA==
X-Authority-Analysis: v=2.4 cv=A/T5rKWG c=1 sm=1 tr=0 ts=6ae1e10c cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=ODdVmvVKQohEaym1G8sA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: kf7e9yhRknMTcAHUVrM065-WgtbhDoQB
X-Proofpoint-GUID: kf7e9yhRknMTcAHUVrM065-WgtbhDoQB
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA0NiBTYWx0ZWRfX5IqDdF8asrzE
 kYsJcz89ylMeNXPPlyvq3BhaHS4mrv2A+1pweJW/wGgniej/y2p7IB3lZ6yA1NWall7bBf4rB9e
 JXTHQw0VP501W4aILOqduX1JtrR1l4A=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280046

Add an MPAM MSC device node for each L2 cache. Each MSC is nested
directly under its L2 cache node so that the cache node is the MSC's
parent device and its CPU affinity is derived from that cache.

The L2 cache nodes are placed directly under the root node, using
'ranges' to map the MSC's register region to the physical address space.
The MSC register size is 0x2000: the Kaanapali platform implements the
MPAM registers up to offset 0x1FFF as permitted by the MPAM
specification when MPAMCFG_MBW_PBM is not implemented.

The nodes are disabled by default. Production firmware does not expose
MSC register access to the OS, so these nodes can only be enabled on a
local test setup where firmware permits direct MMIO access to the MSCs.
This DTS is therefore only an example for other platform DT authors and
is not intended to be merged.

Co-developed-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
Signed-off-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 52 +++++++++++++++++++++++++--------
 1 file changed, 40 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index e48a179d0722..10aee29a1ba8 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -49,12 +49,6 @@ cpu0: cpu@0 {
 			power-domains = <&cpu_pd0>, <&scmi_perf 0>;
 			power-domain-names = "psci", "perf";
 			#cooling-cells = <2>;
-
-			l2_0: l2-cache {
-				compatible = "cache";
-				cache-level = <2>;
-				cache-unified;
-			};
 		};
 
 		cpu1: cpu@100 {
@@ -121,12 +115,6 @@ cpu6: cpu@10000 {
 			power-domains = <&cpu_pd6>, <&scmi_perf 1>;
 			power-domain-names = "psci", "perf";
 			#cooling-cells = <2>;
-
-			l2_1: l2-cache {
-				compatible = "cache";
-				cache-level = <2>;
-				cache-unified;
-			};
 		};
 
 		cpu7: cpu@10100 {
@@ -532,6 +520,46 @@ soccp_smp2p_in: slave-kernel {
 		};
 	};
 
+	l2_0: cache@19870000 {
+		compatible = "qcom,kaanapali-l2-cache", "cache";
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
+			status = "disabled";
+		};
+
+	};
+
+	l2_1: cache@1a870000 {
+		compatible = "qcom,kaanapali-l2-cache", "cache";
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
+			status = "disabled";
+		};
+
+	};
+
 	soc: soc@0 {
 		compatible = "simple-bus";
 

-- 
2.34.1

