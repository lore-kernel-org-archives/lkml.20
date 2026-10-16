Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 352533CAE93
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 19:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792179437; cv=pass; b=kLddrUMpohmdlpuFXpT0H0jpyIVCz5+XgpoKZA8II13RiyOWZss2YqrD5gW3ooQmcGrFnrw/dsM3pcuhyoXaJe80hzQ4iXg2WlC3lBuhrdS+woUiglspVA8oU75Ijl5D8ImW3oyi+rwf+oBP2+YSmIGcWh7PZ86jmhnIalhUbMs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792179437; c=relaxed/simple;
	bh=T24EBAmmRXB3PyxMRw5x/uGX9vSuVj8AHohfJzGwWRg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=izWzzRKw7em+UwOHX7fRStTOL9+wyoZWwa2A9ZxewbqV13wl0X+rmn2eYzyXH9SMv9oR8xNylz1cu/vZLkzb+nOcrOg8R15pjwhLBe0s6oVJpEJF882R4ShQ5EjF9QDgxspK9rHNnKvOoFS2AUvgDJ4xnEn4QJiy/Q6Gd+MDvP8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NXnHxUpL; arc=pass smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NXnHxUpL"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-533202fe429so60041cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 12:37:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792179434; cv=none;
        d=google.com; s=arc-20260327;
        b=Dhl6YzwWlEgy6/mlEId/kQ0ZyNC4aKy9IKY1sEWrKsZ/F1JTJCMdkqpmeYuApzrVMb
         ikxXoVmCArmp5BNHW9KRqEhA1nOY8aLMnC9ifnUmCHW6h8Z9q2Z92Thp1cCRNZF3ybkz
         Romzis31jxF2BMNV3YWESp0sshgY+sfksUpkGJywbBrxs8eYPI9FbF6DVZOc5iVhHxwm
         mmhcq3S8gfk6rdZceftVvs/fe0vsm9rKPkWCtesn2HdzpHXzXKMWEmxOMblMfmAgg4jB
         irnm8k7wK0e5ixkzGtdrJIW6r0AorXEbSsUPEQ6ifoI6QbwEWI+vjV/Dcarim2yY0C39
         PSPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Um6BosUUMDxetnqhnpCeanhIvXYZRN4p7ISZfy18W6o=;
        fh=GlSGCIo4umV210WkzGvDFjFGhRf/lqQLiAwUUPAx4d0=;
        b=oCyHSNxCReq8Zl6bv+8QwOBCNVdccXCXUhsl718Was/eQ/aZaqOgtocP77cB8S4OEC
         9ucxvYqNF08oLnGnrbfOYDnyDxK/09uH/Hs4PN7OlJTOU4HvdO7kPkXXMA7UI5C/lQ8U
         4yZbnZR4YX9devzZMsmunRnsHapBjCrgDcltd4DLPU71WGNXKmSD9NT4iW6D+2lg72xQ
         JneeTbKP+3H6WW/WDwlpIxY3+so3I+tFJ5E/GaMycLcDPot8jQxKUZ1QOtZKdfCcYjOc
         O3T37X/qIKyx7mR/iVTtRiBAqanhO9IqoEJZZzO3/L1v6KOoxl7d4NwvtQMufgrxYtzk
         1/pA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792179434; x=1792784234; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Um6BosUUMDxetnqhnpCeanhIvXYZRN4p7ISZfy18W6o=;
        b=NXnHxUpLf9ZHs2Q9xRKz2TCK3RLgb23vin75BINP5G0fCtS0JnsAGs9EjLbZDDKSZ5
         9nBtWIh1Mn06jqoZUfXHHhlBFyR/0AWCXJUJj4J798dmxlcsyjPP7OZkt2oW3vCwHz7A
         VgEbGEYbg9FfB2aHBBRxrUmbXFvKFl2DN32yuKBfGo4qsMyAGBmAhaOExxCai+bRGYgk
         ZcQyrrTnf1UxGpLKQMvnLeyZx1BBinid4w/KEym0q+qOcH1uevYFJlh90mkmXaqzhMkz
         Mmf9UOyaz0Jvh3FCLDe8DD6HQx2ufeD+MH+/at8nhPt7Tbk7YpjJ9fYCPLeNdWr4iLuM
         9bcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792179434; x=1792784234;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Um6BosUUMDxetnqhnpCeanhIvXYZRN4p7ISZfy18W6o=;
        b=2FKToLynIldZtvTPYtHbg4wIrgMewYcLbdbqS0tLbEHcmSiccafBx63IAH7oMqphtD
         Zr4Q8edoVGucCic3Bgz3ztyXg/LWOUBwVNitRKJsyKFRJsaVSGUFP/06jVRCsivlhQkE
         OEHVxhPHQr/jLywoeTbauHuHCDedadtHwCtiJscSovCkfBOfXeumsbYHL9ZAaS5KsrUD
         BaodCICQVk8xjPNZS6Y4OIJdc598bBTYH+Bf34jU1Ke+W2hMhV4nv/mML72GYPYeYK5L
         Wvps84NpiSS3lvz/rPdepmsyA9JRIostsZdAjXaiU2AVrOAlht6l5zs9Se5EEg2FWlKF
         BwrA==
X-Forwarded-Encrypted: i=1; AKwUvBwaBV+WUQrN3QfyZK4nidrNrUAmPg5rmDsAA+LQnPYlgfP6frMHZgRNdXPO8mFP88hGlmeP+FqvSCQyZyM=@vger.kernel.org
X-Gm-Message-State: AFq9FYI3saIONatqiZCh8QUePYeV2Pf9QjRkYWB9ogBJXibZcDFxxh64
	9wpVGvs9vZOyp/ut8DrFkhlWcVfUggvp5dIigf3xX2m9PV/SjjiSCrMzVC5Wtnp3p827AmXHncd
	xIs8dQqeGyYIcCqOS+Q86/dOb3jDzUfKRF0nWfarD
X-Gm-Gg: AYBFou16Z/uucDek0FK24fxL1mVNxmXGAJQB+/BH7d+sz+ABB1KuSrUdf4JgK8HhcI2
	J/Eht+VwPRvMhPA68AsIAgJoyQeZ9z1lmCGoJi3rKXrFjw4jtXn/aD/PWkroKEKA2/eKAtGWaiv
	panUmHLBXZ3OsZN0rPEyKePlY7fdTaSFe9yqJyBDhRLgDifyE/sKG/VPVl0n+PzD5baiQFPXmN7
	d/ltEvMTTXxMStwLp42GHI6pMBMOIYxf6X5erMIVAaWxHoSk4CuHmmiedGevM+Eu5+WApJ3Du6z
	pUeiCv7W3XaNqEYxh8sbt/YgDn6t6fC4XC1bIYLsVLLJ3QXfIC9hMlqH
X-Received: by 2002:a05:622a:598f:b0:536:3d22:fb83 with SMTP id
 d75a77b69052e-536465eabddmr3092751cf.13.1792179433180; Fri, 16 Oct 2026
 12:37:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012233638.2546339-1-yosry@kernel.org> <20261012233638.2546339-12-yosry@kernel.org>
 <CALMp9eThakVB_zqPQX=fQLrKh13BR33jmGg__rncOLDa2ZkXWw@mail.gmail.com> <CAO9r8zPHA2Xbwqm5sL1uymCy+T65LKLWDh6CKvV83euHhxPWTg@mail.gmail.com>
In-Reply-To: <CAO9r8zPHA2Xbwqm5sL1uymCy+T65LKLWDh6CKvV83euHhxPWTg@mail.gmail.com>
From: Jim Mattson <jmattson@google.com>
Date: Fri, 16 Oct 2026 12:36:59 -0700
X-Gm-Features: AclHuK92jepxWuUtFmMlKXO_5v4ZdybtV_AOdjCsjdE0ksCnXN8ts3BnKwKo--A
Message-ID: <CALMp9eR7MLnZNWFgDWBuux6uuqWOwB0CrDs9UyYouSPHbZYbqg@mail.gmail.com>
Subject: Re: [PATCH v3 11/27] KVM: SVM: Only flush the fallback ASID when used
 by a different vCPU
To: Yosry Ahmed <yosry@kernel.org>
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Maxim Levitsky <mlevitsk@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 3:03=E2=80=AFPM Yosry Ahmed <yosry@kernel.org> wrot=
e:
>
> On Thu, Oct 15, 2026 at 2:44=E2=80=AFPM Jim Mattson <jmattson@google.com>=
 wrote:
> >
> > On Mon, Oct 12, 2026 at 4:36=E2=80=AFPM Yosry Ahmed <yosry@kernel.org> =
wrote:
> > >
> > > Instead of always flushing the fallback ASID on every vCPU run, only
> > > flush it if the last vCPU that used it on the pCPU changes. This avoi=
ds
> > > constant TLB flushing on a vCPU using the fallback ASID if no other
> > > vCPUs that use the same ASID ran on the same pCPU.
> > >
> > > Note that checking (and flushing) the current ASID on vCPU load is no=
t
> > > sufficient, as it is possible that a vCPU is using the fallback ASID
> > > only for L1 or only for L2. To do this correctly on vCPU load, both L=
1
> > > and L2 ASIDs would need to be checked, and the respective VMCB would
> > > need to be flushed. This would not be much simpler, and would perform
> > > unnecessary flushes in some cases (e.g.  loading a vCPU that uses the
> > > fallback ASID for L2, but L2 doesn't actually run until the vCPU is
> > > unloaded).
> > >
> > > Another alternative is always flushing on vCPU load if the current AS=
ID
> > > is the fallback ASID, and flushing on nested transitions if the new A=
SID
> > > is the fallback ASID. Again, this is not much simpler and also incurs
> > > unnecessary flushes in some cases.
> > >
> > > Do the logical thing and track the vCPU using the fallback ASID inste=
ad.
> >
> > Wouldn't it be simpler to track the VMCB associated with the fallback
> > ASID on each pCPU? Then, you avoid any confusion regarding whether L1,
> > L2, or both have been assigned the fallback ASID.
>
> It would be if we went with checking the ASID on vCPU and nested
> transitions. But since we're checking in pre_svm_run(), I don't think
> it simplifies things. Oh, I guess it doesn't simplify this specific
> patch, but we don't need to check if both L1 and L2 use the fallback
> ASID on nested transitions.. but we have to check if they both use the
> same ASID anyway for SEV.
>
> OTOH, it would make cleanup more complicated, as we'd need to do it in
> both vCPU freeing and nested freeing.
>
> Did I miss something?

I trust your judgment.
