Received: from mail-oo2-f35.google.com (mail-oo2-f35.google.com [74.125.231.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95FCF220F2A
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 18:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.163
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789840981; cv=pass; b=iA+gyyQX+xsDIsVzQMBXoFOShYA6W6LqbhSw+F3+cfcuooj+SAU/F8Lw9FZoEHHLMa2JjGM+sDoJuxu5dd/v6DW6PPD2VhbXpgCZfLM16x4P07PjEgb4QJRT3xUNqiNBJdKVFQB/L4ilpUVu6L0iMxqqT3nWcmIgBeLcS5bYsh4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789840981; c=relaxed/simple;
	bh=ZnIxT/qMr1gdbVRylwtNaFD3JyKemoHZb1UvE3gbJzg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lV3ALhcRmoTU/tlcH7yMNdpNQM/M9Q/0AMKy8CAa06ttpM0xT1yPllzE/Dzde8ooaB1sepEJbdJQqgX8bf2Qc19VHHEoe93/Pe9dvwndC3YtLP8l+ej3s7IgKEETwEwzL5BHGBl2wtXXdG9nzmbUizhMsFzSMeegxpVmFG/VHwE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RqCIAJli; arc=pass smtp.client-ip=74.125.231.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RqCIAJli"
Received: by mail-oo2-f35.google.com with SMTP id 006d021491bc7-6b1ae736c64so1261112eaf.2
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 11:02:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789840977; cv=none;
        d=google.com; s=arc-20260327;
        b=j5ujC9u69RAJSJrP2FESNmp/P8V7xb1Ar95sBbnG7f5udXPAXdTd64mq33JF2UJWFI
         4jOYoxmVKPVdn68LiGyVTCZ45syAAqSwx/7rvKGJUnOPvxIOY6xgfn+kJiBFDPOFeHxX
         hvtTvTg/+dVEDL06RkzELzs5DuJcd5SzNLUMchy8WF7TKCtjleSmvPqJ4MWlxdiJrS9X
         VxW04Rt47MqBcpYf22ThgaOYhZuj5Oiti1MB5e5/4KD1NPpOIbQmkKp/B2J2KeXnOHX/
         /Kajn2DFZVn5sXyYtsTwVI0o/+sr7jJCDCTjkABSnjrtBcg9FEpUpk4qaI7ILsXdFWok
         jUkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NDKPZzjFZ5Bv8sDLp41bGNciktq2X5zHxI+b3pe3hs4=;
        fh=cG1nGTkr4RSJwfC2z/wWO1GPfGYrGb2MrY+fxdcLC1c=;
        b=WdDPDddHVRZmCtU6ekzUZOJpePZVSTdKHzy5Og5X1tJv9huu0iHwBNKxti6rE1yKET
         TdAnQ8acDwqqlaOSKmKCloY+tapD2Lz4AsfmhJdj9p21pcLxV347XlGIZdgBazofLkx9
         V4pPbnnO9NYX8JnPEcCg78y9Gsa39SKelIdDPR/7Yn9kTF2waHKsWUF3eP0QTROxEzL9
         MU3QBZJOTAQ79sRH0YQoBrLd8N5DrLTsy2QAPV/UW4br8QKINVCdjaFr2tX11GHMoqIg
         CGYTGmFle+3dUwQNTAVYxm05nyMQi0Y7m08bbMJD/j1Y3pRniGcVm6pJUTDUXQ0qhKp+
         9IsA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789840977; x=1790445777; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NDKPZzjFZ5Bv8sDLp41bGNciktq2X5zHxI+b3pe3hs4=;
        b=RqCIAJliHegb50OkBHm0bSinDzC6IXdxVS4KfIA6aSfD6TZCJA51CAIgaZwK+AIF/6
         bdnUuTDIKUgPR2yFwkOgPzRSwyhwJUKcPhoW/wqVTPLsAkpoYB+b5n8IR3VzHB8yDOtq
         JcV/as89DaXawq3qmTrPbiSdnlJtqkB2EX+ku2m7SjRQfkFToXjqrHyvp8Gw6p+7GTWb
         /Ea7DU/Q5A1yh+Q3SEC06587ZbdC69JBDejvDjem5MkCT7UhrNJL7YoX2guVuv7qC6XM
         JcT6WH5Ymjh1IblmpJr3twcyVPaMBk6vmLKvbFRRCUDRmqGFchEzDM9JCUIUn1/PjRFv
         NaEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789840977; x=1790445777;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NDKPZzjFZ5Bv8sDLp41bGNciktq2X5zHxI+b3pe3hs4=;
        b=1lqrKouBWBE10BJA/gL0VflKCkRKw0+yaFAKTNQG1Rg/R+6pHRiJEtjvEosWPQgIWK
         ScXqrCWQowdenPQqU8ox0cEVTNjxlLzjBxq/+bU5l9CIgX2fKn3MT3SaOG5hVCC82+ff
         xoUbnwzNwPOafUzwIVEd1cod2DTeBE25HoQGzUYH6h5F+naMu+hvsIxzZvvMdvVRBsXR
         sZT7riPMywzchoeoqnEdZSmUHPXv+va3uiWJDjc6pYiZteQwXMY3Wd7oZZmLywAxFLoA
         LxYlsbGBuPUuixrmKhDG+8RlGAzbl7sPZWSotalRawRg1o6vC6+QT2Ijmp2Dyx6QGBc9
         ZfRQ==
X-Forwarded-Encrypted: i=1; AKwUvBxuwDm/ol+vFo3A/JW21qihso2UlLzdHJLI2n5XLs00Kzd43Z5/O1p1IEwHqY7ZiN4r3djHTwXC46X1/Fc=@vger.kernel.org
X-Gm-Message-State: AFuF++kIa9reaKD6Xk3ubhuYlL5sBA4EEMwAaOnLjXZibyYnfmYmfpDR
	md6P60zJXV5RzBf7Cnx173XEX2JRddupyPWoTwfbpfvHEynNcIfiYWTXjWS19p2jU/9grL7CFKu
	dEj8mbp0e29xCqpC4bv9vn28uytFy9wE=
X-Gm-Gg: AYBFou0dofaSOPFUQ7tcsSruvqPlj3xY44wfKvtWJ6ZURna8soEVHHVBDW0tMOyW57J
	oKzgHhzeR9prHfjfnxoKFRWvnszRrVyUPTSN98dIFPkUNvy2GZbejK5RGrDmEmqs9dXGtPbmjrR
	HkG1Gud2pxIGUJVM6gvCjfRJdv3LWAr8IgIxxWixdb9MhSBNVfOwnXiYLa9rL0pD0oh3TRsf5PW
	45aLFc1dzLlY1NE16xpZffhzH57NHVkOjxspChtmWLSE+TH0Q27U2E8ZQoGermb3E0cJlvfC7Mu
	/dtAwZOTR2yIDTYdmaxsXGb3RFaQno0RiJZ043h2HNY+RJsX4Kin+ABlDdM1QYgFXCV1ik8ZSey
	kPmE72kSedDUCU9eLsRJr61SX5gP3JtlJnEYopGT6
X-Received: by 2002:a05:6820:222a:b0:6b4:117e:543 with SMTP id
 006d021491bc7-6ca9aa41fd6mr5401676eaf.21.1789840976828; Sat, 19 Sep 2026
 11:02:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1787770110.git.jbingham@gmail.com> <668bd5f317e3bf8eaee0254ca79e595395b6e332.1787770110.git.jbingham@gmail.com>
 <aq1UW699LW2pxvHU@infradead.org>
In-Reply-To: <aq1UW699LW2pxvHU@infradead.org>
From: Jeremy Bingham <jbingham@gmail.com>
Date: Sat, 19 Sep 2026 11:02:46 -0700
X-Gm-Features: AcwNN1WZl_zWUcTPKwWMEvYAQm5b_50lhzbDf2T03tQlLz_DhKb6TapJfNS5Vdo
Message-ID: <CAMyBmMCJC6F=y5_3sbC+2t+6NZVkD2ve2xOhxLDeLPfe7YBJUQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] minix: finish wiring in iomap functions
To: Christoph Hellwig <hch@infradead.org>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	brauner@kernel.org, jkoolstra@xs4all.nl, jack@suse.cz, djwong@kernel.org, 
	viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I've seen all the comments on formatting and will be fixing them, but
I'll just note that once and not keep repeating myself.

On Fri, Sep 18, 2026 at 8:10=E2=80=AFAM Christoph Hellwig <hch@infradead.or=
g> wrote:
>
> On Wed, Aug 26, 2026 at 02:41:57PM -0700, Jeremy Bingham wrote:
> > Wire in the new iomap functionality in one pass. Per Christoph Hellwig'=
s
> > feedback, there are no longer direct I/O operations. Without that, only
> > write_iter in minix_file_operations needs a custom function. That and
> > exporting minix_setattr for minix_symlink_inode_operations are the only
> > changes in file.c.
>
> Commit history just goes into the cover letter.  In genral you don't
> need to enumerate all low-level changes either.  Explain the high-level
> change, what motivated it, and anything that looks a bit unusual and
> unexpected for that high-level change.
>
> Note that you probably want to merge this into the previous patch
> adding the actual iomap ops instead of leaving them dangling between
> thet two patches.

Indeed, and thank you for letting me know that this ought to be merged
into the previous patch. I didn't want to run afoul of making the
patch too big.

> > +
> > +     if (ret > 0)
> > +             ret =3D generic_write_sync(iocb, ret);
> > +
> > +unlock:
> > +     inode_unlock(inode);
>
> For most file systems we try to have the generic_write_sync outside
> the inode lock to not do the expensive sync with the inode locked.
> generic_file_write_iter also doesn't have the inode locked, so you
> should probably sync after dropping the lock here as swell.

That makes sense. I'll rearrange that.

> If you're looking for another project, we could probably also have
> a iomap version of the directories in pagecache used by minix, ext2
> and co eventually.

That does sound worth working on. I don't love having the directory
operations using a completely different framework than everything
else, but since minix was not the only filesystem afffected by that I
left it be.

Thanks again, and I'll start getting this turned around post-haste.

-j
