Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793780734;
	b=i9W1+K3JNSv1S1vBVtGcH3KbqIWCVHDrDVUiAnRJfDo4ya4yp5kmF1Ob4w9yLJyCUNZT
	 xIY0x9kZKEKzKHN4FpNSciug7uc37fMgFO3OBbvezNTRU+/q/yRRXMMnXaZ8blJm8kFYk
	 wV3Dgf51R6dXAKDPFaE7ghIZkG6hIjqJVCVnmtipy9LfJUgElcilcW2OPFQLlUPT790xo
	 vmgVRn61GVY6bvSO33ygyEGDrewDO9dlghj6jytso+dwYHQPGU9scalkKT/QES6SHLUzr
	 G8bLxY7HHrhDGbxfrmh2A5JSj/c/kmx1jOYsUWojMn1aBdI4h+GAVBv3Ns6MBIS2BnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793780734;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=YUgy6QisfbO0Ff1caes8uOGp4z1pNB6eutk+Z/JiFus=;
	b=nWYKvXlGvfkFtd0dMG+zYpG3uUX36ROId8JTHrFZielB9ljTgrNyVtcuR+qoFkzvRPZY
	 wI1YlG1eaR5Q8Al4VdHY4VEa5i6aTMgSedRCBpEs+mzrokqRAPJoI/CVSznjJNp3juzYy
	 BHgcw7thr7h3RxYiVdJi96PO9FUG6vVVqxOms9FkOuI/vfTpRTVErGyxzAPZYe0pY7JX/
	 2hG3RP2zJrDciRgFXkbpykeehnFNDiEkIcv2hDP4MmEmq2gRMAHTyl/9kC8MwLDFma+83
	 P+2fkhUtV/yYOziPdUW5Xr8qiy3OLjjYGT4/+Kz+clwYklS4wTpSoGwLI+r4ehhHhtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Tbiu7CRW;
	arc=none smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41DD6606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 08:25:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41DD6606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Tbiu7CRW
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6acb57c2b88so495588a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 00:25:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793780731; x=1794385531; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YUgy6QisfbO0Ff1caes8uOGp4z1pNB6eutk+Z/JiFus=;
        b=Tbiu7CRWgD+/9m3CNtgdOnD0RLzxojVz8GkGmenqWLg18iTt/BEiVanrxcWWPzP09b
         ur79v7mYhm22QpAmlOwx7P6sKcZx9Sxf6DYdVCtfVhIRrDiTv1il68F8UYtDeLz0M3Ug
         cpR4TldbDnreSarMLpeJICk+KZmvs5bSE8TqhLyipC6wWt/1Ss5QdL57JXh7A9lC4jrw
         bReIyXUBW8A83jivw78RAmu2rpFuUKsKZdJfgg3veFBs9N0D1QBslHYMfMH1ZHn0wvpw
         IfLv43UPY++WjdO4x3u522bwgZ3lc2UHewGJXOlijB0CgO7WvcNYKifnwHtm8vqlXdYh
         mzMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793780731; x=1794385531;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YUgy6QisfbO0Ff1caes8uOGp4z1pNB6eutk+Z/JiFus=;
        b=QR0+k5UXomxhfWkF/syK7vNDH2YQ3QyGJvmGQRNnhky0ni8ib4AMXevMFs1dWm0IzZ
         G41oFLMakrN9Dp75dgKk8pE+o+xQM/WgfkCLVqgNG8ahSqq0oM0bhyAskLT2lqQXHGDu
         uOqbojvnWW5AxdKQBVLudh6zdUFfuLbjebp/bs4IdQSx/umcl3bc2y7PJUyMjEEiOm2+
         vp+sPJwR6p02z4HsNaXdMRpj0qRrMa27o3iuXXsdv0eybYZZ+goHDHu2lWu3oG9g98mC
         PZcBRokCJsJcHILhdES70eXYM/A12A7+NgPRUZXOxnkBdRT/jGpTbXiR7SCMjFwNfV2R
         JmZw==
X-Forwarded-Encrypted: i=1; AKwUvBzHLe377SIPqRyBA5Xvc8ewezi5kytwrcn28ZyjRwF59phq3a5s2Sjr1k1rCTu9lAtVmuoxe5L0O+f3xaA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9kQAGg/+QL5oRWiCpoMb6ey7b/LhNHgw8mreJJBq0jiWqvE1Q0
	EG6cAdABxbbeNySTTi09ynDw6PZNZGqmh6uuQyM2H8z0oSSDy9vRI9iO
X-Gm-Gg: AYBFou0WTZOGZuyeZKFcrMRdBJn1r1q/ji3UjQO1gFpdzfnb+mrYCB42uU/xn0wjSIa
	AVnGDtApTIvOCCnAuzruA5aiKBIP+6qYrs572Sa9zmNzUavjpdviD7XFxcL3CWVaVsZKjOFg7Wh
	4EAQO4M9pZHMK8i9hVEJLQ9KVQXDMfFTzPjTaWm1/Vj3zJHBZFP64LBDBeMnFsmHisAhZFjThkW
	c2uU8OHLyJvbMLM/ZbspAGKnWW9XibEvHjDzpAphKBpZ1eYzcC394EXMaexdtXLXYtd0gHT0oSy
	igPnYiksQnoQ7f/QfwheD+lJPHmU9VDlql4Mrl+1YxoTGZdAgZTYEujYqqJu6IXAuTVE3OnmSUO
	ygVfTAQD+A5genMuqH4mKYhBqQnBPbmiJrjPdY8Gq7Klz4wJ6Rm456INc2xdATDDPqHgzxia+Jz
	Q4/CCXLAVMRUTsLrQ8IDQegfbvOp9XkG/cEkaI2Vqiqs9w62ee0a1yLvjLUv5yeA11C51pW2uJh
	2ljvbF0n7q+LuB8cqHUr6k3tNwdL5jCPK0Xr/t9SU8epd3fMrblUrMep4r5tAyJfhWTc8DIcKpY
	SIhyF6hDOqxIQeFk1ZJyCmsAENyfMdqJr/DTQdtvcOoAFhf817rEcDLIGzJ+dB1M+grhLn6CpiT
	lN+I1bwhKVMOIedZ0bxc6JqXHeJ2aKrkpb6OQCGett/vjE2nIHWBAw+Vxscz1JeTbp4+x7qeNu7
	ObZxaTO2eWrBbRgAyvRo/Cvw==
X-Received: by 2002:a05:6402:234f:b0:6b4:2960:d383 with SMTP id 4fb4d7f45d1cf-6b4dcc50022mr12617929a12.8.1793780731417;
        Wed, 04 Nov 2026 00:25:31 -0800 (PST)
Received: from desktop.home.arpa (2a02-1810-1e16-ac80-48ed-b9ce-6098-90a2.ip6.access.telenet.be. [2a02:1810:1e16:ac80:48ed:b9ce:6098:90a2])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b55ac81386sm483243a12.29.2026.11.04.00.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 00:25:31 -0800 (PST)
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
Subject: [PATCH net 0/2] net: dsa: realtek: rtl8365mb: fix FDB lookups in VLAN-unaware bridges
Date: Wed,  4 Nov 2026 09:25:12 +0100
Message-ID: <20261104082514.2139278-1-stijncleynhens@gmail.com>
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
to v7.4; the code these patches touch is the same as in net. On an
RTL8367S-VB (TP-Link Deco X50-PoE, with the family D series applied): a
station learned behind the uplink that moves behind the CPU port answers
10/10 pings right away, its stale entry replaced by the CPU one, and
switching VLAN filtering off and on at runtime keeps traffic flowing. An
earlier revision of patch 2, with the same logic, was tested the same way
on an RTL8367S (Deco X50-Outdoor), 0/10 before and 10/10 after. Both
patches build without warnings with W=1 C=1.

Note for Mieczyslaw's RTL8367S-VB series in net-next (v8): patch 2 adds a
vlan_filtering argument to rtl8365mb_vlan_pvid_port_clear(). The family D
path that series adds there reads dsa_port_is_vlan_filtering(), which
still returns the old state while filtering is being turned off, so it
should take the new argument instead; otherwise family D drops untagged
frames after filtering is disabled. Happy to send that as a follow-up
once both are in.

Stijn Cleynhens (2):
  net: dsa: realtek: rtl8365mb: use IVL in VLAN 0
  net: dsa: realtek: rtl8365mb: keep the neutral PVID in VLAN-unaware
    bridges

 drivers/net/dsa/realtek/rtl8365mb_main.c | 147 ++++++++++++++++-------
 drivers/net/dsa/realtek/rtl8365mb_vlan.c |  40 +++++-
 drivers/net/dsa/realtek/rtl8365mb_vlan.h |   4 +-
 3 files changed, 141 insertions(+), 50 deletions(-)


base-commit: 787268686c64be60023743b527645a907e38ccca
-- 
2.56.0

