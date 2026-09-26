Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 047772D949F
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 00:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790383223; cv=pass; b=TxRWdtnhMBvEnBPycUeI0omCEIF41xQbgrjnFji1JN8q5B7jvG4WaPiw5BwLVo46+YvX5SHnm1EX6rmqoYkMaIPrqYm3FUXgiMOaLSEtUb5grQWC1zuqbfHSBsv6wvtXmeC+aiA6qX/X1RRIoeOoGEF3Mvc10y4yy62yjgNs9lA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790383223; c=relaxed/simple;
	bh=7DhMjH5N5XF9fS/BZ2LJ2RF6dpiI+T0v4GppIEEpcxM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h68hycJk1WxlV3s7mrRM1iuHJzdJobc6BSEcyNogRcI9I2iybOrtgdf+9+FTdyQ6Pd8haf81e9rvL4LD19Gc8O4Ha/j1Zmyl3lcnfUlYRjXuWysmFUGNDn3Xcqky9mIppwQYY5ltp4/lSXW3zbGHk5/z6MpQ8jordABwuU3Xmdo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UhK7ajvG; arc=pass smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UhK7ajvG"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b5e4f1801fso1574872e87.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 17:40:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790383220; cv=none;
        d=google.com; s=arc-20260327;
        b=NurO7ESiSTjO63zlTgxelA4C/lFivgA1z6pyQqi5WWCmuEG45kjzapjHpEi1K4hkQg
         f1mqI4QVFkeZJUfHut/ADnbg55AGukfmV/5hfYv0Ite8UYqAqvM1I3n8x0sy/vcre683
         X3BpPZ+b+GneiGGJkhGf3ocez5Vh928Ue2gT/oDcY6Zldaw8QV5Krx5ceYJxW8HAzGVK
         uPiSb9OLO/R04OGZxSwGav/ouLpepkc4gMA2YUPb5fZ/Ru5CE0I41q+J/UkosyFocT+A
         qJQyV+zY3T4dPwHdn7mY6P9lI8Amw7Zye3yL+h20voW6OYNtxSflw3W4A4KMuXukbaxQ
         0Kiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+h0qP+4rWemeUOjKm/YX7VfqWwYMcqoZN/dAFFF/g10=;
        fh=pDHh/8hXBR282mByoY8uMZ2rpGOu47TQvDHg0YK3nCc=;
        b=L+ly+5PeTFtCugy29JSYFGm+d1kkqj3x8VNhxeP2ZN+8G3mYO/u+jqJDL6vwVdk9VY
         LdgDakkSHFDftdMJDcHNoh7iwVmxjKhkdEyOYuhHVkBMdPGzrr2QY6cy5uVxe3F63CJi
         4mD+VfGAmAYPT6VxDXhI8NmtkARYepo6OmsL6L6gm7y4c6iJ5P1kf1Wt2jYh4adZBzpQ
         cbD4y47q5F7jYC2n9t487kUUwEwm6nrbB6MSJOU+tkGFmxQizFIlO/m5m/u0buZ6h2tO
         Z+/uAD67Bfb3JyAzZYB1F+LzYNFQgTTWy8/EVG7t+Y9qsdS2Nf4tvJMWFS+fLl2cw01r
         8VXg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790383220; x=1790988020; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+h0qP+4rWemeUOjKm/YX7VfqWwYMcqoZN/dAFFF/g10=;
        b=UhK7ajvG776tyEkbL7Q70T0juNsFIvb37lgXSJe6JbEou3Kf7Yp58jjNj7xRQCMfZK
         MYm1Nr9YxKOnbAUMtaq1uhFcoMWf6J02NmRtH5yzSElFHuyryuR1iM81LgsUR3AeWntY
         eNXxKZi5I5v21xNl4zwg+DS+QGR1DL9N9uqAbRIDW6TVDmh3c9bCJr2k2O3yBMda4+xJ
         NUllaZN7csKxIBTxFeWx08ajNhqg0uRkZNYykQEMHGYz/QREyOzh0LFxeBsZMLdXYodT
         mIt2s1DZK+9XAC+g25oOp3RaV7/gdOMzSLGlYpfvgYkeUcEtQbgWCtMwfkNMqHOjrxfs
         lZdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790383220; x=1790988020;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+h0qP+4rWemeUOjKm/YX7VfqWwYMcqoZN/dAFFF/g10=;
        b=saeQCwqzL2psZ4SE3+aHR6ms5Uh6Y3E7XpaFhS5OeUPQcDrS5oI3XeWlK8hxkhc8FP
         nyIr8SbxRbjz4Lskt4V0XBLeYv6dEAGRu3YoVWIdp8XFYml1S1Xh5ZdC3+y9Q//QDKHr
         i5LQokMMVgHf+7n03jWN+votXd26tZKyWo46x9FMsiX3RKn9wafBXyz0pPYj69k50yzn
         X+c7G80dEf5brAo8txS8n9WVjHGBzaqgvfD1+0LvC4VT2pTUFpYOkNaMx2NSacz0rXEI
         iAAaldSaiKFtA8oP3TcFTQyL62g0zxXY9+dF9OL6bYucxw9uv2aZgZYe0lSnRKotn0zT
         NB9g==
X-Forwarded-Encrypted: i=1; AKwUvByWdOKQNqJnUWBs5TrPwFPoTZ5PO8vQbK9NCnztcN1SHWO+e2fha5QeJ2e4Nd99E86E3b0zacjRRnC/mpU=@vger.kernel.org
X-Gm-Message-State: AFuF++kODAcFJcBxeQBRdgPjXnal+IjFsRot3kiP8njgT3eF/NnAbVo1
	WhVGJlzl6396hnhSGa4FI6USJ91sBliTYv9ijYQzIgv0sFPfxAzAaKO6fHnwlJyBa+UPsXnDDq4
	53DA6AmFS1wwvVjyBNSERs4xpcTUR9QIqhQ==
X-Gm-Gg: AYBFou09zohhy6d8ubsYUuvhWrXZopYKxfmmNqV+yIsZEW6MOGCROeEQCrveQKRiONC
	szn7ET2h17CuAyN5YiLXbMI7GLA0dsWMQ7NnUNjxxY7HLaPfHA3hIwTwTJ9PcmWb/kHqxx0iPRm
	tYHeZVxS2/VQVdN07bVbrQ/3tW0j6hvJqIC6dEcc2Oe2TKE8dD+TZXeiDxNE0zvESkYTsa8shb7
	0zrWC+bQJNNUf6k2nUxf/0M3cncWel7Yv76CEg4KG5wFrZuIj980EJaqmtckvNrTA/z/ipDf+zB
	D/BkXqPBxteXJlWdqxOqeg10pi50DNH5SeU9ekECuYR7YLtMvO3QyWidyw==
X-Received: by 2002:a05:6512:31c7:b0:5b8:9f19:7364 with SMTP id
 2adb3069b0e04-5b8df07a9bcmr2573880e87.32.1790383219836; Fri, 25 Sep 2026
 17:40:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924090102.2865942-1-liubaolin12138@163.com> <20260924090102.2865942-7-liubaolin12138@163.com>
In-Reply-To: <20260924090102.2865942-7-liubaolin12138@163.com>
From: Hyunchul Lee <hyc.lee@gmail.com>
Date: Sat, 26 Sep 2026 09:40:07 +0900
X-Gm-Features: AclHuK9mc2T88jTjIKmT1vyN9AocDUvztl6mV91kKlxXPPXrMVwNzXNOdi70g4U
Message-ID: <CANFS6baY+nbdzux-pF-MZ+8ryP8Q34RyO0Rh4qVR7rqvjsPHbg@mail.gmail.com>
Subject: Re: [PATCH v3 6/6] ntfs: report shutdown errors to fsnotify
To: Baolin Liu <liubaolin12138@163.com>
Cc: linkinjeon@kernel.org, ntfs@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Baolin Liu <liubaolin@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2026=EB=85=84 9=EC=9B=94 24=EC=9D=BC (=EB=AA=A9) =EC=98=A4=ED=9B=84 6:02, B=
aolin Liu <liubaolin12138@163.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> From: Baolin Liu <liubaolin@kylinos.cn>
>
> Notify FAN_FS_ERROR listeners when NTFS enters forced shutdown after
> FS_IOC_SHUTDOWN or backing-device removal. Keep the shutdown state
> transition and notification together in a dedicated helper.
>
> Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
> ---
>  fs/ntfs/super.c  | 12 +++++++++---
>  fs/ntfs/volume.h |  1 +
>  2 files changed, 10 insertions(+), 3 deletions(-)
>
> diff --git a/fs/ntfs/super.c b/fs/ntfs/super.c
> index a7a7ecf9d074..a0d3934ef6c8 100644
> --- a/fs/ntfs/super.c
> +++ b/fs/ntfs/super.c
> @@ -414,6 +414,12 @@ void ntfs_report_file_metadata_error(struct inode *i=
node, int error)
>                 fserror_report_file_metadata(inode, error, GFP_ATOMIC);
>  }
>
> +void ntfs_report_shutdown(struct ntfs_volume *vol)
> +{
> +       NVolSetShutdown(vol);

Could we call test_and_set(NV_Shutdown, &vol->flags)
to avoid races?


> +       fserror_report_shutdown(vol->sb, GFP_ATOMIC);
> +}

we can avoid test_and_set() to prevent race


> +
>  void ntfs_handle_error(struct super_block *sb)
>  {
>         struct ntfs_volume *vol =3D NTFS_SB(sb);
> @@ -430,7 +436,7 @@ void ntfs_handle_error(struct super_block *sb)
>                       sb->s_id);
>         } else if (vol->on_errors =3D=3D ON_ERRORS_CONTINUE) {
>                 if (errseq_check(&sb->s_wb_err, vol->wb_err) =3D=3D -ENOD=
EV) {
> -                       NVolSetShutdown(vol);
> +                       ntfs_report_shutdown(vol);
>                         vol->wb_err =3D sb->s_wb_err;
>                 }
>         }
> @@ -2086,10 +2092,10 @@ int ntfs_force_shutdown(struct super_block *sb, u=
32 flags)
>                 if (ret)
>                         return ret;
>                 bdev_thaw(sb->s_bdev);
> -               NVolSetShutdown(vol);
> +               ntfs_report_shutdown(vol);
>                 break;
>         case FS_SHUTDOWN_FLAGS_NOLOGFLUSH:
> -               NVolSetShutdown(vol);
> +               ntfs_report_shutdown(vol);
>                 break;
>         default:
>                 return -EINVAL;
> diff --git a/fs/ntfs/volume.h b/fs/ntfs/volume.h
> index 366e9f5d0443..648fe8991304 100644
> --- a/fs/ntfs/volume.h
> +++ b/fs/ntfs/volume.h
> @@ -256,6 +256,7 @@ DEFINE_NVOL_BIT_OPS(SymlinkNative)
>
>  void ntfs_report_metadata_error(struct ntfs_volume *vol, int error);
>  void ntfs_report_file_metadata_error(struct inode *inode, int error);
> +void ntfs_report_shutdown(struct ntfs_volume *vol);
>
>  static inline void ntfs_inc_free_clusters(struct ntfs_volume *vol, s64 n=
r)
>  {
> --
> 2.51.0
>


--
Thanks,
Hyunchul
