Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD94332629
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 21:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788558085; cv=none; b=adPLmIssDq+4orh78lePzCqYn4lq6pPrRMC8bmi4hg/8NAKfB5zsGHLXghYqBQpyTEinpivNrFVpv3rH8tbFtD6y7myAAvwm+j0ZWrBx+92+YJQ0HMmJThLLx/EYaoX56LJyjerCw4ChV3fv/4bX7JbFvxy/c5ruyq2/XF51fq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788558085; c=relaxed/simple;
	bh=MMW5Zhv//CViWj0fAEp8P1ImU1S2jCTSQzMvwFrDS88=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qE/SamCLFESRsytQfA0iHEZgLczgxid+zRWGYpSc3aVNLnEw4pt23WZhL1cVLsKp/2kZUYl1bS/Sx2AWlz/EWATmS8f55cj065wy94bGqjHyOX/wtdkwHVCpV3bGiopEOmt7WSuk0Mie3k9MPhOFjimJMTSo80EcXNTFSaovUXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cc964Yuf; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cc964Yuf"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d6ff390a6aso13595ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 14:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788558084; x=1789162884; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MMW5Zhv//CViWj0fAEp8P1ImU1S2jCTSQzMvwFrDS88=;
        b=cc964YufM4lLPKVpsE/RffHIdAAQQflzd1CIb8hGgFcxC3UerbUnN8CpQtTeZ5kK6M
         LP+OpIwM+/N7Rv2gyTY3Sh2zB8RFISwCQUbN09k/mB/yndPZDOkal2ekJ6+TAOJVz/9i
         DgHVxdFpAaZ4iBgpmsU9v7MRXRYY31t4yZBJZvWbOPQnowB/SkXu8bH/0KrFLCklrgLL
         RPT3lBctkvvAv35UzpCvUNnrH4wWDRddAc0h9QjnTfyxA0mZOqXdZ5eZj+iZTEwroZJD
         AYdZrg90CjczhUw8wWuFBxA26x/5MI4sJLAeFLKrGGUvASPAIxHfoX+pzuAHAlvr1mvr
         QRKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788558084; x=1789162884;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MMW5Zhv//CViWj0fAEp8P1ImU1S2jCTSQzMvwFrDS88=;
        b=UpHoYYlewuZsaeF/ZnEycD6v9ZkqWVzM2aHu9eXE2VYlsGsH/Kr18PQmLNrjrBRGY6
         YHIrilFLicdflL8CpmqmxdrY2dHl54qRbnWqt+y5WJSxdGR1Ln9JqPJJzp3QTfPn7lmB
         AvWxk1TzMxw4Tiqg0xCiNImwbDIwFCTUl86ROU+W8rnM1Y9azsJmq23WDFGnfBj1PzUP
         oJr5v54XEFiK4kfuIcjmYvNgE2TDh2jmqpwshVjALtOufKZEUjaxegIvgBUmDUJC1Qfj
         CGZluyNCSjdtctF04leb3dmram99nhLVXkfhznQHan4IKnYjZrzH1S8o1xXOT6j70XcP
         07wQ==
X-Forwarded-Encrypted: i=1; AKwUvByNupJIcwg7InhYloZ7QY9NYctWislr5uYrnNslC6jX4Voiee4+VLKaGQoZoJPf+vHzkpwMHCYzY2seZIA=@vger.kernel.org
X-Gm-Message-State: AFuF++nDy9pAVVYxC78jlksEsz5DNUe8V29bIiIw0LCGGnnGIW1Hxhlg
	yIuv4GgOl69Kuyiq0LLub3Lk7UMmemhXuqS0+niHNhPW9gp5apLFo34a2Xnm5LHfIA==
X-Gm-Gg: AYBFou2iaGkJN3oRnegymWdK2qP+X57CBWc7F5GnvdZeGJdDv2+4vUzYX2es1Xs7CoF
	5VjPDBdWupLVG+fQyY8G8odOsUOi9TLEgdZO9RdDDWTviu1BlvSD+jiC3a5gNUGrwZuJi1xIg5J
	x9k5mpqmTXH5WDy81v6p1btkzvvI0eK4Aqp74iWyf6efh7ejJ0CsytI95fZwnsudsKQ+0wlIwdS
	7y9cS7DlLDJ+wRhPWFlJsAjAJJnokKJNZ8wR2D18BWsx+A/bZRUiY0pwJbBuqQjn8wwuxVP+p+D
	QxT6V4j/tEjqV/iQi+0eckOXEdjXU/r/dS1NtWcKTNQyA5A30hNP9VdflD3msGz9DlfQWQY3s3h
	vrbLp69JSvuUoZFSzUAVgYoLsQEggCbZCnrol3Q06Rlq4WyFZFC+TM55nOtnAadg/kWjuSE6Mpz
	kvX4jvcUCvaHVjdPJgfE7otcHSTrNYIuFsfnfVTC4GThtMUdJQI1BbuDElZqMZSIgJwdk203KhI
	1bxUsJl3e5mF6UhDD1Hm39M2C8ksT88POiiYLFLZtqURY1vOfoB4zTrWNc=
X-Received: by 2002:a17:902:f681:b0:2d5:cad1:a2e8 with SMTP id d9443c01a7336-2db28365563mr1928785ad.6.1788558023178;
        Fri, 04 Sep 2026 14:40:23 -0700 (PDT)
Received: from google.com (210.87.127.34.bc.googleusercontent.com. [34.127.87.210])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08ca63b3sm12393723a91.11.2026.09.04.14.40.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 14:40:21 -0700 (PDT)
Date: Fri, 4 Sep 2026 21:40:18 +0000
From: Samiullah Khawaja <skhawaja@google.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Lu Baolu <baolu.lu@linux.intel.com>, Joerg Roedel <joro@8bytes.org>, 
	Will Deacon <will@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Robin Murphy <robin.murphy@arm.com>, Kevin Tian <kevin.tian@intel.com>, 
	Alex Williamson <alex@shazbot.org>, Shuah Khan <shuah@kernel.org>, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, Pratyush Yadav <pratyush@kernel.org>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, David Matlack <dmatlack@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Pranjal Shrivastava <praan@google.com>, 
	Vipin Sharma <vipinsh@google.com>
Subject: Re: [PATCH v4 00/18] iommu: Add live update state preservation
Message-ID: <apCIr3Ops8MxdY2y@google.com>
References: <20260808022723.3893618-1-skhawaja@google.com>
 <67a636351d656e032bbe64b1ae113821ea4694b7.camel@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <67a636351d656e032bbe64b1ae113821ea4694b7.camel@infradead.org>

On Wed, Aug 26, 2026 at 09:12:53AM +0100, David Woodhouse wrote:
>On Sat, 2026-08-08 at 02:27 +0000, Samiullah Khawaja wrote:
>> This patch series introduces a mechanism for IOMMU state preservation
>> across live update, including the Intel VT-d driver support
>> implementation.
>
>Nice work; thanks. Do you have any timing information? Every
>millisecond spent on work here is perceived as steal time by the guests
>which are paused while it happens.
>
>So very quickly after the "yay! it works!" stage, we get to the "how do
>we do it in <100ms overall steal time" stage...

I don't have timing information for this series yet, but I completely
agree that every millisecond spent here is perceived as steal time by
the guests which are paused while it happens. And this is why we do
preservation of the IOMMU state early during LUO preserve() when the
guest is not paused. And later LUO freeze(), during shutdown, does the
minimum.

But we (Google) did some analysis internally on the time for which the
guest is paused, and the major time spent in such a kexec liveupdate is
in bringing back the rest of the system including important unpreserved
devices, other kernel drivers, userspace (VMM) and other major
components. Note the Orphaned VMs to reduce the VM pause time:

https://lore.kernel.org/all/afEwWZksU0Fw61oT@plex/

Thanks,
Sami
