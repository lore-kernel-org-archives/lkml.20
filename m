Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.117
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792516876;
	b=OzDagg30NYI4tV4LG/kwYsg/2OQMr3czmOMOq+Ncfu9dYLCW57ZxjXUzONvQta1LkAnX
	 zNhqgyarLuFTs3YCXeAdO6rDPucwrQ1qQkQRRnFGoG7IliTDiS1s3fuOYf4/ArKeEJkVd
	 LuE4yAEI84NHupEtY9euA0hg6Un1VIgvT2UpiNxGeEZHsc3AQch8encLAlrT4DMqV82P2
	 I+q5H8nkPfAn+sJTb+1nDE4pSfttTZf/xRQV9RFCvrSRatoBYhVMXxa/o5dbMdiUR57Rr
	 G4IfxtfrCBdc74QDda3LdWtEAlPEw1bbCwTotGcYc18CiDJzeVJ5Hroch86L+pJ1cew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792516876;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=TbeuB1pI6Qx3cFqyT3E7YKcwCBIJAjWx9mje7M15GYk=;
	b=3LwOvJCmEBGFUTdIf4CjdXwxbWQs/ijqvJrcbTOMoalNvfM6099O9uD2SAuXXN8icMJC
	 kgD63xp529IePrvgnid7DGPh2tGVVUB8x1Kng3omR9n//MsOP886zZTQpmSMI93RC3LjJ
	 yqLOFh2JVFxqXB4aamPUxlAjFX+oc5vBfnh4x+dKHPIbouPiqYjI/e44nlWG/lF6lyI9X
	 JGed3tSm8xa0N8EeVIKG9yoAr3F7pL9EmGh1moOIRz7qtzRFXRTvyyCU/W/JG4PaWfxSa
	 sJDJYdsCub8JCD1xSGw0PEUwiDGgMgiU50WWgt/KAda6tQWCw7MT2rtj0dgizVqP4qQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=1g4.org;
	spf=pass smtp.mailfrom=1g4.org;
	dkim=pass header.d=1g4.org header.i=@1g4.org header.a=rsa-sha256 header.s=protonmail header.b="ngX/QL0B";
	arc=none smtp.remote-ip=109.224.244.117
Received: from mail-244117.protonmail.ch (mail-244117.protonmail.ch [109.224.244.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D506960A260E
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 17:21:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D506960A260E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=1g4.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1g4.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=1g4.org header.i=@1g4.org header.a=rsa-sha256 header.s=protonmail header.b=ngX/QL0B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1g4.org;
	s=protonmail; t=1792516873; x=1792776073;
	bh=TbeuB1pI6Qx3cFqyT3E7YKcwCBIJAjWx9mje7M15GYk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=ngX/QL0ByKU3avZXFy3YLhi/qik667+r8aHht74+YoBtRgLyXYqj9YvDsBVbTdkD/
	 dh6IgYdtkTFl1fImz532CUpidZTcWKerm+RjG3BMzwZdKLFMSQg71Z/QBaqpO9OXrA
	 q/gvDO0HJjhx8wTf+gpigTjOBgSMstAeW8ElE4lLAtegY0uSfliOKBMCcIODEf2sqw
	 lnhEROt0A/xxgOCletFyh9wqrblRXcga5foniSfX+ZstB5FaejuQuqMBlmYS4yU/N5
	 SxmzYB7Zx8/qrhBgQYoabe8SCV+YmZe0llmp0XTfRbap8Xy4Lsyis7vU2B7INCvZB8
	 bLphZFZX63B+A==
Date: Tue, 20 Oct 2026 17:21:07 +0000
To: linux-perf-users@vger.kernel.org, acme@kernel.org, namhyung@kernel.org
From: Paul Moses <p@1g4.org>
Cc: peterz@infradead.org, mingo@redhat.com, mark.rutland@arm.com, alexander.shishkin@linux.intel.com, jolsa@kernel.org, irogers@google.com, adrian.hunter@intel.com, james.clark@linaro.org, kan.liang@intel.com, linux-kernel@vger.kernel.org, Paul Moses <p@1g4.org>
Subject: [PATCH 2/2] perf mmap: Preserve the consumed cursor in forward mode
Message-ID: <20261020171946.3593127-3-p@1g4.org>
In-Reply-To: <20261020171946.3593127-1-p@1g4.org>
References: <20261020171946.3593127-1-p@1g4.org>
Feedback-ID: 8253658:user:proton
X-Pm-Message-ID: a07aa1e0e752fd93506ce82a31e4d75a620c6bbc
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

perf_mmap__read_event() updates prev as it consumes forward-buffer
records. perf_mmap__read_done() then overwrites prev with a fresh
producer head, even when unread records remain.

perf_kvm__mmap_read_idx() stops after 25 records per mmap and calls
read_done(). If more records are pending, prev advances past them. The
next drain starts at that new position and skips the unread remainder.

An event arriving after the last empty read_event() and before
read_done() can also be skipped. read_done() does not itself update the
kernel's data_tail.

Only refresh prev for overwrite buffers, which need the current head as
the end of the next backward read. Leave the forward cursor at the
consumed position.

Fixes: 53172f9057e9 ("perf kvm: Switch to new perf_mmap__read_event() inter=
face")
Signed-off-by: Paul Moses <p@1g4.org>
---
 tools/lib/perf/mmap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/lib/perf/mmap.c b/tools/lib/perf/mmap.c
index ec124eb0ec0abbcc4a395eca7478129a74309965..ab3adf1d8baf933d5386faf743f=
178b0a7da44c5 100644
--- a/tools/lib/perf/mmap.c
+++ b/tools/lib/perf/mmap.c
@@ -200,7 +200,7 @@ void perf_mmap__read_done(struct perf_mmap *map)
 =09/*
 =09 * Check if event was unmapped due to a POLLHUP/POLLERR.
 =09 */
-=09if (!refcount_read(&map->refcnt))
+=09if (!refcount_read(&map->refcnt) || !map->overwrite)
 =09=09return;
=20
 =09map->prev =3D perf_mmap__read_head(map);
--=20
2.56.GIT


