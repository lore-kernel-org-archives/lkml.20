Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA37239A7F4;
	Wed,  2 Sep 2026 21:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788383466; cv=none; b=BAHrrv4KcG0lfW4KgF3e+8mf4yjMa0b+dqmoH5dR5iVzL89MuAST55pKgjGTAf12nUWbjh8TUYq+iqk1+ephsd42Dv+8VRbmkcwguh8LO3r7dtNEOm/cWNwlwhmkvfIXQPgCv1472eQgt9YbUVWObXQdAZhh0f2GZgrcsr4PLxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788383466; c=relaxed/simple;
	bh=75KjD4BRquTli2gCCfl6zdo6Qjq80c5y1qor2qsBctg=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=NGwRtqPQOVD1tcgJ9ft+hJN+Xwnr7SlxNnEMQkhbtA7QSe5MKrms/8TfXP9+UZQ21qZknyDcoW9ix47CHCy4vqSC4bBcmZ9aLfMXYxTglRBefPcCAyerp+yzOGnCw3KwZWpoIz520vxserQQpPqRLcPVbigsbN9hzUCk2wuZ2nY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=zjv1K7jE; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=DMmcS0p+; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="zjv1K7jE";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="DMmcS0p+"
Date: Wed, 02 Sep 2026 21:11:01 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788383462;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XmtbDTkZ0iavhsrWwFfcKZR6iWwcrEcSQUjz5yujHYo=;
	b=zjv1K7jER5zNG1BWXcZGYOaqOVtiDiOd4tbBAM8r23K37oNzZAXpjLnzU5qUOfMfTiLh6I
	18/DLgEJprs8pIMM6sKCe9upfn9+I76KdNzK+aoJwNpnnkJkGzPIouZMWwVNWzl4SuwJI0
	CJekb2fgKoRFU+YPKiRnCM8BIFypQ6MLf6inR6Ecn/qjdZ6gMInM3j+6FQZ3EFCrzIq9pH
	+0z+0lUqkb7SPRKqa6Kf5xTlyslt4qprnYVYLGX+G7nJc+1LRp7OnChicQFL9zUk1xJLh3
	TVdeaL9tIdc2YyAjcxZvIhmIiMszz7I2IJ+EjHsqY/7NMi+wg11WOMGo+iDr5w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788383462;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XmtbDTkZ0iavhsrWwFfcKZR6iWwcrEcSQUjz5yujHYo=;
	b=DMmcS0p+eO8ye2Z0JGTDaw2nsMpC7gGd1bRyO7wMBIRkOWpgnP9/83PAz11NFTLRBApcF7
	oQ6Wy2UMDN+ZC7CA==
From: "tip-bot2 for Thorsten Blum" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: x86/boot] x86/boot: Use BASE_BAUD and DEFAULT_SERIAL_PORT
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260819082529.116650-3-thorsten.blum@linux.dev>
References: <20260819082529.116650-3-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178838346133.3717435.15352329398879955833.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/boot branch of tip:

Commit-ID:     6744e454d877e51394ed15e48e25c97dd6c62099
Gitweb:        https://git.kernel.org/tip/6744e454d877e51394ed15e48e25c97dd6c=
62099
Author:        Thorsten Blum <thorsten.blum@linux.dev>
AuthorDate:    Wed, 19 Aug 2026 10:25:29 +02:00
Committer:     Dave Hansen <dave.hansen@linux.intel.com>
CommitterDate: Wed, 02 Sep 2026 14:08:29 -07:00

x86/boot: Use BASE_BAUD and DEFAULT_SERIAL_PORT

Replace the hard-coded baud rate and ttyS0 port with the existing
BASE_BAUD and DEFAULT_SERIAL_PORT macros.

In parse_earlyprintk(), assign the port directly and drop the redundant
index variable as well as the bases array to simplify the code.

No functional change.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
Signed-off-by: Dave Hansen <dave.hansen@linux.intel.com>
Link: https://patch.msgid.link/20260819082529.116650-3-thorsten.blum@linux.dev
---
 arch/x86/boot/early_serial_console.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/arch/x86/boot/early_serial_console.c b/arch/x86/boot/early_seria=
l_console.c
index 5b83bea..39fcd55 100644
--- a/arch/x86/boot/early_serial_console.c
+++ b/arch/x86/boot/early_serial_console.c
@@ -22,6 +22,7 @@
 #define DLH             1       /*  Divisor latch High        */
=20
 #define DEFAULT_BAUD 9600
+#define BASE_BAUD (1843200 / 16)
=20
 static void early_serial_init(int port, int baud)
 {
@@ -33,7 +34,7 @@ static void early_serial_init(int port, int baud)
 	outb(0, port + FCR);	/* no fifo */
 	outb(0x3, port + MCR);	/* DTR + RTS */
=20
-	divisor	=3D 115200 / baud;
+	divisor	=3D BASE_BAUD / baud;
 	c =3D inb(port + LCR);
 	outb(c | DLAB, port + LCR);
 	outb(divisor & 0xff, port + DLL);
@@ -74,16 +75,13 @@ static void parse_earlyprintk(void)
 			else
 				pos =3D e - arg;
 		} else if (!strncmp(arg + pos, "ttyS", 4)) {
-			static const int bases[] =3D { 0x3f8, 0x2f8 };
-			int idx =3D 0;
-
 			/* +=3D strlen("ttyS"); */
 			pos +=3D 4;
=20
 			if (arg[pos++] =3D=3D '1')
-				idx =3D 1;
-
-			port =3D bases[idx];
+				port =3D 0x2f8; /* ttyS1 */
+			else
+				port =3D DEFAULT_SERIAL_PORT;
 		}
=20
 		if (arg[pos] =3D=3D ',')
@@ -98,7 +96,6 @@ static void parse_earlyprintk(void)
 		early_serial_init(port, baud);
 }
=20
-#define BASE_BAUD (1843200/16)
 static unsigned int probe_baud(int port)
 {
 	unsigned char lcr, dll, dlh;
