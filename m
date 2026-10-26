Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792986653;
	b=kRreyWLRTEuSMENEhau9BchKnZnhvBo8Akl4+evex/gD+wAKhJmYGA9RA6euGwUUbeUw
	 M3K3+O3UcyBVpr3rBkQ3LjRgJc7TWPDcRwX8uiIWBQQ7DNnBshoWhgJrwm7mR3kPB1rLO
	 6BeWHm8MTAWiukQq8TiMPcFe6xqa87OYVbuwp2FInaUX8rD3zpRT6JzF6gfOLhr6J00yv
	 K1xg3GJiVCfjXA5kN2HO3BdZeb+FgUTZk6wSxAJsc/izEVG1y5iBsDYkthfVwZNu8TzfH
	 pV/c9i5zB7PE7y/WPUtm2/xzfZ8roLkc9ezW+ihBrdf1l4hG8mEMWeWs26momCA/UpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792986653;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Ted9K+BkkR+QFgGVq+0shrkHjbI13xF98LTrYp6FnvQ=;
	b=mlcHuaocrz3BoH0HgWAaP1NdAVyqcRVozCMCA83OOixkCphHXE2WM+pS6EgmprhuO8Vf
	 +0xrpBnU3MJcDtXGf8tVD7JVPL6zfh4Vi+rSa7m0qbuFCBt8tNfX7KsxGn4CRulUv4JGS
	 QWUvx6AIFKzZrbFoFGr2Q2QabO6NcosJ+WnjtsNDtmpoI5jINTU5kGfaLzvVJ9yz6IBJ0
	 Sg/MA7s8dO471/JCH2fMsQVtWVf1/bdKBgwSTdAsLNiPEeGyTFL1Nw2fHCEYR7m8jleuQ
	 tZCW6yjefBi0F+vjVo6X8vyqRfDmH7is/dLSDnwDzT0fhKceStubeDtx40AHIAqS4NA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bgoEndZk;
	arc=none smtp.remote-ip=209.85.222.47
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92691606A323
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:50:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92691606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bgoEndZk
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-99071945aa7so1485572241.3
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 20:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792986652; x=1793591452; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ted9K+BkkR+QFgGVq+0shrkHjbI13xF98LTrYp6FnvQ=;
        b=bgoEndZkN9fkR27nyqnJSB3dhN9Hb4U4YEZXWXpAf4cTjnzpePbgGWSR6sCtvA/8ap
         FUzz1YfOO3wgdAJdx8BwfsFoUYbjfZ9YdtaM/IiI29/72wKYK+5MTjkgEjqfjXzdsNxl
         qXSU8gfDzi/9YpH/YBmmneTvwHCaMemvoorn+fEQouM9CmIitkpIPSLV4hVrB2f8qlqS
         mmQie63L5jQFp32KafvOa8r63H+nZklKYvj/uO4J1VdqqwkVJiYqkgXv9iFMP/Z11aBD
         6Jbhyx2MDcjrD5KKLPjqz1uWIorzJoXbvQ1TxTlZzK6/RCKZtAkxpIZ07xL0LVBpovyi
         fFQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792986652; x=1793591452;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ted9K+BkkR+QFgGVq+0shrkHjbI13xF98LTrYp6FnvQ=;
        b=idkCq1EDfBKm7sdHOvc4VFiSe4PEYv2p9l/Djysov/uwka/ddQe+OjEFrJQfn+wa3M
         UJZX//GeuGrOSiclwItjuPi3ccXxeIAX/bTgZnU7HPMQqX9LmfPI9bWmHYHlB4VWlJaW
         PNyBsSY+k2TnITerz7Vb4clJOwziSa6mFT9mPl9cpP4o13P0Y3/LF47EqeXIZR0lDklp
         mirK9ii/OvULgU29rlcSV8kItFySqVzpbPUt9jjpZphPGATKzEjKOFKKiZzlZgM5U9cv
         a8drs1HfbiUJDYl6A7kWMjfVkPzQj/bUV/nQh54NwpgbdtONjbiqYai/jIhiXwYntsL+
         0QFw==
X-Forwarded-Encrypted: i=1; AKwUvBzR3+ncokHu68v/vb36hbMODqcPKSXdujppKc/rwRbvrZGI6kKI6nv9a+d2NkcZAJfr9+FD/wtuKfsocDQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIPEB5B5hNz02s/J33yNiFOgYsMdo7nJ3XrR8MVm1aUVqcVzyWX
	X1Z3X8Qgu6uOiAiCnWaFd29Xo4uoSjhlD9IDWvzYxGGSplVi2DpTsLPZ
X-Gm-Gg: AYBFou0o74/u1kt4FWFj1kvml1zb+GL+HqZP07hWatVWLh16+d7nlVsNGo0XEOov/2+
	fGiEym7nDnmJy1pN9zcIZJCMtSJDfmyGkt9oEEjQdsXyppx+GTRX9K0nTzg729VC0glDk8yzHJf
	vP+ysOs3ox2M3F0FrgOgiWLosEH5coBpMroT5RCglNx/zfxZ7RMhJ2pAGmXuaW2cH0VziNYqkAj
	mGUt3I5mUKOk2hh4FS07byLKXvqmZx0MQhGv8oqc9dXwjrr7ikwQe/T5dhYXmXMneJ8rT8ThIyX
	Fw8aZyWGXz+r7U0U3C7EljIb8IreVGwkzZGkyfH+Xw/b/AxyLJnsTpqzVqk8rLK+xppP9irUpfO
	AOQM7ol9y/ynRuX740T4Qag41qpeLBG8dMLLNy+29zV7UNOZ/KDVTvn7FeDyCNADY1K/LH1Klg+
	j8Am3sx3PLxIeHVCFkJrvlE7YM/xtqj0biBmjN2IcxbbXozp8y/PN3B5mLPqePBucSZ/XzeR9Ej
	nfc3AFsh0hQnRoGRtJ8yFD5+Oej1REeT7aBNMlh6KKFKWKbpbJ9MwjYY1N8mfO/bPwkAQo2pVtP
	aRwsH2Zf8HRTB+AVn0w1
X-Received: by 2002:a05:6102:2925:b0:7af:fef2:8ecf with SMTP id ada2fe7eead31-7ce5cc37a74mr1759413137.8.1792986652638;
        Sun, 25 Oct 2026 20:50:52 -0700 (PDT)
Received: from archsung (187-126-110-245.user3p.vtal.net.br. [187.126.110.245])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7ce5e2baf56sm6140100137.11.2026.10.25.20.50.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 20:50:52 -0700 (PDT)
From: Felipe Calliari <calliarifelipe@gmail.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Tomas Moro <tmorolias@gmail.com>,
	linux-kernel@vger.kernel.org,
	Felipe Calliari <calliarifelipe@gmail.com>
Subject: [PATCH v4 4/5] media: ipu-bridge: Add the OV02C10 26 MHz link frequency
Date: Mon, 26 Oct 2026 00:50:14 -0300
Message-ID: <20261026035015.110903-5-calliarifelipe@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261026035015.110903-1-calliarifelipe@gmail.com>
References: <20260923234100.318151-1-calliarifelipe@gmail.com>
 <20261026035015.110903-1-calliarifelipe@gmail.com>
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

With a 26 MHz external clock the OV02C10 runs its CSI-2 link at
399.479167 MHz instead of 400 MHz. Add that link frequency to the
OVTI02C1 entry so the sensor driver can use it.

Signed-off-by: Felipe Calliari <calliarifelipe@gmail.com>
---

Notes:
    Changes in v3:
    - New patch. The ov02c10 now advertises the 26 MHz link frequency
      on its own (Sakari), so the bridge has to list it.

 drivers/media/pci/intel/ipu-bridge.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 3739c4a2a..9124abefb 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -95,7 +95,7 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
 	IPU_SENSOR_CONFIG("OVTI01AB", 1, 400000000),
 	IPU_SENSOR_CONFIG("OVTI01AS", 1, 400000000),
 	/* Omnivision OV02C10 */
-	IPU_SENSOR_CONFIG("OVTI02C1", 1, 400000000),
+	IPU_SENSOR_CONFIG("OVTI02C1", 2, 400000000, 399479167),
 	/* Omnivision OV02E10 */
 	IPU_SENSOR_CONFIG("OVTI02E1", 1, 360000000),
 	/* Omnivision ov05c10 */
-- 
2.56.0

