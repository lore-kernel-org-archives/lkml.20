Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEBA35477E
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 16:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787933765; cv=none; b=Lvfg8u0KYLxwsfh6bORSu0VWO/vuLK5AeRJKV62iZ+LzYvMW9AL+IU6TBOmH2oxATglOjodQJ3ZKUNSa0scDx0gubhTONZgw2tTpKfDVXJEUOGJ6ZlMKNGNhtNIzFVZaoG4fLy/uqYItfQK7ABGQiDe3uCOUYL/B8J2nzivzzcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787933765; c=relaxed/simple;
	bh=B3pqQmJqpWZ8Cb06AdIkKqiDrvfvLs/ppE69ssAKPUM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EZWDOw77BLCs5bv17TkpWm/vi3AQska9F2ooQxUIUV7hdwr3+xKVlCxBvc85w2RTdyiGlFWX0q7v7zN+W/+Eb9wihksNoIYzxyO3AWvl8QhfWvGoq8szRZsxTcgHfnEHn9jVw4q8rCsqEIYrVgOjEXcFQDtWE2KrwVwzkDNAs5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fRyZ8+HT; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fRyZ8+HT"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2d3b440b97aso137425ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 09:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787933763; x=1788538563; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=B3pqQmJqpWZ8Cb06AdIkKqiDrvfvLs/ppE69ssAKPUM=;
        b=fRyZ8+HTo0SigwlEMqNsOIJpiQDui0qXOBmzUYpJ3U8WnxYHgm0Xz7nmav02A5Jikh
         QSXgf4TuppVkGYgaIw4LuL5SjtRskGV1QgqUqItQqKx3W3vGKNAIkqB5j0YfiwRacGmr
         jiHPfjn96OtBJ6uLwnyVO4gP5dz8f7nZPWau1YLHzTENWjubjarbrp39YpkY1qaH6aer
         JaoRpkOtsHtvxmtqJTePu91aQ5ir8gq89YvLUF4OzkKi8gbRrSzF80SQj6CAyU8G9q9S
         VDY7bLRUHDLfxufh3VfRhVvD4c00bqf3KBw4T79zJC5+pyuYW85gqKAJcrGxvOxOaZLV
         MK9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787933763; x=1788538563;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B3pqQmJqpWZ8Cb06AdIkKqiDrvfvLs/ppE69ssAKPUM=;
        b=hbpcIy2wtq3gd8h/HnY/jFT7SDiQJXkrnFVIo+hvS4S92jRjXp8GHXIomzjS5+2bE9
         bIW3hMtkXmUpEtV+Nau0/Neqhk3lw5TqQB1syBN+viVWdVv0ilR/wbJk1+wdme+Qt2Yj
         PyQQQsC6wXfxgYU7QIC9rb6pxnYjqiDjv8FdL8/ukE6uk3LYrZ8D3mgYjmAeSmnqDbaR
         X8FSQGSJZ2M5HlLjpNqHqkprEuIIPnX9xcmqPdS9KKdtateaiulKzHiyEdMRSXO/Kq0I
         2nSw27mHeTXaRpvfQKIZpugjEce40QXrlpEQ9SJW8jXcVtmFsnUrY8wjEflrd0gW+HUD
         iJMQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrpw/u6KMIY/7qeInILunJeaJ3q5Ttd8Rmy61bNkwr3dTA9RajAtHy4Uz+C1eYQmng2VCyrPZP/Di4hZEs=@vger.kernel.org
X-Gm-Message-State: AFuF++lLcrP1V9aJfy/6D4pNpk9x2DInis6VqZT5ZN7t6AQNjOp8GFj6
	8XUsZV/HdiROHoAfg7dFr6WmBbmiG0aeyroWK2xf8yWXFkMaeKwztb+bLrI1vrd+QQ==
X-Gm-Gg: AR+sD12bI6UtjLue3cKm16wKOx/q0sFMbjJUpF89/pEsrNz0SPC/5Evr76k8LSZ8E6Z
	vHR+zGgeIzGg11j7UxYOCkwcwoYNzNuz8gl4MwzMeLSuWl6eYPAHgjcUVJ2V/rKU8SVP1SOoFKV
	Bkx2yibO3hoxSnb/ZpDqOjDqwROA2YOfcpmGrt/0L8JT6ahJplGcFzvRuFfN+m0YGSpBtGE0vw/
	tpECL+dO/UvFYZvc37H1umvlDbkMzrx7zJXG/RwoQ8h7LTXT59OMP+lPV5anGKpzkX48gQD27Ck
	RHPDBb2XdXR4VEaoOyNIpOBmnirxqJnkiV+OrXxYmF7PG9DkcTyVPZoSE77qWdBhs+lnpDVDbnh
	MmrvJAFpedCiYPPuIa3ladwG1Ke9CyY/Mj9OI2x1KGubxw+B/vVTqi/puerkfijFEdpU9OnGwPe
	8qEV45YRbkEuXuE46ZvJpwRDaqvo3K6DrYmBQPNX3kcDBdK5Br81TLXXp3YLw6vatlFqzqJO645
	lhBC7R2rkb8B5EOTmnkWGRpvGIe0ZGZbiTgtpU1/QgPy2oxqeHl+qibzWk=
X-Received: by 2002:a17:903:1b48:b0:2ca:6bf:5bac with SMTP id d9443c01a7336-2d74f53de42mr7697375ad.8.1787933760261;
        Fri, 28 Aug 2026 09:16:00 -0700 (PDT)
Received: from google.com (210.87.127.34.bc.googleusercontent.com. [34.127.87.210])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-856a359515dsm724321b3a.48.2026.08.28.09.15.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 09:15:59 -0700 (PDT)
Date: Fri, 28 Aug 2026 16:15:56 +0000
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
Message-ID: <apGpHv8vy4SWIEaV@google.com>
References: <20260808022723.3893618-1-skhawaja@google.com>
 <20260808022723.3893618-13-skhawaja@google.com>
 <5b920299-260b-4025-ac4f-e8f83beebf95@linux.intel.com>
 <apBso6So7UqwR3AX@google.com>
 <bb7052d7-51fa-42e0-9eb5-ba4743956688@linux.intel.com>
 <20260828143546.GC3769797@ziepe.ca>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20260828143546.GC3769797@ziepe.ca>

On Fri, Aug 28, 2026 at 11:35:46AM -0300, Jason Gunthorpe wrote:
>On Fri, Aug 28, 2026 at 09:55:18AM +0800, Baolu Lu wrote:
>> That looks reasonable to me. I have no concerns about keeping ATS
>> enabled on preserved devices across kexec reboot, as long as the
>> software state is synchronized in the new kernel.
>
>The new kernel should issue an ATC flush when it changes away from the
>inherented domain.

Yes, I will make sure this happens when we do the retrieval side. It
should mostly work well with the existing replace machinery.
>
>> By the way, is disabling ATS an option?
>
>No, many devices require ATS.

Agreed on the ATS requirement. I had Nicolin's patch series for CXL
devices in mind here.
>
>It is not that ATS and PRI are coupled, there are good reasons to do
>ATS to pinned memory too.
>
>PRI is a PITA, I continue to think PRI through the iommu was a
>mistake. Devices that have device-specific PRI handling are fine
>because that all lives in the VM. Devices relying on SMMU PRI
>forwarding must also somehow not loose any PRI events across the kexec
>and must ultimately inject all of them into the VM.
>
>> The current design already requires disabling PCI/PRI during kexec,
>> right?
>
>That is also not OK, but there certainly is a useful universe of VMs
>that might pretend to use PRI but actually only use device specific
>fault delivery.
>
>So ignoring PRI for the moment is possibly OK. Someone using this
>should understand what VM shapes thay are making and if that
>limitation is OK.

Agreed. To avoid the massive complexity of handling PRI events across
the kexec right now, I explicitly evaluated this during v4 development
and marked PRI as unsupported to limit the scope for now.
>
>Jason

Thanks,
Sami
