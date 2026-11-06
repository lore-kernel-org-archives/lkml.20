Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=77.32.148.58
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794003540;
	b=fdhK9Ck6IbOKD5GAKFWvjOEF/MPjwj4JRTuQb7NEXJWuD8Bg5nQgnXndJRCDoypTIsF8
	 hkvZfStJJuSusjbgX9Z3+BILVifvQGpIT2D9ctKrZLuqH3q0Zrz1p2PsH+nHTY1BI/YG6
	 AtibzoMbSxQlGiiu+y+K7Z3hohX4/7wJgFlD2ci3mA5I8oDbxW8ZNxSPpPthwxoDIoBzP
	 9RrX7q+Gosvb47MSC+r8zfV+TcEvzupXbw6kY+w/sIJs2lzQ8wvNRxCwEpuLFPz69oKTy
	 G6qn6QDZ9ktX7U1jhnVITiIvPN49UAi33adbbrV2XGU84gHOvxdYvhR4dwLRUgiZeyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794003540;
	h=DMARC-Filter:DKIM-Signature:To:Date:Subject:Cc:Message-Id:
	 List-Unsubscribe-Post:From:X-Mailin-EID:X-sib-id:Origin-messageId:
	 Feedback-ID:List-Unsubscribe:X-CSA-Complaints:
	 Content-Transfer-Encoding:X-Mailer:Received:Mime-Version:
	 Dkim-Signature:X-Last-Tls-Session-Version;
	bh=R6n0aYpkmHjIgahCRbhjVhsZJsulzyuC2Atz+IY4FEI=;
	b=Z06XjCl4+QBwevBXbChzJnhN7/v5kJTvN4TjIrySO6fr7VmeJZeheAL/aj2irBB/ytGO
	 Tnw0gQPEVHsIB03MUy8sLgGRIJCOkzls38r+GyYkmRzArmwnb0VbDXNUuiglZsDV7oo28
	 xJregYMW0C3v5Cu3ZPddsvgL3g2GKiOFb3TRvxVMMlFEcu+hbOpaFhMUDcJyKr6LL2hY4
	 TJxsqvm/BNQtPhgMq3gzAXYucCsWkfXtd304UGaNh6YmSihu1H0PE4a0MD1l0387o/r5o
	 HEVD5m1fMz9QBKBq0pv327vz2wQHgfunyxtLBdwrFKjLtSpvIqNXkzWRjepsaC+DMwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=romitsagu.com;
	spf=pass smtp.mailfrom=if.d.sender-sib.com;
	dkim=pass header.d=romitsagu.com header.i=@romitsagu.com header.a=rsa-sha256 header.s=brevo1 header.b=rb72UruA;
	dkim=fail reason="signature verification failed" header.d=romitsagu.com header.i=@romitsagu.com header.a=rsa-sha256 header.s=dkim header.b=LeBoK3iV;
	arc=none smtp.remote-ip=77.32.148.58
Received: from if.d.sender-sib.com (if.d.sender-sib.com [77.32.148.58])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9899606A32D
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 22:18:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9899606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=romitsagu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=if.d.sender-sib.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=romitsagu.com header.i=@romitsagu.com header.a=rsa-sha256 header.s=brevo1 header.b=rb72UruA;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=romitsagu.com header.i=@romitsagu.com header.a=rsa-sha256 header.s=dkim header.b=LeBoK3iV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=romitsagu.com;
 q=dns/txt; s=brevo1; bh=R6n0aYpkmHjIgahCRbhjVhsZJsulzyuC2Atz+IY4FEI=;
 h=from:subject:date:to:cc:mime-version:content-transfer-encoding:list-unsubscribe:x-csa-complaints:list-unsubscribe-post:message-id:x-sib-id:feedback-id;
        b=rb72UruAEIUhgv2WCyebzSE2tiMYjCT+cUtTW5nBk/hWu4FNW5fDXSa2kwOjp/FaA90JOdlTzBwX
        6pZdd+PSY1GURZ0nAxs/l/f74nLoAqHwfP7kzlmxNcy2t36+ScGD1U/Ys/SLgPkJ9f6I3Wpvk9xH
        AA79+7BJODUpRYQpCAx7CDMI1pbqe0Ndqnim2rQUjtKTx6bhOfs8hFDhUhiF9IiXo2tz0Qm1rbA1
        MWEQBT2nDwG/1ZBPARM64dXPGQbz+fiYhqcLwwRvtEoGgRYPWgjf95M0IK6yJEGdpv+G/uEG0/YB
        YqxO1kdidt7fwbz918Ob6aGzHgjbIul6SZAHDQ==
To: <netdev@vger.kernel.org>
Date: Fri,  6 Nov 2026 22:18:29 +0000
Subject: [PATCH net-next v2] net: sfp: add quirk for OEM SFP+ONU-XGSPON
Cc: <linux@armlinux.org.uk>,  <andrew@lunn.ch>,  <hkallweit1@gmail.com>,  <davem@davemloft.net>,  <edumazet@kernel.org>,  <kuba@kernel.org>,  <pabeni@redhat.com>,  <linux-kernel@vger.kernel.org>,  "Romit Sagu" <romit@romitsagu.com>
Message-Id: <20261106221836.3445-1-romit@romitsagu.com>
List-Unsubscribe-Post: List-Unsubscribe=One-Click
From: "Romit Sagu" <romit@romitsagu.com>
X-Mailin-EID: MjY5NTA4NDE4fmxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmd%2BPDIwMjYxMTA2MjIxODM2LjM0NDUtMS1yb21pdEByb21pdHNhZ3UuY29tPn5pZi5kLnNlbmRlci1zaWIuY29t
X-sib-id: pjU5hgLRTXVu-zj707ajCwYhXqQn4WKZ_NTT7iuOh20BB7xCRs-JY5D6WJI0XqV-hPFxUmsBM2dtFQjXs1XBwf4rdGvmZQd8pCIA5vSO4u6dLid0nOeJzIIhTH2TZLFLH2rtXD9jR1IlUENW9Akv29ai_L3y25jAgzgQDc1ivHOc_GrZFFt10u7y
Origin-messageId: <20261106221836.3445-1-romit@romitsagu.com>
Feedback-ID: 77.32.148.58:7631162_-1:7631162:Sendinblue
X-CSA-Complaints: csa-complaints@eco.de
Content-Transfer-Encoding: quoted-printable
X-Mailer: git-send-email 2.43.0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3DE4F4063A; Fri,  6 Nov 2026 17:18:41 -0500 (EST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=romitsagu.com; s=dkim; t=1794003529; h=from:subject:date:message-id:to:cc:mime-version: content-transfer-encoding; bh=Xlywh/A5GtLCtifpFseekBFA0sryMULQdDy/KRtRFDA=; b=LeBoK3iV5UQvZCnPfFKbKBR8QkqZDoLVXUbJ/vCydngFGoSxzUu0oT1eICvM0OlR1Pa45Q PAIFTCIVMNK5MTAdzHNNipnwERs7ZlwXJxrk2zVS2Xyb0MVs2ZG6Ujau2Y+PyHumkZdp90 FU0DrCWZVa129R5pGgei4sBjAua31JQZzFFs0DH5VCuKMU6+xwvw40R7NI2ZGB/mpyQvy2 dlE4jaGpRQrNdnJE2iToMpdyPFz5bQN/awKvmVoWRt7P1SKTQdWIgabK60ErIts4c+cvdw q8/GZTX/KQn8ldMou4I7WspT9oJD5sY41jzkTFxAnNN8y8NAKVpTZYasEB5ZmA==
X-Last-Tls-Session-Version: TLSv1.3


This XGS-PON ONU stick (vendor OEM, part SFP+ONU-XGSPON)
needs the same handling as other Potron-based modules. Without it,
the module fails to connect and the kernal shows these errors:
sfp sfp1: module transmit fault indicated
sfp sfp1: module persistently indicates fault, disabling

This module requires TX_FAULT/LOS behaviour and boot delay tuning.
Add a quirk using the existing sfp_fixup_potron.

Signed-off-by: Romit Sagu <romit@romitsagu.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
v2:
- Move the new quirk to be better sorted alphabetically within the
  OEM section and next to another XGS-PON ONT (requested by Jakub Kicinski)
- Added LOS in the quirk comment (recommended by Sashiko)

v1: https://lore.kernel.org/all/20261103011849.181392-1-romit@romitsagu.com=
/

---
 drivers/net/phy/sfp.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/phy/sfp.c b/drivers/net/phy/sfp.c
index 85e57a16bb52..915156743701 100644
--- a/drivers/net/phy/sfp.c
+++ b/drivers/net/phy/sfp.c
@@ -638,6 +638,10 @@ static const struct sfp_quirk sfp_quirks[] =3D {
 	SFP_QUIRK_F("OEM", "RTSFP-10", sfp_fixup_rollball_cc),
 	SFP_QUIRK_F("OEM", "RTSFP-10G", sfp_fixup_rollball_cc),
=20
+	// OEM SFP+ONU-XGSPON is a XGS-PON ONT stick with broken TX_FAULT and
+	// LOS indicators and slow startup, just like potron.
+	SFP_QUIRK_F("OEM", "SFP+ONU-XGSPON", sfp_fixup_potron),
+
 	// OEM XGSPONST2001 is an XGS-PON ONT stick with broken TX_FAULT and
 	// LOS indicators and slow startup, just like potron. On cold
 	// power-up the EEPROM vendor PN field reads back with non-printable
--=20
2.43.0


