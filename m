Received: from mail-oo2-f43.google.com (mail-oo2-f43.google.com [74.125.231.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA023AA4F9
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 06:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790921076; cv=pass; b=jHuf2Nfs3+dY2Ctts5PZltiW2DcbRn+DW09fPBShg4U/QY0HspB6C7GWCs1nhJQ+dFcQZglAA+sUHN12KsX13F75tWCmGZgQGPO1Bp5HZVUFQzUz8Ogt4OYbTILVM+I9YH6Ve7Zc/Lsy+wOZ3sMMHAZIELgKpvDvDoj4/K5EK/Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790921076; c=relaxed/simple;
	bh=O4p10DvGJtAEkmkiTAv3pxmj0FlZKDktqwxkxncemtY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HB417RFpie3ngMW6K1LcMlxwpHvb3DKYbWC5LvLmUM4qejTY7nPF9XfcqD6oVIHs5lIkwurelWxpvGi4elO4ax37dAhUBT6OScrpbqMoD5GckEKGjt75EUsdeCZForK0iejwhyy7ihmTl9bj8OmU235/Wf7USILPEPwyHMUuGd0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K6mbzwVR; arc=pass smtp.client-ip=74.125.231.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K6mbzwVR"
Received: by mail-oo2-f43.google.com with SMTP id 006d021491bc7-6de6b4c50f3so786842eaf.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 23:04:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790921074; cv=none;
        d=google.com; s=arc-20260327;
        b=ONFzn57iom1rpCwFT3sJ1R+5/X1wDL8Gkc7fh8gr4/rapfG0+bwklzdyCj1sRRw1lR
         ZEK4UJ9ym1Ea5HjsqX3ddwmn85qmFzz4eNwbBr2Uwm/MYXcNrQqD8sYdgcO4ZHIe7ovg
         VcJ+hkPcZf+39vfleLavisD1nLMmX8/7Eoode2VVtRPT4Rh1YKVll6M1r4N6nI4y31wP
         TI2rlRRr8XlyVR6mMTn/k3UllhUclOibztzH/kaa4jBjVfS9/Uq+/45asX2Hb5ubDywb
         nkeXkrY9Sw2NrPX+t+VTgApU877lDEDePrpOpH61hw9Eyc+h3kirEh7IXUazn5JZBnoN
         cAQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UM2JzAgkGD7BHOZnHMq8unejo4FpCXzpYWfXmWGl2mQ=;
        fh=Ffu0ZR/F3KYkKtT6h110WJYvohlBZ/FwZ4Aicm9coUs=;
        b=SfOu94V5t9Jt6QY620e3eLUx1zuiB++bV6HHSv9y2KMjE83Dk1LseXztDQURDj0fiT
         jqhQWtOMxuvkS/iAFbmDFqOmfkvBBX/j8K3ROLYO5j5CEcbLUfZWKZhYaJloBStAGu+p
         2wpk7hpiOVdsJCHzKmsNvTgLxfGE4UbDVA0+VlKgfdsp6JlYNj/GjsW24BudhDSwCvTS
         8/7UCLcqOqsa7DlHX2Bb1JvksTpfjhaxMOBn8VMseqh56hXhU+KlzF/EQ/SUvJk/I+Pa
         GgWpfJ3BcvYp0aIpmxdem+/hqdbPS6UakpD23TnU8FW6Sp4ku2wqoJa6xOe1mTHRIT+d
         8zZA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790921074; x=1791525874; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UM2JzAgkGD7BHOZnHMq8unejo4FpCXzpYWfXmWGl2mQ=;
        b=K6mbzwVRrveB30sOj45FGnFHwUyDTJrsP2ZAh+YZ57ydee7xIW6UvOooKvWgoF2QNp
         nHiTsgggVsRXSfmBXCAqrcn5MOa2NxjfDaQrrRpWVpR2jVtSDPXDVe7vg08dwAXZqiTb
         PkJluYyqPwiNse+V2GASy6W+awv5Q30aw49lLu0i3co/g4Wbtc0Y/0sCx/AQ/zkj2yzt
         AYHo7D6Ma3sBG1ORQNvHNo7l6f6K4KcMhiphbpijovIk6ncuOBfR7Y+dd83fAbl0BfC0
         zOe82Y1mupoZzIVpEijMbAJInmXRDXFA7RGD004UQnjVSzsWEVabIOuOeccBQf6GuRXE
         qQLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790921074; x=1791525874;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UM2JzAgkGD7BHOZnHMq8unejo4FpCXzpYWfXmWGl2mQ=;
        b=Ceu8aLuX5PgNHnTXb556udyMWevYf/NRRjGohnJd6ApLt648NenmKVXZxbYa8WTbJr
         oXoL8EZGk+T97Wo8tDnpWzE9m9psr1OPhgoIc/pZgm095SlptiTVlmGu8bQYUol4CcDa
         4PNhoouCGSF2SYBVcqOl9Op+8rQ4euIMP8F67abeemvrGb4oODzeghVpOIMNezLVXCD3
         FliCfdTzuxx3SGmUxNygTsE6QTOE07bXEcM18PT3nmMdRxHDlVUidjllOQe6bQ/LIYJs
         cvLZpy37Ud11A3KdQIiNTcCd0GbntWUVQ4M+Ex8ckl2IB7NaLT7WtvVdwo5oGcPsx6gr
         YJxg==
X-Forwarded-Encrypted: i=1; AKwUvBwlWWUNuj/RsmmvlQcxY8ld7u8bX2L9lf7dQXe50hZx5/VFgKFmAczfwBNsIt9yDECgOSC79XPoVYMvUJk=@vger.kernel.org
X-Gm-Message-State: AFuF++lJ1oPOEp1mP8RefIHeMYphbhSERSCqVALlmFaoKxZGPGvMPlbv
	iPWLtOO8JoA3qedMdR+71O6XQDAyOLGNMxx3d/dSMJ1o8YE7bL0EBL/J+mnwlaIry6YXp2IBv/G
	l1gEDKX5JcP3hHv45hUa4U6V+2x7A4rs=
X-Gm-Gg: AYBFou2t6Po16IpKwVAUHltWyO9ncg7eeg53i/6ExE/Aq3c2mxLjM34coFJZVtshscA
	tKQNhXb94pUxP24MXHIpD7UNh2yJpWK2P0eMZB2F+ic6QPg8Y+V164gdiQnybGeMDVdLKvUjNgF
	bH00giOSGtUiPK4eJjDtS7QYK9CXY++AqgiGK42XCK2zHKXq1KmS01duQrEvHozONsE7nqdEk1l
	5Mq6MQ6PA/NKLZC1rD9uRKrGis1+NVxK23ahLDzIxSm5GDNvPygSzJxE4Apuu9dG3BLflRzMBql
	Ecgl9xPSU0uq2PaB1L+g3v6FHIddHQQuEnuoT1MYTnmJ+MrBFILq9av3/LhlaiKSq9Ki6BfDtr0
	OjNAAYMdD5YqE1f2O3kluRxRCYzvv1cGUhxelZuXKcLSAtGobWwX8uGQ=
X-Received: by 2002:a05:6820:201a:b0:6d7:a13d:fd88 with SMTP id
 006d021491bc7-6df2f9f956fmr1350599eaf.5.1790921073726; Thu, 01 Oct 2026
 23:04:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261001143003.755790-1-omermetekaya0@gmail.com>
 <87se2pwhzh.fsf@mailhost.krisman.be> <20874bd2-f827-4ef8-9855-dc8aaec874fa@gmail.com>
In-Reply-To: <20874bd2-f827-4ef8-9855-dc8aaec874fa@gmail.com>
From: Ming Lei <tom.leiming@gmail.com>
Date: Fri, 2 Oct 2026 01:04:22 -0500
X-Gm-Features: AclHuK-2gZQmIhwRNDJtA7gikD9hOOnuFgkdKl3Un0Ewa3PUIIoqG4O6oFR_xWQ
Message-ID: <CACVXFVMrjhACs9mQMkJJxYXsTyh=a1ZHUmg1i9hK2+TZdwbXFQ@mail.gmail.com>
Subject: Re: [PATCH] io_uring: fix out-of-bounds bvec access in io_vec_fill_kern_bvec
To: =?UTF-8?Q?=C3=96mer_Mete_Kaya?= <omermetekaya0@gmail.com>
Cc: Gabriel Krisman Bertazi <gabriel@krisman.be>, axboe@kernel.dk, io-uring@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 1, 2026 at 2:55=E2=80=AFPM =C3=96mer Mete Kaya <omermetekaya0@g=
mail.com> wrote:
>
>
>
> On 10/1/26 18:36, Gabriel Krisman Bertazi wrote:
> > =C3=96mer Mete Kaya <omermetekaya0@gmail.com> writes:
> >
> >> for_each_mp_bvec() dereferences src_bvec[bi_idx] in the loop condition
> >> before the body is entered, with no guard against bi_idx reaching
> >> imu->nr_bvecs. iov_kern_bvec_size() stops iterating when i reaches
> >> imu->nr_bvecs even if bi_size is still non-zero, so the fill loop can
> >> walk past the end of the bvec array and overrun res_bvec[].
> >>
> >> Open-code the loop with an explicit bi_idx < imu->nr_bvecs check befor=
e
> >> the dereference, matching the termination condition in
> >> iov_kern_bvec_size().
> >
> > Do you have a reproducer?  This should be checked in iov_kern_bvec_size=
.
> > We make sure it doesn't go through imu->len which should match bv_len,
> > IIUC.
>
> Yes I checked more and looks like the *bug* is unreachable via existing
> in-tree callers.>>
> >> Fixes: 1045afae4b88 ("io_uring: support vectored kernel fixed buffer")
>
> It doesnt fix something broken actually, more like a defensive refactorin=
g.
>
> >> Signed-off-by: =C3=96mer Mete Kaya <omermetekaya0@gmail.com>
> >> ---
> >>  io_uring/rsrc.c | 7 ++++++-
> >>  1 file changed, 6 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/io_uring/rsrc.c b/io_uring/rsrc.c
> >> index 51b46e624..3d29a0c7b 100644
> >> --- a/io_uring/rsrc.c
> >> +++ b/io_uring/rsrc.c
> >> @@ -1614,8 +1614,13 @@ static int io_vec_fill_kern_bvec(int ddir, stru=
ct iov_iter *iter,
> >>              struct bio_vec bv;
> >>
> >>              bvec_iter_advance(src_bvec, &bi, offset);
> >> -            for_each_mp_bvec(bv, src_bvec, bi, bi)
> >> +            while (bi.bi_size) {
> >
> > bi.bi_size is the first condition of for_each_mp_bvec.  Do you really
> > need an open coded loop?  If there is an issue, can we just add the
> > check below?
>
> mp_bvec_iter_bvec() is called in the for-loop condition not the body:
>
>     for (iter =3D (start);
>         (iter).bi_size &&
>             ((bvl =3D mp_bvec_iter_bvec((bio_vec), (iter))), 1); <-***
>         bvec_iter_advance_single(...))
>
> src_bvec[bi_idx] is dereferenced before the loop body is entered.
> A check inside the body executes after the out-of-bounds read has
> already occurred. The open-coded loop is the way to check bi_idx
> before the dereference. The question is "should the kernel be defensive
> itself or trust the callers?". If you find these kinds of defensive
> controls unnecessary, happy to withdraw the patch instead of releasing v2=
.

bio/bvec iterator is written in this way from begining.

So it looks you should work on improving the iterator helper, instead of op=
en
code for the single user only.


Thanks,
Ming Lei
