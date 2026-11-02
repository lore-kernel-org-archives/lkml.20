Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793646001;
	b=sLXn+uCrlF89XWNYSMUJMr5Qn2e52wesk2Ewdbxfj0YM/F0hywIL/hbviI2SbPNyXVBb
	 duu3uVFkDdmMlvq/2Pil799kdfp5wwAHfnMsB0N1OER8tQx/aecUsC62vjPsiQ+R+eN06
	 psDB/TBUoEosi5aNOEKPBDSWEqdHgNQoHAB62XtkC79fphS+7O0WzSfJHW5OizOyfz6Kc
	 JlxDeQI3nFNPMVJTUjb+glEd/NIlcFmoXMIMVmSXefZU3ASumlSu94fp9dZn2T85M2Ezg
	 jTsQBvUj+OtikF9CHcq2NRgrxOhybIM33ar/mQq4+1aWn1igvRCXKjrTgSY+NqFRV8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793646001;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=bfaMKXrWeYRP7WEXgxdER3J69Id6ZxO0KCbiyzPfHr4=;
	b=JDLnOd/amnCa6bI9MLBrW9Y1ojqgRqTfNJf60vijNE9GY2L0mAfMnCKTzMqrBXeQ0JJO
	 vugG2Xi41hxKBhN9I28saXf2B4X7iI5OTDN842IdJQCK9SZfS3e7lvxt93IZObLtf1e3F
	 hSoi0WJV8Amr7hvA97X2IQxgPNUOz5xtGyL8TS6kPBdvGAbtsJN/wspn4TfuwH3Tx+etO
	 6PTIRr4d7YUGAEZL5f3GZFGswykxchrZrhLdNQYNaXuFGlAFOm9Cjod+cfmEyX5UgDBFI
	 dZvfTFCFDcKdbEREMpbVXmTtCQRbKPEPSTf7g3502SPp8BxcJJLrAs0t+9aifdMhbsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gazn9V0g;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3932606A338
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 19:00:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3932606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gazn9V0g
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ea7190aea1so16928355ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 11:00:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793646000; x=1794250800; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bfaMKXrWeYRP7WEXgxdER3J69Id6ZxO0KCbiyzPfHr4=;
        b=gazn9V0gavccqS31GwskuSH5hBz4+XcaBgNZ45uO6x9kza4ppiYg472YGcD+WxWSSj
         3VjLmXFgZAtUpzMDPmc2/XyxFAiBRQzvXqAuh5n6kS4P8z+Bhzqh9y8JVNA2SN7hPXON
         /zom/oK+IZKgNe7Sks59Ax3L3nFiw5J9y/NOttcSbLEmM6a8PMmzt0Ohs6Z5h8ak0GsB
         gsEqLx1+F0h3bJ/MSUD3fWcXtGM9oD5k88y2qmvLT4dhh0jLMJEjj8LuRwn+FIXX8cEH
         Gl/X+XH6C6CyA3qRfATC2Y855g4/amVu8Nsq5116PMpH8ECys/lQmD8a00XVSgO1JMJ1
         gkJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793646000; x=1794250800;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bfaMKXrWeYRP7WEXgxdER3J69Id6ZxO0KCbiyzPfHr4=;
        b=HT1wzimrPIM3Mg11KCdGJ9sTIJlIgcgPiVOvN56sNFzyZhKzMiVQCTyG/a6n8Psvr7
         hB+86j1XJKUV4Mr3gynRV7/nDnZMvid5SQZfYSBSK7lodaQezkldcDZYIuzBl84VR3Xf
         PgjQqxltYoWGJmXlL4fVN0IafvGYRc7qNwOHXXIoCGB0xn7mL09v8KJWacJVbKifS6Ab
         O1eCvEpcZO+W2NJ8b0N+nbYDJgVdykRJK2bV+ghFVxbzU2gC/tE8I7d6/CwjSmu7TseP
         fP+M1ROfmud/oFCsR4IFxvvOBLQYUYpHpkPwNCaJmBQpVDyKoxSvCVJdCbOkHnQfREUs
         g7tA==
X-Forwarded-Encrypted: i=1; AKwUvBwdeqAX3tmOiT84xD8o6Sf0n27SB89ede1Qwvl7/UwnUgRDfNedkGHSicNNBgDYOYsXRaIu6GOjoSi+O4o=@vger.kernel.org
X-Gm-Message-State: APuU4Z8H+Xn8lU6x631hDpWHW4RUGrlap7xNLUUq7d47zbV8fZXP8oaw
	SPUZ4lJtOPOSl5VGpBNTpgDNUBuUQNd6EOuLwvl0xbI+R+x5pkKZbfjC/onyog1krA==
X-Gm-Gg: AYBFou2eP4XWdPubp1VFQlLhGA2rUxPIAmYZY2GFozVqcuceDPI51pORBvof/SgwQl7
	YmTopz2vy0BhYmAzkE5Wq7p5IddvqIUdZkJbVxwef/dwSqbAjcmKKj1xw8LjKzq/4RSrjtnUcmM
	UihTKNgonEwG6IhJ9jWqrYMq71dcjBssAwtHc/uhisoQE2V7WElU3AmYwPLBuriIYQx4K3q0z/X
	RV0ET15KeLKo2AFx+w6tNmN3CdKD6+paexPpgkKOxP1f9yGBqc21b0gSuiWJoXIKE8wSaACjK/I
	ddbsaHOyHJFKMThC26wgBUgJhYvsnuhCfvyuaQ1doyeIZb7kIFy/Ap/XnonOywhGAwOnFHHvEKv
	CQkVeqLXgd4FLKfqCBW0v1O0imV3HyJt6MHtJ8/29aqSOGMqQ7LkH1q83THnhKaz7+anekOW2GX
	AopqRA6dqsrg1m8p0FROeYLj1i3hY4DdGCmy7JqqZ+PtmP+AJlfHkYYlLwyWRXCQKtpdbxkigv2
	n2OqyP1U1kZFgHEthod39MjkZezeP/RjqbIZYiRV2qoOLGEhHTC9t7PVgfGgMzYuY35MToDCvy3
	LIk9KB3PBT+e/zdr7YT88FV4e2p1GVAZuqd/ONO+LaPTAc3tDe58eSN4dv83QRjw
X-Received: by 2002:a17:902:d60e:b0:2dd:ad73:c98b with SMTP id d9443c01a7336-2eb3644fa20mr96025995ad.35.1793645999714;
        Mon, 02 Nov 2026 10:59:59 -0800 (PST)
Received: from google.com (33.79.127.34.bc.googleusercontent.com. [34.127.79.33])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb392b15f0sm32087165ad.73.2026.11.02.10.59.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 10:59:58 -0800 (PST)
Date: Mon, 2 Nov 2026 18:59:55 +0000
From: David Matlack <dmatlack@google.com>
To: Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, Alex Williamson <alex@shazbot.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>
Subject: Re: [PATCH 3/3] KVM: selftests: Use VFIO selftests library to pick
 IOMMU mode in IRQ test
Message-ID: <aujdq2fsyt_xRGGV@google.com>
References: <20261029221710.1871112-1-dmatlack@google.com>
 <20261029221710.1871112-4-dmatlack@google.com>
 <auinpIEk6FdGwDS8@google.com>
 <auit0kVkAaWcNUvk@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <auit0kVkAaWcNUvk@google.com>

On 2026-11-02 07:35 AM, Sean Christopherson wrote:
> On Mon, Nov 02, 2026, Sean Christopherson wrote:
> > On Thu, Oct 29, 2026, David Matlack wrote:
> > >  static void help(const char *name)
> > >  {
> > >  	printf("Usage: %s [-a] [-d <segment:bus:device.function>] [-e] [-h] [-i nr_irqs] [-m] [-n] [-t iommu_type] [-v nr_vcpus] [-x]\n", name);
> > > @@ -266,8 +250,7 @@ int main(int argc, char **argv)
> > >  	}
> > >  
> > >  	if (device_bdf) {
> > > -		if (!iommu_type)
> > > -			iommu_type = probe_iommu_type();
> > > +		TEST_REQUIRE(iommu_mode_is_available(iommu_type));
> > 
> > This is very unhelpful when neither IOMMUFD nor VFIO is available, especially
> > why the user doesn't explicitly provide the desired mode:
> > 
> >   # ./irq_test -d 0000:6f:01.0 -i 10000
> >   Random seed: 0x79d386bd
> >   1..0 # SKIP - Requirement not met: iommu_mode_is_available(iommu_type)

Agreed, that is not very helpful. I've added a
iommu_mode_unavailable_msg() helper to libvfio, which returns the reason
a given mode (or any mode, if NULL) is not available. So irq_test would
have:

    __TEST_REQUIRE(iommu_mode_is_available(iommu_type), "%s",
               iommu_mode_unavailable_msg(iommu_type));

which gives:

  # ./irq_test -d 0000:01:00.0 -t iommufd
  1..0 # SKIP - IOMMU mode 'iommufd' is not available
  # ./irq_test -d 0000:01:00.0
  1..0 # SKIP - No IOMMU mode is available. Is VFIO (or IOMMUFD) loaded and enabled?

> Side topic, it would be nice if iommu_mode_lookup() printed out the known modes
> when this is hit:
> 
> 	VFIO_FAIL("Unrecognized IOMMU mode: %s\n", iommu_mode);

Will do in v2. And I will also use the same helper to print out the list
of known modes in irq_test -h.
