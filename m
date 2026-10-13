Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7700951C33E
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 15:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791904503; cv=none; b=Y9ypMGGguj7mnb7nPqWnKECEMtBatvcgdhuIk0Nqvy4yfZqt8tncMdSWemRrt9DXcWFp4JdMyS4QDZLT8Yk8xgil9Omu9XYlcA/T65V9yBtuzYmNLqKkSn8x5vp82XubqbkTRvQHcx6EBuOzWfJMX62DNdBwcgZrerY79LwzBVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791904503; c=relaxed/simple;
	bh=VgO+C+8KDYSTE6ugGfRNQKKkE0G27if6p6FDk0jABBo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NJ6PPbRxIzli/sn9AHP3137sVI3AgFdmSJ+gs+kYvAdGO7VW3spPJ0DMcazQPPpsYNBN6f2bujbMZDbYZU32jKJNNmxfhujPlpAU3kC0OCj46CVr+R38QT7fdOYpB7AFc1lm1zzQo2oPjfZ8chp7cvl+9vhTqjbBJXVg8PBTBUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=YRTKFJt0; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="YRTKFJt0"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-53397554beaso33825571cf.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1791904500; x=1792509300; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5Kz+IQfSF4Bo0R4irbQAkdmm6GDBbYpLf1oqZAlKJ38=;
        b=YRTKFJt01RD230amJaOYkN52vCXt60RXmGoZrKOjOx6vScS6bXuUyf2t+o1eDTHcDX
         w5V5tTYzIZBGfhDV50IQdaZCnspQbLrwLbnQ5Hda/HNBSaasqbPt+GMHX94zVaoC9cFd
         lYa7qncMAXPgOh+p+I6MdY6oYnXgE6ldMbge5HwROl+xOkrpRupSP5BIp1Dws/Qkk/Uz
         zf+VhYIuiPgeVhj8B0p/xDK8VgCIXSbJj7vDY/l5W8JhZqkQeweEMrhL4LcCDEc5HlC8
         i4hbq0D+vXzTm6ORuzZ1lxl/CGEobze37hLA3dv97zRbPujjJJTojeJVRS06F3yUoby0
         eMVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904500; x=1792509300;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5Kz+IQfSF4Bo0R4irbQAkdmm6GDBbYpLf1oqZAlKJ38=;
        b=WQgj9PndDyFl1jWXFl3VniYYCe1Iyg3dIvC9AuWp05B45fkQMG81z9IPvOWrZKqckD
         1tJrzkc2xSTGU/wrIH672yDm3VyaQgdD4RAWHJU0krpGE1WYi9GdbCY6GTKCt0GCRLWL
         FMc2ielrxZc04ggbEsEN07iHcirwXR515SsCWORYZaKPvLUf+k4fJ9c8BQPnEi5D4Y7t
         c7qU2Y/UIjxMsYD5E+rZJcFGhtVcAbxbp0NMjn9uRSrfU02+rqbgCLG9Dph6oXJU1U5t
         CBOKW51kp1/C1Lt7pzf0r59X51wiwKOoOHP6FSYzXIthZpPu7mM9qtoW4cuRmQW4hDtP
         FkkA==
X-Forwarded-Encrypted: i=1; AKwUvBzzMuLauejBXGUnAtjeZf2eGWJYgR78hS994pYz8mVaj1I312SPzoHTN4Al9cvCBGS4ZOfN0ywcl9FaH7s=@vger.kernel.org
X-Gm-Message-State: AFq9FYLLVICfqXYZkdhMBjETmZLsOxKW7pWzyxaHi/vMRcb1dz12MOYx
	VlDeJg8/PzcnvDH7HDyUXaMqIiuUrBYUzKtwLiuZ/jmhG8GBMKuLrZe5Y4h1cDoR9l8BLqQCOrg
	FbJ3O
X-Gm-Gg: AYBFou00nU4gvJ/1kZCo6xTBdjMY0aWD3/nBQAHeQW0tV28P1csBtVvDbPbT26d+8wI
	r9AFXzPfObmpoiAjzHjETCRo6xa5aQSfTOwiRDpvHYE3JaHSi9awbZKRvJfWP/2KBIoYLzx7WZs
	z/vqtnU41wWgYmTPPUc8Ats7SuXTm1bgThn2C7vv8B3yJBPI+XGhnfVTRbfcolPNDl26vmo7q9k
	Jl7BB1mtn11RAbbqWdfaQIjggQmCCRpcEjMRz7dvfN4i1gPdC8GKxB6xG9TjePjPHErrnY2AJKV
	eEP6dsQtInlmrwPOwG5XGWMaVta+bJdHOWFBGWrNIOI6L7Ieuj7aUao1m9aTy4hiTKZi7ZFppvf
	DIYn9sYE9O0FzyEjNNd/ddtLNu4AIWBrrjj5eEBuJZpA6gabG22TWuTcw7hetgJMcKXLLSrNCMQ
	6yjWyQbjjDvZXmopFb+a1B0JgbmmJfF4Xj3/7HPSm0+k4AQ60C09jr9hAX4L90c1vH7qvpDvutR
	Uq/uplNWpROv8L4r8hoM8r8k5qjVRkLwb2oDSv0cyupGyEX7G5LyGDg+ZiDJOlTb2Q=
X-Received: by 2002:a05:622a:e4d5:20b0:535:a5f9:752c with SMTP id d75a77b69052e-535a5f97acemr137130051cf.75.1791904499634;
        Tue, 13 Oct 2026 08:14:59 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5359b7e32cesm100542321cf.28.2026.10.13.08.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:14:58 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xGeDS-00000009ss0-0PwU;
	Tue, 13 Oct 2026 12:14:58 -0300
Date: Tue, 13 Oct 2026 12:14:58 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Robin Murphy <robin.murphy@arm.com>, Nicolin Chen <nicolinc@nvidia.com>,
	Will Deacon <will@kernel.org>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Jean-Philippe Brucker <jpb@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Krishna Reddy <vdumpa@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH RFC v6 5/5] iommu/arm-smmu-v3: Wire up shared-SID STE
 ordering and feature gating
Message-ID: <20261013151458.GL14213@ziepe.ca>
References: <20261011-smmu-shared-sid-v6-0-cb76b89dc612@nxp.com>
 <20261011-smmu-shared-sid-v6-5-cb76b89dc612@nxp.com>
 <aszfVNP6DGzWYdK0@shlinux89>
 <as1zR1wc7ERxvR1F@nvidia.com>
 <e8c22eb2-ed1f-47c7-b2ac-c56ead1cba8b@arm.com>
 <20261013124400.GI14213@ziepe.ca>
 <as5ERENDfgC6FB0b@shlinux89>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <as5ERENDfgC6FB0b@shlinux89>

On Tue, Oct 13, 2026 at 10:46:28PM +0800, Peng Fan wrote:
> Hi Nicolin, Robin, Jason
> 
> On Tue, Oct 13, 2026 at 09:44:00AM -0300, Jason Gunthorpe wrote:
> >On Tue, Oct 13, 2026 at 12:22:06PM +0100, Robin Murphy wrote:
> >> If we're not going to support PASID for shared streams (which I suggest we
> >> don't...) than we shouldn't strictly need to worry about CD tables anyway.
> >> So rather than having to special-case CD table sharing for shared streams,
> >> perhaps it might make sense to generalise back to a "default" per-domain CD
> >> for non-PASID use, which can then get switched for the private per-stream
> >> cd_table if and when a device does enable PASID?
> >
> >If we have stared STEs then the group becomes the per-STE data
> >structure not the master.. We don't have any way right now to do that,
> >but it would make some sense for the group to store the shared CD
> 
> Thanks for the detailed feedback, reply you all here.
> 
> For the CD table question: since shared-SID masters are in the same
> group and always use the same domain, the CD content is identical.
> With skip_shared_ste(), only stream->master's STE (and thus its
> cd_table) is active in hardware.  The other masters' cd_tables are
> allocated but never referenced by the STE.
> 
> I see two options:
> 
> A) Keep skip_shared_ste() and add arm_smmu_cd_owner() to redirect
>    all cd_table operations to stream->master. This is a minimal
>    change that works for our use case (platform devices, no PASID,
>    no domain switching).
> 
> B) Drop skip_shared_ste() entirely and share the CD table at the
>    group or domain level. This is cleaner but a larger change.
> 
> I'm leaning towards (A) for now to keep the series focused on the
> simple shared-SID case.  Would that be acceptable, or do you prefer
> we go with (B) from the start?

I think the skip is in the wrong place perhaps?

The group is always guarenteed to have all the masters in it.

So we could split them into primary masters and secondary ones. The
secondary ones are all the devices thare share SIDs with the primary.

The group list is guarenteed to have all masters in it, so we can
simply fully skip attach from the secondary. It is guarenteed by the
group that a primary will have already attached to the STE with
exactly the same domain so the secondary just needs to do NOP.

If you do that then all these questions go away since there is only
ever one thing writing the STE, it is always stable and no issue.

This does leave a problem for master remove to switch the STE to one
of the secondaries, but that sounds like it could be managed through
the release domain mechanism, just nominate a secondary to be primary
and execute an attach on it in the normal way. The hitless STE
mechanism will make it work safely.

Jason
