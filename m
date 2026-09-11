Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13784756D5
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 12:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789129941; cv=pass; b=MNfDGkACHVKOjFW1EyYTxfkOPxJiMiK7tiEtheF8eWiGPe4oMID9qGhrcS0edd366dnO2urN+nAFEX/vaKG8GL6XuA+aUzxLVV9VUKYmyxpqG5qC+J19roj/CB3G8KXSfcmfsDtNaM3lfxPZk66wm1NX5WNDGhr90g31P0a3qLo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789129941; c=relaxed/simple;
	bh=GfGY13tQsBIBtgNZNUsiTH0qNAGdLQBQm0DmdUH5d+A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uvcBIoT9M1tHsdVZ7quutjf1oeJO+ZkciWvd5nGBfBjpWsUhDx85wS/jceACgiF0kOfFhBclgJR1yH3/Iz1/SQPthKgI5zcpC2JAYl9tVwQ3skiMn3e4uj1eVIE4sV8plOemEOQ6UqG1vVyC7jqB9qDz+vP+JEs+SSKiPxwLZeE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GDXP98Tj; arc=pass smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GDXP98Tj"
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-6712ffe3022so110345d50.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 05:32:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789129923; cv=none;
        d=google.com; s=arc-20260327;
        b=exgOxsz0tXScTUPuO5R+VS3la4TJOZLnjHHhItRJbH24J+tRC4XFaAG2TNHrOZg7OW
         ss/6k81oBUaKydivujELdS6GfcMM8TmVfBy+A8++zZb947oYI6ZzWqGzNGrotVoQGfjt
         GX98UMgVVt0h3Z95K0pgiZXDgTFAbcgaako4R+3ioBMfpEFp4O2V2PuBxPOqN0JYG7gH
         I3jqvx40eT4NSxKvH60lALNYLBYgeOBhowU6znTnSlqFigJs8y/IdckGf5/+rM0jEuEx
         m/IzaCyl2Djxgt7iYx6n3Pmq2D3IlZzv1ABPu2PRGpyNS0gZYXJudzxfYA7W+249Tmu4
         QPOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=caD0AN8MUeIKYzz7vLP38Y8N+w2mnj0GbXgaghHlPqA=;
        fh=EoOaG2umArZMnNxjkHqPN/Oh55vCSDb9ubf+3vCLmJ0=;
        b=QuASaas8Gh4HhxWQJuaEaUWVAi5cfjSkyO0m6n3f7VASZwvnkNVZPHJ4RzdDcPBgSQ
         b1n1tfChlZ2h85sKuQosvzYyPYlmNR3symAjo3JrFUnT8kDNSB013kal3xbNQTfINU10
         GAenYgaGoGOpGSUHBS13lVJAibW6joZfSzYb7x3SBXEeFGmZkW3D8gJwQ9Wa01rI4L2T
         Y4a66S9rZJEtgkIr5U+1EfPqDGvTONXKgREpwyh+AYVs9i+hRhCh6HT46/t5kHWSFe5i
         hksq4B6kT83EI8EnY0V7bpQltkwlwhXMJPk0Ao22hHemu69xaiR0fqIQ3SB5NoSUZQLa
         JvgQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789129923; x=1789734723; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=caD0AN8MUeIKYzz7vLP38Y8N+w2mnj0GbXgaghHlPqA=;
        b=GDXP98TjbTn7dENk33rIPd0Ksa4F7AqCVKcln4PHWCVvu879DL88cLai6ObgxzmMAh
         TkdvpcbJFO8zkdQJkS+Gu4GTALJFYfGCNFfg5fLsBiSufeWjgxnXJ776BbQOgihAjJ29
         4oFe2Ft+sy1SzkwQ7kBKDD0wbIYqLSVJRW47OtOz3ejBZ4wF4nacIAmlTyXcSnTDnXSb
         BfxI//fsRzBmFIUt5uWD/ktmd530t6ZNMchhNjN0DY7tSnjlevGO2+J+hXPQu6c5ij7X
         4kW8+ANcv/5rm7RVciGrVvcfD4VJObQn33JSlBK9WgtEGfJ8axi3H3YV31M2tBPTppvJ
         z8Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789129923; x=1789734723;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=caD0AN8MUeIKYzz7vLP38Y8N+w2mnj0GbXgaghHlPqA=;
        b=Q+jgMO/hveTCUACOO/LMz8aRWjT7QW7iWoFSKUA/O2iYhWpqULYScpTQspyh8mV3P5
         ut7kN8lVJ8bbwJyz0jdlMpKBEg151ZAQ0sGASNQX4jjRdxnRBBrVYYhWSSlbNQW82QgR
         XKReHI49BayVMdGL9otMaIJD5j6A0a1RTeXYKTZsRvumJPOAtuMg6TN3oTXIZOO5AnYb
         pXrTi+TwK/Km+w+ylLkvL/7mATu598rj8y82BnfVw9LSE7TBU8/m0Aimzgb9GzILcT0u
         zRdCQY1GJ1NBX9fujeHkaCpr1mz7Pli5ZsRd7ybLBmuOyazelfoGmv6zWrDGPCC7fxQ6
         Hi0Q==
X-Forwarded-Encrypted: i=1; AKwUvBy+dIOnOTup1ZPObL1XdnvtttMYwzCqaVrwStNnzr+3VeNN1gDK2NBzKLPSMewxE+dYvKrNgQ2gMaXao1c=@vger.kernel.org
X-Gm-Message-State: AFuF++l7r2m4lcc+hVAWPdi+0R35wnnDfJDJyEwNkEnY0CZCgZieH4qb
	DsU/S2JEG+6vY7D3xMNCePQnV0arn+wnIxCNiPUwsRuvwpPbV5q53CIzBd/8vKtkEVVC3vzyiNx
	Sd4/F39lCswOmNy7bhTdcFOXphXuy2E0k8nkA
X-Gm-Gg: AYBFou256P4uSaFzFRVnnn5/L69QSMS5+LT1zmbR2aSED7tr3Oah5HbBytWMYhu8+n0
	RWqmqsf1xffeMJ2rRjYDECCXlkRQOQojlivceUX4I9dUqqA8hFHXZC2hWN9CbKhZViOco9/EA71
	iVeS6iFgrZoMyf1yhz9rXJwsofPY8dGEO6c8tI50Ux5A45SAeotB7a6EvkUGT4zMqiMe4jllLe0
	pxlXiwqSCLXfNdywNL+7iVDnB7i8PN54AZGv/2nbfR4pWDB0/HsEtCsYy9lxdRIDfWKZ8QOiG9P
	9rwNR16cg5TbM6lzksrzuABkY8LWHZfAqQ/DlwTnn+h7eeKxHTL5
X-Received: by 2002:a05:690e:4547:10b0:671:23de:14d9 with SMTP id
 956f58d0204a3-67124574c68mr1013303d50.31.1789129923374; Fri, 11 Sep 2026
 05:32:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910051649.3806214-1-april.cardenas@canonical.com>
In-Reply-To: <20260910051649.3806214-1-april.cardenas@canonical.com>
From: Bharath SM <bharathsm.hsk@gmail.com>
Date: Fri, 11 Sep 2026 12:31:52 +0000
X-Gm-Features: AcwNN1WbsQN-BPoDZ6fJmFMQpIFFBjaprIPiBLElv0YUz9QVJuPOcZeQ_WLxtig
Message-ID: <CAGypqWxKokujjRHmrJ=iSM4vhqmmTxAPy_GrQQDmeZk271+Rmg@mail.gmail.com>
Subject: Re: [PATCH] smb/client: send lease break ACKs thru correct session
 for multiuser mounts
To: April Cardenas <april.cardenas@canonical.com>
Cc: linux-cifs@vger.kernel.org, pc@manguebit.org, linkinjeon@kernel.org, 
	ronniesahlberg@gmail.com, sprasad@microsoft.com, tom@talpey.com, 
	bharathsm@microsoft.com, samba-technical@lists.samba.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2026 at 5:17=E2=80=AFAM April Cardenas
<april.cardenas@canonical.com> wrote:
>
> Currently, when cifs_oplock_break handles a break request from the server
> it searches for the appropriate tlink to handle the request
> but incorrectly uses the current fsuid as the search key, eventually
> causing read errors for users with multiuser mounts on NetApp.
> Fix this by using the tlink from the cfile struct instead to respond
> through the correct session.
>
> As breaks are handled in a worker thread, the current fsuid
> isn't guaranteed to match the session that the break is intended for.
> This means that cifs_sb_tlink may search the rbtree using the wrong fsuid=
,
> and return a tlink with an incorrect session than
> the lease break was intended for. As a result, the breaks
> may be ACKed through an incorrect session.
>
> While it seems that Samba/Windows Servers 2016-2025 ignore this as long a=
s
> the lease key is correct, we ran into a case where if you're using
> NetApp ONTAP or Azure NetApp Files they will reject the ACK
> and return `STATUS_LOCK_NOT_GRANTED` errors on any future read requests
> a user may initiate through their still held open file handle,
> and the server will eventually close the file.
>
> In the dmesg logs, the user may see errors like these:
>
> CIFS: Status code returned 0xc0000128 STATUS_FILE_CLOSED
> CIFS: VFS: Send error in read =3D -9
>
> With a multiuser mount using NetApp, this issue is really easy
> for users to hit on a wide variety of kernel versions
> by attempting to copy a file from the share
> to the local machine through GNOME Files/Nautilus.
> This copy will always result in Nautilus throwing
> a `Bad File Descriptor` error to the user and fail.
> With this fix, you can copy files through Nautilus without issue.
>
> From looking at the traces, it seems that glib will
> open the file first, and call listxattr before actually attempting
> to copy the file data. The listxattr call always triggers a break,
> causing the copy to fail.
>
> The proposed fix returns to the way the client grabbed the tlink before
> commit e8f5f849ffce2 ("cifs: fix potential oops in cifs_oplock_break").
>
> The bulk of that commit (checking for list empty) remains untouched, and
> I think the change to using cifs_sb_tlink was intended to avoid a
> NULL/ERR deference on the tlink as well as update the reference count.
>
> I believe this fix should preserve those safety properties, but of course
> I'd appreciate any corrections here.
>
> Fixes: e8f5f849ffce2 ("cifs: fix potential oops in cifs_oplock_break")
> Cc: stable@vger.kernel.org
> Signed-off-by: April Cardenas <april.cardenas@canonical.com>
> ---
>  fs/smb/client/file.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/fs/smb/client/file.c b/fs/smb/client/file.c
> index 1aa4844f8b8a..0d428517f454 100644
> --- a/fs/smb/client/file.c
> +++ b/fs/smb/client/file.c
> @@ -3354,8 +3354,8 @@ void cifs_oplock_break(struct work_struct *work)
>         wait_on_bit(&cinode->flags, CIFS_INODE_PENDING_WRITERS,
>                         TASK_UNINTERRUPTIBLE);
>
> -       tlink =3D cifs_sb_tlink(cifs_sb);
> -       if (IS_ERR(tlink)) {
> +       tlink =3D cifs_get_tlink(cfile->tlink);
> +       if (IS_ERR_OR_NULL(tlink)) {
>                 /* drop the reference taken when the break was queued */
>                 _cifsFileInfo_put(cfile, false /* do not wait for ourself=
 */, false);
>                 goto out;

LGTM. Reviewed-by: Bharath S M <bharathsm@microsoft.com>
