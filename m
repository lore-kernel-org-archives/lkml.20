Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C4964EBAFA
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 14:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790779845; cv=none; b=ZDK1oXBDu7Rd3Lkm+tiKaK4GLQf6m7RIHYy3e9WTHIERiRQQtrAZHvahwn3UrhzLeHH1EQLhcZYMKGNMsxSFJNMImA0MB3DEY7IaftQTzCTJcpFcRs+sICefBqHoslq4Pu+tO5LH1RR4CmdtUOUJfSf8Kky9ReAF7NkJbwYqvT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790779845; c=relaxed/simple;
	bh=aYgliebE9zpsT289QWtpM7k0O5do8UsYwtdKdEA6ihw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Le/TTNDH2OY1BC3xE5VWme4SN2/CrqO7nsPfhyDLJKxibujHrLh140YdVykXZVJBIwpMTW8smN0I5czhWfl9IuE+ASfdxNPxUQdYDczQZQ3WoFEBRtmjtYZx2J5X+wTWMHwwnvsnaMTNdt+2FrLZO6e+VZPnpkZH0P7ATiwNYno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=fMHpDSZ8; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="fMHpDSZ8"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccf3ca626so33795045e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 07:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1790779830; x=1791384630; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=H3qtNVwOX7r6mYzIQEIi64injBAtcVX6qzz09d86hu8=;
        b=fMHpDSZ83Vl/3CG8Ao+igOp6O3VCg8dDeB2Wsww4B9VqNKffjTqLFdRbW32vXnW5QS
         FogALFeXU3gTijkRBhB+KDXZHCIvqck+IvaPxuCVd2qm7lVRePgfj38fK4iYr8fduxV4
         zr2zlFF/FK8fDmivykxKmlFySVeC0HJlFy0mUHbKI4vfz5sRL89I3z+AlhAgv7DdkPcG
         EshPkH10sqFTxy3UF38pL73ehzPAE4OeI8L80TShEc3HWJ7/hZfCc2+jy+nPFayS1Dlg
         yPak2SgN1NySC1NEjNIxxQMc1tJ0Svkz96yBYRZstHwZ8luDCH72vHkOb10XbBBPJ5Ag
         Srkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790779830; x=1791384630;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=H3qtNVwOX7r6mYzIQEIi64injBAtcVX6qzz09d86hu8=;
        b=tav2z/oa+CJhuShyjaZm4G2ZmYWm+8JcACVDMdMmYajoUo+3/jVP4puMz2Kn0h6zaV
         44AV2+038C8eB13fepllylGd9VI1Ni7cHfV2q/dFsezYWrfDIhwudm690F/ZB//DD1LS
         RK5ymSXLW3JzkmKZVeaddSVnZ86XbnpB06dLhL+E97zhUcpnRbfkG8JyQ/DDAH+7XrMM
         VoUph/1pKlzcZNrZvW31RHYpeLdqj5bJ6NSg5BKeenyDYLdos5P9/aBf9sffQQIAjGF8
         LGPgRlxxyIBOF85KLRwRzAdcW7C7Wa5EduEL3H4h/4BWAY6R6nrgtTAeoOsalMlRhS2l
         5CTw==
X-Forwarded-Encrypted: i=1; AKwUvByCH8a0hj5Zdd4swlQDRqT9l7JbRD8hgMB9ZxL1YMgduz2Pu58NfqghVpeIv08csA/u6IrF1fJSRnfPTHw=@vger.kernel.org
X-Gm-Message-State: AFuF++luITbpd80DX8l+mjm/bNVjsW9apfV58NJoTHkcPEKcKOADBRIe
	hI/RIJirVgXrT4vz0HAzkTevMwKZJ+1F0+U2lkYWU5vyuBvStJqfoiAE/fDOoL/oo2Y=
X-Gm-Gg: AYBFou3MiI9LCoipMGzZq058B0120TSSX0SJOXxsbLkkk3fiGVw6nI5/v3hqi4AfGR1
	tM2ku1WWceAgPjNIstjb90lVOH1uxwQlbLEwOcG4JOKc2ccnh9Z4KrFu7eSD5NgyK8oILf8CIcz
	zQUtEolsUNKzF5IaJ0A4C84M8CZx1HvEuNN0I5xm799tQZhRkQUAr8FSmh4h8bRxENyMIEgvRgI
	l7xhPwv8a/+hcJjw///69uxJdxjemTQiy3mrKSj+FRYpXy8IGpfGOu0rm1UMEHj+XRQ88gnvTJY
	WhJGeZGoVUbFU1U7s5Fkgfk8SsJ54Fg3MiVLERE6uoh+xVTWjumwiSdzbrVWSpC9mU5qGRG8rJ7
	PdPAvNzdVsfziNodfXs3w1XUd4c+/aW+uJZElTZFUE2lNUS15OQUyYT62GGvvFi70M3yPfKR4go
	1YcmIx4NkcNKu3lqskX0KtP3V0BNVfZgd6Mj8CsY0TaHJIyesXjk+2X1og2XG35LfBeNk=
X-Received: by 2002:a05:600c:45d3:b0:4a0:c2a:485e with SMTP id 5b1f17b1804b1-4a01b130b8bmr25639735e9.33.1790779830473;
        Wed, 30 Sep 2026 07:50:30 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F ([2620:10d:c092:500::7:e977])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b029edea4sm4382698f8f.22.2026.09.30.07.50.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 07:50:29 -0700 (PDT)
Date: Wed, 30 Sep 2026 10:50:27 -0400
From: Gregory Price <gourry@gourry.net>
To: Li Zhe <lizhe.67@bytedance.com>
Cc: Joshua Hahn <joshua.hahnjy@gmail.com>, 
	"David Hildenbrand (Arm)" <david@kernel.org>, akpm@linux-foundation.org, ljs@kernel.org, liam@infradead.org, 
	rppt@kernel.org, mhocko@suse.com, corbet@lwn.net, skhan@linuxfoundation.org, 
	ziy@nvidia.com, ying.huang@linux.alibaba.com, apopple@nvidia.com, 
	linux-mm@kvack.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/numa_balancing: allow migrate on protnone reference
 with MPOL_WEIGHTED_INTERLEAVE policy
Message-ID: <ar0fURbLDPrphYMY@gourry-fedora-PF4VCD3F>
References: <20260930121154.687586-1-joshua.hahnjy@gmail.com>
 <2e3f12b7-0dac-428c-b70b-07e1f63de028@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2e3f12b7-0dac-428c-b70b-07e1f63de028@bytedance.com>

On Wed, Sep 30, 2026 at 10:02:23PM +0800, Li Zhe wrote:
> The use case is closer to the second one, but the main motivation is not
> only startup-time performance.  The more important point is that each
> workload has its own DDR/CXL budget assigned by the workload manager.
> 

mempolicy is the wrong interface to do budget policy, you'd be better
off looking at Joshua's memcg tiered node solutions for that.

> MPOL_WEIGHTED_INTERLEAVE is useful because it lets new allocations
> follow that per-workload budget from the beginning, instead of placing
> everything on one tier first and correcting the placement later. This is
> important for workload orchestration because the workload starts from a
> placement close to its assigned DDR/CXL ratio.
> 

This however is reasonable to me - you'd prefer to spread out the cost
of initial faulting placement explicitly, rather than simply take
fallbacks when the top-tier budget becomes pressured.

i.e. w/o interleave:

[node 0       ]
^^^^^^^^^^^^^^ alloc until full
                vvvvvvvvv fallback
                [node 1          ]

in this scenario you end up with considerable hot memory
on the remote node consolidated in time-space (everything
allocated after node0 becomes full skews heavily toward
node1)

Tiering then likely takes many faults to rebalance after
you've already reached node0 limits.

w/ interleave

[node 0                                      ]
 ^^^vv^^^vv^^^vv^^^vv^^^vv^^^vv....
[node 1                                      ]

In this scenario you do an initial fill distributed by weight
and then let tiering figure it out without consolidating all
of the pressure to the point where node0 has no space left.

That said - this seems like mostly an initial-fill problem, after
you initially fill your memory, a new allocation largely implies
the memory is hot - and you probably prefer that to be local.

So while it's possible to enable this, I'm struggling to understand
the justification.  I think I would like to see numbers that demonstrate
that this is actually beneficial over the life of a workload.

~Gregory
