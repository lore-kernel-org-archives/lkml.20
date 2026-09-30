Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54FFB403B1E
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 19:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790798242; cv=none; b=hPLy6vGUDv/8Z6yluDi2ho4fEMP89V0Cqd78TssjkMGMzVeidhLuEiXWTuRGMduq3RVW+6uXhckIcwxirh9OjkVaxhSfSfqz69ILTc/hLLJE72xGb+5kTvtEM1hKzY+XFWW/jhJ3BBH9/jtODucO/3Eu1NF//l1Uino1tSsGXUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790798242; c=relaxed/simple;
	bh=9TZtF4f7bLDr7C03aF5gVG6cbsSVdEXlq+L5u/iiSUY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=flhB3n4LY+gfQ6PGMn8qclK7HW+M1YDMuAJ79XQPmgeggOMrktEmVgKV7OFtzSznJgySJ/OG3jG6iukTf3LHzoZH7sbQmuWvUL0VLvRceBekQEv5h/m3RJg4EQSMpm6aW7rENNHJPiyMc+v0k7dDaESvSfZR+VmhvCRzau+1Plo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oCJvR5bb; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oCJvR5bb"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2db33db4de9so4525ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 12:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790798241; x=1791403041; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JZWZuvgsWyt2x87h19X7B7J9Ed8aIg0FhoKfAr4PEqA=;
        b=oCJvR5bbA4RkYvrGqqmVnDGwG9CcZbFL7IBDL5oRQIx7srqJYElTPwBnLqU9KS+s7a
         0sNjVYNmysQqfJFlNlhg5IYb9RG+TT75yrrKetwpI1sewNUs0Eggyg+v/0sYQ8C9gVNk
         FntDN7VOPD9DPk0mUHqWx4TZXLFC7enrrrZZ1Zrxn4cv7WqxrIC3bq4BDLqLh+gGHSIF
         coYQZduITLhx3tNrd2Xh5jxs5/zeqq0GE4nR+6Q4pst89D9Rj512m80l5RKn/N+6y0zf
         ECWh/w61IMpdpBGYxBLpDRXG2tvNxPz2b/6Fk9rHQlQRPjOzBvNmtqyw/cevSvAnfqlq
         9I9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790798241; x=1791403041;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JZWZuvgsWyt2x87h19X7B7J9Ed8aIg0FhoKfAr4PEqA=;
        b=WCemuo3wiV9P1sDbgIlneMiWE9pOovrjrgGhyZkMcWr63LfUEmnp/S3k0opv4dOKu8
         Nu8VIl+r1rqBpRDzA68Gt5PwNsznkSI1sWZEW776MVr7e79cFySkfa/FrOjAIzxxaPEG
         ROibRWdQlgsEpcsFpvRzkw03sDREF9GQCZEWqSr2G9XV2/AIrwWRDo10w+inQaZQV612
         GgPAyCU674AHX9Q8avBkVGjImrzHREf3Tpvdg4WQLIhzvuy03HTiX88QsmIPf04u1niP
         ysZCN9jcs28bp9FPt6N70H95trTc9DhCAPfrwvc6v6NTmzpFHa6ceidQ9H/0mvCn9xeR
         EkQg==
X-Forwarded-Encrypted: i=1; AKwUvByjUut7sVB7XP8zBXB5zm3A4bGL6h5ZoanGxpTU5rLp03kJE6uCW2WGwqAe0kaZYfF8IBPGCGyaKtUouZE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLey0Vk3SLBXo3R44FlNmqTF01uvzehRLN1EDT2E4VJgFwnH1nU
	ZXGC0TlwsM56N/RhMwC7y637Tfbe/+esOsFLtr7SvFa2zotlLkOgXmZMB4zyafKThg==
X-Gm-Gg: AYBFou0rt6Y0dlqmwOfuAkcHAysq970v8TF0khUWm8Y7h1zUugP3U2WizVRTRl6CEmN
	0k62DNGaRZ6q9rGQO+2qsSInbT+S7t8TsSVHRMaqiR/pN4GqK7sNSY7kJnPLujnWqr5GmpsIKmf
	G+SBN7waqF/0dINkOvz4a1wfaN1Ct7Jgs373LJN6GssDKrxPNaz7mNxQ/tLGl559q4chzK8+UGG
	kSAmYYhbE8/h/TNObhP7u7LOLIIJv6ZeCnU0pelUWE7mFlYEWa6vhG9NpSNOXwzM+rYlAziiSpV
	tq3JZZzohWL36JCu4VGTGFpGX4OTjmH6x4DEqlIXKXErY6Zsn0TUMDnf5k0vcT0IR14jFd5crIU
	9mqEh2Y/BWGQv9e9qlUFIGnLfizJjjL+HlTT43s3WTfJVRliekrfzT/w4HvZN/EEnsh+vpZ6MGK
	jfptV7X9DrcBXAXd09Jh+O9zykxmokeeOqhPSjc5Ca9pIOhAv8tODepUmILdSz/vmf0Kr2s2OQg
	KW1q2qVa/otgJ/aRNDnV1rkPbiQ95ZlO8dx
X-Received: by 2002:a17:902:c946:b0:2bd:3bfd:74f1 with SMTP id d9443c01a7336-2e3015b273amr1215915ad.2.1790798240054;
        Wed, 30 Sep 2026 12:57:20 -0700 (PDT)
Received: from google.com (105.211.142.34.bc.googleusercontent.com. [34.142.211.105])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f475f4aasm742177a91.12.2026.09.30.12.57.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 12:57:19 -0700 (PDT)
Date: Wed, 30 Sep 2026 19:57:12 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: iommu@lists.linux.dev, Will Deacon <will@kernel.org>,
	Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>,
	Daniel Mentz <danielmentz@google.com>,
	Ashish Mhetre <amhetre@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
	Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rafael@kernel.org,
	Danilo Krummrich <dakr@kernel.org>, driver-core@lists.linux.dev
Subject: Re: [PATCH v11 12/16] iommu/tegra241-cmdqv: Add a helper to quiesce
 VCMDQs
Message-ID: <ar1pmNRMKDDJCIkz@google.com>
References: <20260929034510.2023173-1-praan@google.com>
 <20260929034510.2023173-13-praan@google.com>
 <ar1cxFvuzIc2dpmi@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ar1cxFvuzIc2dpmi@nvidia.com>

On Wed, Sep 30, 2026 at 12:02:28PM -0700, Nicolin Chen wrote:
> On Tue, Sep 29, 2026 at 03:45:06AM +0000, Pranjal Shrivastava wrote:
> > The tegra241-cmdqv driver supports vCMDQs which need to be quiesced using
> > the STOP_FLAG. The current driver implementation only uses VINTF0 for
> > vCMDQs owned by the kernel which need to be stopped. Add a helper that
> > sets the CMDQ_PROD_STOP_FLAG on these vCMDQs.
> > 
> > Consolidate this logic by renaming the implementation hook to
> > quiesce_and_drain_queues and ensuring that the tegra241-cmdqv driver
> > gates all active local virtual queues before starting the drain loop.
> > Additionally, clear the STOP_FLAG in tegra241_vcmdq_hw_init() as a part
> > of tegra241_cmdqv_hw_reset().
> 
> This whole suspend routine is missing the CMDQV flags.
> 
> vintf->enabled and vcmdq->enabled must be cleared when the system
> does suspend, via tegra241_vintf_hw_deinit(vintf0).
> 
> So, instead of quiesce_and_drain_queues, perhaps we need a suspend
> callback that:
>  - set stop flags to all lvcmdqs
>  - wait for all lvcmdqs being drained
>  - hw_deinit vintf0 and its lvcmdqs
> 

Interesting. I had thought about that but Ashish was able to test a
previous series (which def didn't de-init vintf0 & lvcmdqs in it) so I
dropped that thought..

Looking at it again though, leaving the enabled flags stale is actually
worse than I thought.. on resume, the CFGI_ALL / TLBI_*_ALL issued by
arm_smmu_device_reset() go through get_secondary_cmdq(), which still
sees vintf0 & its lvcmdqs as enabled and hands back an lvcmdq with the
STOP_FLAG still set.. so those invalidations get silently elided until
impl->device_reset re-inits vintf0 (after SMMUEN=1). Thanks for catching
this!

I'm planning to add an impl->suspend op now.. that will cover this, and
also the late breaking IRQ changes you're referring to in the other
thread. Roughly:
 - set STOP_FLAG on all lvcmdqs
 - wait for owners & drain all lvcmdqs
 - handle any pending CMDQV errors
 - tegra241_vintf_hw_deinit(vintf0)

I'll call it from arm_smmu_runtime_suspend() before gating the main
CMDQ, so the CMD_SYNC in tegra241_vcmdq_hw_flush_timeout() still goes
through and any late cmd simply falls back to smmu->cmdq.

(Will drop the extra line removal as well).

Thanks,
Praan
