Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793695338;
	b=1qzQpx9Vpfv6sNmWUf38AamWE1pVikAYhLMmOb9K1DoraK/HlG0sc1Ldzu9hnL3kGi7/
	 l/z5t2qNZjYutCe0NwOnEcUPCLPqyN2XWuJnPIvrv28cwyqd/RBTsCx5zF0RPPvHT8fNQ
	 IOnIKqvTptvn7hm+Gj9FjY6eMzvaxeU522EIi3px1npfbPzX2799P61YnpxcaHZKiYPst
	 SPMWhYhcWN+ERzgwfqxdoUmKp1KEeoqE35hFdBH6BotB+1zh82q1u++PQDNGsx+4sJMWq
	 N/vVPaMXfW8TCb44623fN6hXce+YJhm9XYCjvdsYCXeGGDN8A/mYNwXYlJM+jV/vssA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793695338;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=N7v5AcWY2ZN/+fvAV11vpesr+5u2uhrmRksKZXAExiU=;
	b=xvp7KsHTyzmDuM5Rv5J5cP0B+FxlLAT6/7Yh+IavAvrscJHJdVMf3RIok54qJ+e1g4Yz
	 YtNuTgNsd6Ge/FANC4wPRlABTAd2WxuxeFXtAij/Jn9A+nHvph1MXigqqvEchPWJI5Smt
	 ljsJyoxucLYwUO3DZcbFycrhf/+5+C4vQUCzVSz960LWcgMlm9Q98LW2k5J8Bmpe0pOy6
	 ZBtk8KkfvZmCY3HQyZt+fXwMyMhugGa8Bt0OMRm8GKTNGPtRYijvYqGR3fotG8e6FGEgQ
	 5lqtmvqig78m0Fhs2TLjr1XnPuryRh7QVvpsEdt2Q/9jrn12kCGxC3SFy0LhZUSzyRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=D8uhUPk8;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78386606B6DC
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 08:42:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78386606B6DC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=D8uhUPk8
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 6FE494E413D5
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 08:42:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4331D6046C;
	Tue,  3 Nov 2026 08:42:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 12CFB10328C5E;
	Tue,  3 Nov 2026 09:42:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793695333; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=N7v5AcWY2ZN/+fvAV11vpesr+5u2uhrmRksKZXAExiU=;
	b=D8uhUPk8e/mDWNQ+IHdNBipUhZAigKwtP86YXYMWiA53N+F4JJHnkKcappOXI1fJ5xcaf+
	FEMwoVfqygp9Km+2Ltw5kIv3KqUMlTnGUWoESOwBPR9GON1Tk3aE2Lf2Ff3Asw2xL2Ya0U
	PmPiuYVFgJg2kwHgGbsjn3mbVbSu+TXn6KIDvfpSFqvl+6/DnRQrbxV5pWaRpqk2glH4cg
	CjUSjSt5HqRUZm9z1OSqCFCkUCK54oiudhyv6cJfGwGS/9OoJX2mrwi1nF2lnlXyBrOAXy
	HKj/sjE9felgZshvjt32+z6ITKP9Ok+n1hs92qNYuCs3b+1T/AqhlHCSZCeSTQ==
From: Paul Cercueil <paul.cercueil@bootlin.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Paul Cercueil <paul.cercueil@bootlin.com>
Subject: [PATCH] arm64: Kconfig: add CONFIG_CMDLINE_EXTEND
Date: Tue,  3 Nov 2026 09:41:40 +0100
Message-ID: <20261103084140.7689-1-paul.cercueil@bootlin.com>
X-Mailer: git-send-email 2.47.3
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
X-Last-TLS-Session-Version: TLSv1.3

Other archs have it, and it is supported in arch-independent code, so I
see no reason why it is not provided on Aarch64. Add it there.

Signed-off-by: Paul Cercueil <paul.cercueil@bootlin.com>
---
 arch/arm64/Kconfig | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 1075bc661833..f8542e532b50 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -2551,6 +2551,12 @@ config CMDLINE_FROM_BOOTLOADER
 	  the boot loader doesn't provide any, the default kernel command
 	  string provided in CMDLINE will be used.
 
+config CMDLINE_EXTEND
+	bool "Extend bootloader kernel arguments"
+	help
+	  The command-line arguments provided by the boot loader will be
+	  appended to the default kernel command string.
+
 config CMDLINE_FORCE
 	bool "Always use the default kernel command string"
 	help
-- 
2.47.3

