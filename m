Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792750905;
	b=Y7QZtHU6i5+1jdobpisabxBujHxyOG4a83At5zjFBNewhBIKyl4nEKVYWQg8EnDXmcnk
	 28zkzgUvuxjM0fJaDTa6zYYAvmnc+8H6b1J1x3NU3zlatQ2j1uMRxU6mHNYo1LoUPjWcY
	 ZuMm4vweBtP8n6YPQjPO+o0jihpfVn4/zmhtiyvPSmXkV3lALPNekrMFpxPQNeExiPCtd
	 S6nMjEV2B4lZVBZZHWCbCq4amsF2WDVaZVG0PX8WIGxLSzdB+MENWntWmeIVoX0A3M3R4
	 JRpj7Fl3dlf2PeVL85uJHPZpedthBs3Pfi6omH5GrD3V0Xi6Ea44ilg61VosHJQrRRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792750905;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=sYRuHapo9W9wmZIPuuqoJgF5i8UHavCm+9OHunlMqfk=;
	b=o4wXFn5zX2t++Iu+PUbDb6ct6mHoqtiZI1NO81qdpvf2Eluyzn69y8j/y0tLiwZM+DwL
	 3lY3wl8PIi5XPjxbQhVUBnx41O0pbEdRKaEcG+/TrAB2etyTNpMnxZEeZRnptFWlt5j3q
	 QPXp3OKUP/XAhbTsPTdgaFMmw7T+FXX8IGPo5SNccVB91cPnr60PWjOTp9nQvTZdvDvee
	 tsc/XLMLDh4U0czF+cK2ywdZi2nk83loIauLFzMP1w4+R12bJScVBJjzIG7R8K4nrCSQl
	 n4eUV8vsv3J61ElXzdiyEVT31zpcHmUUTe4UpRZzaH1jx0iF+IZG+ljcpTIKBeHLqUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Try0UpDq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D7A2606A31B;
	Fri, 23 Oct 2026 10:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Try0UpDq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6EAD1F031E0;
	Fri, 23 Oct 2026 10:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792750905;
	bh=sYRuHapo9W9wmZIPuuqoJgF5i8UHavCm+9OHunlMqfk=;
	h=From:Date:Subject:To:Cc;
	b=Try0UpDqk13dUQv8kNuuSByobmY1fv+iclYkBIhj56IHmpUTI8tuRlRsH16FD3C4j
	 zlRVStaEGZsGe4E+yRPuIHMQ4+GCJnlUCLFsvw2nUUP/dVbCKcobPj4Bh1rarhPd1+
	 WhFNy1vksDUeHtjnnGksLcd+NVnrZvnjxckZ1g+fHk0ZduQ3zzuC5CR3zYoyksbrOe
	 B21ZbmW2ng6gNc7qt2Pb5ZltyDn4aRsyi0YvfArfp/7Emn9PsJL1L6+2n7IHbnww9V
	 c+FVcJJVQ+SaumXh3oNCS9OCKVrnEZcM3bIhhtnQ22np4lLR5rnNuTi1xLyLUq8VEE
	 9BR2NjC9H2n3Q==
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Date: Fri, 23 Oct 2026 11:21:31 +0100
Subject: [PATCH] ALSA: us122l: mark hwdep mappings VM_MIXEDMAP
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-fix-us122l-mixedmap-v1-1-e7bdd053850f@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MQQqAIBAAvxJ7bkE369BXooPlVgtlohRC9Pek4
 8DMPJA4Cifoqwci35Lk9AV0XcG8Wb8yiisMpKjTihpcJOOVNNGOh2R2hw1IztCiWjsZ0lDKELl
 o/3UY3/cDviw63GUAAAA=
X-Change-ID: 20261023-fix-us122l-mixedmap-2d42f05ab421
To: Andrew Morton <akpm@linux-foundation.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Kazuki Hanai <hnkz.64@gmail.com>
Cc: Takashi Iwai <tiwai@suse.de>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, ljs@kernel.org, 
 David Carlier <devnexen@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2436; i=ljs@kernel.org;
 h=from:subject:message-id; bh=lNhw2btcFfOxweCD1NL36wEg9RyU1oHp6QFW0PYzg9k=;
 b=owGbwMvMwCV2fu7ZrsZH9SKMp9WSGLJum5o5/ivQ58jn8zv2RHuxzi4vhWen7D8p6M6etdBfY
 5r3okNzO0pZGMS4GGTFFFmefxHfHyQSNq/zgr8bzBxWJpAhDFycAjCR62kM/yM+mvMtYtvx6ciM
 uftbnaPzCq2FbISl57UbXspvlcp99IuRYVPi7DJ1jvJy103L3t3cOpn5Eh/jpN/FLDZ1Z82T+FP
 +MQIA
X-Developer-Key: i=ljs@kernel.org; a=openpgp;
 fpr=E7F417BF5214569E89D04F46CF9DCD8A81E27F14

mm has recently moved to a strict model which requires any driver which
clears VMA_MAYWRITE_BIT to be mapping non-mm-managed memory
(VMA_PFNMAP_BIT or VMA_MIXEDMAP_BIT), failing any such mmap() with an
error and a kernel warning - see "mm/vma: only allow mmap to clear
VMA_MAYWRITE_BIT if not mm-managed".

However, simultaneous to this, commit 71c610aeb177 ("ALSA: us122l: Prevent
write upgrades for read mappings") updated us122l to clear
VMA_MAYWRITE_BIT without marking the region with either VMA_PFNMAP_BIT or
VMA_MIXEDMAP_BIT.

vm_insert_pages() and friends set this automatically, however this driver
maps its pre-allocated pages from a fault handler, so never calls these.

Simply set the flag in usb_stream_hwdep_mmap() to resolve the issue. This
correctly marks the mapping as one whose pages core mm does not manage,
which has no meaningful impact for this driver beyond preventing the mmap()
from failing.

Fixes: 71c610aeb177 ("ALSA: us122l: Prevent write upgrades for read mappings")
Reported-by: David Carlier <devnexen@gmail.com>
Closes: https://lore.kernel.org/20261018025905.201296-1-devnexen@gmail.com
Cc: Kazuki Hanai <hnkz.64@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>
Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
---
Andrew - I think easiest for you to take this.

It should go in before my series ideally to avoid bisection hazard, I think
while it's a fix for the driver, that'll be the safest way.

It should be prioritised to be part of the 2nd batch of patches for this merge
window.

The commit it fixes is cc: stable but this does NOT need to be backported, it's
for 7.4 only.

Thanks!
---
 sound/usb/usx2y/us122l.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/usb/usx2y/us122l.c b/sound/usb/usx2y/us122l.c
index a5db0d044ef9..2986a90ea335 100644
--- a/sound/usb/usx2y/us122l.c
+++ b/sound/usb/usx2y/us122l.c
@@ -193,7 +193,7 @@ static int usb_stream_hwdep_mmap(struct snd_hwdep *hw,
 	}
 
 	area->vm_ops = &usb_stream_hwdep_vm_ops;
-	vm_flags_set(area, VM_DONTDUMP);
+	vm_flags_set(area, VM_MIXEDMAP | VM_DONTDUMP);
 	if (!read)
 		vm_flags_set(area, VM_DONTEXPAND);
 	area->vm_private_data = us122l;

---
base-commit: 2bba28e98578de622ef307d00875aa8f8bca3d10
change-id: 20261023-fix-us122l-mixedmap-2d42f05ab421

Cheers,
-- 
Lorenzo Stoakes (ARM) <ljs@kernel.org>

