Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3752E49B5AC
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 15:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790265485; cv=pass; b=EBVaIhfJbf/T2cD++VgfVtH8w+EKRiGKRAwh4VM6ZzLAsYc1i6KHjrak9j/hdA86IB0NuLDEcW720oqc/KqdoFvryCZlyPE+KDdpb4lG5DfMyqxbP5kMVwpOPcdmUTdpzcAO5n0EXsR4uBBD96CuvXTdRk3IstZgsUrc+Lm5yXY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790265485; c=relaxed/simple;
	bh=aTXLg8x+ijWpjN+mBSvI6GmUxmNxYOYtzc/2ohe0fAE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BQ3WtpPg2B2l72CR4QlL9TNieTlaiLtJecF/JJepoLptdEA1ayggTtnN6xsHyA47VqySjsXUpjCxLVifoLzNtjP8KbywZgysZ18xNNw7WGK9r853j5XBj9snXsVz//fQ5l4XNSd/twu/s4rQvc4H1p7wG972kKgoFF0t3JmjHT4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V6SlN+FZ; arc=pass smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V6SlN+FZ"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-86868f7707dso24080b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 08:58:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790265483; cv=none;
        d=google.com; s=arc-20260327;
        b=Irm/78cx+4zZLii1615FtRX+7TYTRwdShik/oRvUlEDKjCvquKVDsDcl+rCERfPtVI
         y1I7hhkmHGRxM6crEFNqDoT/KZGpMGoCFZENQVJPl6Kqbop4oA+X+jNUTtw+8J588aXV
         Y4bXPUSWqevcLb8wWU2GhA59UpQ0LYMs36ExV9WWv3/Ls0h4+TPay6vHnwlei8UEKzRF
         GuTMZ1LQS9xQLAZJ9X6jJdaaKDESYb8MkJmKB/4oU0oTum704ylTHxQEjQGOoC46Nq6k
         nyADXZF/F1lzgGTmzj6iRzb1Ai3xRbVH+y4FRI+GEbnB5NcN7Irh23l4p5qS86lz1WUs
         GTrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cDpTNZVHqrO0WKs3SLOrqTa6JLMU8MhI0fa0CuoT9rQ=;
        fh=+A4Cu5Bwl5BFq2Ko1Z9UeROk7dPI/elMe4cy09SjNGY=;
        b=Z3SuGhLy8xyZ54TKOql/stUTl4cJL6rpbmqC9SSDgwr9l3+BmVEEESb6lBKy/2zAz4
         KJ3DBf3WM2+nfJAcC6T89+AMvCNBmhNzT1T7MoQRpGCLvQd8WYPweics4mVqqHJoYan/
         VpNANfyBG4aN6HIWFDeMIscjaLiysSrmwMhELrqmUnt8WdwfjV6YMy/cWKAgQ3FaWw8L
         R4py2qhwl96nHCC63tbKfyOgNvlZ7SGiDyiRRbaHzeC5tZ2c2FjU3qaBAuwTrB5eOhJR
         vYc/3jsjA9jGoWDDRCkcaOQei3kNBAkU6airCLdUmISiUMgXyf+j1+KhAiD7L/1ERiRC
         J1Cg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790265483; x=1790870283; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cDpTNZVHqrO0WKs3SLOrqTa6JLMU8MhI0fa0CuoT9rQ=;
        b=V6SlN+FZskFlaOD6hMecJC3AJ4RKU8crIGJEkE6V0P5JIo+8a3L6V6HcGUjzkK1wFy
         X5TPdmWNSY85PTHIl39bKzrccghH+yeOXfhGkLtB6FsxNs2mHPBlIuZw4q9cmDuynZMU
         VvMRUopRQ47tzw9eE5Y4BA3UOgBd1otead9OBfED17Gls1HnMlADOtRGdiUNxKlpxtb0
         hXCqVGKPWRO86F/BY71y/A1+4oqeLLajXGgzRfj6WxiUw+MnZYX1IadDyutY+aH98vXv
         Adkiav9jLbZlAClDfJ+jbtkJu5Nzsyp5EhqYsQBTRFqGai4RSk91S0ELoqpO63UTPhti
         cYYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790265483; x=1790870283;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cDpTNZVHqrO0WKs3SLOrqTa6JLMU8MhI0fa0CuoT9rQ=;
        b=kNdAQA+TnEM8vae1IoAZ6C46tyS8ba3lDsFN2RClLD4BZOc9LooACveDyPH6EwCiyP
         +/t44wmxLGRgRpovylzkwOMe9WDqWrKabnXQBMW+lyBxHxm57yqvhcMsSaetE/aIi2cQ
         c4Yo8bqpJqHyjUrUSCh802nBSqIy8dj0l7nqChnf88Co8fMVTC3zeK/e6WpaahSFh3WW
         M8Kq5o4uI9y5i51x25chLM4KKjf9dGZkmFZUuSaDsaYsW1BnI0P31hWTzg4BUim8rAuM
         uC+baJpW81F64QLxgEPYksaG+YiL+dqyPBnZ2iF2ZrDx2CxZgRf6zJPxSt1wvIJj/cWU
         R9/A==
X-Forwarded-Encrypted: i=1; AKwUvBz0K7M84XJCL3Dyxl8DB0J68dc/7JWWBtZSOpNyzd6CSovrjYmAzsJIYSPlqWBM8g5K/PPPiVhfkd5Adxc=@vger.kernel.org
X-Gm-Message-State: AFuF++my9lu6HBkeDFtyTHV9xKU1mS7ZBt4WZlp7wBlgt4ilaV8RQBRA
	U1nRhQoT4wiS8x1aN3ERmtSW6PWfddZ6Oc58URJMqDgCfa7ypz43OyGSZN6+GM23eGlatiGlbjr
	pJzYXXYzcdpSpEp020s5Ed2VqFfERnHE=
X-Gm-Gg: AYBFou2xG6I38g7xcdGSzqmSwV5IsTaQf9dzMAVyhDbEmLbqN4tk3yG+k7WcK+IJFN4
	pXCuLpsepwqlpn0i20vTy8zI8Uh3Zg6FzuNzbZBAy6wWQyryHDPgA7IhhjUV/gHcHQaeHq869qJ
	vNC2xmewwjk7T6YnKOPiievL8et6lYLQG4IXc09WdCGmprKvI928J+4oF/lN4B0XkiHty4MbToV
	HJGZkkpo0gABTLnHlVqbJQflsCBAnDJO84JDHvEY5deipG/CTk/pJ3hsXCcVFXFPiDR43HeQZRl
	osuTocDxrLxtzrXqGNONZeqL4jTcgNAn8cOL5C8Ckm3ug87p1KN+NMAShUSSAFb505R+kHsZpAx
	+lw82mQyNEy5oDz1hDWkHsnAisCo2gpFF3SAcF9jCeQ==
X-Received: by 2002:a05:6a20:4388:b0:3dd:cc61:c0df with SMTP id
 adf61e73a8af0-3de0e899e4emr2697830637.25.1790265483478; Thu, 24 Sep 2026
 08:58:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828141240.2391915-1-qiwenjie@xiaomi.com>
In-Reply-To: <20260828141240.2391915-1-qiwenjie@xiaomi.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Thu, 24 Sep 2026 08:57:49 -0700
X-Gm-Features: AclHuK989g8w5jlc0v8XBTZNQE2OwIfTRkHZBKYmw-nwjYIpnh-4i8jQ3FcXQYc
Message-ID: <CACOAw_xmQcAwcXowkv99XOV3X-6Gtis6Hu2NWNs1zQCfe6iiWw@mail.gmail.com>
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: flush SIT journal during filesystem resize
To: Wenjie Qi <qwjhust@gmail.com>
Cc: jaegeuk@kernel.org, chao@kernel.org, daehojeong@google.com, 
	linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, 
	qiwenjie@xiaomi.com, sunqiuyang@huawei.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 7:15=E2=80=AFAM Wenjie Qi <qwjhust@gmail.com> wrote=
:
>
> During a filesystem resize, SBI_IS_RESIZEFS prevents new SIT entries
> from being added to the journal and forces existing entries to the SIT
> area. However, f2fs_flush_sit_entries() returns early when there are no
> new dirty sentries, leaving existing journal entries behind.
>
> After the main area shrinks, a later checkpoint can access a journal
> entry whose segment number is outside the new geometry and trigger
> f2fs_bug_on().
>
> Only take the zero-dirty fast path when entries may be written back to
> the journal. This lets resize drain existing entries through
> remove_sits_in_journal() even when there are no new dirty sentries.
>
> Fixes: 04f0b2eaa3b3 ("f2fs: ioctl for removing a range from F2FS")
> Signed-off-by: Wenjie Qi <qiwenjie@xiaomi.com>
> ---
>  fs/f2fs/segment.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index 1e7e745be71d..9f9ce25dd07e 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -4816,7 +4816,7 @@ void f2fs_flush_sit_entries(struct f2fs_sb_info *sb=
i, struct cp_control *cpc)
>
>         down_write(&sit_i->sentry_lock);
>
> -       if (!sit_i->dirty_sentries)
> +       if (!sit_i->dirty_sentries && to_journal)
>                 goto out;
>
>         /*
> --
> 2.43.0
>

Reviewed-by: Daeho Jeong <daehojeong@google.com>

Thanks,

>
>
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
