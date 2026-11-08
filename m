Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794182216;
	b=lIxvuxsCvGpKnVc5xm/5/Ng98nbFTiVXGiUkLOKaATbXGI+TUDBqcE75xh84j+p77v5l
	 Hi+nu0SNze/iLNcOb3ypjEjPj89UDfciu6G8hYg9T3anHyNaYOFPPLw1jrlmaJVavqmZD
	 0RnJsIZ/gmNZBVFbr5JBhNkxoj1QdmrBY9gxclkCMSIsCtMYL7zGaCmTy4xnRjpJ3ueo6
	 DNS6U4xQTNrm6Lj+asOBCD+ATgbKChVb/UeJLw1VFfjit917PFrIvH6hVIZt0X6qKCry3
	 qxJthBQ5YeL2bvql4DclPyfrPRnDe9uUdoPCMmMjgBHE0Qq6Yv3Gyxk/nfphHkom9OQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794182216;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=MJW8N/bCptGqVujyyJa1efebwWocnO2Ib6jx/p8Co5I=;
	b=W8G1cUHv3vHftPMbeatT95InQfvlKbWy+bcbnyIjA9vKzHdO0cYqchD3+97dcJDWBYPk
	 1S2p+ykW2q1ZhLmzJD5k/Qp6Cinl2MmHs25zGOgJ6IuN1nLg3GBivnmTTdGZumZf7lDVx
	 TVKRZOGx4ECw/+tz0crHkbv+BIH8/dVb77xL3seYbMBCrlAupefOHmTuBnSw40YayDzX5
	 UM1790OuyB0TvK1lelb8yjIruxVdZUOio5s2KP5pEcjDrv6rjK/wXs7EfhLuAbc/HH+V3
	 tFdNtvTJREAWiMBvmavb42jgkmjT6T+nVU/KbBpCJLXO5KN0uO9vBBrxBoPatDx26sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=fvphmuqjrfdwtmq23ycfpudnei.protonmail2 header.b=yCkISfC5;
	arc=none smtp.remote-ip=185.70.43.16
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45D84606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 23:56:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45D84606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=fvphmuqjrfdwtmq23ycfpudnei.protonmail2 header.b=yCkISfC5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=fvphmuqjrfdwtmq23ycfpudnei.protonmail2; t=1794182213;
	x=1794441413; bh=MJW8N/bCptGqVujyyJa1efebwWocnO2Ib6jx/p8Co5I=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=yCkISfC5Dc8+OOHSA6mNmum2fO4+KpRhmxoROiz/TggqgSatOUd95PDru0oQkdh/e
	 jJpaFpuQaSJdZ0pjsIvIFgoEyU0ysBKVUW9o5L3hA5Tt6G7iwPWr0FCVO+/ySLbrWO
	 F7Y8hAx0nhqrW/6prS33/JfU45zUaj0h/s73pCBpztkesy2Px3SFs2SR9Kxz5922ll
	 Pk1bqiaMzUgl/GGXBnx3qx9fTMF2Y6zBuXpV/LUpK6A7xOiW2BTc7dSxXnMnDqQmUz
	 Y9wp9ksRRnMGg4nRUjOSAUS2Cx+JsVvWlESiKLH3e/6hsCC7wr+c5wbyu/qt2vcK0v
	 HuMLX8cgxvf8A==
Date: Sun, 08 Nov 2026 23:56:48 +0000
To: "lyude@redhat.com" <lyude@redhat.com>, "dakr@kernel.org" <dakr@kernel.org>
From: Noah Weinberger <NoahWeinberger2003@proton.me>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/nouveau/bios: cap init script nesting depth
Message-ID: <G3ZimZOZlItufllm5LR-ZRqoCo-h1QHacMCwFBHkYMjFTbdf5zFKkZ6mapaYVWYHw9rMh2mB18OYq1tOnMFP-Pn8W2M9Rsq-EBpL2HI8tJw=@proton.me>
Feedback-ID: 186545857:user:proton
X-Pm-Message-ID: 141651b0d4db0c1beb5def9c9ac606ec682f31fb
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

INIT_SUB_DIRECT executes a sub-table by recursing into
nvbios_exec() after redirecting init->offset to a u16 address taken
from the VBIOS:

    save =3D init->offset;
    init->offset =3D addr;
    if (nvbios_exec(init)) { ... }
    init->offset =3D save;

A sub-table that directs to itself (directly or via a cycle)
therefore recurses without any limit - the init->nested counter is
incremented and decremented but never checked anywhere. The result
is unbounded recursion and kernel stack exhaustion when the script
runs at devinit/display-init time. The patch caps the depth at 16,
which is far above anything a legitimate image needs.

Affected version/commit: mainline 8a65162514fbad21a2c58ffed65f42b27e92b163 =
(v7.4-rc2 window, 2026-11-08), drivers/gpu/drm/nouveau/nvkm/subdev/bios/ini=
t.c:1343-1363 (init_sub_direct sets init->offset =3D addr and calls nvbios_=
exec() recursively, restoring afterwards), :2302-2319 (nvbios_exec: init->n=
ested++ / nested-- with no limit; the counter is bookkeeping only)
Longstanding interpreter.

This was found during an assisted (AI-supported) static source review of
mainline 8a65162514fbad21a2c58ffed65f42b27e92b163 (v7.4-rc2 window, 2026-11=
-08). The patch below has NOT been compiled and has
NOT been runtime tested, and no reproducer was produced - the triggering
conditions are described above instead. Please treat this as a report for
verification rather than a battle-tested fix.

---
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/init.c b/drivers/gpu/=
drm/nouveau/nvkm/subdev/bios/init.c
index 3f888fb979..93d090d529 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/init.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/init.c
@@ -2304,6 +2304,10 @@ nvbios_exec(struct nvbios_init *init)
 =09struct nvkm_bios *bios =3D init->subdev->device->bios;
=20
 =09init->nested++;
+=09if (init->nested > 16) {
+=09=09error("init table nesting too deep\n");
+=09=09return -EINVAL;
+=09}
 =09while (init->offset) {
 =09=09u8 opcode =3D nvbios_rd08(bios, init->offset);
 =09=09if (opcode >=3D ARRAY_SIZE(init_opcode) ||

