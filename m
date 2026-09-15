Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B8493B42FD
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 13:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789478155; cv=none; b=mJ64VrHq6KPOrIjKZNYZ5qxiYh2v9397wfpA/W3H7Ih08s4wmmqzr6ExE2axuFHDZYtYcytKAFfxe8DN6xttQKKUw88oVe8iuly6Q1iMQGo/OIEk2uQOwS83LCAKtPxj4NWyubQptJ/We6FPPqrV4ZUHx2RycKApq94CCbYtB1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789478155; c=relaxed/simple;
	bh=O32bwyHEYNFiX/7kOJzHjTGw2Z3yVYaaKKq+w7ibBMk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Mv0WdKgmE9EzJ1jKd49d7ahCOaHbIuo9usCj1wc9n60Gb10GoGvz4/dPk4xcvmedtKMpXt6wCbcsj6ANbGq5aYEhgeWKryfB75jwPFyblvk97/PDkYZ39Y3nk62LX0sPxrDOjZ8HRGVXpdwU9KAu1lXKEtqEtXmVmuV0aE//vys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gd+JNABK; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gd+JNABK"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f9f7dbeso46841466b.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 06:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789478151; x=1790082951; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4U3SB71ReF0ifx8bqGHa72DWklfVhQ9vcJBUaK3Uflc=;
        b=Gd+JNABKP/rtp/uJER+eqAFy4Zi9jl9JT2XBDRHGH0+f6zX7ZmE8Ae459f5hohYhwI
         ncRq4S4YtvAfdmUwR/TQHSD8L55xaKafTzS62/FeOQRQp9tfAjnfLcmm6pno34wPocho
         5RMrmQRQMajPvjAqMvw5sZBfXxmFxH+sJYJVQBoyxCP/Jkao3h8+Xxgx7E/LaQBvYC7y
         FA74xHli26/5BbJn7Kw8P3SDlIKQSEDPPnn6kFRQ8TyxUg6PV3BsKo6bHFyjDakdGdgr
         XkhAqeVVchZD6UK4MrVACFj6KL7nwoishxJrsdHZlR7ZMGdnPITxGcU9Yd6XfGDeiIla
         ZvJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789478151; x=1790082951;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4U3SB71ReF0ifx8bqGHa72DWklfVhQ9vcJBUaK3Uflc=;
        b=RD/ehYKLrRdJ3bkMvhn+EO47gKpPKFZCQVHvx7SGasxTsCxo26pZXmFiUGz9I0EsfM
         76esh7CfpiZFmNXiTWiKpLUM0aTyBccyoWmY+MJGtXxc+HYwn82jMY9tSmFmR7T5GrkZ
         T6qFsZR0DH9mSv7JAsXQbJVWIQGLCJv3jdmPDUEolnF5hLcC9m/7aRF+fmomq/ZI5OK3
         lvO6c4URVPkTTfrQRGvAQ5kIcIwFe3XZjrmasEunbK0W2dKgrCX1LzRctTGFgez7rp6c
         PLg5/rOBnvtEXFl1oxEmnXlZpWqS/q+JH+tKbOvoWdIxTcYWVVvVT4PxCi9zlmCq8GCb
         TEKQ==
X-Forwarded-Encrypted: i=1; AKwUvByVc4BsBK6wAA4jaxJXotLR4nB+aR2zC6vJ+90i608gkCuyQmnV9+M74aZoFRmdVaKJxMwpa/zXHA7A7uI=@vger.kernel.org
X-Gm-Message-State: AFuF++nrlIiEjQf0hoyy8q242Q1cwdIXx1XiAVtzVUK3dgeJGjvJ2EXe
	Re52IUnHIiImeo+0XPBQmlk5UYBEzQGtkgie2M1d0M/zZAkMk69fULkA
X-Gm-Gg: AYBFou243B0f24GFbXLhqOk5ytPv0Vb1O5DKl4yGiWmni2XzJSZ1iauHUjXODGLahrp
	e48Vc2P/fQH5eSkzV6tOsR6PdGQ1hjeVk78pkks/G91E9XUaWmJeEl09ddosR9H6HQgm4j+yABs
	Srus/eUYENaEIa4jFCff1tWLcztqwij36texpthrxAOpkDA+HJAsfWKuvOPMYebY0l2QvICLazD
	6NVGNS0IwBPMAFl7+B6hVUvCTJNHv9GCIFCiCEzdpXfs1ryxdKPPOXDnT316Adr6w+MDcJQiXK8
	7Agl4EQNMeHQweLIIvdnRpGussF+1NsA0gAwEWp1L1FJsWKkblRzF8GYQQTadb2MqAFsPoRvhq2
	TOtHupdHDZItmqsBHH9RQveFgjWbFYhusN7Y8OpBvE0/Blp00c/fExd+rWEUX+B1mJjLrNZgONK
	qJM5Yx1WAsnE5Eztx308qpgInqdEQk09ye9HrxMucSVnMPYCnMEk0sEvWBw8WkTZ2ZMqIKftjlr
	US2382MIa4/vOxSjxm2A84ULqb6kwuvSnwQxNpqnCmZd8OKdkwgjYjJT35v
X-Received: by 2002:a17:907:c1b:b0:c26:19de:9aec with SMTP id a640c23a62f3a-c29d79c7b95mr73457266b.43.1789478151079;
        Tue, 15 Sep 2026 06:15:51 -0700 (PDT)
Received: from misharu.home (2a02-a463-a071-0-a3ef-793b-4960-e77.fixed6.kpn.net. [2a02:a463:a071:0:a3ef:793b:4960:e77])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2966066b76sm90275266b.29.2026.09.15.06.15.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 06:15:50 -0700 (PDT)
From: Hari Mishal <harimishal1@gmail.com>
To: alexander.deucher@amd.com,
	christian.koenig@amd.com
Cc: airlied@gmail.com,
	simona@ffwll.ch,
	lijo.lazar@amd.com,
	Jiawei.Gu@amd.com,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	gregkh@linuxfoundation.org,
	Hari Mishal <harimishal1@gmail.com>
Subject: [PATCH] drm/amdgpu/atom: bound the VBIOS date, part number, version and build getters
Date: Tue, 15 Sep 2026 15:15:48 +0200
Message-ID: <20260915131548.28292-1-harimishal1@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

atom_get_vbios_date(), atom_get_vbios_pn(), atom_get_vbios_version()
and atom_get_vbios_build() all walk the BIOS image using offsets and
counts taken from the image itself, checked only against each other
and never against ctx->bios_size:

 - atom_get_vbios_date() reads 14 bytes at a fixed offset that
   check_atom_bios()'s minimum size (0x49) does not cover.
 - atom_get_vbios_pn() dereferences an image-supplied u16 string
   offset unchecked, then walks and copies from it with only a length
   cap, not an image cap.
 - atom_get_vbios_version() takes its search bounds from image u16s;
   atom_find_str_in_rom() already clamps the search itself, but the
   match is then advanced by a fixed 18 bytes and STRLEN_NORMAL bytes
   are copied from there with no check that this still lands inside
   the image.
 - atom_get_vbios_build() walks from an image-supplied config-string
   offset toward the ROM header; a config offset at or past the
   header makes the pointer difference negative, wrapping through the
   u16 'len' and passing strscpy() a bound far larger than the
   32-byte destination.

Bound each getter's reads, walks and copies to ctx->bios_size, falling
back to an empty string on a malformed image.

Fixes: 29b4c589b43d ("drm/amdgpu: Add vbios info ioctl interface")
Fixes: d6fa80266178 ("drm/amdgpu: Add vbios build number interface")
Assisted-by: gkh_clanker_t1000
Signed-off-by: Hari Mishal <harimishal1@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/atom.c | 29 ++++++++++++++++++++++++-----
 1 file changed, 24 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/atom.c b/drivers/gpu/drm/amd/amdgpu/atom.c
index e74253682929..fe9af26ccc11 100644
--- a/drivers/gpu/drm/amd/amdgpu/atom.c
+++ b/drivers/gpu/drm/amd/amdgpu/atom.c
@@ -1445,6 +1445,11 @@ static void atom_get_vbios_date(struct atom_context *ctx)
 
 	p_rom = ctx->bios;
 
+	if (ctx->bios_size < OFFSET_TO_VBIOS_DATE + 14) {
+		ctx->date[0] = '\0';
+		return;
+	}
+
 	date_in_rom = p_rom + OFFSET_TO_VBIOS_DATE;
 
 	ctx->date[0] = '2';
@@ -1513,17 +1518,24 @@ static void atom_get_vbios_pn(struct atom_context *ctx)
 		vbios_str = p_rom + OFFSET_TO_VBIOS_PART_NUMBER;
 	}
 
-	if (*vbios_str == 0) {
+	if (vbios_str >= p_rom + ctx->bios_size)
+		vbios_str = NULL;
+
+	if (vbios_str == NULL || *vbios_str == 0) {
 		vbios_str = atom_find_str_in_rom(ctx, BIOS_ATOM_PREFIX, 3, 1024, 64);
 		if (vbios_str)
 			vbios_str += sizeof(BIOS_ATOM_PREFIX) - 1;
+		if (vbios_str >= p_rom + ctx->bios_size)
+			vbios_str = NULL;
 	}
 	if (vbios_str != NULL && *vbios_str == 0)
 		vbios_str++;
 
 	if (vbios_str != NULL) {
 		count = 0;
-		while ((count < BIOS_STRING_LENGTH) && vbios_str[count] >= ' ' &&
+		while ((count < BIOS_STRING_LENGTH) &&
+		       vbios_str + count < p_rom + ctx->bios_size &&
+		       vbios_str[count] >= ' ' &&
 		       vbios_str[count] <= 'z') {
 			ctx->vbios_pn[count] = vbios_str[count];
 			count++;
@@ -1556,9 +1568,10 @@ static void atom_get_vbios_version(struct atom_context *ctx)
 	/* find anchor ATOMBIOSBK-AMD */
 	vbios_ver =
 		atom_find_str_in_rom(ctx, BIOS_VERSION_PREFIX, start, end, 64);
-	if (vbios_ver != NULL) {
-		/* skip ATOMBIOSBK-AMD VER */
-		vbios_ver += 18;
+	if (vbios_ver != NULL)
+		vbios_ver += 18; /* skip ATOMBIOSBK-AMD VER */
+
+	if (vbios_ver != NULL && vbios_ver + STRLEN_NORMAL <= p_rom + ctx->bios_size) {
 		memcpy(ctx->vbios_ver_str, vbios_ver, STRLEN_NORMAL);
 	} else {
 		ctx->vbios_ver_str[0] = '\0';
@@ -1574,7 +1587,13 @@ static void atom_get_vbios_build(struct atom_context *ctx)
 	base = CU16(ATOM_ROM_TABLE_PTR);
 	atom_rom_hdr = CSTR(base);
 
+	if ((uint32_t)base + ATOM_ROM_CFG_PTR + sizeof(uint16_t) > ctx->bios_size)
+		return;
+
 	str = CSTR(CU16(base + ATOM_ROM_CFG_PTR));
+	if (str >= atom_rom_hdr)
+		return;
+
 	/* Skip config string */
 	while (str < atom_rom_hdr && *str++)
 		;
-- 
2.43.0

