Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793897643;
	b=zD3frklXgHHCNq/B7GEWnVcknpaFaEAxIJhQuPuBt5HpCmN4fo2zCx+5+I1jF5tpahNF
	 KconNtlmxMhfWEtx/H3Ef8wXpJKvMhac8Fyzi2zpLq13+e9dUkwkcVyZ8OAwmWi/TVvH6
	 uV4pUnFv+8zcm21UAaB3LWdkx4Q4DILJKd9vKhnjERzfMVspPtaU4twVmRlzz5VEW9Asf
	 6RcXEyFOWPvLRRGx8o60WsIGC3KwNzA2RImZ2dUvomNTBXIQF7eBy8iEeznQSO/qcFZUY
	 NaBUBpa9p7w7G8Fa3277Ts92lkoQBh872bzmoOjeF4b35y0wb3TDPlWUizeQLG+Pngg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793897643;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=dwfOaeQbEriUr7n1LwUP935/2zWyl9SRrKy8JH5RF/A=;
	b=otdNEpBEe/vwdFNbQGUQnIFjQ8sRohmPcgUha4wL3Hmtud9odVVatJqHnyQl+otGibaE
	 YhTWL7dfGS9XNdAfjW9VdFOpqmyGZHYWjAC5acOplDYA69XtiTC/YEy6EGMvFX6zQ0lnC
	 fj5KQ91k9E6CclSJGRgdHrtiZbcC/Jsrrlot9ZIpgp5WGtC4AmgVRWBbiKBvGw+zfXGQT
	 mxqcUOvXR53Ad6lwiXwbCzkU+nN66O9CNyi7MLym/RKR28OxCzbR+blGGmjgVtTmkoxFv
	 oZpk0XgYts2A6A55Xn5k1I4iMr2ePDevMafe7Ow8Pyqo2ayZBj+n6pRmUyCapD1VNRg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="LcnwD/qS";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACCDB606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 16:54:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACCDB606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LcnwD/qS
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c3f8d72d7ceso372507966b.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 08:54:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793897641; cv=none;
        d=google.com; s=arc-20260327;
        b=AJo530gV7rpFwUQM51L7msGbJzcsbsIrigPSWdgkQcr54By0Y9uIXGFV3g35cp1itP
         uWjBu861Xr6tL8wspdkENiAabV3UqwRF1Y8tTdUNu/h2aeRnv9wjZ6CM/Rk4pU+BCGox
         eEhcGyhfBKluQkkaUvRMCWR+reW+VQMZLl1zrBg56Xvc5LzHs+itk3H+R2rQOws0N0BV
         2jB36bJNP6uzkjTTO1dO72BtW5P+2HqOpZPygGtjiZhHmDZPWiybjrsLnoVfZgFR1qos
         QN21Yq/P6nIsN9TGhFDNYw+bxHd3cDxBFtO20F+NjQxd1RJBaXZD7l24Tha94xfokc1z
         ZQ/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dwfOaeQbEriUr7n1LwUP935/2zWyl9SRrKy8JH5RF/A=;
        fh=tDT8RWEh4shuW8UKb8DGlVl8weW80/Vw8uAvhxsEKT0=;
        b=mgiWYpm26HeUN//RMQrUcUve1EV/+wG1cGp4GtbEYxeKfeRQnY1hyjVdBpzCd7OT5l
         bxBsTAfg7O74AB7AczIFhC5nVJwEdufrb6JAeioSpAiRFyZuiUAsmK8PijwkrsvQ52B3
         Mb/uZ3QFkPUNp+K8oEVvuT44s4Oil9QWd/i7HHx9qeCkEH+POfXMZDW9jSN7n2cqUt60
         eSCDYsaGMZAuRSVq71LNRkLJiiH6rlt133Rj62ntSX7MNCeNU/DFH3tMuB2j1jKvcflM
         bN9anvg6JpvMTJqfkoOwd6pqZs0Js1lMK7pmQ6D91qvHUx5FiRRNpc+EYhE/3WE8iPim
         DOhg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793897641; x=1794502441; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dwfOaeQbEriUr7n1LwUP935/2zWyl9SRrKy8JH5RF/A=;
        b=LcnwD/qSXYpn0hbSwzccdGoMYJIUTbNISXXCIDuTcvY8C294XfJsEQqmr4JoxRK/hB
         lVAV5w0wVtAG62tTNNnDIjP2hrh6hntPgl8iwlWBhMLFLyJcYjG0IETs8LRymy5gB8dR
         6U54dP9i1LlZipIawWbJhDM1CxH/HPF9fzLeULt3DyfLwYNj/1wZ2OdXIiqusGYbWz3y
         TutQ83u4N/FmnQqRpSeqc4Wcd32X9jY5r8eLekfeSF6VcGricDOq3EbIU4H4pdpWTL9Z
         gJlPJQpUq8SdS1xbA7YOQVrB0Wj7MeCAWb/MOAig+mXrKNyyj79EVsMh5BxnIyoo4PdF
         B4sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793897641; x=1794502441;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dwfOaeQbEriUr7n1LwUP935/2zWyl9SRrKy8JH5RF/A=;
        b=I/O+d2jzmaFa8PY4BhYUYH7JI7pR74HykQIYT8MyXSEsfjds3hmzE+b4GcyatMGtIk
         RIoJlE2jtni5ck45xv2CW414TmQtk/mNUXsKPqPEESWZJ1uR37FY+1CvgTe7E5IeXCIJ
         tfZueDB+j7zocWgU1fGvgtCdCXAjxFXlbRV7fG/Hz/7hJKgXG1X1PAz10x9B32p4L7DW
         SnTCPX8yvv4ooyiX/066rJYj/Kl1vYHcZW7Qu0c21ZcyJTOY7LtDC+dRnKmjM4S3a5Xq
         uupYv/sUFAjAUUgh8NiOhRM7tyJoUjrwCzBs4KUjdGjLs3c4VW+63+WctSWprfWRohWh
         cOiQ==
X-Forwarded-Encrypted: i=1; AKwUvBziPs4goOsA3lr/HTb8rEUZwICEPBC38moy/vrE5xHaVBglZCLSjULV6G4p0Xn3joBNl0ZfWAUexBO9Zgg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8xyu6HLnqGs6UiWQ06XGldrjf6hhT2JN1zLuHp9j8FQ2DptOHn
	VHipOTPMiQN0x1v4rzt+dv40CG2Rgz5Ade5cU5nRExmPsR5k9kv+x6r2VXxFFIrSDHk42EGexbS
	GEAuQX+h64kNtCSgNcuxfuojkjJni3Ik=
X-Gm-Gg: AYBFou1FY0Q+pVC4QSMBQFhwzqO363lA4ZPpgANDuAamaXUphlf6XvP1NKPs3pWrv+9
	sXfauRXeoorn+w/b2jAy+ghZ9wK9gFNVCidxQQMj9w2WADdzqSRuVPFAhteBlAGipYTFh7k2pS7
	jT4EA2MUGS7Av/MWIkYS2bDAvSHx66axGiruf1vZI0xQPSKeRKlmncpTOgerhAe2ZloQVw7b7D8
	kLBEXV5FBvkcUj+BXlxcXWu6DfcJ2X7YO8RkbDzgDiQaI+uwD4+HsPCKNjMLDiRtw4yPeA8CApm
	ddTxpEOGOU1dYmMR1k5ay1xj5pvYk5HC5a6EWNCMUDAl2woCSeDOdRi91Yvp+qz5nE8nQepvCDZ
	QucnKQR1e4QfPs54G8rA46cRE8WDckWS6nEfB4CIgCpvmiyXJRjYHgz8+B5TYQ/hbGIBIkb2beG
	15rEaSNxTHkjoHMtw=
X-Received: by 2002:a17:907:97cb:b0:c46:87f9:f5f7 with SMTP id
 a640c23a62f3a-c4d35485cb6mr2630366b.17.1793897640926; Thu, 05 Nov 2026
 08:54:00 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023162906.2938-1-drifabdelmalekmohamedsaid@gmail.com> <auxn5snXPQJLR2z1@gmail.com>
In-Reply-To: <auxn5snXPQJLR2z1@gmail.com>
From: DRIF ABDELMALEK MOHAMED SAID <drifabdelmalekmohamedsaid@gmail.com>
Date: Thu, 5 Nov 2026 17:53:50 +0100
X-Gm-Features: AclHuK-GQn91OSLi4xUUXopS5ifvpI7dp4tGIfCpqEWHuzoNZVyw3qBo47g0l0Y
Message-ID: <CA+xk8n9D==iy6pPVr+t=uCYfYzGv=cEfvsiLMvmErbQ3gjST-w@mail.gmail.com>
Subject: Re: [PATCH v2] configfs: fix slab-UAF Write in config_item_put
To: Breno Leitao <leitao@debian.org>
Cc: Andreas Hindborg <a.hindborg@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com, 
	syzbot+63336d70e1af377d7388@syzkaller.appspotmail.com, 
	Ran Hongyun <ranhongyun1@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Breno,
Thank you for your feedback, i sent v3 for the patch,
> +     config_item_put(parent_item);
> +     parent_item =3D NULL;

>Why do you need to set it to NULL here?
Your were right here, configfs_get_config_item returns null upon
failure so that was redundant.

Here is link for the patch:
https://lore.kernel.org/all/20261105165055.362-1-drifabdelmalekmohamedsaid@=
gmail.com/

Cordially,

On Thu, Nov 5, 2026 at 12:29=E2=80=AFPM Breno Leitao <leitao@debian.org> wr=
ote:
>
> On Fri, Oct 23, 2026 at 05:29:06PM +0100, Drif Abdelmalek Mohamed Said wr=
ote:
> > syzbot reported:
>
> Please drop this full log, given we have a link to the syzbot report.
>
> > This is a race between a thread creating a symlink and another one
> > doing rmdir on a parent (or ancestor) directory of symlink creation dir=
.
> >
> > configfs_symlink() takes a reference on parent_item, the directory the
> > link is created in, and then drops the directory inode lock around
> > get_target(). While the lock is dropped, a concurrent rmdir can remove
> > the group that parent_item belongs to.
> >
> > If parent_item is a default group embedded in a larger object, such as
> > nvmet_port.subsys_group, the reference on the embedded item does not
> > keep the containing object alive. rmdir frees the object, and the final
> > config_item_put(parent_item) in configfs_symlink() then decrements a
> > kref inside freed memory.
> >
> > Fix this by not holding parent_item across the unlocked window. Drop
> > the reference before inode_unlock() and look it up again from
> > dentry->d_parent after inode_lock(). configfs_get_config_item() returns
> > NULL if the parent dentry was unhashed in the meantime, in which case
> > release the target references and return -ENOENT.
> >
> > Re-looking up parent_item is not sufficient on its own.
> > configfs_get_config_item() only fails if the parent dentry has been
> > unhashed, and the rmdir path in another thread may skip that: if
> > simple_rmdir() failed, the earlier d_drop() was skipped, so the dentry
> > can stay hashed even though the directory has already been detached.
> >
> > Such a directory was created as a default group (CONFIGFS_USET_DIR), so
> > configfs_rmdir() takes the CONFIGFS_USET_DIR branch and calls
> > configfs_detach_group(). detach_groups() then marks each child inode
> > S_DEAD (d_inode(child)->i_flags |=3D S_DEAD). Check IS_DEADDIR(dir)
> > after retaking the inode lock and before taking a reference on the
> > parent, and return -ENOENT. This also rejects a detached directory
> > whose dentry is still hashed.
>
> This is LLM-heavy and hard to follow, would you be able to make it a bit
> more human?
>
> > ---
> > v2: Added check for dead dir, this would be helpful when configfs_remov=
e_dir skips
> > unhashing the dentry.
> > v1: https://lore.kernel.org/all/20261017123748.4430-1-drifabdelmalekmoh=
amedsaid@gmail.com/T/
> >  fs/configfs/symlink.c | 18 +++++++++++++++++-
> >  1 file changed, 17 insertions(+), 1 deletion(-)
> >
> > diff --git a/fs/configfs/symlink.c b/fs/configfs/symlink.c
> > index 89178f5d371a..7d746a10c369 100644
> > --- a/fs/configfs/symlink.c
> > +++ b/fs/configfs/symlink.c
> > @@ -196,11 +196,26 @@ int configfs_symlink(const struct mnt_idmap *idma=
p, struct inode *dir,
> >        *
> >        *  AV, a thoroughly annoyed bastard.
> >        */
> > +
> > +     /* Put the reference back, retake and check after relocking*/
>
> Nit space before */
>
> > +     config_item_put(parent_item);
> > +     parent_item =3D NULL;
>
> Why do you need to set it to NULL here?
>
> >       inode_unlock(dir);
> >       ret =3D get_target(symname, &target_item, &target_sd, dentry->d_s=
b);
> >       inode_lock(dir);
> >       if (ret)
> > -             goto out_put;
> > +             goto out_put; /* config_item_put on NULL, no problem */
>
> This comment is not necessary.
>
> Thanks for the patch,
> --breno
