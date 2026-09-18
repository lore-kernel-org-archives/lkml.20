Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC0D274670
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 16:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789748697; cv=none; b=ulJqf5kQs8ebOVCa5XxLtaJOJbbsdeDWQ8tK1W+idbhwqtQ8xfb0YaKkZI6HU0XHrqJmBijLWvFDSvCRQ2wr1JoUvv1EADsnw8HBryINu58w9dE+D5B7s0pVcdFTzCbX2FWHEVBT2cv1v2plYODXWCQcmny4VIWRI1c3HucbepE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789748697; c=relaxed/simple;
	bh=/VEJ+LucLRgG3GQveLMeKu8gGNtxOYLsCkVGmvtubPI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=oQmAJNNf6sWgwvE0K3CDBBjsactuunxcdVplstVquQoQLMMcW+pC/9/19+mAU91uuw5+q54UN2b4dhlpCqD8VOkiNy3im5wdZ/ui43+Q7hKHvt+RwnrhW3u+9LYtrgkNZin5YWhOB94LXqspUxlNJcObdCk41SUsId2pJUR0qtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NypGK/y/; arc=none smtp.client-ip=209.85.216.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NypGK/y/"
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39533bb224cso1875671a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 09:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789748694; x=1790353494; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JHL6ulY39G3oYupBS7XaH4v+pqwb8EWJ7uPAAnt0DUo=;
        b=NypGK/y/QMSj7kykXuqffJBWeSeURdROrAIZpIjuU6YeyErphUB3XGkaWeL2TTFWM7
         Dw1NqYCmMfCvkxWkgE9RsPF44QZMqZRzbs9CW0P87Ol92pkhzwkm08TuBGctGbDyvkpt
         5v4qiJQy1BrdD1A8GZ4Q8RiLJWn0xo3RmKll+MD+wjEhuk2UXDQD+1AfVFh6QMlzhds5
         t2AfPNf7zS8NHrsQAYAKI/QUWS8gi2xZNh//prS01ORUYnKTDn+eBzF7YM4yBH6rzlt/
         JxarJucsIc4pVy6OOg1TwahbnKgkf9bOT5CPlDV5G45LBUzqaecPyYQVh52tgfTS1sYR
         GoIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789748694; x=1790353494;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JHL6ulY39G3oYupBS7XaH4v+pqwb8EWJ7uPAAnt0DUo=;
        b=ZfUCbsjyJA2V08RFiD332QTGhiaWG9Y+oG+5B+RUr+VjPM/rJUMkosbV0AgcZDirYr
         KjBhhd3ya1kTF3Qb0ZDa13op2Ty+xzfq0QTz200UuZxztWN2fXVk1IeFcdZFVX/qo6nT
         WSkdrbqEMvpd2Wj2W639SkTpjuUGeZdhsOpzcMwuuy4EeNFDNDfaBvfkWwJtgadMUDRW
         DVXKTfqt+zrl8/6++Jv6ZYyKLoDEQpgepzhYTobrXWOFjFd7EIgEbj8ylPZMeYkXLCGd
         qc2Y8cRzbKleDVXzBlkH88iZ7h6dfbIGUbSO02WxAZHM7xhYfZghe8Pinnv3dIAnL+AP
         4w0w==
X-Forwarded-Encrypted: i=1; AKwUvByE+q++osc1ogLEMAMSMp20Kjo+t5spsZO+9zmQY3NbrkvOfWW3Y8uOlKzXDWkNRyx2/GltsI+yC4Bm3vw=@vger.kernel.org
X-Gm-Message-State: AFuF++l6eyNWjzUjhWrz8Yl7KIGmB3EBPuTIW6/2gjEhcnx/TSJFzx/z
	SVW6a6IeVPesnv1xN/86EZhHcs53+jEcEi3JhSx7r5J9LOsAlHLBEOsQROm7fOZF3V1f5baxNGu
	LusuvcQ==
X-Received: from pjbiw20.prod.google.com ([2002:a17:90b:4214:b0:39e:ac:d0a2])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:d648:b0:39e:6c6a:4b6f
 with SMTP id 98e67ed59e1d1-39e6c6a5502mr182977a91.57.1789748693726; Fri, 18
 Sep 2026 09:24:53 -0700 (PDT)
Date: Fri, 18 Sep 2026 09:24:53 -0700
In-Reply-To: <20260918113631.634233-2-gokul02k@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260918113631.634233-1-gokul02k@gmail.com> <20260918113631.634233-2-gokul02k@gmail.com>
Message-ID: <aq1l1WwdySbfX0qt@google.com>
Subject: Re: [PATCH 1/3] KVM: selftests: Delete the unused sparsebit copy and
 count helpers
From: Sean Christopherson <seanjc@google.com>
To: Gokul K <gokul02k@gmail.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, Shuah Khan <shuah@kernel.org>, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Fri, Sep 18, 2026, Gokul K wrote:
> sparsebit_copy() and sparsebit_num_set() have no callers.  Nor does the
> FUZZ harness at the bottom of lib/sparsebit.c, which exercises most of
> the rest of the API and still builds and links with both removed.
> 
> sparsebit_copy() was the only non-recursive caller of
> node_copy_subtree(), which leaves that unreachable too.  It is static,
> so keeping it would trip -Wunused-function; delete it as well.
> 
> The comment on the num_set member gives sparsebit_num_set() as the
> reason the count is maintained.  The member stays - it is what lets
> sparsebit_all_set() answer in O(1), and the dump path prints it - so
> point the comment at what still uses it.
> 
> No functional change intended.
> 
> Signed-off-by: Gokul K <gokul02k@gmail.com>
> ---
>  .../testing/selftests/kvm/include/sparsebit.h |  2 -
>  tools/testing/selftests/kvm/lib/sparsebit.c   | 63 +------------------
>  2 files changed, 1 insertion(+), 64 deletions(-)
> 
> diff --git a/tools/testing/selftests/kvm/include/sparsebit.h b/tools/testing/selftests/kvm/include/sparsebit.h
> index e027e5790946..8a2ab11dae6f 100644
> --- a/tools/testing/selftests/kvm/include/sparsebit.h
> +++ b/tools/testing/selftests/kvm/include/sparsebit.h
> @@ -30,7 +30,6 @@ typedef u64 sparsebit_num_t;
>  
>  struct sparsebit *sparsebit_alloc(void);
>  void sparsebit_free(struct sparsebit **sbitp);
> -void sparsebit_copy(struct sparsebit *dstp, const struct sparsebit *src);

I'm somewhat tempted to keep sparsebit_copy() even though there are no users.
In the unlikely scenario someone wanted/needed to make a copy, it seems like a
potentially painful waste of time to have to recreate this or hunt down its prior
existence.

Anyone else have an opinion?
