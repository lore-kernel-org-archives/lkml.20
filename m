Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792482560;
	b=wdIIVvptlXpENLdRq99wE3Mp8oql8HAdlCjx4JHPpGlyFokl5jL2CNOQt7UhhAVkvdtu
	 Wc29ZeZXk9ITho1jQithvMhMT5efbqOK/T/26ilXIDhEJqBKwXGGt2lTpHn2Nec3ZAenD
	 a/OM701ldjQOpqWCVi1v0S11tdlxW9prx4k67Ni52nRB0wWwSlBgWaa1zVlNPAL4DBqNg
	 XYo0lIIXykw2IykIlL6Jpmg8gTQZhsk0pRd52mUOGuozRmExim+4hok+YkO3idp3f14bB
	 lPL+ejp41YtAUwCMW9Tyc0xbA1+ITrRGEecBKawLhV/q/LJqZMHq2U7TZBX+oChofiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792482560;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=9L30+UnUca4cXFOJhOKpyYquJIxK9YX+zDZ/0S6HO/M=;
	b=eXV4nThESjutSTy8N+UkeFgRTWH9R2fZawMg7779yX8rYkcXhl5KbUOVz/56uEcHzwbn
	 EwamK5YLAxH9LqZu0HQeYSK7rGSo5ivInL+XNWmI9rZkHU0S1do/94vYz1FPYEmzHBgwr
	 pqshd2lg0qhAn7KhpQmMVv7jUSCA4UK0hnOp4zUriJeu2tdrBrA5ukrEWQK3HuqwKU3qi
	 fybs7l4covFeOV9NG3jVepi3EvTsjHHQFnzVYKhOL9UXmL+fkFXjp3St7yw3sHZa1RY8i
	 dP12LzAHVqGU8H0Xjznwr56e+gPIATs7MID83MidWqESt+llAHKGQdIuRvubB4MHCQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=VzpDaso2;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04491606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:49:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04491606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=VzpDaso2
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a1f403aca0so3253115e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 00:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1792482557; x=1793087357; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9L30+UnUca4cXFOJhOKpyYquJIxK9YX+zDZ/0S6HO/M=;
        b=VzpDaso2/uouiP4bcr0O0J/4xg2f06wxRgcN4DrR7md+s+CxoIRXQHFnJtKl689CUa
         9iz4IvYASRHyAFAuysgHhpv0Gs3z5BQuDaNxebxrM+6sjntM/zrMHdIFMAq3s5wQgIjH
         Uim/QYpw9b+nVwd03aGFHSFQQUj9o4ri18GDnNrcWJne3FK6d3GRHq75a4nqzTsf9FyX
         DziOPAmSMF0qDQ3X+q3u5TowIAPVXdcyKD9UhmL0JJQc//k1nBxBqPHTol6wtHJqBW6c
         SzxJVXK6EomJpjQeG4M7F00oRB39ymHybRppbuVRO56gWjrxIaQDlROddBwWsTI4gzyy
         69Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792482557; x=1793087357;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9L30+UnUca4cXFOJhOKpyYquJIxK9YX+zDZ/0S6HO/M=;
        b=Cwjg14zedC5glD5JTBF5cHDyRYrNTASIutB6iwePPtMy+lO9DwTKprL+slsC3zWklk
         4X6nEwK1mmP8Qj3YBQmu3rIiiNZ8R0oQYbGNx1jGQ/qXf1z7pcwo2ypUZRtFeRWzJO0L
         1k4ZfIOv+kfVyPQsjCpNWUhAgnFopmgm8R5RJYmAaOEa75wgeW34/GjJLk2Gk35pXhHw
         q/m8jph+Lq2v3dAjByq13ggO4wkma5kYKpSqH0hKeBIavF+f9X+iOfTktIXTOfZIe87b
         zQ4xBZhY4wOCrK7mRtTBCxuUektiuQGmxfKovkBWEsYDzbBPmNeKVAL92FD3B4U1+E7A
         2BAg==
X-Forwarded-Encrypted: i=1; AKwUvBwPLgdR9tPjoH/hoOAcJ4yLxdJiEZB/MOsPk4nMw2xZ3BU0QTHnrj3vMrnI5NtANsm+PO4vGT0soqTpyNM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJBrudH6NbK11cevf9eXy50gxF96qp5fBmhZrtIE5LtsSYVCtJA
	IvQCiJlEjL6GdRpDxZ2HrEYigD/wCLW/Or9PeHRiX2BN+2fvE5yCfgJrzDnMrm0/HMk=
X-Gm-Gg: AYBFou1+fFzcLOrNqBSUjd2mghVDhfFz3Tw60fYjsAMA3daWYu/sgKl8iw8aYas94lR
	nmCjJVblAsAPD/EMRuJb6IyAZyvyj8xw66YbUSxwwc7dB5k99l4sQF/3PH+Rga1DrkhBbZri1Zl
	jM9R3Tzn5sD6eOIYHPj0tGGIL6FveIOjW/hZy7JK+/8f+MzHUgGQQOjpfnJZiEVilazdbg2PIIS
	dab5UteLmJvMJ5xSxtFl5a6UOtq1oRr6uhq7IMVNVu33/m+ezvfSgHgnFX/mMgh9O9eOuWq05bB
	sk1TCnbFTZzMMPFei85K0jYDn+otdP6BQIrE2R86HeQKttzfNmSwQoQD7kZXq9JUsMzFOm7zfRB
	eavFJZ3NIbGzRLUM3uvMZ05683JqvDK9ZhYW9eNNs4fv2nGJD5jDw3IdnuN8Tn5PnqzfPGDODZJ
	mwZAEMhsImLRwHIknXKfZHiTm/0y8HtTIIvPMbjHHI2Lp/IcrF8931PwACDfiPU76bUT9Q9uvVH
	ORDPZUX+jla
X-Received: by 2002:a05:600c:a10c:b0:4a0:1a7f:2abb with SMTP id 5b1f17b1804b1-4a1d75fe221mr168268455e9.11.1792482557376;
        Tue, 20 Oct 2026 00:49:17 -0700 (PDT)
Received: from localhost (109-81-30-107.rct.o2.cz. [109.81.30.107])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2c1e0e6sm61126865e9.0.2026.10.20.00.49.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 00:49:16 -0700 (PDT)
Date: Tue, 20 Oct 2026 09:49:15 +0200
From: Michal Hocko <mhocko@suse.com>
To: "Gregory Price (Meta)" <gourry@gourry.net>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com,
	akpm@linux-foundation.org, kasong@tencent.com, qi.zheng@linux.dev,
	shakeel.butt@linux.dev, baohua@kernel.org, axelrasmussen@google.com,
	yuanchu@google.com, weixugc@google.com, baoquan.he@linux.dev,
	baolin.wang@linux.alibaba.com, hannes@cmpxchg.org, david@kernel.org,
	ljs@kernel.org, dave@stgolabs.net, roman.gushchin@linux.dev,
	stable@vger.kernel.org
Subject: Re: [PATCH] mm/vmscan: reclaim every zone in per-node proactive
 reclaim
Message-ID: <atcc-91WerBlJ_Q5@tiehlicka>
References: <20261019185002.3428594-1-gourry@gourry.net>
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
In-Reply-To: <20261019185002.3428594-1-gourry@gourry.net>

On Mon 19-10-26 14:50:02, Gregory Price (Meta) wrote:
> user_proactive_reclaim() limits per-node reclaim to
> gfp_zone(GFP_KERNEL), which is ZONE_NORMAL. Proactive reclaim serves no
> allocation, but that limit makes shrink_node() skip every ZONE_MOVABLE
> folio, so writing to /sys/devices/system/node/nodeN/reclaim never
> reclaims a node's movable memory. A movable-only node, such as dax/kmem
> or hotplugged memory onlined movable, reclaims nothing and fails with
> -EAGAIN.
> 
> To reproduce, fill a movable-only node with clean page cache and write
> 200M to its nodeN/reclaim: the write fails with -EAGAIN and the page
> cache stays. The same write to a ZONE_NORMAL node frees 200MB.
> 
> Scan every zone, as memory.reclaim does.
> 
> Fixes: b980077899ea4 ("mm: introduce per-node proactive reclaim interface")
> Cc: stable@vger.kernel.org
> Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
> ---
>  mm/vmscan.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index e82ba737c028d..90f7a7bf4e426 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -8180,7 +8180,7 @@ int user_proactive_reclaim(char *buf,
>  		} else {
>  			struct scan_control sc = {
>  				.gfp_mask = current_gfp_context(gfp_mask),
> -				.reclaim_idx = gfp_zone(gfp_mask),
> +				.reclaim_idx = MAX_NR_ZONES - 1,
>  				.proactive_swappiness = swappiness == -1 ? NULL : &swappiness,
>  				.priority = DEF_PRIORITY,
>  				.may_writepage = 1,

Would it make more sense to 
diff --git a/mm/vmscan.c b/mm/vmscan.c
index f11491ee9ed5..e07db9514e59 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -7963,7 +7963,7 @@ int user_proactive_reclaim(char *buf,
 	int swappiness = -1;
 	char *old_buf, *start;
 	substring_t args[MAX_OPT_ARGS];
-	gfp_t gfp_mask = GFP_KERNEL;
+	gfp_t gfp_mask = GFP_HIGHUSER_MOVABLE;
 
 	if (!buf || (!memcg && !pgdat) || (memcg && pgdat))
 		return -EINVAL;

That would take care of try_to_free_mem_cgroup_pages too.
-- 
Michal Hocko
SUSE Labs
