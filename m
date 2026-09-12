Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15D7635E549
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 10:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789209517; cv=none; b=pQBQzOF1/Ka61rwoQvF80PmYBky6doftINXXdma7U446t0M2Q9z7AOA6W7gSlqEe2Ag8v5s6x1m+Je9bMvqqpOgiQU6TzaYzx5TJsVLCPH9sNmEJiqDzVjIR8wuJBgMcSGDy9EAT2cl6GHuidkkFe4okqpflDIttD6ORn9irP90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789209517; c=relaxed/simple;
	bh=oa0BBQb6m8ixrV5rLyGNGiU2lVThayFZgSVGNqNbUDc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OCXrhmJinbpcxjdDC8EkbWcj3trOJjsCSjJbz31E/X3+PVv5QtzkvuTGAufBpNLwjHQ3aILAUBoB7FsTgFtsiA2V3tNRCHL0juy5/HSuYCxWdRI2uqobwJAohNCsyPPoztTCtTRe8AvI3r2QV8Re/Z1458s8mIM0dSl82HtYwmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=lKM9nSfj; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="lKM9nSfj"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-90cdfcbe207so6544916d6.3
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 03:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1789209515; x=1789814315; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f/CrlY1PVfKWoR2jguJZAgonMbE0XWHPet0laqBWYc0=;
        b=lKM9nSfjbW4lOBmiDKQ6wdc/DFz0YfJqFqqr5VkdbmQM78pYbca7Q5s6nypcXOALh9
         YrqqUkcuiok0YPBmfvpeod5ke3178QXUAoVQM3yjWjlBbCRd8ACSdNjWE03GgSbN2awZ
         aE3lXGtBhkTGR8Sx2Y/xcdfvYZmXkSJ2o4pkxX5rT/P8Wlk+K0DK+jvYB5L19b3IFxQ7
         VR5kJ84VInNuFcJJDMEe6B+WKq6CtLJTwgzMERAbz8W4mnpHSs8JpcuW6LMHIQZ+BIBW
         Yq34vr/LuKny+mfBEV24zDEky/ED0MJTNmqXqtax313ttgG0csco9bOOjMjhEhVNETUF
         3QpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789209515; x=1789814315;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f/CrlY1PVfKWoR2jguJZAgonMbE0XWHPet0laqBWYc0=;
        b=BagL1woGcLv+Mec5vR4blhdEaDrWV20Yo66mDYA089ncMeiIerZLM8iNEspAkvz6jV
         SKulbnPxKL/q5vzjwiZjEVM68c1qRHrDbitauw8rfbZKh4dzTf273QX9J12vJrOjyWpf
         bTBcapNGVTqLin//0U7Tgb16nbAc7W1zRnirXbWzFZPFN6NcWoo4xoZUIUUoYycnYejw
         Nzeb7ywIFkUe5K5YIHK3Cl18GDFyGpsZQjaeZVFrgrXtKtPgseb5KoN6Qh2nRZoESCyH
         d0n0AWcV6kA74MHn8s71sE2J3gyn4EIxGOyhrdzfARYY8SyxC7pST6dNGuMIYMxM1WWF
         /mxQ==
X-Forwarded-Encrypted: i=1; AKwUvBw211rkKdZcI+Hb3HkC3rD+SxgpzdKIx1aSaE026CLkLLITq/sQr6KCXhoHXkWuxRzO//eklViH9VCFl7k=@vger.kernel.org
X-Gm-Message-State: AFuF++nNDYd8lujLQ2xZYgAtjodYDpNANMxntU9HCJE+cEm/S9TvXjiS
	trPGoBOTPuZqTtWsE43bYj8M5MHwfZaGax/cLiPSVKs3ftrfkNf167g6b+xd8hc/JVcrYYCGb25
	O2LQk
X-Gm-Gg: AYBFou37p8SQqQmDpSeanYX1kQ/wmJzuL7ah+WEdRFfnCEwbbrCEONqtrK2NPaIecz3
	i05mTnWWwkzYCaUEfdTi5nNWEHuYZ7I9AtBBN+teYjXebhOeNNNPzTvXvGAprEvvonZLzCtpTK3
	8+XTAyYwUiNEVsvsY76wffXz+sRa1YDd4u/rUn6lU8blrAQC6metL3Wi7jWD/cCXeHyOvIa3ZNu
	BrWdRiH1Rpl9nAc8noYMRSWApfEpImEJVXtFWWybrLw9Iv54F6jBO+jWJhnV2wHh3u/E6blEGvO
	yDkiS5iMFAUSyQ8uk997b4Po0e7d8NMYV0kn2msIh4TY/YEHKDGpTjddgZZ1QOvefFTDLWn7M1/
	7A/Bz+UtottBEcsUuJ7Ue+Px0Rm2zJ3UaK0Qc3XAbJiqV6avt9+rfgT/dquUQtNWgKDSeR6Jm/u
	PRHHzIm5syjkYqimJXJJQGEroEw4vFcsL2O6YYLdqONdnNrMqIilpd54SiHULwv7nGil5LUb+vQ
	nTuh1XlMlPCSd9BwuF9/0CLLZcaupRblNOrjoyYdA6NfAEFUOxtyFg=
X-Received: by 2002:a05:620a:4450:b0:939:7d8b:93e0 with SMTP id af79cd13be357-93a0360887amr311772985a.18.1789209514912;
        Sat, 12 Sep 2026 03:38:34 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939ebda519bsm407605685a.26.2026.09.12.03.38.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 03:38:34 -0700 (PDT)
Date: Sat, 12 Sep 2026 06:38:32 -0400
From: Gregory Price <gourry@gourry.net>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com, 
	liam@infradead.org, ljs@kernel.org, david@kernel.org, vbabka@kernel.org, 
	jannh@google.com, ziy@nvidia.com, matthew.brost@intel.com, joshua.hahnjy@gmail.com, 
	rakie.kim@sk.com, byungchul@sk.com, ying.huang@linux.alibaba.com, 
	apopple@nvidia.com, peterx@redhat.com, jgg@ziepe.ca, 
	sashiko-bot <sashiko-bot@kernel.org>
Subject: Re: [PATCH v2 0/2] mm: stop calling pmd_folio() on special PMDs
Message-ID: <aqUra5h3YrYwoDe9@gourry-fedora-PF4VCD3F>
References: <20260912034833.2952750-1-gourry@gourry.net>
 <20260911212503.bcf8461db17ebbf51233826a@linux-foundation.org>
 <aqUqefve3AEiJiPq@gourry-fedora-PF4VCD3F>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqUqefve3AEiJiPq@gourry-fedora-PF4VCD3F>

On Sat, Sep 12, 2026 at 06:35:08AM -0400, Gregory Price wrote:
> On Fri, Sep 11, 2026 at 09:25:03PM -0700, Andrew Morton wrote:
> > On Fri, 11 Sep 2026 23:48:31 -0400 Gregory Price <gourry@gourry.net> wrote:
> > 
> > > Reproducer
> > > ==========
> > > 
> > > No hardware needed.  An out of tree module stands in for the drivers above:
> > > three misc devices, each with a ->huge_fault calling vmf_insert_pfn_pmd(),
> > > plus VM_HUGEPAGE so the fault path takes the PMD branch.
> > 
> > I take it there's no known way of triggering this in current mainline?
> 
> As far as I can tell there are no in-tree modules that reach this state,
> at least not obviously.  
> 

Ah - sashiko did report a similar issue in fs/proc/task_mmu.c though, so
I'm going to take a run at doing a larger detection run for this
problem.  These patches are good to go though.

~Gregory
