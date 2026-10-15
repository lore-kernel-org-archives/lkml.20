Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12751416841
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 13:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792071539; cv=none; b=Qc91xWIQoNT+Xu5TYfe+uogOYAJV5pwNNcs0LLPW1Tnsmv5A9dWnl/stNMxwxasaWn/LeLYp5omAgzMJkMqCp1TkyxR6HEKd2qAg8eDgCnY/98kKNbujdi3cLta/pUVoq+EWsPCWdXWKONH6ZhekqJTzEb6dDBwBH3/gPuouWV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792071539; c=relaxed/simple;
	bh=JpMB+Cvxnmk2N1cuA4FGoEGtr1Wa1vZOqjUDepOIA/o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TocZrpoo9TchY8uHlGhcCpdexNNkjfN6Xosz7suOWK+i5n1mturQOpnFfQnIqVzx2rJo5xoYhwnjNmBmM6iFy1pEtfuL6C9K0L19rby/cvKUZZkWLs3J+5lceHl+NiGkMM2K3Zm1BLgwH/ReJdx5U/HbWB3e4QUCKACs+iT8MFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=NO1URF/Z; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="NO1URF/Z"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-93e51d8d400so357939885a.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 06:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1792071537; x=1792676337; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QFn7sojbGXNFhqbogZOUxB7sxcSHF2Ksqnd8lPmDfO4=;
        b=NO1URF/ZNMgkx03i2LvrPOnvxVB6MGp9uA5PlTPPNfjtpN98426HZq94TxXOnqCtkN
         CP1LA5jnN0j5JlWSVO6eGJKX+8ReJCZTwP04mxq/rYNt7JWZ9qDzjOdvxCdIJ1v5axvz
         rj7msuXVcVj4yH7HeWTPcDCJp0C8tNDY6jVhterCYjkaJodBf8ZYhqvyprXuNlLn4kUg
         DOd4X4aZ67WNqZEQPepU5I7wKeZ2UInZ4mJ6PQWG0n++HadmvrLQrXbx4qJpvB5UooUW
         VP+I8GQzA1xMoJWd6lrcOqFHrcMmpjwuWyeAfRSAblctuJ0yCKqDLDuHGtaAtdIKuUr4
         x0UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792071537; x=1792676337;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QFn7sojbGXNFhqbogZOUxB7sxcSHF2Ksqnd8lPmDfO4=;
        b=YjxGGoiXfgAdfMPpfmHoqKral8F6wf60xu3zs2+eo4H3QvSTfU0symB6LiquIvCEwu
         LY8Mhpt/IfgdBq2ZCsKRvWXpYhLw7Wik+HdT+kTKKBa7rye1p2oWEBOUc0jNgaqebUqX
         nFBlI8iXxNylHdH9vhR7cERaBqfxeIqYB344bbt/avHGEwz7+dA9CJvbfdq3x+xV0cEU
         jFNbHmEmSIEvehr5bqoPlWb4h4/IOG630wMrd/0QwopD0M1Rw7LqAsIj+15VLVkVDVJq
         y9PQGxbxhw6fqBmPBAQFw3iYe6u5iwFVxl0ww6ICwzcJo9lhCbY5HSrOsqvqoS6kcLf+
         5XHg==
X-Forwarded-Encrypted: i=1; AKwUvBwwm1j/uiwT4DFYvqcb2HFSbGw6HZCl6sDeSLXsfHGxQj4rvq1A/WFfGviI4oqrUPgpRlZsdM+LUNPY/4g=@vger.kernel.org
X-Gm-Message-State: AFq9FYKsmXBx+OoF+M6gLvzfNicZW/Mq8INlmGeEjgZjqr5fFFENXL/I
	qZBaQvq1YNgRlIQSaFL5jatvZlUkqH7jITHCCLhdcu0CEpHqRnFvxnc4q9B7eR6cm4U=
X-Gm-Gg: AYBFou20U93nz88vhQvD1SK+nC7TccTLwIZHEaaaOVPkCNIs74MyCnsyGU5T7FZXk+S
	J4DYu0w96KUfKci4KCu8KvzFhRZ8g5DIlZMo6RSGY6CHEfI0Mxngtbp8jAwf70vAI3ih03i1JKx
	yk5qHpyKvtkTHwKCTqoUzbjXbEgSk8cJkm4f8NTk6ac0ztqrCwV8Baof1tkxpNJdoM+Zt6ezdQh
	TYiu/uy0G8nGKpq5sTLmChAySu++EtFjhswSLqX4LwQ3zlGyHl0RnOLzQNDLkn9FhcHQnsCWpqM
	M5KGtVnjpIYWIWiKNM75Pz5JNn+ZBvBIWocvNUeXtqmqw14I39W9bf7lOTArkU0hmDWUt9CKNcC
	xCdZcVoVR0+FjezovC86FgIw97oelRmIB/uUZsMbhg04gSG9jMgS1P7fnyPOHyLwvtm4d31oi5s
	DJIPMww9fh12ppkCVK/7jDggHyJYfzzBao8XtRUo1SQJXcU3Jm876curglc8RCUrPfVSZlS4G5F
	O2J05oTO7VsOcWaPz2le0Syfk+ZJO9U79B38w57wkNhRKbIkfiaUXAPod4k7pj+bg==
X-Received: by 2002:a05:620a:1786:b0:939:6de6:9518 with SMTP id af79cd13be357-93ebd2607damr3020594185a.47.1792071536816;
        Thu, 15 Oct 2026 06:38:56 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93ef4f4986dsm774993585a.2.2026.10.15.06.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 06:38:56 -0700 (PDT)
Date: Thu, 15 Oct 2026 09:38:54 -0400
From: Gregory Price <gourry@gourry.net>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: linux-mm@kvack.org, cgroups@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-team@meta.com, longman@redhat.com, ridong.chen@linux.dev, 
	tj@kernel.org, hannes@cmpxchg.org, mkoutny@suse.com, akpm@linux-foundation.org, 
	surenb@google.com, mhocko@suse.com, brendan.jackman@linux.dev, ziy@nvidia.com, 
	david@kernel.org, mgorman@techsingularity.net
Subject: Re: [PATCH 2/2] cgroup/cpuset: use mems_allowed_seq when checking a
 policy nodemask
Message-ID: <atDUMtlM9Z8CPlRo@gourry-fedora-PF4VCD3F>
References: <20261014222456.2318284-1-gourry@gourry.net>
 <20261014222456.2318284-3-gourry@gourry.net>
 <8d611a0a-4ada-4536-875d-061492773e05@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8d611a0a-4ada-4536-875d-061492773e05@kernel.org>

On Thu, Oct 15, 2026 at 09:59:31AM +0200, Vlastimil Babka (SUSE) wrote:
> On 10/15/26 00:24, Gregory Price (Meta) wrote:
> > A cpuset update changes the task's mems_allowed and rebinds its
> > mempolicy in separate steps under mems_allowed_seq, but the check
> > reads both without it.  This can cause a spurious numa placement
> > miss under some cpuset/mempolicy combinations.
> > 
> > A reader that loads one mask before the update and the other after
> > it can see a spurious empty intersection and drop the nodemask.
> > 
> > For example, a task with cpuset.mems={0} and MPOL_BIND={0}.  If the 
> > cpuset moves to mems={1,2}, the policy is rebound to {1}.
> > 
> > The allocator can race and compare the old mems_allowed {0} against
> > the new policy {1} - which will result in a dropped nodemask and a
> > misplaced allocation on node 2.
> 
> > Simply retry the intersection until mems_allowed_seq is stable.
> > 
> > This covers the task policy, which is rebound under mems_allowed_seq.
> > VMA policies are rebound afterwards by mpol_rebind_mm(), outside
> > mems_allowed_seq, and are not covered by this change.
> > 
> > Fixes: cc9a6c877661 ("cpuset: mm: reduce large amounts of memory barrier related damage v3")
> > Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
> 
> Should the comment and/or code in check_retry_cpuset() be updated as well?
> 

No I don't think so. We're checking different things.

The loop here makes sure nodemask and mems_allowed are stable when
compared so we don't erroneously drop the nodemask on a race.

The cookie-check in check_retry_cpuset() determines whether the entire
allocation should restart.  It runs after the nodemask would already
have been dropped, so it can't catch this race.

~Gregory
