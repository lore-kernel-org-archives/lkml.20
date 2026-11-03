Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=77.32.148.58
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793668755;
	b=0ePvBcGAUZ1X/KoFE3uQicd3j+WY0UhDTL0sxq6pW6ARPA4s2Hhr0kMnUHdfgF1Pru1v
	 AYY2AlCSR4Uhj6Jd8MltVr1Yd74lUZDyXIFpEJ4chBzoEvyFouq01WM6jgasKoTcla78c
	 Od0ATEVugXfZt+2YbVjUkUZrlRLHX+Nj/pwCkikjSNZcZLc6TTRgepNP7cL3FVxA9jN2a
	 4ym7hgd/Kc8dIimwJ12HwANQnOD2beUCmH3oqm2Ffezk0NQvfpbti95jXUqmC0kdha1Yq
	 yyjwLiH5NeYS8T85tHZJAw63o+YWwdDWcTg3UwVUZyL/6uK+hZdJxG2AwT/T/vPxJlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793668755;
	h=DMARC-Filter:DKIM-Signature:Date:Feedback-ID:From:List-Unsubscribe:
	 X-Mailin-EID:To:Subject:X-sib-id:Cc:Message-Id:Origin-messageId:
	 List-Unsubscribe-Post:X-CSA-Complaints:X-Mailer:
	 X-Last-Tls-Session-Version:Dkim-Signature:Mime-Version:
	 Content-Transfer-Encoding:Received;
	bh=Gn4weV70A0Qeh7+Puy6JMegQUP+4k09ZOvQ35EPxVyk=;
	b=DGTskwZGAdnLM94a9qkFLZm5l4Jwxr99QmzsvKT+lBd4KvYa4AJ6BQM3QzxeC+bc87OD
	 RQh2klHX/1LEM+/izk88oXhLbN2Q148WziX2faNXyzT2lOR3JnwGTANbvd3SNIwfTsbwc
	 arRGlj1iruUM2jXTBnRn8S+79P+L0gkwPSU9emUrRI9kJoM0bQD9Hor4/tTcLtnoJuFeL
	 X0jpikG8qvTHawDebY9SwGm9mbJSoRgDaWtF5KhBIkL0+NJyJOIJUI2YD4QYqNBZiDGan
	 i8EsVbSUJsScJlmZYDc3qf6Zk4WFG9IFJbgt+hx6iE1OC2o93KgbcE30mENCRzI5ExQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=romitsagu.com;
	spf=pass smtp.mailfrom=if.d.sender-sib.com;
	dkim=pass header.d=romitsagu.com header.i=@romitsagu.com header.a=rsa-sha256 header.s=brevo1 header.b=PrmIPM9M;
	dkim=fail reason="signature verification failed" header.d=romitsagu.com header.i=@romitsagu.com header.a=rsa-sha256 header.s=dkim header.b=sHem1Tjr;
	arc=none smtp.remote-ip=77.32.148.58
Received: from if.d.sender-sib.com (if.d.sender-sib.com [77.32.148.58])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E293606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 01:19:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E293606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=romitsagu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=if.d.sender-sib.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=romitsagu.com header.i=@romitsagu.com header.a=rsa-sha256 header.s=brevo1 header.b=PrmIPM9M;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=romitsagu.com header.i=@romitsagu.com header.a=rsa-sha256 header.s=dkim header.b=sHem1Tjr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=romitsagu.com;
 q=dns/txt; s=brevo1; bh=Gn4weV70A0Qeh7+Puy6JMegQUP+4k09ZOvQ35EPxVyk=;
 h=from:subject:date:to:cc:mime-version:content-transfer-encoding:list-unsubscribe:x-csa-complaints:list-unsubscribe-post:message-id:x-sib-id:feedback-id;
        b=PrmIPM9MjluLa/+4LyZUmlROT9aGZ5dGp3kMokqNoJkYJV6fxWfN/0sATfD7iLps5LIqjfoWfNDn
        xkY9Vu0mSmbu4WV2KS72fUHXP6XgADOe4rZ592NFiySsx7gQtkwpB53ivABIhrcTmJ06gDM+ePQ+
        pxOMagQxEPA8Bjz9isimf94lL/mUUf5dA9c5yqwwS9ZnfKIhNGY4gP8T54QSnkTJU3CuhXCzOwRo
        N4YHKJ4UEtyCsfLo3mDuU5F0/lGkpXgbTsP6AghtL2OJlBHGqFv7+Z8c8D8iMaz6Y3x6LCQXAhFr
        0EbEnEplWc5SnKWlRU6pNKv2LKGyYycPUKMcQQ==
Date: Tue,  3 Nov 2026 01:18:42 +0000
Feedback-ID: 77.32.148.58:7631162_-1:7631162:Sendinblue
From: "Romit Sagu" <romit@romitsagu.com>
X-Mailin-EID: MjY5NTA4NDE4fmxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmd%2BPDIwMjYxMTAzMDExODQ5LjE4MTM5Mi0xLXJvbWl0QHJvbWl0c2FndS5jb20%2BfmlmLmQuc2VuZGVyLXNpYi5jb20%3D
To: <netdev@vger.kernel.org>
Subject: [PATCH] [PATCH net-next] net: sfp: add quirk for OEM SFP+ONU-XGSPON
X-sib-id: elIbYRFoRzbDPDrA7X11-wKxHvZqbGy2r6gvNGJEmZljYJPmRRCD0JUU3AZ0AuhMm5wXH9inU2jdAhVHGmEh5nOA9bkakprfX_LuWYk64hB3pNSVAaD0Aa1UBF3EUsXIfD5WSyhQdwge3RiZVDJgwIGnTTkoj_C4ZXNp0EvH_wW8r5OPzONeQSoG
Cc: <linux@armlinux.org.uk>,  <andrew@lunn.ch>,  <hkallweit1@gmail.com>,  <davem@davemloft.net>,  <edumazet@kernel.org>,  <kuba@kernel.org>,  <pabeni@redhat.com>,  <linux-kernel@vger.kernel.org>,  "Romit Sagu" <romit@romitsagu.com>
Message-Id: <20261103011849.181392-1-romit@romitsagu.com>
Origin-messageId: <20261103011849.181392-1-romit@romitsagu.com>
List-Unsubscribe-Post: List-Unsubscribe=One-Click
X-CSA-Complaints: csa-complaints@eco.de
X-Mailer: git-send-email 2.43.0
X-Last-Tls-Session-Version: TLSv1.3
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=romitsagu.com; s=dkim; t=1793668743; h=from:subject:date:message-id:to:cc:mime-version: content-transfer-encoding; bh=XahXTocY6unirklQewQrX7+/b8GZtqO6bUbLqyn7YOs=; b=sHem1Tjr9k31yBK0gtCGToTV4RpiVHksnmD3b1CB84pK8w6aDmDkiQk/0aDyEZTogvPg40 fn/XnVvTcX5gU8PLHFowa+hTaCXnITfjtpr7x2WtfxyIVMYEtuASLun5jn+DAX1RqtFWXE 3N4j2EHY2KSg9NRpZYKq+MdR5UI06LIXuqGgOQ4qgwQkdg2mzx2UpKDgKqCBQzPeyGBgtA gO7+w+4Rh1/CJ525wT3IzTRrvdCKSshVAUk/xey/eCnoupLh8A7Oxtl4TlR2eBG/W6m7OQ iFrlhV7GdM3bqv8NrbNt1yEWzncH/32IGXReJygeQAbb1giDi+oA1BooKvmb2w==
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7305040ED3; Mon,  2 Nov 2026 20:18:55 -0500 (EST)


This XGS-PON ONU stick (vendor OEM, part SFP+ONU-XGSPON)
needs the same handling as other Potron-based modules. Without it,
the module fails to connect and the kernal shows these errors:
sfp sfp1: module transmit fault indicated
sfp sfp1: module persistently indicates fault, disabling

This module requires TX_FAULT/LOS behaviour and boot delay tuning.
Add a quirk using the existing sfp_fixup_potron.

Signed-off-by: Romit Sagu <romit@romitsagu.com>
---
 drivers/net/phy/sfp.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/phy/sfp.c b/drivers/net/phy/sfp.c
index 85e57a16bb52..9435b25b54c9 100644
--- a/drivers/net/phy/sfp.c
+++ b/drivers/net/phy/sfp.c
@@ -623,6 +623,10 @@ static const struct sfp_quirk sfp_quirks[] =3D {
=20
 	SFP_QUIRK_F("YV", "SFP+ONU-XGSPON", sfp_fixup_potron),
=20
+	// OEM SFP+ONU-XGSPON is a XGS-PON ONT stick with broken TX_FAULT
+	// and slow startup, just like potron.
+	SFP_QUIRK_F("OEM", "SFP+ONU-XGSPON", sfp_fixup_potron),
+
 	// HORACO HC-10GE-113C uses Rollball protocol to talk to the PHY.
 	SFP_QUIRK_F("OEM", "HC-10GE-113C", sfp_fixup_rollball),
=20
--=20
2.43.0


