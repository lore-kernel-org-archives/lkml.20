Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A084F3905
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 20:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791837846; cv=pass; b=aGzuLnF7IuFOM5JsS4GIz+K7a+za8vexZ76FKtgmDL8e+kZxihxwBqwb3pzfIXS/Dvpt9MtjcNKvXhzG5Yh6dyk9pCNxCEoLx2Y9SBNIIqQyN+lMuqMkoCPKPSkU4DBFEMScTMx+tvZl5fifQqRO5kVYovx3Bk4rW3peh7GmanI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791837846; c=relaxed/simple;
	bh=QjRpgYjJa+kkNqeLuccwGd0OHr83JO9DtZuhqfen5Hg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MUPDOQba32atD9fKUMl1mJQZmdf/NeIvfyGFttZW/13SOOAINiDpBEo8uu/qYHNF4e6woVbyeQgUliqopw2J9Xp6d2+crLtoz07j/kN6PDvqmKLffBhoYO2/IBSNYjBr2c8nCver5yST2U26f9U1JVLwAuFL6oPhiNvYMvwxaTQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=everpuredata.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=everpuredata.com header.i=@everpuredata.com header.b=D7u/48+B; arc=pass smtp.client-ip=74.125.224.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=everpuredata.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=everpuredata.com header.i=@everpuredata.com header.b="D7u/48+B"
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-675676afc3cso2176867d50.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:44:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791837842; cv=none;
        d=google.com; s=arc-20260327;
        b=H1ACi7JhUAbk508OJxLOa88pir8M3rBfjqy38G6iAiYzE6I6ckGXDmX3WX0PWWUHv/
         WRJRTxnzC8g+rNKbAPOCZCGAFhzUwUr+zX5P8cQPGufVhA9r1fujnGHcsBn7mJznxYjY
         7Xdn4ZV5wc95/zpTfcWlDmkdlIWSIeY5Hda/Stdwn2qryJxpiluTGRV0p7lcPDslY14k
         5J0tInCiOon+HI4vxeQ57G+eJLGnPXjk8PhuC7q7KqoqkDwvkkIwDP1Kf15E3qp3FBsn
         SQ49r7gYgnVVtytSPAuqw3JCH/1JR/8TkjX5ZIM6zK3FhE9J3l6WfrRg1UhLWtYnn1fO
         wBpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JSUNRjKa8PC9uvL/lbt0WMhZ7tNYQSXReFk4D0bdIN0=;
        fh=PO+n/cByDSyc7fOLH7+DqlxOzlMyB8ivXHph5YdSPnk=;
        b=AxkWZGISVcOJVNAUDPbZGDBU7pLbFskQm1wTm6rW38isfBFp0WgusNuTw3AVDi+3kh
         prfJRs4B/G1xuHAKxnBfEF67whQFbOetOdKvbIW1CkmoT/IrpQqtLkJB8jFCOsZGSY0P
         Lfszv4xGwaFYSw3nGcMFsfWp1SE7tAZ8YPiguplYMzV2jJ14wEaLZDO0lqrBLeSqhDCi
         6Byo59w5FRihPLxYyNbHRwlkTvtAl/wVNAuYGG0cKH/76vMzqhPgXrsz49brBkBMp1AC
         w/XAfiTesIVsY3FJl+SuhfefTqM1QI3c0JTXHzf7iIdWZ8S1mYC58xVnd8PQ5IdmlWPS
         rJ+g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=everpuredata.com; s=google; t=1791837842; x=1792442642; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JSUNRjKa8PC9uvL/lbt0WMhZ7tNYQSXReFk4D0bdIN0=;
        b=D7u/48+BkhquwqL83JibC6JgxsN8Kx3M8KTl/EaWI0hClIeSKBnGxRAjYIKcIaerP1
         AhCuc8cIBuUPAxBh7w+Bs589EVhpMlgFN87LPvmI2TGtD+Obrkvk/F9SnK2bk0bYrb31
         35plovSOrFZfREygGZ/UHXx9VgASlDVumkHxFw1+JmmX9M8FJPA2pBfL2yZgSxoE5wHK
         lOZj/LZASEkfcOshiZL552Iby9uW96zVEbXodU4Z8ZgEiDaBpCyT2QBs/Gbk+A70BYzj
         fK8SRtswc3xcyuBcQ81gMnFr3khxkPj1eu3Hk1rYWLWcR+qRbaVRX/OcvOe41QX+0CUA
         hubA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791837842; x=1792442642;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JSUNRjKa8PC9uvL/lbt0WMhZ7tNYQSXReFk4D0bdIN0=;
        b=fKyg2h2vaxPPv6w1E5kU8JEGMhTVABQIThKmdgQbvyvUVSdLAuCsu8AZz9pZWluSiF
         +CXpK86VtB5IoyGuTwOTYvK840xFRL2sA83wmDPrFiMn3Ipi8sUJgQyCtPY2bsmvUbT2
         RxEk+HyMLaFxO8/l3LhPhIaeGAFoLsJth/MMzYyBOicjgRfQGgwW7roPrmEe6DeBk/ZN
         gLc2XNmiN1sBggEsRuubB9cHV/A5c4G77+ULVklfDH7ph6kktSsua17JypwYdqxGhaEM
         U/P75E7K3xBPoukqbx8Epwi0qfXzo7j/zrFE7UZIpg8TcLeaXL3kQQE17c2WIuKVrLLw
         fXWQ==
X-Forwarded-Encrypted: i=1; AKwUvBzLXHw5f5I7LCEe8VHOuiWRgZCEAgDxjThIhH+Q3XoB8g2FdhEmL+Rme3mYfMfGooz4w9F7bnEvGqyXvbk=@vger.kernel.org
X-Gm-Message-State: AFq9FYL5laFK+2r88IrSJzlm/7jtTOd9LvhUfyMuh0uTVmVaJ6hcdDpJ
	m/FZYTWTBCyoCkw6y4zDJioT9aSJl9kGeZB61FEsFKlE1ou4qKYyjmQY2nqurEQOgBoGOVaPViu
	bGJC9ENWW8/icXthrLCGHbip0iTHYI/cl9FbaefSaLw==
X-Gm-Gg: AYBFou1B0iV5aNRPPH7at6O5vUvIHd9WtQGnuEH1lW3pju+1IQtQrv0dZmfMtDeeF7K
	2NVoclXVsAIQXMBq7gxm1L7NRlquUAPOKHEzIBF6rfiKVlKFID54ntCndPeaobNC7dIf6BnkhjL
	TOS3kQmDyoc/wB0eFHTvePX9gjCFpKBylQnAQR81YeQleNL/okxYf/pahNqc+jk3NP+OcdgUNhL
	irnA+qyuWUXfjsMozr/lLgUyVYUVNLP/S9iJ++4wxuV56Q+orjyp1ACyvJgfsrDvI/uMlsnG2HR
	noTXl2Zb6fWHnXBx1VICJ8ttSe/E8284aRpNbqfhsZ/dZ8JeAHndh4MsYFQ/bWTxmQ==
X-Received: by 2002:a05:690e:4091:b0:677:cb45:a45e with SMTP id
 956f58d0204a3-67935edb58dmr4559555d50.6.1791837842225; Mon, 12 Oct 2026
 13:44:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261008222843.63319-1-lubao@everpuredata.com>
 <20261008222843.63319-2-lubao@everpuredata.com> <6855034f0b219b0b8e6a6f47aef802cf2803e42b.camel@kernel.org>
In-Reply-To: <6855034f0b219b0b8e6a6f47aef802cf2803e42b.camel@kernel.org>
From: Lucheng Bao <lubao@everpuredata.com>
Date: Mon, 12 Oct 2026 13:43:49 -0700
X-Gm-Features: AclHuK_zSM-dUK2eIXZMsKsuxHoHvQIrPR1gRleHlxNa7Z9fN_xJLD3dP1iHjxA
Message-ID: <CAHPUM33UGE849kviu4cngY7SwscHrrf=qTqkp=8OLiTX9SCcBQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] NFSv4/pNFS: prevent i_size regression while
 layoutcommit is outstanding
To: Trond Myklebust <trondmy@kernel.org>
Cc: linux-nfs@vger.kernel.org, Anna Schumaker <anna@kernel.org>, 
	linux-kernel@vger.kernel.org, tmenninger@everpuredata.com, 
	jcurley@everpuredata.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 8, 2026 at 9:43=E2=80=AFPM Trond Myklebust <trondmy@kernel.org>=
 wrote:
>
> On Thu, 2026-10-08 at 22:28 +0000, Lucheng Bao wrote:
> > Commit ac46bd374c9a ("pNFS: Ensure we layoutcommit before
> > revalidating
> > attributes") replaced outstanding-layoutcommit attribute filtering
> > with
> > synchronization before explicit revalidation. For layouts requiring
> > LAYOUTCOMMIT, OPEN attributes can still shrink i_size before metadata
> > synchronization completes.
>
> The client can't police OPEN. It has no idea which file will be
> affected (particularly when doing an open-by-filename) so unlike the
> case of an explicit truncate() call, it can't serialise with the
> truncate.
> It is therefore up to the server to resolve any ambiguity, either by
> recalling or revoking the layout before allowing the OPEN truncate to
> proceed.
>

Thanks for the quick review. I think the OPEN-truncate is a different
scenario from the one this patch is targeting, and my changelog invited
that reading -- let me describe the actual race.

Agreed for a truncating OPEN (or a SETATTR size), that's a real size
change, the client can't serialise an open-by-name against it, and the
server has to recall or revoke conflicting layouts. This patch isn't
about that case and doesn't touch that path.

The race here involves no truncate and no second client. It's a single
client doing O_APPEND over an nconnect mount:

  1. the client WRITEs the appended data to the data server and it
     completes;
  2. the client arms LAYOUTCOMMIT -- the MDS does not know the new
     size yet;
  3. before that LAYOUTCOMMIT is processed, the client's own next OPEN
     carries a GETATTR, and the MDS answers it with the pre-commit size;
  4. the OPEN reply and the LAYOUTCOMMIT reply travel on different
     nconnect connections and are processed out of order, so the
     smaller, stale size is applied to i_size after the writes;
  5. the next O_APPEND then computes its offset from the regressed
     i_size and overwrites the previous append.

So the smaller size isn't a truncate, it's the MDS size legitimately
lagging until LAYOUTCOMMIT (RFC 8881 section 12.5.4 "It is important to
note that the level of synchronization is from the point of view of the
client that sent the LAYOUTCOMMIT. For file-based layouts, synchronization
of attributes between the metadata and storage devices, primarily the size
attribute, is required."). The check is in the generic size path and keys o=
nly
on whether this client has an outstanding LAYOUTCOMMIT for data it has
written but not yet committed.

This is the same protection the client already applies to buffered
writes via !nfs_have_writebacks(): don't let the server shrink i_size
below data the client has written but the server doesn't know about yet.
The only difference is the "server doesn't know yet" window. For plain
buffered I/O it's "dirty pages not yet sent"; for a layout requiring
LAYOUTCOMMIT it's "written to the data server, LAYOUTCOMMIT
outstanding." In fact, once the DS write completes, the pages are no
longer counted by nfs_have_writebacks(), yet the size still isn't known
to the MDS until the commit, that gap is exactly what this extends the
existing check to cover.

> >
> > Commit d8c951c313ed ("NFSv4.1: Don't trust attributes if a pNFS
> > LAYOUTCOMMIT is outstanding") moved LAYOUTCOMMIT post-op attribute
> > processing after cleanup, leaving another unprotected window after
> > NFS_INO_LAYOUTCOMMITTING is cleared.
>
> This is unrelated to the above problem, so fixes for this issue need to
> be in a separate patch.
>

Will fix in v2.

> >
> > Extend the existing writeback checks to reject smaller sizes while a
> > LAYOUTCOMMIT is pending or in flight, preserving size increases and
> > WCC
> > checks. Process the reply's attributes and establish their generation
> > barrier before cleanup removes that protection.
> >
> > Fixes: d8c951c313ed ("NFSv4.1: Don't trust attributes if a pNFS
> > LAYOUTCOMMIT is outstanding")
> > Fixes: ac46bd374c9a ("pNFS: Ensure we layoutcommit before
> > revalidating attributes")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Lucheng Bao <lubao@everpuredata.com>
> > ---
> >  fs/nfs/inode.c    | 8 ++++++--
> >  fs/nfs/nfs4proc.c | 2 +-
> >  2 files changed, 7 insertions(+), 3 deletions(-)
> >
> > diff --git a/fs/nfs/inode.c b/fs/nfs/inode.c
> > index 3022454f7698..11432f521b04 100644
> > --- a/fs/nfs/inode.c
> > +++ b/fs/nfs/inode.c
> > @@ -1636,7 +1636,9 @@ static void nfs_wcc_update_inode(struct inode
> > *inode, struct nfs_fattr *fattr)
> >       if ((fattr->valid & NFS_ATTR_FATTR_PRESIZE)
> >                       && (fattr->valid & NFS_ATTR_FATTR_SIZE)
> >                       && i_size_read(inode) =3D=3D
> > nfs_size_to_loff_t(fattr->pre_size)
> > -                     && !nfs_have_writebacks(inode)) {
> > +                     && !nfs_have_writebacks(inode)
> > +                     && (nfs_size_to_loff_t(fattr->size) >=3D
> > i_size_read(inode)
> > +                             ||
> > !pnfs_layoutcommit_outstanding(inode))) {
>
> Under what circumstance is the client legally supposed to be able to
> call nfs_wcc_update_inode() with NFS_ATTR_FATTR_PRESIZE set, while
> there is an outstanding layoutcommit?
>

It is nfs_post_op_update_inode_force_wcc() from
nfs4_layoutcommit_release(). With
nconnect and overlapping LAYOUTCOMMITS, an earlier LAYOUTCOMMIT can complet=
e
and apply its (smaller) committed size via force_wcc while a later
LAYOUTCOMMIT --
for data already written past that point -- is still in flight.
