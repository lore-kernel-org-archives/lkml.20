Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A2A3ACA4B
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 04:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791432881; cv=pass; b=nJsl3eT2ihxy6rTKVRUJoltQxCvIkxDcAlkbEzRsEXmAeWbhRBPlYaglKgmtAxK2bzj/mrHfc3Lty1tg9dAmrWRCiqhIklv9bHHEXeaZONclJPm6ZRVyR38rx9+IxB3es39FX/0iXNYhsOBoxWPy5Eowu3pMptzbkFMxusAUNiU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791432881; c=relaxed/simple;
	bh=D/PG0O7im4ffUb/epjeq+lDDmxyUxbAM6aLOuJ0HsLE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PfZZ+e2uNE5C/x8+0B49r+aZbFi2poS4RhAzRqGbpcCLyea12do82jh9hteiwQaUy5RXd1xuT8N+UcjuMqya7IuVoYfcGdoL7D6O8yt1uzI2npndXH2nr8RmgReOJvxY4GXiyZYP/3zlFENN/81RBoC6ZyJvUk6kLpx8aln+1FY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MGWVAEdy; arc=pass smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MGWVAEdy"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c2dc8cb0decso478089866b.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 21:14:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791432878; cv=none;
        d=google.com; s=arc-20260327;
        b=MOgIa0ymsPX2b8eg9P24hcAqbEnK1u/2YLT+RVPIOC87fpxSu7yIzEOzA4ojGbLTa9
         dgTQsUXGrt7zlfkoRgBibVry5nArchamVsqicJ1e066jieUGsd63cOJa0u26x9ibuhhg
         wB/28sm6omafa5cjBIwZgxhkQxKHoy1zDKmxb38MpsjgvWNiYq5Lw5olU4wMn6KWmTvm
         tn6/FlSHLAmWqOXiUZUEdFDnOIblzHMCAXFQG9vj7n709NoRiiy73tzrQBktWhHokLm5
         azpMJZn4BTp9smefpWimixx2bv9Idr7eMoF7kEvbO9pPOcyIPxc9JGW4AzZh6VpJ0QHw
         ZDaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=D/PG0O7im4ffUb/epjeq+lDDmxyUxbAM6aLOuJ0HsLE=;
        fh=i3q182PLRxDTByN0qtdr7i5WQtWjZy+02a40iEBXDuw=;
        b=febXPtrYSyDihHjvFqWj2+cy+gmwNh78pRl3fmxIAAeNdha5H1CuyqSwiRxRMMoaTi
         NcZjkl87hY1LJcqfvjg5wCE/fYF+dX4P0fq50rn3nfzz5exPM2G8AijZJDAIxTv1Sv0g
         EB/tzB5Fso5BeChtNsb0tnRV1AbbWvW7qYwZfvHz6HBxI7rOH8gfNYMaUdPMTkJuJKux
         N4ERPTToyC73QJWINn06KvAlyforVljZcCLJevdyPh3trWwXZhL6rHXe/UclFCvSRJrW
         msZaAPXH08d4p4SOkXI4nTj1PwcQj9X3y4389eAthnchcH+At1DK7RUVb/AkfTDm3cz4
         Ettg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791432878; x=1792037678; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D/PG0O7im4ffUb/epjeq+lDDmxyUxbAM6aLOuJ0HsLE=;
        b=MGWVAEdy2P/D5fw5RyVmWLyzlg047+oEBe5b7YXifvCgA88LNYV154T+/gbdcF0JlB
         hcsgAsKoXPk1HNmkEjpm8VMhFsd79dIM/bB9vW6jHXswbqF/43gyEqT/SwiengEDoYs8
         z+01EZR+Ar28wfuMpNZz78dJNBgwlabiwKaSsZjXxdeJuQxYFHRELgC029S+0zpwUh/g
         opBXywui++KxpBn8SEsTVBGoiB9Q/njWqNllxtZl7FX06yFE4p0UtMbpn4Bt/HlXBe+T
         lLB+0XPK+dK6INvhO8M/3f1xx09H4YSqrNQEl3bsSTUilFmrFBOzRyfCewFpCfpVq52n
         KjwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791432878; x=1792037678;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=D/PG0O7im4ffUb/epjeq+lDDmxyUxbAM6aLOuJ0HsLE=;
        b=uzHcszxEeCbAMGApdvzLnPdWNdT14SQeWGoE34Pz/sSwqfFDZIbTvecWwFYZK4C+p9
         veaL3hN/K0x4Smf7Mbl7bBIix/ZboC6qv8IIFfN/kyj/jzyVMdCgzWyrgPcTdeFA+bo0
         U25lMsQMn7i6Ggh2+H7Kyek/LvI6aweAowVX21EtOSWNGdL1sPeC3w1dMgTadlWPl6IB
         VW038Btph0v8Y7FgARftgYsTu+bvjBj23xQtfQ+yExdunJr1Dt90CYQr+5zpgHGYNwX0
         DRoKTcvOUMGil1x721OpvDLluivzO6xNds3626Wr5NlXOrk3u6OlvzGb8CvToX6mjo3y
         010w==
X-Forwarded-Encrypted: i=1; AKwUvBxIEMqcKjuCoJOFxsuh53bmEdT5I7sFFZbZG/xrdzPDm68F5WLxxnWtewWuUEgHFMBNwj1JStrEYzJCSLI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJii48H5EOXAbg6U7Oc6Qn8E2t7tMN8LdKarM48Ayc+DZCqrlCH
	VONLdhyaYu7JwjeYihFf47p86mtJ/eGnLZmS0R5PSH5WxqKNxn7Y3D2ui5DGTOWgXH8LQ8BiQF3
	6NFkzbbMWEdVzr65BQJThPcCjKKB8zPu1wBJoR3Dl
X-Gm-Gg: AYBFou1iheXhaCZb7tuers9J5Zo29aGHCVjNUqK/FOwUH4pzXXsT1qt7WgESWefVIbV
	/e0cZNiwbMOmIspTxLx3KflZmT4An3JCeBMLrJgVUdV1+IkTmnBd7xicgBws281o2pUgowBFKV5
	H71gqrdRUsFt+Dzkjmznn1FNLAfuiHoBOO8MmR0Xsr8jto6W4SLrnNxyYPc9lzOuKayYkHOhxUm
	Iv/n2GZF/A7qarhOJ3+8/lyG1hyERtOkx5m2NRr/4PdQeXqSiS6MEWEuVq4ozzC4srOMy0Kp+d7
	9ljoorof3B1gM0408XPEH+un/4ZkQeJOaj/0ONg8USimqEZYTwnzVvDpbLyfeq18vKvU63Ytimy
	naYoocOd7oMc/KdzsqRPScpzXhr/qqvmVQK1w
X-Received: by 2002:a17:907:2da9:b0:c2d:c8be:4e71 with SMTP id
 a640c23a62f3a-c317bdbd04dmr375584066b.19.1791432877158; Wed, 07 Oct 2026
 21:14:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260909232351.1533034-1-shayba@google.com> <20260910184424.156341-1-shayba@google.com>
 <CABdmKX0B7zVfLY9Rov37U+gOTEXYSCMUe6=xFddOrKDVneiBGA@mail.gmail.com>
In-Reply-To: <CABdmKX0B7zVfLY9Rov37U+gOTEXYSCMUe6=xFddOrKDVneiBGA@mail.gmail.com>
From: Shai Barack <shayba@google.com>
Date: Wed, 7 Oct 2026 21:14:23 -0700
X-Gm-Features: AclHuK-Lj8Qjx6iM6hIILhXX7x1mxm-dHonA0g9RenLn6IaehjKV4XivMAFo11E
Message-ID: <CAK0PkCGgq=jP5h3uOGRaoKzwkXewbq5Lzmj=vTk58CeqM0h35g@mail.gmail.com>
Subject: Re: [PATCH v2] fuse: Forward vfs_fadvise to backing_file in
 passthrough mode
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: Amir Goldstein <amir73il@gmail.com>, "T.J. Mercier" <tjmercier@google.com>, 
	Bernd Schubert <bschubert@ddn.com>, Sandeep Dhavale <dhavale@google.com>, 
	Akilesh Kailash <akailash@google.com>, Suren Baghdasaryan <surenb@google.com>, fuse-devel@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Miklos,

Gentle ping on this v2 patch when you have a chance. It has
Reviewed-by tags from Amir and T.J.

Cheers!


On Thu, Sep 24, 2026 at 5:01 AM T.J. Mercier <tjmercier@google.com> wrote:
>
> On Thu, Sep 10, 2026 at 11:45 AM Shai Barack <shayba@google.com> wrote:
> >
> > When an application invokes posix_fadvise(..., POSIX_FADV_DONTNEED) or
> > other fadvise advice on a FUSE passthrough file descriptor, the VFS
> > currently only executes generic_fadvise() on the upper FUSE inode
> > mapping.
> >
> > Because FUSE passthrough does not forward fadvise operations to the
> > underlying backing file, pages residing in the lower filesystem's
> > pagecache remain resident in memory.
> >
> > During media-heavy workloads (such as image thumbnail generation or
> > streaming), single-access file data accumulates in the inactive pagecache
> > of the lower filesystem. Under memory pressure, the kernel retains these
> > stale media pages and instead evicts active executable pages from
> > running processes, leading to severe direct reclaim latency spikes.
> >
> > Architecturally, Linux VFS supports filesystem-specific fadvise
> > delegation via the .fadvise hook in struct file_operations. Implement
> > fuse_file_fadvise() in fs/fuse/file.c and register it in
> > fuse_file_operations. When passthrough is active on a fuse_file,
> > fuse_file_fadvise() forwards the vfs_fadvise() call to the lower
> > backing_file under the opened credentials, allowing POSIX_FADV_DONTNEED
> > to cleanly invalidate the physical backing filesystem pagecache.
> >
> > Signed-off-by: Shai Barack <shayba@google.com>
>
> Reviewed-by: T.J. Mercier <tjmercier@google.com>
