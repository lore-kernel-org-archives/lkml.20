Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793977353;
	b=px43pMALfGMD1yad+L/H1vtWU3pP++wimWBGgdLzTMauZWtCYaAkq5C+g7pXpa73g6nR
	 8Xd8QW/nROCKhIObm5H+mHMmzvdRC2er4wbv21up2qy9uDWXlCZsAJBT/NUriuxfcDNGU
	 VVnZbdWyMhImgbTYJUbaxofQV0vf6Juzjp5TgSAOzguz9CUAIghOPPTtIY2wbua5bSWah
	 HIuFCfknA4Wy20EVWWp76UBk7nhgNYAkLb6vuaaFTTLLGzL8TKsdbCWZXARokaWZoXLJH
	 i6uNEjIFcYJu9LtgkaJOdRiYxjuCwVgraWLfAKO030+4XfhefXUw0dUAv5GPDygkYQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793977353;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=ivDi103aMzN/RYAG1NnirSPo+83ZQbk6RdxH4xYelZQ=;
	b=i6F+oYRjz6La9Vd36yl7vq9NJ2KGyTWlG5/2blM/1FP89n9aJCKm6r0yR3+K66bD6qVR
	 +oXZDPC/4kZ4YHQ54QSabvxurofJZIjkEMa+w2TOaywr1oC4USF97DOjD/2uuZluvwW24
	 qE5IMOZLKHXO6v+yrJYGnX6EE0D5lr8Oq0c9Vd48Bn2x0xApfIk8njCt+5F+NU3F1b2qx
	 HqGDxGt9E095z2voxxr/M32GQMXq97sURbOEmy04zM9WVk5PMafIs88ac2MadyU7vAzke
	 ujrAyNKfr3irThsG/svpwnS7eRXSSe7+l+ubF6ar7E3bNLFhA5KJmKbJxGJ7XJc/Ejg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dOpCm78M;
	arc=none smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A460B606EEAC
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 15:02:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A460B606EEAC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dOpCm78M
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c4ceb15dfd7so86008666b.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 07:02:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793977351; x=1794582151; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ivDi103aMzN/RYAG1NnirSPo+83ZQbk6RdxH4xYelZQ=;
        b=dOpCm78M/VPxYuZmJ+Uwj1dorCYRDFb/sSDieAzjFqTTCFx/gDjqfCuioUbQ7MTO1L
         BYTyKhF3MRsF/FMOlQm5MAspqwSw6RiiVC4oe8sRP86Oui7/HyDVPy9a0nzAoViHynmB
         R92Ne2/IbwWMQRXOiaePiFSN/VT9QL7l/WB1urcbvl2suxX/9nS0wAPpRM6V5mtr1nWA
         MzD4BCwVp8Lc0Iep/uYWLwFhuqFAIgemof2I3CLPsJQYf+ETpsKsQXJZDbJOXe/AIl9l
         wjmSgCTqhLYlz/3ZenbtlD/+Pu1rPpl686A+2T3mfGi+KHJr50Tjo4fGLKzzCgcLaR84
         gYfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793977351; x=1794582151;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ivDi103aMzN/RYAG1NnirSPo+83ZQbk6RdxH4xYelZQ=;
        b=eqtgH4d3m35FABanlaKDufb1m/FmCKOKCsvUtr13Mbe6JMrWHrrn8z2KITJvL3yopl
         8uwkzotwmWNHcwYifUx12khzqKJGvPAzAOTh41bmAUTPJDmkLNxu3qlcu4JQwOvaUAti
         +VDLewmX8Zf9F7eoK66fI6MT8R1ZuwKW0R74urbzmrHbpYHz8rV1eKlqBgr2ZgvuGSsg
         WN7Vs7DfAXU8TJB/qf5ExafuU/rD9m80ML14gvlg9qUQanmM/soIE3W2xNuUcZv5lE0H
         fNKvtirgcuBvKXd0bTxRNsKvokJFr4t0jexzYo2jIpFcauV/yqehFORoCQXwIDPdxptM
         IduA==
X-Forwarded-Encrypted: i=1; AKwUvBwEiau16nyoJ1VM0MP9HCu+jI1+Y91hJfxL4N6TYRCE/7TdWagba22h+Vvw0sDEro9Lqn3/TCI/09EjT/s=@vger.kernel.org
X-Gm-Message-State: APuU4Z85SBzr1kUr0hMb20510A48JhN1+7hLeOekKE19aJjG+vDgrrKT
	XMx4qqshLpw4kg7E5gcP4rbebp210PO3NofvgIBWJYR0uRP/oZOpK7BA
X-Gm-Gg: AYBFou0TUveKSFwufsfzz/fMUtTsvu4spjgyw7iSO+8kNLF2zJZ1OFQH6cn23OUTC33
	w5oMts7hyFZxHLK0Y7qTnVe/tFzBnWZ0qls/ifiL3GXah3MHQH5JL7PFksQ0Urn2Umr/jsTJ/u/
	B7jdBvg50kAf5Fk+vHPJyu/gesuuvMrWBjobtcT39VQeG4n4Ae/x8y0Fp9pZErNaBd61/QIUUcp
	WLlf8YL1d81SRggggmwAGr3/XwAZmJGUggMIv6NSE8NE7l65q1rYWCQGbWfNy1l7QjKY20AXMBR
	G692ST/QKKHmG9ZpdL6C7PgHnJlZjqu9MTsQXt5NXDURhhHFcsdzxK7TXz+TJO1CvS3m7zyQYJR
	mNbxJOQoECimi7c4Xc7BXdebY2rrPU4XhhkrLT+MnRfd8G92/uAiFCZ1jzFNh9oP59yqGbxACyj
	gKnPL1rcSVB8eWp0xFxG/+J95TfX/WYC3ABmhP1c1iKcMj+fvU4Sp19opAL+OGnFTTAjcVN5nE7
	RdGIepy8iDDBIbnjpI2B+pJMy5iWx+YEhyE4Pb0Eq/N+8/Om9BZedTV6JXCxv7twvsHh+FeKmBu
	UaJ9Kis3BnNTwhDCCr2J5WapDVzxsopLy6yeXyAUv+uOJBHYU2ybuUHk+aVOk91DAFKvkaPkiUF
	q5JFoe1AeIcsqbKp1b3hd0n0mEFyN1xOSxoIbQvqTDs5mze34VxpPH/mcM9r7+Ki1C0IBLASby0
	Xz
X-Received: by 2002:a17:906:dc8b:b0:c49:cdc8:10cf with SMTP id a640c23a62f3a-c4d35531e7fmr229620166b.40.1793977350879;
        Fri, 06 Nov 2026 07:02:30 -0800 (PST)
Received: from desktop.home.arpa (2a02-1810-1e16-ac80-898e-1938-27eb-b890.ip6.access.telenet.be. [2a02:1810:1e16:ac80:898e:1938:27eb:b890])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d356a2ee4sm84905766b.60.2026.11.06.07.02.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 07:02:30 -0800 (PST)
From: Stijn Cleynhens <stijncleynhens@gmail.com>
To: netdev@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Luiz Angelo Daros de Luca <luizluca@gmail.com>,
	=?UTF-8?q?Alvin=20=C5=A0ipraga?= <alvin.sipraga@analog.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Mieczyslaw Nalewaj <namiltd@yahoo.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v2 0/2] net: dsa: realtek: rtl8365mb: fix FDB lookups in VLAN-unaware bridges
Date: Fri,  6 Nov 2026 16:02:23 +0100
Message-ID: <20261106150225.3700205-1-stijncleynhens@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In a VLAN-unaware bridge, DSA installs FDB and MDB entries with VID 0,
but the switch classifies untagged frames to the bridge PVID and looks up
VID 0 by FID, while the driver installs IVL entries. Nothing matches, so
a station that roams from behind a user port to behind the CPU port (a
Wi-Fi client moving between access points) stays unreachable until the
learned entry ages out.

Patch 1 makes VID 0 use IVL; patch 2 depends on it. Patch 2 keeps the
neutral PVID (VID 0) on ports of a VLAN-unaware bridge and only programs
the bridge PVID while the port filters VLANs. Tagged frames in a
VLAN-unaware bridge are not covered, see patch 2.

Tested on OpenWrt's 6.18 kernel, which carries the rtl8365mb backports up
to v7.4; the code these patches touch is the same as in net. A station
learned behind the uplink that moves behind the CPU port answers 10/10
pings, its learned entry replaced by the CPU one, with VLAN filtering
switched off at runtime: on an RTL8367S (TP-Link Deco X50-Outdoor), and
on an RTL8367S-VB (Deco X50-PoE, with the family D series applied and a
family D branch in rtl8365mb_vlan_pvid_port_commit()), where it also
passes with VLAN filtering on. Before these patches the RTL8367S
answered 0/10. Both patches build without warnings with W=1 C=1.

Note for Mieczyslaw's RTL8367S-VB series in net-next (v8): patch 2
replaces rtl8365mb_vlan_pvid_port_set() and
rtl8365mb_vlan_pvid_port_clear() with rtl8365mb_vlan_pvid_port_commit(),
which gets the target VID (0 for the neutral PVID) and the filtering
state. The family D paths that series adds to set and clear become one
branch there that writes the PVID register and the frame filter from
those two inputs. Happy to send that as a follow-up once both are in.

Changes in v2:
- Patch 1: add Alvin's Reviewed-by.
- Patch 2: replace rtl8365mb_vlan_pvid_port_set() and
  rtl8365mb_vlan_pvid_port_clear() with rtl8365mb_vlan_pvid_port_commit(),
  which is now the only place that sets the frame filter;
  rtl8365mb_port_vlan_filtering() no longer does (Alvin).
- Patch 2: one variable per declaration and an explicit else (Alvin).
- Patch 2: commit message: say what "the VID of the bridge entries" is
  and that the per-bridge EFID keeps lookups local (Alvin).
- v1: https://lore.kernel.org/netdev/20261104082514.2139278-1-stijncleynhens@gmail.com/

Stijn Cleynhens (2):
  net: dsa: realtek: rtl8365mb: use IVL in VLAN 0
  net: dsa: realtek: rtl8365mb: keep the neutral PVID in VLAN-unaware
    bridges

 drivers/net/dsa/realtek/rtl8365mb_main.c | 157 ++++++++-------
 drivers/net/dsa/realtek/rtl8365mb_vlan.c | 233 ++++++++++-------------
 drivers/net/dsa/realtek/rtl8365mb_vlan.h |   7 +-
 3 files changed, 191 insertions(+), 206 deletions(-)


base-commit: 787268686c64be60023743b527645a907e38ccca
-- 
2.56.0

