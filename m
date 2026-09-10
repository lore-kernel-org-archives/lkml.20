Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com [74.125.230.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF0848EC84
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 14:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789050286; cv=none; b=l3Y8gAKVoFHHQq5i9/Axpmjuki8fKle6TYwgx5LDDgeBb82IRwf+N997/rdgFZ/sJXIVNdha8PNRmKTiIP+4PQTbXaQGqZWiLsuvEIGLajysAUd1qJxP5cV2EAdSxA3Tcbt7wX3gaPUJeE14rY7V6PtxtE+P1rW6JXC+GSV+YEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789050286; c=relaxed/simple;
	bh=Nay3LPpHkzmUOR2yFLIxbZK/j+WBUazFJ93AhqK7x8s=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ucPnBfCd8VOoZ8U2sUw3y0bOltlW6BwPlporV+6OKswZWJSCxAcvJgXMKGQDgF/T6KLryjSMjlsLDNJe+mj9bdOZ+qLTKq2X6k2EkPQsgsIB7nfQaKRHnjbZHydR8J1euTatjm5esCiz8By/By8LrKnK8L8m9BkSFNyAShcxbYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pvpEsTDi; arc=none smtp.client-ip=74.125.230.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pvpEsTDi"
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a59bc470d6so5045231fa.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 07:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789050283; x=1789655083; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yU5rOk6h8bj4CbQ83n6GeZ2/DFqLMn/rBfdmHQNe++Y=;
        b=pvpEsTDi23njYkF5J3Ai9oGFjEK8aaaKMy7TTJcK+tRTV028X1Xln2c8Eqf4TFnib8
         Otg9RsGk9zT++xJTxwDc9c9NhWTDf/6giZatUfrx6R1rlxR2+DWd2rRLlNRGy8hBZ+dX
         3i1YNsgD4XzjGhblR6B8fDVsUbyKcvOicRVX8TdrS2/AHBQ5HsyclP3lr9Kvz9ffuW2T
         E4ShoXZ16U110Xulvrahp2QCrC87GTzfO4vB+LXevTotCeZgrRUeDfS6iNmHY6hzi8g7
         1hrwQpDMcrYw2phhsk0LpOAPs9IV8JyQufXtGfFeEylCojItALF4iAvIa2fNiOZfhNzS
         4Y5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789050283; x=1789655083;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yU5rOk6h8bj4CbQ83n6GeZ2/DFqLMn/rBfdmHQNe++Y=;
        b=d9N/Zt2Kes5czm15NrJD09axpcbkdbemNUrniHgI1YzVNXlN8ClCeusJMepal8X3Ub
         1HAtwCgpev7IszawVWkgI712QWq/KYDrytDszVkBU3GjL59nqiIkUOaphiIJ3DWWP03M
         iS1UVuTaLNwgIsQuuO99I3cDDVW/Y1JExBJvY9szPC02iNoIExWCJ/nj4vm3nVgAjMF4
         PO9Ye/oU2s3y+U43QjneXX4mYa9WcSt+oi5DZTNq13s/MROtSeczEsdZlRePARwcytZK
         kHZOF914AD9g8cItXfsUL1ghiHgtqpRH6TJnQYFyP8Ffg1lYPv08sOxiKi3LRirxneUq
         ZZdw==
X-Forwarded-Encrypted: i=1; AKwUvBwEs4kwqsSq9zgNdRpR9KiWtuCplTUnGIeUeoZM7SeBdCKPoyHgFFmZW1/2bRs/9XWvxklYpSM8LzIcnK4=@vger.kernel.org
X-Gm-Message-State: AFuF++ntcQ3wm7rD2waw+ZfV1Szpo3v3T/o8wg6pV0n6hr68/lRZJAGs
	5029IseQy3d6+R9ndErRuQpOT/tsnPgVHGkDejZCK8HGpZa7beJ8YXRjAR9LhOVa
X-Gm-Gg: AYBFou1AOdY+vv48Y+DMnC1xMNv3Di0fEIf9wd9qmQJbANCHRDPVfDF6ozEP2DYJ60k
	dZNM35ENif97Y0uJ5Z314lNNaVE/46rUi4sK2O9DzycIbCT6pxSDRS/3GS+T1C45LFL2M3sQLzB
	45yGRnw7uCfNPIZqshxFR9OpY+nhcoZ9E626ybiTgvoKkzxq8WG4Xlol22+KgANIe5tcTgNqXTj
	gfyd1XzMzsybZ17OXu2D8FRyGoMBE7L4CEIrTn0TTkn9dDEJZRGIt4i9VzVUj5i0lTKaJUrrhMB
	KUH/jzKLGZEKD0AWFk8gU5J4lzcXSMFHLMMtJKWs5lv0er4T8VLtFZWOqaLWQeS9v8yqKz/OeIm
	Xj+i1JQrW413+dY2eXrlqbvQfSGUFYhOAtOQ8K8AG7MRRUw8kJ7qEVx9ofEzOANG9mAiss7f1lC
	k/Yzba4qwftmZa2AuH48eaJYJ3ibm/gEVZOyQIRg3Inv8baHaGyKuavVmwH+nD2FGbuyTUocqAO
	rNbzAs4g2T6Qlvh8x/2WpCWI8LS6wFeF6D+6mp8yc0WWnxjqLjANJW9E00dLtcfMPlymXs37UY=
X-Received: by 2002:a05:600c:5307:b0:49c:f617:7cf with SMTP id 5b1f17b1804b1-49d25871d73mr162962375e9.0.1789049807967;
        Thu, 10 Sep 2026 07:16:47 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d20fce7a7sm293895575e9.4.2026.09.10.07.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 07:16:47 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Subject: [PATCH v2 0/7] of: property: Make fw_devlink follow GPIO, PWM and
 clock nexus maps
Date: Thu, 10 Sep 2026 16:16:41 +0200
Message-Id: <20260910-fw-devlink-nexus-ready-v2-0-17ac82dbe226@toradex.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMm7omoC/3XNQQ7CIBCF4as0s3YMkEiLK+9hukCY2olKG1Bs0
 /TuYhOXLv+XzDcLJIpMCY7VApEyJx5CCbWrwPU2XAnZlwYllBZGSOze6CnfOdww0PRKGMn6GV1
 zMLXQFyGNh3I8Rup42uBzW7rn9BzivP3J8rv+SPWPzBIF6qYjaYymurGnIlhP094ND2jXdf0AE
 E5L/L4AAAA=
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>
Cc: "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>, 
 Frank Li <Frank.li@oss.nxp.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Herve Codina <herve.codina@bootlin.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Leonardo Costa <leonardo.costa@toradex.com>, devicetree@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>, stable@vger.kernel.org
X-Mailer: b4 0.13.0

This series fixes an fw_devlink supplier-resolution problem reported by
Leonardo Costa while using a Devicetree nexus to describe GPIO and PWM
resources routed through an LVDS connector. Consumers referencing the
nexus could remain deferred because fw_devlink linked them to the nexus
rather than to the providers selected by gpio-map and pwm-map. [1]

GPIO, PWM and clock consumer APIs use of_parse_phandle_with_args_map()
to resolve specifiers through gpio-map, pwm-map and clock-map
properties. The corresponding fw_devlink parsers use direct phandle
parsing instead. Given a consumer which references a nexus, the consumer
API and fw_devlink therefore resolve the reference to different nodes:

  consumer API:  consumer -> nexus -> mapped provider
  fw_devlink:    consumer -> nexus

A nexus is a translation node rather than the resource provider and need
not have a driver. The link to it can consequently remain unresolved and
defer the consumer even though the mapped provider is available.

Make the fw_devlink GPIO, PWM and clock parsers use the same map-aware
resolver as their consumer APIs. The resolver also handles valid direct
references by returning the original provider when no map is present.
Use dedicated exact-name and suffix declaration macros to opt these
bindings into map-aware parsing without changing unrelated property
parsers. Retain GPIO's existing exclusions and compatibility handling.

The regression tests call the OF add_links operation and verify that a
mapped reference creates exactly one link to the final provider, not to
the nexus. They also cover valid direct references. The GPIO tests
exercise all property spellings recognized by fw_devlink, including the
deprecated singular and unprefixed forms.

Tested with:
  - The new CONFIG_OF_UNITTEST fw_devlink cases under QEMU/x86_64 all
    passed
  - W=1 builds on x86_64 and arm64, including the OF unittest data
  - Toradex Verdin iMX8M Plus hardware using a connector nexus for the
    display GPIO and PWM resources: the display probes successfully

[1] https://lore.kernel.org/all/juuc4af7ndbajcl7gzf4tg5qz2q2j5tt3rvql4jbauradujrre@gc5nbdhhixaf/

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

---
Changes in v2:
- Split the unit tests into per-resource follow-up commits
- Added clock nexus as well because the clock nexus series was merged:
  https://lore.kernel.org/all/20260807-schneider-v7-2-rc1-eip201-upstream-v5-0-8785f9531cf0@bootlin.com/
- Link to v1: https://lore.kernel.org/r/20260902-fw-devlink-nexus-ready-v1-0-68fe1996e78a@toradex.com

---
Ernest Van Hoecke (7):
      of: property: fw_devlink: Follow GPIO nexus maps
      of: property: fw_devlink: Report unsupported supplier linking
      of: unittest: Test fw_devlink with GPIO nexus maps
      of: property: fw_devlink: Follow PWM nexus maps
      of: unittest: Test fw_devlink with PWM nexus maps
      of: property: fw_devlink: Follow clock nexus maps
      of: unittest: Test fw_devlink with clock nexus maps

 drivers/of/property.c                       | 53 ++++++++++++++-----
 drivers/of/unittest-data/tests-phandle.dtsi | 63 +++++++++++++++++++++++
 drivers/of/unittest.c                       | 79 +++++++++++++++++++++++++++++
 3 files changed, 182 insertions(+), 13 deletions(-)
---
base-commit: 91b1b8d437abe0cd83210d8f257b785a63047aa9
change-id: 20260901-fw-devlink-nexus-ready-c859706b019d

Best regards,
-- 
Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

