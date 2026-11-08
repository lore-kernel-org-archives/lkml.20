Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794176987;
	b=hoQE0/mt9gJy9d1LNNZe2T09VjI96gGuGTdgMHG/gtUtySiX967Ch1wTghT4/MVDX8YG
	 AzjoASqXwkZehoBzvSwkyHUJz9XMWZIL4u6eaCtLTU4w0XUKW0QVtGuujRhEEYrttIFGx
	 BFgGpzPjsRNUnAiFiIRsTfCWEktm0HaFQxpVeY86o0VspUyhsN6F3dHYNUdwfLFi7A7Tl
	 lziVF6D/dFR4s6HUvSeBGgcK+H9wGhtuDkWDk5BwSkwO6MotvFtBBdp9rPqbURpg6M4YA
	 houfs+LoG2PpLYzs/tBjH2I88wLN+5TGWBDZi5Jywqu/Bi5JXy+144SsMwdYYMJxQMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794176987;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=IPQUpb6i+nLFnMLA9a1Elw+H2n4QnL7ADYg7p7un71M=;
	b=1+t27xvIHWTT2SojuVg2aid9MkreXuLWmCwTx6dAbeG89umVq5RvlLRoDF4urYIYnNF3
	 cd9tGthGZjM9mWSLhF0KtYblvhhVjgQYy3FH3Wz/+K9IUACMFVOUu1c0FSfXx7fYfhqDC
	 7ZY2nKUk9nzzagO9n+Q8BsX8pdWLB4/3OmESvIknrnz8JpB1d9PX/eVfUZ+YjF8lA0FkZ
	 L5cJ+U+U7GNCRKb3SaYp1jGMczklsejMI+myl8VUBNX2e9shrkblK3wJ+WF3FRU1BQqMg
	 5iYZrnreZiOVZgYYyaYoMQYnhaCvTT1ZI8GDKl4JsouREbzAoZPURdX6XK9pjlPwu1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=o4m2gz2i;
	arc=none smtp.remote-ip=109.224.244.123
Received: from mail-244123.protonmail.ch (mail-244123.protonmail.ch [109.224.244.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97BA5606A322
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 22:29:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97BA5606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=o4m2gz2i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1794176984; x=1794436184;
	bh=IPQUpb6i+nLFnMLA9a1Elw+H2n4QnL7ADYg7p7un71M=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=o4m2gz2iE2IsQ0rR14YV7ZDkr3CQunOQStHMRqO3VSxVNU1tK5/hhTCNxE/jIvs8p
	 LtZuePcdNwl+ZLmWPU61zpdhFII9U80fdPk5FHn/Ed98jwvuY2UcO7h6DSajVgG2k/
	 N+xMlczQfKuPoNot/wNHMBhecOi7+MdZ8sOHEV8qIQuM+tqZ31idfpvqqEHxQqfxxS
	 e/BYIeU7N+Gs62zwLpstEf72E5SXd/TaBKAS+5ZGbUsz48D0UubmIPAzaJLI3uLcgX
	 G4JjrmE3mG3M9M8/zdGx69zz3NJ+baduEhFVW+3s0Nq3DouDMFCd/D2/sSbEyjtbrt
	 5SdS+cRLcl2/g==
Date: Sun, 08 Nov 2026 22:29:38 +0000
To: "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>, "rodrigo.vivi@intel.com" <rodrigo.vivi@intel.com>
From: Noah Weinberger <NoahWeinberger2003@proton.me>
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/i915/bios: validate VBT vswing/preemphasis override table
Message-ID: <40IXMMqFQJJm26J3saK7hx09nF4FuE3ZJcU6gMIryuxuGC5VENrcgA9q4klryPNSLnMwE64szv7eg4wf__gU8OlgzlL8tw3CmV_78Kc_H14=@proton.me>
Feedback-ID: 186545857:user:proton
X-Pm-Message-ID: f5a919b28448b5cbde6dce3ce891cdedb4a6e049
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello,

Proposed-fix limitation: the patch below does not validate the full
VBT table extent against the section size. The malformed/short-table
out-of-bounds case described below remains unresolved by these
existence and minimum-count checks. This is an incomplete proposal for
maintainer review; a complete fix still needs section-extent bounds
validation.

parse_vswing_preemph_override() stores the raw pointer and count fields
from VBT block 57 without validating that the block actually contains
the announced table, and allocate_vswing_preemph_override() allocates
the consumer structures whenever a child device sets use_vbt_vswing -
even when the block is absent entirely. validate_vspeo() only checks
that devdata->vspeo is non-NULL and that the port has DP.

Two failure modes follow at DDI buffer-translation time:
 - block absent: tables =3D=3D NULL, num_columns =3D=3D 0, so the consumer
   dereferences tables[0] (NULL).
 - block short or malformed: the table walk reads up to
   (5+1)*num_rows*num_columns u32s from a block whose enforced minimum
   size is 2 bytes - with num_columns =3D 255 that is ~98 KB past a small
   heap allocation, and the values are programmed into PHY registers.

The patch gates the consumer on the table existing with sane counts.
A complete fix should also validate the table extent against the
section size, which is not currently plumbed through; happy to rework
if there is a preferred way to carry the section size.

Affected version/commit: mainline fa4ad798f6f681031775266044ba1b0cf3c670bd =
(v7.4-rc1, 2026-11-07), drivers/gpu/drm/i915/display/intel_bios.c:2216-2234=
 (parse), 2654-2676 (allocate), 3874-3923 (validate/consume).
Introduced in the v7.4 merge window.

This was found during an assisted (AI-supported) static source review of
mainline fa4ad798f6f681031775266044ba1b0cf3c670bd (v7.4-rc1, 2026-11-07); e=
very code path cited below was re-verified by the
reporter against that tree. The patch below has NOT been compiled and has
NOT been runtime tested, and no reproducer was produced - the triggering
conditions are described above instead. Please treat this as a report for
verification rather than a battle-tested fix.

Reported-by: Noah Weinberger <noahweinberger2003@proton.me>
---
diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i9=
15/display/intel_bios.c
index 7b6a6f8..d99a675 100644
--- a/drivers/gpu/drm/i915/display/intel_bios.c
+++ b/drivers/gpu/drm/i915/display/intel_bios.c
@@ -2657,7 +2657,8 @@ static void allocate_vswing_preemph_override(struct i=
ntel_bios_encoder_data *dev
 =09union intel_ddi_buf_trans_entry *entries;
 =09struct intel_ddi_buf_trans *vspeo;
=20
-=09if (!intel_bios_encoder_requests_vspeo(devdata))
+=09if (!intel_bios_encoder_requests_vspeo(devdata) ||
+=09    !devdata->display->vbt.vspeo.tables)
 =09=09return;
=20
 =09vspeo =3D kzalloc_obj(*vspeo);
@@ -3876,6 +3877,8 @@ validate_vspeo(const struct intel_bios_encoder_data *=
devdata, bool has_dp)
 {
 =09struct intel_ddi_buf_trans *vspeo;
=20
+=09struct intel_display *display =3D devdata->display;
+
 =09vspeo =3D devdata->vspeo;
 =09if (!vspeo)
 =09=09return false;
@@ -3883,5 +3886,10 @@ validate_vspeo(const struct intel_bios_encoder_data =
*devdata, bool has_dp)
 =09if (!has_dp)
 =09=09return false;
=20
+=09if (!display->vbt.vspeo.tables ||
+=09    display->vbt.vspeo.num_columns < 3 ||
+=09    display->vbt.vspeo.num_tables < 6)
+=09=09return false;
+
 =09return true;
 }

