Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792521146;
	b=meqwgBfWL6REMsvVhlEEL/I4s+wxfAer1H8bhspL0SBh/UazDuLgATlvNr1QswXntO4b
	 n4WypxcAooKetQ0Cq/N5hWtM5KWEGhQvCD8G6tFXNykbBUgAQqTlFgr6CunzqybcdPY7C
	 PmJ4iSC02NaSqZepWcXORR+PzCHsahZuoljM81Iyaqot+ZDwozhgAmDQ3k5aAuZPWd2TT
	 0kbsCfg21ZTQH0q4+cId1k9+qQttmphVNgy9n845bMEacErW2waeRdd7H4w8lFM+J4Bpw
	 vG5CJmaikjEn+A6E+yUNN2mDR+2RS6Ef17Bu/a1Iw3FNM85oyJ5kPegc6VpgY5J6bkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792521146;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=+rAdItrOQH7a2hswqsYfhmTsyL5AZeVNbL7C80yRfwQ=;
	b=HD8l+yiZ/vmKDhi0z/kFoRNzcVxZLw9Mohi67j7dMGBi4r5oilHLLEexIaTkpj3cCC9l
	 F5JTwAh4mb5UjXlyBK9LnuMkmICZdjpw/a06oAC6RdxxpS5+JWlI7JQ221vP1mzf9RDT5
	 tUAh3B9zou9ipGQh5oUEJ4VmhnmXT9zh5RM/Gr/2JBdkTM1QYiJcjwafh6SKEnGrW5ng/
	 n218+2xw4cPlHmcRqQIYxccByPDhgICykgivAn1TmaEB7ueN7XeFlg8a3gwGOElbVDkCL
	 3kNGSio6OWzZYkFlR1Swam/Vms2xgkEBkb+KJj0FMHr6mfgmYEvKkXTcXdA8TAvdevQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=MvI6gBFo;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=cp53ZdXj;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98516606A31A;
	Tue, 20 Oct 2026 18:32:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98516606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=MvI6gBFo;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=cp53ZdXj
Date: Tue, 20 Oct 2026 18:32:22 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792521144;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+rAdItrOQH7a2hswqsYfhmTsyL5AZeVNbL7C80yRfwQ=;
	b=MvI6gBFo8ZOijnCctyhb8uCDG5+TuIgFrlqM6vsbe6y+o8im9XcCPzBovWv4ZDcbp67MA9
	mRg5Buq6wR/MFKAMh5L4MnIa6twxRNeCfnLHGfKJRkMPdwGhfVhK3YnnweCSMg8QswWlIq
	Jj5MiXEHWBWf/fxstsNp2Pf4sDfrvbhUrjNpu2RoywlPb42nWrzS0h8HBWclC5lXA4Z8j0
	KDReYvqFzKJmDw7P3PJyEHFpelC3BPdZ2VOwgFqgSiR85TZBVoaPrfiLIpSCz3Ifi9+T2J
	4rzchPHctvS9Tpe0XxFsCtIqQcw8vFCP2bKHs87CcVbxjXOiEj7v+4UD97TKEA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792521144;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+rAdItrOQH7a2hswqsYfhmTsyL5AZeVNbL7C80yRfwQ=;
	b=cp53ZdXjvVLnw3JeC3vaX29W5QF7zU0cAGW8voJHMRonLC+mcBpADVYVRX0QbAO7XFKCj9
	vO5p8skHSIKufEDA==
From: "tip-bot2 for Grzegorz Jaszczyk" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: x86/apic] x86/apic: Remove redundant check from x2apic_phys_probe()
Cc: Grzegorz Jaszczyk <jaszczyk@chromium.org>,
 "Borislav Petkov (AMD)" <bp@alien8.de>, Thomas Gleixner <tglx@kernel.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260924104102.3534474-4-jaszczyk@chromium.org>
References: <20260924104102.3534474-4-jaszczyk@chromium.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179252114259.3012171.8755574121592967636.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/apic branch of tip:

Commit-ID:     98dff3f1bc033da4d4811d8f335fe7311dbf54df
Gitweb:        https://git.kernel.org/tip/98dff3f1bc033da4d4811d8f335fe7311db=
f54df
Author:        Grzegorz Jaszczyk <jaszczyk@chromium.org>
AuthorDate:    Thu, 24 Sep 2026 10:40:20=20
Committer:     Borislav Petkov (AMD) <bp@alien8.de>
CommitterDate: Mon, 19 Oct 2026 18:21:25 -07:00

x86/apic: Remove redundant check from x2apic_phys_probe()

Commit

  9ebd680bd029 ("x86, apic: Use probe routines to simplify apic selection")

introduced x2apic_phys_probe() with a generic fallback check for

  apic =3D=3D &apic_x2apic_phys

to preserve any prior selection of apic_x2apic_phys by default_acpi_madt_oem_=
check().

At the time, x2apic_acpi_madt_oem_check() only checked

  x2apic_phys && x2apic_enabled()

so that fallback was already redundant. Commit

  ea0dcf903e7d ("x86/apic: Use x2apic physical mode based on FADT setting")

later added the ACPI_FADT_APIC_PHYSICAL check only to x2apic_acpi_madt_oem_ch=
eck(),
temporarily relying on the fallback in x2apic_phys_probe() when x2APIC was
pre-enabled by BIOS.

Subsequently,

  cb214ede7657 ("x86/apic: Work around boot failure on HP ProLiant DL980 G7 S=
erver systems")

factored out x2apic_fadt_phys() and added it directly to x2apic_phys_probe().=
 Because
default_acpi_madt_oem_check() (via the .acpi_madt_oem_check callback) is the =
only
path that can install apic_x2apic_phys prior to x2apic_phys_probe(), and
x2apic_acpi_madt_oem_check() checks the exact same

  x2apic_phys || x2apic_fadt_phys()

condition, the fallback

  apic =3D=3D &apic_x2apic_phys

check became completely unreachable again.

Remove the redundant check and the associated forward declaration of apic_x2a=
pic_phys.

In addition to cleaning up dead code, this allows apic_x2apic_phys to be inst=
alled as
an early boot default driver when hardware x2APIC is pre-enabled without prev=
enting
x2apic_cluster from being probed and selected later during boot.

  [ bp: Massage commit message. ]

Signed-off-by: Grzegorz Jaszczyk <jaszczyk@chromium.org>
Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
Reviewed-by: Thomas Gleixner <tglx@kernel.org>
Link: https://patch.msgid.link/20260924104102.3534474-4-jaszczyk@chromium.org
---
 arch/x86/kernel/apic/x2apic_phys.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/arch/x86/kernel/apic/x2apic_phys.c b/arch/x86/kernel/apic/x2apic=
_phys.c
index 090647c..5bf8683 100644
--- a/arch/x86/kernel/apic/x2apic_phys.c
+++ b/arch/x86/kernel/apic/x2apic_phys.c
@@ -6,8 +6,6 @@
 #include "local.h"
=20
 int x2apic_phys;
-
-static struct apic apic_x2apic_phys;
 u32 x2apic_max_apicid __ro_after_init =3D UINT_MAX;
=20
 void __init x2apic_set_max_apicid(u32 apicid)
@@ -110,10 +108,7 @@ static int x2apic_phys_probe(void)
 	if (!x2apic_mode)
 		return 0;
=20
-	if (x2apic_phys || x2apic_fadt_phys())
-		return 1;
-
-	return apic =3D=3D &apic_x2apic_phys;
+	return x2apic_phys || x2apic_fadt_phys();
 }
=20
 u32 x2apic_get_apic_id(u32 id)
