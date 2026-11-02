Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793643405;
	b=WpZG3E2bebjcM/xZu7o7ohxT04DzHNJ8uybXirhuzzQj2CkcQ97Yni2R9p3RFfbChSNU
	 M2IJHU3fuYqDCXldmp5awdkF2L5vZZQsFzsZrCSum7zhJxA+zfm22EP1DR0VrkEDQGtwF
	 EkB+9xuXfrHPo6gGxek2l8nBMoqhFovNy4MGHOTm+8ssXOaLOEofaFqiHN9JtCxzO4ZBm
	 Ii5MRQdZRZchE3X760qHq5P1LskejJ8U1Bj8abK4WX1zoWCyPlwd96/1ppSxYQWzrV9FM
	 0/zdoRgLeAl/lRPWCG0TPge2iaVXNsjtHb58GpALLwLi+0+/lvygf8O3DOO12mekwFg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793643405;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=Vr76CxOCRE/GBSNADyNpvIHyisaI2BQrg6w5s2zNVBI=;
	b=Cb8mFZSgOf34M1t3tKfK++k2IyC5yYsJOhdDoZUp1sxHo30DQskPZKHdjOuc+BBUniiM
	 5hrBN9xnIkM7Mt5yLDzTK6mVk04RVaN37tgFbmzzqaaC4mkw2KfSsVLaAeW1ffEFr90QW
	 o0pkv9BvwR5Z5LWs9YKMDMYhH1gRh5OqBLeos1MhpUMA3M5eaRKfVtx7eIwaubnRKMIcY
	 6pzTfAqIf8b+8P06/z7F7uwCWOCQQCvg77Z23ddfNwhdxk5ahfZeIBjxMFOLzg3+bB0zM
	 sIKa4KoHo4QBQnsliTBk8hfaIOVErufUmCY8593WSzQzGqOmcvLVIopAqSaz45qJQgQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=aCcvnadP;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=RBtItvv9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3FC8606A33C
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 18:16:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3FC8606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=aCcvnadP;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=RBtItvv9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793643403;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vr76CxOCRE/GBSNADyNpvIHyisaI2BQrg6w5s2zNVBI=;
	b=aCcvnadPYRygZFYXkYoYkvZM0ltqCwUvCJaK+J4DNxDtI2P4MgMSruBkMu3gHM4xsTxbxY
	iCy6LVECpm74FRdJFeLFJC0SasC1s+tk8+cWqoK/OsaESGGmDWRdYHNyyPQf/qttg7Cxxj
	RkFlx2KTj/ymJzVEGj8IJ+rD1TEP/B4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-589-s3iVzJVNMvS3aGHnZeyzMA-1; Mon, 02 Nov 2026 13:16:40 -0500
X-MC-Unique: s3iVzJVNMvS3aGHnZeyzMA-1
X-Mimecast-MFC-AGG-ID: s3iVzJVNMvS3aGHnZeyzMA_1793643399
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-48c46582442so2025572f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 10:16:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793643399; cv=none;
        d=google.com; s=arc-20260327;
        b=RJeu3C4hdZ6H9Gpw/AEf6Ww35ktEq9P8nttRRFHR13V9r1+e+/0FELzPcNgDqPfUdL
         nckJaa7WbAqe2N7aK+dx16QkbPD0Qz91ma+05O2q7ZLE++sT5aJYn7ppPzdu6Ziq90ht
         HcXp40oLVfzeMJ73YvOm7tOyqNnZFJmY5tQiM2vGnIuYaiYcDuhbLTRYgTjIV4v0M0tQ
         v6YX4DtqNw0lcnTV5V+8gpic6ALdeW51MEyxNHJkAXMhO8bl/F7VWqwbxUk5kiA++WNt
         3tEXy/qJBhgpRtUmNizSHBdXxdGRo3ooA5HpDnWyh7nz2/Y3xxUyb2qkGIYJPW12rd7x
         US9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Vr76CxOCRE/GBSNADyNpvIHyisaI2BQrg6w5s2zNVBI=;
        fh=Mvi51lcOIvwfheqTJUO/ppkDGZHCW79dmed89TbCnCw=;
        b=C53GtT64WdY7IwSFWgi3AVTRelPOKbb1uibwFg6qrrmHqDjiiBna0d/rAoqeSSFky2
         7KLVNgewG+Kgbs3eNnauI/xQr/OFCTjDC4Z1n1k730wVnRSJytG192olSZ3C/McrrDwA
         GZKXdYh+O+1ESRFCyoLX4cpMeEkdhL5FZ8A+lu/aRn1PUGBdbSw9NylyY1xLh8GlixrB
         kE+l+8+THjMtCgEftcR3hK+oyPiq0PAemMeOEx4UJJg2a5ECA5PiTtooGiQoDJWP2WkM
         kAlVXXw+utPyn4rle/+pCOsUINTauV4iSCMsAfNxH4irBitTYNhAzUsi4Y5IuErtqGEm
         5ANg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793643399; x=1794248199; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Vr76CxOCRE/GBSNADyNpvIHyisaI2BQrg6w5s2zNVBI=;
        b=RBtItvv9B31dT2u7K4qBo7ogPBqQBFRekOBj8c2AW1B8qU2YCNuRIjXmM1K8DsfXll
         lJYoOB4vePKBeQNejFV0l//LOLpiI8BuhWCtMoABEyhiwWuGXY0KVfomlq8Miz1B6eg2
         9DD7Sg08tmOMONPu9o17SRBvmkerPrUo+/j+Zo80Q5b8hekKMGtK/ioCm9nlT8ofQynJ
         kpQz56YhxC8SQvzBrPbX/GTJfjWi35GOpmH/LwWJ4zJRFeLPGwk8z5jx8RNovaPSfTVa
         pwyBqUhHgQoKyfpNGry1Mgf7F5y9xq4GVbLsQam4EsJ+/j5R+GuwHFGqt3vPcTofwCjV
         PRIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793643399; x=1794248199;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vr76CxOCRE/GBSNADyNpvIHyisaI2BQrg6w5s2zNVBI=;
        b=tTSB2iWstYAQXLR3V4z/mKuvPrRoy+G/IMKVVrfYFIk13CoG7j/rcs/PMHR0bzVnTR
         Zuholg5HgBW2ct82OuCTx5G4Se2VvhpHNTarL08SEsbD+i7Io9JGlyatn844wyWaRo6x
         F9nxP6F8mSTf3T6xWLtO38bWTXodjNDGBnHqvlhGnGo2letOMlY/m18TiusV9Ppkv/gF
         auyqtAllzR+vbCSBUvoeK46hRzapzs5VcJqYKrzfIRPc/hR0S3mPTQJL1R4ADZcnVrlb
         LG9gBqxfmsKm1GSJMqZYNX5JmIsegTCQfFd2F1wa9equ/KZOg3ASr3i6b/Iv9MskfaKG
         +xjQ==
X-Forwarded-Encrypted: i=1; AKwUvBxdz2PzmoysXglJHrSQZFuHlaRgELOci8sO0cVNWWu5NkSOrdO6Pe6kR5xXyrgidRT6flIxEXYCtok8rsg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+aBVeUiRPvoy8UWsMEP0R5S1pZgQ/Ma+wYAYG5EFQ74K33JDag
	n/HhaVI4o5f36r+X7FLMo+IQe0UbkaiVdyod5eKh0th5DFEOTMk49G5TJ8SLwnIw+4FWV97psOz
	V3gsRICAcBY2f1t6dlsvm9U1w4NsmxJZWubqVH1rlhYD6Bh8SR1stng8x7vk+D35CgTOlzLrUe7
	mtyR/iAfWWV65ZWzI2TI5JlSNADONuVal+JbuxneYq
X-Gm-Gg: AYBFou022Sj8Ecxj99wzn1wwBkiofkaqFr/fLoXAe42m0FvKCX8pq/Lgo++PGnGdowp
	JgVgV5ft2qe229lGP5ASq/Vpf7GrrEanDS0GIspNfF9s3iB2s+22vi4SKVZ3ncoMi/cnMJkb0Sm
	Y99OLSMrynYFeUc1xAUG9zvnKzB0WK4JF/myJ5YYDuDoQgXFhwvKDuvpPvv+zOWS6MYJmUmH72e
	HgCxsDuOeI/UWeNsKWr6IZ3jtdUutnZHFnq/aAbrscQa2mPaCS/sj5mrnlH
X-Received: by 2002:adf:e003:0:10b0:48d:ffa3:714 with SMTP id ffacd0b85a97d-48e6e2f2964mr20349189f8f.19.1793643399474;
        Mon, 02 Nov 2026 10:16:39 -0800 (PST)
X-Received: by 2002:adf:e003:0:10b0:48d:ffa3:714 with SMTP id
 ffacd0b85a97d-48e6e2f2964mr20349156f8f.19.1793643399087; Mon, 02 Nov 2026
 10:16:39 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <kuph5i8x2d0.fsf@vkuznets-thinkpadx1carbongen12.rmtcz.csb> <20261031090529.65240-1-amirmohammad.eftekhar@cispa.de>
In-Reply-To: <20261031090529.65240-1-amirmohammad.eftekhar@cispa.de>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 2 Nov 2026 19:16:27 +0100
X-Gm-Features: AclHuK_YXcxMZDa_2uVf-DOKYVLREH6PFG-uQQ0h0kF_GFc_0-Dn7EAhewjC8OI
Message-ID: <CABgObfYZde9RhwbPkq95uy6pNdyPFS48k9HvzCdGPggQ6reHSQ@mail.gmail.com>
Subject: Re: [PATCH v2] KVM: VMX: Add array_index_nospec() to evmcs_field_offset()
To: Amirmohammad Eftekhar <amirmohammad.eftekhar@cispa.de>
Cc: seanjc@google.com, vkuznets@redhat.com, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, amirmohammadeftekhar@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 31, 2026 at 10:05=E2=80=AFAM Amirmohammad Eftekhar
<amirmohammad.eftekhar@cispa.de> wrote:
>
> evmcs_field_offset() bounds-checks the guest-supplied field index against
> nr_evmcs_1_fields and then indexes vmcs_field_to_evmcs_1[] without an
> array_index_nospec() clamp, unlike its vmcs12 counterpart
> get_vmcs12_field_offset().
>
> A regular VMREAD instruction is allowed while an enlightened VMCS is acti=
ve
> since 6cbbaab60ff3 ("KVM: nVMX: Allow VMREAD when Enlightened VMCS is in
> use"), and it reaches evmcs_field_offset() with a guest-supplied field
> encoding. Because the index is not clamped, the guest may be able to
> speculatively access past the bound check and read out of bounds of
> vmcs_field_to_evmcs_1[] (Spectre v1). The leaked value is only the u16
> 'offset', so the exposure is limited.
>
> The other callers of evmcs_field_offset() are not under direct guest
> control, but the array_index_nospec() clamp does not hurt them.
>
> Clamp the index with array_index_nospec(), mirroring
> get_vmcs12_field_offset().
>
> Fixes: 6cbbaab60ff3 ("KVM: nVMX: Allow VMREAD when Enlightened VMCS is in=
 use")
> Signed-off-by: Amirmohammad Eftekhar <amirmohammad.eftekhar@cispa.de>
> ---

Queued, thanks.

Paolo

