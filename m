Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793005266;
	b=Fgo4/vu58I9WVEUePZceIIgcJ+oe0cFUH3dH9Gf3ORlFqm7vIpRJrB05DUFOhPyMX25G
	 NMWLinNCWuIpyBr+yd/iH64IriEZIJnuS2GOoyH5NXfgAu3Tf8Esn9ilHLtPkjbrKXvVB
	 OVItuIPeM5Wlrcdg1AdLsZOTJjRdpuADJqecjc+OWUPJQsKjkU8UwpbyeNbavRogyzZo3
	 68/OgyuvQej3+xbm3aajWB3keb8qSsXSpovBCcr+Z1QCrR9V/pUtnmiNf6PNqCOznz0oq
	 uXfJSHFd4o/Q9aKZUKu5DJN9jxpMllVPlLsfDBU9lvO5X9p47cHNXw4SUaq8IdTHDkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793005266;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:In-Reply-To:References:Date:
	 Message-ID:MIME-Version:Content-Type;
	bh=BIokrW6dBSe7+DSoMXOn3ohQYcJwX5c+NY7lmM9Zk94=;
	b=NBWrQA/wc06pLxzkMiu+aCJEzBpsUgv/EmDRca3/4bB2j269N9leMd+MOPUwVmpZJBj8
	 ndJYl7TR3LSUR/QpRWcQzaaDekwrS3YuqT/5NtxecxOxAB7DiBiyuSA79F30/nBWnc6gp
	 jE/ijtTBECBDuG6mjDYChk7Z4Fkf7gCEUMOFjahYF7P4zmuY6dSMAYT+1VSPTd0/aAMAa
	 mkzk4DfZ8qErka51HUMHMm1dgduxVjU0fmynVAcxHfN3VFatnd46B/+qsO+uNN1As6MxE
	 zmi/dcgz4MnHllVoiqpFsubcKgVUIp8D/ZWLGfFCvRafap+TVjy+jpDsLufN4d8APXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZevZ2URH;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=ogcP2P5a;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68474606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:01:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68474606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZevZ2URH;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=ogcP2P5a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793005265;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BIokrW6dBSe7+DSoMXOn3ohQYcJwX5c+NY7lmM9Zk94=;
	b=ZevZ2URHWzeRLKdH6xX2QsIUL7Fbn7EdFVVlNnZAWVFR3CXc93WpIubDijrsMSZPFhLQaB
	MNnOw3UWyyWLcqs2Yd7RukPyNZPuLVU61uNa8jBKH/svyLjKB11LI688rnkeoqMvu9B9/4
	gLRfF24rzgi85FCVlxwemqAlY0DoLEE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-428-6yR2cZG3Mn6ggJB5bn6K4w-1; Mon, 26 Oct 2026 05:01:03 -0400
X-MC-Unique: 6yR2cZG3Mn6ggJB5bn6K4w-1
X-Mimecast-MFC-AGG-ID: 6yR2cZG3Mn6ggJB5bn6K4w_1793005262
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-48af4046a3bso2874010f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 02:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793005262; x=1793610062; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BIokrW6dBSe7+DSoMXOn3ohQYcJwX5c+NY7lmM9Zk94=;
        b=ogcP2P5aqyPujJBU2hJgK3UilGfbNv+9mRXw9pUmDl1VN2LZ7ty0IXMevGRWCXCPVh
         mjvnV1BBdSG0bXq2u2HxbKxOdRKs/B4EAcOuLwPGCptAJCLbW9fKAziyLeyum7nquE2o
         yziEmiORpgvrGn+EZVzXFtHoARlvpKpY+YzZGJq0Sw1oYwQbMsrnzPj2qwK3dUNbh+t4
         R5naHS6ryLgxYa6r9dS39p8OXRkkpkXGIL0aXiBNr+kPK3sfVqHh1J+o0W1J9khio/TL
         vF9kNPbY5Fcr0eLry2VpGA6ohI+SmxHqnKvcSaDF/AwGS8tBQBvQoYgLPTHUR3+0CaRy
         cAmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793005262; x=1793610062;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BIokrW6dBSe7+DSoMXOn3ohQYcJwX5c+NY7lmM9Zk94=;
        b=n4LM0KMOSeM0wDRW6xj4G/kCb+CqlQUQx7VguUdrnH8O3Wh+nVqql3Wx1MUGafWOFy
         JYrhXrZyCirTx+p4o4H5TKiqioxtdg7+PdIrd+6DpWilO3cKW7ABmBQUPUml/gFORPw8
         7mbl4bBB6P2ki+z4hjG5LMdlQkdo7bke1rCh8do70Fe6ezAuY/zy1C3LMxO1NJx8jtOO
         8PDeI60gt7N54PMgLOSzjoyyPw8iFIJe25i2Cy7pegSGyZxRZTrm4/PK+Fd30UsfDHtc
         3sS5r+VLUF62/Ipgafd977GX5eRlIsahU0Wkqmx+ZiP8k/eZ+IENA2N+M9b7vLFSc3Rz
         G2RA==
X-Forwarded-Encrypted: i=1; AKwUvBwPWRDS7piyMcswbqdTcT+6lSeYJ106fGGB4QLyXByA2mpCeOp2sNRl5+/LNq3DF9M3QxjS9vXS7E3UgR4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKdsoU3L1M4Zq4JWCnRfEQOh9QdA/UmZR4NUuKB8yLAdXZGeAS8
	sokJEaG/+Q0JObDOexnDRQdXNj6peTCqb/BGYdmoobYMGP3xNS1JjIrZ3umJY94PA0f/KKY275A
	dzTQcffwz0bu/M02oV1OCPcCKC7lU9zuwGWK1ROYkbBQHLlKNhBkvrq5/psxsxkPS1su9cPP6Tw
	==
X-Gm-Gg: AYBFou0EqJpHTy2RI5Rmo5nQo7tUjgP72c98wfx3etlSsI8G/HJWf93Kigq4P/XnvjQ
	pEKBOE6lnrHICFUVKWXdhzi5UsXQe60Q0tItvcD1PXOfUGBhd63GynvcRPDZ01TbpctErdirIRU
	VvPoy+m/9oq1ha36NzL7GfqEDRNA38bOZYTysFP0AkhdU7uLFaq8qw7o48HE4Avt8qNYjDe7sz8
	giJl9bpPAwaQR79znkgMC+kUiRFgX82XoLYBjBu5rqlobmatFgxJaj3S8oBucRl0N/fSdZtXLC1
	9oILUo0FzexdAjUScwe7xWIAs2X0FVdm/vx9BEeiNEcsQ2lotc16cjsRa/UWDWFUeQLq2N5ZUIs
	/eD5bY58Fln8rHHIUI/3tRgsBkDA=
X-Received: by 2002:a05:6000:4011:b0:48e:37e:470f with SMTP id ffacd0b85a97d-48e3ebb84bcmr13704585f8f.51.1793005262091;
        Mon, 26 Oct 2026 02:01:02 -0700 (PDT)
X-Received: by 2002:a05:6000:4011:b0:48e:37e:470f with SMTP id ffacd0b85a97d-48e3ebb84bcmr13704486f8f.51.1793005261390;
        Mon, 26 Oct 2026 02:01:01 -0700 (PDT)
Received: from vkuznets-thinkpadx1carbongen12.rmtcz.csb (g3.ign.cz. [91.219.240.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebd4bc5sm14925277f8f.34.2026.10.26.02.01.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 02:01:00 -0700 (PDT)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Amirmohammad Eftekhar <amirmohammad.eftekhar@cispa.de>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, seanjc@google.com,
 pbonzini@redhat.com
Subject: Re: [PATCH] KVM: VMX: Add array_index_nospec() to evmcs_field_offset()
In-Reply-To: <20261017093016.32348-3-amirmohammad.eftekhar@cispa.de>
References: <20261017093016.32348-3-amirmohammad.eftekhar@cispa.de>
Date: Mon, 26 Oct 2026 10:00:59 +0100
Message-ID: <kuph5i8x2d0.fsf@vkuznets-thinkpadx1carbongen12.rmtcz.csb>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

Amirmohammad Eftekhar <amirmohammad.eftekhar@cispa.de> writes:

> evmcs_field_offset() bounds-checks the guest-supplied field index against
> nr_evmcs_1_fields and then indexes vmcs_field_to_evmcs_1[] without an
> array_index_nospec() clamp, unlike its vmcs12 counterpart
> get_vmcs12_field_offset().  An enlightened VMREAD/VMWRITE from the guest
> can therefore speculatively read out of bounds of vmcs_field_to_evmcs_1[]
> past the bound check (Spectre v1).

I think your concern is valid but the changelog requires massaging.

"enlightened VMREAD/VMWRITE" is basically the guest doing just memory
read/write and we can't do much about it. These reads/writes don't trap
to KVM. What the guest can actually do, is try executing 'normal'
VMREAD/VMWRITE instructions.

Note, Hyper-V TLFS states that

"Any VMREAD or VMWRITE instructions while an enlightened VMCS is active
is unsupported and can result in unexpected behavior."

and our initial implementation was completely forbidding
both. Unfortunately, it turned out that Windows itself does not comply
and does occasional VMREADs, see 6cbbaab60ff3 ("KVM: nVMX: Allow VMREAD
when Enlightened VMCS is in use"). I think you need to add corresponding
Fixes: tag.

My understanding is that VMWRITEs are still completely forbidden while
eVMCS is active. So I think you need to say something like

"""
Regular VMREAD instruction is allowed when eVMCS is active since
6cbbaab60ff3 ("KVM: nVMX: Allow VMREAD when Enlightened VMCS is in use")
but unlike get_vmcs12_field_offset() evmcs_field_offset() does not clamp
the index and thus the guest may be able to speculatively access
hypervisor's memory.
"""
Note, 'offset' is short and thus the exposure is somewhat limited.

Other pathes using evmcs_field_offset() should not be under the direct
guest control but array_index_nospec() should not hurt.

>
> Clamp the index with array_index_nospec(), mirroring
> get_vmcs12_field_offset().
>
> Signed-off-by: Amirmohammad Eftekhar <amirmohammad.eftekhar@cispa.de>
> ---
>  arch/x86/kvm/vmx/hyperv_evmcs.h | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/x86/kvm/vmx/hyperv_evmcs.h b/arch/x86/kvm/vmx/hyperv_evmcs.h
> index bc08fe405..052b62b8e 100644
> --- a/arch/x86/kvm/vmx/hyperv_evmcs.h
> +++ b/arch/x86/kvm/vmx/hyperv_evmcs.h
> @@ -136,6 +136,8 @@ static __always_inline int evmcs_field_offset(unsigned long field,
>  	if (unlikely(index >= nr_evmcs_1_fields))
>  		return -ENOENT;
>  
> +	index = array_index_nospec(index, nr_evmcs_1_fields);
> +
>  	evmcs_field = &vmcs_field_to_evmcs_1[index];
>  
>  	/*

-- 
Vitaly

