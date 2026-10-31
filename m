Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.139.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793458762;
	b=gWVOg2Z50/NPKLj6W/88rRYP1BnpLkH3AGjU+BSysIWgNoaZmAKl9FNHdGi+9+BF4ce1
	 P6BktEAPiBKJjt1aaxbepl9WmBxCWvBbeJcfd3BxIb0M6Wpl9NpRFCkmRxtHg92e/vR8t
	 8zLaKgg6O6zJNvjISx1pPz85M1YM3JKZ5XQ8FO5aoH90Qa7RQ/J7Tn+Xh9Zh1GGM7kt3w
	 SJVX/dlfXR5pCjeDCbMYONAO4VXlzJzFC/9S3yJWGLjHfgfJ5FPt2wZ3HDEc0qEPaLiP7
	 0Olhn53B6+YsdDd1AwW5SghSYnkUOzkt1o23nQplqALYIFXOQIjO7hRNDLMdBbDgwTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793458762;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=if99jRjTkbW+bMdt3bQMbXM0UCEb2EHx3ismkh4nY6Y=;
	b=2x8lT63XVmIId7YQoFh1RI6d9n/TkkMC/pAyTLpz2bJXiGq+o4O2qqnzT5yi+lfiEAPQ
	 57Zm2lYVn4P+LfIyfdRoAE72RT/4AfAozZNtDHuOJLr9G2KIngOXiP2hJThSOZl2TtU8o
	 y2kprVdLyMJt85jsXKj/N09yGq/sXgdIu5TXfnijHqFiAi7aQU2T+YMoE7g5nRFIiYO4V
	 noSQQ464Hk+2MCNkfic+dw13iJPbHSx4ksEJyx+QhSIlrWR43bCE7BdJCC9xxA611/MhL
	 2Z5LKvrHEFoJRkO6lzVqpGp3jUGB80DHfKmm+nICflnXFTTm2ydEO1PytgfeZioKYnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=pE7M49Qy;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b="QW/hB+q9";
	arc=none smtp.remote-ip=148.163.139.74
Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6C15606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 14:59:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6C15606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=pE7M49Qy;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=QW/hB+q9
Received: from pps.filterd (m0167077.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VDjnZB084664
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 10:59:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pps01; bh=if99jRjTkbW+bMd
	t3bQMbXM0UCEb2EHx3ismkh4nY6Y=; b=pE7M49QyW11myLfjJkWPCHnqT/G+Zue
	gmLqfmwv/eRzR2PZVYBFSw+DF576xCwH7mbdMqUkHLWVHv62oRjMLK/5DnCIvnFD
	W4Se6NbfQF17OUYB3cGLsRvdRidwozUY98Y9c05+ISE5eVBOSgcT1KHsS1kLQhJ2
	Yr6k226bVBNcwz9c4f7ITnKUQ69VflwAQdr+8VIiMsQyIuyI6ynWAZxXUwnHn1e2
	aODTz08RzMamb3M2YYUPhOMlX3Rq7gMrJeQMdfa+VOWPfJiMdXgezI1+nJL0ZRPA
	4S10e4jRffxKeKDFxwn1Xt9pSVPHrG9T5zltfAy9+x1Wf6BmuVc2E9g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4hn9wq9vn5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 10:59:20 -0400 (EDT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-944101e6367so321606385a.1
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 07:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1793458760; x=1794063560; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=if99jRjTkbW+bMdt3bQMbXM0UCEb2EHx3ismkh4nY6Y=;
        b=QW/hB+q9TExrs3ddW5Sfg/uIbv5eXh3P48yKJHSnaBhLh8NLKPAvcdwlDodc8uu55I
         jDHmvCFpNKCepgGxwX3WgN6IQQ1F6zw05uA14LgmoDdsoDhfVhOVw2aHAOjJTJvIffB0
         ErGp/J/zBCxlnU39buo5duglIRNvTq8LbYe7zZInGndAAJp5qm213P0RqYftqIVILoOj
         d3YK9xOe8siG7CPfJRByi8Pcwl2u65dt7eIlpd+33jUFnnQaP3SaQrfd7O8DimvVPSDg
         942cLqAqKDhA/82AavyAI1GZH17k09TDOjEDZ0hwD+s7OofbUsL3A4xAZZnTizX1TdXn
         mFFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793458760; x=1794063560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=if99jRjTkbW+bMdt3bQMbXM0UCEb2EHx3ismkh4nY6Y=;
        b=Cq2eDjyz2UHZ66kLwHGkcop0MEnjxGBXOYwJn5CaCa5dj5i0GGxW5JRBYDIEURHnNl
         F4otEO9NOvc1dW07QS6YCYJ47bs7bZ7EWXevuaba9+8AcJGdWBNWBIVCVH/1L6eG8iLg
         V0J+/90Ssz8SYpSUP5Y7LLlH6150ltreYyEse0kqOwhZs/m98mwoGXBjLryBd3L25YLe
         UO0TljhX9AbN+Ug/grH7JuRqoRqqEfq7hJQ/PufgUfs0Y6I8DHvCnOT5fQRgXK06HomT
         9k3c1cLSdAH095VO7Okwvwm3iYFJuBXtHSD0oG6sDABXftorX3o+Rrlxjqa03G7ZkaNV
         twYw==
X-Forwarded-Encrypted: i=1; AKwUvByi5SIMPMa9F4+zeDNF9I30zX7DBs+GyAbY0RWm1E78qyFxp6TQCFPn8253AhYVfUfPumm2Wa5P9Qal7JY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJAm7h0qA1KIGjO4IpOFafrKFGyzdvRMR3YKVI9SaI7DOn4sH3H
	OD1IvFIDkjBvgfT8FeypZOpXZmFyrcze5ddxSbpfRYAOmv+IYIyn0teXAckTSX/rc8cxQbAmbIh
	ja+lH4EQU50kMcjKO/FPEbQ0FP7PIxImF9/g7Uh5FSkwYCqLMxxQ+6k4XNeJVbw==
X-Gm-Gg: AYBFou0nwxUR8p83lQPRDzQSPA8YgK89HxXhSFlRu3c+KPU7XA8uPPKulatTSXgssgc
	n7xACq3hAVFY05flrJyJ7+sJOfsnGculUxCeFUUNadolC/2af67IMf4DxOIraz95i9QQghIwX8e
	0DE6QyxLMj85N7VwyfnEufIbbg2CziTupknjqudgJ+2Ak3z7rm+LqhiM7HUmK9VEB7SBE6N01y1
	8UYAbvB7L53JehjfW2tndTSzyqqw4S6XnBTTFlIyWrAODMrPoloLJ5e8ZSbNgeCJOiqWrL+xT+/
	q/lLiQ8TZlhkAoH/YWdwZMzWHOIi/WJizNg2qGYhx5AL2V0jVN5yydqYCCGhiXBdxXpmn9mDsoW
	6hzRk66W7IS8PlonKUQyKjlfXRJtvc+qbu1vDUSEKbuByaR2oaxRpUGq75m+bofNZlBYw+Qs=
X-Received: by 2002:a05:620a:4d94:b0:944:1e9b:e674 with SMTP id af79cd13be357-9441e9beab0mr653736485a.17.1793458759740;
        Sat, 31 Oct 2026 07:59:19 -0700 (PDT)
X-Received: by 2002:a05:620a:4d94:b0:944:1e9b:e674 with SMTP id af79cd13be357-9441e9beab0mr653734385a.17.1793458759237;
        Sat, 31 Oct 2026 07:59:19 -0700 (PDT)
Received: from localhost.localdomain ([37.142.159.89])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ac09cc3e9asm57890975e9.3.2026.10.31.07.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 07:59:18 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
To: Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Peter Xu <peterx@redhat.com>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        tz2294@columbia.edu
Subject: Re: [PATCH] userfaultfd: clear uffd state in child PTEs if uffd is released during fork
Date: Sat, 31 Oct 2026 10:58:35 -0400
Message-Id: <20261031145835.960656-1-tz2294@columbia.edu>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261031-uffd-prot-bits-fork-event-v1-1-3572921c2111@kernel.org>
References: <20261031-uffd-prot-bits-fork-event-v1-1-3572921c2111@kernel.org>
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
X-Authority-Analysis: v=2.4 cv=YpWa1IYX c=1 sm=1 tr=0 ts=6ae60248 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=P+xgYyhW+KadpqoI50EQPQ==:17
 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=QOCMdifcju39GKoXhKua:22
 a=VwQbUJbxAAAA:8 a=d7BrdpvQtwasfi09MFoA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA1OSBTYWx0ZWRfX+ms1KnlKlm1S
 nOslX9Irh/di38hRm+dgWLgxBRbAFmHqv65KCVAtMdMf7WIVXt9JqY6K7jGaC5Lf5qQGOTk5ccF
 qmoJGLvoPbqYVrB+AbXqM33U4iPkKtq/zgmQnSO1fu+CkEJvnq3H
X-Proofpoint-GUID: mzxVgoFpxTOZ6Mbj26gx6YBrcQTYO3l2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA1OSBTYWx0ZWRfX8u3thSbNRw6q
 XHsSaP1LW+ojPgQEUyCMsVDsvN3+N80m2x5xaRmbjwto9vxiris26QFE80bh8JmRdh3eLJkcaBx
 /3kRpheAXdj+Ogr/VwnLfe/DctgS5gGvudklQUVZhpmG9Ef3dD9S3fjNM9ylpgT5erJ4WuulPqZ
 gkxYr3Vn2iv2C0YNJl5TFGyAnke/uCCKVqIM9WrOiPVceDYRDFwfdDUBuA6cd5wmVa9Q4mFtjoy
 Bfs6cxuMp9LMifCln7xlRs49xZ/InE2mvk2UcxO/gY44hQzd/rzCYSuEtbrwyjBcvHaNWcDHP+A
 PkTTpPYlJWrAaaKwBdnd9NFzZ5fBzcfRWeH32H9jDoSmwFo1qC1Z5HfCLaWq71BlHCutudasbcD
 ELI6slEmzX/OEXZYG/dmwTqNnkvQ+W+t4Q4hgp/gSTlPPrkjeiXARRSDZ3tc7iEvJOkejBVe4Al
 taBSiIyNnvIBo9vou8g==
X-Proofpoint-ORIG-GUID: mzxVgoFpxTOZ6Mbj26gx6YBrcQTYO3l2
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11952
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=10 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0
 impostorscore=10 suspectscore=0 lowpriorityscore=10 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2610310059

On Sat, Oct 31, 2026 at 02:35:05PM +0200, Mike Rapoport (Microsoft) wrote:
> With UFFD_FEATURE_EVENT_FORK the userfaultfd context is duplicated for the
> child process, the child VMAs are registered with the new context, and uffd
> protection state from the parent PTEs is copied into the child.
>
> If the parent's userfaultfd is released before the fork event is read,
> userfaultfd_release_new() resets the VMA flags but keeps uffd state in the
> child PTEs.
>
> This leaves the child's VMAs in an inconsistent state: they are not
> registered with userfaultfd but their mappings carry uffd protection state.
>
> If the child registers the range with userfaultfd again, the stale state
> turns into protection the child never asked for.
>
> When a write fault makes such a PTE writable without copying the page, the
> uffd bit remains set and page_table_check_pte_flags() warns about it.
>
> Split resolving of the uffd PTE state out of userfaultfd_clear_vma() and
> call it from userfaultfd_release_new() before resetting the VMA.
>
> Fixes: f369b07c8614 ("mm/uffd: reset write protection when unregister with wp-mode")
> Cc: stable@vger.kernel.org
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

Hi Mike,

I managed to trigger a warning without this patch too by using an
mprotect(PROT_READ | PROT_WRITE) in the child with CONFIG_PAGE_TABLE_CHECK:

  WARNING: mm/page_table_check.c:202 at __page_table_check_ptes_set+0x181/0x2f0
  Call Trace:
   change_pte_range+0x1ef7/0x29b0
   change_protection+0xd2b/0x1560
   mprotect_fixup+0x4cb/0x1040
   do_mprotect_pkey+0x7c2/0xac0
   __x64_sys_mprotect+0x78/0xc0

No warning with the patch, so:

Reviewed-by: Tal Zussman <tz2294@columbia.edu>
Tested-by: Tal Zussman <tz2294@columbia.edu>

With a couple comments about comments below.

> ---
>  mm/userfaultfd.c | 43 ++++++++++++++++++++++++++-----------------
>  1 file changed, 26 insertions(+), 17 deletions(-)
>
> diff --git a/mm/userfaultfd.c b/mm/userfaultfd.c
> index 3b71712edab4c..2c11ac5dad3d5 100644
> --- a/mm/userfaultfd.c
> +++ b/mm/userfaultfd.c
> @@ -2220,6 +2220,28 @@ static void userfaultfd_reset_ctx(struct vm_area_struct *vma)
>  	userfaultfd_set_ctx(vma, NULL, 0);
>  }
>  

I think uffd is woefully under-commented considering how many edge cases and
races are associated with it... so how about the following instead:

/*
 * Clear uffd state from a WP or RWP range: the uffd bit, WP markers and
 * RWP PAGE_NONE entries. Call this before dropping the registration, as it
 * needs the VMA flags to know what to resolve.
 */

> +/* Clear the uffd bit and/or restore protnone PTEs */
> +static void userfaultfd_clear_ptes(struct vm_area_struct *vma,
> +		unsigned long start, unsigned long end)
> +{
> +	unsigned int mm_cp_flags = 0;
> +	struct mmu_gather tlb;
> +
> +	if (!userfaultfd_protected(vma))
> +		return;
> +
> +	if (userfaultfd_wp(vma))
> +		mm_cp_flags |= MM_CP_UFFD_WP_RESOLVE;
> +	if (userfaultfd_rwp(vma))
> +		mm_cp_flags |= MM_CP_UFFD_RWP_RESOLVE;
> +	if (vma_wants_manual_pte_write_upgrade(vma))
> +		mm_cp_flags |= MM_CP_TRY_CHANGE_WRITABLE;
> +
> +	tlb_gather_mmu(&tlb, vma->vm_mm);
> +	change_protection(&tlb, vma, start, end, mm_cp_flags);
> +	tlb_finish_mmu(&tlb);
> +}

I think it may also be helpful to comment the fork release path that
triggers this bug for clarity, so how about the below on top? Happy to send
it separately.

That ewq->msg.arg.reserved.reserved1 at the end is horrific too... I'll send
a patch to clean that up.

---8<---
From: Tal Zussman <tz2294@columbia.edu>
Subject: [PATCH] mm/userfaultfd: comment the fork event release path

Document what userfaultfd_reset_ctx() expects from its callers, and why
the fork event release path has to unregister the child.

Link: https://lore.kernel.org/lkml/20261031-uffd-prot-bits-fork-event-v1-1-3572921c2111@kernel.org/
Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 mm/userfaultfd.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/mm/userfaultfd.c b/mm/userfaultfd.c
index 3b71712edab4..249f3b4444ab 100644
--- a/mm/userfaultfd.c
+++ b/mm/userfaultfd.c
@@ -2215,6 +2215,13 @@ static void userfaultfd_set_ctx(struct vm_area_struct *vma,
 				 (vma->vm_flags & ~__VM_UFFD_FLAGS) | vm_flags);
 }
 
+/*
+ * Drops the registration from the VMA.
+ *
+ * Page tables are left alone. Callers must make sure no uffd state is
+ * left behind in them, either by calling userfaultfd_clear_ptes() first
+ * or because none was ever installed in the range.
+ */
 static void userfaultfd_reset_ctx(struct vm_area_struct *vma)
 {
 	userfaultfd_set_ctx(vma, NULL, 0);
@@ -2997,6 +3004,10 @@ static void userfaultfd_event_wait_completion(struct userfaultfd_ctx *ctx,
 		set_current_state(TASK_KILLABLE);
 		if (ewq->msg.event == 0)
 			break;
+		/*
+		 * The fd is gone or we are being killed, so the event
+		 * will never be read.
+		 */
 		if (READ_ONCE(ctx->released) ||
 		    fatal_signal_pending(current)) {
 			/*
@@ -3009,6 +3020,10 @@ static void userfaultfd_event_wait_completion(struct userfaultfd_ctx *ctx,
 			if (ewq->msg.event == UFFD_EVENT_FORK) {
 				struct userfaultfd_ctx *new;
 
+				/*
+				 * Nobody will get an fd for the new context,
+				 * so unregister the child.
+				 */
 				new = (struct userfaultfd_ctx *)
 					(unsigned long)
 					ewq->msg.arg.reserved.reserved1;
-- 
2.39.5

