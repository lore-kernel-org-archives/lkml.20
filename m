Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794560577;
	b=FDbaa7Z2NWIalTpD1z38x57xF9IsmED1Vwofpqh+FyQt6WNf1X+WiY+GmI+AyAu3gMRA
	 +OidiPsfwIEv4ND+QRNv+9UsKGf/SvPC+aqfnXfwBsf8wF4A11b3DVZWKXk/6LjZlskPY
	 0KlP++ZWi/bja5SfXmbscKFtnks0bzCHLFVGlPrWodn42zzbpyRXJwIrYug/oECX/u9qQ
	 RHixI7XATEdqZsXBqx+Foi93JxJo043hHIvuc7EzqVaXLzzham3uZ2Wim4+OnTQkBSZwy
	 6INaRvhz790qA9UK32eeIyhHgWL84+/5AaUSRxHzRIdYiBMFQ4Ljyl6chhC75L+fZFQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794560577;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Pn5K5SRBmOnd2QGmJKGEIR34SUxy8uE1dhFPkPKg8U4=;
	b=4yM+kR7GqT6BEZ7400eUj9XqUB+xkc5WCPqIxRACqksibrOXKEiZL1RnNZM9zgVnXIZp
	 ngqHKdNkYtpj9ZBn6wL8VorLbOXlMbNlsH2LEij9ttNxxU9HqZ1bUPzH7BuN1B8RHvOO+
	 1YOpYnGsn6+7jnK4Io2zMCs/uzxgGuupy4hXuP+PpvU77VbzmkW9lpczcSYaCEUerFivY
	 FLWld52IJNarylgAEzISYJTMCxWCqI8Pi0o6jl/D5QHoTvttCZaqbhTluTL4Jm64lpKL1
	 Z4w/6DmKw8Fa7TSRUMqH8kJL/N1l5ZMB4gOkdOViLC1pv0U4JmRQuRI9vL/VnXGixpg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GW0RIawp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4056260A2619
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GW0RIawp
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794560577;
	b=hqog0zZ76JkOWOQ5GW44FcXDPxiK/iKHZJK0y5pKSmhBKIOKm7x1sam8zkb42ZsCEiMI
	 CkVb5CaoTEjenEZwkdIBzyrgn51NkM2vV0NLuSuHcG6dKy1Sk+nShkU4PRpdleus+Jj1V
	 rmSYvFHLHoKJdo+mlo5tXYI2pzesN/flRWZWSon1sV6e5ienuZXg1erxTDsd82R2ftGdR
	 7FJUqoKLP4W3RR0EpybI8UieEuCREDwMmHMj3HpKFwbZGYH/Q3/qaaI0BLHJy+P8b9IxV
	 zMe78ZYxBhmsEt/WO/GLEtx+GlLcJvAhGBgvCXMgOZ8/s9vNP/ewVJr/8gBVm50vs0Q==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794560577;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Pn5K5SRBmOnd2QGmJKGEIR34SUxy8uE1dhFPkPKg8U4=;
	b=bqSigyHebRw303WyvHRBKp7OioVkiZxoO+JqJGyEvf2ZNPp5eIAZcVMYvnnufvYfnqAa
	 m+1dYheMOkPcMwFU6+Wl7BToBQCDbFSd39cDlIfgZvWTbQVtTxvdxW60GKVIzKvvzXqet
	 BaPvo2g02+Me+5cnAiLinGrmnGgiESGXNw+pydZ9lHHI+JBnmLEN3+c9hUAJFfVuJQdSH
	 Kp8xgGaKViaBhNRnsFFuaiTqcAdNJFskIJNXk+BHwu5cy89KPylvC72N+ndyAfH3l1OUL
	 lIIAMutIrr0SPn4RT88/FS7fIRKqyMaeRl/lMNCkRw0Sk9VtFShCu0wuvQrajsW6kwA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 237B21F000CA;
	Fri, 13 Nov 2026 09:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794560577;
	bh=Pn5K5SRBmOnd2QGmJKGEIR34SUxy8uE1dhFPkPKg8U4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=GW0RIawp/lfQTz11OYIqFh0J909lznY27t8NALPmptKiSxWeEbKiI6Uul+ZWgZPsc
	 rf27YK/gsuzbn1IWjnBWAnsv3lM5mgwWm7Ib7HSQWaXOLbzXZWb8tTWRqv7xdnoSxv
	 finTS4bLC1keW4QBda+vtatpnuWdsz155iOMzVIhjpN6mwPsJILCf+wa/PvZwEKT39
	 JEFwJVABqVJPsO2MmzAKlHO497/6pLZR8HiRWppwzkcvJQM3ROTiyc0bkQhyeE3mC1
	 TRU3F83AeBgiA5rj/V52Hr07FKXU3B+x9a2QY9AEWOGeqvA/IIec5gx1dqXwUmeSaH
	 bHH2v5V3bEmLg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 53AFE476EE;
	Fri, 13 Nov 2026 09:02:54 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Fri, 13 Nov 2026 09:02:59 +0000
Subject: [PATCH v3 07/14] drm/panfrost: Don't WARN for a heap folio a
 neighbouring chunk filled
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
Message-Id: <20261113-panfrost-long-jobs-v3-7-80ae78d38f6e@gmail.com>
References: <20261113-panfrost-long-jobs-v3-0-80ae78d38f6e@gmail.com>
In-Reply-To: <20261113-panfrost-long-jobs-v3-0-80ae78d38f6e@gmail.com>
To: Boris Brezillon <boris.brezillon@collabora.com>, 
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>, 
 =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794560572; l=2082;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=XXpcQcwG3g1fcEh8QcoBhKkfE7vf6D6K3x6svd1LylY=;
 b=h24WMmGbJQWEvkd4lNCwZUt2t6Na3VbsRTXSdti7GXlmt9LZFYiPro+0t5wBxGGJS1bEAyRs2
 MHqcW4O03xpCBr+GDDSAkt5QptP5kpvhzniqn1ZTH4Iq840G9/abmgn
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

panfrost_mmu_map_fault_addr() fills the page array of a heap BO a whole
folio at a time and warns when a page of the folio is already filled in.
With 16K or 64K pages, the THP mount panfrost uses can return folios
larger than the 2 MB fault chunk (up to 32 MB and 128 MB). The first
fault in such a folio fills the entries of the neighbouring chunks too,
and every later fault in those chunks WARNs, although dropping the extra
folio reference, as it does, is all it has to do.

Warn only for a folio that fits in the chunk: only an earlier fault in
the same chunk can have filled its pages, which is a bug.

Not reproduced: with 4K pages, as here, a folio never crosses a chunk.

Fixes: b49c35ba0ce1 ("drm/panfrost: Fix a page leak in panfrost_mmu_map_fault_addr() when THP is on")
Cc: stable@vger.kernel.org
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/sashiko-outbox-210837@kernel.org/
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/gpu/drm/panfrost/panfrost_mmu.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
index e1c4e57d0..2cf67d932 100644
--- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
@@ -711,11 +711,13 @@ static int panfrost_mmu_map_fault_addr(struct panfrost_device *pfdev, int as,
 			pages[pg++] = folio_page(folio, i);
 		}
 
-		/* We always fill the page array at a folio granularity so
-		 * there's no valid reason for a folio range to be partially
-		 * populated.
+		/* We always fill the page array at a folio granularity, so a
+		 * folio is already owned only if it is larger than the chunk
+		 * and the fault of a neighbouring chunk filled it.
 		 */
-		if (drm_WARN_ON(&pfdev->base, already_owned)) {
+		if (already_owned) {
+			drm_WARN_ON(&pfdev->base,
+				    folio_nr_pages(folio) <= NUM_FAULT_PAGES);
 			folio_put(folio);
 		} else {
 			got_start = min(got_start, first);

-- 
2.55.0


