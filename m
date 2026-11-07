Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794057221;
	b=zBweXGX40eXSh5v3CO4Qi6JpCVvy/cjoJgWnEd4DYX3/s+qSPm5SN/QAnAeZ0wRmV9PS
	 bAkTTPrMuxNCHprTyxyxrN8oWZIbFjrWNJy3Ek2D0xudmrcikOekcroSSpNmJCC6wVzE+
	 SFJ3h0KZE+0Px31qPDRCnx6tX0FwcBt2iUgHrn2jhRAznYq8b6izBiV3A9q5ckAAGF8DB
	 9DqyO0N4ryhiAhySv+gaSYscmhio60g9QRFDarFpembvNOgPQr3fMU2rVRBVEA+sT663G
	 eAjW5UN0e8GzrA4PpujSf5vqbSC+eUWu+/Pp/0eFQjRSDt5b3KUqfmg0cvQXkfM4aUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794057221;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=Ck14fKV6LP02+4pNJEFmV4SbeAH9q4KUqAqJ8rl5z8k=;
	b=KSHThMBTrLITZyJybMdMlnA0S9AnIlf2wZuQMNxmhxR66cAnWCriN1bdSEdnZl65IfPS
	 FeKz8jj2M4yE4g1jQhG8UsPtX7dkBKnCodH2NvqMgNoxtmlYWzCcDQr+nHzfhGi9+NKD8
	 tfqQgiHnxGPy1fxSUOynXqqgnX7sfHf4QAyPa+sbF6+5l+ZBkZGb29h3Vdyvo4tvqfeev
	 JUOWa60t/VVQ84xUEXndlkkqpYHFT3kUy2PYqLEWBg3gLwokrSkvKlenP0FJvZEHlG8R5
	 pRyzIueER/EnDF8J9vwqi+6zEhIFN77FqhvcGK8caguodxBZ/oB+5l5p0yk8DBLyURQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vysbNISz;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 581D5606A32D
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 13:13:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 581D5606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vysbNISz
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4b7252a32c8so13190675e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 05:13:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794057220; x=1794662020; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Ck14fKV6LP02+4pNJEFmV4SbeAH9q4KUqAqJ8rl5z8k=;
        b=vysbNISz8SzWFmHI7OcsIgVE/V/ABSV+2GuqrFioIU8vzq1zVTXOrd25yYMsQGul9y
         IEto4XwlcWxPi87QSsB987nCN8kie9R//K940kp2cy4w6DGnnusCyWiKypiGT0BosmEK
         k5hRpohwrzdagbuCUHEuGHglN/d/4vS2TmukSYXpzdr+2SZzmtkZHqLmc4kZuEjaDeUX
         XslpIvKrRJ+13BcESV/cnCaiDh7rnm5AclHVYWdWPQ47JMwWb0M68A2i4c3+TVsyOqtQ
         MNaCauf99Dry39oFPQdwQZw+o75uxbi9RVSDmZ2KrCIvyH5J9NjIVPMhm/dxtrbOtxbn
         Je6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794057220; x=1794662020;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Ck14fKV6LP02+4pNJEFmV4SbeAH9q4KUqAqJ8rl5z8k=;
        b=JzlAgcNeW4bVnx7PnkXR62eUekc6BV+0dDZNME3oEu7ITL5iYVicFRIfjYPlSh+uVo
         B5MwOAC/TAlu4rGan9Z3OB9FzudzuZEDWM4mvUmy6rrfx7GKwu1TB4xV8lU8xRL+xyV5
         52IIymQBt1jRTg6F4ehTb7+mCQ7pT2G0tktY4/iTroFj6D6Jvrz7fV5sOoHcpIihK0L+
         2uWRpDqCu231AKwadL6xX4ZKMdB2BChueJA1GI9dxVWfK9eHorlvnW9Sja6b+V9dRWX0
         wZMulQZQl35qcwnIION4FH0T9xczS/7E/z50P1scGU+Zwx7aaAY6pkmydhHnYVhqDU9H
         wi/g==
X-Forwarded-Encrypted: i=1; AKwUvBwRYeLcCf5mx51ExMTadLwcCVZLNPAWXrIkM53YMRJ4zgsPFiHhkm9KjRdODADbauYG3vqqv5K/dDDQp9k=@vger.kernel.org
X-Gm-Message-State: APuU4Z+qUu9kvkqiM4pn3uO20MqHP9PWgJBgjPS8KUlfSMrFQOh89Pse
	2JGfK3bCB6OTxpujTJRchVeBVkJ73/CtJas4Ps9INnUYLBw3mjBeKPV1
X-Gm-Gg: AYBFou24ZZ4qho7fFds72ZoF8I7kOi0d4YkNQeTkDgzP0MJBD3tZaWvoupqrcs57PXD
	4IVt0yJayNinh9ZhWb4IGEBIZxm/8JugxKHZsq/hSacuObunBdaZ2Z365pZX2SnfYlS3zajoiCZ
	k2SHVrKcw8oDj0VML4Q1oF8m3jGp1tVeDEQP33Tv9/z3jbdCp2HPXeducURbbc3KW52D2EdsjgX
	DqlhA9QdCWWizNyNzf7UDlyyBUwk07pR9mKs1KLdnva7tlxYb0Enjp7xxyodIzJEJ2jl6DZDU9v
	L9jhDkygami7tzNE0xfdx/sx88I33wm5Y8FIw7h53pa5AF/7nCLpgYPqHkfs7w4pX2puglxhoDT
	tB2rhQVVPKProvRZOVncdQm0XXEUVw4w+toaRDggwFMaxSVhiH428diDuxQJL+8HAwa27Habmwh
	sTeHiZWAISigCS/4iBFNcZ7AhCYQvGX7g55M9IlE8350Q80644VNAn+OyAiOAhBN8QmOr/VQbg+
	Qiu2uUYnYy7EevLAqihK9/M3bvQbFJIWkEXcWn928ntHr5rrVJod9HYGmxwJqeSCkugJswIYuqJ
	0zlJcLqKbujXClcJbnCMCqwRvmSsZldfdg1a8XvX3ke1ImwWk/DazouZfcwhcEiyotn8xDdUa8A
	PPpJgQW7UWJFcowYRJUcLIb6n7cqJqq10kvggC+aMd6CWnysGx+5dWcnN3e+ik0rll7I=
X-Received: by 2002:a05:600c:6994:b0:4a0:1fb9:2f51 with SMTP id 5b1f17b1804b1-4b6df11de39mr98136025e9.14.1794057219338;
        Sat, 07 Nov 2026 05:13:39 -0800 (PST)
Received: from PC-Marco.local ([151.59.49.14])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e2e9ad95sm64282305e9.3.2026.11.07.05.13.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 05:13:38 -0800 (PST)
From: Marco Ziliani <rylos78@gmail.com>
Date: Sat, 07 Nov 2026 14:13:30 +0100
Subject: [PATCH v2] ata: libata-pmp: disable the SEMB port on Marvell
 88SM9705
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261107-pmp-88sm9705-v2-1-18eed983d3db@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNQQ6CMBBFr0JmbQ1TKAVX3sOwgDqFMZaSFomGc
 HcB1y5f8v77C0QKTBEuyQKBZo7shw3kKQHTN0NHgu8bg0xlgaksxehGUZbRVTpVQlqdY5tnymI
 B22QMZPl95G71j+OrfZCZ9sZu9BwnHz7H34y79yc9o0BhbKXQks6Vzq6da/h5Nt5Bva7rF/qbB
 xG6AAAA
X-Change-ID: 20261028-pmp-88sm9705-2f741b435f16
To: Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>
Cc: Kyrylo Biryuk <illofspeed@gmail.com>, linux-ide@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Marco Ziliani <rylos78@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794057217; l=4258;
 i=rylos78@gmail.com; s=20261027; h=from:subject:message-id;
 bh=1bZ0/g/Vqj0TVjKKgVi14x/QhYjtWqwjUDv/wvKppsM=;
 b=yXxfwA1Y8VSA1X8Ye6NPG87dZVzkjbfYENcw35RNXLaGSsA9OXP6rmIMkNGKpSr1PVgwY1p4A
 s6DSuuJSftKBL9Gzz7JNyMoT1pFyrci2879OTsSivs6lterDy04biLp
X-Developer-Key: i=rylos78@gmail.com; a=ed25519;
 pk=nXCfiK5yExPZCMp+lfKif3gdXkfjkUK2qk7bDW+ixMo=

The Marvell 88SM9705 is a 1-to-5 SATA port multiplier with one
additional SEMB (SATA Enclosure Management Bridge) port [1].  Ports
0-4 are device ports and port 5 is the SEMB.  The number of fan-out
ports in GSCR[2] is 6 when the SEMB is enabled and 5 when it is not,
so on boards without the SEMB there is no link 5 and this quirk does
nothing.  That includes the common 8-port PCIe cards that pair an
88SE9215 with an 88SM9705, which report 5 ports.

The SEMB port never answers SRST.  libata probes it like a device
port, and every EH round on the PMP ends in a retry loop that lasts
about a minute before EH gives up, then starts over:

  ata19.15: Port Multiplier 1.2, 0x1b4b:0x9705 r160, 6 ports, feat 0x1/0x1f
  ata19.05: hard resetting link
  ata19.05: failed to resume link (SControl 0)
  ata19.05: softreset failed (1st FIS failed)
  ata19.05: hard resetting link
  ...
  ata20.05: reset failed, giving up

Disk discovery waits for this, including disks on other controllers.

libata.force only partly works around it.  The "disable" horkage
only takes effect after IDENTIFY, which the SEMB link never reaches.
"norst" on port 5 stops the retry loop, but the disks still come up
about a minute later than with this change (see below).

Treat port 5 the same way as port 4 of the Marvell 88SM4140 and mark
the link ATA_LFLAG_DISABLED.

Tested on a Synology DX1222 expansion unit (four 88SM9705 r160 behind
a Marvell 88SE9235, passed through to a KVM guest, 6 disks), 7.4-rc1
with and without this change, one boot each:

                                    softreset  reset failed,  last disk
                                    failed     giving up      attached
  7.4-rc1, no libata.force          60         12             197 s
  7.4-rc1, libata.force=N.05:norst   0          0              70 s
  7.4-rc1 + this patch, no force     0          0              11 s

The problem was first found on a Synology DX1215 with the same chain,
where this change brought the disks up after about 20 s instead of
about 200 s, including a disk on a separate AHCI controller.

Each PMP still logs one "failed to resume link (SControl 0)" for port 5
at probe time.

Link: https://www.marvell.com/content/dam/marvell/en/public-collateral/storage/marvell-storage-88sm9705-functional-specifications-2015-06.pdf [1]
Cc: stable@vger.kernel.org
Tested-by: Kyrylo Biryuk <illofspeed@gmail.com>
Signed-off-by: Marco Ziliani <rylos78@gmail.com>
---
I don't have this hardware myself: the problem was found and measured
on a DX1215 by a user who preferred not to send the patch, and Kyrylo
has since tested it on his DX1222.

I used an AI coding assistant to draft the patch and the changelog;
I reviewed them and can answer for them.
---
Changes in v2:
- Say that libata.force "norst" only partly works around the problem
  (Niklas).
- Use Kyrylo's 7.4-rc1 results on a DX1222 as the test data, and drop
  the references to the downstream distribution (Niklas).
- Mention the DX1222 in the comment.
- Add Kyrylo's Tested-by.
- Link to v1: https://patch.msgid.link/20261028-pmp-88sm9705-v1-1-cf951fe74573@gmail.com
---
 drivers/ata/libata-pmp.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/ata/libata-pmp.c b/drivers/ata/libata-pmp.c
index 904f418387..43991e54eb 100644
--- a/drivers/ata/libata-pmp.c
+++ b/drivers/ata/libata-pmp.c
@@ -482,6 +482,20 @@ static void sata_pmp_quirks(struct ata_port *ap)
 			if (link->pmp == 4)
 				link->flags |= ATA_LFLAG_DISABLED;
 		}
+	} else if (vendor == 0x1b4b && devid == 0x9705) {
+		/*
+		 * Marvell 88SM9705 quirks
+		 *
+		 * 1-to-5 PMP with an extra SEMB port.  It reports 6 ports and
+		 * port 5 is the SEMB, which never answers SRST: EH spends about
+		 * a minute per round retrying it, and disk discovery waits for
+		 * that.  Seen behind a Marvell 88SE9235 in the Synology DX1215
+		 * and DX1222.
+		 */
+		ata_for_each_link(link, ap, EDGE) {
+			if (link->pmp == 5)
+				link->flags |= ATA_LFLAG_DISABLED;
+		}
 	}
 }
 

---
base-commit: fb2c3f44a7e14627b9dca8e6b568e6cdc234b40b
change-id: 20261028-pmp-88sm9705-2f741b435f16

Best regards,
--  
Marco Ziliani <rylos78@gmail.com>

