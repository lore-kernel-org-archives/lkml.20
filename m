Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42FF82F12AB
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 04:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788410980; cv=pass; b=D+rhrJx8ByLgxwyHVfK3xkkice7LjTBQxWPOyns2NBDyZfWAe1Az3J5kzOMdFWPAkQFg0JqF1po7K5xO8gZX4FXuf2JndS9ZcFz2gTaFfM+rMphI4mTLa3YccsNS/EIUuODWtC01my2vZFUFFmqPHKjwsrt8LcOViE2rhgMTPWk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788410980; c=relaxed/simple;
	bh=WDBujGpFF48g9BOWj7qHVl6o2U9PlRL0uaEjw17S59Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gDTLcHYDw/a9Fo6NKqr/PZ57t6P0Kzqyfq9yzut5l7YdeM4uqRcY0l1LAH0kQnQxWXgN7wJiBPPsbuRvdjdQLWUPRSM29VrubsJ9JjvFyCWKZWh0W/LklajJ4gsMTzKfmyaLOhtmxdayWkCQlg0xuRg7CUf0KIOoSKveE9AgJmE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=c4LT84AR; arc=pass smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="c4LT84AR"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49b392ccaacso27635565e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 21:49:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788410976; cv=none;
        d=google.com; s=arc-20260327;
        b=clXxdaxeJGVW/cK4F8acAZoDDSVzn1R+YjfQ0WA3CICt3YCLtPagibNXCF3bEKYMKB
         EYPTFzHrz9s1St4viGpnK4QPJw73zgqdr8WRX+r9f0PmmWrBelhHe0IBz/T7GE+Hi/Fk
         U/04p6hff9mo4IS+GmVjN537uqkgYvYas/HjR0pX/haZ+5RC8zv2UeXElGK1lKKI4Nze
         mqeQDtWOR7/DF/4ZNKTZeHVvo/T4zK1FnbhHMp3VeXEwGO39r9p0WrEQgfANc7PxPkRf
         1X7k1yYGRG0f3nuE9dR21KcerR8thWckpvzd9PxsksV2OLdDB4qZenxmtAWr8DFQsHD7
         fElw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=l0mlOS54FKRStMTSYedi1p7aaRjCgF5zp/ehhypn8MY=;
        fh=KjIjqPwS+pWymH5pGm08QkRze7rlp6bzg1as3fBDt3Q=;
        b=qAUG86zaVPn1+O5DNIobrXih337Y9Vzw7Zot3FiAC5cKwbmp4KRFzvSJ60YeGtLM3n
         /dTrNZLEMxf3/IyCehVKJMX9EKoZVL21GwSsqI/NEuuLe+ZRPzrqQv3hu9OsIkdC/qR4
         GH8N73FYpvXvmtrqhsYOU4JWcnla+p7wRiC6QEo8lm5PK63om+ANkiG4ztgohMCecw67
         251PCiiJYZBngqUxJQR+j5Vp4Z+2TQHlx/4nTVSTADTxgVdBUeq7veN4Vb4o8WJbqm4k
         50AnHGC5KrCBCzjzQvkIdY5WXPmXjfgS4jWfStOGLkh3LcalO7IC1ORTyk/oF2pE09aA
         T6WQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788410976; x=1789015776; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l0mlOS54FKRStMTSYedi1p7aaRjCgF5zp/ehhypn8MY=;
        b=c4LT84ARytV838sTxSqEl5AAdfW5APzG2BRYNvaWazEAuIAGrRys6rP8ftDHAY6zG9
         DrmXEyUBQLjlpz7n63KmGTERrbaNgykLAUmKBTWvidO7JeijjkFSPIlYId6yXFLWl1jr
         GwQXOmBifLEbu77ixKlEoEyY+v1rcUcSar3kx19LXxNN2IPlJ+uGtx9VwSj9TmUz7etB
         Kbn6di/TA0/NgXQuF65fl10fledj7T2LYRhOADYLgc4aeSU2h5U43jwU5p3FiZN1hecM
         MPeN347NtQAUYv511NocAgLy5sD+vFjkvRwaZ3G6jWJNhjnb4xCPZT7NugI7wVqqY7EN
         95Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788410976; x=1789015776;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=l0mlOS54FKRStMTSYedi1p7aaRjCgF5zp/ehhypn8MY=;
        b=XxweiXaMyxzfngkjAGhkFyKrvledMEWDe6MSEptDeBUaUk9RBwGJUW21K/BP3l81Gb
         JXt8fUC1TM8GlA730Z2rBcz9X0wgZOz4pafNEHGeRMC+k9LrLqh8sEfcacEZmn1vTX2T
         t4oWDwBRYdoM9UoAk6co/lx5bMt+EPcMYlCOy/jUXPD8m0tv3Nnbh4yDDEZyoJFcfc1Z
         2kRym/LgIgqXBVyImcw0LYQgIjS73J5FWZnc2oooI/t3fTRjYcmdWNvPWVns05H14H0l
         mVnAwVChTMP/ey0/rsWMtHnPnJD8XP53Q5xjm/ipYhnp3X8KuPElhIJtKlLxhsTeyB8q
         5AWg==
X-Forwarded-Encrypted: i=1; AKwUvBylfNNP6F/wisGXyEPanBWigeg4Ol1HgENdeqtE9C+ICeM9LSSZqPRYGGpTYI10OUW0sisc7qHqKuvtKL4=@vger.kernel.org
X-Gm-Message-State: AFuF++najON0wdO0ZDHoMVtNHJFaHVvH5ZlzYU+1PdTZ/g3cbMJat6WD
	3yoCqZpHbq9QDTcm+UMYQLNGbDuO+Pbi0sMiLegv8CJcwIEqHaQ2Nh6uKK8N1qlNGFAOfCNWAf3
	ML8WTPs5hOGAxH9yvvhh1jKEXZt7nWmOHkdgADI9ZIg==
X-Gm-Gg: AYBFou1tGSN/BDhpJXaEw9UXXEv0wZJ3TLvNYa/lACuUAXSeFITVEd9oc2CHI4pgqvb
	AXyPOXcp+EMkoSo+NqHCYOyY6gmMBhBoBy5Fra6gLbTJ8fuT8fkcVeCol1RNQWoDQXYloUkOky8
	nDfoFFieYRz7IARjIwR4la6lRKXdTQRTkU5Qq+z7CPpILHrqimCy3hzrAzIhYXWI0Ym9hqqNzGI
	n7oWtDfku82r73dUUAep4ls8k9dpDD66CmCCK3NOyrB+aQByS6/8pHYEBekYhGJJosYdvzzDfRu
	38SuEW9B1yD+xQVZ3X4zC0E81CmUrLquL7IqY45ZzeWEsyfUj4d51bVVAhOCdmaMEuXNouybGtr
	nwZFFQ0WkZqpvptIws7mvaAZLHSSjuvu2xoZOsGSJIw==
X-Received: by 2002:a05:6000:2f8a:b0:482:e64d:a1f7 with SMTP id
 ffacd0b85a97d-48488e0371cmr14895217f8f.11.1788410976438; Wed, 02 Sep 2026
 21:49:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902165137.3781696-1-neelx@suse.com> <20260902165137.3781696-2-neelx@suse.com>
In-Reply-To: <20260902165137.3781696-2-neelx@suse.com>
From: Daniel Vacek <neelx@suse.com>
Date: Thu, 3 Sep 2026 06:49:25 +0200
X-Gm-Features: AcwNN1VDTxHl42Z1UbHon5enp5quP2u_4g3m91jG3ZzMwFnTqsQRlff87BfDWkQ
Message-ID: <CAPjX3Fcqyn1dFWqAYqPe+49zGQ3gSqXnet8riqH=-PnaamxaAw@mail.gmail.com>
Subject: Re: [PATCH 1/2] btrfs: consume the given iter directly instead of
 copying in csum_one_bio()
To: David Sterba <dsterba@suse.com>, Chris Mason <mason@kernel.org>
Cc: linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Qu Wenruo <wqu@suse.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 2 Sept 2026 at 18:51, Daniel Vacek <neelx@suse.com> wrote:
> This is just a small cleanup to avoid copying the iter twice in async case.
> We already have a copy csum_one_bio() can consume directly. No need to copy
> again the second time.
> In the sync case we can copy in the caller (as we did before dd57c78aec39
> ("btrfs: introduce btrfs_bio::async_csum")).
>
> Signed-off-by: Daniel Vacek <neelx@suse.com>
> ---
>  fs/btrfs/file-item.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/fs/btrfs/file-item.c b/fs/btrfs/file-item.c
> index 581ca5653be9..5a5cffb18922 100644
> --- a/fs/btrfs/file-item.c
> +++ b/fs/btrfs/file-item.c
> @@ -797,18 +797,16 @@ int btrfs_lookup_csums_bitmap(struct btrfs_root *root, struct btrfs_path *path,
>         return ret;
>  }
>
> -static void csum_one_bio(struct btrfs_bio *bbio, struct bvec_iter *src)
> +static void csum_one_bio(struct btrfs_bio *bbio, struct bvec_iter *iter)
>  {
>         struct btrfs_inode *inode = bbio->inode;
>         struct btrfs_fs_info *fs_info = inode->root->fs_info;
>         struct btrfs_ordered_sum *sums = bbio->sums;
> -       struct bvec_iter iter;
>         const u32 blocksize = fs_info->sectorsize;
>         int index = 0;
>
> -       for (iter = *src; iter.bi_size; bio_advance_iter(&bbio->bio, &iter, blocksize)) {
> -               btrfs_csum_one_bio_block(fs_info, &bbio->bio, &iter,
> -                                        sums->sums + index);
> +       for (; iter->bi_size; bio_advance_iter(&bbio->bio, iter, blocksize)) {
> +               btrfs_csum_one_bio_block(fs_info, &bbio->bio, iter, sums->sums + index);
>
>                 index += fs_info->csum_size;
>         }
> @@ -851,12 +849,14 @@ int btrfs_csum_one_bio(struct btrfs_bio *bbio, bool async)
>         btrfs_add_ordered_sum(ordered, sums);
>
>         if (!async) {
> -               csum_one_bio(bbio, &bbio->bio.bi_iter);
> +               struct bvec_iter iter = bio->bi_iter;
> +
> +               csum_one_bio(bbio, &iter);
>                 return 0;
>         }
>         init_completion(&bbio->csum_done);
>         bbio->async_csum = true;
> -       bbio->csum_saved_iter = bbio->bio.bi_iter;
> +       bbio->csum_saved_iter = bio->bi_iter;

Actually we can use this one unconditionally in both cases and save
the stack space.

And unifying both cases will allow us getting rid of the paramert.

I'll send a v2 shortly.

--nX

>         INIT_WORK(&bbio->csum_work, csum_one_bio_work);
>         schedule_work(&bbio->csum_work);
>         return 0;
> --
> 2.53.0
>
