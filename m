Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D16E46C4BF
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 13:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787925493; cv=none; b=f7Mhth9dQuT5n+zVPH4iOXO94qHTXLG1MvynyWQcURyxxpnEcw2djOA4HS/Y250abWinxY6BiPYINeXZjTQTCb+czPNzUWcI9W1L8yrkykfypLP+MqgiWDxoyJyhXKgLVWolrd/NAi1lfyw5DcB8jCBBs0BBs/8wzS8EUwGO4Qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787925493; c=relaxed/simple;
	bh=8aH0EhpSWQcfKV42OG35TjAJGz1D/rOh3qyHuyjLHr4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=atZRKX8+3hBTd176WuvjIDSxw3/nDFNI3C4iltIZm9GDZJdCeDpfsZWrYFLzyeIjNJzZx2wJa+qBvSD5aM8TprZgHk0gvMr/txsPS/WfS7GbOIt/ZUYVDg8FA/4OnsVnPLt6tw/Nd1U9q7lW5pa03hY4NOaOctPK7BySouCcIMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=QqTW+Hse; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="QqTW+Hse"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-47f84023916so893191f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 06:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1787925490; x=1788530290; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KpbfDG68Jz7v4yiugpNXGnV426H5322VZcT0zhKeUVQ=;
        b=QqTW+HseM0hcfNuSKgLxfnlvNbmMg8fKqytGxMSf9fI7/bPln0piQqK2lfQHsmtNga
         75gKN3lqBBU0Q2QDVRCsk19P0xICuwEIXGFuYvKnNFOGPVLKLdLn246kq1o3Xtnu/aFu
         4iMyC/qAhKHrgzaBvx5dP1s22VqyfyoyLCJxrdpNrKps0JbjgO8dFdd9VcIc1w8rsc4l
         ZDpHd2/gVIVM4CgvFRigfFudi8j6m05h+gQ49S7gyedFxi0tk6tuazw7f1V3d2wJDJ55
         xargBsWhNgoMZlxLr1cE4c4wEvZ3UFrqtHBR/1jOncIS8xno3bgW6s/c5GkqhcI+rftr
         RsXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787925490; x=1788530290;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KpbfDG68Jz7v4yiugpNXGnV426H5322VZcT0zhKeUVQ=;
        b=r32RRK1R4BlQmYMssn5WxhFyCGE4fZGY4+mTOz360TvatF89UbAkW6XXW4RQLNjk0R
         DfIfuw/+ht+RWc04JqcfAdqe7wzL/ryRDicsJ6VefyTpsBnznYKgJ3d9jro0dMYh/+Ti
         ISONNYbBUkFp8Z7tpT8DW0OceXRC0tEIGCce/4NuWaoqQCABgo+Fh7aKhYcyUO0tnXUw
         RKwdyeo9sTtr6ZwvBxVs4uiMWZ5bJa/KEziO+3YueMnaZ3opiZHGWCHJPOUmw72sKEzB
         owb1qIir5KG83SFHW80sCpZjKX5IN9lz2TbBcjQC2MXlsp+62FdzSrmCD2wrQw4yf5PW
         VHeg==
X-Forwarded-Encrypted: i=1; AHgh+RrPIjrdMKZINMrHkYCNNMeFrQfubDKYlCz/E/FERizInpT1iuS6FFino8z+nuKYtfkU/GuHAzC9AkVWJFE=@vger.kernel.org
X-Gm-Message-State: AFuF++n2hRZ4IckGgGu2W7gKS8O2csJrKRHnodDv2VZ4Ig29yvHuJHtw
	WZz8ux0Y0Nljttba+OB4FCd1zSuqSAFZQr0tCuuDiyhwl5xwrgbzso6eDUw2ogKlcoU=
X-Gm-Gg: AR+sD100k3Z314yStzvDEeApmvmag7HXUpDSHuK7xQ7N7QuvrO7PjJUd7DmmFk3PYtd
	B0EOgwVz7fmbZnjOCS1+f5+WTvjVVLjiI/tPlrVjc0b7D868F16P/It29q0R//0Ku1LPJSX764h
	I60EK5MDJRFPo9YMCmngwozdElNMwJ6AVhTRDbnG55V2cW/Z4BNxT21Cy+AF/0M70mh65Dc/PDg
	9dEHjVWN7jn48rbrYpKLm2WCMfpUg+imyPotxqLOrUYfZ2o9nTACZ0ORkDwCXdmVD/BoHVuEQuz
	STXGgE9selRbxc1/uHty4Lp/4W7ZJ8rPDOEQ8gYFQuKewnB2/hl5cVUGIKLuk9z6fjL/s+OZ2eN
	ad47GCFshUP3rgao51NlGSgsVLPhM7qO5uGTkYvtSaK9TiFeqWDDlsacueh0sYPei7YXIX6KAVQ
	SjGmRWmYBLdKjmdugRpSiOHUT4k+BZ0JzNeFqZC3Sj8W3ywGFvgIqfkUGuCQs0g4/iD2yG9AFWO
	A==
X-Received: by 2002:a05:6000:4b1e:b0:482:ea08:8c8a with SMTP id ffacd0b85a97d-482f79c8f48mr11841026f8f.20.1787925489731;
        Fri, 28 Aug 2026 06:58:09 -0700 (PDT)
Received: from localhost (109-81-85-229.rct.o2.cz. [109.81.85.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fba3cf65sm8616460f8f.0.2026.08.28.06.58.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 06:58:09 -0700 (PDT)
Date: Fri, 28 Aug 2026 15:58:07 +0200
From: Michal Hocko <mhocko@suse.com>
To: Hao Li <hao.li@linux.dev>
Cc: hannes@cmpxchg.org, roman.gushchin@linux.dev, shakeel.butt@linux.dev,
	muchun.song@linux.dev, akpm@linux-foundation.org,
	cgroups@vger.kernel.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm: memcontrol: treat disabled memcg as kmem accounting
 disabled
Message-ID: <apGT74PpkVvkUkY4@tiehlicka>
References: <20260827091813.22327-1-hao.li@linux.dev>
 <apAnveXHmeQlKJnU@tiehlicka>
 <apDZV9nKW69ZbIj1@fedora>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apDZV9nKW69ZbIj1@fedora>

On Fri 28-08-26 08:47:54, Hao Li wrote:
> On Thu, Aug 27, 2026 at 02:04:13PM +0200, Michal Hocko wrote:
> > On Thu 27-08-26 17:17:50, Hao Li wrote:
> > > mem_cgroup_kmem_disabled() currently only checks whether the
> > > "cgroup.memory=nokmem" option is specified. However, kmem accounting is
> > > also unavailable when memcg itself is disabled.
> > > 
> > > Check both conditions to ensure the function accurately reflects the
> > > kmem accounting state.
> > 
> > It would be really great if you could describe how we could end up with
> > the inconsistent memcg enabled but kmem enabled and what kind of effect
> > does this have.
> 
> Yes, thanks for point out this.
> 
> > 
> > AFAICS the inconsistency is possible and it would lead some wastage but
> > no functional problems but the changelog should be more descriptive.
> 
> Exactly! The most direct benefit is that when memcg is disabled,
> new_kmalloc_cache() will not need to create a separate `KMALLOC_CGROUP` slub
> cache, but can simply alias it to `KMALLOC_NORMAL`. This avoids wastage.

This is definitely important detail to mention in the chagelog. Same as
the effect on the __list_lru_init and other callers. TBH I am no longer
100% sure this is correct. You need to explain more why this is just
wastage rathe than a subtle side effect that is desirable.

> If this sounds reasonable, I would be happy to explain it in more detail
> in v2.
> 
> > 
> > > Signed-off-by: Hao Li <hao.li@linux.dev>
> > > ---
> > >  mm/memcontrol.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/mm/memcontrol.c b/mm/memcontrol.c
> > > index 1ebceade4021..b28f6165c354 100644
> > > --- a/mm/memcontrol.c
> > > +++ b/mm/memcontrol.c
> > > @@ -132,7 +132,7 @@ static DEFINE_SPINLOCK(objcg_lock);
> > >  
> > >  bool mem_cgroup_kmem_disabled(void)
> > >  {
> > > -	return cgroup_memory_nokmem;
> > > +	return cgroup_memory_nokmem || mem_cgroup_disabled();
> > >  }
> > >  
> > >  static void memcg_uncharge(struct mem_cgroup *memcg, unsigned int nr_pages);
> > > -- 
> > > 2.54.0
> > 
> > -- 
> > Michal Hocko
> > SUSE Labs
> 
> -- 
> Thanks,
> Hao

-- 
Michal Hocko
SUSE Labs
