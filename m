Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FC634FB9AA
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 15:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788536254; cv=pass; b=OURPkF8OMP/SQE5rS+bIV45vASk36eXfFiq6iZtsyvDsb+iE/UvSoYE9FBY+Mt6ceWdTN6wjqOv78YK9fA8d4b43lDmiurmrQo/WaUWXw53+w9e3baj2yNxJ1XW/Cc/Cm4f2mX1bc6s8tvT4Tpl+3n2NMa8jpIJZkF2+s5KBi5g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788536254; c=relaxed/simple;
	bh=sCBkffF/x+6ivWSUBWyD8pLivoWQ//A01/hYzFbxjrI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ovAPH+mlEE8J1tsHpOam8sAfDHoKB5vOqBadHCErRY52Gt/pxa9O8VxzehNmVj3A7uAheUbVr+zojwcVqxgOfGp8+SqlceCc2bakzHpJYlV/VIT8SLOc39Dy2IYlvnJ1xQTJ6DF9DP1zwK77cGsWiZhEG42fKycdAtNLpKBXHCc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=O6ztyx5H; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Q3F9mXBH; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="O6ztyx5H";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Q3F9mXBH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788536251;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rrK07pcEfzHDfc8s9dAeUAxX5iBfU+4JJI3XH4xHwd4=;
	b=O6ztyx5HTPlGBvNEiQ+PGyYnXbg+D8RJgzUuc1Aitw0+MEtMFyTXg968OBcuIMyjBSkmRP
	T8+xMh+scCWtfKAIKNkqxjCfjJOQjG9LpOEPeds7jxq7UCI0X0qBXswJqloJYuORmdb5Gz
	U2d6QXowb2Fn0Z86K1AJDS7WiPStk2w=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-355-LwNgARxrNYij636ds9nBdA-1; Fri, 04 Sep 2026 11:37:29 -0400
X-MC-Unique: LwNgARxrNYij636ds9nBdA-1
X-Mimecast-MFC-AGG-ID: LwNgARxrNYij636ds9nBdA_1788536249
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-47f6d70223dso784221f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 08:37:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788536249; cv=none;
        d=google.com; s=arc-20260327;
        b=VeEbTsbp3W7Bp4Jy7dns+GSqG63PNJCQBaPdYbABbk3yM+uUjF9iBZBsGKGgpNjqsH
         Y7SsviRfxLxJbfkvdjsotkNbqNE93SlFw9wgjW4NeSO47o+n2kONsvYtHzVkG1cRvPto
         2DZ5qKGXHGdW9K5VAVVhpJFS7XogirhAKxLKtyiSpihj1JvvQx4ybdF+iA2ZPeADIvHN
         t6IZmO6GVC8mRGQJsBEnCpXWvIfYsok+ydR9dUaGOnXb/rcXjN48e7+FjBbCrlPV7aqf
         lchKBFW6wolm2uiJ4zbqMHyRdg8dZlj7qDaJTxAIeJ1gW9RRXt0W6FJ0RBpcc1FqlaNt
         i7AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rrK07pcEfzHDfc8s9dAeUAxX5iBfU+4JJI3XH4xHwd4=;
        fh=s08cF+Mi5foFyoWQ2jWuKQzEE0z+5BnV6P45OTTEBUg=;
        b=EZI7adHmHU+Ce5QlTsGVHOOdOKwHmXtYUd+C0aUCPS2cAptWzZ6sCt0RSCVPO9EFAB
         K9o4Mi+YxqXOZ9gxbAqDTKSEsAkUBqapBTkIpp/6H9e+nPZOJYAK2ZN8APVPD49oXiXI
         8s0iFn6R93HqA40oZdqFKDHajNZr73Nhmjak4Z2754oTfyNwE+21opv3ZTOZOCKGl26x
         1EyMVH2i43Ac2e7E2Q68T7MmWDG53E05E45EricLJn7OInp8y6KfNzxpZvtTNzF/A7PA
         ise97mRWbj/Y1Z+wZv/QrytBJZvUtwm9EdzckJWoJMWZwtY4lGKP4jRVt7igefhaKEjG
         r1MA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788536249; x=1789141049; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rrK07pcEfzHDfc8s9dAeUAxX5iBfU+4JJI3XH4xHwd4=;
        b=Q3F9mXBHQI84Z0lEFVrKDYM5Ioi0wuV0qRWfyIXbhlkg58Ko6c/0ovE3P9z4iqJerh
         xFhIkhXUP7TCschRrZu2tolVKoAl2gUEfdAS5YaKIxHFvVSTniB2CIsP+SfRLVcEiKwx
         YsxzMKDPv/a0pyHb5PWFkCIqWEIlZlRQaHkGwnoZW/mJ2Y/Cb+KuZThyZ0KSdT0yB1+m
         gB1uFMtAR8I4T35Hz/O58S4K6p2VIO93acyWGnLqFduCmC386eF8Ju+ylGtx3BnUL1yq
         V3n03IVhh1NvTWAz2MAGD17O5G7BjSBMrp6n8Vh4NfmPM3ofxYPJ8EmmQ7U0A+XKdO3U
         VMtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788536249; x=1789141049;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rrK07pcEfzHDfc8s9dAeUAxX5iBfU+4JJI3XH4xHwd4=;
        b=MMrZH7QyOdjzPQepnvZFfIJ1xbhYCzALDW16geS/cL7amSDIvr/DjKSgkio0df96+t
         26bKycOYJdSvxLa9FTZd7lXLvrCwVP3C4OOj9NhnCn0ZXsf2Hju7UzGlXfQRiAjTSduq
         RNmc5ToKQQSQdbxNHSlKR88dW82rP1rN1eWhYjSW0Sg65deMivYFiQfnlISwDyKQR3kP
         7U3JkoxzuQVJyGY5PACxab1hGd/NMqx4MI4m4vwheZYLD/D44EsR9EgoMa/kSCRQ33oK
         A4ZMgBAc/snbkgjAxai8foo8BrTdu2KugKOr7B/VH7fpLpgnsd8g3KS15M+yzWaB0SVX
         m+jQ==
X-Forwarded-Encrypted: i=1; AKwUvByKsGwuyWD3Vu0bfYs2ReOlODGEUM7wkRU95uKzkHwkPuQk0A/I4ykebyehQhDyZ0OekAdwcmNDWdmB+EI=@vger.kernel.org
X-Gm-Message-State: AFuF++mhDnNaYBlrnh15zGPt6CtzhqMcEL2aquSv0DgXD9h0WqYUa5PP
	4l2dgkfn7TImAUXaJeKlgNgnrrzr/sgADiolyG7HN+Ms9eF6JCmvqZf7eCBC5oaWLe3dFMSvcBM
	3JG7G/E9SaNKR1UHNZBqzFaxyeDUpO3Vr38VdKWdD1bpFq0r+vSfErdiRrystwTYrVef1OUM4RO
	IOJqhXxpXhI0rVeJuWRV1jHOOYSTdcCYOzf9IknG/w
X-Gm-Gg: AYBFou1d3kBkwd5mLr48t2C03PvvXmPFE3LLDTFzwlgL9+5SNONYm6ZmOYaQqdKJiqK
	clC12OrxREE5JIoe4uOofC0GOKzWMnA0T+Hv1LO/DN11E9qZN84gQ/pgdEU9eYY4vyp7OphKnb+
	PqzIZwuS/lk+aNHsQWaY49GZOF2/a8hmG3e8XkjjdPfj+Pc3N4LfaquhWxDcfG0Qlltw/z3ox/E
	iPBfqDrxOd2Bdela4YaiA6cGj3Ls41X/Yj/JhQ2bbeDgfqRvpRmi9zXJamFIQ==
X-Received: by 2002:a05:600c:468b:b0:49b:9105:cdaf with SMTP id 5b1f17b1804b1-49cf8214eaemr97286025e9.8.1788536248632;
        Fri, 04 Sep 2026 08:37:28 -0700 (PDT)
X-Received: by 2002:a05:600c:468b:b0:49b:9105:cdaf with SMTP id
 5b1f17b1804b1-49cf8214eaemr97285005e9.8.1788536248224; Fri, 04 Sep 2026
 08:37:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260831213632.81023-1-dwmw2@infradead.org>
In-Reply-To: <20260831213632.81023-1-dwmw2@infradead.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 4 Sep 2026 17:37:08 +0200
X-Gm-Features: AcwNN1XbrXQRdBqaPVwlG8lJe2LjPmHbNMIXKEiTmO74fasedEPvKI1EXe7LwZE
Message-ID: <CABgObfYgYrjf2xbvyvLVmX0iJgUjoZ4N84aNiBgW9_oshaSh5A@mail.gmail.com>
Subject: Re: [PATCH v3 0/13] KVM: x86/xen: Bug fixes and long_mode cleanup
To: David Woodhouse <dwmw2@infradead.org>
Cc: seanjc@google.com, paul@xen.org, joao.m.martins@oracle.com, 
	boris.ostrovsky@oracle.com, ankur.a.arora@oracle.com, tglx@kernel.org, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com, 
	x86@kernel.org, syzbot+208f7f3e5f59c11aeb90@syzkaller.appspotmail.com, 
	syzkaller-bugs@googlegroups.com, suryasaimadhu369@gmail.com, lkp@intel.com, 
	nicoyip.dev@gmail.com, frn1furkan10@gmail.com, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imv4bel@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2026 at 11:36=E2=80=AFPM David Woodhouse <dwmw2@infradead.o=
rg> wrote:
>
> Clean up the handling of vcpu->arch.xen.long_mode to be consistent and
> correctly handle 32-bit/64-bit alignment. And various other bug fixes
> that have accumulated over the months since v1.

Applied to kvm/next, thanks.

Paolo

> v3:
>  - Rebase onto kvm/next (7.3 merge window).
>  - Add poll_evtchn READ_ONCE/WRITE_ONCE annotation (Chengfeng Ye).
>  - Add evtchn_ports IDR to XArray conversion (Furkan Caliskan).
>
> v2: https://lore.kernel.org/all/20260811094829.98794-1-dwmw2@infradead.or=
g/
>  - Take kvm->srcu in __kvm_xen_has_interrupt().
>  - Add dedicated invalidation sequence for HVA-based caches.
>  - Take Sean's version of the 32-bit atomics patch, and his follow-up
>    replacing the remaining asm blobs with atomic*() APIs.
>  - Use GEN_BINARY_RMWcc() rather than open-coding the btsl.
>  - Explain why the pending_bits access in kvm_xen_set_evtchn_fast() does
>    not need the same treatment as the vcpu_info one (it is in the page
>    aligned per-VM shared_info).
>  - Don't require 8-byte alignment of vcpu_info in 64-bit mode; always
>    accept 4-byte alignment, so as not to break migration of guests which
>    registered while in 32-bit mode.
>  - Add Closes: links for the reported issues.
>  - Cast to u64 before the >> 32 in the unaligned evtchn_pending_sel
>    handling; evtchn_pending_sel is unsigned long, so the shift was
>    undefined on 32-bit even though the branch is unreachable there
>    (kernel test robot).
>  - Rebase onto kvm-x86/next; the mode-aware kvm_<reg>_read() helpers whic=
h
>    landed in the meantime subsume most of what patch 1 was doing by hand.
>
> v1: https://lore.kernel.org/all/20260605143034.3603-1-dwmw2@infradead.org=
/
>
> Chengfeng Ye (1):
>       KVM: x86/xen: Mark poll_evtchn accesses with READ_ONCE()/WRITE_ONCE=
()
>
> David Woodhouse (8):
>       KVM: x86/xen: Rename 'longmode' to 'is_64bit' in hypercall handling
>       KVM: x86/xen: Introduce kvm_xen_has_64bit_shinfo() macro
>       KVM: x86/xen: Rename max_evtchn_port() to kvm_max_evtchn_port()
>       KVM: x86/xen: Latch shinfo mode in kvm_xen_schedop_poll()
>       KVM: x86/xen: Enforce 4-byte alignment of vcpu_info registration
>       KVM: x86/xen: Use 32-bit locked bts for vcpu_info evtchn_pending_se=
l
>       KVM: x86/xen: Take kvm->srcu in __kvm_xen_has_interrupt()
>       KVM: pfncache: use a dedicated invalidation sequence for cache refr=
esh
>
> Furkan Caliskan (1):
>       KVM: x86/xen: Convert evtchn_ports from IDR to XArray
>
> Hyunwoo Kim (1):
>       KVM: x86/xen: Latch shinfo mode in kvm_xen_set_evtchn_fast()
>
> Sean Christopherson (2):
>       KVM: x86/xen: Use 32-bit atomics if vCPU's evtchn_pending_sel isn't=
 aligned
>       KVM: x86/xen: Use atomic*() APIs instead of open coded equivalents
>
>  arch/x86/include/asm/kvm_host.h |   3 +-
>  arch/x86/kvm/xen.c              | 212 ++++++++++++++++++++++++----------=
------
>  arch/x86/kvm/xen.h              |   5 +
>  include/linux/kvm_host.h        |   2 +
>  virt/kvm/kvm_main.c             |  10 ++
>  virt/kvm/pfncache.c             |  18 ++--
>  6 files changed, 157 insertions(+), 93 deletions(-)
>

