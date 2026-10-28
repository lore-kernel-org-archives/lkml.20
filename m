Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793198684;
	b=zS/IGmIrZhqgxv5uVhYjPbfn2HEGUOsd4oUglFuuNg2I8Gt1KAs8iFr3W+SZXkTdViP2
	 j7UXE8OATVOw8bH3oTa/7sgC/A2QD1UgXKOb/4yoO/OEIrW/so7KpMRk/78trzlF1YyAi
	 pbcWC65hKQzltC9OFT+nQHjMPoWSd39q7c1ZBpX9NSdm2srYzj4GTJIxLv/EwtDZ7MYVW
	 uWD4mgg5wOc3XyNOpJ6xC19O5OSb/lwdDbGQhu5SbIesZ/o7blSpAox5AgyyveO/W2viU
	 n5oLsJynDp9hapE0YQV4SU9YbEG1u6EcVN9MrEHPtq0UqQFVvOZQBaWKyuIf7FkJx9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793198684;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=h+uN2iMlfIP4A44HxsOdce9du2IgXx8U4PWi0rxqv/4=;
	b=2BHI1FZ1oVCKdl1sRXAJfHBPOIbWpev1HmGe2dvaiusCE5f60GLelF3XVJctO/XZDZCe
	 zBCwKzG93XClIn9b8WuR+EOwk2dxSm7KiGR6cdNEb01fc6GKIpmTIoaQla0KgKIqrblHO
	 IvbEDUexcv33CgNCx00oHp9qwkE5BgGUZzqaXjwtAEicXJgtBBvgfV/ETJQ4jJoLybyeE
	 uXyvTwTtCO6pCQ5EQnxj1ET87GtieUy/ppqBhSUoIS/nC38dt7T0TNH6emFwvUaWfyC6/
	 m4onfVK+unW704GFay0H/ew4y0DY/sBqakpcPEDK8PUCXpJUgIVNUGHvIr9o+ecxW2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mDQWQ1OX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E52606A31E;
	Wed, 28 Oct 2026 14:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mDQWQ1OX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCC6F1F01825;
	Wed, 28 Oct 2026 14:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793198683;
	bh=h+uN2iMlfIP4A44HxsOdce9du2IgXx8U4PWi0rxqv/4=;
	h=From:To:Cc:Subject:Date;
	b=mDQWQ1OXGUkp0/xWXG/EFoYxTKfQt83aMIvFN00bD5/uY/T3tTSVJizdIaA8zsqLg
	 qXuLFIgtHWj+Z427LAlFU71uteHmjFtXoujAEypeBWL1nb/Gh6UfMUf8vx0MbevirF
	 NZQXm1Y1lyoNQz7xRATYo6KCkxwy6A5omO8Z07p2UM08a8P3HVP1RnjusYSPy+QpjL
	 foA9hGtWJ73A86X8Fl9Ol8dGwhi0jk2l5vCCqxuMoyp3t+Dn0iEFgohhzI03qCENTW
	 /UIVdRnAHeXvR8pO1cioNyBJlp6zAqF63f/M6jaDeIsRuVd1GKAZVVu20tmnk76J/R
	 oaJUo+1ivKMsw==
From: Sasha Levin <sashal@kernel.org>
To: Takashi Iwai <tiwai@suse.com>
Cc: Sasha Levin <sashal@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: memalloc: Free the new pages when WC DMA mapping fails
Date: Wed, 28 Oct 2026 10:44:41 -0400
Message-ID: <20261028144441.992127-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
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

snd_dma_wc_alloc() keeps the newly allocated pages in a local variable,
and snd_dma_alloc_dir_pages() stores them in dmab->area only after
->alloc() returns.  If dma_map_single() fails, the error path passes
dmab->area to do_free_pages() instead, and that is still NULL at this
point for the usual callers.

The pages are then leaked with their write-combining attribute still
set, set_memory_wb() warns about the zero address, and for buffers
larger than a page free_pages_exact() goes on to free the struct pages
of the bogus addresses 4096, 8192 and so on.  With CONFIG_DEBUG_VM that
hits the VM_BUG_ON() in free_pages():

  kernel BUG at mm/page_alloc.c:5600!
  RIP: 0010:free_pages_exact+0xcb/0xd0
  Call Trace:
   snd_dma_wc_alloc+0x14f/0x160 [snd_pcm]
   snd_dma_alloc_dir_pages+0x4f/0x80 [snd_pcm]

This was reproduced on an x86 guest without swiotlb by allocating
SNDRV_DMA_TYPE_DEV_WC buffers for a device with a 24-bit streaming DMA
mask, so that dma_map_single() fails.

Free the pages that were just allocated.

Fixes: c880a5146642 ("ALSA: memalloc: Use proper DMA mapping API for x86 WC buffer allocations")
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/core/memalloc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/core/memalloc.c b/sound/core/memalloc.c
index 5bc7e586b430f..3118bb14231ce 100644
--- a/sound/core/memalloc.c
+++ b/sound/core/memalloc.c
@@ -506,7 +506,7 @@ static void *snd_dma_wc_alloc(struct snd_dma_buffer *dmab, size_t size)
 		return NULL;
 	dmab->addr = dma_map_single(dmab->dev.dev, p, size, DMA_BIDIRECTIONAL);
 	if (dma_mapping_error(dmab->dev.dev, dmab->addr)) {
-		do_free_pages(dmab->area, size, true);
+		do_free_pages(p, size, true);
 		return NULL;
 	}
 	return p;
-- 
2.53.0

