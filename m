Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794774012;
	b=lcXUUPN2UJPyLtkqA4pOHnP84mwE0tzem5Rt9ZsJytbykF5gN4vI28ZjOdpGD7f0FQti
	 ynXDSWpvIIlw/I+hxJHJ808NUAYjoAlZF93lAcOfEpDG6oL7OckKp49xhhGVb6obJO9oc
	 YMP3ds4iiu5oWE5Uf2QUCNsdD+MWIb6kn7zCDkWwEW8kH1S7cy0hhu0luPF64ilWxdkbL
	 7CqohLb5lYVlZEUc0Er7GkK9mLwSkMqMy2tcBuz55HJSVIJmwypqWJwx9XyekgalW3mB8
	 Wu60XnNS2V94hxegTuhDJ0qLI8Zr6u00ZtG7FSe3PbHsRAYWfHgPCeXEuyxWe4pi05Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794774012;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=hdNaWmbURRJp8yfhKNYyRq9QQ+8FB+8DOOqzVpovC6E=;
	b=hwjHQp+uiNU9OkCTAM2koqEze3yZd6rSmuUHaoFV4rb7ibcALi44lF/h3WEAtwD5HDpj
	 YOF9mJOT6SSzrJBcxTLcLgHv4JW3Z8vtWKjUO30KRNsft/JhRLeRkGxdrXxWwadUXYZEy
	 BxoSXr6OpQK0VbhhRsQImpcvMbfdHLLXYfOdHohTGytZxQtRJLXjw6OX9L9ELUE1swe7F
	 Go8LvbTSam+sBjgEjn2diLFOMHZ2Yu3ReGQq4QeZU60TI4QJJghTm7ef9JJOqHCYzlSRF
	 LU5x3aIrmCNL3NgKDpYqErVhIBX8FLgSLofkLwHDUColJSWjx2F3PEHx/GRX4eI49fw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LePVJ0nc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64BCC606A890;
	Sun, 15 Nov 2026 20:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LePVJ0nc
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794774012;
	b=1eGNphOw6LKKF+OHxOKetwPTz4mW3gQGKurBhDR9qbxzwD9EHrLAgUALfGHMWuoxKDek
	 FQIU8fmm64J+hPersinSMhd73hgKjWaoXmlrdPtXJ3GMTPS8Xgo13RiMioqKlar3y/vgW
	 1mmqnXlkwnVahSEHkXm0aIPGl1vJidOfuMKuBFHeXRFw56wEzxRMshJlySXu4bBWIEPoN
	 /wJI8DuUxi44sT6g+95CkzLHxDTg9kB96hXQRmCrl//208+RRwxC135APo3ugi6lMb9yU
	 3sFkt8nCFnyWgB8EExjjXHmm5I/fY+ck87R7Bkf4haarwQQ+EMa6awv/bxh4rbXazGg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794774012;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=hdNaWmbURRJp8yfhKNYyRq9QQ+8FB+8DOOqzVpovC6E=;
	b=F7x/2FCiXpPBvCMjWHNbOv05c1brZGB1aj/Z5w9OFobbiIgslQUz0G1EukKAWmIgWd48
	 pq82gg0nlen2Jb1wIfTO5A1rk748tKOU5H/F2zGpffUpvn2PKVDZGyFbw2hXpUCwu2sNj
	 3Qmh4qducZlhqF4MWSGodsIdosNl3H8gQRN0LFKJ76YYSsCSVCy+JKTmG6UWxpSEYFBhc
	 e7GaEn51Jd0Zx4AN0SzGitIxoJ2fg8u2ZkYcn7TToYvylvvVPLNSpLq/Qleqrfu3HtQlJ
	 cZ2SIqdwYZds2QNcmKFYFaw5Bxvye6rAnmH4PG0FebtdajtyXH/NfZ16Jh4T9YV/c5A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 014281F000C8;
	Sun, 15 Nov 2026 20:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794774012;
	bh=hdNaWmbURRJp8yfhKNYyRq9QQ+8FB+8DOOqzVpovC6E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=LePVJ0ncL6miD4c6sPjxINH1jgfipVIjDOX6M2RHqNbqbeKU1Rtgi59LqHhhe1bNi
	 yM/msYvQKo69SKrHxr26bNQIZp+8mV11LMsFIraoIVZbz8nd3++xLqVthVAFdJaQ8W
	 6e87GIYCgSdHMTLINN8kVaSVPTlb1h8E/MdRPMF+6XZ/YDkp2IFFAneTK3KZ1xR7tn
	 8Y+DsDyoHvKrI7QGIv88pvdBzzFFQMhAX0FqwaLhTOtrWCMu1hWY5oEvT5SU2xLW/o
	 PC40OqpgIP/CMtTuB3rlfNaJRHPX1UVgwLzQZURboBBcgqTEkry9snnXF98im/9CY0
	 6YfARspcBuM8A==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 801E44A1B3;
	Sun, 15 Nov 2026 20:20:10 +0000 (UTC)
From: Venkat Yadlapati via B4 Relay <devnull+venkat.yadlapati.yahoo.com@kernel.org>
Date: Mon, 16 Nov 2026 01:50:12 +0530
Subject: [PATCH 04/11] soc: qcom: ubwc: Add config for Molokai
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
Message-Id: <20261116-molokai-soc-v1-4-3b2ee920fa3b@yahoo.com>
References: <20261116-molokai-soc-v1-0-3b2ee920fa3b@yahoo.com>
In-Reply-To: <20261116-molokai-soc-v1-0-3b2ee920fa3b@yahoo.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Venkat Yadlapati <venkat.yadlapati@yahoo.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794774008; l=1078;
 i=venkat.yadlapati@yahoo.com; s=20261023; h=from:subject:message-id;
 bh=yX+1lc6unxK9HOOigUIlbRZnsLaEz7jCrHywAksy48A=;
 b=twRZl46MFEAhuVYmXYgdYPnZGXHaXAj6X/9YNohzCLEapfvUIytGIHRECab6efADC/C8ls0W+
 jgEH+nXhKTXAkuLrfx8RbGZpVcJ5ZTMV62V+HhP+tRIy23PjylyVsiR
X-Developer-Key: i=venkat.yadlapati@yahoo.com; a=ed25519;
 pk=e8KStCtEMvUP1Se/riB/KVnDAQFEVR2Dw2PcuA8/eME=
X-Endpoint-Received: by B4 Relay for venkat.yadlapati@yahoo.com/20261023
 with auth_id=1303
X-Original-From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
Reply-To: venkat.yadlapati@yahoo.com
Content-Transfer-Encoding: 7bit

From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>

Molokai (SM8845) uses UBWC 6.0 with a highest bank bit of 16, like
Kaanapali. Without an entry, the display subsystem fails to probe on
Molokai based devices.

An LLM was used to help write this commit message.

Signed-off-by: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
---
 drivers/soc/qcom/ubwc_config.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index 456995699fdb..7c1166c68551 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -130,6 +130,7 @@ static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
 	{ .compatible = "qcom,mahua", .data = &glymur_data },
 	{ .compatible = "qcom,maili", .data = &ubwc_7_0_hbb16, },
 	{ .compatible = "qcom,milos", .data = &milos_data },
+	{ .compatible = "qcom,molokai", .data = &ubwc_6_0_hbb16 },
 	{ .compatible = "qcom,msm8226", .data = &no_ubwc_data },
 	{ .compatible = "qcom,msm8916", .data = &no_ubwc_data },
 	{ .compatible = "qcom,msm8917", .data = &no_ubwc_data },

-- 
2.56.0


