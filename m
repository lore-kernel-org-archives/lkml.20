Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6011F175A84
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 00:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788568754; cv=none; b=nNH7Bqkfi0GGVdxPpFWCxdyYfRFtbmPjHBgGjmBPWiTd0rOmeOdvjIWnQiuKTQcv5WqhX7JLM950/fDLj7IlPfonWFP9XCDKmcnzUY4zCMLRGgNRQMuEhL0m5HFzQ9gM7IDTGpyF6z1vysGo+QsOO1+PLjKjqfmvnjPX6jkwJ4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788568754; c=relaxed/simple;
	bh=V1B/Fowzw3nSgR/lAnUDRRaHyfQSKoRx9a2l6Miilqg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CHqLHuuCqygHbqzoWFniwZrqMoJkGTw8Gv0BtHsciV1vJZSXwAa/15KaPMUbV37BGcNj5J1o5rSEMSx5wzCCBfjj8uB2FXoc7dJEIFPT6v2lbMxIcCR63E3Psm/Itarck7eQw2aHkUzkVJ1AjCrt0Ld/KMZxEral3V4LvZjiF1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AvEUS6Nk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AvEUS6Nk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9D931F00A3D;
	Sat,  5 Sep 2026 00:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788568752;
	bh=R6yHFneG9gGinH8AjxIgMQTUoNVBxKENGCLfZaasrsI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=AvEUS6NkSPVMlhLKLbX4UG/OOEsSVFr+j2sipzgAeUCj3XXQVYOf++b9ZmlhvDZ4q
	 DFTpeVidIZI7mAkMF/qb8aHoEa74O7TLMIxpP4s+nxD1ecTcnoOyGf0jbPieAOYGB7
	 h9drwFWv90dkOKxZ9Y7j6R4mGkvkGdAYaMHh/FhV1/Ga+u1RzNtvhYMc7rlL+On7/s
	 doRwWJSiAg5GZUHLxieYCQ/LTGFryZ8+xXMVpH14u/AeWx6xnlLmi2xBsB5reX4oqv
	 dowANEravTfM3DgtsYhMDa7DenvWCIgFVQ9N7w0owaE8JUCj6jkLfjPmD7XurVHKra
	 2MBu2bavNDQWQ==
From: SJ Park <sj@kernel.org>
To: Ye Liu <ye.liu@linux.dev>
Cc: SJ Park <sj@kernel.org>,
	Miaohe Lin <linmiaohe@huawei.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ye Liu <liuye@kylinos.cn>,
	Naoya Horiguchi <nao.horiguchi@gmail.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/8] mm/memory-failure: convert process iterator to for_each_process_rcu
Date: Fri,  4 Sep 2026 17:39:05 -0700
Message-ID: <20260905003905.68362-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260904083001.553587-5-ye.liu@linux.dev>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri,  4 Sep 2026 16:29:56 +0800 Ye Liu <ye.liu@linux.dev> wrote:

> From: Ye Liu <liuye@kylinos.cn>
> 
> Replace the manual rcu_read_lock()/rcu_read_unlock() pairs combined
> with for_each_process() loop in mm/memory-failure.c with
> for_each_process_rcu().
> 
> No functional change.
> 
> Signed-off-by: Ye Liu <liuye@kylinos.cn>
> ---
>  mm/memory-failure.c | 16 ++++------------
>  1 file changed, 4 insertions(+), 12 deletions(-)
> 
> diff --git a/mm/memory-failure.c b/mm/memory-failure.c
> index a8b03e2920ba..63a2ff08ee33 100644
> --- a/mm/memory-failure.c
> +++ b/mm/memory-failure.c
> @@ -555,8 +555,7 @@ static void collect_procs_anon(const struct folio *folio,
>  		return;
>  
>  	pgoff = page_pgoff(folio, page);
> -	rcu_read_lock();
> -	for_each_process(tsk) {
> +	for_each_process_rcu(tsk) {
>  		struct vm_area_struct *vma;
>  		struct anon_vma_chain *vmac;
>  		struct task_struct *t = task_early_kill(tsk, force_early);
> @@ -572,7 +571,6 @@ static void collect_procs_anon(const struct folio *folio,
>  			add_to_kill_anon_file(t, page, vma, to_kill, addr);
>  		}
>  	}
> -	rcu_read_unlock();
>  	anon_vma_unlock_read(av);
>  }
>  
> @@ -589,9 +587,8 @@ static void collect_procs_file(const struct folio *folio,
>  	pgoff_t pgoff;
>  
>  	i_mmap_lock_read(mapping);
> -	rcu_read_lock();
>  	pgoff = page_pgoff(folio, page);
> -	for_each_process(tsk) {
> +	for_each_process_rcu(tsk) {
>  		struct task_struct *t = task_early_kill(tsk, force_early);
>  		unsigned long addr;

This moves pgoff assignment out of the RCU critical section.  Is this fine and
making no real functional change?  If it is fine and no functiona change, could
we clarify the reasons on the commit message?


Thanks,
SJ

[...]
