Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECBC753ECEA
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 12:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788871367; cv=none; b=pf2Nww+XxWbRkTrSUvgIs/EAuQxeIDlofvHGflcu2pCZSmZBc8p4pzy3mCySCxqPWtoUkfNAGIdJVE2+Cr+posv9KnuVFJDpUykMjS/GfVlQvSE0WeezLr6v0EPsbX7eLgpSFWT/qBQrkhvLvEKgwBDt8Fxl0DXNewlCJqgQLV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788871367; c=relaxed/simple;
	bh=js9UEC/Am5qL7fXzeGsFiojuhESRYv+hLExCRcXvxRI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NINxU+LqA/eEb5BPXMEdUfvh5X6hUSQdBtNiN1Nd33Wcx1qzWpYNolrswuf8OYzoFx2i04zb98kshWIdzKW/uj8GLRZk+R0gie7Lb0pO3zoDf8VAPZ/H4LRNTjt245Je6p3n+eLVRfef+ALuW5FFzzBJwae/51EFPi10YOrLkKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=hJ2EoNRf; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="hJ2EoNRf"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-930c0f9c1b1so437273585a.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 05:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1788871365; x=1789476165; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KO3kIc1VAMjPhAEaclJXkC8aa4/+237lrdumobzVsjA=;
        b=hJ2EoNRfmTkVtlZq7HJV/K8eD7fiW9YN2xXd98uh4BCFDOqcnGcj44gt+PKYFfeVkv
         zJh1g0EPux6Lnvw8zg6HMgr3PPoG2xViPLPrh3nYEUDcCTFRLlqDuAgKQF5ZNwp5+Sz8
         dGLarxKKgv/pF1lvfoOJZkkNPX+reTQuHu6HC6255vOC7lr0YY+cSngGMaJ1cUhVdE5y
         t+8iY2pI4gBxr2VNwTCBGguDj23drSfGjkifM/hWiJ7SIju6TTyfAj2aJafAiLxJmc2S
         ZpasSDQzO+0N33YPfqIYOFn1OSIXC0rbGKqI85RM7Ms1oP3R4ME0QWf4m/G5+nWpP+Q1
         p1oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788871365; x=1789476165;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KO3kIc1VAMjPhAEaclJXkC8aa4/+237lrdumobzVsjA=;
        b=iaX82iF3z93ipZoDnCChuK/P7N4b3bxZJ8Dkn3Kwmk8Eiwh1yUbHaWqMmEuvZlA+aJ
         6QmxzgWD+oZyolCCOMDSktvNu0iO2d2vVL/nmm1tWa3IPvDkXKjWRsngcykxgzoMamok
         CX1+ZV/sz06YaQNfH1OI+Z7RRWmSz+LDLJB5fLAqTu6BQHyd7cMpb5Sukyf9AZGwN463
         izabXE85LIhYm3uvSU0kuM48hsBFayzDVKXujizDgWppihWROjBoergeeaSANm99O+tQ
         A3g6dgtxE9R+wLEq1tKhRo2NNndkweTKQBkfyVUMhQm1Xmc2/PXYtGUDwjaH2sY61oFJ
         Cabg==
X-Gm-Message-State: AFuF++lisD0cc+1pzuz2hYmCOiIuaJc89hdCCtEAKzfMz0jP0/Ej7ZBk
	Doq4Gur7h/f9RayFllFCfnCrXs3odO2M7eU7D0f+obrK7tNNhRMKH94mbegiJaG3S6w=
X-Gm-Gg: AYBFou2nBakcLbVac/Ag0jLMArOcTKBBG2WSvIlkKujVIyrXXPCEB2F6DvcB5dE9IYa
	CxSOJyVtthJnR5IsLsNRpitColreIlRpUc1sE0xYKEbPgjaKFzt5ViCGk6xKfC0rHnLe1ucwQ0C
	2CbuGPRy+leU6/hFDEjPsXHFTVkO9Wgm5kBaEQLjzwcYtC+uh92iwe/rU57XXScvd5jpEyD0vbs
	/Wo0rb2XZ8Fbw/9Xgv8m4riNracHd5a1cZs4xjiDJBg6slvOg0QKWNczoRiP4d1T8bX2mPUm03W
	pudSVlBUaD6kdxOwN+kWah4ADqkguRJ/TP2sgqziTwHGkOcxWr51WONLo9tqpphKJOfm4hqrYng
	9HPVNs6ZDpPbXd46ak2WKkA3qH5Pw00IWFNEDLXsP+JcCMQmhRdLosOx384rBeBuB3nTaAVfdbw
	mpMiEDvDW0PBNUJ1zmXIwvKufKK8XnmZSZXo4JhMjtyM2aq/YlyR1MCCenZ6ztUcga4UhudbNLy
	vkARDXiM0+AHwwxeEL0Lj96IBQl3A99DCVwW64VvKY/GQ==
X-Received: by 2002:a05:620a:a108:b0:91c:c20b:a135 with SMTP id af79cd13be357-939804af44amr2957913285a.40.1788871364777;
        Tue, 08 Sep 2026 05:42:44 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-910406b0f51sm115856516d6.42.2026.09.08.05.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 05:42:44 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x3v9v-0000000Dgue-1sWF;
	Tue, 08 Sep 2026 09:42:43 -0300
Date: Tue, 8 Sep 2026 09:42:43 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, jpb@kernel.org,
	will@kernel.org, robin.murphy@arm.com, joro@8bytes.org,
	nicolinc@nvidia.com, praan@google.com
Subject: Re: [PATCH] iommu/arm-smmu-v3-sva: Relax ASID requirements
Message-ID: <20260908124243.GB2543240@ziepe.ca>
References: <20260907154928.4012151-1-smostafa@google.com>
 <20260907184513.GA2543240@ziepe.ca>
 <ap_JokRTsUHtF4dN@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ap_JokRTsUHtF4dN@google.com>

On Tue, Sep 08, 2026 at 08:38:58AM +0000, Mostafa Saleh wrote:
> On Mon, Sep 07, 2026 at 03:45:13PM -0300, Jason Gunthorpe wrote:
> > On Mon, Sep 07, 2026 at 03:49:28PM +0000, Mostafa Saleh wrote:
> > > arm_smmu_sva_supported() have some residual checks for ASID from the
> > > original commit d744f9e6c222 ("iommu/arm-smmu-v3: Check for SVA features")
> > > 
> > > As DVM was used for TLB invalidation and the ASID of the domain was shared
> > > with the CPU process.
> > > 
> > > However, the commit
> > > d38c28dbefee ("iommu/arm-smmu-v3: Put the SVA mmu notifier in the smmu_domain")
> > > removed that support.
> > > 
> > > So matching the SMMU ASID space to the CPU is unnecessary and can be
> > > relaxed.
> > > 
> > > Remove the CPU ASID related code, and update the print for the SMMUv3.
> > 
> > It is OK, but maybe this could also be but under an if
> > ARM_SMMU_FEAT_BTM?  That is never enabled and is a placeholder to for
> > eventual BTM support.
> 
> Yes, otherwise SMMUs with BTM would regress in the future.
> But I’d assume non-BTM SMMUs will still be supported; falling back
> to SW invalidation?

Yeah, there is no idea to make BTM mandatory, just some people who
built BTM into their HW would like to use it because it maybe performs
better.

So the thought was if the HW supports it then Linux would turn it on
automatically for SVA.

I think we can land "vBTM" support upstream which does not require
solving the ASID problem since in a VM there would be no S2 at all.

The main issue was renumbering the ASIDs of already active
domains. Prior to the invs list this could not be done correctly
without races. Now that we can invalidate the same domain multiple
times in the invs list it can be done race free.

But, I don't have any BTM HW.

Jason
