Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A3A514764
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 13:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791983812; cv=none; b=MooLCJfjE/yJdL7GMSGWuhhB/Mb0B7whz6So2zkxrF1xzZuKmngImU33y2DNYJY7kaIBr7eKkIaPiVOeHLbZAtEDMEPnYhYHR+HMIEvyTfXiy/pWes6DuFUluGbDbXa7kqztJsc0Hywm7r5IR9BwFO7gjkR10m2M2uLJREeA8bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791983812; c=relaxed/simple;
	bh=QwHHeZMXneJxSDoksv1dJPugBvPcayKnfUfOI3k3wGY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jrHyhToSb+n291mi/MUcX2xQMeNzTkz05CjjkMp5PBps8oMauXAg6hxPiaduXbsi8hEjv/Alp6qEXRs8XvoIuKp7/0I4FybCeTeLX145Ry8t6+zkB4QBlYj7aUkZ4EZ/MW8L0lQPunAM+XRXlp0nRAttJ682heL9ukx71jQjYUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=XeCnh2PL; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="XeCnh2PL"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-533797e72e8so2130281cf.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1791983809; x=1792588609; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dCpsW6YU/0L4WqTH5RPpEDwn9rrogta3oLm9yXxgjmg=;
        b=XeCnh2PLoONHDYxryRhvWdMUOKOjW+uECasyvGDWLIw9SN3tuSGp4/rHXOrfkojrHf
         UoPsWVRBpeBn0CyRo2BBPAThhFM33SduMeE7/dfq749HPc3iKzbwGAKxIzijWOo8C7iS
         IOYbSFaQxAVZOJ1ERyXZMccEIZbae2xHCWBvROapCoUodOKEWIjUPuO6Ls/4XywYvbWw
         P6nn6ZL82x4ipV766rUq3ylvilYCO5HfuYbaafMEIKcH95CuhaHWU+xUHstTffG0+Yij
         kDNnN7zEDgJT1QZjUMkSWkfe5el2OXRuQGewibfF+8SPiB0ErjmM4v7GerMv3BdfdXHn
         jjzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791983809; x=1792588609;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dCpsW6YU/0L4WqTH5RPpEDwn9rrogta3oLm9yXxgjmg=;
        b=CWG0hh2RlsSf+QVaIssQDBOWw96hydQiWjCcQski7pIRT/ywS+u0g3NLypEY3GYP1f
         tQN06sb23yoRI2r5XQf0sMqVKwz6hZeg4VkF1TU2x9yrt4zNTn/OAL54tN1LBcKoCQsq
         SFOYLMCwE+d/6QRK4p2zi9t0eUj5rVdHkB8lb7SuYWkePOUu1+CEMyk9KrC9p2tZAguC
         YTcXhQruYdj7/KR3uXZBJd/d7nqz6YrYr8YhcM5np2vSh8kXxDk7mV4oWoRsWcR1O6Wg
         qio9rH4WcPpx/X747j8AWBdNG5RRc+5kLZ6CdZMO9ATlB9rnNHFeLMB22FOf4giIPkAW
         UCGw==
X-Forwarded-Encrypted: i=1; AKwUvBw1wGZE8TBdrG0V2WNoJEMJtUBPGeF4RaDdCIRliZz5zd2OopVLkXE8J9UBOSwXKAvLLLCqy3+BVPCfnx8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKge4USvHKPBMLkPNxvzK4+yyWWEGnLoPZjea0kHMciuatPX0R2
	4hGiT/BCQebe8yBnnluy51A4xX6cbsGQwlHsv2yLRMfTtwv+6CvURVOdJprRaG2/rEQ=
X-Gm-Gg: AYBFou2nD7jaKCccvaK2l+wlx2pnc+C/p14x8gFHh8l76Jsp2iNxqqSrkimat25EsxJ
	m4A4VQ++xCXaX4oyvLQm6sNqv0JIVsxqi83yIFoOlmi07NOlI7CCtukoRV3En/Wuu9Q7Wsh0k30
	npJzrOPQK3IBTqpfbbBpezeRp/pxu5LiS63SSNBYGRGEvw1nhJVx1X2IHwcM7FjpgWjs54oweI5
	avGSikimUDg2bf7UDKiqY1abxvtj3wMOXO97BXr6q97Ee67UJKYF+gvwvBla/UQtGy17vfz5Yry
	9SNlDvg3hFVS+XmXMOYWDQEsINL2l0vR/PMKzbnvauq/hmnPrRhPBWkKFcrv8cAN8t0uSjdENcR
	r+8NvBygEBbVM7+guOdVr1hoQ6IkbEEgWhE5w2lTGMCHh8gjr+SpVnzqxCMt+5jIaIZrEWsrUil
	sQ1ZMlOFb6RtoksqYQ+momkBxYDNT3SS8zEyza6sfsipXcOZtfdhp9sgw4TKEl2g9U43H2QYUi7
	NmTo6It9HxkT3UxBBSY3ESPMJy0ioTWemKihen7lgIFA6mSTe6bwH0=
X-Received: by 2002:a05:622a:999:b0:535:958:b9c1 with SMTP id d75a77b69052e-5359f46f32bmr248930831cf.11.1791983809565;
        Wed, 14 Oct 2026 06:16:49 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-535f4eee7bcsm30668321cf.30.2026.10.14.06.16.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 06:16:49 -0700 (PDT)
Date: Wed, 14 Oct 2026 09:16:46 -0400
From: Gregory Price <gourry@gourry.net>
To: Li Zhe <lizhe.67@bytedance.com>
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org, 
	joshua.hahnjy@gmail.com, ziy@nvidia.com, mingo@redhat.com, peterz@infradead.org, 
	mgorman@suse.de, riel@redhat.com, juri.lelli@redhat.com, 
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com, rostedt@goodmis.org, 
	bsegall@google.com, vschneid@redhat.com, kprateek.nayak@amd.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH 4/6] sched/numa: make free-space tiering promotion bypass
 configurable
Message-ID: <as-AV04p-AZ45-mw@gourry-fedora-PF4VCD3F>
References: <20261014094347.99157-1-lizhe.67@bytedance.com>
 <20261014094347.99157-5-lizhe.67@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014094347.99157-5-lizhe.67@bytedance.com>

On Wed, Oct 14, 2026 at 05:43:45PM +0800, Li Zhe wrote:
> Memory tiering normally promotes any recently accessed slow-tier page if
> the target fast-tier node has enough free space. This preserves the
> existing policy of filling available fast memory before relying on
> hotness and rate-limit control.
> 
> That is not always the desired policy. Some workloads may intentionally
> place memory across CXL-attached memory and DRAM to use aggregate memory
> bandwidth. With the free-space bypass, cold one-shot accesses and bursts
> of hot accesses can refill the fast tier and pull the workload away from
> that distribution whenever DRAM has free space.
> 
> Add kernel.numa_balancing_promote_free_space_bypass. It defaults to 1,
> preserving the existing behavior. When cleared, enough free space in the
> target fast-tier node no longer bypasses the normal hotness and
> rate-limit controls.
>

A global switch for this is a poor solution for this problem.

Also, if the memory was spread out intentionally, it presumably was done
so with a memory policy.  In that case, if the user did not set
MPOL_F_NUMA_BALANCING - that spread is already protected because the
mempolicy overrides the numa balancing fault and no migration occurs.

I don't think this is the right direction.

~Gregory

