Received: from mail-yx2-f5.google.com (mail-yx2-f5.google.com [74.125.224.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB4FB1419A4
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 15:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.133
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792252338; cv=pass; b=rzb+HsTBE/Y2Hk2swDGMVyvKV1nS7uLpZbIf3CbwpZE2yLfBlkh360NCY4Tqhc4ooT4ugK9Rf1VNDzna660jgYFpdReHHCPnS9H1+y9zcwTd219iUrTF0+ea7f54LwRCS/AsaKVdFEuV26Suf7jpdyMgwKAD/yLA0OLtvARA4Rw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792252338; c=relaxed/simple;
	bh=bnjkPkEAdPmINg1RA9oDgANNlvYD2LriHvYJDibwokM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hcuVTweQxHWvrl2q8ZgA0lrY+TQoGyhOw2OpGl7Ja+Kg5f+cojiM75bubW2yuwAmyyB7RVtTc4zRxs56goL/Wtx/xQQwjZb2oQqBK8xO1+Ghy55WWZCVe9jnohUwSZkbB6Je9F6fEXecnPjYtxD73iZYVDUYYgrwMsAW/LUe3tA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dcnGGOVi; arc=pass smtp.client-ip=74.125.224.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dcnGGOVi"
Received: by mail-yx2-f5.google.com with SMTP id 956f58d0204a3-677bd24a602so433972d50.1
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 08:52:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792252335; cv=none;
        d=google.com; s=arc-20260327;
        b=m9/zJQ8DrctLag/Lxtben/KfOoQyPxgrNloMWv6cINjQtZivhl20RePg/kCvMCM0a6
         z64oOI3D8+4JwIjG8ji4EDWj9t8Rp17qrOz62m1iNlyj0gJSy1IZaba98Z2wAXqAKO/M
         Tw0rTgjHoTFDR/IQVWZWwfG0+LxYJT/+Lv5sP1M8s1KitDcz4hg8qUOdLa8MhmDHxo19
         /dPgGwWS7+FhbUdJHiX0zAtAg8DEHcduGTCIXQT6aY94TVutB2Zd4LXHklbp/7lHVZuP
         QU5o1gA3YTT+E5HWBlPOuj9nwGmYHunZvVSlx/klm+67+yyaQ0Gfcaldoa8IOqlYzUrW
         UHfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OLXPXIfPNuS9IvRUvmHmUY/S7grY8emZfJl3BOr7iEQ=;
        fh=T6JO3dmWkaK94N6EuBLEjpjlRJ80aHZUI4eNVhDoh/A=;
        b=pF4oZiXppMnQFsJUrcnfcIzI2ZM1jDAjrt+7ydWeAUqPK2BPLvzgAzD8aA0+kHuV5k
         J801IpzpJTr6T70BghrNaml/o8Dci23p0NU8BIpIekSH50yEbYbHAk/gNULNtoXeZWMN
         XoaB0Uy8frh/H3L1e/w/Ko5GsolszFWVDfRd3exiVnzNXUw3lnE16hl2udpHv0IEy+nl
         Ft329F6H9GVtRA1YVuHX4CgCnu+fXLzdjCt6+Fz2uIVtihWTqvYeg17P6EKk7CYHvqr3
         2vQGfrd0kchgFpKNSed5t51zgACdyGn1YCXK2qy/Wl0rQwAadOTL5e5l628/mVICEwxB
         m2oQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792252335; x=1792857135; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OLXPXIfPNuS9IvRUvmHmUY/S7grY8emZfJl3BOr7iEQ=;
        b=dcnGGOVi2qMPVzLdYHUiLAoMFDYdVZ09tbeOAxxtDl76xrsp1eKZ6E+AT8ZSGq24Wv
         XXy8HYbgaRiRLS9spqVU0mQJWDZgU8THa93DyqTLtg8BrwuWjktAuY0nLLsn2Agb0gSy
         BrN22SbRLT/pv76V0gWm/gUEPO3o4EfYPCpaRsNErREq/4a8S3DCRf+Cjd5W0NUYDQKq
         iQAOsh+1jsPQv0R5NEp7G/8zIZt2UGHT0nIZfSCVtfWklt5wguq7tHH33ajgniJBEpCv
         LMS4xrjr+ryVFvJmVCVagwm+BRKyGXeEtZFrd0fyCrDST3CmiIwizXjsEFldakr4NQRl
         K84A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792252335; x=1792857135;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OLXPXIfPNuS9IvRUvmHmUY/S7grY8emZfJl3BOr7iEQ=;
        b=YwAuWGYMaZuJa7MEfvWcjnKkRkELKS9SF85XFG2MpuCXAQyVihqX63k04JPG0fe/ZW
         17gQgRifmUfH5Q03q9wc37RBI6cDFXwRbtUTnUzvGa29mgoXdPLyszaM1TWbO9MerG1a
         gV0MEA/ykeS3qVEfE+PPub2er9yXYrb33mLcYe9p581eueik4WKUZGwPr2kS/fdG2+b+
         LpGKITf1Uv5PZL48st4vbL61sF4FNVvAK7joxVcicS1u8dahbZqoXiaB+YSpXHFIV/lN
         LegM7Gb4955x3gTjnjLKgwkhbpBX7TsLdFuDojDfhuvvGmGBbN+JGogcmiF+YxeWBbpt
         YiqA==
X-Gm-Message-State: AFq9FYJ4aePrhZ2lmgSytyE9FgqNsckvsS4xaSUI7QIXF4nM2F2p9iJj
	kjZb90d5D1GtQkyi1ijuaNVNTPzl7U1UsNYLB8ouZbq2f700fGNYXVXv2Trtq7jRzGzdfvQ9UPr
	DJuy7uIcUAoGeGaUYz6do0gEwIBDPBME=
X-Gm-Gg: AYBFou3CzCLa9gXTnie6kHzTmjzphFODQeBwx8SpmrcDs/BCe5owifK9mm5bufmVlQb
	WKJyTdTwGQCCtITnIKih0oBmbIxRbufIdI+mttQg10DtsO/U2mBJadIAmZpl7mrx5t9HCkMij9J
	p3ieq5IxOfXxf0l1WMa7USJeOwpsZ0J0O0a9am5e8wrWASa3RcLvwg5cOqwtNjt7TjvjT4I0yfR
	0xfVq0rUBB/ZHPZrmbb9wa/8Eegqhw8nxE+AIp2qqcYfMEOEynAq7A65gkKuY/KqPqu6AQoIBHH
	84pZGk8l1eEYAOf51jHWZmZXb0ilfxZ0XJSgrbq692JCeAJBzAf+UPbkYIeCs/u7elgNl09DLtA
	0y4k/uUd3uRBVI/0KDp1dClwl3P2/9tpBmRY=
X-Received: by 2002:a53:bf0e:0:b0:677:afa4:a210 with SMTP id
 956f58d0204a3-679ca8c84e6mr690917d50.95.1792252334855; Sat, 17 Oct 2026
 08:52:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261015143426.17620-1-jianyungao89@gmail.com> <atF8f0Jdb8OMcE9I@aschofie-mobl2.lan>
In-Reply-To: <atF8f0Jdb8OMcE9I@aschofie-mobl2.lan>
From: Jianyun Gao <jianyungao89@gmail.com>
Date: Sat, 17 Oct 2026 23:52:03 +0800
X-Gm-Features: AclHuK9hDBQvGLcT3mNvFowJYZJuyWyo9WXLFqaeSLdb5QJcwrs-segceXyoX-g
Message-ID: <CAHP3+4CM=ZjuP+S10T9wxcBOBt3tXH0ObY42fcDUm2pGE1gr6Q@mail.gmail.com>
Subject: Re: [PATCH v3] dax: fix wrong error code returned from dax_dedupe_file_range_compare()
To: Alison Schofield <alison.schofield@intel.com>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Jan Kara <jack@suse.cz>, "Darrick J. Wong" <djwong@kernel.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, 
	Dan Williams <djbw@kernel.org>, Matthew Wilcox <willy@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Shiyang Ruan <ruansy.fnst@fujitsu.com>, 
	"open list:FILESYSTEMS (VFS and infrastructure)" <linux-fsdevel@vger.kernel.org>, 
	"open list:FILESYSTEM DIRECT ACCESS (DAX)" <nvdimm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alison,

Thanks for the heads-up. The Sashiko complaint in v3 is about a
pre-existing bug in dax_range_compare_iter() =E2=80=94 the size parameter
passed to dax_iomap_direct_access() is an absolute file offset
(ALIGN(pos1 + len, PAGE_SIZE)) rather than a relative length.

This is indeed a real bug, but it is a separate issue from what
this patch fixes (wrong error code propagation). I have already
addressed it in a separate patch:

  "dax: fix dax_range_compare_iter() to use correct size and address offset=
"

That patch fixes both the size parameter and the memcmp() addresses
(missing offset_in_page()). The two patches fix independent bugs and
can be applied separately.

I've also replied to Sashiko.

Thanks,
Jianyun

On Fri, Oct 16, 2026 at 9:23=E2=80=AFAM Alison Schofield
<alison.schofield@intel.com> wrote:
>
> On Thu, Oct 15, 2026 at 10:34:25PM +0800, jianyungao89@gmail.com wrote:
> > From: Jianyun Gao <jianyungao89@gmail.com>
> >
> > When dax_range_compare_iter() returns a negative error code (e.g. -EIO)=
,
> > dax_dedupe_file_range_compare() incorrectly returns 'ret' which holds t=
he
> > positive return value from iomap_iter() indicating more iterations rema=
in.
> > This positive value leaks to the caller, where vfs_dedupe_file_range()
> > interprets it as success (bytes_deduped =3D len), causing userspace to
> > incorrectly believe deduplication completed.
> >
> > Return 'status' instead to propagate the actual error code.
>
> Hi Jianyun,
>
> I looked at merging this today but the Sashiko response stopped me.
>
> I do see you addressed Sashiko in v1, ignored Sashiko in v2.
> If this v3 Sashiko complaint is one you've already addressed, please
> reply saying so. Thanks!
>
> -- Alison
>
> >
> > Fixes: 0e79e3736d54 ("fsdax: dedupe: iter two files at the same time")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Jianyun Gao <jianyungao89@gmail.com>
> > Reviewed-by: Jan Kara <jack@suse.cz>
> > Reviewed-by: "Darrick J. Wong" <djwong@kernel.org>
> > ---
> > Changes in v3:
> > - Fix the Fixes tag to point to the commit that actually introduced
> >   the bug (0e79e3736d54), not the one that renamed the variable
> > - Add Reviewed-by from Darrick J. Wong
> >
> > Link: https://lore.kernel.org/lkml/20261012144925.6728-1-jianyungao89@g=
mail.com/ # v2
> >  fs/dax.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/fs/dax.c b/fs/dax.c
> > index 6ba50142eeb2..1f6a4fbb97bd 100644
> > --- a/fs/dax.c
> > +++ b/fs/dax.c
> > @@ -2261,7 +2261,7 @@ int dax_dedupe_file_range_compare(struct inode *s=
rc, loff_t srcoff,
> >               status =3D dax_range_compare_iter(&src_iter, &dst_iter,
> >                               min(src_iter.len, dst_iter.len), same);
> >               if (status < 0)
> > -                     return ret;
> > +                     return status;
> >               src_iter.status =3D dst_iter.status =3D status;
> >       }
> >       return ret;
> > --
> > 2.34.1
> >
> >
