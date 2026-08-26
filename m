Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A4773B7753
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 22:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787781713; cv=none; b=mv/6Jir7y002TzyjITWOe1NGyIZFxVOYZxouLDpkznsPNTIqztwHwhz5ZFNybxX7sRTWjlOy/NKu5lqCfj1qmhxN7bWiEJLl+jq9qclS769zRRXFxIOKF3RQ4/3ROAXIHsAjHUqs3PGdEFPTx9iF3PSfQbgnAzidCkAs+nd5In4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787781713; c=relaxed/simple;
	bh=ny27h0zO3Ndfn/qM++rOff6nZaKGRZlfO0GvhJeJgmo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 Cc:Content-Type; b=aLf0FOh5auR1eZPbkHTgRWMWI8AMr5vPMwCyGb80kKgglm5lHc99Q2MO58BXC/Yl3u4oih2/gwGVXYUgRJkS1BG6FIFi2jCsbQDEiS70J0gfTPOua5QQkfQ4sleYhgmSFhcJPg5AIZ5nOhIXI3JE/Rz9rFAJQKqPf3Rtx4Ore78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--morbo.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tUIiAiIG; arc=none smtp.client-ip=209.85.214.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--morbo.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tUIiAiIG"
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d6fed0652bso20592205ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 15:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787781711; x=1788386511; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:from:subject:message-id
         :references:mime-version:in-reply-to:date:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H6eKz7tR30Dozwm5hWg5ie0MrnymWRTzkxQg3Uw+4uY=;
        b=tUIiAiIG9wakY81AEYKMj8BgwBNa5TU+hmiBzBcHp8Ea2azWzTjNkKCI8l5lUCOVRA
         7fDyVSi7sTqEcXIlExNgdvI+R095j8HY+1Q2Ddz6ypvl2wNru7NexQOFRid/ZY6DatDM
         YaAGRAnMBM3w/j1L35eLaNog517ILlR3FisFmZI5lKKskqga/RskEe3YkmKhi8CUcwQc
         Y4TjDBtwSKAfHZ0qm+ViT3IO2/eqejtBJmVk07jped4xdvtryL7f0rvtbXgFGfVk58JW
         lKI64YcIe6C5TzuH1GNOjxyHQISIJAjcnfjYs8PbNg6IiirVxeJlZ28DS7AXrYZPOf6z
         Yg6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787781711; x=1788386511;
        h=content-transfer-encoding:content-type:cc:from:subject:message-id
         :references:mime-version:in-reply-to:date:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=H6eKz7tR30Dozwm5hWg5ie0MrnymWRTzkxQg3Uw+4uY=;
        b=MFAwvTc4NHhfiEp9USEUnsFWwYEEx4GBFcNCnKrRkFr2wj14q4tr6lcI+WS53LPtOE
         5eYkCSw4tMGA0IEpULeqgf/eM3tPv6LXyCqmyfGNMqbR92pYXv2dyNU/Prhmlq6F5v3c
         4ixD+73Ouar+5lEPlleU2g0o7SRra+3mx7q7MSQ/EbJZzjtWQZ7eTWoO3l/OJr/KC+nx
         Sya7bYPsvQkw1SuDMhCppRn6Kks417HGvKXlSCHLN3S6t9pcm0B5Ki4TqHlbC6927Kc6
         uqiZm/Wz7IU6OFo09JOeeG1LI40oPEO+dy3IkhgjQE7vZzXocFBjISe1DqqiPcdpKcM+
         01Rw==
X-Forwarded-Encrypted: i=1; AHgh+RrYbtXNQp/Bedh3kbPqCq6LsINYghjUwQWBuQPlA3H/+acbcgrQfaKLGEdF4yQO2hY+vTBPwec8QVdZ7ys=@vger.kernel.org
X-Gm-Message-State: AFuF++lYfHCaXyVH2ExyeaUBeYwzh/33HzNk3Z9FZGIu9GPL5E2AH3X5
	AME4z0ieglEohe7cVI21cLEtBBz03jOG7Lve0ngffMwbqOG3x4Q4H0UbaDeOhJrKI9wCrBJ9jmF
	t
X-Received: from plbjg12.prod.google.com ([2002:a17:903:26cc:b0:2cc:e407:8fee])
 (user=morbo job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e74a:b0:2d2:da8e:9017
 with SMTP id d9443c01a7336-2d707ae31e5mr144405135ad.8.1787781711014; Wed, 26
 Aug 2026 15:01:51 -0700 (PDT)
Date: Wed, 26 Aug 2026 22:00:34 +0000
In-Reply-To: <20260823125155.1136740-1-morbo@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260823125155.1136740-1-morbo@google.com>
X-Mailer: git-send-email 2.55.0.897.gb25b4bd76c-goog
Message-ID: <20260826220041.4075333-1-morbo@google.com>
Subject: [PATCH v4 1/2] userns: Add __counted_by_ptr attribute to struct uid_gid_map
From: Bill Wendling <morbo@google.com>
Cc: Bill Wendling <morbo@google.com>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	Bradley Morgan <brads@mainlining.org>, 
	"=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?=" <thomas.weissschuh@linutronix.de>, Kees Cook <kees@kernel.org>, 
	Christian Brauner <brauner@kernel.org>, Aleksa Sarai <cyphar@cyphar.com>, Jan Kara <jack@suse.cz>, 
	Nathan Chancellor <nathan@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, Gary Guo <gary@garyguo.net>, Alice Ryhl <aliceryhl@google.com>, 
	Douglas Anderson <dianders@chromium.org>, Anand Moon <linux.amoon@gmail.com>, 
	Oleg Nesterov <oleg@redhat.com>, codemender-patching+linux@google.com, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The compiler attribute __counted_by_ptr associates a pointer field of a
struct with a sibling field within the same struct that specifies the
element count of the allocated memory. This enables KASAN and fortified
bounds-checking to detect out-of-bounds accesses to the pointer field at
runtime.

We can add the __counted_by_ptr attribute to the 'forward' and 'reverse'
pointer fields of 'struct uid_gid_map', which are counted by
'nr_extents'. Since 'nr_extents' is defined in a sibling anonymous
struct inside an anonymous union, the nearest common non-anonymous
struct level is 'struct uid_gid_map' itself, which is supported by the
compiler.

However, doing so has runtime implications. In the original
implementation of insert_extent(), elements are written to
map->forward[map->nr_extents] before map->nr_extents is incremented:

	if (map->nr_extents < UID_GID_MAP_MAX_BASE_EXTENTS)
		dest =3D &map->extent[map->nr_extents];
	else
		dest =3D &map->forward[map->nr_extents];

	*dest =3D *extent;
	map->nr_extents++;

At the time of writing to 'map->forward[map->nr_extents]',
map->nr_extents is still 5, but we are accessing index 5 (which is the
6th element). Under __counted_by_ptr(nr_extents), the compiler and
KASAN expect the accessed index to be strictly less than
map->nr_extents. Therefore, accessing index 5 when the count is 5
triggers an out-of-bounds panic/trap at runtime.

To resolve this, insert_extent() is refactored to increment
map->nr_extents first, and then use map->nr_extents - 1 as the index:

	map->nr_extents++;
	if (map->nr_extents <=3D UID_GID_MAP_MAX_BASE_EXTENTS)
		dest =3D &map->extent[map->nr_extents - 1];
	else
		dest =3D &map->forward[map->nr_extents - 1];

	*dest =3D *extent;

Assisted-by: Gemini:3.1-pro-preview
Signed-off-by: Bill Wendling <morbo@google.com>
Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>
Reviewed-by: Bradley Morgan <brads@mainlining.org>
---
v2 - Remove Gerrit tag.
v4 - Added comment explaning the change. Corrected the "Assisted-by" tag.
---
Cc: Bradley Morgan <brads@mainlining.org>
Cc: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
Cc: Kees Cook <kees@kernel.org>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Christian Brauner <brauner@kernel.org>
Cc: Aleksa Sarai <cyphar@cyphar.com>
Cc: Jan Kara <jack@suse.cz>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>
Cc: Gary Guo <gary@garyguo.net>
Cc: "Thomas Wei=C3=9Fschuh" <thomas.weissschuh@linutronix.de>
Cc: Alice Ryhl <aliceryhl@google.com>
Cc: Douglas Anderson <dianders@chromium.org>
Cc: Anand Moon <linux.amoon@gmail.com>
Cc: Oleg Nesterov <oleg@redhat.com>
Cc: codemender-patching+linux@google.com
Cc: linux-kernel@vger.kernel.org
Cc: linux-hardening@vger.kernel.org
---
 include/linux/user_namespace.h |  4 ++--
 kernel/user_namespace.c        | 12 ++++++++----
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/include/linux/user_namespace.h b/include/linux/user_namespace.=
h
index e38d9e60569f..2962256eddf7 100644
--- a/include/linux/user_namespace.h
+++ b/include/linux/user_namespace.h
@@ -29,8 +29,8 @@ struct uid_gid_map { /* 64 bytes -- 1 cache line */
 			u32 nr_extents;
 		};
 		struct {
-			struct uid_gid_extent *forward;
-			struct uid_gid_extent *reverse;
+			struct uid_gid_extent *forward __counted_by_ptr(nr_extents);
+			struct uid_gid_extent *reverse __counted_by_ptr(nr_extents);
 		};
 	};
 };
diff --git a/kernel/user_namespace.c b/kernel/user_namespace.c
index 0bed462e9b2a..786dbf0506ca 100644
--- a/kernel/user_namespace.c
+++ b/kernel/user_namespace.c
@@ -809,13 +809,17 @@ static int insert_extent(struct uid_gid_map *map, str=
uct uid_gid_extent *extent)
 		map->reverse =3D NULL;
 	}
=20
-	if (map->nr_extents < UID_GID_MAP_MAX_BASE_EXTENTS)
-		dest =3D &map->extent[map->nr_extents];
+	/*
+	 * nr_extents must be updated before the extent and forward arrays are
+	 * accessed, otherwise KSAN will assert an out-of-bounds error.
+	 */
+	map->nr_extents++;
+	if (map->nr_extents <=3D UID_GID_MAP_MAX_BASE_EXTENTS)
+		dest =3D &map->extent[map->nr_extents - 1];
 	else
-		dest =3D &map->forward[map->nr_extents];
+		dest =3D &map->forward[map->nr_extents - 1];
=20
 	*dest =3D *extent;
-	map->nr_extents++;
 	return 0;
 }
=20
--=20
2.55.0.897.gb25b4bd76c-goog

