Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793633749;
	b=a5Pxq8JQJnnYwxnCcjCCxGRAxjwURauUsxBOBxp5ak+/V4W6vUalw/M72H39RLXos7qb
	 2JZVTZb2FPv6yqozh7Vh925M6Ehk5nP37CPHGgOYN2vnKaBT3Vu2Sg71QiN9wgnwRs3K3
	 s2k0nulgSlY8Mh7MGKzHWAQpCGonpVdySYeG5ejcjUorgY7uWSsVi2xFjaZt2xpo6/fmX
	 gTnLF2v1eHCJKe7k9KC0jzBVMHQoN3RfMfJZ6XkIAZ4HRIgrMnKsdeYGw+LymwBANa4zT
	 /YGzjijNIQoOc4cGFvJYmTr3SPljexSv9nNkDMFz9XMQAReSsoOi2U1gwjXZzgXlTmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793633749;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=uTBY7+w3GJYj4zEYkLCYx6G9HqVrLIEyic17+kRkINY=;
	b=MfNKXTsg+GoVE93aaktK/i8OKh6MFLpsHC6/jAqvDKb3bBU3Dv0Fv/Jl0G/E/Vov2Goh
	 GDTIA9gZhjiniEig0+o/GWrrgwWRwBKiNAdVRGVCNZSex6o3Dq83ny62tins0HV9HEHRC
	 RAkz0hqKte3dIHqO9BeGeuRXHfuOBLCQH4yywOByWUnIoVUMAOX6DDh2iXZlKkwRU96LD
	 xnh+GOV/ZvTHtPz7q7olJjTETfqRKgA6NKB4pFnr0Owx/dQErZ/AmxrzOrEXIvNzkXo6s
	 9erjgRfkNrTfbiXkCW4Q7CkM5dwON/hnYmYe1KNv/rcifE2dsQoTs1ciNDJBatoFwtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=BlmVTSs6;
	arc=none smtp.remote-ip=209.85.210.199
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F1360A18A0
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 15:35:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0F1360A18A0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=BlmVTSs6
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8a0592d4539so4451003b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 07:35:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793633747; x=1794238547; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uTBY7+w3GJYj4zEYkLCYx6G9HqVrLIEyic17+kRkINY=;
        b=BlmVTSs6+8o5sfMbktnXRJo79MWSCnhJCKAoKhAbRQ8bSIpJFiwulmzOLhAWahp646
         BsnUOI4d6ANJJUu+YsiQN3+st++LgVoVRAjB67Q2gUzV+X6JB1BzEuMmyChazFLbIJwm
         +1tXtAr5r3ZPNL/UA3s/L9d/8C/OCoBFw3B2S/Rx092lPvMJjvkrSCwoQHtYk3BaQy7r
         LvT4HBuvfbEJC8sDDzCbuieOV0pAJ5ck/XnXONH948n65c6oj70iWGTC19BI5BLf6RPL
         iFel2n5OR68U7V2FfaNuWr9KY4HZE2Ig3R7yKM8ckCNkvNZS2/4uPzjqLofCaZc6J2D6
         nJsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793633747; x=1794238547;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uTBY7+w3GJYj4zEYkLCYx6G9HqVrLIEyic17+kRkINY=;
        b=JUXY695fHyR4Vzoeam7qxwo2PXZCWUSmBQ9fjysZXbhTtcNnc8HZ31egEaPGG464b7
         b9kaKbMURY8MVbu3rug5q1UifXPn10j711RJYAQj28hBG+FpMqtai3hFLfjUhHcU2aX8
         Q0pjeXt2/g4NvFbGDxFQhkaL1ue6SW7NchevMBYfzhaFDEft8YVvNQsQ5l7dm8F4pD1C
         24MPI26Om5jYxvuXyQCPGELJf8xetYo5yThZDuqqpRV1u6q0YGWnLYddjfktMAwkqOay
         fiZtsrERiU7d+NOHKNIQeVA0ITuRc6CYqMF0y6XWl/x2IoGzXQ47SJgs5wuZFuSiixYI
         D2HQ==
X-Forwarded-Encrypted: i=1; AKwUvBzb2OM0iZuT1JBA4nBSFFWtMvozV5h4kUWj404qoQr3C9PzUb1wPhb7I30Etc3GtEEytY7zPRtltTbMKdE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLEV/XFIAEDve3EO6J8FApTgWgIm2xSFgxBPOCj7gIDlCdBFa1k
	JBgaV0iMrgdPusS2rXD7wSbhad4VduIHjcW1FVjNhOpXWkSX9RBHk+WI+wr3KRJzy7LveKLgVT0
	TopYjpQ==
X-Received: from pgdo12-n2.prod.google.com ([2002:a05:6a02:620c:20b0:cc7:e6a9:8fe1])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:9185:b0:3e2:6ee4:a751
 with SMTP id adf61e73a8af0-3e928a5a7e7mr9816324637.60.1793633746886; Mon, 02
 Nov 2026 07:35:46 -0800 (PST)
Date: Mon, 2 Nov 2026 07:35:46 -0800
In-Reply-To: <auinpIEk6FdGwDS8@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261029221710.1871112-1-dmatlack@google.com> <20261029221710.1871112-4-dmatlack@google.com>
 <auinpIEk6FdGwDS8@google.com>
Message-ID: <auit0kVkAaWcNUvk@google.com>
Subject: Re: [PATCH 3/3] KVM: selftests: Use VFIO selftests library to pick
 IOMMU mode in IRQ test
From: Sean Christopherson <seanjc@google.com>
To: David Matlack <dmatlack@google.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Alex Williamson <alex@shazbot.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>
Content-Type: text/plain; charset="us-ascii"

On Mon, Nov 02, 2026, Sean Christopherson wrote:
> On Thu, Oct 29, 2026, David Matlack wrote:
> >  static void help(const char *name)
> >  {
> >  	printf("Usage: %s [-a] [-d <segment:bus:device.function>] [-e] [-h] [-i nr_irqs] [-m] [-n] [-t iommu_type] [-v nr_vcpus] [-x]\n", name);
> > @@ -266,8 +250,7 @@ int main(int argc, char **argv)
> >  	}
> >  
> >  	if (device_bdf) {
> > -		if (!iommu_type)
> > -			iommu_type = probe_iommu_type();
> > +		TEST_REQUIRE(iommu_mode_is_available(iommu_type));
> 
> This is very unhelpful when neither IOMMUFD nor VFIO is available, especially
> why the user doesn't explicitly provide the desired mode:
> 
>   # ./irq_test -d 0000:6f:01.0 -i 10000
>   Random seed: 0x79d386bd
>   1..0 # SKIP - Requirement not met: iommu_mode_is_available(iommu_type)
> 
> I helped write the test and I had to go read the code to figure out what iommu_type
> would be, and then read the VFIO library to see how it reacted to a NULL pointer.
> 
> How about something like this as fixup:
> 
> diff --git a/tools/testing/selftests/kvm/irq_test.c b/tools/testing/selftests/kvm/irq_test.c
> index f9c11d80a306..63205afc04d1 100644
> --- a/tools/testing/selftests/kvm/irq_test.c
> +++ b/tools/testing/selftests/kvm/irq_test.c
> @@ -250,7 +250,9 @@ int main(int argc, char **argv)
>  	}
>  
>  	if (device_bdf) {
> -		TEST_REQUIRE(iommu_mode_is_available(iommu_type));
> +		__TEST_REQUIRE(iommu_mode_is_available(iommu_type),
> +			       "IOMMU mode(s) '%s' not available",
> +			       iommu_type ? iommu_type : "IOMMU and/or VFIO");
>  		iommu = iommu_init(iommu_type);
>  		device = vfio_pci_device_init(device_bdf, iommu);
>  		msix = vfio_setup_msi(device);
> 
> to yield:
> 
>   # ./irq_test -d 0000:6f:01.0 -i 10000 -t vfio_type1_iommu
>   Random seed: 0x14e21328
>   1..0 # SKIP - IOMMU mode(s) 'vfio_type1_iommu' not available
>   # ./irq_test -d 0000:6f:01.0 -i 10000
>   Random seed: 0x160225ae
>   1..0 # SKIP - IOMMU mode(s) 'IOMMU and/or VFIO' not available

Side topic, it would be nice if iommu_mode_lookup() printed out the known modes
when this is hit:

	VFIO_FAIL("Unrecognized IOMMU mode: %s\n", iommu_mode);
