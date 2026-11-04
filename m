Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793821319;
	b=wrVlxGpaCDYACLwSJe4DPcBqO5yzoemmXjwi7SZFX5H+qmfkCHQLA8kFSf5c/Ook7JwA
	 YCimuHH5hfGmpzuFgb44dhfTaypEqFy/Ntmzqcu42ItKXQW8Hs+ycBK934yHI658U3Vin
	 ey8Wrbu8lo29LIAVM+94A9bK3XFqkIlblineNVm3NPpZjsy9V7Y8GZ4VhBygrgMTPLy/1
	 8S1rgcyX3duUYfLK8uWl6oNlQjhHGkcau8trPXC+NDq8f57ZxHxa8ePnizMCj8aWskw/M
	 16jFTkG9W/RamV3Sb5Eg5/naHvbyZ/B7bfZkMg9/MvkaG2t6wyoFzqqnoIZq9vLNKng==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793821319;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=mn73q59EM+BJ2ti/SudTswgpeveLwKIZklr1bz0fNyw=;
	b=yUq6FzRU0FSqrGi5GaMlmAUlvrUDHL7QbbLchSEhdVqZZECw2ed7XLHY/FhNr06FWHQH
	 ezcaQ18mPA0QeL5JjDz5BmonZgWhRxX1OSdMO0yUw4LqMrpqPUsMx0PjiSBvjEbQn2D+k
	 hKju8+vlu7Ve0y3Icqr9FPqu7cW+59dyl/zB3Wha7bRQMZplcrrssRPkRoxkm2mKZy3Vk
	 PF8jXt2/9mnT5JvriMF02uX0MerHx5vQXhKMzxdUEJlrMvlcJ0q3cE6p1FwF7VbJxeME+
	 OuM6gnLpliQFp90MiG2z0g5Ockfl9p7fdNnSIzlTQboOCOnLWjNUulpbNN+OzAAEAqg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m2hioRLz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 614AB6072665;
	Wed,  4 Nov 2026 19:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m2hioRLz
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793821319;
	b=Jb2Jnq6VqHcdYu3LKmwd9+fYKx8ZfNtpgCWxvXKjfWhmampFnCShp7cu6RnAIOnPb8rU
	 eKXHVEbcqIaqRvfQuHd2RomwMkkLMHlJ4ZFctn9+6jLUPNKFuh+HUdVqAN5yxlraNKzv/
	 BDAP/SPw1ZiB0NFUX0vDxZwk3eBWVsB+qDL74ozgOyH0bbpPcbnbCBWmTYvzlOOOcnWqN
	 S5iTAvb+LVLHkCFD9Rt4VkgEYyejfZR3oL7bWpaR5q7DDWBfhKcopaslhUoCsuGctlT7Q
	 xdkGeJ5SRkai6QvpYHQt4eek/T1AimHQWDnotHNh6oEQx5BpfvDWn9vw44OHFFxeKhw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793821319;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=mn73q59EM+BJ2ti/SudTswgpeveLwKIZklr1bz0fNyw=;
	b=sxULh7MH7FBnJ74fOzuo151IQOBwdOgOUd6XUz48YvMgKVPg3rpEza9npPkLKZqccaKs
	 v6lLAVirawv8vlDKky96pKnV/rRcq7ZABLAlX8TPOq8T7MSC711YIXS2ar7VPfnqFmHk+
	 oil+vW+hCkUEa+J5gXuE0sr5k3+Rp5zzdu1X7WshQa0+gfrePY79YWcZD7UCOBjJoNyyP
	 hxtKANjH0G3NBblJj7bAjzdDLtAFyU+r+nFFfr3UlyvLNs/4/JFstpa51bWvRZzgfWv74
	 r0RdoFpfQ+Oz7X/jy/OLfJ9UFalACY7io4Eqnrau5aI0JhunWukIQbVTmzmgxODJl7w==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B757C1F000C1;
	Wed,  4 Nov 2026 19:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793821319;
	bh=mn73q59EM+BJ2ti/SudTswgpeveLwKIZklr1bz0fNyw=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=m2hioRLzLrOTclxx+tL+VYRZ4wFsUdVcr02eqleZ/FZqGhhnl6CLSpPgm85cWkLf3
	 PuZym6TS1uW/2ZF7GTTuG3V5EXHVddqy5hF7fmkEeleXRZ49yi3XbdUHwopWqDd77Z
	 5jjwOw/1jSO3S6MWnjprix1/2w/VcLdhRSPgnljbKK6n9VFKA0wgxES1vanXd2vP3Q
	 FNlP8l2/XFvoxAK5gBdjTo5Q3mmaS6QrET1em4vZTBg63wKCi3rKVPRu+9YZBAh2YC
	 tisEVIpIsX/thD63N63jtFJFZiTB+39OmNE2zxDrZQLVMsct2ztAfpoY8GpDRin0W/
	 lSrl6TjYQK/eg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 1382646F6B;
	Wed,  4 Nov 2026 19:41:58 +0000 (UTC)
From: Nizat Mikayilli via B4 Relay <devnull+nacht.dxdmail.cc@kernel.org>
Date: Wed, 04 Nov 2026 20:41:49 +0100
Subject: [PATCH] arm64: dts: qcom: sm8550: Add missing CPU7 3.36GHz OPP
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
Message-Id: <20261104-sm8550-prime-3p36ghz-v1-1-c72630265379@dxdmail.cc>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MTQqAIBBA4avIrBsY7cfoKtEibKpZaKIQUXT3p
 OW3eO+BzEk4w6AeSHxKliMU6EqB2+ewMcpSDIZMpzU1mH3ftoQxiWesY91t+43WsmOryTlaoKQ
 x8SrXvx2n9/0A62+GLWYAAAA=
X-Change-ID: 20261104-sm8550-prime-3p36ghz-77ece710cc0d
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Aaron Kling <webgeek1234@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Nizat Mikayilli <nacht@dxdmail.cc>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793821317; l=1185;
 i=nacht@dxdmail.cc; s=20261004; h=from:subject:message-id;
 bh=qRT6IO1l358AuB03TLo/hQmXkRKy7jq10Y/5pck5sP0=;
 b=fd2Az2+Ro8NXmE0zpXmgAs+pC5T86WS/IBSuxIky2uQcQwEPzUZn85dQzT3DIEaqQQZ9X5TRB
 5i6gJL9v80jD1utEPeqkJ9OQN5kH+g1R9hhISmveR0sl47PGfbU0coa
X-Developer-Key: i=nacht@dxdmail.cc; a=ed25519;
 pk=Kay3P3pOJq5klUD+0/I8QX8JGOh0CeQXEwRVv7CMm4k=
X-Endpoint-Received: by B4 Relay for nacht@dxdmail.cc/20261004 with
 auth_id=1111
X-Original-From: Nizat Mikayilli <nacht@dxdmail.cc>
Reply-To: nacht@dxdmail.cc
Content-Transfer-Encoding: 7bit

From: Nizat Mikayilli <nacht@dxdmail.cc>

The cpufreq LUT on the Samsung Galaxy Tab S9 Wi-Fi has a 3.36GHz boost
entry for CPU7 without a matching OPP, so the frequency is dropped:

cpu cpu7: Voltage update failed freq=3360000
cpu cpu7: failed to update OPP for freq=3360000

Fixes: 3f5dcc05cd33 ("arm64: dts: qcom: sm8550: add cpu OPP table with DDR, LLCC & L3 bandwidths")
Signed-off-by: Nizat Mikayilli <nacht@dxdmail.cc>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 03f6d40edea7..ed6e34ac8d56 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -752,6 +752,11 @@ opp-3187200000 {
 			opp-hz = /bits/ 64 <3187200000>;
 			opp-peak-kBps = <(933000 * 16) (3686000 * 4) (1689600 * 32)>;
 		};
+
+		opp-3360000000 {
+			opp-hz = /bits/ 64 <3360000000>;
+			opp-peak-kBps = <(933000 * 16) (3686000 * 4) (1689600 * 32)>;
+		};
 	};
 
 	pmu-a510 {

---
base-commit: f5672a3dff0291d6a45eb0c258b9d2baeb4dc577
change-id: 20261104-sm8550-prime-3p36ghz-77ece710cc0d

Best regards,
-- 
Nizat Mikayilli <nacht@dxdmail.cc>


