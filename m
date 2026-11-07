Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.218.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794074584;
	b=2UqabLYBhWdaaM1AL3ZomaOFOwfuBsro/xZRNxYVDapWyus3SYc6N74ML1n9Yu91ymVj
	 nnBgoxWIkrYfY4FC3FTPXO6af/V7iNr2yF/apzZZ7/nbVVYFjgt7u/caHWSbVK1DcmjTN
	 2kuv5lTCnfS4zzMFJjIxL0Qu9LSNU+x8DX/DXq4djqD4+HoMXBWgvuu1TXnSebpnNw/ky
	 Y+Emmc5s/0WUkMaLo7JR+ZhV7TeeF/NESi1IVy5r10fNC/jleQe0ouC116/4Sknkmq0HA
	 1vB4sNh+kkQxIie2Um2L1sM8ASCRNzMaO2k/0YTr7zVmmh+HBaE4YJOxVP6vHB4gE+w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794074584;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=/I+DSuPvds4ikStzUhuSfn+6bMaR5mQijHneFdoPCEY=;
	b=1+eAazSPrSPmXSX/ZC5fWEq02+2BxqsbCAcFUCloFtF70zvozv7QCIbSjyEAzug4MFj8
	 kLCXo7ajWzAV5qyn0h2VBxQjMPH8NrL9F1EiJtbaiOv4W75eHwQTgKNZKC54uywbf8uQH
	 yuDIpCxQLrOCLDtJBFJmKfuqq5xvqljFqtYeOlyDdtHa40ew4b6H/8SF1Fmz1tG4oKiFZ
	 3Jj4y0fMV1d0wZyOpXy+zTEkAkHDc0qULGIaBQwrnW6aP1AhfZ6lYzEqXbgJPoSXh/FQi
	 Nj6JVNgOv2n/dmB0qOUTbtMji0tSscmFeBM3LGSryJ7T3Bl7CT+sI0LDHI/l54sY6kw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="ZR/JeADN";
	arc=fail smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 052D9606A32D
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 18:03:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 052D9606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZR/JeADN
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c4ced671398so204445466b.3
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 10:03:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794074582; cv=none;
        d=google.com; s=arc-20260327;
        b=QTCcFX2NolNXGrR5RGGGvy+CSHveInTuMvLJWnCHN8LRePkS/woZImgaxQrOsnEOay
         AXBlXPq7qPMXPxw3s+NUeSVQ5lf4n0Uo24lrdKnK3U1WFMoVeUgwnhQ7BWSazyMW7sK8
         +CYFifey+oKv/DOhXrdpyV6xQS2ZFpWQJd9XaK01NtPjgWiHkaI+y4xDVGDpf1dGzGJw
         E7kMzBEzQSD1cxdwboO+fDjNDSHD1X2TnFPTLx+u+hPFnWLYZZVxCcORf9NgDuzwHcLu
         MibBF79ihw3LMOQFxFyA32r3wsXmPPCHGOrd1gJwCBLzoAD1rByFD5crNuGseQ5H4vr+
         ojRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/I+DSuPvds4ikStzUhuSfn+6bMaR5mQijHneFdoPCEY=;
        fh=FC6XmEhYyKx747azSY0RAZa+ZNh+EfPTO0pXLiSLShk=;
        b=m8krJjFAGtaIYuy93Sn9OPkiy8m1Nb2/rNiLc+9clrpFDqBxn/oAODXDBBVitFd+fZ
         nQcFCGPDiVWpd1ByIyVyzYSHSJB3mzONERAeqvMQHh5O4+hjiFPXd2e2mk2q8PE/eG04
         tKvZxWG/z4BBX7Fdufm0hJRIFlhRq6GpOx0wrpIxBpkr5ImuCEzJ+HbuNhcvpawsOT/n
         nlp9nRqD+XalKUrwKNu5DdS9peYrylxui633fEn8lTOUdvHOLha+b/CrSC2KBIvW6VLX
         QElUZZjo3uoAjY4VjINzzTOkVtJJIgOW2/etSimdmwrxrIx/wPbSm+bh/jxxTSPHzAZn
         /I8Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794074582; x=1794679382; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/I+DSuPvds4ikStzUhuSfn+6bMaR5mQijHneFdoPCEY=;
        b=ZR/JeADNCmqYCdLsgCwp0KL8ZQ429paZGckzqgNsdK+M6NuuieEsZpFcsmTEv+MWGx
         4Ce6coANmKFIzDyGhn0IRophZayRYEegrEdzPl8wrV4Y10VjWuLYmPA/kJcTJduSYMjs
         D9Nf77vQr1hIIYIiW/KljrhhEHRXPRiDNVGtB3MTW7ZImNtXu7x4aiVeabi+58f8q+bK
         iP9hy8poGp4bbZsE/JpLOtQKE3HovYPlo+XjXyUGqys+HrUkHIVGXvVvKqpzDEyLNNrv
         3wFcf3kPx+Fd7xne5qDMmjkl2m9cPvssl+I3OXX+tWZ7h/aidM0OI4ed7HYXMVK55n9F
         iscw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794074582; x=1794679382;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/I+DSuPvds4ikStzUhuSfn+6bMaR5mQijHneFdoPCEY=;
        b=IClv9Qv8Wt4OhRizxbcZk5Zwtn2wvEMQZqh3brXFafvZ1HW3//tJMnMD/fuxScGCA9
         6xMSe5XFmIY+9IL3P9Wnd/idTjXzYjC/gsZmdzXzRyl4uSd95ZCbqiEF5EZGAYkw9kQh
         4m8waoke8QwljWxEVuT35jpHA32G203GeYbuu6UDbcvuJgEfGP1m7p/fQEbE8EzPSutN
         INoHML9qI0swedQu5+zslp1mzQl+3SBoaY/9K7ZMY50Y10UimV2EioQc9/LsVG0bxj15
         idse0CJFcUF2EE2FCHZeXWxlXu60Q7jDyyWCgui7riEmgzzOBr2rXMldk27TV2w1PNFt
         FL8A==
X-Forwarded-Encrypted: i=1; AKwUvBwx73Ye2Z4PJ0p1Cj9f0Pye+9AN3xLHUfsZEUA+pNRHDulUHA18ZzQLQ3hXQg0JolixBxVIFo21vQHSD2w=@vger.kernel.org
X-Gm-Message-State: APuU4Z81E0wtfo3q468c1LotR2izWwTLkvSpJw/D8HsmwWwZqvXNblJj
	p5QGeKmTtsWsGbd9enwbJbL6F19faad8iWbfwnGh1PBud2NrRoKFqDKr/HsD2KzYn5yLQ5RBb86
	W1LXUaqc/mjFrafYCD2V3PQtJXHDeSFg=
X-Gm-Gg: AYBFou1dmlM4r4RC+ANB3lZNICmHGXiy9UePZfuQ+J1X8B6caQtvu5HNkm0EXH337/r
	ilsNonSrOOQbr3lJjBEBljnJcTdQRbqFH1WanykNSX1qloED5YGKckrNTy0TZT3+Nl4YwVtyVzO
	0QhIGkvs74z1RAtVdkL9PVeG602+TWvZ7SzNBcxPvvmY7S0evbHaa4lbP2mTD0uiCiy/v3oetm4
	ie2wVmdpu/IsJSMGuTexf6JL6zcB32rmOZ7eyXQWaRb4I7x4jEfq/Dw4scDE0VthrwNZXd/CEZG
	9zM00Z42O4i9A14w1fVbDY9syYLctIsb9LNY3q21zLYfiWA6mhl/DZb5NjUofkhyCqhZTJcfksq
	fIOZUakgFpNBZTvkvvuUDBR/fOKmqMrYrxP/OMRxFJ/ItpXSqmmXeDjKSFq94433UPYH5Bg==
X-Received: by 2002:a17:906:c150:b0:c46:9ca9:f524 with SMTP id
 a640c23a62f3a-c4d354b9d04mr488402166b.32.1794074582110; Sat, 07 Nov 2026
 10:03:02 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106160432.2552507-1-nphamcs@gmail.com> <20261106160432.2552507-3-nphamcs@gmail.com>
 <CAKEwX=PiM8vc27jOVdinOGO9AdCOpbKozu=Hj_b55y10-ynFyA@mail.gmail.com>
In-Reply-To: <CAKEwX=PiM8vc27jOVdinOGO9AdCOpbKozu=Hj_b55y10-ynFyA@mail.gmail.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Sun, 8 Nov 2026 02:02:24 +0800
X-Gm-Features: AclHuK9RPnAApTAFi0PfukcJ0UQmuTrX5qH0AJlbdKfeuTMpH9rclGGAWt7gGFg
Message-ID: <CAMgjq7BuAKZ1BjTmdTmXHV+SZCpGMT2YL+q1qvbDOSeqYA==Tw@mail.gmail.com>
Subject: Re: [PATCH 2/2] mm/swap: publish cluster tables after reacquiring
 allocator locks
To: Nhat Pham <nphamcs@gmail.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	akpm@linux-foundation.org, axelrasmussen@google.com, baohua@kernel.org, 
	baolin.wang@linux.alibaba.com, baoquan.he@linux.dev, brauner@kernel.org, 
	chrisl@kernel.org, david@kernel.org, hannes@cmpxchg.org, ljs@kernel.org, 
	mhocko@kernel.org, qi.zheng@linux.dev, shakeel.butt@linux.dev, 
	shikemeng@huaweicloud.com, weixugc@google.com, willy@infradead.org, 
	youngjun.park@lge.com, yuanchu@google.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 7, 2026 at 3:59=E2=80=AFAM Nhat Pham <nphamcs@gmail.com> wrote:
>
> On Fri, Nov 6, 2026 at 9:04=E2=80=AFAM Nhat Pham <nphamcs@gmail.com> wrot=
e:
> >
> > Under memory pressure, swap_cluster_populate() can publish a table
> > while its locks are dropped for a sleeping allocation. A cached
> > allocator can consume and free that table before the populating
> > allocator resumes, leaving the resumed scan with a NULL table.
> >
> >     CPU0                           CPU1
> >     swap_cluster_populate()
> >       drop local/global/ci locks
> >       allocate and publish table
> >                                    swap_alloc_fast()
> >                                      consume the table
> >                                    charge failure cleanup
> >                                      free the table
> >       reacquire local/global/ci
> >       return ci
> >     alloc_swap_scan_cluster()
> >       read the missing table
> >
> > Keep the count table, cgroup table and zero bitmap private until
> > swap_cluster_alloc_table() restores all allocator locks. Install them
> > under the cluster lock and retain it through the scan. Initial bad-slot
> > setup takes only the cluster lock because the device is unpublished.
> >
> > A stale reclaimer can return the isolated cluster to allocation while
> > its locks are dropped. Abandon installation if the list state changes o=
r
> > a table appears, freeing only private allocations. Restore locks on
> > allocation failure too, so the caller can return a still-isolated
> > cluster to its free list.
> >
> > Reported-by: Sashiko <sashiko-bot@kernel.org>
> > Link: https://lore.kernel.org/all/sashiko-outbox-181084@kernel.org/
> > Link: https://lore.kernel.org/all/sashiko-outbox-181086@kernel.org/
> > Co-developed-by: Kairui Song <ryncsn@gmail.com>
>
> I think I need a
>
> Signed-off-by: Kairui Song <ryncsn@gmail.com>
>
> here as well...
>
> (Kairui - up to you if you feel like Co-developed-by + Signed-off-by
> or Suggested-by + Acked-by is more appropriate here. I just filled in
> the sketch you gave me.)

Let's go with Suggested-by then :), I didn't even check if that sketch
actually works, so thanks for taking care of that!
