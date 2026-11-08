Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794166174;
	b=G9BPbOnhrAKaX6ZYXG4FbnovysYaPeJN5EW7tR2tc+nKpBhhG0IMTtnxEmiToIqWHUrj
	 jw4YSIxXaK4QPXdEn3355To/FZUi6eInbnxWX4LNpO8iC6j+LGdZ/SNdCIwyiKvRe+w5J
	 Y+lNkAA92Vqxl3Fj/xoGo3RXxtrZhuU8wxxVhjnmhYztWMU7taQspLwS57+WfCyDMRtad
	 tbzG3TvnjdRazn0tTtGr8qj34jsTlmTCc4Pd+jR7tL33PgARJfRAncc5RRXX9ZDGqDb/7
	 C+etlo1Wxe6P58heB7tgrRp/b2Icl4gkfmadS+DjKCu99ntflibwWXuQz+fzQCNgDOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794166174;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=OAjTCjU59PATyZ/IPC1r20+cOIDCc27FKXqTgrZ3hjI=;
	b=wqX0BRYkPsZomsw5FN/Lv3igkgkwOYZZTcQATMh9SRhMo13dNaS9rLnyBbVjnb6zcGAp
	 3HDJY9Q+luDjjphJqmjiy4khSPaQqLKO7U4qGZ8SDYdMxjAR/j7sgaynQ1DexB4SjBTuY
	 wz+ZvbUgqC599ePcz9ty04zY+Qcc3r04EHumw8Ip3d14wTmNLc2qXK9n9rnCNBe1e9nPE
	 /S97dOZKMupLIRbDQHFMJsQKUqFwf1ly8WSa5iB8tyniYlJposiAV3NGLawjs46aeWDf+
	 krYcJq0w59T2llYtcb+GdvNu2UH7xdz4I3yatC6X2yaw3qpyUfLl2Rk3xT8oIoMVEDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Tsk8jaZ/";
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33FA0606A321
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 19:29:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33FA0606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Tsk8jaZ/
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1af971cd9f9so14236c88.3
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 11:29:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794166173; x=1794770973; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OAjTCjU59PATyZ/IPC1r20+cOIDCc27FKXqTgrZ3hjI=;
        b=Tsk8jaZ/bDWD3tcVK3SnIRa473lFlDV8MexVW1PeG+5grPrB7fFhGSj8MYSpDBzSKN
         g+6qnR2BMrMsIaNo8FGnuzAiIB5lpqZKeimcpdkzNNGfkosOFJOgZPUhmboKBxJ3bGfi
         nY8gxc+NNLPWrpb4lbsRoOaFlKbuf+iCcyGn7tX5DIY7luv9lKf8d5HNEkuEg7IC8g1j
         Ff2vK4EnPxAfTLLLuLEol+52cf1jw5Dbs+eiP52v2sb5ORIKiFANUiwNvU3xKnmCfipa
         MlCEdGK8yFe9Bq8Bef3Ml8Fs8HDASbdzfLKKGlrKXS7oBZW8KE/wpn5xuBsEuBgFZ9UC
         ptUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794166173; x=1794770973;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OAjTCjU59PATyZ/IPC1r20+cOIDCc27FKXqTgrZ3hjI=;
        b=SCFrM7XTxYlMVIeVuKFFQpRBZmh0kekNmsSJ/NI2bEwLZmBv4ZXdp5RuTAFANUk3qp
         pRAhI/c8TbiuUZVOOrxB9wr6Bw07xdIpZPLysaT4TqIorb2TgCQN5lcj2PhaZc1ky3e6
         EJjvQQvMeA1rqgJWtq4OyeTGEqk8ouu4m5OrWL3lYlW/70Bzp9bLi5KT6oZkGarl2Oir
         805YpnyMsFRMuN6QKVC2gYTSvS8U8tajQiUNy0Lh2uo66FW5kHZK2JfdfxwQj09SnxPE
         s2/fo8vgfCGGyV08s+V+RJ+JvRMPGxeM8/L9PUPFO51pzwX+NVpX6HP5jZ8w7QP9ziiF
         Lg3w==
X-Forwarded-Encrypted: i=1; AL+hErEtTKO5xh5egm4HZGIK2MjNCpRbg2e2LOyj3E1wuOD5MIm8JeZtfjXU9lxKSXpzXKYCo+VsFq75ziUd4B4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8jfu38OmbvnZdoFHGv7RO89mCBpr5+Uh1td1ic+Kyod81lAlp9
	eHBRSo2EfOnd3XsXJzgnaWnl/+vIfMLlyV4OfJkj+YOxzy38zLnW6Dln
X-Gm-Gg: AYBFou2iP4YGbI9xpJIXPcxVQU4WCUtl3QJZ4R+VVd+KVrWqJy5uHLxL6i/A+1qtijB
	SVo6Hy+ApCQzDCFIR1DKbH+91OMITW0qBhL6XL1bfRPnXhIPFxHCXa8DeUKGAiVIu6k6bCbjXxl
	2zN0HswWZSLXQxnN8XmyXTP4v/4BW1+Bl2JKNcne6dlg+U7CI61o4IXZWB3O0XQDF77Nq/AWTES
	w/HwrQ0l2zuf0XjGc7vxzYv28Dm52WemA1dgofjq9eJVVafiVqLi7h1WwlC8hTuL7oDciaNi4Qz
	FqFZZ270sXVIRGvMQeKprG4eh7nYujrjhXbW1NxqaoBKnTiPzKBjf65JjnVAZM3RAUf0pxDm65R
	l2Y+KIu7RNa/JYJLJIQ2dXuSpwMHkpgomi1SMDqCFEvbSKqeuNXHts2HRNhZxZiVBxKpMAc0fzL
	xZOvgm6DGIEqEpY0H7ZfygRQaQnzwaCwQHiaAYyKuUXIqxx5fVA9xEcibznx7vruYofD7FJ0gyP
	uIrJYmEZr73MZw2mjMBFFtt8XWLps1KCyp/PkX0QymxNLdFD02wPleMjPA6JDme/zl9hewrWZCY
	fKOtQRyOE35fRBSA5I+augxTxIuVIH0XGhvdtzKig2W9j0TW1bzREtfG4gT4Ng==
X-Received: by 2002:a05:701b:4552:10b0:143:5c2a:e45f with SMTP id a92af1059eb24-1b39fdaf96bmr5061989c88.0.1794166173146;
        Sun, 08 Nov 2026 11:29:33 -0800 (PST)
Received: from [192.168.1.11] ([2401:4900:881e:93af:b6d8:a723:b13b:3c1b])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3755eb6efsm8800387c88.4.2026.11.08.11.29.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 11:29:32 -0800 (PST)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Subject: [PATCH v2 0/2] dt-bindings: arm: omap-l3-noc: Convert to DT schema
Date: Mon, 09 Nov 2026 00:59:16 +0530
Message-Id: <20261109-ti-l3-noc-v2-0-509e8485a1f3@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/02NQQ6CMBAAv0L27BraRgOe/IfhULYLrAFqWmw0h
 L8LGBOPk0xmZogchCNcshkCJ4nixxX0IQPq7NgyilsZdK7PKs81ToK9wdET6sI1ZAvVODrB6j8
 CN/LaW7fqy/FZ35mmLbAZncTJh/c+S2rzfl3z100KFZa1UwVZMobLaztY6Y/kB6iWZfkAlTM+G
 LQAAAA=
X-Change-ID: 20261002-ti-l3-noc-28dfca81fdc5
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Santosh Shilimkar <santosh.shilimkar@ti.com>, 
 Sricharan R <r.sricharan@ti.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com, 
 simona.toaca@nxp.com, j.bhargav.u@gmail.com, linux-omap@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794166167; l=1249;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=K6eNGCEmoAmi4nk9SdcQuMxZbbIDLpxuaZ3Z3g7Mvjc=;
 b=k6VrIzg4IlUrfH0wtgd/Rbtm22qUDGqnR/FcbVb/nmGOY8v7B4sz+3m8fvb+DOOVQBjDyilxI
 VImtW87SNqrDkaNLRnIRJMO95m7fWCC+bV6iok1BX5rAw98GeBM6tsR
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

This series converts the TI OMAP L3 NoC binding from text to DT schema.

On OMAP3 the ti,omap3-l3-smx node is deliberately modelled as a flat
simple-bus for the whole SoC,so  schema allows child nodes for that
compatible only. The NoC variants AM437x have no child nodes.

Patch 1 is a DTS change and patch 2 is the binding change. Patch 2
depends on patch 1 only to avoid a dtbs_check warning on omap36xx
boards.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
Changes in v2:
- Move binding to bindings/bus/
- Rebase to latest mainline rc
- Add unit address to regulator-abb-mpu node
- Link to v1: https://lore.kernel.org/r/20261003-ti-l3-noc-v1-1-9bd18cac33e9@gmail.com

---
Bhargav Joshi (2):
      ARM: dts: omap36xx: Add unit address to ABB regulator node
      dt-bindings: arm: omap-l3-noc: Convert to DT schema

 .../devicetree/bindings/arm/omap/l3-noc.txt        |  23 ----
 .../devicetree/bindings/bus/ti,omap-l3-noc.yaml    | 153 +++++++++++++++++++++
 arch/arm/boot/dts/ti/omap/omap36xx.dtsi            |   2 +-
 3 files changed, 154 insertions(+), 24 deletions(-)
---
base-commit: fa4ad798f6f681031775266044ba1b0cf3c670bd
change-id: 20261002-ti-l3-noc-28dfca81fdc5

Best regards,
-- 
Bhargav

