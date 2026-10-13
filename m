Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A05C52ED3A
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 17:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791914101; cv=pass; b=t5lyOtBGtmYsmA7NXXh5C75r8f3YXGIHlmd/64PUbqb4thVHoUQDu8YbHbZJfrjP3JB/phX3tR7emQs2fbN+dcHjgnqySBqt9zK6KKiTzUxqYLeWu00IZxO97rKcV1IhQs9uxsdU1FbqQXN5NZsmtxXLUIR4aQiNF8YTPXXHVFM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791914101; c=relaxed/simple;
	bh=BMSS1jckBQ2e870f/uI3vrk/j+iBZv6E/rBVCsIo22k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oz5B+kk2BiQ+GxnSo6+CkGeMQES/YSPiIEEWTOSpnyxUaUoMMsVHR+tWnjV7AK1zBSKYkxp4ep6DkJrQ+RzUgOa+TtYucgNGtHs4lMfGcfEL4EhbwiSnwfQZliSDBg05tL+c9v86dXmq3q8YO+c4KO3wWQf1K5iwy2/sDIrfNSA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TdzfnWTJ; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TdzfnWTJ"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6ae14cdc63aso28561a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:54:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791914098; cv=none;
        d=google.com; s=arc-20260327;
        b=ByLsnIxvP9viX/RjYEqn2n7GUUIhGu61Brk2NeSAj2aS2dhzTLk2XgjiKnps35xhGd
         Z8frG0wRKbdbgNjC1LYz4g3Tvwip/3o3+FpOMtMxjhWClua8hHElPmSR+QJGH+aX986d
         QrQrZdK5h3c2jHnjFNbh4eb407tR705NmbLXbzem47Is7gGsGYEm8xWweZhSfk9oP8L5
         bICbdijEpxXy5dBLCUQk6zv3+pzXhAWWUOi5wJCCjv7Y5TLEKPF/uGmbgFulpjeoj0IT
         VmJcce4YgxtgIaeRUJrxILDzs204wJA/8EwMm+tegXRry9uEPo0TEFkc5FE29yrxINsn
         Rmjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SRtjnC1p7Gi1e00oi/1sIVluDFzpjss9Zq5iLpeEpPQ=;
        fh=NOmklRkFkZgq90DZq2ZqMX1nyQFrKdKKMBgfLUNpKLw=;
        b=pPIocoMzY02dyimU+wuoam2t2xHLGA2XbKsq+9XP+hu8M9QJWpIHpkQAJ/JIk2Aa+S
         MsOmqhuoBdlpVX2K+pXewrvT5rHNeOkor/svIwf6IkMAVse3RFj3yBDDJp1t/k839YbU
         CoX+shgF3w5BseiLIMWdsm4qiCKVzt/9q1Wr0YmiXwp/V+roSnDgeuUWDS//QLYf2CM1
         CsPl1hgMiv7GV/AFLx5s8phW2e80nN1VYpISz7tfizy/tXMR083tHVJQvJnxiwdmR1YT
         Yl8GKxL7baqs/nRmYFDnUAPezKZhmSw3IjF36HFsc1tthQ9wa7M/35+nYMbFvqx5533Z
         feQg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791914098; x=1792518898; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SRtjnC1p7Gi1e00oi/1sIVluDFzpjss9Zq5iLpeEpPQ=;
        b=TdzfnWTJ0JE4/RKyDdhY635Wlr0PdD+bTTKkJhom5yLAE/BFvIk2t5NwioHKhupKQJ
         Sfp+OcN2pW4OI1AEHHMoVEAs8vvAgMX7MDKKy7RKj2Oo13oEDrgj2+PbgmW49ppQyiIz
         NVqVlu6s6A/VgYlcZlqPS8CW2WLnr202X9VMSCnS2flGKOvd3eIZ5hX2quvDMqR8smEJ
         YdHQCl3mRnjZwyt5CkulHrslCszA2udgoU5PGQyUhY9CaOUZ1/oPx7xdzcde3qwTVEln
         2SX4/8G9SZu9gRhq2n15tsjDrYy+6lt43T0obPvRKoSU9ropeaESFA3BnfsRa8y0O3Vh
         af3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791914098; x=1792518898;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SRtjnC1p7Gi1e00oi/1sIVluDFzpjss9Zq5iLpeEpPQ=;
        b=aet6dpNZinmLoZ6lpItImM4DF1BAjott+UqV2spXtgUjoclKjIZpO/5XmtUOGjW84U
         sa9TPY/YdnR4crz7hwqTwLmzVRWsdj58w7ZaObhyB1UaoHwEdkfDRGeA589vbi7dMI/g
         Z/2315c1abIA1Mm4NOZAPVwzwtfxKVs0rVj8J9PQiUIqsVry7n6gnSu0IAaMWCUR/1QB
         3MA3fqwEkbHqWzHQqSl3RQbCoDOEtYn/+HFrkfLyHKlMftpeAZqGOa3H/gwan1Pc2rOb
         N92aHt9Lkj+Jr4VLN/ihColK0iXcQ56USlp+tCapdGvb57GsIa5NkYDjVD6TjZc6kU0V
         FnEw==
X-Forwarded-Encrypted: i=1; AKwUvBxV2YDOTJE+1zN4A5ipvcPPqySvQ0kWPEVLDDTG1ic2M/wBwB1x7+6h3tgaix4xsHQsGlkH7GMJIwxBrJo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLfT0tQBymJeQECllECR6NxpTVU/SMgrHihQ1ENg27a8bHuMpvc
	OBVptw5+BF7C9QSovReSuIYc0hgKhnYibQ/DdubXHG/XITVbdBsq8gpQ5azM7GMUOyfPpfArSQO
	E54D1ERLL0hTLFMIYhEGNQmZHJlymTbCUPCWFrYML
X-Gm-Gg: AYBFou3wK+77AQCqDpM7uHuUDrdGWLS/I3MlBKEJKrDi1bqIK8LltqiIa4M9rLZWoxo
	uRF2Wtb1P1MAJ+mvn9/fey68WGVLdjkoNV81jiH5iaTEzu2YE+G2oN0s9PQXVKXmPkUudDtcly+
	PTjEPjwOY4EB/a8bPN3vXBRh2LMueghVJE8QVwixH8+SBB26HFis48O5Cfv0/br8qgl/+SZRKQe
	ZXvWBu8TixSJfvyawlQhkFqQHGQn0VjZBBaR/hCtDJiX+F5wlsz+KE0KJ5R2tGiIumiP1ddopqC
	F4/EhpY/0YDVDvYtDVhvSPcXUQx54aw5GqOa9Qyt9mOCW1nSssaDSTw=
X-Received: by 2002:a05:6402:150a:b0:6b1:b3bd:1576 with SMTP id
 4fb4d7f45d1cf-6b1b3bd200fmr133982a12.8.1791914097201; Tue, 13 Oct 2026
 10:54:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012224736.2306637-1-yosry@kernel.org> <CALMp9eT6eJSDaJVJ_1mrn8-sP6F88q-OcGrEgUWy-YpAkuA9vg@mail.gmail.com>
 <CAO9r8zMsih9vRJFWgbE=bgWAqBzwPO3KJiAyBVA_hJBgjPp6mQ@mail.gmail.com>
In-Reply-To: <CAO9r8zMsih9vRJFWgbE=bgWAqBzwPO3KJiAyBVA_hJBgjPp6mQ@mail.gmail.com>
From: Jim Mattson <jmattson@google.com>
Date: Tue, 13 Oct 2026 10:54:44 -0700
X-Gm-Features: AclHuK8WC6fCM25ehSI8d6hZUp_f28nDxtHAyGF1VNE9tdU9vNWCl9URQ28bhU0
Message-ID: <CALMp9eRRb_8vbm3YM9dw7XbDsnjQ1wRYK10oNq4JAgkUZdpFLg@mail.gmail.com>
Subject: Re: [PATCH] KVM: SVM: Update tracked pCPU on pCPU switch
To: Yosry Ahmed <yosry@kernel.org>
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Stefan Teodorescu <fane@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 7:49=E2=80=AFAM Yosry Ahmed <yosry@kernel.org> wrot=
e:
>
> On Mon, Oct 12, 2026 at 4:58=E2=80=AFPM Jim Mattson <jmattson@google.com>=
 wrote:
> >
> > On Mon, Oct 12, 2026 at 3:47=E2=80=AFPM Yosry Ahmed <yosry@kernel.org> =
wrote:
[ ... ]
> > > @@ -3892,13 +3893,22 @@ static int pre_svm_run(struct kvm_vcpu *vcpu)
> > >          * - The new VMCB does not detect a pCPU change and runs on p=
CPU A with
> > >          *   the new ASID allocated on pCPU B, which is potentially u=
sed by
> > >          *   another vCPU/VM.
> > > +        *
> > > +        * Note that dirtying both VMCBs is not strictly needed, but =
the per-CPU
> > > +        * tracking is shared for both ASID and clean bits, and that =
CPU must
> > > +        * match where the ASID was allocated.
> >
> > Is dirtying both VMCBs not strictly needed?
> >
> > Per APM vol. 2 (rev. 3.45), section 15.15.2:
> >
> > > The hypervisor must clear the entire VMCB [Clean] field to 0 for a gu=
est, under the following circumstances:
> > > ...
> > >  - The hypervisor executes the guest on a different CPU core than one=
 used the last time that guest was executed.
> > > ...
> > > Failure to clear the VMCB Clean bits to zero in these cases may resul=
t in undefined behavior.
> >
> > Suppose vmcb02 runs on pCPU A, migrates to (and runs on) pCPU B, and
> > then migrates back to pCPU A with some clean bits set. At the next
> > VMRUN, pCPU A will happily load stale state for anything marked clean.
> >
> > At some point before that VMRUN, something has to clear the clean bits!
>
> Dirtying both VMCBs is not needed in all cases covered with the new
> code here. IIUC, clean bits are VMCB-specific, unlike the ASID here
> which is shared.
>
> Because ASID is shared, we have to reset the ASID generation for both
> VMCBs when a new ASID is allocated through either, and update the cpu
> variable tracking which pCPU allocated that ASID. Since that cpu
> variable is also shared for tracking which pCPU ran the VMCB last, we
> also need to clear the clean bits every time we updated. IOW, if we
> had two variables, asid_cpu and vmcb_dirty_cpu, we would need to
> update asid_cpu on pCPU migration for both VMCBs, but only update
> vmcb_run_cpu for the current VMCB.
>
> This is all annoying and confusing, but that should go away in the
> static ASIDs series, and we should go back to only updating pCPU
> tracking, flushing the ASID, and clearing the clean bits only for the
> current VMCB.

I haven't read the static ASIDs series, but in any case, this patch
should stand on its own, in case that series never gets committed or
gets committed much later.

My complaint is with the claim, "dirtying both VMCBs is not strictly
needed," which seems to imply that dirtying the inactive VMCB here is
optional. In fact, once you update vmcb02.cpu/vmcb01.cpu for both
VMCBs, dirtying both *is* strictly needed so the inactive VMCB doesn't
later miss a pCPU switch.
