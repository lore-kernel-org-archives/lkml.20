Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 371AE19046E
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 23:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787958061; cv=pass; b=lz8ayDJAAwR51NN4l0PNtEECs6xkaGJZJgSdmBlKEr99TB3qm//ipQrVsy5vEpypoyk+ZM5qFEZwWkod+aUCDXsz529oQprI9LD0UgbKnALvJHGOGSNVrWANIbgtJDzwbjxVYYMhMuf2nU9NOEERdsnkHNzzMLJuKsRuEvbzyzA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787958061; c=relaxed/simple;
	bh=6T0r+7hZ2bdIBBi+tmMfu3lgh+SjUf2cA/8NWF9EmJY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AjOprG8knMgGGr0oY1OczLYkdUOQR5auJcEE9204IbyhCypFhvo9nlyKdfsHRjR5dq2BAZnCbjSmtr4elmwfO2v2XBOe7Ef9vVmrBiRhB4Gk74uEZm2b12CVPvFaJ997VeIhBi28/BKEdsGjUOCeQyo3EWgjpnXHT8jNKmio+cg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rfs+XXKA; arc=pass smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rfs+XXKA"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-51c01c79467so94481cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 16:00:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787958058; cv=none;
        d=google.com; s=arc-20260327;
        b=hUh7eki66X4thFzzU7nFqsy/k5MeXO8VJCFMF/jE/+dXFSFyJPV8LmKNYSd3pCLGdW
         MciP9MvN4HB0QxUW5/6/PXOR+0h7mcf8iDD0MtrE2KNOt9dIDvU+xjznUabDAP7m5AwY
         xEWKU/pTboixq9uLHxTR3QfJmFumw5CGCOXTVRESsuQmQEw22W7Ncuy2KLVNnyeqaR0m
         LPkU0uEP8GRGIzHyh4o/TxMwOC+mwprN3s1lYuvGvso9KYhmLiWnhldIcEaqzEcyz2MD
         V5aU0iF3KsqNYPPmjDvofQ0FcQsaWMgMcneZ/4RMcXKZe83HazBCkjp16+4QD/80tMGU
         QjFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6T0r+7hZ2bdIBBi+tmMfu3lgh+SjUf2cA/8NWF9EmJY=;
        fh=/mVkW3gq/vimXyv0t917vmBS3UfIwt2I5jlO4Y/v2t0=;
        b=NgUwRsf6YdxYTDg2XK8I1+keGSwKElqP35z6sEXi3/GfTz4WR7/+ul+6eXJufCXCfr
         /e7R1ugFJ3ajF4h2eF7Z1MTRP1cWXy5r6fEzKNDSn6vZAf0hbnIGt0ewCqqDVLB4Sfi/
         k9g2o8xC6TrnM9UXGJhN/5FWWeHTLOHqkyoCftN4eZiCRuwhbRdR2XnB6S7+wnp6nGEg
         RzBqdBi26f5UPpHhIlefYMKB7fiMXdpopqOzr7qxygvz7aogFnPYRhOVbtwm1nmhe/dD
         Y7gbF9TFLJVj1Hl6I5z++Sfcp7r3xAbKLNkFQFVmbqRuJ6hdjcAGF5C9dJdpT6X8rLrR
         kYvw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787958058; x=1788562858; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6T0r+7hZ2bdIBBi+tmMfu3lgh+SjUf2cA/8NWF9EmJY=;
        b=rfs+XXKAV3nWEbM+vRBU0MVTbjX//gooTwM+sXJ3KwGiCeZb8hl6ST3wuMbNGGl9Sq
         3cFqWWyNtdXwSyZlxiwCFkdmO7gWn818xZHXKC3Z9fYXUfUXt4AHwc1ZIAP6xYiBUFIB
         QKwMc/3zHN7f62gqroG3T9/GIvStH4OaEaf5W5r9xX28JkHoB3mQGretzVbD0W5xUsoy
         TGRXQXMDqk1FQ4BgVOYmLOHmGa9dhIAgkrprqd/0xvY1S1tZmPJdG6B/33Mh01TDfIRt
         H3Kx1SpXyHqeQxqHnO2S9GBycdbmYCQUSXYmWa2B0wL1mDmcG/3FqnVSzbVJ93LogpPa
         L9Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787958058; x=1788562858;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6T0r+7hZ2bdIBBi+tmMfu3lgh+SjUf2cA/8NWF9EmJY=;
        b=gF+PHGHbdlP3vdtdlduoHU7TsGdjcZZB+m8ZmKQl9kZfKF1032ZVwH8g42pZYE46zu
         IIrMaxabdlBsH36vwYMN/sozKIqsgJ6wvzSCT/DdPNi/lxPKCsAxRzo+MEU8W3YFIWQf
         HkM5RNNPf9dsAf09rUEu6KKdlb+G2n++pRj66FvbQztlKK5sDvVyYrinipCrfMmsVgXD
         YRWgLqwUDUegvuQRUJE5Bb6lsBFg/Xn7EFkp7xd1u/JOl9q1NcattOxP2IyjWyBx4+t2
         oG2cgDCQpnVFzIdjpRLYjkmVVAJNXXEkCSkrvcY8PJz8E1uFJ/XpWU7Q3IERyGDw3lPl
         AQ1Q==
X-Forwarded-Encrypted: i=1; AHgh+RoSfliEzHuIBepZ9AFaQ2SDpDowtY9mcVVMQkAsZryLfc3jPB3jAU3jPPVQr+GYKU6dqssbUa2Jb/24T6g=@vger.kernel.org
X-Gm-Message-State: AFuF++lvHccKRUvRH/MspIpFxGP/ak3n1RgJhw/FtWrvMpR7bD/mU/Wz
	qEr+Xb6Q8JO9ssmfaLpO/zq8Gd04fSx/QQYPQIRW/7OlJTCcCu2gNQWntua2kwfsxuSmsMiQMm6
	A1B/6hC3P0kuy2FMK8J1lfdcwUwhbD23N+f9/Dx+f
X-Gm-Gg: AR+sD10OiqT9/fOFW45+Tt3Uxn9H7mgUQ9z83RTnDSizqnCk6+MAhUS36xcIuCCPUWK
	drb+MiOQV/9s53FCK/+oLg9BV/O4PtS4MAoTkvnsRA3REStMSGYplD1UGx57hCiSg0P5kGnuW97
	wclZwuVHOz/clu39bCyUGqM9qqd4birgkTx9T4+zfNzgkuxWE284BE5MOPhojRlnAoatn3CKKAH
	oJFkNXbDYne2tXNbHItLnk3td3qX6zsZXQW4qymWf9D3P3Pvw25p7MJTi4WFvOjKRZHjH1v4UuD
	h+Q+FjTNGoSyi/GVM2xD5MyniR7nsNjNAqc9B1bZgoKZr4r8Ep/8pJ+ko7ZpU2si4F3ZiPeUuBo
	=
X-Received: by 2002:a05:622a:e3d1:10b0:51b:ff0a:2048 with SMTP id
 d75a77b69052e-52ff716ce29mr3942111cf.3.1787958057424; Fri, 28 Aug 2026
 16:00:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260806020850.1221381-1-rick.p.edgecombe@intel.com> <20260806020850.1221381-12-rick.p.edgecombe@intel.com>
In-Reply-To: <20260806020850.1221381-12-rick.p.edgecombe@intel.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Fri, 28 Aug 2026 16:00:46 -0700
X-Gm-Features: AcwNN1X97irb4_j1CgiMkl1NpgrTMyQT9MylOIwj136cEwhgsDcXkqEaEWN4fto
Message-ID: <CAGtprH8-7_C_CQhKUj816oYyEH_RBPMCu+yPQwhvoAkSkWXapg@mail.gmail.com>
Subject: Re: [PATCH v9 11/11] x86/virt/tdx: Optimize tdx_pamt_get/put()
To: Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: bp@alien8.de, dave.hansen@intel.com, hpa@zytor.com, kas@kernel.org, 
	kvm@vger.kernel.org, linux-coco@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, mingo@redhat.com, nik.borisov@suse.com, 
	pbonzini@redhat.com, seanjc@google.com, tglx@kernel.org, x86@kernel.org, 
	chao.gao@intel.com, yan.y.zhao@intel.com, kai.huang@intel.com, 
	tony.lindgren@linux.intel.com, binbin.wu@intel.com, sohil.mehta@intel.com, 
	Hongyu Ning <hongyu.ning@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 5, 2026 at 7:09=E2=80=AFPM Rick Edgecombe
<rick.p.edgecombe@intel.com> wrote:
>
> From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
>
> The Dynamic PAMT get/put helpers use a global spinlock to serialize all
> refcount updates and SEAMCALL invocations. This gives correct behavior fo=
r
> concurrent callers, but leads to contention. It is especially bad from th=
e
> KVM side, which is designed to allow faulting in EPT under a shared lock.
> With the global spinlock, not only is the lock an exclusive one, but it i=
s
> for all TDs instead of just a single one.
>
> But taking the global lock each time is actually unnecessary. Only the 0-=
>1
> and 1->0 refcount transitions actually need the lock (to pair with
> SEAMCALLs that actually add and remove with the Dynamic PAMT pages). The
> common case of incrementing or decrementing a non-zero refcount can be
> done locklessly.
>
> So create a fast and slow path. Check the refcount outside the lock and
> only take it for the slow path (0->1 and 1->0 transitions).
>
> On the put side make the refcount adjustment and lock taking atomic so if
> a 'get' happens between them, it doesn't cause the Dynamic PAMT to be
> freed incorrectly. On the get side there is no technique for doing the
> refcount adjustment and lock atomically, so check the refcount again
> inside the lock.
>
> AI was used under supervision to collect/apply feedback, review code and
> workshop logs. It assisted in identifying/evaluating the stale
> conditionals for the races resolved from the atomic_dec_and_lock() change=
.
> Separate from atomic_dec_and_lock() fallout, it suggested to change
> atomic_inc() to atomic_set(pamt_refcount, 1) in the put error path for th=
e
> sake of being more precise, which Kiryl had also suggested in the past.
> The model also suggested updated comments following the
> atomic_dec_and_lock() change based on some directed prompting. The
> comments were subsequently edited or further prompted for fine tuning.
>
> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> Co-developed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> Tested-by: Hongyu Ning <hongyu.ning@linux.intel.com>
> Reviewed-by: Chao Gao <chao.gao@intel.com>
> Reviewed-by: Tony Lindgren <tony.lindgren@linux.intel.com>
> Reviewed-by: Nikolay Borisov <nik.borisov@suse.com>
> Acked-by: Sohil Mehta <sohil.mehta@intel.com>
> ---

Reviewed-by: Vishal Annapurve <vannapurve@google.com>
