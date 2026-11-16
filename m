Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794809148;
	b=4Sa5dcb+Hmi3NWNZ380MCPveheTlYu5VzhHWmzd/281ju1oitOPknxC9wZNfLjuEr26K
	 KUqbD1u4zWTHM4ZD/ZqehbgL3icPLE9WtOIkif9cx6fKBKFKdiCAPCjZKxgG271QThGO/
	 B/y/IXhZZIqPVp4W3wlY9xzok1+MGYHhZ5hoFHLkDe5rpWWF02RepW+2Fdcb8FPB7DZ4y
	 X9CxcatSowVxzdaiCHIqEyxkwehO87/eBL7THSkT8y/zi/9WyrJMqNa9ldiCW7lB/oQNh
	 cOK73+GaHhXqzyJKKVPbIpkZijPSnimovq5FdEN3FhlAGkyuun8oUC6hXTlJlQB8EDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794809148;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=VxeJ0eYDI9bUsoMfqQL5T9DNJtEQCXilOCSddN1Abc8=;
	b=Nge7fBTiEU8biq9XWovAH5CcV+DbvfMB00i6AFrSBti05zK7Kf0yM9HOza0aR6iNK3tq
	 THPZQYrbUTmR5Y5RkSPkFWkcIQ9FYRIKTQEYWuSGp3XaJ0V+l4RiwAc3Wt+vYGBNWpDmR
	 nFc2Bu4AuZXl6mq6zEtW2V1p6ricMVZELrm7Y5N02lLm4p5SNv3IVSZPFu3UxmJuQNksQ
	 WiP3qYnPbwJvFHFSakTSNHDa0zU4vGsfPdkTAoHHIRMYEFDvlHgyHWo1v5myvPuWavxQM
	 1YO+/KpDTsCX9P+tzYWGMoTLD05MT4uY8w9MX54b3+UgdyHp0gHE3VtENzAVPTHLlfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b="1Nvzi/lE";
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=uHo99YUU;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E23606A337;
	Mon, 16 Nov 2026 06:05:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71E23606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=1Nvzi/lE;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=uHo99YUU
Date: Mon, 16 Nov 2026 06:05:41 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794809143;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VxeJ0eYDI9bUsoMfqQL5T9DNJtEQCXilOCSddN1Abc8=;
	b=1Nvzi/lEM5kYo3EWMjMX+lmd34akz8BowfYDq/5da0/R0NvErDdaa9EnEDnOksCjrqME5c
	E//ghT79mX4nHUgEWL0v1SopS/jNyXkKz4I8xrJLf+oHR6jFOiIsch1/TW382YYnmI9s0E
	5R8fVyKe+HIsCy7z9RxHHaxyX/itTYWzbmi51I9VSCZUn+/fA6RJE+jB5EW1jnabHCZEJN
	JuHVAnd+wUUPIXkOlvbKngzxBkhP4cnA97M8sfyMFWHCD5t8shH/WGNECUcWPHf5Wb3mFm
	JH5EC6DlHM5kSDwlAYUGW1g05ITb32SjOkUm/IkPxWjyXlmzwVZSYRtqGP/Bow==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794809143;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VxeJ0eYDI9bUsoMfqQL5T9DNJtEQCXilOCSddN1Abc8=;
	b=uHo99YUUTguN4/xUzxLPJIVXqivjtQ8GTp9VZTLi6UyoO6rud6fiWX+BcjxhSjzDmwcaA8
	8688CezDXICXzECw==
From: "tip-bot2 for Tony Luck" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: x86/urgent] x86/cpu: Add Intel Coral Rapids and Razor Lake CPU models
Cc: Tony Luck <tony.luck@intel.com>, "Borislav Petkov (AMD)" <bp@alien8.de>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261113174145.13513-1-tony.luck@intel.com>
References: <20261113174145.13513-1-tony.luck@intel.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179480914117.3191731.3872201224526558909.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/urgent branch of tip:

Commit-ID:     303c7c0e5ae5ac9685db11a4afaf5fa217a852db
Gitweb:        https://git.kernel.org/tip/303c7c0e5ae5ac9685db11a4afaf5fa217a=
852db
Author:        Tony Luck <tony.luck@intel.com>
AuthorDate:    Fri, 13 Nov 2026 09:41:45 -08:00
Committer:     Borislav Petkov (AMD) <bp@alien8.de>
CommitterDate: Sun, 15 Nov 2026 21:32:23 -08:00

x86/cpu: Add Intel Coral Rapids and Razor Lake CPU models

November 2026 "Intel Architecture Instruction Set Extensions and Future
Features" published the model numbers for the upcoming Coral Rapids server and
four Razor Lake (two desktops, two mobile).

Signed-off-by: Tony Luck <tony.luck@intel.com>
Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
Link: https://patch.msgid.link/20261113174145.13513-1-tony.luck@intel.com
---
 arch/x86/include/asm/intel-family.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/x86/include/asm/intel-family.h b/arch/x86/include/asm/intel=
-family.h
index 66d964a..2a5761d 100644
--- a/arch/x86/include/asm/intel-family.h
+++ b/arch/x86/include/asm/intel-family.h
@@ -129,6 +129,8 @@
=20
 #define INTEL_DIAMONDRAPIDS_X		IFM(19, 0x01) /* Panther Cove */
=20
+#define INTEL_CORALRAPIDS_X		IFM(19, 0x08)
+
 #define INTEL_BARTLETTLAKE		IFM(6, 0xD7) /* Raptor Cove */
=20
 /* "Hybrid" Processors (P-Core/E-Core) */
@@ -159,6 +161,11 @@
 #define INTEL_NOVALAKE			IFM(18, 0x01) /* Coyote Cove / Arctic Wolf */
 #define INTEL_NOVALAKE_L		IFM(18, 0x03) /* Coyote Cove / Arctic Wolf */
=20
+#define INTEL_RAZORLAKE			IFM(18, 0x06)
+#define INTEL_RAZORLAKE_L		IFM(18, 0x07)
+#define INTEL_RAZORLAKE_U		IFM(18, 0x09)
+#define INTEL_RAZORLAKE_S		IFM(18, 0x0A)
+
 /* "Small Core" Processors (Atom/E-Core) */
=20
 #define INTEL_ATOM_BONNELL		IFM(6, 0x1C) /* Diamondville, Pineview */
