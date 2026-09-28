Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 981984D17AC
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 23:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790636919; cv=none; b=bA2xE7CxqA7PNr14wEvBcXq2eRSJD3aJQzDXixEMRdcvLp6SFFB4CxLIkLj88qU9xSiAHyEO4rTQGbl+FJjPi/l4lgD+yIWkyha3/9G0nQ0CK2pFBjfyPZw7JwnOTxoA+jAgOTkyFZ5ZDcdRn8/1yic59kM1mHilj08l1pwB0t0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790636919; c=relaxed/simple;
	bh=0nWeG7gLZ/H7cWQa/8TVyUSe9M/rW/4Yls/RoHMrSnU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PfXNoEUh4MIIqE5v9qAAVZNeCEtx0hk2QHQnDhqfoRVd84k0nw/sVlZZ+Ht+Z4rybACNfqwdwNbHNl9VhDmmtYaEU0FSy+Q11F9RM4a3V4Y0BLP/lojZuevfyLuq6ZXUAMn4IrNN8bAzv6e7of1WG/fSUHhD/ggp+eeu/W4ZCA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=mssMXxRS; arc=none smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="mssMXxRS"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-3468ec309afso1216232eec.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 16:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1790636916; x=1791241716; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=77Ly/kE6ea0uAMR6LixnKC4rocy66Cjich0gHdqD2Co=;
        b=mssMXxRS7EPxpqbhMPQMtvz6oR0LoKfQKm4ujbPbkyyvKa3HupArx8WgUVrNWgTuIl
         MIehwsc0OplYd8FfKJUHAfjv9t8vhQeESvZ20HCifMlGRk4fmDESwkX4D2m3B/NgphFj
         z9DQP1YBoMIvegYNc3c8DXkpEmume9+XFSKLWBfRKFvHhqiOubL3nrOeXJnTCY/1SUgm
         hErdDW7QPl42M3IESDLVxebkmRMG1MOuqx3rnMT39d/K/2xK+DnWr6lwDd1OT1WW4o9X
         61X0vucuQBzsLod31pyF9oM1aU0YbHjwsiqbQWNH0vBV7oGT3Ta2czrlv4lARhFbQTyf
         rckQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790636916; x=1791241716;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=77Ly/kE6ea0uAMR6LixnKC4rocy66Cjich0gHdqD2Co=;
        b=fjzHnsTAEaxmEODbEUzvMiYVbpQh1tnYEBjC2ErifT7Z5G2AdTsTSWqn1kss42l7HL
         5JgV/9PB36nnWauuEi1W9+TQpRaOpRa2WETpz/GAaXKadaqnI5m7SKg91qLu5nwe4fp2
         vuqI1+djAGFR1kulmniBhuE3H2Bu3+YVo/kRUwZZd5kjoJ6Xp6g9PkJ5r+CMDXmB8m7n
         oWX7Ly3tdX0JvrwnzoV2juL/4syW0BHXSfK+fX2/b4gChP+gWOBOBLNGu2kstHSgEkq8
         vHGJ7wwH2c5GkJc6ZRIYM77a+0d4mrYIyvDRcUxzobKk7zul83Gvo+IdO2wulVsfFkAY
         8aHg==
X-Forwarded-Encrypted: i=1; AKwUvBzm3RNqOErxanmOri8GttbxDXXIbn/6atLZMl5/Mx9igJ9vtpwWU0s1lZfcNz00Z4tpFkSoErcxVoASLxo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJcrigHCnvXL8TH511w4oVapjAevIWzlTgGxUBiUiaaUb2G3IDi
	5yjpROOOyXi+vlhRAy886BBHCehgEDjaOtXE5CwuQcte/DaXVKglDHZG293Y8oL6st4=
X-Gm-Gg: AYBFou1Z/CNukCnbLohak6pX+TggtNGRTJWuQa/cdAHUCFlyaUShlQOxfl7Nsu6lP5G
	p83KxiFyLfpm5J2NGDbE0I2bsLgC19d78YSJ71kG64OEA2j8/vpjP8C0Tau1l7MJ7iWdrubug3W
	f1uaqaA0Ld2qJLcMMzA+OGjMR++/nQt94a9qbZKD4Hge9DLUEJHxurUHB6YaOx3cZpyNDux4W7w
	LqKn2xZDVTVTxbrK6xl4jUYJQmXakiiwVwHXUWU2K7/riEsxgd5JlZjAj64lCofCnTmtW1DCTUI
	dkdEXCkqOx0ktMfKldS5XOdq4hcIfm695Gvvd+8RhkwzUd1qz7EgiNbK7n+uD4I+xR1VRuya6mK
	NzWCGA4WOFDpKpF5JMZfKfRRZkgCeTYelSp/mgy8w1sOPpFgwL30v/AimLMyPUOulkjIpO1FE52
	E0SQfaXXEpcCrUBLPNPCWntJ78wqILiUQbXMu8Emg8Axd0
X-Received: by 2002:a05:7300:d58d:b0:34b:354b:79b9 with SMTP id 5a478bee46e88-34b355ad91amr317545eec.12.1790636916413;
        Mon, 28 Sep 2026 16:08:36 -0700 (PDT)
Received: from ziepe.ca ([130.41.10.202])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-347328dd123sm9211297eec.13.2026.09.28.16.08.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 16:08:35 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xBKSY-00000007uAr-1P1O;
	Mon, 28 Sep 2026 20:08:34 -0300
Date: Mon, 28 Sep 2026 20:08:34 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Sonang Patel <sonangp@nvidia.com>
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	linux-coco@lists.linux.dev, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	Alexey Kardashevskiy <aik@amd.com>,
	Bjorn Helgaas <helgaas@kernel.org>, Joerg Roedel <joro@8bytes.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Kevin Tian <kevin.tian@intel.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Samuel Ortiz <sameo@rivosinc.com>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Will Deacon <will@kernel.org>, Xu Yilun <yilun.xu@linux.intel.com>,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [RFC PATCH v6 11/11] PCI/TSM: Add reference-counted contexts for
 vdevice providers
Message-ID: <20260928230834.GL163130@ziepe.ca>
References: <20260917140159.1163281-1-aneesh.kumar@kernel.org>
 <20260917140159.1163281-12-aneesh.kumar@kernel.org>
 <arq2Ql3-q9EApe3X@sonangrm.nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arq2Ql3-q9EApe3X@sonangrm.nvidia.com>

On Tue, Sep 29, 2026 at 12:17:30AM +0530, Sonang Patel wrote:
> On Thu, 17 Sep 2026 19:31:59 +0530, Aneesh Kumar K.V (Arm) wrote:
> > +		if (is_pci_tsm_pf0(pdev)) {
> > +			if (pci_tsm_disconnect(pdev))
> > +				pci_warn(pdev, "TSM connection is still in use\n");
> > +		} else {
> > +			tsm_remove(pdev->tsm);
> > +		}
> 
> What happens if the PCI device is removed (e.g. sysfs remove, surprise
> hot-unplug) while the vDEVICE/TDI still exists?
> Since removal cannot be refused, should the remove path still force
> the unbind/unlock?

vfio prevents that. It currently will block the sysfs remove until
vfio is closed.

If we ever decide to fix that then vfio would have to tear down the
iommufd vdevice before allowing itself to be destroyed.

We don't need any lifetime nonsense once we are inside an iommufd
context, its existing locking scheme is very strong already. tsm
should not be allowed to change while a driver is bound, and basically
I shouldn't see any refcounting or locking in any of these paths
stemming from a bound driver context in iommufd.

Jason
