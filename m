Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA923DA7F3
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 06:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787900008; cv=pass; b=Dt7QNJG1HbY465YJmRWlmjyahNqwoxROGuBLjTru93qMW80iKmibb9hFx158pIfQ6+1ffQ7k2HziQAv/ro5gO0v2BKRDJaEwrAybBCkHeOm4sHbSt7dQ74UL0BObbRE4UKAWn24TLy0k9Me+KbGl3oURgmd1hmrRYH8kNOJlQTk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787900008; c=relaxed/simple;
	bh=VDp1Ho4MwZv4EbvgCMmKUxapUtWx6PKpAmWR7S3IHPo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dbroFIZssyC6SJ07+q+Ys/fxjER3QmumnR/FenzSp+kkA0I3CZnAcHBbRLpE8Ct6xFOAWpwvDbYBmtLJpKBgBQkUpkW2lg0oIBrm0s57/BH1M8HgcwCswx1xacn5y4dpebBAVX1QTVvaiYfewkeX/QQDp1nX0VzdOZxiYZKR1lA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qfZBbiNs; arc=pass smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qfZBbiNs"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3a1585728b5so5752141fa.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 23:53:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787900003; cv=none;
        d=google.com; s=arc-20260327;
        b=DHy7Qu0yL5VJoxLe9VTYHL2ohF2wz34/lAVLtE+xtSHZEPfzc5aRBTAA0ujSS+p4iP
         1AtwLfRtwhHq5oaLXW+sZdM2iR1jVbky82/sBUwfoiaxuTJBDRG3V4O6TdlN+4OjuKc0
         YsoKmvtE036vcx/Xi0ieqJ7FQ69+Cv8pi3mxxh7S1YzkUkNIed4+T0PJxn6r7zBOAUBi
         2I+FrTDhS4R53LrxrDet1Iyb9g00vfnqKGosztFeTja9JRa1Jlh6KYMwj215TfJ6T6Pu
         lQ1MNRlXBDhR8pAaEnDPAgNhqO+6DCiToY+byWYyd2GtnkPi3NabhJnLC9TUUzt1VqH4
         aSdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8/mQdiOJey4oznV7AyJvIvyzEleWgdqTQVT4AekpJIE=;
        fh=CPM8lUs1Tj/CcY+WrXvn1uga5egCN8Se0KGl+vmuHys=;
        b=IawYBO5+UcV7C8I9ax9mI/fZ4HZmwrMDtEZeSr87YrslJPaDTb+mG+wvFGYk3Z4wSs
         q47g5Ge4FGOCE7Y95yKOxCc8A49HMJ54ZvdA4/Xhr+ntaU6qQlC7zHO2xAmWnAPPmFUX
         L/nQZgvGgPTy2ip+Q1U28WIcZVQe9KYDpKzpyUv4T855DildlWP9qfWuWCv+6J2VYjCY
         9zHKVImHKNofBA4GSp6D+UPN2QSYc5i8Zl/J2184NlL/XnnWaW92xbovIrcDv+x1BOSp
         M97rfJZ2fmsARUfef16jqRAdosrSIzJx/2IWMygiEW6K9EBH+l/UPEbsd+xPoZc+NZe5
         IP+Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787900003; x=1788504803; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8/mQdiOJey4oznV7AyJvIvyzEleWgdqTQVT4AekpJIE=;
        b=qfZBbiNsWdbGSjKFpkTy4AtEGvG5q21Ik7XP4RjKVgvCSg8VRTr2R0ncSTvR0Exw6E
         7EXKSQV7TH89d9rzHxQLqI2EMH5Y3d69mOUErV+/XFmTLe8Em6FwGGSIVfvEPRN6IFre
         7x0mfarLD/vuz+mkFbjJrSuuZp8Oszy/ek3sMVQJNRMgBFWNj3b/wQnM7k+N9GEvHRSu
         jQLgk567CzaP6HQGWeDZjW3wWJdlUnRJHLXoMya/RrVsr8z/nReyYLbPbB0ZWOn55FFP
         UKv2/bj+sfKGg0KuDhx/8wTReHLOxbYfi7ckchTR1MlelC4pmXApJba2OgvnMtWLhXG0
         C6rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787900003; x=1788504803;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8/mQdiOJey4oznV7AyJvIvyzEleWgdqTQVT4AekpJIE=;
        b=FlGJmH5T7RXUKIJAxVJcpG/DTP34pv7n+J3IRSID4qydy4zugTc4V2W02OLJOSP936
         FBcypEKRHJsoqhsumGQZf2Yqg6nanr1MGkLNeUgzeJ9+J5P0v4+jmx64MQHb2iPYmKyv
         zHFqGHPG6sQf4R9RWev3KD8DqdfVptP9L7cqTkNi+Cb1GD0/jO+NMiqZRnSWMMuTM+QS
         FzrkNQGIJxA1qZzSR+7Nh5mhhzcJpqHBq3r+NF+wT+bmKtD7pLheSSOHvMdZf2ih5GqE
         hlDSrw0afndOfMgrOBMbQhfssj/9bNToaV0hFPBMjwGnDaj4DVm8/GWXZTBog6hTWnd+
         wRKw==
X-Forwarded-Encrypted: i=1; AHgh+Rqdoaum6G03K3HcgpHqmFiIeco+p3Tj1DKgMlWCjkYbMA+zVY2IaKaHvKS8Zv+pC/7X6By5F9kiiGvhwrw=@vger.kernel.org
X-Gm-Message-State: AFuF++mCRtTHOMKUOnw1m5Rvz6RJhWC1F9ZvoXqfPgSLoJpcBlmkpoK6
	YLtsIm1bChDpWKt8aeeDV26YHX3c64n3T7qacv/fM868o3CFzO6HamXFTE04ZogJ5kllPHOmOMI
	pEXek3hZVCVrSssmvxfry/o8ksUx7CXM=
X-Gm-Gg: AR+sD12vIZRDFGHf2INH0xOD5k1GvsLON4gIMADPdps8mu0EcU0jkbdvVPEH70vuwe3
	xhA2DNNcXgGkbS61Mxl2ea9n1flf/QZJrsaHPwGornf4pU0IrbJHNvpTB5tLw/sDkb1hts3hUOE
	6lwAYmat0e+pcgsbQ/RYIPNUjEac38HJJRTCM8LG1OvfGxSAQyTJs3kN/P1XbPAMgI8rROslUG/
	WBHsYF+2CnDVL3wCsPwrpe7qNkAxJfpobk9AV5vANiQ5a3GgJgw6xfIzwL/Z2AwGy5NNlJlb0nb
	6cdT8egx+ReIlTRJuvMvQpZP+qGU1zT5b736MkzhBEYbpF8=
X-Received: by 2002:a05:651c:31c8:b0:3a1:9562:73b with SMTP id
 38308e7fff4ca-3a301b16d7amr7296801fa.11.1787900003015; Thu, 27 Aug 2026
 23:53:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260822062725.60519-1-muchamadcoirulanwar@gmail.com>
 <20260822062725.60519-3-muchamadcoirulanwar@gmail.com> <20260824010726.2849f3d8@jic23-huawei>
In-Reply-To: <20260824010726.2849f3d8@jic23-huawei>
From: Muchamad Coirul Anwar <muchamadcoirulanwar@gmail.com>
Date: Fri, 28 Aug 2026 13:53:11 +0700
X-Gm-Features: AcwNN1WSQYP0-fvQo2t11ibIgmSEw8WyeXQCvmMnxHqFizPZCb4cCawVOvt7eDQ
Message-ID: <CAO26r3RLnX4HXrKDF6akmG722Q2CvDU-uJ40Yfuu_wwJdGgA9g@mail.gmail.com>
Subject: Re: [RFC PATCH v5 2/3] rust: add minimal IIO subsystem abstractions
To: Jonathan Cameron <jic23@kernel.org>
Cc: lars@metafoo.de, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-i2c@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	andi.shyti@kernel.org, wsa+renesas@sang-engineering.com, ojeda@kernel.org, 
	dakr@kernel.org, igor.korotin@linux.dev, branstj@gmail.com, 
	brucer42@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jonathan,

On Mon, 24 Aug 2026 at 07:07, Jonathan Cameron <jic23@kernel.org> wrote:
> This looks fine to me subject to a few little things - see inline.
>
> However I didn't take the time to decode every line of rust today so ther=
e were bits
> I simply didn't understand yet.  So for this to be able to move forward I=
'm going
> to need reviews from rust experts!

Thanks for the review. I'll add an explicit review request to Danilo
and Igor in the v6 cover
letter.

Brandon Saint-John has been CC'd since v2 and reviewed the series at
v3. If he has time to look at it again, a Reviewed-by from him on the
Rust abstractions would be welcome.

>
> > diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
> > index a56ba6309594..5dc917d92151 100644
> > --- a/rust/kernel/error.rs
> > +++ b/rust/kernel/error.rs
> > @@ -86,6 +86,7 @@ macro_rules! declare_err {
> >      declare_err!(EIOCBQUEUED, "iocb queued, will get completion event.=
");
> >      declare_err!(ERECALLCONFLICT, "Conflict with recalled state.");
> >      declare_err!(ENOGRACE, "NFS file lock reclaim refused.");
> > +    declare_err!(ENODATA, "No data available.");
>
> Do we have something says there must be a user in the same patch?
> A really generic thing like this in C would definitely be a patch on its
> own so that folk who care about maintaining a given file can easily see
> it without reviewing the rest of the series.
>
> So unless you can't do otherwise, break this out as a precursor patch.

I'll break it out as its own patch. The patch will note that the first
user is the AS5600 driver, which returns ENODATA when the magnet is
absent.


> >  }
> >
> >  /// Generic integer kernel error.
> > diff --git a/rust/kernel/iio.rs b/rust/kernel/iio.rs
> > new file mode 100644
> > index 000000000000..f1638160fed1
> > --- /dev/null
> > +++ b/rust/kernel/iio.rs
> ...
>
> > +
> > +build_iio_enum! {
> > +    /// Raw unprocessed value from the channel (`IIO_CHAN_INFO_RAW`).
> > +    ///
> > +    /// For sensors, this is typically the ADC reading or register val=
ue
> > +    /// before any scaling or offset correction.
> > +    Raw =3D iio_chan_info_enum_IIO_CHAN_INFO_RAW,
>
> I guess there may be a rust convention for this but from a human trying t=
o
> read the code point of view this need a blank line here and in similar pl=
aces
> where you have docs / thing documented repeated back to back.

Fair point. I'll add blank lines between the variant doc blocks and
audit the rest of iio.rs for the same pattern.


> > +    /// Scale factor to convert raw values to SI units (`IIO_CHAN_INFO=
_SCALE`).
> > +    ///
> > +    /// The processed value is `raw * scale`. The unit depends on the =
channel
> > +    /// type (e.g. V for voltage, m/s=C2=B2 for acceleration, rad for =
angle).
> > +    Scale =3D iio_chan_info_enum_IIO_CHAN_INFO_SCALE,
> > +}
>
>
> > +
> > +/// C-compatible trampoline for the `iio_info.read_raw` callback.
> > +///
> > +/// # Safety
> > +///
> > +/// This function is only called by the IIO core via the `read_raw` fu=
nction
> > +/// pointer in `iio_info`. The IIO core guarantees:
> > +/// - `indio_dev` is a valid `iio_dev` allocated by `iio_device_alloc`=
.
> > +/// - `chan` points to a valid channel spec from the device's channel =
array.
> > +/// - `val` is a valid non-null pointer to a writable `int`.
> > +/// - `val2` is a valid non-null pointer to a writable `int`. The IIO =
core
> > +///   always passes stack-allocated storage for both, regardless of wh=
ether
> > +///   the driver uses `val2` (e.g. `IIO_VAL_INT` only writes `val`; `v=
al2`
>
> That val2 is always a valid pointer smells a bit like the c interface lea=
king
> into the rust.  I'm not necessarily against that being a constraint we ta=
ke
> on but I'm not sure how we document that. Probably add something to the C=
 docs.
> Any C driver relying on this today is probably buggy for other reasons.

As you suggested, I'll add a note to the C-side iio_info.read_raw
documentation in include/linux/iio/iio.h. The IIO core always passes
stack-allocated storage for both val and val2 regardless of which
IIO_VAL_* type the driver returns, so the assumption holds, it just
isn't written down anywhere. I'll also note it in the SAFETY block of
read_raw_callback.


> > +        Ok(IioVal::Fractional(v, v2)) =3D> {
> > +            // SAFETY: both `val` and `val2` are valid per the Safety =
contract.
> > +            unsafe {
> > +                *val =3D v;
> > +                *val2 =3D v2.get();
>
> Why get in some places and not others?  May well be a gap in my really li=
mited
> rust knowledge.

This came up in v3 and I answered it then but forgot to add the comment
as I said I would. IioVal::Fractional holds a NonZeroI32 denominator to
prevent division-by-zero in iio_format_value(). NonZeroI32 is a newtype
wrapper over i32, so .get() is needed to extract the inner i32. The
other variants hold plain i32 and don't need it. I'll add an inline
comment in v6.
