Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE2FB440643
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 17:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788458085; cv=pass; b=oDg6cDMrZ0+sPMXqoxl5k1MFwTu8aXLYimfZwhEYpeN1CrcxgtKXSAFEvnJkRy7oPqIYlcya+2ZcojPE0zhWTtfb01eFr+WW4yDf+krTNsNwoRiC2fdCongUhgrgN651sOVroxjkiPY1ruC6GG1VONjJdWM9cgwHKCZ6F9WgUz4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788458085; c=relaxed/simple;
	bh=Eb/KhBPYrVdCZVZnXYUBQP7PX6xwvKjmsmjk45O53BA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YZd0rc5hr64lFj3BJiQjyLaamTGiOujjSOkdQEfH6uhN/c5iJOWTMgnwldl7OXOQKnyr83XxBUKF936AqiFwHKdga/Z312DZV0jopQNgCaaRHz3cQFLN5w9ZXYX+Eb7DNMtzWVFiP/s8FVXrvc30mACmtfD79b0G1TfRuLR+v6E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cxy5o8Ae; arc=pass smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cxy5o8Ae"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cc439aa0078so242710a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 10:54:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788458083; cv=none;
        d=google.com; s=arc-20260327;
        b=ODh+NC+8sgjPLjkX08k1ljFX6eF8M2nwM78ov6CTPj0pIJ1SridZjEib43hgnliCr5
         lYzYKfLUKeApY/Qjlj6h47b1oYHCYaXjX9UjWaGJDUXEHlz4nGU8lHhv+bZx826mN7TF
         Srqx1XNJ+6VuM6VpxKBNyZcTC/zy+9L2JjiIe5E6kt1097bdMKxqIgioVtodHmlKZ7qw
         SUGxCvirVEA593W74s7qLRC4A4wrW6ZFXMRRdAKwd0BS1c1ACNHpq4dCRs9SMVS/XTBJ
         j9HRDQ6M6U+G7dmU3WyogtYO0h7UuM0GgKLyWdYZzgsLPRO9Yw429RFUy3tz6WEtDXP7
         ImvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vDI4hMnJGcLesPQ/jL9UZwM4DiKEnVIKEk2punA20fc=;
        fh=pxPQAGxOUjbVMVs6fGaE1nYTWzy8gV/NfUfom/1Wv/s=;
        b=CW6IxqTmsDYJfdVJStx1y6KWjL3duE2Tze8/p+p+aNZrhQHeKag8v/9DtSU/iIIxK6
         48FqN0FS7VniAtClMJalTSdMwYIraE+vcIzHMaOJ0pN+iHoYKNbWUAziy1jNWmoiADIb
         QAnXTqD3UOHR3dMgrrqokO55BKV6C6kVBrDpg34T19xqrYlAAvwjhvTMfucdQ/7C5iED
         8Z2SgxA8SWfv62Yj9/cZ3udzmAPlaUxqv26OD1nMR+v8xfJC9uxCEPWd+VHxZAaPzfgd
         8btPB1dj73sBjAr+WU+mWLCO+t9Z3sXdOck9rzDYxm3XX/Gsn9ARW+Bif4hrw21HP3VI
         sbgA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788458083; x=1789062883; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vDI4hMnJGcLesPQ/jL9UZwM4DiKEnVIKEk2punA20fc=;
        b=cxy5o8Ae8pbher6ijED6ifRIiibu5IlBWet83We/V2pz6tE4+pP+0jVQqnMCf4KfUk
         CVxRBpqAqDbo8LVjBRqtOnU5M5+D6+/cue7XsHSeX1l7N7HKC5fqEG1AjT4D1uw6L7gx
         RHYJmmLJLOkxDlsRSOPyT74+L5RC1fj+mshawveJYEiIG4GAvNmDB0EzbjarcHGyrLHZ
         RV0zzcjuffUUqi2mw3yLhjEwgTZDSmJikegfp41eyap3sB6YdFu//rZmccsl/8+fhbbP
         vfh+bBL1zGCPHq4MAK1uT2BgfZm7jtgXEIMpq96ZRGxLNLiXltFuR/G2/35B4GDG/uVO
         xD5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788458083; x=1789062883;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vDI4hMnJGcLesPQ/jL9UZwM4DiKEnVIKEk2punA20fc=;
        b=p10WjjDPfkbHSdL2n7FN9FuKvhDxLXvKQCgR9fsHyK335iLvhgzpg+cljzNo6fTPue
         hyqtYqMWt6NcxE6OqPeiphhskRR6CZGsaW9RdCtT/rtD6dQ4BNMdM0/8QB9pksIfGB8Y
         JbV1/8jDtpfJvGYZzazE/98WSnV+7QHWFFHExK77yecCAMWa5uNwfYpgTTNtvs0usbnH
         qeGKp7VmIvmRFkpmZ4qWV7GFAtR0C02aGpSOIzqbMABYGLQ7wdMdTDKLs0K+t0xX2T4f
         e0T28U+FkW4egL/cUAWdq6XviGmFeIK6b6ihXxl7Wnw6cml3MOW+WtMxXlwoDgHhWFGA
         3/bg==
X-Forwarded-Encrypted: i=1; AKwUvBxIayG70Ht5NxLXjiFhYgs/uMKY5VvNbNKhxbZDcv9ZYHNIaau3BsvFdGu2DTJ0qcbF/pN1c/qamIchvUk=@vger.kernel.org
X-Gm-Message-State: AFuF++lIc5TxA4vxcLpaJMGCorwu+Ywp4GPEnti2fKYIKVSWC3CvD3Pv
	gHRwQJ3OCYiysSdjxKsA6+h2UjwUolks6xJ6jZOvNqpiCumDijQ5iApar7XjK6tToXvdOhSxFy/
	PXSQsYO5WDN2pCwB8pKLbopgkXGzrtM8=
X-Gm-Gg: AYBFou13o1HuMWM5LnGbDPDw2bniz5ITpjz3afR3le30DxpCqTYN2rkKfbmBHV/iZaU
	NkQbEYVWpil6IYLO8fHRmBC7cffKPo1WMBVhJ+/6sprnxvpUIbfZWuczx+LVSxQ7IasPXEF/GAa
	YjxbSoPzDCV4ylsf5vjxUP9O8mLU2R0+oUfVQfuJKPRXkvafbDMUcl7BLgOZAUA+1SW8SyNXiX3
	cN1DYgdQvUBvkC0UzenGGiIhaINOftPEDtMUSOjT+L5MHLbfHp6Gru9AIcyQhegw44r3oM90rY0
	uz84HMNWoszplD+rHvr8rKDQPpbKS34FwL199T/imfx6esT1R8Sc+v+gQS/oW44/jjtLSFN3cTa
	Ks8LOtf2Ryvggyw==
X-Received: by 2002:a17:90b:2e52:b0:38d:ddc2:7ccb with SMTP id
 98e67ed59e1d1-39b260dd3efmr358365a91.1.1788458083081; Thu, 03 Sep 2026
 10:54:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903155615.516010-1-omosnacek@gmail.com> <CAHC9VhQSoWBfWrf97Ch3ZZJXkOvhbwNOGmq8rMxLFzq+a-CkQg@mail.gmail.com>
In-Reply-To: <CAHC9VhQSoWBfWrf97Ch3ZZJXkOvhbwNOGmq8rMxLFzq+a-CkQg@mail.gmail.com>
From: =?UTF-8?B?T25kcmVqIE1vc27DocSNZWs=?= <omosnacek@gmail.com>
Date: Thu, 3 Sep 2026 19:54:31 +0200
X-Gm-Features: AcwNN1VZckJ80AmrXNyT2zeNvIrDg0xBBi5yci3USYnxHaD1VlvQhO3H_tXYCmE
Message-ID: <CAAUqJDuPN4_qaCKhAfUz9xQ61NVhf=z-VAG_8Oe+QJeqqgi=SA@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_=5BPATCH=5D_MAINTAINERS=2C_mailmap=3A_update_email_addre?=
	=?UTF-8?Q?ss_for_Ondrej_Mosn=C3=A1=C4=8Dek?=
To: Paul Moore <paul@paul-moore.com>
Cc: selinux@vger.kernel.org, linux-security-module@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 3 Sept 2026 at 18:50, Paul Moore <paul@paul-moore.com> wrote:
>
> On Thu, Sep 3, 2026 at 11:56=E2=80=AFAM Ondrej Mosn=C3=A1=C4=8Dek <omosna=
cek@gmail.com> wrote:
> >
> > I'm going to use my personal email for kernel contributions from now on=
.
> > Update MAINTAINERS and .mailmap to reflect this.
> >
> > Also switch to use proper spelling with diacritics, since I normally us=
e
> > the full Unicode name with my personal email address. I'm leaving
> > in-code occurences unchanged though, as that would be just unnecessary
> > churn.
> >
> > Link: https://lore.kernel.org/lkml/CAFqZXNvOGbzy8-ZnJtKi94jfu2H173Tz7VY=
pK8KuseMQS-9tNA@mail.gmail.com/
> > Signed-off-by: Ondrej Mosn=C3=A1=C4=8Dek <omosnacek@gmail.com>
> > ---
> >
> > Hoping for this to get picked up via the SELinux tree, since the main
> > change is in the SELinux MAINTAINERS entry.
> >
> >  .mailmap    | 1 +
> >  MAINTAINERS | 2 +-
> >  2 files changed, 2 insertions(+), 1 deletion(-)
>
> Of course, I'll take this via the SELinux tree.  Since I'm going to be
> sending up a pull request to Linus soon with a v7.3-rcX fix, do you
> have any objection to me sending this up with that fix, or would you
> prefer this to wait for the next merge window?

No objections, sooner is probably better than later for me.

Thanks!

>
> > diff --git a/.mailmap b/.mailmap
> > index 6803f3bd2865..0e672a60afdc 100644
> > --- a/.mailmap
> > +++ b/.mailmap
> > @@ -699,6 +699,7 @@ Oliver Hartkopp <socketcan@hartkopp.net> <oliver.ha=
rtkopp@volkswagen.de>
> >  Oliver Hartkopp <socketcan@hartkopp.net> <oliver@hartkopp.net>
> >  Oliver Upton <oupton@kernel.org> <oupton@google.com>
> >  Oliver Upton <oupton@kernel.org> <oliver.upton@linux.dev>
> > +Ondrej Mosn=C3=A1=C4=8Dek <omosnacek@gmail.com> <omosnace@redhat.com>
> >  Ond=C5=99ej Jirman <megi@xff.cz> <megous@megous.com>
> >  Oza Pawandeep <quic_poza@quicinc.com> <poza@codeaurora.org>
> >  Pali Roh=C3=A1r <pali@kernel.org> <pali.rohar@gmail.com>
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index fc320b373656..875d0baed8b9 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -24772,7 +24772,7 @@ K:      \bsecurity_[a-z_0-9]\+\b
> >  SELINUX SECURITY MODULE
> >  M:     Paul Moore <paul@paul-moore.com>
> >  M:     Stephen Smalley <stephen.smalley.work@gmail.com>
> > -R:     Ondrej Mosnacek <omosnace@redhat.com>
> > +R:     Ondrej Mosn=C3=A1=C4=8Dek <omosnacek@gmail.com>
> >  L:     selinux@vger.kernel.org
> >  S:     Supported
> >  W:     https://github.com/SELinuxProject
> > --
> > 2.54.0
>
> --
> paul-moore.com
