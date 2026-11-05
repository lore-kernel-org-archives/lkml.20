Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793885425;
	b=S85C0JTS851r4SvFh2GufES3OIA9c6g7es5IrFgzZu1h4YU8bkZKmg8CSuiKqT6IhJD5
	 lwOS/+QN1f7Mifk54g613w8N57A2snBqhnDNVT85m8vOWEECWx7KMthQyZB8IPE5eupRp
	 qQt4WvNbdYGETuxktRlFo+PGpgzVjPigvIQKN/cg3iLbw7OCKIviyMA12H29RMvqJibSO
	 fPK4dQr6LCpYFNblydLmPi2uc98rdrcTsCF3xtMszE/4NXMmXTlrhjqm2RmMmpQwzpaZT
	 p6m54I1sIgeHJbknK8e1XuH3mFC8P9GrmWw4fJCo+QyO0B1nlxB/ussZBGhf8QHyiNQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793885425;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=EcyyuR0oNuS0ypPsQzMr6pBx59QwCcD2o1XRxPsPTNU=;
	b=nn7E3yggSkG08A5R2RwFks6LebnMk4MZ3iYUNQrdh6zgzxXenqYoamcYwcyzMbg4SOaX
	 CRf93KubZLKf1owOPAOzMoGKtPlaljTcSjEi1jX0z5V4VACyQH3Ykof4rQz59O8P5cEGd
	 +1m9t4NvEFPhGMIXQtMczenaVWqjjfh4yhlAH6vkg9HKsgF3v2ZH593QeY8I3+FSs2BPp
	 BWV/Rs9qbLccJT3B1R5bjH+R6f5pa3OEHXY2IG95lVMIr9cMKgKDL0Abf08hAIAuiQzLS
	 AYy6iBYmOkRvSPO9pYEELkxq3mmJvo8Okd5yynp7lQppQEIQ7H10Dsg3H41aHjEQ+rA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HNUaiRUP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556B9606D807;
	Thu,  5 Nov 2026 13:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HNUaiRUP
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793885425;
	b=rjKQVybfd3nXGKfM0+MDTyxqbX2+DNj7AN8i1Lt2wDfYY0BIZuUwiLMfgE16AbjTw/Zc
	 R6cS7pg30MvSQReEDn6nAOinqJkpZN4pqJjlLNpUdxfZRrNaOhwvvszVDrW3g95xycrLx
	 VLK+YtEQxct+JekySv/taKyemvHXCDbfL2mo1zL+3+iPU8cr4Yd7qZavyTsfkF7ukA/Lx
	 rT7lfZXOPmTv43MH813rBYAAQxI9lUP5fnTpzc+c1UEGygTHzS1/oz6g5To9bR+Pkfzqn
	 Eph9EX93sQzYkf3B7JFWMK/0yr0I/n0ikH+G/scdb5RnPuuDemCStgDvnES0xajIM2g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793885425;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=EcyyuR0oNuS0ypPsQzMr6pBx59QwCcD2o1XRxPsPTNU=;
	b=0vikRpm/iKwLnV59DnV7BIwn2MZokAnUpncnzo4KWbL9Dw1ievUZAASI8aWID4kmwQg1
	 IB2YuYQ2qVxmkebla9CfgVHgxLAjQEAaplEp6a96NS/16ZQAYcZMjwKUgjJFEBLiFUk/H
	 7iLoKsMaIKTPJQesZvTHskqiiME1RrSbsr9Csp//tVDoMapYuHYYgKNk0fKFfNBUKRwpN
	 ID2D2W3vYVehdIr/tuyJ8vfzUOpC4TlNQ3f08/aRRrOv+fw1swzZSWXQysICo0SORvB/4
	 d2/407oeH+BObkCTWTNe7wMSSROqdh/BFLm21kWac7xadz0s8RTkEYAT8gsmDXS1pBQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4A0FE1F00A1A;
	Thu,  5 Nov 2026 13:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793885424;
	bh=EcyyuR0oNuS0ypPsQzMr6pBx59QwCcD2o1XRxPsPTNU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=HNUaiRUPzsf77DrFvNkTdZFO3tKAZmxTPPM+CLp+oKLeBikH3x3aMiPlTnEmAjnN+
	 N83nOsf9j0zvpl31WligT5jAYsYR7/JfBEn6Cc4yNH4o0npZdaBDahlrnOSb4E47jT
	 zoLNSspj+mBqoO04YLo9FAIiFIJEry0J84T8LtcWbtwBcZ/yIY6cHAp3W1+NP24fbA
	 9cLkSG/At1SSQPAKbETG07w8A9cE/MhURX46pqoTDYouFySSJJRw3sUQb6krgMrKd3
	 npGMnY/nhJyFtrndw2oHMLjI/pXlrgmSkVKTxwNdMAwjoe09HUz2jyThu1or/NPsh7
	 wdMO60UX6Q2AA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id B1C8647285;
	Thu,  5 Nov 2026 13:30:22 +0000 (UTC)
From: Demeter Barna via B4 Relay <devnull+me.fromdisposition.org@kernel.org>
Date: Thu, 05 Nov 2026 13:30:00 +0000
Subject: [PATCH 1/5] arm64: dts: qcom: sm8350: Vote the GPU memory
 bandwidth
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
Message-Id: <20261105-b4-sm8350-gpu-v1-1-a7175cdd6512@fromdisposition.org>
References: <20261105-b4-sm8350-gpu-v1-0-a7175cdd6512@fromdisposition.org>
In-Reply-To: <20261105-b4-sm8350-gpu-v1-0-a7175cdd6512@fromdisposition.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, Demeter Barna <me@fromdisposition.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793885419; l=2824;
 i=me@fromdisposition.org; s=20261012; h=from:subject:message-id;
 bh=Qj0SetyPXcoz/xqqaiV7q7+hqlgKFBJNuFzemnv6s4o=;
 b=5k1FzaWwPTWmD/1NkUbNJdAoQuLjitJ1m3kP377Dc4pqlngCKZdo6rf+qrYK5ez549PL8xZqB
 j7hWNqGEiH/CGMv0k47fj2wK//sUKL4PsdtlPd0qxAMIu6Uj+Uz7WZw
X-Developer-Key: i=me@fromdisposition.org; a=ed25519;
 pk=S0QFlGq1BQEaAtPPdAH8YKEOXMeRuSkTgctXuvtU+1Y=
X-Endpoint-Received: by B4 Relay for me@fromdisposition.org/20261012 with
 auth_id=1163
X-Original-From: Demeter Barna <me@fromdisposition.org>
Reply-To: me@fromdisposition.org
Content-Transfer-Encoding: 7bit

From: Demeter Barna <me@fromdisposition.org>

The SM8350 GPU never asks for DDR bandwidth. On A660 the GMU gets a DDR
table with only an "off" entry, so the driver leaves the vote to the OPP
core, and the OPP core votes only when the GPU has an interconnect path
and its OPPs carry a bandwidth. sm8350.dtsi has neither.

Add the GPU's path to DDR and give each OPP the peak bandwidth that
Qualcomm's GPU tables for this SoC vote at that frequency on LPDDR5, as
kodiak.dtsi does for its A635.

Signed-off-by: Demeter Barna <me@fromdisposition.org>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 55b32050c..903b2968c 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -2050,6 +2050,10 @@ gpu: gpu@3d00000 {
 
 			iommus = <&adreno_smmu 0 0x400>, <&adreno_smmu 1 0x400>;
 
+			interconnects = <&gem_noc MASTER_GFX3D QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "gfx-mem";
+
 			operating-points-v2 = <&gpu_opp_table>;
 
 			qcom,gmu = <&gmu>;
@@ -2068,51 +2072,61 @@ gpu_opp_table: opp-table {
 				opp-840000000 {
 					opp-hz = /bits/ 64 <840000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
+					opp-peak-kBps = <12484375>;
 				};
 
 				opp-778000000 {
 					opp-hz = /bits/ 64 <778000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
+					opp-peak-kBps = <12484375>;
 				};
 
 				opp-738000000 {
 					opp-hz = /bits/ 64 <738000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
+					opp-peak-kBps = <12484375>;
 				};
 
 				opp-676000000 {
 					opp-hz = /bits/ 64 <676000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
+					opp-peak-kBps = <10687500>;
 				};
 
 				opp-608000000 {
 					opp-hz = /bits/ 64 <608000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L2>;
+					opp-peak-kBps = <6074218>;
 				};
 
 				opp-540000000 {
 					opp-hz = /bits/ 64 <540000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
+					opp-peak-kBps = <6074218>;
 				};
 
 				opp-491000000 {
 					opp-hz = /bits/ 64 <491000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L0>;
+					opp-peak-kBps = <6074218>;
 				};
 
 				opp-443000000 {
 					opp-hz = /bits/ 64 <443000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
+					opp-peak-kBps = <6074218>;
 				};
 
 				opp-379000000 {
 					opp-hz = /bits/ 64 <379000000>;
 					opp-level = <80 /* RPMH_REGULATOR_LEVEL_LOW_SVS_L1 */>;
+					opp-peak-kBps = <3972656>;
 				};
 
 				opp-315000000 {
 					opp-hz = /bits/ 64 <315000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
+					opp-peak-kBps = <1761718>;
 				};
 			};
 		};

-- 
2.53.0


