Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794565648;
	b=H/yAmmzfgLhBuQBKdLUQwlGBb/0EWlohV+H0+WE40hvfK596E6PI+xxq4hbV0cxly/gN
	 yFZ1oyLOC3YUjcuUiac4Zb1Z1sqcg81RXrFTEZqCZ3YcTobHKUcXlKhTSWDtWhhxGfAla
	 xSz5h1nrQkELCGW0qvTz7GRLWljvrit1tTwDnezCkFZ0Gho6zq68DQV6Ph52EM6O+ofaD
	 hHRgBloJITWa82p+NrgBFVMyhavW18XP4GhSEAkfgkJcD8vMqH1jenHcrd+FSDX0Lt0WY
	 3czrygSn6aXK35dEcCJ54PuiC5XRsUzumuoAlq0y3mXRGKxJNVp4nXMq0HgUi3NPuSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794565648;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=TXY31nY7nMCHyiOZTp7Dn0JSWYPda+tFg8CPAdTq7II=;
	b=r2i3n3zieIl1hlM4N0Rn5DCvWnYJgYNxLJmCnf176tJEUAU3RnD9ryzfC3Uzlmyo4KnL
	 vLbkYPx+WRwOnHtjPBS8uR/JZAQuhJG+80Ue28h7coglRjeZh18UI/afhdPtt3K2HHeli
	 O2CmT2vYwib+Z1tO9WVtGlMKQa21WD3IHzarJICYNh0HaO4Ov/QCXLXDBNbdcculAdz0X
	 VjesPmZ5IQy6uiDVT7DWMe0UBeXfdDZ5/HIhIdpVo6bcu3oX9hXBFXXPI3H/ctKlXpRkT
	 h9g/U1Wr0cDkOTSJuLiNWMu9Loo2d9+f2P9v3YAWy7KWzfaVL+7a0Caeq7tARBhid7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=N7Ff61ik;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD42606A332
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:27:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DD42606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=N7Ff61ik
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-492f0a1b685so752881f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 02:27:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794565647; x=1795170447; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=TXY31nY7nMCHyiOZTp7Dn0JSWYPda+tFg8CPAdTq7II=;
        b=N7Ff61ikIQ27nXVrR+i5fFuiFp+kpNCkSJ8kzzwXsWXF8oHPQYaaEtIn2sVJ/R61Yt
         eN/EgbWtaqyPzsaKr2MVnoSj+msmKBheiZS6yCjGNfIw7Nev7hKixHBvdeyifMwCAuyY
         p4HuC2pLhsdw/6s4IDRTQYVk2XreSuuUeA2/lEtpnIKw65+UPm9cBNCU3JmsoFXsrPGj
         WUoovGImF4s4dFS6xRIsBa0e81egoKAVqgb5m7AbWjvbiu6rsFasaFfPaH+ik5AAKzYn
         61DshIaK40jfv3WiwMjZKKDrEIOQNGX/IDgIqQj4sI1tIu9ZETTA/xF/QESgBcPouNO3
         9yyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794565647; x=1795170447;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TXY31nY7nMCHyiOZTp7Dn0JSWYPda+tFg8CPAdTq7II=;
        b=MuQU1VgfXmHmSf4gW9uUtmEgbvWlM66AiNovd8kkXDQv55EIZfoTWKka80bZKjg9JU
         MMZsv7RtA2RFJ598ZbpunmazL0VlKamiwxdoVrFQwiKP65WDhD57uIf8n6PYQoHafwvT
         sxniAx4zNPHzWuvhm/re6ARlsV27m7x0OLW0LW45f7IJ9DAcVUrQ2vxSo1nZIe5PfVXu
         R3WQfzl5DIMtb1wgxREqNDMyfl922pUdruwkm7395cQw44xTxw8MTo3Xp+EpGOgo3Wng
         jE7UNT7Tn1WNX1p5lqbz/v2rdvrVbhKRdAU8Y6N52WoSDxOx2vK+4TyF/vU26JG1snVw
         yp/g==
X-Forwarded-Encrypted: i=1; AL+hErGXw5JGIjGN52PdD6ElbTnPVcVSzM52O8Y/76U8wNj0bQ5TwObsF0K9mcfA550vay4OxPK9ECQyBCbS/0k=@vger.kernel.org
X-Gm-Message-State: APuU4Z/wcQOTzrChqYsOcaUfG4bDmSGS+sg6alEl+FCqSzHktTfMr+zY
	3tjKLBycrUaP2igr+wjeDGaJvXMv30dnXXyActdpjvyRzT8b/1F/8Kyay3UrMIMa2Ycl
X-Gm-Gg: AYBFou3oNR2BQ4eNXqsGPwW5NMhP+dXVMMVskULFdy6Hf077pn+T3F8vEL6Moi2cPuX
	BvqYhfEKeU5iJkz2/ExHheDyLTR46rmVTv/5NJ4B9fiJ6GTmb0tZL81oURIK7te9/cdFdbcBng6
	DmPsuItyLN4B+bksW8G9oJjoubuBXZTW5mk4A3hmjGnvZfifZ2ktiek420l17YHIg8akcV8YqS4
	pjIbDJTuQ4EYPYrUVNbwhCm2ywzqXSuKyLPhebYPk5HeiEUNzLmOiRwZtpzm387Rn03dOVvdimc
	aa5GW12kLJDv1NGHIbySoSgNhnhcOCHk2f01PQ81T3jwGGta/bNmL5n5gk2H1rTDqyJ49O2oHBV
	JlPaWde++eTndv/3mss5Ffco5VgWMVIWobw/nI6vh4m3357gBK7p8wajPMUPeMV42rHbGqzMVzg
	aR/yq4A6vbOgOD2DgaSMy9g1WkBoljBmeBlp2H2kx9NgzUJIhwr0nXDmfajkn40yUnUs5SzT8sX
	y8w/PAjE5DwVJrlbLrV5FtUO+HEja8NAOtNT1DDtPliSt8Ovm2jI8I4VDaywRp91bJqJ1jW9u8z
	Tmu5yJ29KvZOVjrjukd7HhJfhmbsPvCojPQg8s1ePHOsESM8I2wUHfAAqrD9GgE=
X-Received: by 2002:a05:6000:4707:b0:498:c419:3728 with SMTP id ffacd0b85a97d-49c713ae367mr4463557f8f.22.1794565646661;
        Fri, 13 Nov 2026 02:27:26 -0800 (PST)
Received: from [10.0.0.233] (tmo-086-54.customers.d1-online.com. [80.187.86.54])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5a32d336sm5077482f8f.0.2026.11.13.02.27.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 02:27:26 -0800 (PST)
Message-ID: <0c109a58804a2d782e549af6ad13e89532d9f9d2.camel@amutable.com>
Subject: Re: [PATCH RFC 40/41] erofs: refuse files on pseudo filesystems as
 backing files
From: Alexander Mikhalitsyn <alex@amutable.com>
To: Christian Brauner <brauner@kernel.org>, linux-fsdevel@vger.kernel.org
Cc: Jann Horn <jannh@google.com>, Chris Mason <mason@kernel.org>, Josef
 Bacik	 <josef@toxicpanda.com>, Christoph Hellwig <hch@lst.de>, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-nvme@lists.infradead.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 Jan Kara <jack@suse.cz>, linux-scsi@vger.kernel.org,
 target-devel@vger.kernel.org, 	driver-core@lists.linux.dev,
 linux-mm@kvack.org, bpf@vger.kernel.org, 
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org, 
	apparmor@lists.ubuntu.com, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, 	fuse-devel@lists.linux.dev,
 linux-efi@vger.kernel.org, 	xen-devel@lists.xenproject.org,
 ocfs2-devel@lists.linux.dev, 	linux-s390@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, 	linux-usb@vger.kernel.org, Amir Goldstein
 <amir73il@gmail.com>, 	linux-erofs@lists.ozlabs.org,
 linux-kselftest@vger.kernel.org
Date: Fri, 13 Nov 2026 11:27:24 +0100
In-Reply-To: <20261110-work-loop-pseudo-v1-40-4c998976c6c7@kernel.org>
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
	 <20261110-work-loop-pseudo-v1-40-4c998976c6c7@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Tue, 2026-11-10 at 10:14 +0100, Christian Brauner wrote:
> File-backed mounts take any regular file as the image and the same
> goes
> for the extra devices of such a mount. erofs reads them with the
> credentials of the mounter so this doesn't hand out anything the
> mounter
> couldn't read anyway. But files on pseudo filesystems aren't images.
> Refuse them just like loop does.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> ---
> =C2=A0fs/erofs/super.c | 6 +++++-
> =C2=A01 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/fs/erofs/super.c b/fs/erofs/super.c
> index ce05557bd998..980d5fc2b576 100644
> --- a/fs/erofs/super.c
> +++ b/fs/erofs/super.c
> @@ -158,7 +158,8 @@ static int erofs_init_device(struct erofs_buf
> *buf, struct super_block *sb,
> =C2=A0		if (!erofs_is_fileio_mode(sbi)) {
> =C2=A0			dif->dax_dev =3D
> fs_dax_get_by_bdev(file_bdev(file),
> =C2=A0					&dif->dax_part_off, NULL,
> NULL);
> -		} else if (!S_ISREG(file_inode(file)->i_mode)) {
> +		} else if (!S_ISREG(file_inode(file)->i_mode) ||
> +			=C2=A0=C2=A0 file_is_pseudo(file)) {
> =C2=A0			fput(file);
> =C2=A0			return -EINVAL;
> =C2=A0		}
> @@ -835,6 +836,9 @@ static int erofs_file_get_tree(struct fs_context
> *fc)
> =C2=A0{
> =C2=A0	struct erofs_sb_info *sbi =3D fc->s_fs_info;
> =C2=A0
> +	if (file_is_pseudo(sbi->dif0.file))
> +		return invalfc(fc, "source is on a pseudo
> filesystem");
> +
> =C2=A0	if (!test_opt(&sbi->opt, SUPERBLOCK_SHARE))
> =C2=A0		return get_tree_nodev(fc, erofs_fc_fill_super);
> =C2=A0
