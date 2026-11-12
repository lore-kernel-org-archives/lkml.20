Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794473317;
	b=0EE1Jy2JyEqi1ITagRkQaL+JWDlyL6N36qh5Xi7qEcH2u2zIoXy1BCK5cQXGzV/tM8WA
	 8xCOTDnCoJRIBBhh0S4b8oIfLJhDbWeSnfJskuh9Q7wurLR/4BFVqk/riVLpz3ZjGUaYL
	 LwmIB35iHe4JmyyT6rVJduFOdwsCXNXB3N5VWBpdFvWj7A0L64EooeUKCSECqBYVmTwzj
	 gkYhMU5qqdX7yhfi0pn5JRgtumBj/5UscIjmQ4U3w3YDE6ktxZvt4new9qIbkvxid6/4s
	 tQNnLrmslQO6It3iufqVxe5WIOTe7k5ABbVIuvKjOP6MufcWK0qUOyas0o6/gIrWEiA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794473317;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=SybEBamRVhhWKZBpvZM7kEpzIKLm/33VXIk0s84Bm/g=;
	b=p8DlXyKT5JPEJx+XJXmgjDuQVAxbLvXb1ckoxBsgGCACmtekGCuoJNAKyqNP9hUAHW7v
	 ccsNB04SPn6U6hrL/TPeuyXOjFrQVrlUjhvKMPneanPpUG1+af40FGna2mqXXD5ldD821
	 0M1tx82gS6O5pVW642K7gJTaOE0qQy8AGNJkKEp5YgCqVBXmcrB7CGsLAt54piMSiUoop
	 wbImBH4ZZq0yOMil3HsxW96enNPpCqvV9ldBNR2UG513zEH8CKzFKaQhhhcHBZjfwgi7N
	 /Y7G0H99PIhzDXB1wXlIKEJJjpulOWsInijWIGZVpvBMXQpAmGMEU4locSuort4Wqdg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MYiwuPNB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E829F606A88A
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MYiwuPNB
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794473316;
	b=pcdr1G2a3dsVVjlymrMYdIU/68HYfIzrXqXzetHYxpXFd8Dx9rxiLmcUzgcTw5ZTQA8X
	 R/LvS+Sm4/CcUXrwFirUQv0BuSz5zX+Lvis65d4w/87AHKLV/1/Lt5oUaysBZOkNzgWMF
	 7wHa9+F0EPHy0X5B0oF+Td+8oh9TjEw0bRWufvEKxkN6S1d/BOJOomtL3uL8nKk8XNWYm
	 GidDuVUEXVGoSZerxDD9XSzyqIR6955yDgFj7uo9/iV4kVC6oZ12TMptMrR+gVlpoznO+
	 KE/AMtbPuITxJVa9p4RUxJkr8assvPxNWI03F+mIdPCh40M3XEmrhYKKPLzY0w1AErg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794473316;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=SybEBamRVhhWKZBpvZM7kEpzIKLm/33VXIk0s84Bm/g=;
	b=e7pHWlNxBbTsqhECiuGtfg+0Q7A8V59lvX0Auf/W3Kq07ozz1vlHRoFYh7U8H5QZOtEd
	 z7iZHnpAyRHdWtqLgRVgpGzyBlbUnj6JA17vRN9DYQW/1EDm/X7M7Edg5trdpK2TpAg+Z
	 iIE8YcfM6oQFHoIxYrHwXO7iX4w8ttw3GpK1PwLJ36OEpOM0uuaLoQrk3HG22X21FgJvf
	 6+VqwmUs2pH4BesuXaGwWGGFwSVX3x1E3adJfqNWHG8celT237VamI5g4M0kXVXa2+x+4
	 Tc/SRrluC5qt0VTA8L7osFiSIHpiuG3aaCxBuwLiCbixAHYvcezruRHho7cLYHDpPkQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AED021F00A08;
	Thu, 12 Nov 2026 08:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794473316;
	bh=SybEBamRVhhWKZBpvZM7kEpzIKLm/33VXIk0s84Bm/g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=MYiwuPNBqSAAMbxrxrO/QV9n9f/gRFyvZ4R6dVtckLkBZ64jg/f5y+swgRukZorDn
	 oLSTr7o0AK5EN5GKLCDnyJgGd4SGykdsNnfsuadPbWdvOUP3V7QKIrZKHTW+VT3OfA
	 YM1K9JsFgZafszgXbvG70c+ZpDzZzkuHSaOrKcX8krEna0JR7ohC/Yw5R7/zPqgmZW
	 b/2lgiYHFbgk4Fydhs45iCcuh1kG3L3FJ/ocJvbwByVz7Xxa6onXEOnSsaftEsikc5
	 0+KbwWX+oZVHXwzMTIupw2zjeOrWsnd6EPtK10fx00wm8zvb+45+JWCjmOBvp1uUH/
	 +AR5nyY69hJMA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 3EC70493E5;
	Thu, 12 Nov 2026 08:48:35 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Thu, 12 Nov 2026 08:48:36 +0000
Subject: [PATCH v2 03/11] drm/panfrost: Don't take a reference on a mapping
 that is being freed
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261112-panfrost-long-jobs-v2-3-a06830da3d99@gmail.com>
References: <20261112-panfrost-long-jobs-v2-0-a06830da3d99@gmail.com>
In-Reply-To: <20261112-panfrost-long-jobs-v2-0-a06830da3d99@gmail.com>
To: Boris Brezillon <boris.brezillon@collabora.com>, 
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>, 
 =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794473314; l=2240;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=rqdqg/OAAoy83+50ChQ3aQoU7NkR4pnj4DQAb5ccFxY=;
 b=Oyzab45fRaSg0gCSQpPedyAhPZ8VSqJ25maLTpFnmx5Sm1cIpV2KK+zz9i9BzB0yVnH1IDLF8
 yc4H6gxvNvOAAyev8HEdZIcS8xMq+JnKj0NcBoeE8duLrwihorKerVC
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

addr_to_mapping() looks up the mapping that contains a faulting GPU
address in the address space's drm_mm and takes a reference on it with
kref_get(). But panfrost_gem_mapping_put() drops the last reference
before panfrost_gem_mapping_release() -> panfrost_gem_teardown_mapping()
unmaps the BO and removes its node from the drm_mm under mm_lock, so the
lookup can find a mapping whose refcount is already zero. kref_get()
then revives it (refcount_t warns about the addition on zero), the
release goes on and frees the mapping and drops the BO, and the fault
handler maps pages into a BO that is being freed.

This takes a GPU fault on a heap BO's address while the last handle and
the last job reference to that BO go away. Jobs hold a reference on the
mappings of the BOs they list, so it takes a job that uses a heap BO it
does not list; userspace on the render node can submit that.

Use kref_get_unless_zero() and treat a mapping that is being freed as
absent: the fault is then reported as unhandled.

Found by code review: the same pattern in new code of this series was
reported by Sashiko. Not reproduced.

Fixes: bdefca2d8dc0 ("drm/panfrost: Add the panfrost_gem_mapping concept")
Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/all/sashiko-outbox-206570@kernel.org/
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/gpu/drm/panfrost/panfrost_mmu.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
index faa62643c..eaf94d47d 100644
--- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
@@ -576,7 +576,13 @@ addr_to_mapping(struct panfrost_device *pfdev, int as, u64 addr)
 		    offset < (node->start + node->size)) {
 			mapping = drm_mm_node_to_panfrost_mapping(node);
 
-			kref_get(&mapping->refcount);
+			/* The last reference to a mapping is dropped before
+			 * panfrost_gem_teardown_mapping() takes its node out
+			 * of the address space: don't revive one that is
+			 * being freed.
+			 */
+			if (!kref_get_unless_zero(&mapping->refcount))
+				mapping = NULL;
 			break;
 		}
 	}

-- 
2.55.0


