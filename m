Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.106
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792840266;
	b=eg9hVansKB3LneT4OsL04m6KOeZtrvMG+XlcFApSDJdHoy0OLGBB7GJUnf9X9ERdT2bY
	 3N7KYrGR2mlQ8BF97QX2SfMWC1bQmqtkJh1bwPkQSBIOzGQEQjcBA14GyRpp0GTBvG7xU
	 i2BycO8jWbEp8gdAOIDbKa5VpwAOKrkxC2FR/UoiYQZkvIccNEeAE1ghdtKSX7gBsU/70
	 eaN+c+wspfVMSXO3yi6PUSOxaNuoBUymT87ipSw2i9BQ77KFtqqyNTh9ELuDAx/DgC1JG
	 GNeZh47MVT0azBVZs80rBUym9wmGjSpGRvn7OQRBqdGydPhSvwEUtgqGYMUww0W2ohg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792840266;
	h=DMARC-Filter:DKIM-Signature:X-Pm-Submission-Id:From:To:Cc:Date:
	 Subject:Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=MBSVu6VqrkcwAN9c9fjCu/wYUD7r+u9uk2V2ci9o1zY=;
	b=QzybN+LGuFhf87U6puG2maij3CWJ90dS2/VlwjYGt9UG5jAPiWZKCmR/V7uEzFdbpVWn
	 VioLHGZtkfyq2g76e8FV40GvqgHIgZkeRY1B9QIRAcJMgGc8Vdjp5wYkA44H5ND+IaW55
	 E8Z+uyPR/PCeLUWxD3LUvO1FAaTjthaGpoM5pItCW0EmXX+RmVC6YpuI27GFb+zpNdbtH
	 vXp27yya1GfJb1RRlOUSu+S1Av41Ou9MLcL9c6cLd6BtWif/MfOaXNWd8pHSLxVO4pbrI
	 tjaZUBkQu3vL91dY68jUeoe4QLx2A8rvNziuvah1CK23a+ViOylXHuKjC1GEF8G6pQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=michaelmcallister.org;
	spf=pass smtp.mailfrom=michaelmcallister.org;
	dkim=pass header.d=michaelmcallister.org header.i=@michaelmcallister.org header.a=rsa-sha256 header.s=protonmail2 header.b=TF7XveCq;
	arc=none smtp.remote-ip=109.224.244.106
Received: from mail-244106.protonmail.ch (mail-244106.protonmail.ch [109.224.244.106])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64BE4606A31D;
	Sat, 24 Oct 2026 11:11:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64BE4606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=michaelmcallister.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=michaelmcallister.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=michaelmcallister.org header.i=@michaelmcallister.org header.a=rsa-sha256 header.s=protonmail2 header.b=TF7XveCq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=michaelmcallister.org; s=protonmail2; t=1792840263; x=1793099463;
	bh=MBSVu6VqrkcwAN9c9fjCu/wYUD7r+u9uk2V2ci9o1zY=;
	h=From:To:Cc:Date:Subject:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=TF7XveCq634CG32Vp55G0uLS9UHpyCMBcGyynLocY7pgt7/slKpxJ0BZRAWxwMSET
	 g1/y9bZALUP8ispwrvWkXqRMT3aLRy9zr7O2cnn0m7+4UzPHN/kUsqvKWXFdgZl2jB
	 hxnwNA99lF8vsldmESZNyqdw1tah+J/rUF1WzxqPIdD3luTlblra/r9klZng+PthdZ
	 3PNZC35WQblM2ou9yzNjEDCTPkT4xWYTkk9AcHLqICU3fxEKHk7ALZMdlm7AMJk4t4
	 t5UtkOqvd70Vq0dRVJrK+8xwMz5m+cRcJDuykx3aKygoCwaEJwvbrR2+YfksSXNFY9
	 1HcrmtZH0+moA==
X-Pm-Submission-Id: 4jBcdK1cMPz1DFSp
From: Michael McAllister <me@michaelmcallister.org>
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Sat, 24 Oct 2026 12:10:08 +0100
Subject: [PATCH v2 1/3] arm64: dts: qcom: sm6115: Correct cluster idle state
 parameters
Message-ID: <b73aaefa59c2aa795af8e1c4ab117b0857b332b0.1792840208.git.me@michaelmcallister.org>
In-Reply-To: <cover.1792840208.git.me@michaelmcallister.org>
References: <cover.1792840208.git.me@michaelmcallister.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

The cluster state IDs encode unsupported CPU modes: the GDHS entries
request CPU mode 2 and the power-collapse entries request CPU mode 4.
The CPU power-collapse state is mode 3, as already used by the CPU
idle-state nodes. The GDHS entries also omit the cluster affinity level,
and cluster 1 requests cluster power collapse instead of GDHS.

The downstream Bengal power description [1] defines CPU power collapse
as mode 3, cluster GDHS as mode 2 and cluster power collapse as mode 4,
with cluster mode shifted by four bits. Its idle driver [2] combines
these with bit 30 for CPU reset and bits 25:24 for the affinity level.
For either cluster this yields 0x41000023 for GDHS and 0x41000043 for
power collapse. The Motorola SM4250 tree uses the same power description,
byte-for-byte, as the Xiaomi SM6115 release cited here.

Correct the shared states to match this interface. This replaces the
board-specific overrides used by the Motorola Moto G10. Runtime testing
is limited to that device; the downstream sources provide the common
SM6115/SM4250 encoding evidence.

[1]
https://github.com/MiCode/Xiaomi_Kernel_OpenSource/blob/02ca1a919564a9b176a79cce09c40977f833e9ac/arch/arm64/boot/dts/vendor/qcom/bengal-pm.dtsi
[2]
https://github.com/MiCode/Xiaomi_Kernel_OpenSource/blob/02ca1a919564a9b176a79cce09c40977f833e9ac/drivers/cpuidle/lpm-levels.c

Signed-off-by: Michael McAllister <me@michaelmcallister.org>
---
 arch/arm64/boot/dts/qcom/sm6115.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index 0f2af8aba..79ca73bfc 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -232,7 +232,7 @@ domain-idle-states {
 			cluster_0_sleep_0: cluster-sleep-0-0 {
 				/* GDHS */
 				compatible = "domain-idle-state";
-				arm,psci-suspend-param = <0x40000022>;
+				arm,psci-suspend-param = <0x41000023>;
 				entry-latency-us = <360>;
 				exit-latency-us = <421>;
 				min-residency-us = <782>;
@@ -241,7 +241,7 @@ cluster_0_sleep_0: cluster-sleep-0-0 {
 			cluster_0_sleep_1: cluster-sleep-0-1 {
 				/* Power Collapse */
 				compatible = "domain-idle-state";
-				arm,psci-suspend-param = <0x41000044>;
+				arm,psci-suspend-param = <0x41000043>;
 				entry-latency-us = <800>;
 				exit-latency-us = <2118>;
 				min-residency-us = <7376>;
@@ -250,7 +250,7 @@ cluster_0_sleep_1: cluster-sleep-0-1 {
 			cluster_1_sleep_0: cluster-sleep-1-0 {
 				/* GDHS */
 				compatible = "domain-idle-state";
-				arm,psci-suspend-param = <0x40000042>;
+				arm,psci-suspend-param = <0x41000023>;
 				entry-latency-us = <314>;
 				exit-latency-us = <345>;
 				min-residency-us = <660>;
@@ -259,7 +259,7 @@ cluster_1_sleep_0: cluster-sleep-1-0 {
 			cluster_1_sleep_1: cluster-sleep-1-1 {
 				/* Power Collapse */
 				compatible = "domain-idle-state";
-				arm,psci-suspend-param = <0x41000044>;
+				arm,psci-suspend-param = <0x41000043>;
 				entry-latency-us = <640>;
 				exit-latency-us = <1654>;
 				min-residency-us = <8094>;
