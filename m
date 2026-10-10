Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A597E4A8421
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 13:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791637234; cv=none; b=lW1qQWMdHQusJLS4EngVH71UeUiTXwRfep2Rmvb7ybdG0Q8/cweppj5tyBcZw/k1TOw0+713kkZaBqHCppN+/FfgsIeTgRroFfIM8npMDM+6rg2eWgt7bk4K1PDl90J2dSgoU6mPltWu6cH9aSh6S/YMm/I2mjMDj3yXrFTok9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791637234; c=relaxed/simple;
	bh=YI6mYQGirVreALgiPkUH+iKfGlVPpC8XhF4hx81/+P0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wq7zz/7mfgaIol/7wJ5FQ7eBAgXyb4EuDjk8drc/W/CV+rAXmMuXUkVkY3NqbPLuzt+0gZB9FzS+6/0pbntmn++vnHHTxCZjM+wuoEZLmcbcbZ9aVlN6fOSWAiOQBiy42E0laq1hhRjagjw+TtdCl7IOQWOGzvvQBfihcJWE3c8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aL7KjO34; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aL7KjO34"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a1635f7c89so5681235e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 06:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791637231; x=1792242031; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e8I8FDQ3AAKgDRdCnVtdodqX3Hu1DpXHDVZdy8LmKcE=;
        b=aL7KjO34npcImH910kGHcjIje8NNee8QhxOy5DJ2FK6MawYm0c9ufkGfir8RD2l5QH
         Q7T6AxQHcsFZ7dA0kN7Z3xjuNI3F0k9nAKCa4pczInTac/Tazo+rLGK2UhP0K21akVUo
         9jN7TYCX5gbAPOhE7PIwS2VFlbVLgiQpkgROvOoW8crWKTTF2fcbsI2uyPNMlvw2Add8
         GFx013b+KMRTk9s2MXC4Fyn5ZZcvTZI0ReIesPJldrDfIyTgPqTsDsdh5ohXdmGq6mcc
         sCjnDbSBSgJuyyEo0bfFopdmSC5azrSAmh4mI1K9yd3W4KNxeneBuMkYgLQyhBCev1+u
         gTmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791637231; x=1792242031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=e8I8FDQ3AAKgDRdCnVtdodqX3Hu1DpXHDVZdy8LmKcE=;
        b=QmvGVPctOhqNeDagfVx75KI9KbSMaQIBA5ncCHoJ3MUexS1DbLUX/hwkrygMJUswfz
         Y27IFACj8vvb9faGyWl0xG/PGvSODAjtToc8O869eIngH3OWj6P3Mh8q1MZi4cnwd/Sb
         fgKNpBEBFm62h4XHc+DeFHPK3N17qELb9elrTamdp3SVbbslODskUjjM1Skjmgh6FxG7
         9ZQ2aijMpjGjNSdkguc6z5L/N6TrBJKW/X5JHbk7ZFh5kFRRkOxcFX7lDHhQd61ulckA
         LNdQcobF4SgZ3Znu8a1b1qIyEf0OaFnY5BH4OaNv+DQdUxbBkiBQlgBVK+0wAJYvzCLx
         kvtw==
X-Forwarded-Encrypted: i=1; AKwUvBz4mwJ66mZz6UC53VVvubAHjIzz2PlcyoxcXLYzy8Q1UkGqJtzitco5D/f4qW2hyq5cePh6XReOrJdi5P4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKEsf+sG2cggdC5PdbbZH14ZGqOchjmJhULNI4gMBlXXHmGnzAb
	OZd6VsMG2tayI44DhXepGjXFiAwb36MKjbd27+0OHx1diTkR023/L8U0
X-Gm-Gg: AYBFou0kuD4sDiE+2McL6XIbU7E/5jyvbuFqOtdQbZ/GIhSd6e+kN1dNCvrgxw1yOqY
	JkFu2oJ8Q7yAeMBFUZZ/5/+lbBH7dx4uRImSOr3zpDZOLK2Zy/fZfaGRQ5/NuAgQx5O7mTlewoz
	ilIZ/NCZDTRlqdWWIo5z/OGoALVJ0Lbv53z+ebe2gRG5lxNmfVtrkj4Xfm6wPbQmBZVlcsXnrZD
	U34khhvWNKMYVITH0Uxz/O6c6KcHScM9RLvgNvLLnZF8ymK83QPm8DoPbQaD0EwL8xaHK09NsYA
	Ms8VxmERuq2oYsUEnJw7I4dojt13StcwhtKmvWQrL9ARwhQzk9NtuJGI3T76jTj2DTDzV+QAzXe
	jU58bmEehXmdzkHT0esS/jord4R6Qz8kYBzcsQppclBjFP/kuBdSJN7lamF0qSSqEXk3kcHZNt9
	EYy87PxSBhXuQPB43CIEdvq4/yinJ4HEsBIXC45jPqvQs+YOY4pF2842o9X/ndM+AFEcK+sVHaf
	hVV57r61ILtJLgMLvlJgP3bbcLbgVmJPX7YIpY8EnYSXtU1Ilw6Be5LenQH/cJn/3k0FMvjrTAY
	OH7hg10O6smGbM382h481U4vtLW5IW7N6rboI/besrICyqwHglYuHmigwmzGMA==
X-Received: by 2002:a05:600c:19c8:b0:4a1:777b:8a12 with SMTP id 5b1f17b1804b1-4a18e4adcdbmr86641875e9.14.1791637230750;
        Sat, 10 Oct 2026 06:00:30 -0700 (PDT)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a190c49d5csm162309975e9.3.2026.10.10.06.00.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 06:00:30 -0700 (PDT)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	arnd@arndb.de,
	linux@armlinux.org.uk,
	stefandoesinger@gmail.com,
	robh@kernel.org,
	krzk@kernel.org,
	Navid Ghahremani <ghahramani.navid@gmail.com>
Subject: [PATCH 01/24] dt-bindings: cache: l2c2x0: Describe ZTE device-read serialization
Date: Sat, 10 Oct 2026 13:59:39 +0100
Message-ID: <20261010130024.177503-2-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261010130024.177503-1-ghahramani.navid@gmail.com>
References: <20261010130024.177503-1-ghahramani.navid@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describe the observed interconnect deadlock workaround separately from
the ARM implementation. This property and API remain an RFC requiring
ARM and DT review.

Assisted-by: LLM
Signed-off-by: Navid Ghahremani <ghahramani.navid@gmail.com>
---
 Documentation/devicetree/bindings/cache/l2c2x0.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/cache/l2c2x0.yaml b/Documentation/devicetree/bindings/cache/l2c2x0.yaml
index ee604117ff..0295846cde 100644
--- a/Documentation/devicetree/bindings/cache/l2c2x0.yaml
+++ b/Documentation/devicetree/bindings/cache/l2c2x0.yaml
@@ -176,6 +176,15 @@ properties:
     description: enable ECC protection on the L2 cache
     type: boolean
 
+  zte,l2c-io-read-lock:
+    description: On the ZTE zx279128s, a CPU read from a PCIe device that is
+      still outstanding when an L2C-310 range or sync operation starts hangs
+      the interconnect. This property makes the L2C-310 maintenance operations
+      take a lock that the drivers of such devices also take around their
+      register reads. Valid only when the arm,pl310-cache compatible string
+      is used.
+    type: boolean
+
   arm,outer-sync-disable:
     description: disable the outer sync operation on the L2 cache.
       Some core tiles, especially ARM PB11MPCore have a faulty L220 cache that
-- 
2.55.0

