Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9EAC4CDA08
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 12:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790769838; cv=none; b=ew5YMYVcPQgKsjt+FskDoTRJ+ZkrcbyUjbydlFxX7tkTo5oCsdVQbMRPWfa/DA7PBNv4oWAZLgmzAItSXeUDr88V0hugLnBiQADngJ5iTf47L87eDuiTu4LTeso0aiSNIbdwrT9ICqSR+5dWxvYMFElUckxZWiXamtHLrFfyKbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790769838; c=relaxed/simple;
	bh=nva1a+1N6OMLgAq4Mh9QV/dIao63usjnuzDRG/nvAX0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IMHJaJaVtnYWL5JeYjnN3qM5c52ZsXf2aG3FLnCyqeQXjquz0L9HbZSm39GIurBfdoIFkst4AGMVbWaz8mIueD+iuTzCwgD5R6cIAWlheGDbzerKJZ3GtcEGALm9jVpr95m4a6OiobrOFtaxdsWiVTX6UZjVrbrMS6s4UNtqplQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=AQa4NDex; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="AQa4NDex"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49fe8bf173aso27888505e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 05:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1790769835; x=1791374635; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wdi3drddBXh2MbeE/kE5oeEb6Dfood/saqLoKtI29Z8=;
        b=AQa4NDexJGaxWiOsHFP0LXqY67EQtobPzOMTq9kSSCtqNlaReFElg7Q4X70JTWxTNe
         CdV+Mc29UtPTYEDwi/N9Pqzi+YhQn1aMDkiivLiCGxlLrYO+zxd/0LYBNCiBD/MFaBZV
         kKP6+OP5t1/RuLUgvOcWBW5tHDvlGf5KVLeeuWpbYfyHah3aXMHx+i/CNS9A6JbcR08p
         ix5vu7OnXOC+7KqucQTpSquVm9qkjcKs1dBY37GdNY36iUhrM0UiKbTjVCKBwhnRC2Zz
         2R0uIBKyzYODZ1p5gvcz4KdVxSuKYuYvDEdYn7kRXhP6ys/IVB0ADgMO8Gl0yxzg1XFU
         /tBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790769835; x=1791374635;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wdi3drddBXh2MbeE/kE5oeEb6Dfood/saqLoKtI29Z8=;
        b=CKUIoxQ1/6o+M0XX/acQo1VLxmCk0G6aSHcZlAlsZAY9jjpChzE/W4iSjC/tFEhRwp
         fQ8lVd3mJ2P29EwT9ZkUGwcYRVmRaYB3l/SpcFpzjhY8h1wbu2gPSO+MfLTdjez/0fS6
         BuM2ZsS3rln6E0sN4i27TB61oWt19U8dpB3S0umESRQlrM0j34EukASolZwf+Ow572aC
         FLTRYo3V5giVjNBxV0ABr0GMY8o6w+pYvQ98nC8OfQ2fIzNBIua8cxcTsjEh8zcbbEkR
         OirfOKGp8E+TwgwTFALTzp4/XKUmYMTi2ojeVABN+9665xXtZp3mRTl/zNA9BjGBHfHw
         x3EA==
X-Forwarded-Encrypted: i=1; AKwUvByOk4+Wk0OlOPv3cdOe0Dg03qUQ5x8UGBW940sBQ+hFAlZNFPFb2c5B9Uqttf4lw98/vh2naxMawK6yHro=@vger.kernel.org
X-Gm-Message-State: AFuF++l12+3HsWy46EzZKsZ6yot3H2h6OJlkrUTlIXMc4VyVhnpSE4be
	fj40BN2zBGfVZg09YOyED+xith0WzpWf/f1EtR2l9ir47a8Yt41WCBsynw+LJ5zIHrM=
X-Gm-Gg: AYBFou19uTqEeKQQ8PTMBNVTaiFIRceE955dqPG/Qi/MxNQH48nuSa7o1Y8hB3juVaZ
	2MML31V1+pJYnbGtlIA8iodF1Sx+U6Lp/MoxQxUjStbjn7/JIymy8j5nLqpAVJVmiuJOKxp8X4E
	DND1AemQ0kOwVFIWXdt2pULuMMLRkMEMXbuVCxf137JM7Z+xwMnL+/QBw0ujjNo7HuZ3hQXBiVr
	bnLYIqNycsJPKIZ2y8r/uOqSeQ2bQxkIyLHE9b9MqZDd6k01WZYx9jLHqoLhZJbifbuJMot3ko2
	w/iGZn8EIcuwq+ukLZbf5K26UEGA5ScqP5nHHZa75MexRDkq7oXE/nZpjOoIk7x8aKrl5ZsNUfK
	9tJfVZW4QZn6XZkkOBYpas1tipi0pO6LWjaZspQst0m7e3aRW/Nb4g6FcregCz0d5P6quYBwJpi
	Wd23LAStNlfj/tSfhtfH4tkE+Z5msMvM4A61kLQ99FdWmsv4rdhYzPLakTOJZtfn3HYF4=
X-Received: by 2002:a05:600c:8a16:10b0:4a0:b9:21b5 with SMTP id 5b1f17b1804b1-4a01b12cbcemr15861675e9.30.1790769835112;
        Wed, 30 Sep 2026 05:03:55 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F ([2620:10d:c092:500::6:13b8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a017468b10sm66347925e9.0.2026.09.30.05.03.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 05:03:54 -0700 (PDT)
Date: Wed, 30 Sep 2026 08:03:52 -0400
From: Gregory Price <gourry@gourry.net>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Li Zhe <lizhe.67@bytedance.com>, akpm@linux-foundation.org, 
	ljs@kernel.org, liam@infradead.org, rppt@kernel.org, mhocko@suse.com, 
	corbet@lwn.net, skhan@linuxfoundation.org, ziy@nvidia.com, 
	joshua.hahnjy@gmail.com, ying.huang@linux.alibaba.com, apopple@nvidia.com, 
	linux-mm@kvack.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/numa_balancing: allow migrate on protnone reference
 with MPOL_WEIGHTED_INTERLEAVE policy
Message-ID: <arz56nVu8TzSjqlg@gourry-fedora-PF4VCD3F>
References: <20260930072617.64665-1-lizhe.67@bytedance.com>
 <cfdcaaa3-a9e7-4352-ab01-4922ebb8e0c9@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cfdcaaa3-a9e7-4352-ab01-4922ebb8e0c9@kernel.org>

On Wed, Sep 30, 2026 at 01:26:17PM +0200, David Hildenbrand (Arm) wrote:
> > 
> > Initial placement is only a starting point.  Pages initially allocated on
> > fast memory are not necessarily the long-term hot pages, and pages
> > initially allocated on slower memory may become hot as the workload's hot
> > set changes.  The policy therefore needs to be able to combine weighted
> > initial placement with memory tiering's NUMA fault based hot-page
> > promotion.
> 
> Ok, so memory allocation will respect the weights but balancing will ignore
> them? That really sounds rather odd to me.
> 
> And I assume that was the reason why we might have disallowed the combination:
> it turns a weighted mechanism into an unweighted mechanism.
> 
> So are we really sure these semantics that you would essentially set in stone
> here are the semantics we want? (ignoring weights)
>

Right, but you're requesting this configuration.  If you didn't set
F_NUMA_BALANCING then you get the existing semantics.

In the existing semantics, if we're INTERLEAVE and WEIGHTED_INTERLEAVE
we just always say "no tiering for you".

But as an opt-in option?  I don't quite see the argument for saying
interleaved regions (or tasks) to be opted-out if the user asks for it -
that just seems like an arbitrary limitation.

~Gregory
