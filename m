Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 039363E8C70
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 08:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792397194; cv=none; b=FdEIp08CgaMHQXsVjkl1KiQ+AuaO2DebjEHbzskJNrRkKp8YBt26fgURQTrUgmoxQwLMHgcQh9I7z463TLcN2eGQyXSqfw5Hv/U9NFTm68APN9PiAr41XNZHJzipHAYJxCb3mZT+DEnQp+vXCr960BwslVw78DTd3weVRY+BytU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792397194; c=relaxed/simple;
	bh=FY0qcanD1yswML7l/dRsnVFaY2lJmQx9u8YM3zGuotM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UIq89lQ3BfNiyFzYtfZwvvG++RegdV7qqP9e70T4TpWUuwKRu2/cz3xVLTC9VuXfUsp0oKDNHYWfFSp4quZoq05BANIfB+N4VC0/+1e62wsXnOva+RdwaraMPOjd/PM75qfz7WlejWbtl8Ofw+973nhIILKVr4BCAg1d6/SQxnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=c8fWEbwz; arc=none smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="c8fWEbwz"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-169be2dfbacso6611c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 01:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792397192; x=1793001992; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zKlllSkaDqzD1U/0lTr5RBP4KobTu9kcdCFVa+N+5rc=;
        b=c8fWEbwzCRQB00rQILKwPKPJKuV/JB8Z1yNEf7xZLjXdw4Qc9JZY0InayBST807xyI
         aCDKFyinjdNVfraJ5AFygI5NpPrD2+/RIo6ZTsZ9sc/RKu/rBKbvN954KogShKVbvC54
         h4uRFIqUqnqYiqtLezZ6DA7AH/e8Hf1wnLGfSCNV8pHYbBTTAutOoCHDCAPXkwl6Gv7o
         +Logu2Frqgz1O87B4EUXC+pni4yz8t4jA+HCiEgCGPiERjzBctWkYRiWfKmndlRHadxa
         xXs0l+LV0UcBZvzOIYR2B+/ew0dRhW3eHDIU4L4boAWCoqU1clheo8YW8EfCP09Hs8Ce
         k7zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792397192; x=1793001992;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zKlllSkaDqzD1U/0lTr5RBP4KobTu9kcdCFVa+N+5rc=;
        b=WxPwuBeH9rb53HBliBENaegvpyAHVPCPX1Erwyg+ZEVIUQmbIsiLJqwFtffGFs3dVS
         NgfDMqK9ulPny+pZSPjykfMvRusGvlFp1mtP2hPHHl/qUQXByuy/Xf+15FnFkur97GpG
         lSiYTqzdTGxXlYpiydZ6W8iq8l/Na93p1rvMx0jMCQg3SB+hDi5Ct+4hA+KMajHbLiUe
         fo5zPz2bmNXBUy+IZuYPQxETLFeELOB2c7y4BhjjfVrVPoIv31j3VqC4rAt3hjH5oy63
         FNrr2tbGMEJqpx1VJ3AOezR7TwQoXbK6Arv1Hqqd9wWySlG+W6KBid1OBfjhqA1R6FTO
         cnDA==
X-Forwarded-Encrypted: i=1; AKwUvBzCMJgBeH6TDLwxYYW/PysmiWNFOtXnjdbt8HQ8Um8GFHIgrqKbbeHUfnCD/R70JG5670Z45D+z/xyRVtE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIBKkIdQN5xkVBybEF4dXODeqn6K4pm+p1Oz+Ocmznx5JC0n912
	JH/VNOwECcrLPp5oIis8kSHXYfR4sM4e2D12IDaUCo2EoLWglh/bCntUBH1OPziiVg==
X-Gm-Gg: AYBFou2KUOVbQ7UBLl6NeFu4JGZsYKswRtRiu0yrk5E/nbQMyrbT/FzvfmDMISL6Q/t
	KVynOm0FRdZ+69g8UT+aCc3q/AyCsnx4q6efaoZRRilEt/+8E8yRBG4YtoXu08SWHgOhdBDIn5C
	q6LltpjNnhXT7kT06kKSJcbCCrnbAp/V0MvMANtTdN3Cx/CalRkiVOp3eHXKJQJ98L+IQqg6SZA
	lXMxayqBs4U7hS35xmGvOZwR70qudECwhRYKPMZMjFzhJz1K5k7gjFQBPK1fqFRZu3tLZpL6qDM
	YbNiyLtZRfAp0ZK2USQsx9jSV987JdgDZtVeiy+WTraj953ourdJsghYg/t8M/HQ0/HsvyQ0/9y
	NDCSh577gD1OYsEOySYY1eljnqOE7arLv4IgGtoiK1Y3BdEWpF3nlu7kTL0CsFOaqTOJM8NREq0
	FTWa29W4Q79dgDiZmFYINZKGAfybQuAx/6U1p/jnOzJ2EKWEC2AXlnrBAn6VS+zW+brWkIgBy63
	MJRAtD6O6NdsXgNEzclA/0mFy5ZBdLm+MVcyLa0PI0piL0=
X-Received: by 2002:a05:7023:d0c:b0:184:6afb:b26c with SMTP id a92af1059eb24-185b79b5548mr344812c88.18.1792397184354;
        Mon, 19 Oct 2026 01:06:24 -0700 (PDT)
Received: from google.com (105.211.142.34.bc.googleusercontent.com. [34.142.211.105])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36082e81a06sm28999611eec.26.2026.10.19.01.06.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 01:06:23 -0700 (PDT)
Date: Mon, 19 Oct 2026 08:06:13 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, iommu@lists.linux.dev,
	Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Mostafa Saleh <smostafa@google.com>,
	Daniel Mentz <danielmentz@google.com>,
	Ashish Mhetre <amhetre@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
	Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rafael@kernel.org,
	Danilo Krummrich <dakr@kernel.org>, driver-core@lists.linux.dev
Subject: Re: [PATCH v11 11/16] iommu/arm-smmu-v3: Add CMDQ_PROD_STOP_FLAG to
 gate CMDQ submissions
Message-ID: <atXPdbcX0XADEdh7@google.com>
References: <20260929034510.2023173-1-praan@google.com>
 <20260929034510.2023173-12-praan@google.com>
 <ar1yNtr7Kp2OTcDd@nvidia.com>
 <ar3yWUmi8E0k37Ml@google.com>
 <ar6gY9grmdMZcN/M@nvidia.com>
 <20261002164748.GD3481470@ziepe.ca>
 <asAeCz_rmpe5hbsh@google.com>
 <asUvUf4PZJ7JCLXp@nvidia.com>
 <20261017174912.GK14213@ziepe.ca>
 <atO7jTV+XNReShT+@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atO7jTV+XNReShT+@nvidia.com>

On Sat, Oct 17, 2026 at 11:16:45AM -0700, Nicolin Chen wrote:
> On Sat, Oct 17, 2026 at 02:49:12PM -0300, Jason Gunthorpe wrote:
> > On Tue, Oct 06, 2026 at 10:26:41AM -0700, Nicolin Chen wrote:
> > > > pci_dev_reset_iommu_prepare/done() pair (with slight refactoring) in EP's
> > > > suspend/resume?
> > > 
> > > That sounds right to me, though a different API for suspend/resume
> > > will be required. And call them in pci_pm_runtime_suspend/resume()
> > > maybe.
> > > 
> > > Jason, how do you think about this?
> > 
> > Maybe lets just start by refusing power management when ATS is on? For
> > PCIe devices too?
> > 
> > It isn't just ARM that has this issue, every iommu is busted if you
> > suspend the PCI device while an ATS domain is still active..
> 
> So, should we put that refuse guard in pci_pm_runtime_suspend()?
> 
> I am thinking about splitting the iommu and pci patches out of my
> smmmuv3_atc_timeout series. They could be get merged alone.
> 
> Then, we add a new API for pci_pm_runtime_suspend/resume() with a
> new BLOCKED_SUSPEND reason in the list:

The guard doesn't sound too bad, but what if we refactor the reset APIs
instead and use them from the PCI core to disable ATS + flush the ATC
right before the EP suspends, as discussed earlier? That'd fix it for
every IOMMU without taking PM away from anyone.

FWIW, AFAICT VT-d and AMD-Vi already enable ATS for ATS-capable devices
attached to the default DMA domain, so a blanket refusal might end up
disabling RPM for some internal devices (e.g. dGPUs / NVMe) that rely on
it today.

On the PCI side, I could roughly:

  - Base on Nicolin's split out iommu/pci patches (blocked reason list)
  - Add a suspend flavour of pci_dev_reset_iommu_prepare/done() with a
    BLOCKED_SUSPEND reason, i.e. RID/PASIDs parked on the blocking
    domain, group->domain retained (so dma_map/unmap keep working),
    ATS-capable devices only
  - Call prepare() in pci_pm_runtime_suspend() after the driver's
    callback but before D3, and done() in pci_pm_runtime_resume() after
    D0 + pci_restore_state() but before the driver's callback. Same for
    the system sleep (noirq) paths
  - Keep the guard only as a fallback, i.e. -EBUSY the suspend if
    prepare() fails

That flushes the ATC while the EP can still respond and stops any new
ATC_INVs to it. On the SMMU side, we'd then never see a suspended ATS
master with ATS still enabled, so a WARN_ON_ONCE() at suspend would do.

WDYT?

Thanks,
Praan
