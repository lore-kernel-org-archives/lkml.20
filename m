Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49607472067
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 08:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788252301; cv=none; b=VvH+K9IoFuKRJ4hLs2kn3KiyZZZ2DFFqfn0BN9N90mzy6DeWCs5dtOL62UOIzmRRRO59x6Rs9GY38v/RHWu17cXb0HnmwXwJ4l24SW2s/rVmliX6bz6mtyf1qVA78jppJHJpXblrLowbVf5j84XbooHsIHH8AGJ+5iMtKURXjEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788252301; c=relaxed/simple;
	bh=NtxBgGd0WqDwOaBUwC/6y9K57MOJXS3nxDsFOYpS97o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fb9eGdYn5fnWaDZo9MScLKhRt8Tsml40iw9jIZSy0p83iiyNXcJXcrnTYIBVBfflc0qahnUMR6wY1SJuWSFdCmZ1St11l2ZHPYBQaIMepWowypBfeYPkWkRFuPemZ49vSDz9Aec2+NW1QJ1GtgWfkEuJQQBjTzFg5Pi6S281uX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=puLJ08ci; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="puLJ08ci"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-498012a61f6so34275e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 01:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788252294; x=1788857094; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BuTBrOfvCm76tZTU5xJSnq9MvRdv20v7nkLipK7J2Nk=;
        b=puLJ08ci3056D3mNe3Zlnl7V63ZKvu1gANCM/tqypMOic+aDThlKX8o7XRoVNgFeAw
         eSXqj1Phk6NBVJdSYdRzlQ8l/OysaF/Pw55DLerMRFrbp3ALMhOqYRx2bo2S8QxA6J35
         Uk5RJSJGaREvX80AqVxpoe23Kglw2YA9YrqXmqxtRsYF98y63bbDw9oj3F74s6WOYthO
         QyvnKGor0W/l1z0dsjMrEMUhjdmNfHKg9Gi+uR/GLLSRs3uIx8O6qGe5VGtGBrh9q97u
         oldfPcZB86D2tb2m6Qr6yhL1DSPu10JbmnGHGCBPE1C15CrN3ldTKNXrleAj/l8CeQga
         YXyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788252294; x=1788857094;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BuTBrOfvCm76tZTU5xJSnq9MvRdv20v7nkLipK7J2Nk=;
        b=YzjpkTDu8f9CIvPK5iXuSPbRyFOyicC/I+/OMK9debnDRqSt34sJxF0AWCg+xG8ffu
         hOIAAJxr6LZkt27ozYCWqszqi+P7iKCKog0Bh3znPl4qnt5kU1fajISjOEU6vJKWBTSk
         lflSoXg9WkDty+iKhozIei+NuCSEn61gC6F1iGmf17lGNiP/M3As6eCNFiIjT4RwBLU3
         hKD2rYeMUM1VoPqfrPzZTDdlUo1AJlwtkMXpeAWuLBmNeX8tSiff/JCKyRAf+4gDlEbt
         Rv/pJjwAbNvG4QqnZzXDcjJASdnfjvcEqJgZrLYO31qDZTeT8zadFW7XmjwYlnxBE04j
         IePA==
X-Gm-Message-State: AFuF++lTnB4urh/BVPiEOFVQ7TKfzPQ29v/5NkNcbtfsdSorsjia65He
	mR+Rvi0/fjs7/PnkM2Y2a9PJkONNXPlgtzC0VCfQh4Ed4EudinDqf8HOtBIbmyssUQ==
X-Gm-Gg: AR+sD10e8ungKPEvZj23e3660eMg3XC5n3TN40Wwpvp2BOpvtD5o3lSLxbWMkIwgujz
	m6lDfCgxF/4KmKXNI8hPaeLBUfCnydHlqNPpIRZr8ZmDZsNDBiKX/uLzm60xrvrq6w+GWbCK/7U
	sPNaG2GZpTQ+0ox2ctMhIjE1YbKTrUW6tvjLyXy9xccem7DVS5p2DFNa6z7hzmHeOdF6ExF6XAO
	JwEOMEM93bB8hyLZa4U6s7S6VACrFzzd/nLDQOOZpfwDMeQWXnB8E7UuCIlMBh+SAcCawXYxSCA
	d4ouyegtPj/saBOF//s8j+/QYh8Es/llp0nGw/4VzTIOZi2hz67LqIYYRwvLrUxXGjFFHVQwZvR
	3qZV4MUwPjD85D0Scpbc6Tp3oJ5AtZN8PckR8u+Tg+kQ+RPhjdD7Q/jDb4nd2mTJL9n4dqSE3fY
	+jI8adk8R2aXa92MroUallHyOuq5dWvOBerhdgDim6kr4qH6s69d/GCHMSdQL9I4GjhmAavD/o7
	TEvYdONuF1E84tBTpxTfz3hw2igQA==
X-Received: by 2002:a05:600c:e557:10b0:48a:623c:8859 with SMTP id 5b1f17b1804b1-49cde7b12ecmr305735e9.7.1788252293875;
        Tue, 01 Sep 2026 01:44:53 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442d78a0bsm3463359f8f.28.2026.09.01.01.44.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 01:44:52 -0700 (PDT)
Date: Tue, 1 Sep 2026 08:44:49 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, will@kernel.org,
	robin.murphy@arm.com, joro@8bytes.org, jgg@ziepe.ca,
	praan@google.com
Subject: Re: [PATCH 2/7] iommu/arm-smmu-v3: Prevent rbtree corruption from
 duplicate streams
Message-ID: <apaQgcURYAuzBpAy@google.com>
References: <20260828125409.1921538-1-smostafa@google.com>
 <20260828125409.1921538-3-smostafa@google.com>
 <apGudts94pqFL20G@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apGudts94pqFL20G@nvidia.com>

On Fri, Aug 28, 2026 at 08:51:18AM -0700, Nicolin Chen wrote:
> On Fri, Aug 28, 2026 at 12:53:37PM +0000, Mostafa Saleh wrote:
> > In handling PCI devices with duplicate IDs, arm_smmu_insert_master()
> > will continue the loop skipping the duplicate sids insertion in the
> > rbtree.
> > However, in the error path of arm_smmu_insert_master() and in
> > arm_smmu_remove_master(), the code loops over all fwspec->num_ids and
> > calls rb_erase() unconditionally.
> > 
> > For the duplicate streams, the node is zero allocated including the
> > parent pointer "__rb_parent_color". That means rb_erase() will think
> > that this node is root and it will corrupt the tree which includes
> > other masters not being removed.
> > 
> > Fix this by initializing those nodes with RB_CLEAR_NODE() and check
> > if they are empty before erasing.
> > 
> > Fixes: cdf315f907d4 ("iommu/arm-smmu-v3: Maintain a SID->device structure")
> > Reported-by: Sashiko <>
> > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> 
> I submitted a similar patch a while ago :)
> https://lore.kernel.org/linux-iommu/9136477b9c737a50cecc38f2ee6704a01510169a.1783044582.git.nicolinc@nvidia.com/

Oh, I missed that, I haven't looked at this series. I beleive this
bug exists in the current tree so it is better to send separately.

Anyway, I ok dropping this patch if you want to re-send yours.

Thanks,
Mostafa

> 
> And I think the fix tag, as mine posted, should be:
> Fixes: b00d24997a11 ("iommu/arm-smmu-v3: Fix iommu_device_probe bug due to duplicated stream ids")
> 
> Before that commit, a duplicated SID gets -EINVAL and errors out.
> 
> Thanks
> Nicolin
