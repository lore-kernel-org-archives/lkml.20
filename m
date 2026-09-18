Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A51BB3D75BE
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 02:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789700396; cv=none; b=Cm4Gx9Qh5Yu7WswVAEpLxNhm5hf1t0A/+B3F26QXV6PyZSGWa0aNZpnzGb6e8a1pG/oESVdZv5JgLFX6aWk/5UvbwK3Ndow7ieGpGzazDOI4tot2CxlFpBQL2XfND7vOjOHimQ7MeRzuptGR/7cAGv+BEGKv1hwT8aLHSeBsb2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789700396; c=relaxed/simple;
	bh=IA0A2RgVsub/BbYG7H2jzk5weAVNHePmc5M43c0YUF0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EJFiwRNPA5k2SavM7O6aATjviTVgUxxiY47hB4mCFkwoSRuh2dQmWmzD++JXEra94VVIUmXI+BZ9K1ofID68mK3SnpcmJQzRvcSu4BomLG5W9GYqC8wlbKtsJgpjuaqH3VKIxdK9QKrKgT4sdEbMrTDKlTlT5IEnMYLDMk2qq4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VZ4YAcoE; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VZ4YAcoE"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2d8fd7a3f38so35165ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 19:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789700389; x=1790305189; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IA0A2RgVsub/BbYG7H2jzk5weAVNHePmc5M43c0YUF0=;
        b=VZ4YAcoESXMR1y7IzOkXzB6P/7dzuq9f7uY9pGfvgr+8tO5CbQMFOpQObOTgtCSbeV
         oe4sOlpyMbUbhCUJmDSLVUjCnDQXACNHrfrAxWa6CQ9HpPxiMORqNPlpIZsUPvzbZ59Z
         R+x4mVCH27/enXK/7KKRWOBCiXIFFNgpexLto4hs8mxWIMstcSRxFsJwAqVYvYVeDHYZ
         gk+TBeCUZ4g0ofbz71aXfqS/KfdW0PAzJJWrQXDuV3eXtMml0cXpXxlRvrlX8HkuFdzd
         GHnXPCxrrgyHvfn8etux7OhtDTyUIrQ0kRUjBxnW7G0PQgfjyeYE8Z3uIP09xUCv3rf2
         knlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789700389; x=1790305189;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IA0A2RgVsub/BbYG7H2jzk5weAVNHePmc5M43c0YUF0=;
        b=j4UvK6OxpwX6Gf4t6ZQTIloCkZ1hchx2sw7zTtOUaZmOz7v/obMMWCaTwxLbvHa3Gs
         pCU4Kl3mfp+dxE0a9pMTgfiVAWX1OlXepD53UUQrhC/zktk8bdn1sOXjbbPjHV6s88Yt
         pIrJlvxcIumbhUxY1uqI8GdLRaHEA6oBU18dFzX6y88tYnZ/1jddbr/7c6CMtEiKxRA2
         sOeOieps0gIDiN8dZA71/udg2QItfaXJcPSsiGQPlTECN+x4H7OBG+UWhymEJz4XBLVQ
         xeA3KiR8V/KwcycBUct6aOKqqvtyoBlGhtb+1x0PNs3kRa2gLjM2ttK2VhNZCD1A8/zn
         nrCA==
X-Forwarded-Encrypted: i=1; AKwUvBwt3Bv/FA6hppr6RcnKco7kkFKTddeMnNrCLxgIjEt9ShJ8H2uVROBI1Hs7CGga3tV62OkPn0/EHzlfjBA=@vger.kernel.org
X-Gm-Message-State: AFuF++liVGda7EB5ZBpZm+gSwG8ht/psl1nli1pdZlKi6sd3RP1DV9eQ
	F6hZeJ4SKhUp2Fp4eAanIm0nO58w0J2yx8D7Sgz3Zii/0b79s6w/HiBEMrhaC293iQ==
X-Gm-Gg: AYBFou2kidtHsutAZ71knx+LUcUjpKoQnMdvdNl5xy1ZqyHALvJOfNPoyMnxNomK94U
	cy/ttiZmYqOvLKpYIwqg6RRbhsMoAZTnmu2cB/SlQ9lefHFfa5c+HHnCZIK6GNR1W0xDijEKVwH
	6qtr1U9fcPmy1fMmEvwuTclM/KIb9zcjApPMpi3nIRRcLSfQkrNd4N8jfrwrUHUKH3soVMszrPn
	3/pbT22RWag8wQ9oxKrUhRS6dZ9RqAvoT8StnPNygdpDphFPsfyuHN+M/5cIfbOnIUyEmL3wTVa
	PB5DWFUPJbWwGJN6ASdFwMNebn+ugqKhTUvKa74sIA8T5tA+rK6RmzZgfV+Y6ENs3vRZleLHpZd
	l9qWPbPY7Z7CKRAprKgUdT2SIPPAL/lsUdlkodRt7Jqxua8PCz6RtsqTQ42gdXmm+Vm/TtVuQJk
	6TSvzLUeSPnR/PBGtK7wa/f16n3WRP2rFY7UjDKQTWYINqHBRVzPnyoFNv2+asnWn3/n/iSMpnZ
	P/00x7RcCAvSQsFvPmomB8F5HR04pX7qxyQ2L9SPyXwwujZLaOEQhql8gShwlQOfYQKpQxbg+F5
	+xgW
X-Received: by 2002:a17:903:4b08:b0:2ca:6bf:5bac with SMTP id d9443c01a7336-2ddb13465cfmr4177465ad.8.1789700388427;
        Thu, 17 Sep 2026 19:59:48 -0700 (PDT)
Received: from google.com (210.87.127.34.bc.googleusercontent.com. [34.127.87.210])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e55412d51sm555950a91.2.2026.09.17.19.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 19:59:47 -0700 (PDT)
Date: Fri, 18 Sep 2026 02:59:43 +0000
From: Samiullah Khawaja <skhawaja@google.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Baolu Lu <baolu.lu@linux.intel.com>, 
	David Woodhouse <dwmw2@infradead.org>, Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Kevin Tian <kevin.tian@intel.com>, 
	Alex Williamson <alex@shazbot.org>, Shuah Khan <shuah@kernel.org>, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, Pratyush Yadav <pratyush@kernel.org>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, David Matlack <dmatlack@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Pranjal Shrivastava <praan@google.com>, 
	Vipin Sharma <vipinsh@google.com>
Subject: Re: [PATCH v4 12/18] iommu/vt-d: Handle reattach of the restored
 domain
Message-ID: <aqyW3RzBGQyZebsG@google.com>
References: <20260808022723.3893618-1-skhawaja@google.com>
 <20260808022723.3893618-13-skhawaja@google.com>
 <5b920299-260b-4025-ac4f-e8f83beebf95@linux.intel.com>
 <apBso6So7UqwR3AX@google.com>
 <bb7052d7-51fa-42e0-9eb5-ba4743956688@linux.intel.com>
 <20260828143546.GC3769797@ziepe.ca>
 <apGpHv8vy4SWIEaV@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <apGpHv8vy4SWIEaV@google.com>

On Fri, Aug 28, 2026 at 04:15:56PM +0000, Samiullah Khawaja wrote:
>On Fri, Aug 28, 2026 at 11:35:46AM -0300, Jason Gunthorpe wrote:
>>On Fri, Aug 28, 2026 at 09:55:18AM +0800, Baolu Lu wrote:
>>>That looks reasonable to me. I have no concerns about keeping ATS
>>>enabled on preserved devices across kexec reboot, as long as the
>>>software state is synchronized in the new kernel.
>>
>>The new kernel should issue an ATC flush when it changes away from the
>>inherented domain.
>
>Yes, I will make sure this happens when we do the retrieval side. It
>should mostly work well with the existing replace machinery.
>>
>>>By the way, is disabling ATS an option?
>>
>>No, many devices require ATS.
>
>Agreed on the ATS requirement. I had Nicolin's patch series for CXL
>devices in mind here.

Having implemented this now, I am thinking about this again with respect
to the scope of this series. To limit the scope of this series I am
going to refuse preservation of devices that have ATS enabled. Once the
base preservation logic goes in, I can add a separate series on top of
it to add that support.

The ATS adoption would need new helpers in the PCI core, handling of the
ATS state in the context entries, and the disable-to-enable,
enable-to-disable and STU mismatch for a live device. That is worth its
own review rather than part of an already large series.

This essentially means that preservation is supported if pci=noats is
used, since by default ATS is enabled if the device supports it.

Thanks,
Sami

