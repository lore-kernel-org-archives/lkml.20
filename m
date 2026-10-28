Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793198686;
	b=TzG7qKqpoSqVet8/yjV+iWvm9yXNQf5hduvQEfrPJt7wRRYCX2qkC5f4FZPjvlGUrp2U
	 +xnDO9DRAXFmSd1EO0UdyC+o/2rR8rm8Qai0uYqvsvwzHIFVh/2KwzRKWb9jRnNQiMFIi
	 E/BncVYeb8KYFffgIDUrXFd8y6iZgWKFaNuW9Pa916LQ7n/LVGXJxUUI+WAQGKhoenacz
	 cmhm4Mpf5euqaJ/0C+wlLExGkbN1jat6/XXVEFZq5tbyNJJWizr0iZHKVfWWpijXpiSEQ
	 7v/ysw6sA6LHrDKbsCXIBX/2s1UZqqFQaFow+YrLt2PfB437XhNi2mjC3zJWao5vbeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793198686;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0S9uO1EDL+1m4XC+8t2Qhfvz+5zf/rBg8A+iaUjDgts=;
	b=x3T2TkHI55lVxmqsQE9w6IfC0shiaUnmzTLEHZI3Zy74XrrteAY8Gm/XtVyvVOJmRloQ
	 uSfVPZwhGl82rm7i9KWsYZ83P2ZGe4k1IFE34arsptrmoNh7JJDCY+4FJjvkknfazY513
	 3HBRQGeyiibXuAmbx69emLKHKeGCfqAaNoWr/edVAh6Yc03QUNKaRG3zAvv02Auo/NrUa
	 WHiQ3vCTc9M2OtPUCoUAoT/8cGIJNgtoymsJdzraePO8lgu0XgkRTEkaqGXl5An05VhFr
	 GVkws8jH+gifYvWnc3j72VMgH0ldvpl8wYfVulfFwYTgLTGyYVFPH2qTC2Z8Mu/RtOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g4pzrkMF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E25B606A32D;
	Wed, 28 Oct 2026 14:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g4pzrkMF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0580C1F031E0;
	Wed, 28 Oct 2026 14:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793198685;
	bh=0S9uO1EDL+1m4XC+8t2Qhfvz+5zf/rBg8A+iaUjDgts=;
	h=From:To:Cc:Subject:Date;
	b=g4pzrkMFzP5sck29nfMOGo+qtuWUjQ0eHYI52RabvqWMKIOAuo/fMqYLF/zO02MrW
	 QpGbydLPvGQAn8K1GqPgchbmrGkpWH38m3bPViogmvwAcGYYjFLAeUCWHXbq5f9iZg
	 eA6KBdMPP+gPbb/JBMHMLcSw2BkdWD96Py3y6FrHS2JVQYAigYVtd3TXTHIVK6x8CJ
	 ryDHePdQTBuRdzPV5D+zks+ZjEyo8s/l9auSTgs5iAE+Yo1bkxki85To3+rXcxgNYI
	 WA4YoAixc2hryc0NEUnxATeCW80w7w7J80fCkZsC74QsA3GK69wdq8FYFtuXC1iffO
	 Dbd1wsdTXQE8A==
From: Sasha Levin <sashal@kernel.org>
To: Takashi Iwai <tiwai@suse.com>
Cc: Sasha Levin <sashal@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Zhao Dongdong <zhaodongdong@kylinos.cn>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: hda/core: Fix double free on stream page allocation failure
Date: Wed, 28 Oct 2026 10:44:43 -0400
Message-ID: <20261028144443.992569-1-sashal@kernel.org>
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

Since commit f16eaa38ea64 ("ALSA: hda/core: add cleanup in
snd_hdac_bus_alloc_stream_pages()"), snd_hdac_bus_alloc_stream_pages()
frees the BDL and position buffers it has already allocated when a
later allocation fails.  snd_dma_free_pages() doesn't clear dmab->area,
so the freed buffers still look allocated to
snd_hdac_bus_free_stream_pages(), which the HDA controller drivers call
from their destructors, and they are freed a second time when the
device is removed.

With fault injection failing the CORB/RIRB buffer allocation of
snd-hda-intel on a QEMU ich9-intel-hda, unbinding the device then
crashes:

  page dumped because: VM_BUG_ON_PAGE(page_ref_count(page) == 0)
  kernel BUG at include/linux/mm.h:1986!
  Call Trace:
   ___free_pages+0x9b/0xa0
   free_pages_exact+0xa5/0xd0
   snd_hdac_bus_free_stream_pages+0x43/0xb0 [snd_hda_core]
   azx_free+0xb3/0x1b0 [snd_hda_intel]
   azx_dev_free+0xd/0x20 [snd_hda_intel]

Clear the buffer pointers after freeing them in the error path.

Fixes: f16eaa38ea64 ("ALSA: hda/core: add cleanup in snd_hdac_bus_alloc_stream_pages()")
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/hda/core/controller.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/hda/core/controller.c b/sound/hda/core/controller.c
index a7acd3418ae8a..32574dc899fad 100644
--- a/sound/hda/core/controller.c
+++ b/sound/hda/core/controller.c
@@ -764,10 +764,13 @@ int snd_hdac_bus_alloc_stream_pages(struct hdac_bus *bus)
 
 error_posbuf:
 	snd_dma_free_pages(&bus->posbuf);
+	bus->posbuf.area = NULL;
 error_bdl:
 	list_for_each_entry(s, &bus->stream_list, list) {
-		if (s->bdl.area)
+		if (s->bdl.area) {
 			snd_dma_free_pages(&s->bdl);
+			s->bdl.area = NULL;
+		}
 	}
 	return -ENOMEM;
 }
-- 
2.53.0

