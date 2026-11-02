Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.105
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793600697;
	b=KNP2Vv+FhU3TtxOz3OWNMCs4bZ5JP3Huoyx79fmFVsN9lbyIbKlzyKv/JxvQyQ/aLU+c
	 Gmsl2e1p7sEl3sWFXw4qrubdlxQ7eGpUad+F024ujF3uLLPOt6BeZeJUg1DHpaHpo+bE6
	 KCEtEyCgIwY24w1eEDsI7P1puzpw7D/xwQHPg9vLrdHKtG8XC8tJtQB30T9zpXjFRDaKy
	 slgs+y/Z6ps4Vsv3vMVVQ7Dtoa21Q7q9RHWJ/JIooS0+wfqqRTRlvFqy7UW/+asBOQYZQ
	 TwiXS2cOfLRragitvVZ+1xfvGRSk02BzRzqmPOYqNM4yD3vtP2mWyLjxxejZFPTfOpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793600697;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=aRIRDt0yrEKAcqc0QkNx41yUzX19NqOKpFZ+zv8Btqw=;
	b=GPMQaouPcgWaIqhD8JAtJsFYcZzsndePJpRSxEFJm9+Toh2ORtP3GD+ieIqGZxR7V93n
	 YaZ8jwdbUAKpxY5yx0xISaGeWWG+hMm7r24mOo2330gM5/c6xeWp6rxu7sJ3g1zJ90NGG
	 22uaDKUfQ5/uCRGYxNqMXfeCp7yu5tOCHdIrsG64Ics1dI0S4x7tGAzzMn+a8W84kAz4k
	 jAo3Y/Tdyy3R4NC8Csrm3+P6Gh44yFsYmUdANUicnq2Z6UOxiVL/rU4TY48FvFf6jv6fH
	 e0qFxRtrVf0qGZ8ct5gvXS+Ib0khTAhMIIehmHkAY9Slp28p7YfhvD66IQiLLoOFrRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nburch.org;
	spf=pass smtp.mailfrom=nburch.org;
	dkim=pass header.d=nburch.org header.i=@nburch.org header.a=rsa-sha256 header.s=protonmail header.b=roXp8PSa;
	arc=none smtp.remote-ip=79.135.106.105
Received: from mail-106105.protonmail.ch (mail-106105.protonmail.ch [79.135.106.105])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6B92606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 06:24:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6B92606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nburch.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nburch.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nburch.org header.i=@nburch.org header.a=rsa-sha256 header.s=protonmail header.b=roXp8PSa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nburch.org;
	s=protonmail; t=1793600693; x=1793859893;
	bh=aRIRDt0yrEKAcqc0QkNx41yUzX19NqOKpFZ+zv8Btqw=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=roXp8PSaNSMHK3qF8LpGditk8ZQKYchE9k4FJE4SlJJ9cZ3m5nOb2OHtovk92DI9O
	 HswxWiEDbdl7ISiw4NCGFpIaMBcDB2PXEK7rTxUrryPcn1tYqDmjXJbPsH+kSWyP62
	 ziTPErYOekBTrThNHHRb3CYbAXxGMKNH9EBUYZyrqZsAp0LPXcK1NJBj6DAulhqdoS
	 hv/GG8ixIr6xjrdDmLCUo4on+6nvnLz4BEeHf326D4VSJ85GRnBikK3niy0pfUJZKG
	 ZmjCyCFLpAIbkqQyGx3EbsPB0f1qJqOo9BR+tdIUTI3E2RvgQ24qAubEojFPJWLvNH
	 ukCOu1wVYexuA==
Date: Mon, 02 Nov 2026 06:24:48 +0000
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org
From: Noah Burchell <noah@nburch.org>
Cc: "H . Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org, Noah Burchell <noah@nburch.org>
Subject: [PATCH] x86/reboot: Remove dead code after machine_real_restart()
Message-ID: <20261102062417.56725-1-noah@nburch.org>
Feedback-ID: 224137974:user:proton
X-Pm-Message-ID: d8a8bafd5913ab97b5ce4426b9baa8b47ab753bc
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

machine_real_restart() is __noreturn and ends in unreachable(), so the
reboot_type assignment and the break after it in the BOOT_BIOS case can
never execute.

Remove them. No functional change.

Signed-off-by: Noah Burchell <noah@nburch.org>
---
 arch/x86/kernel/reboot.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/x86/kernel/reboot.c b/arch/x86/kernel/reboot.c
index 0fed6d0d7..28f938a3b 100644
--- a/arch/x86/kernel/reboot.c
+++ b/arch/x86/kernel/reboot.c
@@ -635,10 +635,6 @@ static void native_machine_emergency_restart(void)
 =09=09case BOOT_BIOS:
 =09=09=09machine_real_restart(MRR_BIOS);
=20
-=09=09=09/* We're probably dead after this, but... */
-=09=09=09reboot_type =3D BOOT_CF9_SAFE;
-=09=09=09break;
-
 =09=09case BOOT_CF9_FORCE:
 =09=09=09port_cf9_safe =3D true;
 =09=09=09fallthrough;
--=20
2.56.0


