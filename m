Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE3246AA95
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 09:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790759495; cv=none; b=Gz/zqYyOEpL5Kuh/VbjJCwpGNTCWnR9pYZaH0v/9OkZbPx5UDgYwq6TBNTghCd43KvMNGjgz7z8tzsA8RAVwBrXR1lleA9WGlo12MXtZdLQBvH9QnzJ9ZwEb1N07ZQgHTmpTSuzziNVpDylF8KySf5OMkIn+t3KPqVm+/xo4i8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790759495; c=relaxed/simple;
	bh=/T9SB3efXe5MNqiq/VssbwaJLIYXUF5nvDQjxixgDW0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X8hYCYkhH8qzfp8vDh2SRS7m8s4Bbk1k08RhHEL56ccnQGMHbk7TDSSsqRHXc9MGd2n9kOD9arjrJ9P31y2Fn1acgyJMMjR04jDFqprH7twWYZFVNoN6VLJxtbPCOTjxfLi9tWJtbt9WlbQ6bMIwE1dHI6kXEkepLCpMxTxmn74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=gRaRtqDG; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="gRaRtqDG"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49ff9642c57so8065685e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 02:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1790759491; x=1791364291; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jjNSxVYXKX8qPd2UHTWRIDsJB7UEqZyaJzAT3xKsOKI=;
        b=gRaRtqDGPNAN7Q4np1i31Ai74dPvPEEvoO2/wcszaPEKU180je9/VADGyxaO+/O21k
         7B9H6AOTEuWSYrnMbFhBlWW0zOo3DHgoUBkkUY88D0aRHNrWtFIdNFzjRITaTzpzwTAf
         C9YbrxyrzjHLJir01Bm3MnSPBHfRAG0iEOtUhR33Fccc3RniDuyxL8CcY3ptiTShPIV3
         Bz46tM7OFtvMKhTrSZQIc1Ky1jOYg7LXedKlLt+3rA9iU8rL1kIE5i6DmT2IcpwjnRt1
         CFkbEHJ8hOuHulWGHjSzkXbAsA6eDVZ+z08A49zFnp0MFL4YS6jayiooupQbWIPCE+Yl
         H72A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790759491; x=1791364291;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jjNSxVYXKX8qPd2UHTWRIDsJB7UEqZyaJzAT3xKsOKI=;
        b=CpSl3nw7xkjrBt5mTmQ3Ej3wLVP4A4ZkqdD24He3BYp0h69H0BBmgAUzrXc2jNntg7
         t/Rek8s3v0w+zMlleDKGz18q8IG2G/aTSymk5c6vP1+1FUNdJnaAn/oriZ/zlf4WTbS1
         ///XmL0io1AZLlSp3tFKZnzoQSzydDDV6YuTJTsMDysWmDivCVYw80ybcc2zAn4Xysx4
         IgXJd4PLlGCedOIcrDdz/J9m9q7zJD8n5dURkamm+CbTtEROGW9nLSwkaLurMvppwYcY
         55TkTZkT7gCDVD6JSo/lAX/ClQiMv2r60dyJMdnwvT4wv4R2ETG9XjzW0bkFCkl7s3oC
         NQug==
X-Forwarded-Encrypted: i=1; AKwUvBzm6TqEDffMJBnSJcIXpaFscJSqtRfEEaKfFyNmb1gv+Gp0ozkaB1yvhD37TnImCsgVNZR0tvmnUDBrlRQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kSFTJ7W0KjZl4qQEdJVO4ir3scC0LyMwtYlvbtNxJogi7g/G5w
	IyqhjMOEaykOmWIl4J7PstNK6xRQwBmo6Bb9SPVB+Stbdp+9JB37cS8SSFNzcdCQMJs=
X-Gm-Gg: AYBFou3cmurLHJR3BqcIIAJjOYA02lUURh/JBvDOAS4+iUZyIcb7lsc0PldzqnIqIzp
	WBjYD3Qv03R9EYh7L7FyS8slTqlzrQFVAngiUCGfmaJ6abiLVvy4nARx9G5mN+OzskVp51Q5653
	CBhckEb+RMDw6KgdO6excxMqh7C++++oWmbmPaTEDuEUL5UlCMU+L2Xnib+nzY78m1ykzcoRaZM
	mrCN4bkYpLqhu4QIUuUONzaE1P6tnU3MoORVbua3OHRN3pxQiWWq2S6hsBXlrw/1o8+8EiJCuK1
	HbffFGtZps2L53mir7VMbf7jYNp3A1xqW74wv3Ysr8dMdzoCGohWylGJ2zqW8JTD1Nyqhjff7gh
	4WtGcW7eWbJ3ARvqFGJ5/6cGZ9UbQ4mFB2u8v1jO7Yu0lQWRqGKgmtvJFQqnVoYJZ3afoNyqYHi
	fpjVEMYyoakbmsRMB3R8D8w0K0SjaJKxrR2YTARgznfkJJjNh/fIufSoZtwm6wXsms6yY=
X-Received: by 2002:a05:600c:a09:b0:49f:fc4f:9efb with SMTP id 5b1f17b1804b1-4a01b1a2029mr10750085e9.7.1790759490766;
        Wed, 30 Sep 2026 02:11:30 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F ([2620:10d:c092:500::6:13b8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0174d5191sm41627435e9.3.2026.09.30.02.11.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 02:11:30 -0700 (PDT)
Date: Wed, 30 Sep 2026 05:11:28 -0400
From: Gregory Price <gourry@gourry.net>
To: Li Zhe <lizhe.67@bytedance.com>
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org, 
	liam@infradead.org, rppt@kernel.org, mhocko@suse.com, corbet@lwn.net, 
	skhan@linuxfoundation.org, ziy@nvidia.com, joshua.hahnjy@gmail.com, 
	ying.huang@linux.alibaba.com, apopple@nvidia.com, linux-mm@kvack.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/numa_balancing: allow migrate on protnone reference
 with MPOL_WEIGHTED_INTERLEAVE policy
Message-ID: <arzR_QtoMPtM5kUB@gourry-fedora-PF4VCD3F>
References: <20260930072617.64665-1-lizhe.67@bytedance.com>
 <arzLw18RiTN6Hmey@fedora>
 <7df34f77-2c52-47a3-a495-d782009ab543@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7df34f77-2c52-47a3-a495-d782009ab543@bytedance.com>

On Wed, Sep 30, 2026 at 04:59:50PM +0800, Li Zhe wrote:
> On 9/30/26 4:43 PM, Gregory Price wrote:
> > On Wed, Sep 30, 2026 at 03:26:17PM +0800, Li Zhe wrote:
> >> Allow MPOL_F_NUMA_BALANCING for MPOL_WEIGHTED_INTERLEAVE.  As with
> >> MPOL_BIND and MPOL_PREFERRED_MANY, keep migration constrained by the
> >> policy nodemask: if the CPU's node is outside the nodemask, do not
> >> migrate the folio there.
> >>
> > Why for WEIGHTED_INTERLEAVE and not INTERLEAVE as well?
> 
> 
> Thanks for pointing this out.
> 
> I focused on MPOL_WEIGHTED_INTERLEAVE in v1 because the motivating use
> case is to seed memory across tiers with a configurable ratio at
> allocation time, and then let NUMA balancing/memory tiering adjust the
> placement based on access patterns. With equal weights,
> MPOL_WEIGHTED_INTERLEAVE can also cover the regular interleave
> allocation pattern.
> 
> That said, I agree that MPOL_INTERLEAVE can be handled consistently as
> well. Since this is still an explicit opt-in via MPOL_F_NUMA_BALANCING,
> unless others see a reason to keep MPOL_INTERLEAVE out, I will extend
> this in v2 to cover both MPOL_INTERLEAVE and MPOL_WEIGHTED_INTERLEAVE
> with the same nodemask constraint.
> 

Looking at it, is there an actual reason to limit F_MORON at all? Or
should we just lift

                if (pol->flags & MPOL_F_MORON) {
                        /*
                         * Optimize placement among multiple nodes
                         * via NUMA balancing
                         */
                        if (node_isset(thisnid, pol->nodes))
                                break;
                        goto out;
                }

Out ahead of everything?

~Gregory
