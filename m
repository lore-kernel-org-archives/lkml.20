Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D973EEAC3
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 19:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788462848; cv=pass; b=hex5vKFhgXfqHCtg7mJWqVNbw9m4B8ya5ZFoHjL+d7d1BxYJApmhhMB/GjvOGZ/stqBlXaGY/yq2hTl9BNBDYaHw2XXHyaZ9VTeVJaj10VDpPP4VSxMZ9YGikXk90MxWyN5We9gnwJtAuC02s5IDb3BTgVB8P8gPyBK34vqcBNc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788462848; c=relaxed/simple;
	bh=LQ5MmxlCmAkfvdFvXrKZhXx7Fex14wUm+MceK68pFDs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qE9bgYJY1Xo3LyWJL3ZDkzW16qRVBjtj73epmBHXqFej0PldylHjWmhp+vF8l7Btz2/thYRtZzc1251/Ndt/NLim2eQhO2FtPw5E2I5CoJ8OopWVPwIrqcPx6jdc88bsloz8f2zSBNgtL3bklIwoYs/U0hR5+vJUi//F9bDDuT4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cwdSFHGU; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Thmv5YVP; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cwdSFHGU";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Thmv5YVP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788462825;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ftgzyujbx9F68uHjOCU1/tri9c4N8S6xaXNJtzq3Flg=;
	b=cwdSFHGUB5A4gw2DrXzNUj8QNSk5NRzKQXNlNBKl5gcyW8AbIIsQ3VXAg8cy9jZEkGboev
	VknJLN50cEM5kARqRg1jo4r1mWl/2NBSuDGwQxOClWnRO3NdwiFK8kvJm5GYS7U6Pqm3C6
	7FyygcPNYD+HUEUocketHZue9RCBi+g=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-67-ELgMDda9NEeAjcDdyLfxpw-1; Thu, 03 Sep 2026 15:13:44 -0400
X-MC-Unique: ELgMDda9NEeAjcDdyLfxpw-1
X-Mimecast-MFC-AGG-ID: ELgMDda9NEeAjcDdyLfxpw_1788462822
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-484357599a4so110267f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 12:13:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788462822; cv=none;
        d=google.com; s=arc-20260327;
        b=mm3mLV1GloLpHqYwrc9GV3SIEa6f3ZCZ1ldjpZ71GPJjhcmuzRRRVFy9RjUVonJF8u
         sG+ujTRkFgUfDKZ7zINn12RY63TAoYn9lvQqMwcOvCXHUkHhEjvctEUzDmkPU6JdDW5B
         eq54/3n5zljkHrGVUYfvgZN5nF12LaIHnaTbSF4K8NrSaO9chTHlfG4et2wNfBJhRKlZ
         tCFDUUFOmeA4fRQOetXOv/KFIyWKA9xBJW0rNFlyIQRiw6hqzcGP4uj2PcWbT00hLojO
         v1Ox2W8X3GIvJnU7AuO4YlmpTMGr0Ss5CPf5rAqEpM/EhRVSaf6nu7XVlUMuIE80uMUh
         ypCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ftgzyujbx9F68uHjOCU1/tri9c4N8S6xaXNJtzq3Flg=;
        fh=D24Fk8JrAoy/T+Plg0PZXrPWxSiRyP5c/ET+s+mX1rs=;
        b=Dx8gsa/0o0lXzLHtNlRjNwPAjM9ccYcZsIWJmitW/DzpKjpDKSC64TjL+e4ZpW16bj
         jc3jJFVLSuHFK3jRccv8tQ/UQ//uwik6DC5EolddtDNnERSMoWyifEVtNbAS8P2Z0Ncs
         bS+TWQ6AQLzOctcsZlEAdmzEhVG7lV+6Bw1eDRfRbrlCkZYhTQ0F8d+1Cg8wrAyCFW+J
         dsbabptKx9HNxBrtN/+3TiugkzAf91Vyk9MNGTSJs8EwNeHedkpIFoKD1KmSsmbEiWKd
         3PQRoeDoe6u/kdlHrNmaGAjdPtsDwiTth9Cg2Wc8CyswoAZaru6dWkyGSahj/DIN/Zjh
         IE6g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788462822; x=1789067622; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ftgzyujbx9F68uHjOCU1/tri9c4N8S6xaXNJtzq3Flg=;
        b=Thmv5YVPhjH2NQjhg3KY4IemgkxPsePHBJBeBi7rTC106HNgb5heT7m9wpoAoJjOuG
         qwW88eJsTnYYau4nRA2i53lzw1EKdCBb1nqmVwg6JMKmXDhJQz4R142OshQ2p980YDyt
         Cb6JL1xwSgWjIQYtHCK0EYGs+e6JSWTtjiDvI1Vl0+a3wBzYaOGNeEBPq0B4Xl4zvEzD
         +rDksf5ytzrnhAdZp2QRMLbYsDhnb509GcMbJGJc0S0Ilroqo8x9DKwsgJ8lRPzoL0ai
         MfStRG+qKVP3yN5Z8MhJVNiIOCy11tPpPerRmiMZC5Jp8JCNss/fdOmvcgArevWbQF82
         W6fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788462822; x=1789067622;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ftgzyujbx9F68uHjOCU1/tri9c4N8S6xaXNJtzq3Flg=;
        b=sKwVRm1dSiEYwdQI7LAsrUAsK9Fix7gstmN5SA8Le2kDaC8+HZCf0QQlbKm549wJUm
         Oq0jh7x1SrAscDBiUF8RXYzU4RM2azahNnlwQ24Z6vY1fyDHGcs94RxcFelDf+c22anA
         wEQZ2rF1t/Xzap3wDQjpt8eWTC8VTSQlQkolSRkAa+hrm2sZdAH0/atP8Vtrt+iPM/XK
         z73Ag5q1ciUwkABU7FstgIp/yZPrhc5lN80S6zIfPfnlpoD8/uEiUSBtxG4rjvBa0Kk8
         ic4gvPVvjOBoQBzd2nIFWw6l1SONikV/Dbip4CWeLdTXFc5EdoZFVCew9tyvC6MnHHtV
         Fe/g==
X-Forwarded-Encrypted: i=1; AKwUvBzfRkJb8AMseZg/LyYqff3S/hnGsfJYEgJ5ngWj0izRLvPkYcy6x/sH7tB5FSYWO6xSI2BBFrxV1yDhzuc=@vger.kernel.org
X-Gm-Message-State: AFuF++l6qTNlXWjBxYdbHEFYR6xXe//MR3ucHHnZh7+PkEHcCRpcuV7k
	T+J3d4RJTeT5zRWck9AqRAreP+ehG0dSN0XqcfGRA1oisdwnhEg2PfrEri4Tn7i643ogkHGfNmW
	19AUSgk5G4j5+dctZ00HTznPfCta2SNCuRWZRGVDNzpgo2cSXlQTigHfjb4nJc3UIau9hZPlV0O
	plBQd59dT+M1hRZNyC35N05d6F+Gs6OAOFSlcVn8Km
X-Gm-Gg: AYBFou3eHoyEuG4Fs65Fuol2mdq0wZa8zH82VUwYcy4mHHNzAxmdTlklvrRtWqdu6Jb
	E6XnlZ7PuGL51AdwdQoE+qt3WHhozqWJRE7T/KB9/Ap65AnB+tUm3ZBV6NgLpVi6OPY2brQd3xD
	T05AROSg6kTHS4oXuw8nu3bJRopZNA92lkxiite2Ndf3c+92LLYLJL0gPPNuv7aG+RT0Cw7yiz/
	0Fgqwew+q+3cgLovVsK+NEcwa7KcFJsgdmpRxoUDjhv3zS4n39T5Hp7k69I
X-Received: by 2002:a05:6000:2084:b0:482:f0ee:1390 with SMTP id ffacd0b85a97d-48587289c5bmr2438673f8f.22.1788462822415;
        Thu, 03 Sep 2026 12:13:42 -0700 (PDT)
X-Received: by 2002:a05:6000:2084:b0:482:f0ee:1390 with SMTP id
 ffacd0b85a97d-48587289c5bmr2438609f8f.22.1788462821985; Thu, 03 Sep 2026
 12:13:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260831144802.834315-1-seiden@linux.ibm.com> <20260831144802.834315-3-seiden@linux.ibm.com>
 <apdweRfqt4dTxcU9@google.com> <20260902075028.231001-D-seiden@linux.ibm.com>
 <aphLXQL1H2zYZgTi@google.com> <20260903114241.33034-C-seiden@linux.ibm.com>
 <apmEi1NmOUvmUBFP@google.com> <apmFClPZ2WcDINmT@google.com>
 <apmIGgMEN8w-kQAm@google.com> <19d4feb1-d703-4c62-8622-a6d5e9d6394c@redhat.com>
 <apmYPMMPCNzK9ZEA@google.com>
In-Reply-To: <apmYPMMPCNzK9ZEA@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 3 Sep 2026 21:13:28 +0200
X-Gm-Features: AcwNN1VM-0Sta_usKYpoIMa4PlVb-9vByCd46nQw98qW4Zt-Pg_0xPWbP_VjwBM
Message-ID: <CABgObfZL-qNSaNkNZDj0Kk41zw6UZ30vkSxc6T8wb-pOKab9Wg@mail.gmail.com>
Subject: Re: [PATCH v7 02/23] KVM: Make device name configurable
To: Sean Christopherson <seanjc@google.com>
Cc: Steffen Eiden <seiden@linux.ibm.com>, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-s390@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Andreas Grapentin <gra@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, David Hildenbrand <david@kernel.org>, 
	Friedrich Welter <fritz@linux.ibm.com>, Fuad Tabba <tabba@google.com>, 
	Gautam Gala <ggala@linux.ibm.com>, Hariharan Mari <hari55@linux.ibm.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Hendrik Brueckner <brueckner@linux.ibm.com>, 
	Ilya Leoshkevich <iii@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Joey Gouly <joey.gouly@arm.com>, Marc Zyngier <maz@kernel.org>, Nico Boehr <nrb@linux.ibm.com>, 
	Nina Schoetterl-Glausch <oss@nina.schoetterlglausch.eu>, Oliver Upton <oupton@kernel.org>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Ulrich Weigand <Ulrich.Weigand@de.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Will Deacon <will@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 3, 2026 at 5:54=E2=80=AFPM Sean Christopherson <seanjc@google.c=
om> wrote:
>
> On Thu, Sep 03, 2026, Paolo Bonzini wrote:
> > On 9/3/26 16:45, Sean Christopherson wrote:
> > > > > Actually, thinking about this more, what I've proposed here, plus=
 the pattern of
> > > > > #define-ing macros in arch-specific kvm_host.h files, should suff=
ice.  For things
> > > > > like __KVM_HAVE_ARCH_VM_FREE, it absolutely makes sense to #defin=
e the macro in
> > > > > kvm_host.h since it's very directly tied to an arch callback.  Wh=
ereas with KVM_MIO
> > > > > and KVM_ASYNC_PF, because they enable compilation of C files, it =
makes sense to
> > > > > define them in Makefiles.
> > Ugh, defining CONFIG symbols in Makefiles sucks.
>
> Sure, but IMO wrapping entire files in an #ifdef that comes from an arch =
header
> sucks more.  And technically, these aren't CONFIG symbols.

True it wouldn't be -DCONFIG_ (fortunately). But even if technically
correct is the best kind of correct...

> > I don't want KVM to be the. one that does things differently *once more=
*.
>
> Too late :-D
>
> arch/arm64/kvm/hyp/nvhe/Makefile:ccflags-y :=3D -D__KVM_NVHE_HYPERVISOR__=
 -D__DISABLE_EXPORTS -D__DISABLE_TRACE_MMIO__
> arch/arm64/kvm/hyp/vhe/Makefile:ccflags-y :=3D -D__KVM_VHE_HYPERVISOR__

Sure, VHE/nVHE is fair game because the nVHE case is in the same boat
as vDSO, arch/*/boot, and so on.

Looking at a grep for (cflags|CFLAGS).*\-D most are -DDEBUG,
-DDISABLE_BRANCH_PROFILING, -DDEFAULT_SYMBOL_NAMESPACE, etc. and in
most cases they seem like a bad idea. Don't do it for KVM please;
requiring -D for all architectures and for random pieces of config,
when you can put it in asm/kvm_host.h, is just as bad if not worse.

Paolo

> And I think there's value in deliberately being different, because CONFIG=
s are
> kernel-wide things, whereas the thingies in question are KVM-local macros=
.  I.e.
> IMO, having the behavior stand out is a good thing.
>
> > I'd prefer to stub out the contents of the .c files instead.
>

