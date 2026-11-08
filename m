Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794182171;
	b=uNmesd+UBoaufr2L8LXScrDuSK7BounNLlgPGRIvUXKQcmjED9zB1lWHJW8kUjPU85Ts
	 ToXAUJVDGKyXEi/+k/DuQqpcNbGLCxT3kGh6KsAIlOCRg7DHrOHKuzzyzowY7sN9/imB7
	 handBHOgUP7AqpdrZ6bsYVhW0p6pw5dj78mMWXloxQFVjaUhvy0rRIcXzsOhSMDn54I9P
	 lRBQpU6snvHLtKeWz0ED3KPhlJmwRTjc4CG/7OpdIYgQigsGd4skip7olrhOeff1VA5OS
	 BbUdZoHqhd57IR3DPrtLFh6NyW/lgFpfrrG7ze5ksjCSiL7jPtC46+k4ZjbMj/bRRUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794182171;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=Qt1zeuxdUDup0vjiAGJocYp3FrinfLcYS5z3WSk9EAE=;
	b=WSfdOvQ6hpeNLEzvCz41uVR+DWL3rWB/qKp3crXtAcMe7P6e8myyAYcINbg3bDNBkJ6z
	 87LiX1RrhheWJeCn5m9774a2hrJFBGWmsSyT/LIYQZ3X6mdKbiNgsiLVJadca3x7Izme6
	 pPXEFcszFyIDCSzK2AIa0yPZMm2ydS2+SM8JHcy9nJh4BOfXGkrShpq4r6FH/uPkXeaNC
	 nkDQkRKPLsZ+OVVk/qGOeVzTYX5fkmGRRDbfhi1vROsIAR3wTS9o/N4yMxEXAz3q0UHJh
	 5IPCfhO5R3gfN9W0KxMoud96vstAaBL1NQNfOc0VOMcJoFZjMqONFeyPI2uG0vmYYlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b="j+Vg/9VZ";
	arc=none smtp.remote-ip=109.224.244.16
Received: from mail-24416.protonmail.ch (mail-24416.protonmail.ch [109.224.244.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 213C5606A322
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 23:56:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 213C5606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=j+Vg/9VZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1794182168; x=1794441368;
	bh=Qt1zeuxdUDup0vjiAGJocYp3FrinfLcYS5z3WSk9EAE=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=j+Vg/9VZE9AI520kUOFx5S6Tf8jcC1WSgzkW2lfYLKsjSvDvI1621GqWLoAjOL96G
	 ROOjyp1BhYf18IIY4Yv1bv8JP6XdZWB+C+ks2tcKLSjI/53qr9pTriYgcdgOymuzoW
	 DeETN3Mg7QLu/JmaG4vFVKduky2w9+Za930q8I3kLlvH7tq3qPJ2EoBKZBVE4ZtjGG
	 6urqYxd6Q4UIvKjPPDIZ8Z76Z3NqHjep9egT0GgCs45a65WSrhqubE9yaeHRGFFUpw
	 Iehu9wD0AUJbqcqZtKxu85MZMCWwzGMcHMhVpVGazLsTAf45ld8ou2j2QqOZBdpRZr
	 G7kLB+0ngUTvw==
Date: Sun, 08 Nov 2026 23:56:02 +0000
To: "lyude@redhat.com" <lyude@redhat.com>, "dakr@kernel.org" <dakr@kernel.org>
From: Noah Weinberger <NoahWeinberger2003@proton.me>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/nouveau/bios: fix u32 overflow in nvbios_addr() bounds check
Message-ID: <F1RMJglEKbUzY1tsFmGLfELM-ZZe2K4V_4LwFEOfnZRs3wVOtsvAagfSueZK675dqsKQ_1ib4eChkv4ruONXnhk6tG-tGo0MyfMrPE9S4g0=@proton.me>
Feedback-ID: 186545857:user:proton
X-Pm-Message-ID: a887073bdea8cec9393d61020284cfe2a962dcf0
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

The central nvbios bounds check overflows in u32:

    if (unlikely(*addr + size > bios->size))
        return false;

*addr can legitimately approach 2^32 after the image0/imaged
remapping earlier in the function (which adds bios->imaged_addr to
the caller's address), so *addr + size can wrap and pass the check;
&bios->data[addr] is then a wild pointer about 4 GB past the mapping.
Every VBIOS table access (nvbios_rd08/16/32, nvbios_pointer) goes
through this helper. The patch rewrites the check in the
overflow-free form.

Affected version/commit: mainline 8a65162514fbad21a2c58ffed65f42b27e92b163 =
(v7.4-rc2 window, 2026-11-08), drivers/gpu/drm/nouveau/nvkm/subdev/bios/bas=
e.c:36-46 (nvbios_addr: if (unlikely(*addr + size > bios->size)) with u32 *=
addr and u32 size), :52-78 (nvbios_pointer/nvbios_rd08/16/32 route every ta=
ble access through it), consumers e.g. perf.c:38, vmap.c:36
Longstanding check.

This was found during an assisted (AI-supported) static source review of
mainline 8a65162514fbad21a2c58ffed65f42b27e92b163 (v7.4-rc2 window, 2026-11=
-08). The patch below has NOT been compiled and has
NOT been runtime tested, and no reproducer was produced - the triggering
conditions are described above instead. Please treat this as a report for
verification rather than a battle-tested fix.

---
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/base.c b/drivers/gpu/=
drm/nouveau/nvkm/subdev/bios/base.c
index fd3192df45..20735fba4a 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/base.c
@@ -38,7 +38,7 @@ nvbios_addr(struct nvkm_bios *bios, u32 *addr, u8 size)
 =09=09*addr +=3D bios->imaged_addr;
 =09}
=20
-=09if (unlikely(*addr + size > bios->size)) {
+=09if (unlikely(size > bios->size || *addr > bios->size - size)) {
 =09=09nvkm_error(&bios->subdev, "OOB %d %08x %08x\n", size, p, *addr);
 =09=09return false;
 =09}

