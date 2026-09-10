Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B4833B1035
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 18:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789063492; cv=pass; b=PGJYKCKSV12p0CNuwAEiUOvmbp2rLj3RDx+VtaQlEgU9hUwEUluUXthD3khQrcXV6uJju1+2o1Qg8ZGtEO4ROidMEMV+qm9yqCwcZ1CX0wvQuVHrbzoByGSJ6xZliTdAR37Hb/zG8f7ZtFEac6yTOdG9dQkNi/emeLTTHKCjfMQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789063492; c=relaxed/simple;
	bh=/JiSL9KtMYW39gs+t7l5GNFcMSkI1SwWlTIMXx+UrPU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rcm6Z4GD0DJ7E3BgLiQ8k9WnQ9skRVUhjcWBM3TyXv1pSdlHF5zbnq6SWN4zC8VAs3xRSUYY1Z8bGCnki5Pcg6Y+PJIf28DtxOqj+kjMl89qwgGF07/1lzkzIPvheNsS0OPgnHqONk/oNl0e2B25aX/1ZVjGviJr0z06mM4wdg8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sEskD115; arc=pass smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sEskD115"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-485aca32ab7so3989f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 11:04:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789063487; cv=none;
        d=google.com; s=arc-20260327;
        b=TjtYA4x2FCJyaTjGTuD+WeGaOSDd76SC+xb7GPWsMW/1XvgmnCf8/ZXqpOKifjbAOg
         VQwwFNDkw4sVfrIPzHMGWX+DGkfW3f4N7C29AR4s0Q+wfFnBMgMpHqkNSsxHbXWHEL1o
         wkl+jut8y96TDs7RfOikIJqaVdplVdxaNio+bJM9JUUvWRxjchJuDwkfh8cNxvgH1CJB
         b4dF2g8NLlydihXz61RlZGM0UyfV/N8O977OsOX+E5MNYerVSj9c2TrvAMBzDCLqhN3C
         jya/3RGOt6lFdGOoKdDtZFexSSFKP/b+86HeDoubtzpfOXsuXzxoC/iBQgpmUEvPusZQ
         P8QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pmlSkBU7Yx6aRJKzEZrvFOirNAsuneJxXll9dWdAM0g=;
        fh=PiB0KZcpjaHKO9jvkIZvq9yk3Zd8IbE2vFYMs6LUkI0=;
        b=mPH24zWBQiOmSWjyYSeu5YhthvoytQNzgOcIcgZTqHKcWJ2bmgGcCB8yrj/iNaETY0
         vb0X0kpulv3Rf0k6hiFwBSwl5hZe8UarwHunDrr5/DaRCBX80+TZM8LDj8ruQdFjVmX6
         TKc1GUZ1QuSf3x8QO+7zWiQORMvvYgxT+ENv6SRfIKQymRdvIBy4hClR613CcI22/J05
         1EpimwmwW6owozGNQwjEudVeFvP7PX34h/EmC8W5AecYXZ2bSXLUJR3F1ovbUztyDUhE
         czM8CTx+GqCsD2JSexFAhBzyMxiMo0tMOttChEisR/wmt9LP8GxcT53LazxUCa4fRPf9
         Sm0A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789063487; x=1789668287; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pmlSkBU7Yx6aRJKzEZrvFOirNAsuneJxXll9dWdAM0g=;
        b=sEskD115CpRrijD4cFzDelRYsF8YWzl7654MOPwh89cY6gbyQnrSMlfZ8+AKtEU6a0
         yil0X+5Y03DWkpDho47+1NAYo+9/rc5Ntu4BGlZoQvY8681Czq/y3kop9p1YyDoICKUZ
         Bl/BuaEWMVrX0NR9l6hsA07pLxg3p/uiPEdDDl2wqmLdkocKj3cSuATuNlc55zMhRcXf
         Yw4XpXsR/QENFv0L1WtfkrnWaBxCIUkK6+UxPETdSNdHUYunrvWKe8sYpr5ECPlUovvX
         Y4p4bU4kQSYZV/cCZbtjmxVcaudKGD0f5mYvLJEO66Mf2Oe/LztwKisydDQ/AtaAusff
         op9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789063487; x=1789668287;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pmlSkBU7Yx6aRJKzEZrvFOirNAsuneJxXll9dWdAM0g=;
        b=qyLZfrByJ4FKmz/3V5gUmTW6YjnthtcdIsvu+sd9/iLWJ6dzAxt2XeSuCFED6Omo3q
         JLVBwIhQEgkLKyyFZ+m364+618IFihfH9CXzMOf0DC4bfcDZdgNLosK5BwZIDgducvwW
         5eRSf0y9N5ODKyYcsRLrva+qTra0q1xJKcttbe2J3TQ6S171qAkJk6lrl2m+sdPn1akv
         ZlO2EHisdyud8qsHegSQKGFnzobeQxLtC9B+G+VdlNCjitNSTMN9WoiLVswWQl2kjV9f
         ntjmAAUQMVXiov9/TX/1rXXyVl+iq5Gze90tFkB3/r7S5E8n0tWfUrvCtKfgzETWQro/
         jPQA==
X-Forwarded-Encrypted: i=1; AKwUvByPV7NxaGxyE/NbDI3r2bU5aVn4sf8nh/Hmtrz6X1Bz6dLmWwXzZ4ChV7NoqQWZfEMNI6K8S3TCfNTIkzg=@vger.kernel.org
X-Gm-Message-State: AFuF++kt3C6rF/+Xv11W5QpZPnqJp80ofV+Lauh7Suq+nnYiQL7MWIUr
	r9QxP8ZjIwLGsjqHJshv9qjnZV7MU/Ruk85KletwZ7DsRTc2eHR27StiiLvxlAfaD1thhVtTE4y
	6LPE39fyuze4NuzrWlV4W5/UCsxi9AFg=
X-Gm-Gg: AYBFou2P0xs1Pj6Y+dIeoDsjH0DiiWIJ7DxR/qUM86wKiP7xZtIiKyyUqRXNgKRmauV
	WOM1t3bBzTGpD+Md0yocKsTkygQo0naknqF7AqvCWyxkpsP/wpQqRnXnelsJ/35si4/bqC2vthu
	NFrZSzI4YdE4sjavx5MZMgjoLLiEhAcQBdOXPEl1oCEPysw62pvnQZgf0WfKr2tqYl8i9a7I5UE
	U7BSfxN1doRtKpbsWO1L7Ho0YuzX01toY4Ko1fYThlSn/xpZSP2vQXBH4vIb+BfKIDNmSvZHX/A
	a/+X87u6lYHXaErvAFofZ/OPd1qeh2PLU/IbT1Ca1PuEqQdG2zX7/FOrCSnCkoKOm6LlVs52Afm
	wxmjrZjv7DkuO/hyVS1rGdmhWKSoaVlsQpULDUQ==
X-Received: by 2002:a5d:6f10:0:b0:485:8c16:5ef8 with SMTP id
 ffacd0b85a97d-486eb3104f1mr167913f8f.50.1789063487446; Thu, 10 Sep 2026
 11:04:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910022442.3594649-1-xmei5@asu.edu> <20260910022442.3594649-2-xmei5@asu.edu>
In-Reply-To: <20260910022442.3594649-2-xmei5@asu.edu>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Thu, 10 Sep 2026 11:04:35 -0700
X-Gm-Features: AcwNN1UPtHpn5Ju1AbUXHO7M6POxnBVC4rOVn1G8Fc3LCftjvo7b6-mIt_6WkRg
Message-ID: <CAJnrk1b=WoRPqKLEex-WuTVxjjw95Aj77Azwzv=BeR9VTu4PSA@mail.gmail.com>
Subject: Re: [PATCH v7 2/2] fuse: return -E2BIG for an oversized SETXATTR over io-uring
To: Xiang Mei <xmei5@asu.edu>
Cc: Bernd Schubert <bernd@bsbernd.com>, Baokun Li <libaokun@linux.alibaba.com>, 
	Miklos Szeredi <miklos@szeredi.hu>, Kees Cook <kees@kernel.org>, 
	"Gustavo A . R . Silva" <gustavoars@kernel.org>, fuse-devel@lists.linux.dev, 
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Luis Henriques <luis@igalia.com>, 
	Pavel Begunkov <asml.silence@gmail.com>, bestswngs@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 9, 2026 at 7:25=E2=80=AFPM Xiang Mei <xmei5@asu.edu> wrote:
>
> fuse_dev_do_read() answers a request that does not fit the server's
> buffer with -EIO, except for FUSE_SETXATTR, which gets -E2BIG since the
> value may legitimately be larger than the buffer and setxattr(2) reports
> that to userspace.
>
> Over io-uring the copy fails with -EIO for every opcode, so the two
> transports report different errnos for the same condition.  Map that
> -EIO to -E2BIG for SETXATTR.
>
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Xiang Mei <xmei5@asu.edu>

Reviewed-by: Joanne Koong <joannelkoong@gmail.com>

> ---
>  fs/fuse/dev_uring.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
> index c6dd420c4034..6351f2470e09 100644
> --- a/fs/fuse/dev_uring.c
> +++ b/fs/fuse/dev_uring.c
> @@ -893,6 +893,8 @@ static int fuse_uring_args_to_ring(struct fuse_req *r=
eq,
>         fuse_copy_finish(&cs);
>         if (err) {
>                 pr_info_ratelimited("%s fuse_copy_args failed\n", __func_=
_);
> +               if (err =3D=3D -EIO && args->opcode =3D=3D FUSE_SETXATTR)

nit: might be worth a comment above saying something like "fuse uring
doesn't use pipe buffers, so an -EIO err can only mean the in-args
didn't fit ent->payload"

Thanks,
Joanne

> +                       err =3D -E2BIG;
>                 return err;
>         }
>
> --
> 2.43.0
>
