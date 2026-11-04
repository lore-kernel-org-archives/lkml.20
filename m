Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.139
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793762887;
	b=vAVEeJyP5qnJLE57KHO0hDKqBOrli3hu4wg/uo1kkNpX+aqwv+4LsrvGITuGmc+MWIHK
	 lMnMAAui/gknvV+GHx7xRRvkwIRbQ7osS3R/7w6C0KFnlUtaQZduCD5LTKGUPwlL+kwHj
	 C6fw0OjJqL+0Nzir0ZiOBVpqxencix4axwLu4ZabQAaNd+XpwSNWz1Dez0iT1CBTn1dDU
	 OghYjGd/F/thhk1cq3l6HPQwrLUj+L/Of/FutnQ056iydl61889xlsUfbrgNWHKS96nVB
	 9a1lN3Hrv0Vfm75gBDpb3E+CBRXlJgZh7GYUu3HJVBBZZPoC5N+dldB9q7Ybz/20m8g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793762887;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=TKN5fm3lE6PDFTg4E4wZZqhp3eyt6dK1s1483aTN3Bo=;
	b=GfjIPa3WpzVYCsJO2d28vEdsmVaoUkqe8qp5Cl1XFwUqzqYLInq4+MCrhTmJIP1G6+Wg
	 tGWEKAL9NXNS5v2qM4/Q00p5XCRVwx0qt0nrl3zBga5fccXh87Gm6EXL0P2M9FjJ8JMTp
	 9IyYeRLVLaOjgpTYVfe94Yyc/dAkj0HisQZ345vpGGLiy1W8caj0tAA9S01CbDyEdft0y
	 72I9jSYvA3RIRnNsBRuoqdle+0oyt7sKHhBwSbiwgnGDeNF/pyoF5d42XQFvbvKtNdw9n
	 oEZeVZhy5PEBW1wMDkvX1mb3uaIS7FScb4UB0xH/mDuXCY2LLknEbUHaPy0IwUMQ0wA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Dw1w6O5E;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.139
Received: from mail-yx2-f11.google.com (mail-yx2-f11.google.com [74.125.224.139])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E663C606A328
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 03:28:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E663C606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Dw1w6O5E
Received: by mail-yx2-f11.google.com with SMTP id 956f58d0204a3-67a51292ce3so147877d50.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 19:28:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793762886; cv=none;
        d=google.com; s=arc-20260327;
        b=eYdAAc1nsII26IZq6md5xJLqy0T6iqb9oSV3BfvkeG6ElHunGjO3QXMFV5BuHtjcSI
         mz1LB7H68ssQha3TVh5159cbUIdH+0AkVgztE2j7LIUHzX9vCSw2EQG+QhNIT+Bj1ODs
         v7gX0gnyb9BdZ6S/VdgUT2QewzX1fl4I5vwe/ZwUdwAg59ilGEHZMNiiNqMYmN76LLVu
         kbDszGLdVcYytOA2xRiH8R5DAANNOTomqTgQYtFppXopa3i+m3tr7jMDU59F6OB3DK7/
         nmB6UmJdCTBJUb0dEYLAI/JfOlyzCV72WefwM3fDmcEiybedwVMeipoG1eBps49DXx8P
         Y4hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TKN5fm3lE6PDFTg4E4wZZqhp3eyt6dK1s1483aTN3Bo=;
        fh=qNq+yb7yALD7deIB4E/bMvddW2jBfh9usBaSFQZngsk=;
        b=mfE6Gp9+IlGiJRKX4UP4cmP3KZkwR863dv5BOlXrAGGwWiJDShP4qmVyQhem81j/U/
         sAe+5UEwcTQxzOL2EMtn6PVxIg8E4BdmlqAOmM6ss6mb6JbbRjoCiPlkrpBiFCeU4XEe
         b97yICD2wtxzpu9fAcCf27a+Rl4r7KDgYrn9sBIaUi+RK2SoO0RIm6JWPFzU31lcFPEW
         tQWz/uvMztnBWiZ7mYQ72/voUtLOOxkHITm6dZCspmQN0gGdnjcHmGFFPB2eoVxqaWJK
         VgV4AoHVFK/gFn4fEgsTVrn9JrFQLNwZs8ohUOXhxQV+b61R9pVWojTaFtxTRCPpnr9a
         wBeQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793762886; x=1794367686; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TKN5fm3lE6PDFTg4E4wZZqhp3eyt6dK1s1483aTN3Bo=;
        b=Dw1w6O5EUnpm393XQ2xHXvpYnx4DuRvEb75Qu6TwCtbbIxjyYM0Vb88t/Vc/UeEVVD
         5B7ypa7o5ZhemJ5Yvh77dquQToqee/RAyTWH74SrjIpeqD1tqkRJAhPnu7cTIkWul2bF
         eQalHBHwFKvLUQV9hdCGpbhUgbkd7RiMhkYOU2oD1V+niZVKMMaN4Ep5Dqxq9bsclcB0
         SQVeemz6NVgahtYGmTIoM6/vQeRfLFt1Vn/mNVSAT+d73T39tCXkoBKrn1ScqCl7AFf0
         iVRTJkV8FfiGoVTaNJSLcEfa084ZVqJa5OFGa6JMYCgFQCNVfuxCaG4za6Drh12gGSCF
         Bg7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793762886; x=1794367686;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TKN5fm3lE6PDFTg4E4wZZqhp3eyt6dK1s1483aTN3Bo=;
        b=YVAwLboct97P1LNczM9QR45KfY1ZTd1eKQcY+yFtaoY1rM83enTOd8hZraHQIBriM/
         sqNNFfrc1VQi4xYIxuXC4oRVyreutyxb+BcuP5f4jiP9NlfLfrTLqJftyRgEFPVq972h
         VlPVlyhYlLDi7afghn3hw2f3ancAyhHK870FUbMHHTEx39LNavIq453A6Bp4114vQmZd
         9fHIG0Kl14hISrquhxt39UwTYfbt86F5W1nZuobHHBAGpCjVoFKrBpWZapn3yHNf40YA
         uYpwkT1IyhXgu0+2wnanB+vqJ6KUSj5vMRbTxpfCPfBm9uwVl4b4rbsHv3TmxLEl6a0a
         eLOg==
X-Gm-Message-State: APuU4Z9jW3xMxeHaguc10Uc8bJqWUoLNBmbHemPh/RR4AkZZAqPBplHc
	gmcNIgLrtW5RNkyFJTO2HEM0oZ+vrG9kcr5k8LttL01GOr8BQBUkVYl9BHofH2PLg1cFKRvSp21
	BewwC8/cMNwwzX9Wrp80LwqCnWuAELX0=
X-Gm-Gg: AYBFou16d3ieMoI+uUFWRhdrixFRf0JZ+5FhGibdHTda+ibpSDgDmBcBqaxjxXJwBdz
	JqrrHwDLyW2Xt32ObxlW9AqjiRyiP7h4SOpB2IFSiZE3jcr2SIBCWAirPHjI3vHqhqG9ccqYb9E
	olpMGeMNj5XEtFDGCwWvW70rTcNjIOUIolc16kYmd/hmqR8Ic5g75q0VXJYUdBbxmHB9JMwAFPH
	68aH9mleUG6rJBesUKiPY2ZSfXuaJfG1uexhAQOcCkvjVYvhxovBuUxQqUEX5Ep4lEQ0iwSJkxj
	V9+4BT9rh1lfuZYxyxpTQ0thLNcX/4CpuXEOSVWoYFpg4kgebDfr2TtTemHc4dE+RVm3RlQGCME
	IpMZBRyTzm0rRE+qksx2PcUgIQG4zwOHSlrm/jlByW/Kv7GVyRQtiiZlcnjRwEp9/tjSdXuq9N1
	FHU+XUw45kGL2+7Kk=
X-Received: by 2002:a05:690e:484f:b0:679:bf13:c01b with SMTP id
 956f58d0204a3-67ba4e968d9mr7976806d50.17.1793762885716; Tue, 03 Nov 2026
 19:28:05 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103144148.14430-1-jianyungao89@gmail.com> <aun6-mywXYg2VTL4@nidhogg.toxiclabs.cc>
In-Reply-To: <aun6-mywXYg2VTL4@nidhogg.toxiclabs.cc>
From: Jianyun Gao <jianyungao89@gmail.com>
Date: Wed, 4 Nov 2026 11:27:54 +0800
X-Gm-Features: AclHuK8-QaZQophNFvzc0AoFSF-bpUKDXP10OLzU1_aqdxeGYmQPW2wekA4osYg
Message-ID: <CAHP3+4ChRtv5OCoRrF9-D2GYXJnu0kS4_3O7kXqYRbTtLAt8mA@mail.gmail.com>
Subject: Re: [PATCH] xfs: fix spurious len double-counting in rmap three-way
 merge check
To: Carlos Maiolino <cem@kernel.org>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	"Darrick J. Wong" <djwong@kernel.org>, Alexei Starovoitov <ast@kernel.org>, Eric Sandeen <sandeen@redhat.com>, 
	Mykyta Yatsenko <mykyta.yatsenko5@gmail.com>, Yuzuki Ishiyama <ishiyama@hpc.is.uec.ac.jp>, 
	Dave Chinner <dchinner@redhat.com>, 
	"open list:XFS FILESYSTEM" <linux-xfs@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Carlos,

Thanks for the review. To answer your questions:

How I found it: I found this while reviewing the merge logic in
xfs_rmap_map. After tracing the left-edge merge path, I noticed that
ltrec.rm_blockcount is already updated at line 1119
(ltrec.rm_blockcount +=3D len), so adding len again in the overflow check
is redundant. When the real merged length is still within
XFS_RMAP_LEN_MAX but the inflated value exceeds it, the three-way merge
is incorrectly rejected, leaving the right record unmerged.

Testing: I ran the rmap-specific regression tests with this patch
applied, using kvm-xfstests on a 4k-block XFS configuration with
rmapbt=3D1 and reflink=3D1:

  kvm-xfstests -c xfs/4k xfs/236 xfs/578

Results:
  xfs/236      Pass     6s
  xfs/578      Pass     34s
Totals: 2 tests, 0 skipped, 0 failures, 0 errors

xfs/236 directly exercises the rmap btree grow/shrink paths affected by
this change. I did not observe any regressions or warnings.
If there are specific test cases you'd like me to run, please let me know.

Thanks,
Jianyun

On Tue, Nov 3, 2026 at 11:33=E2=80=AFPM Carlos Maiolino <cem@kernel.org> wr=
ote:
>
> On Tue, Nov 03, 2026 at 10:41:44PM +0800, jianyungao89@gmail.com wrote:
> > From: Jianyun Gao <jianyungao89@gmail.com>
> >
> > In xfs_rmap_map, the left-edge merge path already executes
> > ltrec.rm_blockcount +=3D len at line 1119 before checking whether the
> > right record is also contiguous and can be merged.  The subsequent
> > overflow guard therefore must compare the already-incremented
> > ltrec.rm_blockcount plus gtrec.rm_blockcount against XFS_RMAP_LEN_MAX,
> > but it incorrectly adds len a second time:
> >
> > (unsigned long)ltrec.rm_blockcount + len +
> >    gtrec.rm_blockcount <=3D XFS_RMAP_LEN_MAX
> >
> > The extra len makes the check too strict: when the real merged length
> > does not overflow but the inflated value exceeds XFS_RMAP_LEN_MAX, the
> > three-way merge is rejected and the code falls back to a two-way merge,
> > leaving the right record unmerged.  This produces rmap btree
> > fragmentation but does not corrupt on-disk metadata.
> >
> > Remove the spurious len from the overflow check.
> >
> > Fixes: 0a1b0b3855cf7 ("xfs: add an extent to the rmap btree")
> > Cc: <stable@vger.kernel.org>
> > Signed-off-by: Jianyun Gao <jianyungao89@gmail.com>
>
> Hi, even though this looks reasonably correct, how did you find this
> issue?
> Did you test this at all against any regressions (i.e. running it
> against xfstests)? This is touching critical logic on the rmap trees
> which can potentially end really bad.
>
> Cheers.
>
> > ---
> >  fs/xfs/libxfs/xfs_rmap.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/fs/xfs/libxfs/xfs_rmap.c b/fs/xfs/libxfs/xfs_rmap.c
> > index 14aef87837a9..c2b2f8e7502d 100644
> > --- a/fs/xfs/libxfs/xfs_rmap.c
> > +++ b/fs/xfs/libxfs/xfs_rmap.c
> > @@ -1120,7 +1120,7 @@ xfs_rmap_map(
> >               if (have_gt &&
> >                   bno + len =3D=3D gtrec.rm_startblock &&
> >                   (ignore_off || offset + len =3D=3D gtrec.rm_offset) &=
&
> > -                 (unsigned long)ltrec.rm_blockcount + len +
> > +                 (unsigned long)ltrec.rm_blockcount +
> >                               gtrec.rm_blockcount <=3D XFS_RMAP_LEN_MAX=
) {
> >                       /*
> >                        * right edge also contiguous, delete right recor=
d
> > --
> > 2.34.1
> >
> >
