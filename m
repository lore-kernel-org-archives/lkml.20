Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B52F4EBAC5;
	Mon, 28 Sep 2026 22:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790635230; cv=none; b=fXmD0oa70xoeTEvwAHqtkUl7QGlgmao3EqDdZ9xHHXz62QsUNgUqMcmeWjxuZPrVEKUkvMyTBAc5LsW50pmQ7f3gOPirpngE7ZdwghZP8ZjdL4gr8NmRv0GwqdS43LlvacdSBiOEFv1KJmADVMX3K2iEUS6naU8E/SOXLYhgrC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790635230; c=relaxed/simple;
	bh=yPxe9hct8K62q1bzNyvJNguQRHhxCupzKlkrE62rXZk=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=rU0eU51jnS5n4Dppx0x2JHYKJMq+adqpLSNOusqLfugiLJiPMDSgp2KIs18B5O1h/BGV8k6BXdZkOcEZuodxVmt3Thp8TpDv/jEMSd5Chz74fas8DAG4/qQOgDEQdzVB8uP56CjAv6oyrcpmhE+0MSvqWAZPzSB6njeJfGb5i+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=HCNRli3U; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ZFeTK3n3; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="HCNRli3U";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ZFeTK3n3"
Date: Mon, 28 Sep 2026 22:40:23 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790635225;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Xy3Yn+Qqf42dI/SOrRxzOSD+6jOHR2X2unPbbkoKJEk=;
	b=HCNRli3Ux0lRGQA4OaOwKQ9vI4qXYZ7ao8DYP53MvvEyM0R5/VPggi88eE82qv7yq9km1h
	E+BPnKXiCzH8pc5BVtfH9aZD6Ow3XBaqlkfYdYO6aR2rzjbpDw0806jFFxT51ORDaXGxmt
	qwDqeJ0VhCLpNa2uUO7BKZIKyOniadyCPAKGbaoYp5zgrU9T5v3Qye3SN6V0hWSl0pGCtZ
	eFaDY15fXOO79CUWDcqGbnYcuPxazkxVi2Y8rzU9G1yibIJFYJI0NCi2QlW+npfv6ijwvm
	KVzJHMl0eJ/GO/gmBccUpXHcdLdnL0dj44mXMs4KEA2izYcQWM7IoCeaTIX4cw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790635225;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Xy3Yn+Qqf42dI/SOrRxzOSD+6jOHR2X2unPbbkoKJEk=;
	b=ZFeTK3n38Zu1iGYl628zVyPzdQdAnQ1ES62CUKTcjnLEWGMKTAICWRt4nI4e6JvH9aF2ye
	wOXh1D2RiOJfVYDQ==
From: "tip-bot2 for Sohil Mehta" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: x86/microcode] x86/microcode/intel: Refresh old_microcode
 defines with the May 2026 release
Cc: Sohil Mehta <sohil.mehta@intel.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260928222607.3593973-1-sohil.mehta@intel.com>
References: <20260928222607.3593973-1-sohil.mehta@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179063522314.3910103.12682589397664971608.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/microcode branch of tip:

Commit-ID:     cf086537af4e3b04f6012dae3766a51ed1afc61c
Gitweb:        https://git.kernel.org/tip/cf086537af4e3b04f6012dae3766a51ed1a=
fc61c
Author:        Sohil Mehta <sohil.mehta@intel.com>
AuthorDate:    Mon, 28 Sep 2026 15:26:07 -07:00
Committer:     Dave Hansen <dave.hansen@linux.intel.com>
CommitterDate: Mon, 28 Sep 2026 15:39:05 -07:00

x86/microcode/intel: Refresh old_microcode defines with the May 2026 release

Update the minimum expected revisions of Intel microcode based on the
microcode-20260512 (May 2026) release.

Note, the three new entries are for INTEL_PANTHERLAKE_L steppings.

Signed-off-by: Sohil Mehta <sohil.mehta@intel.com>
Signed-off-by: Dave Hansen <dave.hansen@linux.intel.com>
Link: https://patch.msgid.link/20260928222607.3593973-1-sohil.mehta@intel.com
---
 arch/x86/kernel/cpu/microcode/intel-ucode-defs.h | 91 +++++++--------
 1 file changed, 47 insertions(+), 44 deletions(-)

diff --git a/arch/x86/kernel/cpu/microcode/intel-ucode-defs.h b/arch/x86/kern=
el/cpu/microcode/intel-ucode-defs.h
index af8b1d8..7f463c8 100644
--- a/arch/x86/kernel/cpu/microcode/intel-ucode-defs.h
+++ b/arch/x86/kernel/cpu/microcode/intel-ucode-defs.h
@@ -136,35 +136,35 @@
 { .flags =3D X86_CPU_ID_FLAG_ENTRY_VALID, .vendor =3D X86_VENDOR_INTEL, .fam=
ily =3D 0x6, .model =3D 0x5f, .steppings =3D 0x0002, .platform_mask =3D 0x01,=
 .driver_data =3D 0x3e },
 { .flags =3D X86_CPU_ID_FLAG_ENTRY_VALID, .vendor =3D X86_VENDOR_INTEL, .fam=
ily =3D 0x6, .model =3D 0x66, .steppings =3D 0x0008, .platform_mask =3D 0x80,=
 .driver_data =3D 0x2a },
 { .flags =3D X86_CPU_ID_FLAG_ENTRY_VALID, .vendor =3D X86_VENDOR_INTEL, .fam=
ily =3D 0x6, .model =3D 0x6a, .steppings =3D 0x0020, .platform_mask =3D 0x87,=
 .driver_data =3D 0xc0002f0 },
-{ .flags =3D X86_CPU_ID_FLAG_ENTRY_VALID, .vendor =3D X86_VENDOR_INTEL, .fam=
ily =3D 0x6, .model =3D 0x6a, .steppings =3D 0x0040, .platform_mask =3D 0x87,=
 .driver_data =3D 0xd000410 },
-{ .flags =3D X86_CPU_ID_FLAG_ENTRY_VALID, .vendor =3D X86_VENDOR_INTEL, .fam=
ily =3D 0x6, .model =3D 0x6c, .steppings =3D 0x0002, .platform_mask =3D 0x10,=
 .driver_data =3D 0x10002e0 },
+{ .flags =3D X86_CPU_ID_FLAG_ENTRY_VALID, .vendor =3D X86_VENDOR_INTEL, .fam=
ily =3D 0x6, .model =3D 0x6a, .steppings =3D 0x0040, .platform_mask =3D 0x87,=
 .driver_data =3D 0xd000421 },
+{ .flags =3D X86_CPU_ID_FLAG_ENTRY_VALID, .vendor =3D X86_VENDOR_INTEL, .fam=
ily =3D 0x6, .model =3D 0x6c, .steppings =3D 0x0002, .platform_mask =3D 0x10,=
 .driver_data =3D 0x10002f1 },
 { .flags =3D X86_CPU_ID_FLAG_ENTRY_VALID, .vendor =3D X86_VENDOR_INTEL, .fam=
ily =3D 0x6, .model =3D 0x7a, .steppings =3D 0x0002, .platform_mask =3D 0x01,=
 .driver_data =3D 0x42 },
 { .flags =3D X86_CPU_ID_FLAG_ENTRY_VALID, .vendor =3D X86_VENDOR_INTEL, .fam=
ily =3D 0x6, .model =3D 0x7a, .steppings =3D 0x0100, .platform_mask =3D 0x01,=
 .driver_data =3D 0x26 },
-{ .flags =3D X86_CPU_ID_FLAG_ENTRY_VALID, .vendor =3D X86_VENDOR_INTEL, .fam=
ily =3D 0x6, .model =3D 0x7e, .steppings =3D 0x0020, .platform_mask =3D 0x80,=
 .driver_data =3D 0xca },
+{ .flags =3D X86_CPU_ID_FLAG_ENTRY_VALID, .vendor =3D X86_VENDOR_INTEL, .fam=
ily =3D 0x6, .model =3D 0x7e, .steppings =3D 0x0020, .platform_mask =3D 0x80,=
 .driver_data =3D 0xcc },
 { .flags =3D X86_CPU_ID_FLAG_ENTRY_VALID, .vendor =3D X86_VENDOR_INTEL, .fam=
ily =3D 0x6, .model =3D 0x8a, .steppings =3D 0x0002, .platform_mask =3D 0x10,=
 .driver_data =3D 0x33 },
-{ .flags =3D X86_CPU_ID_FLAG_ENTRY_VALID, .vendor =3D X86_VENDOR_INTEL, .fam=
ily =3D 0x6, .model =3D 0x8c, .steppings =3D 0x0002, .platform_mask =3D 0x80,=
 .driver_data =3D 0xbc },
-{ .flags =3D X86_CPU_ID_FLAG_ENTRY_VALID, .vendor =3D X86_VENDOR_INTEL, .fam=
ily =3D 0x6, .model =3D 0x8c, .steppings =3D 0x0004, .platform_mask =3D 0xc2,=
 .driver_data =3D 0x3c },
-{ .flags =3D X86_CPU_ID_FLAG_ENTRY_VALID, .vendor =3D X86_VENDOR_INTEL, .fam=
ily =3D 0x6, .model =3D 0x8d, .steppings =3D 0x0002, .platform_mask =3D 0xc2,=
 .driver_data =3D 0x56 },
+{ .flags =3D X86_CPU_ID_FLAG_ENTRY_VALID, .vendor =3D X86_VENDOR_INTEL, .fam=
ily =3D 0x6, .model =3D 0x8c, .steppings =3D 0x0002, .platform_mask =3D 0x80,=
 .driver_data =3D 0xbe },
+{ .flags =3D X86_CPU_ID_FLAG_ENTRY_VALID, .vendor =3D X86_VENDOR_INTEL, .fam=
ily =3D 0x6, .model =3D 0x8c, .steppings =3D 0x0004, .platform_mask =3D 0xc2,=
 .driver_data =3D 0x3e },
+{ .flags =3D X86_CPU_ID_FLAG_ENTRY_VALID, .vendor =3D X86_VENDOR_INTEL, .fam=
ily =3D 0x6, .model =3D 0x8d, .steppings =3D 0x0002, .platform_mask =3D 0xc2,=
 .driver_data =3D 0x58 },
 { .flags =3D X86_CPU_ID_FLAG_ENTRY_VALID, .vendor =3D X86_VENDOR_INTEL, .fam=
ily =3D 0x6, .model =3D 0x8e, .steppings =3D 0x0200, .platform_mask =3D 0x10,=
 .driver_data =3D 0xf6 },
 { .flags =3D X86_CPU_ID_FLAG_ENTRY_VALID, .vendor =3D X86_VENDOR_INTEL, .fam=
ily =3D 0x6, .model =3D 0x8e, .steppings =3D 0x0200, .platform_mask =3D 0xc0,=
 .driver_data =3D 0xf6 },
 { .flags =3D X86_CPU_ID_FLAG_ENTRY_VALID, .vendor =3D X86_VENDOR_INTEL, .fam=
ily =3D 0x6, .model =3D 0x8e, .steppings =3D 0x0400, .platform_mask =3D 0xc0,=
 .driver_data =3D 0xf6 },
 { .flags =3D X86_CPU_ID_FLAG_ENTRY_VALID, .vendor =3D X86_VENDOR_INTEL, .fam=
ily =3D 0x6, .model =3D 0x8e, .steppings =3D 0x0800, .platform_mask =3D 0xd0,=
 .driver_data =3D 0xf6 },
 { .flags =3D X86_CPU_ID_FLAG_ENTRY_VALID, .vendor =3D X86_VENDOR_INTEL, .fam=
ily =3D 0x6, .model =3D 0x8e, .steppings =3D 0x1000, .platform_mask =3D 0x94,=
 .driver_data =3D 0x100 },
-{ .flags =3D X86_CPU_ID_FLAG_ENTRY_VALID, .vendor =3D X86_VENDOR_INTEL, .fam=
ily =3D 0x6, .model =3D 0x8f, .steppings =3D 0x0010, .platform_mask =3D 0x10,=
 .driver_data =3D 0x2c000410 },
-{ .flags =3D X86_CPU_ID_FLAG_ENTRY_VALID, .vendor =3D X86_VENDOR_INTEL, .fam=
ily =3D 0x6, .model =3D 0x8f, .steppings =3D 0x0010, .platform_mask =3D 0x87,=
 .driver_data =3D 0x2b000650 },
-{ .flags =3D X86_CPU_ID_FLAG_ENTRY_VALID, .vendor =3D X86_VENDOR_INTEL, .fam=
ily =3D 0x6, .model =3D 0x8f, .steppings =3D 0x0020, .platform_mask =3D 0x10,=
 .driver_data =3D 0x2c000410 },
-{ .flags =3D X86_CPU_ID_FLAG_ENTRY_VALID, .vendor =3D X86_VENDOR_INTEL, .fam=
ily =3D 0x6, .model =3D 0x8f, .steppings =3D 0x0020, .platform_mask =3D 0x87,=
 .driver_data =3D 0x2b000650 },
-{ .flags =3D X86_CPU_ID_FLAG_ENTRY_VALID, .vendor =3D X86_VENDOR_INTEL, .fam=
ily =3D 0x6, .model =3D 0x8f, .steppings =3D 0x0040, .platform_mask =3D 0x10,=
 .driver_data =3D 0x2c000410 },
-{ .flags =3D X86_CPU_ID_FLAG_ENTRY_VALID, .vendor =3D X86_VENDOR_INTEL, .fam=
ily =3D 0x6, .model =3D 0x8f, .steppings =3D 0x0040, .platform_mask =3D 0x87,=
 .driver_data =3D 0x2b000650 },
-{ .flags =3D X86_CPU_ID_FLAG_ENTRY_VALID, .vendor =3D X86_VENDOR_INTEL, .fam=
ily =3D 0x6, .model =3D 0x8f, .steppings =3D 0x0080, .platform_mask =3D 0x87,=
 .driver_data =3D 0x2b000650 },
-{ .flags =3D X86_CPU_ID_FLAG_ENTRY_VALID, .vendor =3D X86_VENDOR_INTEL, .fam=
ily =3D 0x6, .model =3D 0x8f, .steppings =3D 0x0100, .platform_mask =3D 0x10,=
 .driver_data =3D 0x2c000410 },
-{ .flags =3D X86_CPU_ID_FLAG_ENTRY_VALID, .vendor =3D X86_VENDOR_INTEL, .fam=
ily =3D 0x6, .model =3D 0x8f, .steppings =3D 0x0100, .platform_mask =3D 0x87,=
 .driver_data =3D 0x2b000650 },
+{ .flags =3D X86_CPU_ID_FLAG_ENTRY_VALID, .vendor =3D X86_VENDOR_INTEL, .fam=
ily =3D 0x6, .model =3D 0x8f, .steppings =3D 0x0010, .platform_mask =3D 0x10,=
 .driver_data =3D 0x2c000421 },
+{ .flags =3D X86_CPU_ID_FLAG_ENTRY_VALID, .vendor =3D X86_VENDOR_INTEL, .fam=
ily =3D 0x6, .model =3D 0x8f, .steppings =3D 0x0010, .platform_mask =3D 0x87,=
 .driver_data =3D 0x2b000670 },
+{ .flags =3D X86_CPU_ID_FLAG_ENTRY_VALID, .vendor =3D X86_VENDOR_INTEL, .fam=
ily =3D 0x6, .model =3D 0x8f, .steppings =3D 0x0020, .platform_mask =3D 0x10,=
 .driver_data =3D 0x2c000421 },
+{ .flags =3D X86_CPU_ID_FLAG_ENTRY_VALID, .vendor =3D X86_VENDOR_INTEL, .fam=
ily =3D 0x6, .model =3D 0x8f, .steppings =3D 0x0020, .platform_mask =3D 0x87,=
 .driver_data =3D 0x2b000670 },
+{ .flags =3D X86_CPU_ID_FLAG_ENTRY_VALID, .vendor =3D X86_VENDOR_INTEL, .fam=
ily =3D 0x6, .model =3D 0x8f, .steppings =3D 0x0040, .platform_mask =3D 0x10,=
 .driver_data =3D 0x2c000421 },
+{ .flags =3D X86_CPU_ID_FLAG_ENTRY_VALID, .vendor =3D X86_VENDOR_INTEL, .fam=
ily =3D 0x6, .model =3D 0x8f, .steppings =3D 0x0040, .platform_mask =3D 0x87,=
 .driver_data =3D 0x2b000670 },
+{ .flags =3D X86_CPU_ID_FLAG_ENTRY_VALID, .vendor =3D X86_VENDOR_INTEL, .fam=
ily =3D 0x6, .model =3D 0x8f, .steppings =3D 0x0080, .platform_mask =3D 0x87,=
 .driver_data =3D 0x2b000670 },
+{ .flags =3D X86_CPU_ID_FLAG_ENTRY_VALID, .vendor =3D X86_VENDOR_INTEL, .fam=
ily =3D 0x6, .model =3D 0x8f, .steppings =3D 0x0100, .platform_mask =3D 0x10,=
 .driver_data =3D 0x2c000421 },
+{ .flags =3D X86_CPU_ID_FLAG_ENTRY_VALID, .vendor =3D X86_VENDOR_INTEL, .fam=
ily =3D 0x6, .model =3D 0x8f, .steppings =3D 0x0100, .platform_mask =3D 0x87,=
 .driver_data =3D 0x2b000670 },
 { .flags =3D X86_CPU_ID_FLAG_ENTRY_VALID, .vendor =3D X86_VENDOR_INTEL, .fam=
ily =3D 0x6, .model =3D 0x96, .steppings =3D 0x0002, .platform_mask =3D 0x01,=
 .driver_data =3D 0x1a },
-{ .flags =3D X86_CPU_ID_FLAG_ENTRY_VALID, .vendor =3D X86_VENDOR_INTEL, .fam=
ily =3D 0x6, .model =3D 0x97, .steppings =3D 0x0004, .platform_mask =3D 0x07,=
 .driver_data =3D 0x3d },
-{ .flags =3D X86_CPU_ID_FLAG_ENTRY_VALID, .vendor =3D X86_VENDOR_INTEL, .fam=
ily =3D 0x6, .model =3D 0x97, .steppings =3D 0x0020, .platform_mask =3D 0x07,=
 .driver_data =3D 0x3d },
-{ .flags =3D X86_CPU_ID_FLAG_ENTRY_VALID, .vendor =3D X86_VENDOR_INTEL, .fam=
ily =3D 0x6, .model =3D 0x9a, .steppings =3D 0x0008, .platform_mask =3D 0x80,=
 .driver_data =3D 0x43a },
-{ .flags =3D X86_CPU_ID_FLAG_ENTRY_VALID, .vendor =3D X86_VENDOR_INTEL, .fam=
ily =3D 0x6, .model =3D 0x9a, .steppings =3D 0x0010, .platform_mask =3D 0x40,=
 .driver_data =3D 0xb },
-{ .flags =3D X86_CPU_ID_FLAG_ENTRY_VALID, .vendor =3D X86_VENDOR_INTEL, .fam=
ily =3D 0x6, .model =3D 0x9a, .steppings =3D 0x0010, .platform_mask =3D 0x80,=
 .driver_data =3D 0x43a },
+{ .flags =3D X86_CPU_ID_FLAG_ENTRY_VALID, .vendor =3D X86_VENDOR_INTEL, .fam=
ily =3D 0x6, .model =3D 0x97, .steppings =3D 0x0004, .platform_mask =3D 0x07,=
 .driver_data =3D 0x3e },
+{ .flags =3D X86_CPU_ID_FLAG_ENTRY_VALID, .vendor =3D X86_VENDOR_INTEL, .fam=
ily =3D 0x6, .model =3D 0x97, .steppings =3D 0x0020, .platform_mask =3D 0x07,=
 .driver_data =3D 0x3e },
+{ .flags =3D X86_CPU_ID_FLAG_ENTRY_VALID, .vendor =3D X86_VENDOR_INTEL, .fam=
ily =3D 0x6, .model =3D 0x9a, .steppings =3D 0x0008, .platform_mask =3D 0x80,=
 .driver_data =3D 0x43b },
+{ .flags =3D X86_CPU_ID_FLAG_ENTRY_VALID, .vendor =3D X86_VENDOR_INTEL, .fam=
ily =3D 0x6, .model =3D 0x9a, .steppings =3D 0x0010, .platform_mask =3D 0x40,=
 .driver_data =3D 0xc },
+{ .flags =3D X86_CPU_ID_FLAG_ENTRY_VALID, .vendor =3D X86_VENDOR_INTEL, .fam=
ily =3D 0x6, .model =3D 0x9a, .steppings =3D 0x0010, .platform_mask =3D 0x80,=
 .driver_data =3D 0x43b },
 { .flags =3D X86_CPU_ID_FLAG_ENTRY_VALID, .vendor =3D X86_VENDOR_INTEL, .fam=
ily =3D 0x6, .model =3D 0x9c, .steppings =3D 0x0001, .platform_mask =3D 0x01,=
 .driver_data =3D 0x24000026 },
 { .flags =3D X86_CPU_ID_FLAG_ENTRY_VALID, .vendor =3D X86_VENDOR_INTEL, .fam=
ily =3D 0x6, .model =3D 0x9e, .steppings =3D 0x0200, .platform_mask =3D 0x2a,=
 .driver_data =3D 0xf8 },
 { .flags =3D X86_CPU_ID_FLAG_ENTRY_VALID, .vendor =3D X86_VENDOR_INTEL, .fam=
ily =3D 0x6, .model =3D 0x9e, .steppings =3D 0x0400, .platform_mask =3D 0x22,=
 .driver_data =3D 0xfa },
@@ -176,30 +176,33 @@
 { .flags =3D X86_CPU_ID_FLAG_ENTRY_VALID, .vendor =3D X86_VENDOR_INTEL, .fam=
ily =3D 0x6, .model =3D 0xa5, .steppings =3D 0x0020, .platform_mask =3D 0x22,=
 .driver_data =3D 0x100 },
 { .flags =3D X86_CPU_ID_FLAG_ENTRY_VALID, .vendor =3D X86_VENDOR_INTEL, .fam=
ily =3D 0x6, .model =3D 0xa6, .steppings =3D 0x0001, .platform_mask =3D 0x80,=
 .driver_data =3D 0x102 },
 { .flags =3D X86_CPU_ID_FLAG_ENTRY_VALID, .vendor =3D X86_VENDOR_INTEL, .fam=
ily =3D 0x6, .model =3D 0xa6, .steppings =3D 0x0002, .platform_mask =3D 0x80,=
 .driver_data =3D 0x100 },
-{ .flags =3D X86_CPU_ID_FLAG_ENTRY_VALID, .vendor =3D X86_VENDOR_INTEL, .fam=
ily =3D 0x6, .model =3D 0xa7, .steppings =3D 0x0002, .platform_mask =3D 0x02,=
 .driver_data =3D 0x64 },
-{ .flags =3D X86_CPU_ID_FLAG_ENTRY_VALID, .vendor =3D X86_VENDOR_INTEL, .fam=
ily =3D 0x6, .model =3D 0xaa, .steppings =3D 0x0010, .platform_mask =3D 0xe6,=
 .driver_data =3D 0x25 },
-{ .flags =3D X86_CPU_ID_FLAG_ENTRY_VALID, .vendor =3D X86_VENDOR_INTEL, .fam=
ily =3D 0x6, .model =3D 0xad, .steppings =3D 0x0002, .platform_mask =3D 0x20,=
 .driver_data =3D 0xa000124 },
-{ .flags =3D X86_CPU_ID_FLAG_ENTRY_VALID, .vendor =3D X86_VENDOR_INTEL, .fam=
ily =3D 0x6, .model =3D 0xad, .steppings =3D 0x0002, .platform_mask =3D 0x95,=
 .driver_data =3D 0x10003f0 },
-{ .flags =3D X86_CPU_ID_FLAG_ENTRY_VALID, .vendor =3D X86_VENDOR_INTEL, .fam=
ily =3D 0x6, .model =3D 0xae, .steppings =3D 0x0002, .platform_mask =3D 0x97,=
 .driver_data =3D 0x1000273 },
-{ .flags =3D X86_CPU_ID_FLAG_ENTRY_VALID, .vendor =3D X86_VENDOR_INTEL, .fam=
ily =3D 0x6, .model =3D 0xaf, .steppings =3D 0x0008, .platform_mask =3D 0x01,=
 .driver_data =3D 0x3000382 },
-{ .flags =3D X86_CPU_ID_FLAG_ENTRY_VALID, .vendor =3D X86_VENDOR_INTEL, .fam=
ily =3D 0x6, .model =3D 0xb5, .steppings =3D 0x0001, .platform_mask =3D 0x80,=
 .driver_data =3D 0xa },
-{ .flags =3D X86_CPU_ID_FLAG_ENTRY_VALID, .vendor =3D X86_VENDOR_INTEL, .fam=
ily =3D 0x6, .model =3D 0xb7, .steppings =3D 0x0002, .platform_mask =3D 0x32,=
 .driver_data =3D 0x132 },
-{ .flags =3D X86_CPU_ID_FLAG_ENTRY_VALID, .vendor =3D X86_VENDOR_INTEL, .fam=
ily =3D 0x6, .model =3D 0xb7, .steppings =3D 0x0010, .platform_mask =3D 0x32,=
 .driver_data =3D 0x132 },
-{ .flags =3D X86_CPU_ID_FLAG_ENTRY_VALID, .vendor =3D X86_VENDOR_INTEL, .fam=
ily =3D 0x6, .model =3D 0xba, .steppings =3D 0x0004, .platform_mask =3D 0xe0,=
 .driver_data =3D 0x6133 },
-{ .flags =3D X86_CPU_ID_FLAG_ENTRY_VALID, .vendor =3D X86_VENDOR_INTEL, .fam=
ily =3D 0x6, .model =3D 0xba, .steppings =3D 0x0008, .platform_mask =3D 0xe0,=
 .driver_data =3D 0x6133 },
-{ .flags =3D X86_CPU_ID_FLAG_ENTRY_VALID, .vendor =3D X86_VENDOR_INTEL, .fam=
ily =3D 0x6, .model =3D 0xba, .steppings =3D 0x0100, .platform_mask =3D 0xe0,=
 .driver_data =3D 0x6133 },
-{ .flags =3D X86_CPU_ID_FLAG_ENTRY_VALID, .vendor =3D X86_VENDOR_INTEL, .fam=
ily =3D 0x6, .model =3D 0xbd, .steppings =3D 0x0002, .platform_mask =3D 0x80,=
 .driver_data =3D 0x125 },
-{ .flags =3D X86_CPU_ID_FLAG_ENTRY_VALID, .vendor =3D X86_VENDOR_INTEL, .fam=
ily =3D 0x6, .model =3D 0xbe, .steppings =3D 0x0001, .platform_mask =3D 0x19,=
 .driver_data =3D 0x1e },
-{ .flags =3D X86_CPU_ID_FLAG_ENTRY_VALID, .vendor =3D X86_VENDOR_INTEL, .fam=
ily =3D 0x6, .model =3D 0xbf, .steppings =3D 0x0004, .platform_mask =3D 0x07,=
 .driver_data =3D 0x3d },
-{ .flags =3D X86_CPU_ID_FLAG_ENTRY_VALID, .vendor =3D X86_VENDOR_INTEL, .fam=
ily =3D 0x6, .model =3D 0xbf, .steppings =3D 0x0020, .platform_mask =3D 0x07,=
 .driver_data =3D 0x3d },
-{ .flags =3D X86_CPU_ID_FLAG_ENTRY_VALID, .vendor =3D X86_VENDOR_INTEL, .fam=
ily =3D 0x6, .model =3D 0xbf, .steppings =3D 0x0040, .platform_mask =3D 0x07,=
 .driver_data =3D 0x3d },
-{ .flags =3D X86_CPU_ID_FLAG_ENTRY_VALID, .vendor =3D X86_VENDOR_INTEL, .fam=
ily =3D 0x6, .model =3D 0xbf, .steppings =3D 0x0080, .platform_mask =3D 0x07,=
 .driver_data =3D 0x3d },
-{ .flags =3D X86_CPU_ID_FLAG_ENTRY_VALID, .vendor =3D X86_VENDOR_INTEL, .fam=
ily =3D 0x6, .model =3D 0xc5, .steppings =3D 0x0004, .platform_mask =3D 0x82,=
 .driver_data =3D 0x11a },
-{ .flags =3D X86_CPU_ID_FLAG_ENTRY_VALID, .vendor =3D X86_VENDOR_INTEL, .fam=
ily =3D 0x6, .model =3D 0xc6, .steppings =3D 0x0004, .platform_mask =3D 0x82,=
 .driver_data =3D 0x11a },
-{ .flags =3D X86_CPU_ID_FLAG_ENTRY_VALID, .vendor =3D X86_VENDOR_INTEL, .fam=
ily =3D 0x6, .model =3D 0xc6, .steppings =3D 0x0010, .platform_mask =3D 0x82,=
 .driver_data =3D 0x11a },
-{ .flags =3D X86_CPU_ID_FLAG_ENTRY_VALID, .vendor =3D X86_VENDOR_INTEL, .fam=
ily =3D 0x6, .model =3D 0xca, .steppings =3D 0x0004, .platform_mask =3D 0x82,=
 .driver_data =3D 0x11a },
-{ .flags =3D X86_CPU_ID_FLAG_ENTRY_VALID, .vendor =3D X86_VENDOR_INTEL, .fam=
ily =3D 0x6, .model =3D 0xcf, .steppings =3D 0x0002, .platform_mask =3D 0x87,=
 .driver_data =3D 0x210002c0 },
-{ .flags =3D X86_CPU_ID_FLAG_ENTRY_VALID, .vendor =3D X86_VENDOR_INTEL, .fam=
ily =3D 0x6, .model =3D 0xcf, .steppings =3D 0x0004, .platform_mask =3D 0x87,=
 .driver_data =3D 0x210002c0 },
+{ .flags =3D X86_CPU_ID_FLAG_ENTRY_VALID, .vendor =3D X86_VENDOR_INTEL, .fam=
ily =3D 0x6, .model =3D 0xa7, .steppings =3D 0x0002, .platform_mask =3D 0x02,=
 .driver_data =3D 0x65 },
+{ .flags =3D X86_CPU_ID_FLAG_ENTRY_VALID, .vendor =3D X86_VENDOR_INTEL, .fam=
ily =3D 0x6, .model =3D 0xaa, .steppings =3D 0x0010, .platform_mask =3D 0xe6,=
 .driver_data =3D 0x28 },
+{ .flags =3D X86_CPU_ID_FLAG_ENTRY_VALID, .vendor =3D X86_VENDOR_INTEL, .fam=
ily =3D 0x6, .model =3D 0xad, .steppings =3D 0x0002, .platform_mask =3D 0x20,=
 .driver_data =3D 0xa000142 },
+{ .flags =3D X86_CPU_ID_FLAG_ENTRY_VALID, .vendor =3D X86_VENDOR_INTEL, .fam=
ily =3D 0x6, .model =3D 0xad, .steppings =3D 0x0002, .platform_mask =3D 0x95,=
 .driver_data =3D 0x1000423 },
+{ .flags =3D X86_CPU_ID_FLAG_ENTRY_VALID, .vendor =3D X86_VENDOR_INTEL, .fam=
ily =3D 0x6, .model =3D 0xae, .steppings =3D 0x0002, .platform_mask =3D 0x97,=
 .driver_data =3D 0x1000307 },
+{ .flags =3D X86_CPU_ID_FLAG_ENTRY_VALID, .vendor =3D X86_VENDOR_INTEL, .fam=
ily =3D 0x6, .model =3D 0xaf, .steppings =3D 0x0008, .platform_mask =3D 0x01,=
 .driver_data =3D 0x30003a3 },
+{ .flags =3D X86_CPU_ID_FLAG_ENTRY_VALID, .vendor =3D X86_VENDOR_INTEL, .fam=
ily =3D 0x6, .model =3D 0xb5, .steppings =3D 0x0001, .platform_mask =3D 0x80,=
 .driver_data =3D 0xd },
+{ .flags =3D X86_CPU_ID_FLAG_ENTRY_VALID, .vendor =3D X86_VENDOR_INTEL, .fam=
ily =3D 0x6, .model =3D 0xb7, .steppings =3D 0x0002, .platform_mask =3D 0x32,=
 .driver_data =3D 0x133 },
+{ .flags =3D X86_CPU_ID_FLAG_ENTRY_VALID, .vendor =3D X86_VENDOR_INTEL, .fam=
ily =3D 0x6, .model =3D 0xb7, .steppings =3D 0x0010, .platform_mask =3D 0x32,=
 .driver_data =3D 0x133 },
+{ .flags =3D X86_CPU_ID_FLAG_ENTRY_VALID, .vendor =3D X86_VENDOR_INTEL, .fam=
ily =3D 0x6, .model =3D 0xba, .steppings =3D 0x0004, .platform_mask =3D 0xe0,=
 .driver_data =3D 0x6134 },
+{ .flags =3D X86_CPU_ID_FLAG_ENTRY_VALID, .vendor =3D X86_VENDOR_INTEL, .fam=
ily =3D 0x6, .model =3D 0xba, .steppings =3D 0x0008, .platform_mask =3D 0xe0,=
 .driver_data =3D 0x6134 },
+{ .flags =3D X86_CPU_ID_FLAG_ENTRY_VALID, .vendor =3D X86_VENDOR_INTEL, .fam=
ily =3D 0x6, .model =3D 0xba, .steppings =3D 0x0100, .platform_mask =3D 0xe0,=
 .driver_data =3D 0x6134 },
+{ .flags =3D X86_CPU_ID_FLAG_ENTRY_VALID, .vendor =3D X86_VENDOR_INTEL, .fam=
ily =3D 0x6, .model =3D 0xbd, .steppings =3D 0x0002, .platform_mask =3D 0x80,=
 .driver_data =3D 0x126 },
+{ .flags =3D X86_CPU_ID_FLAG_ENTRY_VALID, .vendor =3D X86_VENDOR_INTEL, .fam=
ily =3D 0x6, .model =3D 0xbe, .steppings =3D 0x0001, .platform_mask =3D 0x19,=
 .driver_data =3D 0x21 },
+{ .flags =3D X86_CPU_ID_FLAG_ENTRY_VALID, .vendor =3D X86_VENDOR_INTEL, .fam=
ily =3D 0x6, .model =3D 0xbf, .steppings =3D 0x0004, .platform_mask =3D 0x07,=
 .driver_data =3D 0x3e },
+{ .flags =3D X86_CPU_ID_FLAG_ENTRY_VALID, .vendor =3D X86_VENDOR_INTEL, .fam=
ily =3D 0x6, .model =3D 0xbf, .steppings =3D 0x0020, .platform_mask =3D 0x07,=
 .driver_data =3D 0x3e },
+{ .flags =3D X86_CPU_ID_FLAG_ENTRY_VALID, .vendor =3D X86_VENDOR_INTEL, .fam=
ily =3D 0x6, .model =3D 0xbf, .steppings =3D 0x0040, .platform_mask =3D 0x07,=
 .driver_data =3D 0x3e },
+{ .flags =3D X86_CPU_ID_FLAG_ENTRY_VALID, .vendor =3D X86_VENDOR_INTEL, .fam=
ily =3D 0x6, .model =3D 0xbf, .steppings =3D 0x0080, .platform_mask =3D 0x07,=
 .driver_data =3D 0x3e },
+{ .flags =3D X86_CPU_ID_FLAG_ENTRY_VALID, .vendor =3D X86_VENDOR_INTEL, .fam=
ily =3D 0x6, .model =3D 0xc5, .steppings =3D 0x0004, .platform_mask =3D 0x82,=
 .driver_data =3D 0x121 },
+{ .flags =3D X86_CPU_ID_FLAG_ENTRY_VALID, .vendor =3D X86_VENDOR_INTEL, .fam=
ily =3D 0x6, .model =3D 0xc6, .steppings =3D 0x0004, .platform_mask =3D 0x82,=
 .driver_data =3D 0x121 },
+{ .flags =3D X86_CPU_ID_FLAG_ENTRY_VALID, .vendor =3D X86_VENDOR_INTEL, .fam=
ily =3D 0x6, .model =3D 0xc6, .steppings =3D 0x0010, .platform_mask =3D 0x82,=
 .driver_data =3D 0x121 },
+{ .flags =3D X86_CPU_ID_FLAG_ENTRY_VALID, .vendor =3D X86_VENDOR_INTEL, .fam=
ily =3D 0x6, .model =3D 0xca, .steppings =3D 0x0004, .platform_mask =3D 0x82,=
 .driver_data =3D 0x121 },
+{ .flags =3D X86_CPU_ID_FLAG_ENTRY_VALID, .vendor =3D X86_VENDOR_INTEL, .fam=
ily =3D 0x6, .model =3D 0xcc, .steppings =3D 0x0002, .platform_mask =3D 0x90,=
 .driver_data =3D 0x11b },
+{ .flags =3D X86_CPU_ID_FLAG_ENTRY_VALID, .vendor =3D X86_VENDOR_INTEL, .fam=
ily =3D 0x6, .model =3D 0xcc, .steppings =3D 0x0004, .platform_mask =3D 0x90,=
 .driver_data =3D 0x11b },
+{ .flags =3D X86_CPU_ID_FLAG_ENTRY_VALID, .vendor =3D X86_VENDOR_INTEL, .fam=
ily =3D 0x6, .model =3D 0xcc, .steppings =3D 0x0008, .platform_mask =3D 0x90,=
 .driver_data =3D 0x11b },
+{ .flags =3D X86_CPU_ID_FLAG_ENTRY_VALID, .vendor =3D X86_VENDOR_INTEL, .fam=
ily =3D 0x6, .model =3D 0xcf, .steppings =3D 0x0002, .platform_mask =3D 0x87,=
 .driver_data =3D 0x210002e0 },
+{ .flags =3D X86_CPU_ID_FLAG_ENTRY_VALID, .vendor =3D X86_VENDOR_INTEL, .fam=
ily =3D 0x6, .model =3D 0xcf, .steppings =3D 0x0004, .platform_mask =3D 0x87,=
 .driver_data =3D 0x210002e0 },
 { .flags =3D X86_CPU_ID_FLAG_ENTRY_VALID, .vendor =3D X86_VENDOR_INTEL, .fam=
ily =3D 0xf, .model =3D 0x00, .steppings =3D 0x0080, .platform_mask =3D 0x01,=
 .driver_data =3D 0x12 },
 { .flags =3D X86_CPU_ID_FLAG_ENTRY_VALID, .vendor =3D X86_VENDOR_INTEL, .fam=
ily =3D 0xf, .model =3D 0x00, .steppings =3D 0x0080, .platform_mask =3D 0x02,=
 .driver_data =3D 0x8 },
 { .flags =3D X86_CPU_ID_FLAG_ENTRY_VALID, .vendor =3D X86_VENDOR_INTEL, .fam=
ily =3D 0xf, .model =3D 0x00, .steppings =3D 0x0400, .platform_mask =3D 0x01,=
 .driver_data =3D 0x13 },
