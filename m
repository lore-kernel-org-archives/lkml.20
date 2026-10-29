Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793293128;
	b=web3sZo1x8yx1CgnQMSkMFfp7JWZnr05eUhBX5KO7UOO5WB2LXdE2e9IrHC0bxMWRBSe
	 NIcitaDmZ2zrgTFVqqv6DkgT8MmOSyGCqUKW6+9pHGtq6cK2fwstzWbmfhu1rPrjLVo6c
	 YK7SjUrBbNR7H2JbLS3If4TK7IS/KNMeUdCzicH4u7WP2+TyEQwnTuVfPIpChFsK/QT9j
	 AnQ/TwhAtT5KCiGF8DJKpIKGz30wDQPMzsCCZIbgEMiRi31qA+SX4s4KAYS22JPSU8JpA
	 sCKSALTigq7eCJVH+Ml4CEerckNvTNzXeT0SPdonWYGoSq8QAp0lfqmv67FIAlaM9og==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793293128;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=6bXwD83MIjcipNSA+r7WlJ6caQoTXebpCKMfW1alQus=;
	b=bNzE+Exz7OM2luCSQduh+ax5nAS65OuDInE3nQb1xsGyXxu6Ce7MtEeLRsP2XZFRUTNi
	 3w8+ps6/HNyAuk96snkRrG2mg/NU9me48y7FVsUe8mgdT733rUFOAkpe8o6Wb35RWujK8
	 Yvw4mAC9SA+sTriJ/7p5XC/AusTyRg+JNR5XQkK0y6XD0FtiMuCH2QRwVxpUoDP1Au8IV
	 GsDVLvpoUG8ZAA77M0ZBfxBXbdq/nmCwME/g2jk6HdkLaZrfoQDaW55LhdWFnLBPUmslU
	 OIsekt9LyHcMp3yRXYvd0ZFaT0chicDsRu62s0WXKMYvonJjPx+63abDQIX5Rr9iblA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b="bD+Ng8/3";
	arc=none smtp.remote-ip=209.85.219.52
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA836606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 16:58:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA836606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=bD+Ng8/3
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-917aca1aee5so29975706d6.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1793293127; x=1793897927; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6bXwD83MIjcipNSA+r7WlJ6caQoTXebpCKMfW1alQus=;
        b=bD+Ng8/3nCI/5cWKn4WtKDSPWVPk5hBHIuiXrkbElN6K0EOo4e5w1LTNRGXFCd00f3
         Jwfuew8Cj4qAcC63JhH+tGRH1YbHRvVxo6YW9k0/RoNCcXvNHdO3fsL+p7srQoYK9gCP
         dfIog/jvfA00buTc5IwNKM0mn0X83lr8anz+4kAo53fSHXwsNNNdjWFm0piYuWrBYoZT
         NEyIp44fVuFUY+ogZEPcdT044X6lvUV5KwJmKj0lUb1J7R9YDLAK8t4ELBxxSsUNCqeo
         tOzcJKDGtISKyS59KFnafl4w5KnGawAuTFyuO966T/FFgj03i6Xr3IlIcSNbesHZFjI3
         lwSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793293127; x=1793897927;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6bXwD83MIjcipNSA+r7WlJ6caQoTXebpCKMfW1alQus=;
        b=J7Xb9vKBi15lrJgh7xsWTYgMu3PDmpvj7r7xnpeax3F8muQ4w965G3x4fe3noTfIcB
         IAn9CBQ4tS8syl7g/xsaFFtzW7kTe4R3vpf4NPA7EJ7FnHCd5nQJ7TAiONFVbAQmexS+
         c25oE3BmA/5tzfiV1Y5WzNf4s+6wYT2/ln2QY5gj/di7UgEzGJwcIcoSGzr5mfSnbTz6
         /Dtv9c9hKzikLUZ7dHAjcTw+sFxKizBP6x2WSeHsLqUUDoCzCI/19G9gFnBOsOa4uWNu
         /PBsmKp9/0N21KXwtmqXzVc6SA8w5AAeDhayMP3Q0nKN8nSbGydShoBxn3/HLvH99JmP
         94Yg==
X-Forwarded-Encrypted: i=1; AKwUvBwNo6DuWD8mo1F4h80++QDe9rH/iKrkpDFSWh15iVMVy7LMbCR7InrqCaUarugWurBA9apW7+GZN/qWDg8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLjMv0tPw2pLbdqUeo+o1Qbfv+/hYDxZdyIfD+cnKI7zjz04QKO
	p/l6TrGwcUANxvnKCztFbdpm4jMdmqA7j3ZXcuw6oySMXBw0/oocdYFwkMVnHKtOR7U=
X-Gm-Gg: AYBFou3ZhiFmeZaL4QuVlv6r29QeYOaDs9ajjT6FYtsYugmVkcfs7CRXfOyTyV0+cAD
	j4DEtadAEo9HTrPPnbn3zmxVX/Pe5kW+r1ABgudfS0/nTNmfKSji62m6n7DY8CWLKkw4YOy4ILi
	LBLKfm80hsXLQt/6I6FVp9FyG6IjhHxll8awYRsL+TQhxHIHDoF4YSOh7uhbdarI+HwPBvGNp/i
	H1W4k6wsqlA6RFyDXQETE/SAHun/C+3urMCuGacWS6RZOUiNH1+G+yTRUdPmVbG7q3UY82fq+ze
	iQLEWOAR328rkiZRjJoBh4hIinKu1oz1O6n3OVSfmAOkMZMpk1vytAE+StC2lkf5kgJA6HaXw94
	uBeum3AmSvItaDN/fzS0Em9izlkL35ydISXoVBopwBuMBJvICETGJwMy1kelQ0BcbMC7jjbBMnG
	7Jc6QHatFP2GPjp7GBRFaGIHUJEQq0P++AG3Rc87N0+NaVFPeAJRTsh4sg18eyqkpjjU0zhstra
	YyqtIBw5LEYA+cpDUNqAXZeiy0pUEeRD/l9Os8l9HL3W7o3Bf4woK8kiIQTju4SDLPxz2SZTzWw
	4/v/HtbOzydfOH89XEAX4ROhWk1N/+wHeEAnpNeBlC9Qc1OkzRsC6toEuKGtVF1xx4hO4UaCVHJ
	l0ouLcC8PKdK6/e7iwfm1ZnBKNMat/pBI
X-Received: by 2002:a05:620a:298c:b0:93f:38c7:70f4 with SMTP id af79cd13be357-94408aa100cmr927645385a.26.1793293126718;
        Thu, 29 Oct 2026 09:58:46 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-944209818c7sm8131885a.3.2026.10.29.09.58.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 09:58:46 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xMTSf-0000000G2uI-1sK7;
	Thu, 29 Oct 2026 13:58:45 -0300
Date: Thu, 29 Oct 2026 13:58:45 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Cc: alex@shazbot.org, pbonzini@redhat.com, seanjc@google.com,
	bhelgaas@google.com, jjohnson@kernel.org, johannes@sipsolutions.net,
	mani@kernel.org, lpieralisi@kernel.org, kwilczynski@kernel.org,
	robh@kernel.org, vkuznets@redhat.com, kevin.tian@intel.com,
	linux-pci@vger.kernel.org, kvm@vger.kernel.org,
	linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
	ath12k@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/8] KVM: add PCI MSI hypercall for VFIO passthrough
Message-ID: <20261029165845.GQ1685504@ziepe.ca>
References: <20261029163713.1366077-1-jtornosm@redhat.com>
 <20261029163713.1366077-3-jtornosm@redhat.com>
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
In-Reply-To: <20261029163713.1366077-3-jtornosm@redhat.com>

On Thu, Oct 29, 2026 at 05:37:07PM +0100, Jose Ignacio Tornos Martinez wrote:
> Some PCI devices (e.g. Qualcomm WiFi adapters) have firmware that
> programs MSI addresses directly into device BAR registers, bypassing
> the standard PCI config MSI path. When these devices are passed
> through to VMs via VFIO, the firmware programs the guest virtual MSI
> address instead of the host physical IRTE address, causing DMAR faults
> and non-functional interrupts.
> 
> Add a KVM hypercall (KVM_HC_PCI_MSI_ALLOC) that allows a guest to
> request the host's physical MSI address/data for a VFIO-assigned PCI
> device. The hypercall is dispatched from the x86 hypercall handler to
> a VFIO backend that:
> 
> 1. Finds the host PCI device matching the guest's vendor:device ID
>    using vfio_file_find_pci_device() (introduced in a previous patch)
> 2. Reads the host MSI address/data from the device's msi_desc or
>    by walking the IRQ domain compose chain
> 3. Returns the result to the guest via a GPA response buffer

This is not quite what I suggested, this still relies on the host
setting up the msi using the trapped MSI emulation, which is the
primary hack..

Was it too hard to make this an 'allocate msi' operation?

> The VFIO handler is connected to the KVM instance via a function
> pointer (pci_msi_alloc) in struct kvm, set when the VFIO device is
> created and cleared on release. This avoids a hard dependency between
> KVM and VFIO subsystems.

I feel like VFIO shouldn't be involved here, for the purpose of MSI
all we need is to inform KVM what struct pci_device * is at a vBDF and
then KVM can do the interrupt bits. Maybe this is already happening?

> +	case KVM_HC_PCI_MSI_ALLOC: {
> +		struct msi_msg msg = {};
> +		struct {
> +			u32 address_lo;
> +			u32 address_hi;
> +			u32 data;
> +			u32 reserved;
> +		} resp;
> +
> +		if (vcpu->kvm->pci_msi_alloc == NULL) {
> +			ret = -KVM_ENOSYS;
> +			break;
> +		}

Yet here it is called alloc?

Nothing should use vendor/device ID either, it should all be drive on
vBDF.

> +	irq = pci_irq_vector(pdev, vector);
> +	if (irq <= 0) {
> +		memset(msg, 0, sizeof(*msg));
> +		return 0;
> +	}
> +
> +	irqd = irq_get_irq_data(irq);
> +	if (!irqd) {
> +		memset(msg, 0, sizeof(*msg));
> +		return 0;
> +	}
> +
> +	desc = irq_get_msi_desc(irq);
> +	if (desc) {
> +		*msg = desc->msg;

And this isn't alloc, it is some query..

I think kvm maintainers would insist on a complete API here if this is
the direction.

I probably would not have selected this, it is why I suggested
virtio-msi or something that could be optional and seperate from the
core KVM guest ABI.

But maybe there is interest in doing it this way?

Jason
