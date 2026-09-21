Received: from mail-vs2-f42.google.com (mail-vs2-f42.google.com [74.125.227.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD44F49E138
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 13:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789997164; cv=none; b=PcCAMrQOsbIuMPssofFVvZx00b9G7L7IJBYpO3UvAf3nyF8Urwz7kFyIUeR7Bqn5ccHJyccaJCUA9lqm1xtUk/wVDNMP0OzM0ju/qiHIkEHFbS9JcrJEONhhG4HGXSWM1zz0lO6MgjiWvo9C8O1TKdsA78u2APEfQS/+q6nsF2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789997164; c=relaxed/simple;
	bh=jI7O6dwFsIzcl16MuxgQK+8Hj3EPC7adm8Q/IYAxJFw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LkSR1HuHgGk17XqvkFKLyc7VWQ8MqEfjImfAIdbVFY+dHWxQzumivx9a5qpZUb1I27TDC4h4DuQXwNcvwPi/fU6Z2oPAd1O/sat1VadROaXElDpU65CtI7qVtAxLdjMtiVo1Qw49aNf5n6uIH3DEMUrAUL3/xcqCtpQV+GRdZco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=Qn8N0JVJ; arc=none smtp.client-ip=74.125.227.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="Qn8N0JVJ"
Received: by mail-vs2-f42.google.com with SMTP id 71dfb90a1353d-5c67e5059f9so1599468e0c.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 06:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1789997160; x=1790601960; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Jdn4c9lGyFJE/+rps4rYYBXSqoAaBa5j8WwP9obCXz4=;
        b=Qn8N0JVJyO5GjQxFLgZn1BQqq+hEFnpT4XTo2OP6jStKvSzF/fmEKMPfM9sMX8+JG+
         3a30NIR53CWkQV3oQlyWGEU8Xgf9IXRNTu27Vix0Sm3zXX6FqQYMeNVQMHEJnCB2Z7z5
         rppPhTnNjirk/bWXGQ5yjO7HqIBbZ65RLmAA/gWHlS3LOBzSPgvhveDnqZZG2XljQMDE
         WUrgH3IuEhYn8NcQP/n15qAYxBvwpCvUnH21hNcXB7QJQhsoFgQC1rOPq68W59e6LvUS
         PccoFlPN6+HD+8fk8JoOpL/YLv1+VO3fqF4wmCirNKyrso1CIamiv0t3XaofZ1M5+VmB
         zVIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789997160; x=1790601960;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jdn4c9lGyFJE/+rps4rYYBXSqoAaBa5j8WwP9obCXz4=;
        b=iaGgF5n+RJub9Y7dmgRJSPJVk9y4CCxhnxS7+bd1KvjVCbq2cyrhrkF8oI9+QEJiVa
         YwTfv6HvztwiXdhK531RoWxp2halretUqMbq64wF62VX4jU5zbXhmtcRqy4+P/xH2+mU
         jJlmVvPHwS4yrts9JYB/wsDp54q5ZJPQc7YGmBrzaQobpQuKvjbg6betamXXLA/oo8jK
         u+BoF3YXePzWG+fQlj98LHErHVMahQlbiw4IPQET3gL/ktPfhcpodVmde9Qatc2dxx+A
         oX/Zkb3Ef2CeFMnNNnLVu/7tmyAMT7du3HE3W5DdTB1drlG75Zsy3I9k0MB4V0JYQNp+
         hS0A==
X-Forwarded-Encrypted: i=1; AKwUvBzDiWoOEaWnktET0z9SUCRkwpIhqAGs5k/J6QkkNADCNrb+cV5bISJ4wtIFroPWG3JvrP4RfoC6FWiLwkA=@vger.kernel.org
X-Gm-Message-State: AFuF++m5xFCH8PljH5/zMpH4G4NmHc45KBLIk3htgV/MFHvXVplpdkK7
	mOPZEbg7NLI6zKU3I2WeFchivGmYeRFI8pmxLFntoQpuLTiYBc44eFMkyN367iF+IsI=
X-Gm-Gg: AYBFou3/x2WApI6n7nMI9kcw0TqZxRAgkmVVO82fZNbVSGoMqPXaPpD5Fq4XK3wdTct
	XVdBYn/kh2UKY0HbncQanCy6fHEIpoWuy4PdkfO+D7vd/toJp/gjLrXgITtqtRfyEBz+5hYJ8EE
	na89vfHqGeKn8745KgWZ7jJP6i8yo5k1XPvR+wm+VRQNLlhL1Gjd3tjXnG7jGNEl6aSDYU2voER
	bD0CjxoWsxfXbDTtyOA2ZRudlEA5Z7fKWf5ZoC9TKxL5UVO2Knr2H7jgY+MtotnLZKlcpQk7XqD
	j4Ci3GsZ6Ea8NevKUs579prKXr77gGJdHX51tcklPtkTBdqEEsJnKy1mmLq97ksL3aHHh32lgoi
	OSHNJxZQ3q0vtCT8C9sADEtMBbOV+Ilz3UKRp8mF86ssABE/b63cAJ5XNvy2kGn84BbE09IozeM
	aO2zO79kzBP4AzeOWnUMAAY8qOBRJHScs6R8rOT2uor/A+tLZgVaS63jAIBfaaq989I74AkEE4O
	bIsqEuKeDOLx6Qbf36gQJkk9LHwTUYUI4gSSURN+Q6bIIpvjcAP3r0K
X-Received: by 2002:a05:6122:209e:b0:5c9:a491:641a with SMTP id 71dfb90a1353d-5c9b8a6c1afmr4625797e0c.4.1789997160437;
        Mon, 21 Sep 2026 06:26:00 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91260a60f21sm67324286d6.19.2026.09.21.06.25.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 06:25:59 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x8e1v-00000006Knm-1R2E;
	Mon, 21 Sep 2026 10:25:59 -0300
Date: Mon, 21 Sep 2026 10:25:59 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Leon Romanovsky <leon@kernel.org>
Cc: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Logan Gunthorpe <logang@deltatee.com>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jens Axboe <axboe@kernel.dk>, Alex Williamson <alex@shazbot.org>,
	Ankit Agrawal <ankita@nvidia.com>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, iommu@lists.linux.dev,
	Tushar Dave <tdave@nvidia.com>, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	linux-rdma@vger.kernel.org, kvm@vger.kernel.org
Subject: Re: [PATCH v6 18/18] RDMA/mlx5: Ask P2PDMA whether ATS takes a
 direct peer-to-peer route
Message-ID: <20260921132559.GQ11599@ziepe.ca>
References: <20260914-fix-p2p-acs-v4-0-v6-0-5ef07ec9ef06@nvidia.com>
 <20260914-fix-p2p-acs-v4-0-v6-18-5ef07ec9ef06@nvidia.com>
 <321890690ce83d1943b2f678bd9bee9b8c895b66.camel@linux.intel.com>
 <20260918121500.GV13683@unreal>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918121500.GV13683@unreal>

On Fri, Sep 18, 2026 at 03:15:00PM +0300, Leon Romanovsky wrote:
> > That is, a flag to tell the topology check that some transactions
> > *will* take the host-bridge path due to IOVA being used, and that the
> > computations including pci_p2pdma_distance() need to check whether that
> > is possible (checking whitelist etc.) and return the corresponding
> > THRU_HOST_BRIDGE mapping type. Translated transactions taking a short-
> > cut using the bus-address would then be hidden from the driver.
> 
> The word *will* puzzles me. As I understand it, if your device has ATS
> enabled all the time, it should always get THRU_HOST_BRIDGE.

The P2P subsystem currently does not understand ATS, it assumes the
device will use untranslated requests and makes the routing
calculation accordingly.

If the device knows it will use ATS it should ask P2P for an ATS path,
and P2P should only return THRU_HOST_BRIDGE or failure.

The purpose of involving the P2P subsystem is to verify that the ACS
flags for the ATS translated path are going to work. There are many ACS
configurations where the fabric will hang :(

For something like mlx5 it is ideal if P2P chooses between ATS or !ATS
based on what provides an optimal transfer. eg there is usually no
reason to use ATS to access system memory for streaming (ie non cache
hitting) transfers.

Jason
