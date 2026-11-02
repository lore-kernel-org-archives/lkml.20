Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793654681;
	b=L/5vlZ8XD8i9XFzzFYs7pF6gFFoIkjeUQCpYtx3pytmERXGJclT6GrQIzV+Zm8DjL0TX
	 soL7Q5e2JGv4BonoQZssGCMDOIstUPL11h6GE4yKukDIIneWVHYGjvTtkV7D69yuIAYMw
	 0j3FbiO8av99u1pTcXm6NeNGYkgmsPk6q17AwqDrR27btGzbNJp4DMpcnhKzNJjNWXAf3
	 tIZgpLW4WjK56CiOG/VohkJ/hRiSYhFb391nokMal0o8ow8IDopRumBfMBqKXML4kc/XJ
	 r41Hy8okbX0Zfk6iHj0OHArLneaNwWlQ9SbW6om1M+Tg5UhqwACFSQmV1MBFp04n5HA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793654681;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-Id:
	 In-Reply-To:References:X-Mailer:Mime-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=cY1t39+3gzTLNFhC7dxLkefRg/oZa/qkP6zoNcN6n2E=;
	b=UNe13DNCSFe3sTnTboCWNE9vmXPnX1kIa2KywV/Rafh6s42eLJ4L+42T2evWLEiOpRuR
	 koQOURDS1mJH/fsrtNYrgwrXIfik/V4GKvF7Xn0C8BE+nyriY1b3xG6FrID/r3AP+tL3j
	 Hb99Sr3VHE4TxHnWM59lz2Na89UmhyzS9XD/76rk9dOUj/Aobx5Z5RmP/BwiyBsg/N/85
	 jW2OuYpMBWafoPuLpJEqBSfiklxyqxLzvhf1ODXFD0gnrzMGheyHQN0u5aMYP+u5YSjse
	 W4HBrKiCfh2e0Oke7QXKeo9sPN8NBYdqDC0l09BuiDC+9R8u5/XBenairB9iFgv7tbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b="Volu/Qno";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B9B6606A338
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 21:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=Volu/Qno
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77C221F00A18;
	Mon,  2 Nov 2026 21:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1793654680;
	bh=cY1t39+3gzTLNFhC7dxLkefRg/oZa/qkP6zoNcN6n2E=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Volu/QnosDZUf/lm+UfDNb6h/cKNwjncmN6pmzGpGXsQSM9RGmoASwJJ7nelEgsm+
	 f+BA5KHkUa+dEIZzlyCLvVAsuHnl4iLwk+R2M0jXqnYUjA+raXzdeBHO7DyQ+s+ZVI
	 WQESqkxYsBqNz/Ve5ERhhqxEGDRG/OnlPHfnurOU=
Date: Mon, 2 Nov 2026 13:24:40 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Kiryl Shutsemau <kas@kernel.org>, "Liam R. Howlett"
 <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Jann Horn
 <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>,
 "David Hildenbrand (Arm)" <david@kernel.org>, Lance Yang
 <lance.yang@linux.dev>, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 syzbot+10e72ea5747737bcd2ad@syzkaller.appspotmail.com, Songsen Yang
 <yangsongsen@insta360.com>
Subject: Re: [PATCH] mm/vma: read anon_vma carefully in validate_mm()
Message-Id: <20261102132440.92038293c42bca37768a541e@linux-foundation.org>
In-Reply-To: <auhrcEfT5v5MVcFj@gremlin>
References: <20261102-fix-validate_mm-v1-1-5c309614ef15@kernel.org>
	<auhn01dpDzK47igy@thinkstation>
	<auhrcEfT5v5MVcFj@gremlin>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 2 Nov 2026 11:02:56 +0000 "Lorenzo Stoakes (ARM)" <ljs@kernel.org> wrote:

> > This ifdeffery seems unnecessary. What about this:
> 
> Yup, even better.
> 
> Andrew - could you update it in-place or do you need a v2?

I queued this update:

--- a/include/linux/mm.h~mm-vma-read-anon_vma-carefully-in-validate_mm-fix
+++ a/include/linux/mm.h
@@ -4370,9 +4370,7 @@ anon_rmap_tree_iter_first(struct anon_vm
 struct anon_vma_chain *
 anon_rmap_tree_iter_next(struct anon_vma_chain *avc,
 			 pgoff_t pgoff_start, pgoff_t pgoff_last);
-#ifdef CONFIG_DEBUG_VM_RB
 void anon_rmap_tree_verify(struct anon_vma_chain *avc);
-#endif
 
 #define anon_rmap_tree_foreach(avc, anon_vma, pgoff_start, pgoff_last)		 \
 	for (avc = anon_rmap_tree_iter_first(anon_vma, pgoff_start, pgoff_last); \
--- a/mm/vma.c~mm-vma-read-anon_vma-carefully-in-validate_mm-fix
+++ a/mm/vma.c
@@ -669,14 +669,17 @@ static int dup_anon_vma(struct vm_area_s
 }
 
 #ifdef CONFIG_DEBUG_VM_MAPLE_TREE
-#ifdef CONFIG_DEBUG_VM_RB
 static void validate_mm_anon_rmap(struct vm_area_struct *vma)
 {
-	struct anon_vma *anon_vma = READ_ONCE(vma->anon_vma);
+	struct anon_vma *anon_vma;
 	struct anon_vma_chain *avc;
 
+	if (!IS_ENABLED(CONFIG_DEBUG_VM_RB))
+		return;
+
 	vma_assert_stabilised(vma);
 
+	anon_vma = READ_ONCE(vma->anon_vma);
 	if (!anon_vma)
 		return;
 
@@ -685,11 +688,6 @@ static void validate_mm_anon_rmap(struct
 		anon_rmap_tree_verify(avc);
 	anon_vma_unlock_read(anon_vma);
 }
-#else
-static void validate_mm_anon_rmap(struct vm_area_struct *vma)
-{
-}
-#endif
 
 void validate_mm(struct mm_struct *mm)
 {
_

