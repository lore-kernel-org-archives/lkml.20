Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 949075867CC
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 16:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788886072; cv=none; b=erE4ln4wc/fz4+Ijw0hwrHcigAHJ4N0W+2083lXp4JERPDjOwZu9/6ecoP9fIQVhUt/dkLaoIR1laK0bQefhT3xGGTfbYHKapPIMJNDUf78MXSUZohGOgx42TYB1YBBRGSpdKlfwkZXzPT8PhVBiIgqn04fJIu/AyLR6e98au5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788886072; c=relaxed/simple;
	bh=LWKICpFS9xFvsp69obCht2UQnb78KG0Es2im+ByJTVk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q5q/0hNzNpFKeB6bKHUOgi4APxKSmLG0136z/ZpxNapw8N0UkW4afF6VYRWTkEYAf7cdfZjh7bEMxJI5w7KqmgdUksK2hAHFMgA7VqJMQ70HeUo2ltjsZzbZV4Qfu13a3/Dydb88JHhHJRxUOa1hGT5BpoWEVGlxd2LRoOvnsM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=SNm4GE/Y; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="SNm4GE/Y"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-52fa6005224so42227151cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 09:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1788886069; x=1789490869; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wg7dqcSt6yfLp94UU5Cr+hhthqJWmJ7c1cnnv4D4Hxg=;
        b=SNm4GE/YnvlitvWOHTBTRTz9EKkbY2fdImMKVkhEHxtYbjQ2tBSfrfTln0IW+Dh6oU
         a/JzOiSjBYakNZW5G0tzppZ5MZ1z4F/euoKv9YvqPCMdkLeMw3iou/sONkP2IVcRwP2d
         /ZgoWcb/MxeJoSiz4MXbEDU91xqUVcgg+WWc6iJgVQb/gpqbdoNtT4BxC9Hmwm5PeWTt
         3UDwcpsAxLEOvz6486OAnkOae8p+uSo2S23nnO764QO4cvs2Baqt+V8la7J6td2Z1rRa
         gh/85+jmQ1bOvjNzlYgjn71xMUftwpoxrbkk4RUSzNINERpqcr9EeIgqEG/mwMHHu2ET
         ipfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788886069; x=1789490869;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wg7dqcSt6yfLp94UU5Cr+hhthqJWmJ7c1cnnv4D4Hxg=;
        b=szwMEBbu1RAH4sDu6UvITPMqAmskS0zBN0Qnhlr6PIaoiCjj3uvRkctCM1aNo01t5F
         Bju3IaEa6JbOrW295Gy8YNFgHNCKaxf1DoPbSsSmlXEKJny1mOGGI2T/Eyb8I1j4ZQ+8
         Fv7SjUdDeGpcSKHNJaP+EQXTlfM79u5h80emUaW2vXqZ04iqNkA2rRV7NJqSeJor/BHr
         /MJ42RQuaawraZMGOB1DVz29g8CZv8irTB5b4RRzEzFjugtvFf8CXHTovBCkqz+J08Qz
         Qt8fbYBBPnHL815GUsVlRrPRpWuGEIUTLlZfnLcdqNQZLoQZpuVvELRhiTTvp/u0qs6t
         r7KA==
X-Forwarded-Encrypted: i=1; AKwUvBzvVX/p2lnvOVvBeQdx06bEdJ7NSX5SIcnPd5YndDpUGnTgHYGVlOb28e5OP8sttuF2Kjrz7ygzbJt4sPw=@vger.kernel.org
X-Gm-Message-State: AFuF++nLsU+bdickokRol2aZpBKpy8lgrXB0DibsRIXBRLUCcmcX+7Ov
	MdIymUliO5H95nv9g3ZxqlAsBpi4D5xoFMczbIj5BcBy7H62vH0Ra1+TQ9F9Q6iOyY8=
X-Gm-Gg: AYBFou0UcyMsm+ziXEp4E2m7AaZrKrWHpeJ/2BW05r01ZXSwmH9y83hH6nrZGADuBzT
	U4/QJ/isxru2arJ8x8PvrKiFhOwsAm2IqBC9zlc1Idy3oDpdY1yBhGJmcmlS2+rqlYTORSYvRCm
	A2el5pwvyQwaSx9ABFIHaWQss7xqvFs7RXwIf3FZICQE52VXwNFd0XPXnhM7qYo+HkwEKdeoa3a
	/UIsY5X30NS1i2JP1jkgbogsaqkVAqaJXiRnHVDFKTeW6LlRdxN0vMEj5MFdxU2HOgyLo736EvJ
	ozyqK4gLkYyq384rI/jiF/9KFifrs0AX2hPTJJtcs5Wlj5TZMIvc7QcAFAbdcbLBWOM7xz6t12P
	nrPKMwSeY9EOtVfzoFcC/j7q+TDw4yeAEBfnHoLnfg1ayKDz185ohk7yW0ydDp1QuQ+JtJzegc+
	qFPWcRsLPUEqMGvU7/ieLfHHLdlyClleKHlqmv9lHPsdhwmjSFXIOGNcumT7TFYMfVjgNqkH55w
	srkbBJUd56yMksi6EJA8Ad8QmGcokPCaNWs0JLh04gAfw==
X-Received: by 2002:a05:622a:258a:b0:530:430f:630a with SMTP id d75a77b69052e-53054a1f457mr350385211cf.48.1788886069109;
        Tue, 08 Sep 2026 09:47:49 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5305402a908sm117296241cf.4.2026.09.08.09.47.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 09:47:47 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x3yz5-0000000ECD9-00Dk;
	Tue, 08 Sep 2026 13:47:47 -0300
Date: Tue, 8 Sep 2026 13:47:46 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Mentz <danielmentz@google.com>
Cc: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>,
	Prakash Gupta <prakash.gupta@oss.qualcomm.com>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] iommu/io-pgtable-arm: Add support for contiguous hint
 bit
Message-ID: <20260908164746.GC2543240@ziepe.ca>
References: <20260804-iommu_contig_hint-v4-1-d7a47ed5db98@oss.qualcomm.com>
 <CAE2F3rBQQEHsksOyE2ojQPbMd_vvFqaFMC2RzT0B6KkxMB5YgQ@mail.gmail.com>
 <c84e61b1-785e-4a47-9082-c5111bf35fd4@oss.qualcomm.com>
 <CAE2F3rC80=ZpiHVtmRDU6f8g4AwV_RrJ-Zqr0Xi7zbUc0fsQog@mail.gmail.com>
 <9c28300b-a17f-4324-b9d5-8fc800e4d794@oss.qualcomm.com>
 <CAE2F3rDdogf1jGsD2ekGqT7X692fFyqv=H-8iM5OTu8AdHHoJg@mail.gmail.com>
 <CAE2F3rAeq_CPeaDxuh40v41v2f=68oD2TqK9DYSPKz9F74kqeg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAE2F3rAeq_CPeaDxuh40v41v2f=68oD2TqK9DYSPKz9F74kqeg@mail.gmail.com>

On Tue, Sep 08, 2026 at 09:36:35AM -0700, Daniel Mentz wrote:
> > > That said, install_leaf() is shared by other callers that reach it through
> > > ops->map_pages() directly, without going through iommu_pgsize(). panthor_vm_map_pages()
> > > (drivers/gpu/drm/panthor/panthor_mmu.c) is one -- it allocates its io_pgtable_ops via
> > > alloc_io_pgtable_ops(ARM_64_LPAE_S1, ...), same as any other LPAE consumer, but does its
> > > own chunking with a local get_pgsize() that only ever returns SZ_4K or SZ_2M, with no
> > > notion of the 64K/32M CONT boundaries. That can hand install_leaf() exactly the mixed
> > > iova=paddr=0x1000, pgcount=34 shape in a single call (panfrost's map loop uses the same
> > > get_pgsize() and hits the same case). So the prefix/aligned-group/suffix handling in
> > > install_leaf() is still needed for that path.
> >
> > Maybe other people can chime in here, but I feel, from an API
> > perspective, we should have only one way to make of use iopgtable. I
> > think we should just mandate that users honor the updated value for
> > pgtbl_cfg.pgsize_bitmap (and pgtbl_cfg.ias) after the
> > alloc_io_pgtable_ops() call and then choose page sizes appropriately.
> > Otherwise, we end up with two pieces of code in the kernel solving the
> > same problem. panthor_mmu won't be able to take advantage of the
> > contiguous bit until it gets updated accordingly, and that's ok.
> 
> On this note, I want to point out that I tried something similar in
> 2025 (see https://lore.kernel.org/linux-iommu/20250430231924.1481493-1-danielmentz@google.com/).
> The feedback I received from Jason at the time was:
> 
> "Wouldn't it be better to use the pgsize_bitmap and rely on the core
> code to indicate that a contiguous page size is being used, so it can
> trivially set the PTE bit without doing all this extra work?"

Still think this is right, Panthor is not using it well if it doesn't
jump through all the hoops. Probably there should be an general entry
point for map/unmap that does the right stuff for the DRM drivers to
call.

Jason
