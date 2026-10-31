Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793461199;
	b=ZcM+HkJU9VVHYgxjlGoaB6nPGYFDVP2xPpwCtQTVfeDM39GppvDv4pRL7KJdye2UwwRC
	 tTFqujcDb13ywQHXkJbRf5rW9t18FAZegaTasMVVePp/bHK7BfdiS6ckbXlTXXaDgwYoI
	 NfFMjSg8v5N7HCdB8Q5LFtR2Qr/DWHtkn9D6xa3rg6Sg30jIvuTk2Fs01SB0hQ7gLffDO
	 5PEnrSSXwKXqZz8U10MaiNnrqh95oQYFVqj90fbPa+w5F1x/u5SqticR6junBvAMzUPce
	 Vgw7qafP1ljlJ4EsjQYawjtU6djMl2lrHtOiWxjHr3m78dEkV7ol8Y3pjws4qR/2x0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793461199;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Rspamd-Queue-Id;
	bh=adnGSaSpP4BAdVI9adsOus4fU610Llwk+z/mzctLwuc=;
	b=znr09R1x8lE4fkCPqrX9Gg13B7AUkb+VLcrns18IeirS6nW9f6+Ev9iRtz+Xs4pJVQs+
	 Ml3EFdur7WOu4biJRg7pgmYWJY9HH4hNt5gLpfkPUk2tz2sDRnUFoDErEkJp73O/iTFPb
	 9zY1c7TLQD8oU/ezeX8h1+6TOOCwpG9O/DFWRYWpaCjlGK34a/zg0UI+SrWe8qGFAGFi+
	 J+RsUTre9vERS/FHOx2P2KuUfs4hSAXaQvneBbymKfnGUAl1Vj3YBxR57HdvxMXBdRrTG
	 UAUYPknuutbSC/LpoJt77/UsDsqsgr6jTD4r3zzmeozKO7r5GxhnDpcpeFqSv/oGZZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hsal.es;
	spf=pass smtp.mailfrom=hsal.es;
	dkim=pass header.d=hsal.es header.i=@hsal.es header.a=rsa-sha256 header.s=MBO0001 header.b=XMODGxoP;
	arc=none smtp.remote-ip=80.241.56.171
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9C46606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 15:39:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9C46606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hsal.es
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hsal.es
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=hsal.es header.i=@hsal.es header.a=rsa-sha256 header.s=MBO0001 header.b=XMODGxoP
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4jH2GG28hFzMlcN;
	Sat, 31 Oct 2026 16:39:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hsal.es; s=MBO0001;
	t=1793461190;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=adnGSaSpP4BAdVI9adsOus4fU610Llwk+z/mzctLwuc=;
	b=XMODGxoP8K0i2JmT5G3NAunZ8O8RDukJhXUb82dntJS/qmHlCV8SLhBZC5T8z65tiGMK+a
	OhOH5Qj+QupkaZUB0lHW3E1LgArMVAkdHMmGVZH+leT267/1YqfsKk+eu+PsLa1bk/jarO
	IF08S1OAzP5/2pGXqPYMG6OaS6xgyqepCq3Fyolr25HU/BFPcgME6dgxOiypeBjPS2KK/b
	aNtVMUSc9tKkOFJgEqXEqn4Wc1dlBE96STrxcGqKPACc4mvc6MjGJXhToRXH308e+0Fofx
	+8ZvvGThFB8xHg/EWiyDqoRLcI128HvvZI/HtCs0sjYbXzuagTRf1fx9BNi6Og==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of hugo@hsal.es designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=hugo@hsal.es
From: Hugo Sales <hugo@hsal.es>
To: alexander.deucher@amd.com,
	christian.koenig@amd.com,
	amd-gfx@lists.freedesktop.org
Cc: superm1@kernel.org,
	lijo.lazar@amd.com,
	harry.wentland@amd.com,
	alex.hung@amd.com,
	kees@kernel.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amdgpu: Clamp the ATIF backlight curve to its 99 points
Date: Sat, 31 Oct 2026 15:39:48 +0000
Message-ID: <20261031153948.127016-1-hugo@hsal.es>
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
X-Rspamd-Queue-Id: 4jH2GG28hFzMlcN

amdgpu_atif_query_backlight_caps() stores the firmware's number_of_points
as data_points but copies only the 99 points that luminance_data[] holds.
number_of_points is a u8, so a firmware table that claims more makes the
custom curve code in amdgpu_dm index past the array, and
dm_query_extended_brightness_caps() copy past the end of the
data_points[] buffer it fills

Clamp the count to ATIF_QBTC_MAX_DATA_POINTS and warn, since a table
that claims more is a firmware bug

Fixes: f729e63743f0 ("drm/amd: Pass luminance data to amdgpu_dm_backlight_caps")
Signed-off-by: Hugo Sales <hugo@hsal.es>
---
The other ATIF checks log at debug level because they make the call fail
and the driver falls back to its defaults. Here the driver keeps going
with a truncated curve, so this one warns

 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
index 63088c072087a..4874ee864b807 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
@@ -406,7 +406,11 @@ int amdgpu_atif_query_backlight_caps(struct amdgpu_atif *atif)
 			characteristics.max_input_signal;
 	atif->backlight_caps.ac_level = characteristics.ac_level;
 	atif->backlight_caps.dc_level = characteristics.dc_level;
-	atif->backlight_caps.data_points = characteristics.number_of_points;
+	if (characteristics.number_of_points > ATIF_QBTC_MAX_DATA_POINTS)
+		pr_warn(FW_BUG "ATIF: backlight curve has %u points, using the first %u\n",
+			characteristics.number_of_points, ATIF_QBTC_MAX_DATA_POINTS);
+	atif->backlight_caps.data_points = min_t(u8, characteristics.number_of_points,
+						 ATIF_QBTC_MAX_DATA_POINTS);
 	memcpy(atif->backlight_caps.luminance_data,
 	       characteristics.data_points,
 	       sizeof(atif->backlight_caps.luminance_data));
-- 
2.56.0

