Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793616532;
	b=eVrJvhK82XSUFXe3QSwSGgaHu03eM5fz3F6+aVpuMj+IFv+hqGPKEfGkUQgog20DjenS
	 DyabeQipaEj2zsOpJPbTgIw8RJzJtX9AbbmRWQ/e231YGXv5o1U6vSEjGU9qqtCBZdYOt
	 RbSCynSePmhkAUKenxknRAmC7B5e6BeSk+K6/WPP+5hqO9bDxDxZj/dhkLqgovhEdEA0R
	 Ipt0wO9irF9gXia4CGtxG5bQMOAUJBlqTAEi/A0TV4Np53hiv6XU96dOxRmel1gvchuv5
	 8wmxKm/au1liKknKG34MXinfqk3bamCesIwUMSvVhOpbIps9hHHxMLIHWT0lfz8rqYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793616532;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:X-ME-Received:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=alJW2kk7J5aB3H8ldBLPUkr2OufsLz4Kfedbzm9E5IM=;
	b=lDiq6VSuVkdlouvsUepsN2yuPPb98G+eAkki0+NNtB2PKr6Exg6BBKhIz8o7k7Q/i8/5
	 Mc41xHX32AxOcTj7ojHDMeMmKXW7H5Un3WeID1dDmbk1Xqn2cL/lk4RCELK8EcSs1XUYO
	 b+erIRUN2afIqX51Il5HXtwggs6/ebnDiupD0Vj9brFEAogPpsohCEyTIhiVbby9/w5jV
	 55pdltbch2UD1KbEIjTL8L8Xv8AV7R7MovpXcBc5t/quBEJY86mRwOnNuTQkbkEM3iffP
	 TRpaFLpVcNayU2jQ9qlr18NrGytH7n/lL3EUvMerlUXoaCThZlbpLzDu563xVcocolw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HnVwW7Kf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9201C606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 10:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HnVwW7Kf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 661DD1F00919;
	Mon,  2 Nov 2026 10:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793616532;
	bh=alJW2kk7J5aB3H8ldBLPUkr2OufsLz4Kfedbzm9E5IM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HnVwW7KfLlezC07ryu8Ner2cAHeBoKnJL7ulj8j+mU1h7uHy+gFiCV63ZEG1EPc9s
	 khXUH6U1NUHCBUHctO5hKX4sBt3TTIh2OuJP/74dGmE4yePbEjcbCBR0IRQfBKzedy
	 v6crRHKDQQkhCaugH5dDyzH8Gv0eTEzqJXDigav8Uw5zW4AzDykI2X8rXLhg2PLU2i
	 7PoItFPUHnj2RQJ4cDmv1l/FTbq8972RfaDQKbiuPOLMm+X9PDtDjuse3XIZkQDIr+
	 Zm6GNKAnUCpupVNOz7P6LzoLTszUcbe6cp+u74TO4q5j4Fd0ry2DCbdyoP2i4P131G
	 HyuAPg6BZqBSQ==
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfauth.ams.internal (Postfix) with ESMTP id DD3441980052;
	Mon,  2 Nov 2026 05:48:47 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Mon, 02 Nov 2026 05:48:49 -0500
X-ME-Sender: <xms:j2roaqMhAgCx0OGLE_P9jMkZUvwMBd1Ec5Z33JP2vsAxVyiqr42Dzw>
    <xme:j2roas4LjxXed6c1J6z5HERG673pqxDxXcGcySyWVBg5LW-1gBdKDt91maHO8uTpc
    0HLJfzw8ncZ90DJVqJiZMUwwlmWD_d-r4S2vlXvRCDSzam5Sl9yNRy0>
X-ME-Received: <xmr:j2roapxaKIGL4oHym3Cd758Udm9h1xxTkgB04o1jqaqEKqjk5w348jSNB-Q>
X-ME-Proxy-Cause: dmFkZTFLgXFKrzIukKez74KoRN/QpvBIENZy2DEhJaNDY+xWb1oHLkm+A5rb6sIqdUVAvM
    NP1YhmibrDW6qjMc3fGL0cv0cQ3HyO6m7eKRR3wecZ5IXtSdDeH7Gr3GPMu9bswl3L0uYA
    RTj7dV9Z3V0dh5heufvc3oC+mh98SmhqG71Ch67Huvja/ZypVHvq+zVRp8hewzmGpCP206
    2jgyCvliHRUFnvVVZfUINAJLONqp2O1n6mJqsIttl7bI9VKnCD5k88P/T3K7aW84rceBmd
    rFsbw+4VTC/kDTfupT+LTyCERrXhVepG09hrp1ldCF6OfGBjux2QsGQGnx3uLscv5FmsRA
    CmXB5GW1wO+1VsU7asBDw0LA98YH9dtaa0bHDpiuaMqvFrbtplFuChSSoePQRnPfllKaRp
    U/Ok9QkfMnkXhvtLdqBcKlJRdC1Tdbn4ZVbId8mNJojrMK54TVdIdNrM3neElYnAgefWFz
    m6eWaetsYXjaTjrXRrDhP6cGUFFDjG9OfFD79fLeu4tYr4NVVbz+fbswHx6ZJrxrc8Y/UR
    CjB8bQc1YOzZNY0oARstdgocn2mwqQ7Gz1eB2fSMDcjb0OQyJQekog98sKkB0dyAqPqccX
    qSlZw4y3PH9Wec4drvUi6pauddDZ4+Op/n/PArqAu8qdlfIiJAGhQcPoQKfA
X-ME-Proxy: <xmx:j2roakTNQoFuVKR-SeDCJMEMDoUWHJFY2TqeR6nIA0irb8LFOOwu9Q>
    <xmx:j2roap_QVA-JMeZHZekw-tOmjtQ9eQ3o1S330a6JJgqnEcqtRZWeCA>
    <xmx:j2roapK_aO7bazUu7nP3YovwyCvevzAmnrS1N5YQegd3wGzo5tX_TQ>
    <xmx:j2roalvjPyX53OFr2r4rBbadNnx-f2uYWcONrabFHRNWY8oFE69K3Q>
    <xmx:j2roaqm-_Rx3QBkxnBFStRGB8WFm-YBv6LG5VA8y0WpW8GPRjZgch2eo>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 2 Nov 2026 05:48:46 -0500 (EST)
Date: Mon, 2 Nov 2026 10:48:45 +0000
From: Kiryl Shutsemau <kas@kernel.org>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, 
	"David Hildenbrand (Arm)" <david@kernel.org>, Lance Yang <lance.yang@linux.dev>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, syzbot+10e72ea5747737bcd2ad@syzkaller.appspotmail.com, 
	Songsen Yang <yangsongsen@insta360.com>
Subject: Re: [PATCH] mm/vma: read anon_vma carefully in validate_mm()
Message-ID: <auhn01dpDzK47igy@thinkstation>
References: <20261102-fix-validate_mm-v1-1-5c309614ef15@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261102-fix-validate_mm-v1-1-5c309614ef15@kernel.org>

On Mon, Nov 02, 2026 at 10:25:20AM +0000, Lorenzo Stoakes (ARM) wrote:
> Commit 38564710f443 ("mm: implement and use vma_has_anon_rmap(), silence
> KCSAN") rather clumsily converted the read of vma->anon_vma into a
> vma_has_anon_rmap() without accounting for the separation between
> assignment of anon_vma and later use of it.
> 
> vma_has_anon_rmap() is intended as an optimistic check, so doesn't need to
> protect against a torn read in vma->anon_vma. The caller is expected to
> take care of this themselves if they then in fact access the field.
> 
> validate_mm() does indeed then reference the field, so resolve the issue
> via READ_ONCE(), and simplify the code by separating this into a new
> function validate_mm_anon_rmap().
> 
> Finally, add a vma_assert_stabilised() to make it clear the required state
> of the VMA.
> 
> Fixes: 38564710f443 ("mm: implement and use vma_has_anon_rmap(), silence KCSAN")
> Reported-by: syzbot+10e72ea5747737bcd2ad@syzkaller.appspotmail.com
> Closes: https://lore.kernel.org/all/6ae78418.6552420f.2a0efc.005c.GAE@google.com/
> Reported-by: Songsen Yang <yangsongsen@insta360.com>
> Closes: https://lore.kernel.org/all/20261102074414.10902-1-yangsongsen@insta360.com/
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> ---
>  mm/vma.c | 36 ++++++++++++++++++++++++------------
>  1 file changed, 24 insertions(+), 12 deletions(-)
> 
> diff --git a/mm/vma.c b/mm/vma.c
> index d416ba58eb4c..9f02f19a7845 100644
> --- a/mm/vma.c
> +++ b/mm/vma.c
> @@ -669,6 +669,28 @@ static int dup_anon_vma(struct vm_area_struct *dst,
>  }
>  
>  #ifdef CONFIG_DEBUG_VM_MAPLE_TREE
> +#ifdef CONFIG_DEBUG_VM_RB
> +static void validate_mm_anon_rmap(struct vm_area_struct *vma)
> +{
> +	struct anon_vma *anon_vma = READ_ONCE(vma->anon_vma);
> +	struct anon_vma_chain *avc;
> +
> +	vma_assert_stabilised(vma);
> +
> +	if (!anon_vma)
> +		return;
> +
> +	anon_vma_lock_read(anon_vma);
> +	list_for_each_entry(avc, &vma->anon_vma_chain, same_vma)
> +		anon_rmap_tree_verify(avc);
> +	anon_vma_unlock_read(anon_vma);
> +}
> +#else
> +static void validate_mm_anon_rmap(struct vm_area_struct *vma)
> +{
> +}
> +#endif
> +
>  void validate_mm(struct mm_struct *mm)
>  {
>  	int bug = 0;

This ifdeffery seems unnecessary. What about this:

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 9f167950926a..2e43077dcd51 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -4363,9 +4363,7 @@ anon_rmap_tree_iter_first(struct anon_vma *anon_vma,
 struct anon_vma_chain *
 anon_rmap_tree_iter_next(struct anon_vma_chain *avc,
 			 pgoff_t pgoff_start, pgoff_t pgoff_last);
-#ifdef CONFIG_DEBUG_VM_RB
 void anon_rmap_tree_verify(struct anon_vma_chain *avc);
-#endif
 
 #define anon_rmap_tree_foreach(avc, anon_vma, pgoff_start, pgoff_last)		 \
 	for (avc = anon_rmap_tree_iter_first(anon_vma, pgoff_start, pgoff_last); \
diff --git a/mm/vma.c b/mm/vma.c
index 1be613044b4a..30f31d3b3e26 100644
--- a/mm/vma.c
+++ b/mm/vma.c
@@ -669,6 +669,26 @@ static int dup_anon_vma(struct vm_area_struct *dst,
 }
 
 #ifdef CONFIG_DEBUG_VM_MAPLE_TREE
+static void validate_mm_anon_rmap(struct vm_area_struct *vma)
+{
+	struct anon_vma *anon_vma;
+	struct anon_vma_chain *avc;
+
+	if (!IS_ENABLED(CONFIG_DEBUG_VM_RB))
+		return;
+
+	vma_assert_stabilised(vma);
+
+	anon_vma = READ_ONCE(vma->anon_vma);
+	if (!anon_vma)
+		return;
+
+	anon_vma_lock_read(anon_vma);
+	list_for_each_entry(avc, &vma->anon_vma_chain, same_vma)
+		anon_rmap_tree_verify(avc);
+	anon_vma_unlock_read(anon_vma);
+}
+
 void validate_mm(struct mm_struct *mm)
 {
 	int bug = 0;
@@ -678,10 +698,6 @@ void validate_mm(struct mm_struct *mm)
 
 	mt_validate(&mm->mm_mt);
 	for_each_vma(vmi, vma) {
-#ifdef CONFIG_DEBUG_VM_RB
-		struct anon_vma *anon_vma = vma->anon_vma;
-		struct anon_vma_chain *avc;
-#endif
 		unsigned long vmi_start, vmi_end;
 		bool warn = 0;
 
@@ -702,14 +718,8 @@ void validate_mm(struct mm_struct *mm)
 			vma_iter_dump_tree(&vmi);
 		}
 
-#ifdef CONFIG_DEBUG_VM_RB
-		if (vma_has_anon_rmap(vma)) {
-			anon_vma_lock_read(anon_vma);
-			list_for_each_entry(avc, &vma->anon_vma_chain, same_vma)
-				anon_rmap_tree_verify(avc);
-			anon_vma_unlock_read(anon_vma);
-		}
-#endif
+		validate_mm_anon_rmap(vma);
+
 		/* Check for a infinite loop */
 		if (++i > mm->map_count + 10) {
 			i = -1;
-- 
  Kiryl Shutsemau / Kirill A. Shutemov
