Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793065108;
	b=N04ndNc1Qc1e96gmvdlPheUWt1QxjWbHZmMN0GRFcEux5Ii7HNfFFCdHOCTudee1AI8E
	 Pe/F/yQVrgke5ANHW1nkK37DRRhq9JTPzC58wFFs+Drru/wSCv9nEdewwC4Cv+XbP7Rvv
	 5aVlsqVUT2DwqpsZoRQRm0nO9Rg28ghADesknQfi1uLy1yxdi3zq9EqlpCsNs8kV8aHdH
	 BfIzdXy2q9TPiG6HlZedeDrRgXlTz6DoSnBP8Prv1Hmu+tQpW39YcSkrCg/VZgIrIDL7R
	 C/oMVh1FpYyhhCzQzeZiIwiCyGXZgUcPtC2cfS5J2VqEcuy9l+RIJxGyo43kLU/aFow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793065108;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=ZHDPnkMGnyAYkqr6GpDoBCUq9sSQ2qmZRT01AxCidh8=;
	b=H7bBIXfbCFgR3G+qH8cWqAKVKleoC9hcMj2d8OHEWNtzs1eX3BVU5QdXmQ1RoyqnWRbw
	 frJ73prPjAQKtpip3kbhOXk9igNzGPkmp4MTigcva+CapVzXjCaaOHVvAcXlne5b+YBGl
	 k1UYsULuAw7WkzZBkXlhe9w3oPZCxraEP2WyN/SWUmBiPbwfZnVQ3rmDX2DNlHsPXGkts
	 ZyyVN9H+BDfsaQjB/ygd5TbCY5QCSKLIyiX0OLbGqTCe+ZoKG9hco4v42Kprl/9xKnsvr
	 cUxjgBTedEKuLFoCtt2GKZvKbu/aYR6KoUGihf4VGJ9hlnmqqxrpYWLyKa4XED++SDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dUQLU8fY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D66606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 01:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dUQLU8fY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06CF51F01825
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 01:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793065108;
	bh=ZHDPnkMGnyAYkqr6GpDoBCUq9sSQ2qmZRT01AxCidh8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=dUQLU8fYqIIL2JpAY1ug3eRNtjyAnNLqKUrd27nHzJytQWQb1xGpNWfE/kcYCGJDY
	 nuYRmHEMDhgZDuxVQDvCSeBBV1ebLcVgPkAVSg5hkJDX6DkEAnEu2i2AjFzoiw3yn8
	 ZVf4Ty0XxymDlbCBjoYijUrOeXsJA74uy6UNIq7MXrz64MM2TqwA3xaHUG4MZfSFUp
	 9EPmZgDa88FCZCIsxK4rbP2jKfBVY5x3RMSY5+aOM6CbgnY3YEOQpXGBR3Fqp1z/O5
	 ghlX46m+ECtFjL9QBaoTt+OpeqXyM2neZXh0i/6DYs2JWg37Mm/5ALlvSpKUZL4/p5
	 NZ9H5ZdMPn8yQ==
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c2afa22e1dcso478287066b.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 18:38:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz1LNfXtIqNcOqED46obSSc3uaORLp/1jGjBRNMwdrHZUHZDNKtcm+edyOt906PgdZEiOqcMBJzFWWuqB4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKRJgyqIDt85Kp8qiSnLL6zft1zJaXaOSfX31glG910sP+7E9XE
	LDEGo9ekCZxn4OGc3bxy+Qi8dWwLEqZb0ErsqxhT6Ja2hqe6AmjFfAHt9ZcJ1ux7QeZHndh0Lik
	NNrkT6gD0SosGPrkIOxqQDUCUUndsXv4=
X-Received: by 2002:a17:907:9495:b0:c2e:3a72:ffbd with SMTP id
 a640c23a62f3a-c46bdfddba5mr986164966b.41.1793065106712; Mon, 26 Oct 2026
 18:38:26 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026222600.17323-1-pali@kernel.org> <20261026222600.17323-10-pali@kernel.org>
In-Reply-To: <20261026222600.17323-10-pali@kernel.org>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Tue, 27 Oct 2026 10:38:14 +0900
X-Gmail-Original-Message-ID: <CAKYAXd8jXSFn2y+0U-owq7p+Yxmrw5HB2-Roxbr7JNcwds2Dow@mail.gmail.com>
X-Gm-Features: AclHuK-8CLT-64qoqvOxTVhFDkSP2KOd6hb19LDhfmGziKV291hbv9XEcvwmcPg
Message-ID: <CAKYAXd8jXSFn2y+0U-owq7p+Yxmrw5HB2-Roxbr7JNcwds2Dow@mail.gmail.com>
Subject: Re: [PATCH v7.3 9/9] cifs: Add support for creating WSL symlinks in
 version 1 format
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
Cc: Paulo Alcantara <pc@manguebit.org>, linux-cifs@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> @@ -708,7 +716,7 @@ static int wsl_set_xattrs(struct inode *inode, umode_t _mode,
>  static int mknod_wsl(unsigned int xid, struct inode *inode,
>                      struct dentry *dentry, struct cifs_tcon *tcon,
>                      const char *full_path, umode_t mode, dev_t dev,
> -                    const char *symname)
> +                    const char *symname, int symver)
>  {
>         struct cifs_sb_info *cifs_sb = CIFS_SB(inode->i_sb);
>         struct cifs_open_info_data data;
> @@ -717,6 +725,12 @@ static int mknod_wsl(unsigned int xid, struct inode *inode,
>         struct inode *new;
>         unsigned int len;
>         struct kvec reparse_iov, xattr_iov;
> +       struct cifs_open_parms oparms;
> +       struct cifs_io_parms io_parms;
> +       unsigned int bytes_written;
> +       struct kvec symv1_iov[2];
> +       struct cifs_fid fid;
> +       __u32 oplock;
>         int rc;
>
>         /*
> @@ -726,7 +740,7 @@ static int mknod_wsl(unsigned int xid, struct inode *inode,
>         if (!(le32_to_cpu(tcon->fsAttrInfo.Attributes) & FILE_SUPPORTS_EXTENDED_ATTRIBUTES))
>                 return -EOPNOTSUPP;
>
> -       rc = wsl_set_reparse_buf(&buf, mode, symname, cifs_sb, &reparse_iov);
> +       rc = wsl_set_reparse_buf(&buf, mode, symname, symver, cifs_sb, &reparse_iov);
>         if (rc)
>                 return rc;
>
> @@ -751,6 +765,45 @@ static int mknod_wsl(unsigned int xid, struct inode *inode,
>                                      &data, inode->i_sb,
>                                      xid, tcon, full_path, false,
>                                      &reparse_iov, &xattr_iov);
> +       if (!IS_ERR(new) && mode == S_IFLNK && symver == 1) {
> +               /*
> +                * WSL symlink layout version 1 stores the symlink target
> +                * location into the data section of the file.
> +                * Store it now after the reparse point file was created.
> +                * The target location was allocated into the buf but iov
> +                * size filled in reparse_iov by wsl_set_reparse_buf() was
> +                * set to smaller so the created reparse point does not
> +                * contain it.
> +                */
> +               oparms = CIFS_OPARMS(cifs_sb, tcon, full_path, FILE_WRITE_DATA,
> +                                    FILE_OPEN, CREATE_NOT_DIR | OPEN_REPARSE_POINT,
> +                                    ACL_NO_MODE);
> +               oparms.fid = &fid;
It is the same here. we need to initialize fid and call new_lease_key().


> +               oplock = tcon->ses->server->oplocks ? REQ_OPLOCK : 0;
> +               rc = tcon->ses->server->ops->open(xid, &oparms, &oplock, NULL);
