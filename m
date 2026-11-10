Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794329880;
	b=MMUKO7zw0Kj+UULJgpwD5auU3saemFH3S+aBTcCP3gWeMqT1PqokjA79trIf1ADI9SDI
	 9ztNSwhEu97V1JNhnJ2KD00LefHw7ncbIoIxZOfj2s5DMKjrsip3+AqzuF4RD4AL08u/Q
	 wqS9c/N/WX9vdY/f9s7ztul/kgcXwzXgAcKAyaX+zmojb4kPbOHtEp1ek9e9ZkZjHDJ5u
	 nPERKKbDzXz16Zt04WMxoDKTfUgCp4/feRnRWigWUS29u/3jqVkucx/3dDCf54req0Wor
	 hpB6SzQ+nBJ9v9EkE2npzxIm/+Aj5XFEwukplmwtSwwjEg4xfWo/h3stO5gNUD5672A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794329880;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=h2OspRC6i0T4Wp5dMT6Pjhd2/n2ZVXU+zFPBnXHjmVw=;
	b=gNWLbJTofZkSedoNua876AmfjvI0Dx0TXqBI9pxxf1f2CcUu47keaC2KTwoqLm7Kmigh
	 6xSy2IofjjmKNmFckSXUtd/0GoFumKfNj0/um3NGTBHTfxauYHqs5mR78hVohJv++OwWJ
	 CSjGriS/n4rUdlorOb3tM9sqgH21o4Jd9/GWrmT3ryUdgFT0GKlG3bjQ45mwP8DFBuJOw
	 j8tXDSAUMPyyae8nsbXjfgN5HYhM8PsDVSw62KDOVUCjIoDt56AotSKUdpS5+C6FDtohF
	 tW/xB9Gpmnajg1pYJlxgYqw5bmHT+Waaqq6fDAQfdGSujMn2IOzUekOnu/6y+knzgoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I4AaxRQK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EFDB606A9D1
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I4AaxRQK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9F141F008A5;
	Tue, 10 Nov 2026 16:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794329880;
	bh=h2OspRC6i0T4Wp5dMT6Pjhd2/n2ZVXU+zFPBnXHjmVw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=I4AaxRQKe0zCFqKZd3E6YaKCFCJSc6GB29noLsrvUVFMTmIZKfViJvgQTEcsyh6xP
	 FLGOOYDHJrQrgSOszmbHVL7cCd4pql5+TTyu8MkdDYkg6FEKg2n+DGjMVomUBGUcSn
	 LMlacXfvPo/cb2Hi+H/VY6wP48MZArQfkWNdEXQSkTT6ar7Mu3f/AToWUWK3wog3EK
	 0Zcc9GZYWm5gdOBP5RHO08v8ZPKeknY+aqfT1WOXy2qQIA9ciYfYQ+Kbunj+5NJUgO
	 5RoJpjP4PCzHRTczKGPO2D+VIXvHXvDJVN7+yQfbgydmykh03jJIuJ3fMYiMyhjMQd
	 Fme/rs2ZyjVNQ==
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Date: Tue, 10 Nov 2026 16:57:45 +0000
Subject: [PATCH 3/3] mm: convert WARN_ON_ONCE()'s to VM_WARN_ON_ONCE() in
 VMA lock code
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
Message-Id: <20261110-tame-vma-asserts-v1-3-be293ff499a7@kernel.org>
References: <20261110-tame-vma-asserts-v1-0-be293ff499a7@kernel.org>
In-Reply-To: <20261110-tame-vma-asserts-v1-0-be293ff499a7@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, 
 Suren Baghdasaryan <surenb@google.com>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Shakeel Butt <shakeel.butt@linux.dev>
Cc: ljs@kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1503; i=ljs@kernel.org;
 h=from:subject:message-id; bh=PYq4aNCNbT3IejiBpxaZmcA0sFtPdPhHHBku2mVa8k4=;
 b=owGbwMvMwCV2fu7ZrsZH9SKMp9WSGLI++/JuKaspO225fWOfTvuGZ0Fzynf+SKp8+e1qkr5qr
 GSdq9vHjlIWBjEuBlkxRZbnX8T3B4mEzeu84O8GM4eVCWQIAxenAEzEQZThn57JihunXdc+lzls
 1eUisuoxk/KX+UWqHd8rGWepqlVJ8TAybH/YcYP7Es8ZjjmcM/J2Jvy6aD0r2Iz3xH8f7TrloA1
 RbAA=
X-Developer-Key: i=ljs@kernel.org; a=openpgp;
 fpr=E7F417BF5214569E89D04F46CF9DCD8A81E27F14

Now that VMA assertions are predicated on CONFIG_DEBUG_VM, it makes sense
to convert existing unconditional WARN_ON_ONCE()'s in VMA lock code to
VM_WARN_ON_ONCE()'s.

These are asserting programmatic invariants which are in most other cases
asserted using VM_WARN_ON_ONCE(), and there is simply no need for these to
be unconditionally checked, so no longer do so.

Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
---
 mm/mmap_lock.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/mm/mmap_lock.c b/mm/mmap_lock.c
index 834bbf86e004..073c5125b424 100644
--- a/mm/mmap_lock.c
+++ b/mm/mmap_lock.c
@@ -146,7 +146,7 @@ int __vma_start_write(struct vm_area_struct *vma, int state)
 
 	err = __vma_start_exclude_readers(&ves);
 	if (err) {
-		WARN_ON_ONCE(ves.detached);
+		VM_WARN_ON_ONCE(ves.detached);
 		return err;
 	}
 
@@ -161,7 +161,7 @@ int __vma_start_write(struct vm_area_struct *vma, int state)
 	if (ves.exclusive) {
 		__vma_end_exclude_readers(&ves);
 		/* VMA should remain attached. */
-		WARN_ON_ONCE(ves.detached);
+		VM_WARN_ON_ONCE(ves.detached);
 	}
 
 	return 0;
@@ -193,7 +193,7 @@ void __vma_exclude_readers_for_detach(struct vm_area_struct *vma)
 		__vma_end_exclude_readers(&ves);
 	}
 	/* If an error arose but we were detached anyway, we don't care. */
-	WARN_ON_ONCE(!ves.detached);
+	VM_WARN_ON_ONCE(!ves.detached);
 }
 
 /* Do the VMA, mm seqcounts indicate the VMA is write locked? */

-- 
2.56.0

