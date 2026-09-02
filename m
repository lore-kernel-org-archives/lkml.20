Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E8C41CB47
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 21:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788385965; cv=none; b=ioee9AQUWz1KmgKdHKhH4uaEkldfVXwXIZQL010Rz6/gL7LZno3sVCsZplgXyh+TMeqdma9D3l3vsmrzu9+AnTMqRR8wgP5Q5JU0T4Dd6DEQRpuxiVbfQnEs8Zh1wD5KQ54uc39iuC1E4pzrNthuldgi1dPyv4MR+sPRQ2uwOLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788385965; c=relaxed/simple;
	bh=sWOGMzVYtcuattQ1cUaKCQHc/riy3UGOfRmhYswJUDM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GZ2a7blpypCje1XTpDw7UUwjvnIFUWLWC3xzdbgdKGTvRkI9mAuprb0SLhupa6K0wkb/AvFW1GfimAQS2QHlFfBGLRFqYfnv/2IXIDBy7zOOYYcPpH+VUM3/9KgOoQ8sZtqBngfTr2oa/LwWezcM+06ufi+vL2xPeXsVCgqUz9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=LF/yK6f0; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="LF/yK6f0"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-52de50e77ffso18548541cf.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 14:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1788385955; x=1788990755; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OuqexuqBOZ7GFjlPmCKhvMHJIKht+V+CHEZiUpwBp2k=;
        b=LF/yK6f0SD87k9JZagYKvCKMVzg0j+vKk1nyN+izV/thj2+Xmk6vNEdFVN/OBK47gj
         e7+r6toDXU4Alme4WsKZrQD9JBaAeA0xzCuESuQw9mjJnnLxOm786Y+/Ka2m+XisqriZ
         gWeporK4vVQVrq8Q7xHy2w/9o3ZrDy+87XbB0terRvBos590biwAPLCqWp7oIMBEr+iJ
         KBX4Nq2S6HoP6wkn4g0a98BIys100otA6cTa6i6XW8Lj23b9iAj/wZb29pMrnVzMqRcE
         DJvHHLgJ1LgC9K5JXgPNIDq3sgf6HUN1T+Z0soGXZ0CAjAA5H2zQxmJLiL63XEJiATni
         sbQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788385955; x=1788990755;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OuqexuqBOZ7GFjlPmCKhvMHJIKht+V+CHEZiUpwBp2k=;
        b=F5wRUEbTGmwbj49dLfkyBTd1Im59xFq+UaeaA7esrMsqr3ws3uW1vw2t5TCsGYLRm1
         u5cud0yuDnHUCm7+0tiBsjzWAA9tWhx3qSoCNgU5awZQmFnAoMtzvZxkOMTsTfR417q/
         5Tgrbp9RsrlLJP+bCcxQcqNAtD/fHg/90uYyvI9AahBFcKCOkquDbLyKegfcf0VzwUem
         1OPUmMDrcld7FIz1PzS76DgloP7z34EWH+1nVJ/iGVmDG7qpCFyrj6qywJ6FpRMui49Q
         u3TBcGbos8Yi6AAMrHvr3RbQDKywKgx7htlmqu6oSxSOxct/TlEVzZOBSDj1UCVX0qIw
         tkLQ==
X-Forwarded-Encrypted: i=1; AKwUvBxXyj8ROoldiv2lrankwqVRAuknzZW62erzCW1vDwS2kGArgT1RPE7DjzZhcuWC7b+3K2G37kk6DcSo/OU=@vger.kernel.org
X-Gm-Message-State: AFuF++nXUhGskpzHsWcBFPF2PZ8e/WJ/KGayox3mTmQJ/uMtm9/SvIYN
	pSgMzMu8QXRIObeCe/r2kQuKZGnned7qGYJZ3FDsWK9PboK4+kWamb6lS9oyZkLV61o=
X-Gm-Gg: AYBFou0IFq53RQa9bWUhM4dQ6wgnPW91CAyUCGW6RjhVSGEvXKlmkYdGcwhr8A0km7H
	pCbqhiDe6OmSsYQ7tEQNWzBgfR2xlUpfoJS5F3yXW9r2z7X2DoKO8lrn/HBZhDFPrhjeUQU9JGy
	6gy5622x3QXJUJgZgwg/vV4BFnzZZEbwez2XJIH9asmuOdFSTZ+VN3b75gtAh8vaJRsJO8UnKmr
	ycCt22RxN1Bi/hCre/VSiUoza46Bo3PeezkUaDGYbRn158kQmfnTb0nT2jLG4jDbwOMxTlUWzEX
	35o4m4kj0ZGygT9P66Z0gu9EEuBDU2004i32met81x1oUbV+uciPY7qTRC8AaSMnDz8nIntrsXX
	7Idvb5a33I6cePk3raXpph0OLEkIxQoyAWjIyPwHzdhl5IkODsS2PzY3oLS81g82mdla37TvHHy
	ubKKs+oXk4mNs1cjSMpgYefcE+1/82Vg6ITKVpScH5hdVZGLx15eoCib9anQVk5RvRTbkgLizlt
	5L+0yiWmcQVYa4ETgC6n5na9za4QnjdKjJjtSUi7zlw
X-Received: by 2002:a05:622a:190b:b0:530:42e4:effe with SMTP id d75a77b69052e-53042e4f1b6mr31250901cf.43.1788385955400;
        Wed, 02 Sep 2026 14:52:35 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53032ff584esm28409111cf.1.2026.09.02.14.52.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 14:52:34 -0700 (PDT)
Date: Wed, 2 Sep 2026 17:52:33 -0400
From: Gregory Price <gourry@gourry.net>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Liu Jing <liujing@cmss.chinamobile.com>, david@kernel.org, 
	ziy@nvidia.com, matthew.brost@intel.com, joshua.hahnjy@gmail.com, 
	rakie.kim@sk.com, byungchul@sk.com, ying.huang@linux.alibaba.com, 
	apopple@nvidia.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mempolicy: fix div-by-zero in
 alloc_pages_bulk_weighted_interleave
Message-ID: <apiZFrc_ShBRZimV@gourry-fedora-PF4VCD3F>
References: <20260902090412.16445-1-liujing@cmss.chinamobile.com>
 <apgqvt8iIt-a6j2Q@gourry-fedora-PF4VCD3F>
 <20260902144039.2824b7589e87dd185c92d67a@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902144039.2824b7589e87dd185c92d67a@linux-foundation.org>

On Wed, Sep 02, 2026 at 02:40:39PM -0700, Andrew Morton wrote:
> On Wed, 2 Sep 2026 09:57:35 -0400 Gregory Price <gourry@gourry.net> wrote:
> 
> > On Wed, Sep 02, 2026 at 05:04:12PM +0800, Liu Jing wrote:
> > > In alloc_pages_bulk_weighted_interleave(), if the iw_table contains
> > > all-zero weights for every node in the policy nodemask, weight_total
> > > sums to zero. The subsequent "rem_pages / weight_total" and
> > > "rem_pages % weight_total" trigger a divide-by-zero panic.
> > > 
> > 
> > weights can't be zero and we just fixed the rebind race
> 
> So if the caller passes in me->weight==0 then we consider that caller
> to be buggy.
> 

basically weights cannot be 0 by construction:

What:           /sys/kernel/mm/mempolicy/weighted_interleave/nodeN
...
                The minimum weight for a node is always 1.

What:           /sys/kernel/mm/mempolicy/weighted_interleave/auto
...
                If they were not previously set or are onlined with missing
		bandwidth data, the weights will use a default weight of 1.


int mempolicy_set_node_perf(unsigned int node, struct access_coordinate *coords)
{       
...
        new_wi_state->mode_auto = true;
        for (i = 0; i < nr_node_ids; i++)
                new_wi_state->iw_table[i] = 1;


static ssize_t node_store(struct kobject *kobj, struct kobj_attribute *attr,
                          const char *buf, size_t count)
{
...
                for (i = 0; i < nr_node_ids; i++)
                        new_wi_state->iw_table[i] = 1;


static ssize_t weighted_interleave_auto_store(struct kobject *kobj,
                struct kobj_attribute *attr, const char *buf, size_t count)
{
...
        for (i = 0; i < nr_node_ids; i++)
                new_wi_state->iw_table[i] = 1;


we default all weights to 1 and never let calculation drop below 1 for
exactly this div/0 reason.

The div/0 risk came solely from the torn nodemask read issue.

~Gregory
