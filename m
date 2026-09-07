Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5900440A07
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 08:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788771282; cv=pass; b=pVfs2eZMApc8An+M5ngBEmtmTZPDr/4VSOLtkbmutl27oeHKFZwjN5m/BivHzHLiBUC/ZF0gCLSgjucWnU+JWML9VpBHBc9GwWEjhhXR+8JqyzG5CzTPn9P4I56EG46batbjn2+Q88b5d4Bzm8jgvNKuxYZ7tBp/3vZUPi9fCo4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788771282; c=relaxed/simple;
	bh=QXjMseea1+MUk12KuF/7jXKNO6pgSq+LEwZGSetRuqY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VSRcr94dTKbM2V+kW9L4C9X2xW52FgQNuGEq4UXhdp2uk9jsaDb9yvnAUTaRikHMyh5937+ecnOIUAzfZlJlYDZmXNIutvXt4pxDxrUD4xblXalFIHxc6axg1X9SSl5xIKqEo8Ai/OTeGXnGubeQFbg4TeUq5EtLsgxm1ddDXdg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GCd2k0YO; arc=pass smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GCd2k0YO"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5b457a0b4e5so2999625e87.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 01:54:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788771279; cv=none;
        d=google.com; s=arc-20260327;
        b=Jxy2IfQqm8nVzBSQ2b6B9Axf1wYK/PJA+y1sZpUorbojrshPi0qI8tBRloDf7x4x2G
         GAPamMnoJ3lehS7b9Vu+RKPSI/mXzlVp9XhiExY5JxhUGaTDI2pXI00hFfTSvGsDlpzL
         W8wkJTXWqi/3Qv5nnrAj7jInl/aiMVlhevE0cgTPAMJDOz6oYzSYFMvVY8WPeHFx+OtC
         M+u8DIT5T6hr46iXKxRmSZZRZR9J+2uoG4aXkADnBlMMwf3WUXvoWofQrzLjFt2rboPq
         g6by4HIKw3VuLi3G+61cD+MtwMo5d9PCoUDcjXCxyFiObSxare8QV1fuEkuVrTC3MbtN
         zIMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Mb38/XyezgCTk/KQzy3RRuSB7soXICP+oM6KFosVqh8=;
        fh=Jhyqr+RTraakle6w2CrpUml98fbGQVOtPCeeuFqLudY=;
        b=ehfp8e5cYvRkGFeYeWqVkyZUhzuo7eev0p4MmmmCVCqBFrzxnCNQqNehia9qfBvOMI
         SurNnOpuGvaJoFCi+s6EtXpl+ZS0lQa4FhpBTLfG8L83QYTugLfb3s1GbyoGJoaYoexo
         JtgGylhntiSX7hD/HQZT9kwJymtG6rtjdY71XjF4Pja4J0z2mVuzXO/yT2p6XNouIQ/R
         aLUUGB/bCNkYc2p/anpQmfLNF35FRXNpZ/3tu6Zvi6ufl1KrqQPjnu7iT31/6znF33a7
         ZQRG4rBTBDvEiZ8B0mgGS6yKlAHSjeLjbGeWpPxnjA4TU6blBViG3F3dmSRtz622hvPa
         rxSw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788771279; x=1789376079; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Mb38/XyezgCTk/KQzy3RRuSB7soXICP+oM6KFosVqh8=;
        b=GCd2k0YOt50GjTijPya2LAHftQPB90KcZgO9c8eqv6oQqPzOOiqElrHyEibblWAz8H
         kF5t5vQlwi8BcefMKmE9RDg70AF7JfTcXcFDDoK4NoPzRhTjzHtV0q5lf/bW/L8w/d4x
         P1f5D98N+cqkzOoo8T9i6h7a56+8TvD/XZ5ZK8OJP1gXVDdb1y4xUGhoNhQiXLtYu7L0
         89Kursu44qTAnlrxvRFvxtXnoD8KIt4rhMeHcl7ZtSYF4WjTDkOO7tgP8Dd4BPIlBNTn
         1TAIZxw89har3GEV502d7n0LOTQnS5HAqjg7j1jcoUnfKH89WEabUn69QLGOUa30sGoN
         jcMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788771279; x=1789376079;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mb38/XyezgCTk/KQzy3RRuSB7soXICP+oM6KFosVqh8=;
        b=hMctYhu9VTkHiZyC2DGGcS/F0WOO94E2NCU86rIrtk7/Njaa1y5XevzXbGrRQb/y1L
         e/bhWiN7CDrIZFuE82KLOsyDYbMx6wtrDEu+xn87Dfn6thlZg+x2LxOoZGLZC0q6QlQh
         KNhhPPPfJPs5Or5N/WquV+E1YrBqrqgk10+/wiU1BzD6nNPL95uW8KoZGJY0xkrO5Ohz
         n4uA143dDBP/Wa+sWPtvIHrTD8+DMKQb9KlbpAVkBES+5CEXRDWjnxwQqOAM6x2IBuY4
         c5MYn2zxJIAMN/pOlP4/+4KDYIm0QB2Ky18oHnamNYPer2nybk0oaHjZ06EaDGDfisQk
         DJAw==
X-Forwarded-Encrypted: i=1; AKwUvBzextBFQisBpSPJvVXpHgMtgEEvlklEUM7XcmvxBWPv68Rprjwua02zOF0E9boYa8vv9+gfn2mvVK0yGYQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mEX99edDL9FfWaS4lcFzuuKSmMre1XYhfv44FuC9wUvaxE5XCl
	N+31vQFaewDh4sh5vnjN1u0elp7FAC3zLlwdqatuxClYiR8O27enDsCb0PikQX+TzKDi08Iaz09
	NnQOLjmJIoNtIEVRw3CsDnTS4mPoHIaA=
X-Gm-Gg: AYBFou0DQyZrIAf8vPXtdTvrsjKRy98fNF16/Ya+i2PaUC7LRIhqw3YWOUIHgy1mVR3
	ZJZkP93ehc6u/eUl8DoRog66aSzkbKf+1/TMiZjaSe6nGynuoMRvJHjPX1FcZMKHl5qwTWIVWk7
	pObXf8GuE4iMGuRwAQmLOTlruvpqb/Fu6CCjrBVbfliHrWhiYs/1YfozxBVYSngJPDCXnjSQGK7
	TEMnKZ6uMWWBbYXlsnuhS6kM7k8HiJA6yTxhLhrJzyYdWk7X97jmVD18be8P1ro0YDDNK8bF1m9
	eLgKTuz/VxFd2fCkuzX4765roEAc8Fp36S3RuGo1m53z+jGUxqtj3PA=
X-Received: by 2002:a05:6512:110d:b0:5b6:183b:d208 with SMTP id
 2adb3069b0e04-5b6183bd373mr2958460e87.47.1788771278685; Mon, 07 Sep 2026
 01:54:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <SY0P300MB031263862D7FD47834F1E87FDEB42@SY0P300MB0312.AUSP300.PROD.OUTLOOK.COM>
In-Reply-To: <SY0P300MB031263862D7FD47834F1E87FDEB42@SY0P300MB0312.AUSP300.PROD.OUTLOOK.COM>
From: Hyunchul Lee <hyc.lee@gmail.com>
Date: Mon, 7 Sep 2026 17:54:27 +0900
X-Gm-Features: AcwNN1UQCOdsyH-zzjbRhn94C4SAU2WskgBGWC7pBgQzD2sd-mp-ikPeShGlfhM
Message-ID: <CANFS6baT-+_u+c99qThd7jekqXZ3BW5utLPERLa_X3FE7XiBNw@mail.gmail.com>
Subject: Re: [PATCH] ntfs: fix $MFTMirr write offset for MFT record sizes
 larger than PAGE_SIZE
To: =?UTF-8?B?5pyxIOWkqea1qQ==?= <zhutianhao75@hotmail.com>
Cc: "linkinjeon@kernel.org" <linkinjeon@kernel.org>, "ntfs@lists.linux.dev" <ntfs@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Tianhao,

2026=EB=85=84 9=EC=9B=94 5=EC=9D=BC (=ED=86=A0) =EC=98=A4=ED=9B=84 9:35, =
=E6=9C=B1 =E5=A4=A9=E6=B5=A9 <zhutianhao75@hotmail.com>=EB=8B=98=EC=9D=B4 =
=EC=9E=91=EC=84=B1:
>
> When commit 115380f9a2f9 ("ntfs: update mft operations") refactored the
> MFT code to use folios, it assumed $MFTMirr is allocated contiguously,
> which is indeed what mkfs arranges.  However, the folio rewrite kept a
> leftover from the old buffer-head/runlist based implementation:
> vol->cluster_size_mask is still applied to the mirror write offset.
> In fact it is no longer needed -- and in some configurations it is
> actively wrong.
>
> For example, on the built-in 4Kn SSD (Apple SSD AP0256J) of a
> MacBookPro14,1 with 4096-byte MFT records, mirror record 3 is still
> written to the location of record 0.  $MFTMirr therefore gets out of
> sync with $MFT and the following warning is printed on remount:
>
>         ntfs: (device nvme0n1p3): check_mft_mirror(): $MFT and $MFTMirr
>               record 0 do not match.  Run chkdsk.
>
> Fix it by always adding the folio offset (folio->index << PAGE_SHIFT)
> to the base LCN address instead of applying the cluster_size_mask
> truncation.  This is the standard file-offset calculation and is
> correct for every combination of cluster size, page size and MFT
> record size, provided $MFTMirr data is contiguous from mftmirr_lcn
> (which mkfs always arranges).
>
> While here, verify that the folio returned by read_mapping_folio() is
> large enough to hold the whole mirror record (folio_ofs +
> mft_record_size <=3D folio_size(folio)), guarding against records that
> straddle a folio boundary when mft_record_size exceeds PAGE_SIZE,
> although this cannot happen in practice.
>
> Tested on the volume above: before the change mirror records 1-3 are
> all written to record 0's sector; after the change the write-back
> probe reports:
>
>         ntfs: NTFSDBG pre mft_no=3D0x3 folio_idx=3D0x3 ofs=3D0x0 mftmirr_=
lcn=3D0x2540c5 clu_bits=3D12 rec_bits=3D12 PAGE_SHIFT=3D12 sect=3D0x12a0640
>         ntfs: NTFSDBG pre mft_no=3D0x0 folio_idx=3D0x0 ofs=3D0x0 mftmirr_=
lcn=3D0x2540c5 clu_bits=3D12 rec_bits=3D12 PAGE_SHIFT=3D12 sect=3D0x12a0628
>
> which matches the expected sectors computed as:
>
>         (NTFS_CLU_TO_B(mftmirr_lcn) + (folio->index << PAGE_SHIFT)) >> SE=
CTOR_SHIFT
>
>         record 0: (0x2540c5 << 12) + 0x0000 =3D 0x2540c5000 >> 9 =3D 0x12=
a0628
>         record 3: (0x2540c5 << 12) + 0x3000 =3D 0x2540c8000 >> 9 =3D 0x12=
a0640
>
> A 13 MB file write succeeds on this volume and the file is byte-for-byte
> identical after a umount/mount cycle.
>
> Fixes: 115380f9a2f9 ("ntfs: update mft operations")
> Assisted-by: UOS-AI
> Assisted-by: CodeBuddy:Hy4 preview
> Signed-off-by: Zhu Tianhao <zhutianhao75@hotmail.com>
> ---
>  fs/ntfs/mft.c | 26 ++++++++++++++++----------
>  1 file changed, 16 insertions(+), 10 deletions(-)
>
> diff --git a/fs/ntfs/mft.c b/fs/ntfs/mft.c
> index 7e58c99f1728..a62b1d41697c 100644
> --- a/fs/ntfs/mft.c
> +++ b/fs/ntfs/mft.c
> @@ -462,7 +462,7 @@ int ntfs_sync_mft_mirror(struct ntfs_volume *vol, con=
st u64 mft_no,
>  {
>         u8 *kmirr;
>         struct folio *folio;
> -       unsigned int folio_ofs, lcn_folio_off =3D 0;
> +       unsigned int folio_ofs;
>         int err =3D 0;
>         struct bio *bio;
>
> @@ -482,25 +482,31 @@ int ntfs_sync_mft_mirror(struct ntfs_volume *vol, c=
onst u64 mft_no,
>                 goto err_out;
>         }
>
> +       /* Offset of the mft mirror record inside the folio. */
> +       folio_ofs =3D NTFS_MFT_NR_TO_POFS(vol, mft_no);
> +
> +       /* The mirror record must fit entirely within this folio. */
> +       if (folio_ofs + vol->mft_record_size > folio_size(folio)) {
> +               ntfs_error(vol->sb, "Mft mirror record 0x%llx does not fi=
t in folio.",
> +                          mft_no);
> +               folio_put(folio);
> +               err =3D -EIO;
> +               goto err_out;
> +       }

vol->mft_record_size < PAGE_SIZE is guaranteed by ntfs_fill_super().
Is this check necessary?

Thanks,
Hyunchul
