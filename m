Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com [74.125.230.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4478449B3A
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 07:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789977558; cv=pass; b=IXOCkRxTVK8zMuxlNdEYyo9MJqULEcnE43rBKZvx5igQsOifvDB2BS3NugudPWQOKk5x4gb8/t/tpTimEok0rqImgNtATU2RB7dlmYF0DdvE8yejrB422n/EUpnXee6vf4LHsCwC6/Y8AtPZx5FC05q8HNtiQG7EdZSk/IBL/cg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789977558; c=relaxed/simple;
	bh=I2KFHCsto5ktwcOC7Smw2RZRoRdPhzo99usTN0lCH4g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V+mnkkaLrIw3KUjvUmqy888pTv/s2zM3mYtgA919L0uBdgU4PDCUHtuNAcrcvglgFXBZIFfrTKL+5kMk2iOvJrdI1/N0EMCeRAV+/LqeTsNvzh5DT+VoRUwbnooYUcUNu8AE8kOddqP3NjQ747QrAuHdn2QWrTyUD1D9wbiyEEk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U5qNI9iE; arc=pass smtp.client-ip=74.125.230.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U5qNI9iE"
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a2ff17443dso27729691fa.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 00:59:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789977555; cv=none;
        d=google.com; s=arc-20260327;
        b=PKVJ/MHsKUZQwXB3p/rJlSBclJXeHv5+quwvAEugbf9CMFpDP3Zn81mGrEkpx6uAi9
         RqcQ/wTqVTXTIaRfPbgrY4+yIvI1v/HOsTRV2Ru6IFFgV7xS2kcmhDdLEjsv5+oeNlPD
         oxPmcfNGntiMB14sggT5PcE28Mk95ynH6slXSgJzOgxuG73E1RJFI+iHPrfEZd6oM9Pu
         T0jRwAhFiq+MgoNFNEmNF/8yVKSMi5VO3NMSFC0xcF62lcJwah8VjX31nl3Ce4SZeznV
         tabPGV5vq1RTyfoA24DOT1mcW23feKcR5BLZgYsLu34t/ciMj5qytL1ULBY8krI601Um
         dL2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3aepA27SIv41SqDk2ILO7FI1p6Gl+MGhkJvg7WvtfaU=;
        fh=eQsUQm1p1HUH5EsLA75HbCCl05FJKD0qRQQfAq99syo=;
        b=OZJb3WBvpS20SkMvCjlZZ2cmic+1oBy4nqS00dYoEnFkvUSiWka99+AiQLbcZaQqGl
         AR0moqlmS9SCl5FetZInqjPMNJMktl5LJj8kOMTt1mYVCIexgv7cXW1C05IN4ahUNATz
         t9eAMCCQG+qqnO4ZrhzXcYHqs9IVuw6JgKPbMp13dYSWVdPz6GsH3jxtsPKrkEn/NQZ9
         YkaXYniI0JaEQVGTxBErswUbcO5NWooGXGUPaQAm6z5RzaSVhTwqDQziSq7gi6YwYLja
         COHEKh/25T78KWs0wRHX5V/am2eaimmYbbiaMjKQY7HVk5E9ASv8JISC2pkF6W0cWZgu
         tMkA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789977555; x=1790582355; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3aepA27SIv41SqDk2ILO7FI1p6Gl+MGhkJvg7WvtfaU=;
        b=U5qNI9iEjEVibd0quqYiYVMIGHaSVDIdoPsQd4vQb5MsfWg0q8fU5DcUJEo+CIvRT3
         /1WkzLJcxX/ZNX0pFMkGdGpTuauqiGxgCrfBUQ1OA0cI1GPrPKNID8lvqMbBzW4aczRj
         B9kHW7T4rmvtP3rhjG2egnJtLV8m5KpZeo1O2Z8HBVrMS74YpmgoFlTWOBSi1yhPkCTS
         /7PNG/uetboANNk4ylgWyRTI7pzeYn47EAusYU0CXDNqjmBbg2CJhC2JV4MLNW4xQdrw
         5lnU1w+U3/45DkoBK/Oxcj7NFjN/k7tpsAbn+hLjJLP5dlr3tR/jttv3Yfs9+Obol5Yx
         SYHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789977555; x=1790582355;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3aepA27SIv41SqDk2ILO7FI1p6Gl+MGhkJvg7WvtfaU=;
        b=aUM6cPaFf5ZnRLuj/k3o++NvopAMHu8DUZNKzvQVUy1hSWbsEvc3knTkyKNvjn5xso
         Y02xKdKoT3IBIagsNWIoe1R1IdoGiG43bQvzbkojfDMlco38vf5xHuovqRO/s2YRBFjr
         5iasnmUqstrz8tDnHC2hM5phNhFBBmLKRorYdKkV+dJaPl/DGWrjtfwVe6pAYE7Eykf0
         btW3WpGygeL4yEVSMx8JdTvKRL1lXfUx1jYFMBojV95nBoCWpLCgksJE3CF3HZTqCnik
         9Br5pDe3hlQOo5Awmr9M09+/RB7xUCKyFo2eEyfVdYOQiRMbmzUOHCj5j0ux34uGlE3M
         bEIw==
X-Forwarded-Encrypted: i=1; AKwUvByMQWexoXD/kXx3j66js0glKf16CvE5Bjzpdz4YBAYmSUZPsq85uAgJ5oyz4viy+STxL24YkmHZ9vXmzB0=@vger.kernel.org
X-Gm-Message-State: AFuF++nR9oSWftEuAzIggi7FERK38JPb81pmdt1SyaW2n80dt+QcsV1q
	oBPOCDFMGFjgq62uXkFP+9Ap7nTAMzg7O3tODi7BiFK7lN3JMvir44ON9NpGpxivPiDIsNg6+oa
	khHvQTEfH5mSt92FPO7R7Kntwa4Wg/dQ=
X-Gm-Gg: AYBFou1sKCai9TB6gxR22SORM2AaEZkPjala6ubhyEEo9xU+0A8IJGuqP0jTxi8tLJl
	T9Wz+TS6uei+ad8Xt9Y3T+7UbhLGvSmGzHHoQYZjMQXWxxoBPB7AzXLeSbWiw2FV5SK9ew2gGX9
	/gNwyDcYhOw3Tdorhas1c9ihePHubKDeH76msrspOwCi0pQj6b0z74c6VapHGrEDToFekjlkxQC
	b3SQbPhQGgjm/dHXJ0ZSVIzXRzi7eNaKfuAKhEEZYFUjJLcibAWaCTX8lxy9S/W3I9HyVWo0h45
	Fxv22WnDowLiEyk+AoTku7JNfCm39FxQgBHByE8AOgtzitKNE6TSr1E=
X-Received: by 2002:ac2:5685:0:b0:5b6:1783:d7b1 with SMTP id
 2adb3069b0e04-5b8c17fe594mr3210051e87.17.1789977554310; Mon, 21 Sep 2026
 00:59:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260920063153.376958-1-wangxuewen@kylinos.cn>
In-Reply-To: <20260920063153.376958-1-wangxuewen@kylinos.cn>
From: Hyunchul Lee <hyc.lee@gmail.com>
Date: Mon, 21 Sep 2026 16:59:01 +0900
X-Gm-Features: AcwNN1UkiQ_JkJL9NtBeCTb_hgmCbNBO3fvAM0Z6ss-_2PtRfA3QV5xcX422Ypo
Message-ID: <CANFS6bY7vbzua0K8DJ74Cps7WDmpWOfxozPA4cu9Nro_Zx3xOw@mail.gmail.com>
Subject: Re: [PATCH v1] ntfs: preserve the 64-bit FITRIM minimum length
To: Xuewen Wang <wangxuewen@kylinos.cn>
Cc: linkinjeon@kernel.org, ntfs@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Baolin Liu <liubaolin@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2026=EB=85=84 9=EC=9B=94 20=EC=9D=BC (=EC=9D=BC) =EC=98=A4=ED=9B=84 3:32, X=
uewen Wang <wangxuewen@kylinos.cn>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> The minlen member of struct fstrim_range is a 64-bit byte count, but
> ntfs_ioctl_fitrim() uses max_t(u32, ...) to compare it with the device's
> discard granularity. This truncates the requested minimum length before
> passing it to ntfs_trim_fs().
>
> For example, a minimum length of 4 GiB is reduced to the discard
> granularity, allowing smaller free extents to be discarded. The truncated
> minimum length is also copied back to userspace.
>
> Use max_t(u64, ...) to preserve the requested minimum length. The bitmap
> scan already compares the aligned extent length against range->minlen
> using 64-bit values.
>
> Fixes: 9c87959601e8 ("ntfs: update file operations")
> Signed-off-by: Xuewen Wang <wangxuewen@kylinos.cn>
> Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>

Looks good to me.

Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>

> ---
>  fs/ntfs/file.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/ntfs/file.c b/fs/ntfs/file.c
> index 8164326b7812..e315fed4d13b 100644
> --- a/fs/ntfs/file.c
> +++ b/fs/ntfs/file.c
> @@ -866,7 +866,7 @@ static int ntfs_ioctl_fitrim(struct ntfs_volume *vol,=
 unsigned long arg)
>         if (range.len < vol->cluster_size)
>                 return -EINVAL;
>
> -       range.minlen =3D max_t(u32, range.minlen, bdev_discard_granularit=
y(dev));
> +       range.minlen =3D max_t(u64, range.minlen, bdev_discard_granularit=
y(dev));
>
>         err =3D ntfs_trim_fs(vol, &range);
>         if (err < 0)
> --
> 2.25.1
>


--=20
Thanks,
Hyunchul
