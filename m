Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D1C939AD5E
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 19:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788377708; cv=none; b=La3uZ5b/6NpJATQF0ptaZRxXtCHjeEPv2x7KLe+h0rd1ELk4adryOxGHyzG8m6UG0wBi7pZc98HT8mFopE+mB1yCco+JGcbI4eyjBYY2bvosDlOpOpb3DaswLfuXa6R1Bv+LvQdeYjqEI7k/26u8voMGxDTVv3cBzvf36mjAscE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788377708; c=relaxed/simple;
	bh=dINnaKckdfOT2F94x9t7jziPlS9yc2iyV99WUJZti5k=;
	h=Date:Message-ID:MIME-Version:Content-Type:From:To:Cc:Subject:
	 References:In-Reply-To; b=deCrOKy7fMaeX9JjmBn4QTipplaaIgoCfJK9tA7SU0cO8axI4XoT5Mqs7X8rcsgAV42XS9370ovuhFknf95+Vl07zUdqHvpcpT+sZJl46h4eiL32zRhNbSGwPrA5gbfox1E/hRhkr3nO991tYgHSDA8ZJZjkwTixBKZTvcdT0wU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=Mp6gh/qJ; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="Mp6gh/qJ"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-90e7bde5596so15083176d6.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 12:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1788377692; x=1788982492; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :content-type:mime-version:message-id:date:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=183/fvO/by+DRdIa2ztu9BBJ4pI2bMZEyG+Jxipy0sA=;
        b=Mp6gh/qJ9PlBzkbFBngWPcHLug6aL4CVpoMoBhP+8cG8UE9y85GoduQoqIih5YgyNl
         SvWVTiaBA/qyWMiONrZyvM0SY6wAjBbacAFAI4GP+egbp+jJYuipoqAOwzb682f32Yt1
         fBk0GiCRl9Z4HsaMpBNG+78y26N5SSpIM/AOYae8IP4AZNWGUSbhW260XHN+LyULIoky
         tTLV/D4i/SUONQC9eRCfWI3RnwTzmbOnuTetb2uBIXo13sa2mXOch1rXBMVA132fBrCs
         m5HvTYka9FeVwWTn1jP+9TIgCrYp74rb/+grmmfh1kSjT9kNCRgOlwiR9+mH/Zta7Csw
         WhQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788377692; x=1788982492;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :content-type:mime-version:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=183/fvO/by+DRdIa2ztu9BBJ4pI2bMZEyG+Jxipy0sA=;
        b=jpL3rU1CcmgOflkIgYUsa75VcNpGgH42HqR8S9QWaCoKhYXcWE7Dnup1mlzHQSvvyl
         eaDFrJfNaBerFW2pC3x9ZwgQWd1vakYYucbz6aZV4yhNh01wUH5KMjRnUaBpgc+le22Y
         O2Qgurpk3qgwQ70k3lIF5AyLDpn58oaqBAEYcazZP606AjKcIn+Ljw3olCRPA1q8Y7Iw
         nVuRXy3yAVv+NAIOtduZT0hf/b0vWhNFettOsXTpwYEw3SHMTp8fR8lxw3KRAll0Idtr
         AJ4sUsN7Bt28eWkOBXUwVG2XtEXYXFhr7NiCStOOwhW9OwuGOxZGFoOnMHrA2TMihOin
         zt7g==
X-Forwarded-Encrypted: i=1; AKwUvBwX8lKSuHe+hssttfBYcv905fW4pUlWGfD/ujpGRg71StGL2/vvuCyH5zDHFuzLngtBhTXhYrV3KTJhnqk=@vger.kernel.org
X-Gm-Message-State: AFuF++mXzIpc14G5sZKyXkHRtURW6cdMwhNi+0DHl13pRIsJlLhKuZvg
	f7NfMxzfx3EiG+F0onoYFgkDnMeDRSQVLDLviM0I4dRhWdH01VCv9MPh0xZphw3U2g==
X-Gm-Gg: AYBFou2NcoOo2szmTU3uC/9xAdQ2OLXXudtzkW3UyvXrE806MnzwTzb81eck2xcQyiA
	5HkJ2lEaS1aMwHdVCGlz5ugrybRxPbOfU7Mt+vW8hmF79pGIMYLe5MH6XzmT3hVRPRTmMO8VcHb
	5i3o3Aowpmc8VXBh22gdUiqXWNwFZAGvNdACEq/8P4fD8ZkOYeCn/uQcnq69NkFoeko+ImCkGcz
	AmOAOQufvOQvQJj0j+vH9/wA0ZMsEHqiCAJFVr96LIJDoRDep9hEs/dJDDxbqSN8tY1OVIltiVq
	yntQbWr9YF4l/pD+ZD8CIGPm+y6ULy+X102Yxq1gWqoFZ2npVvpR7NKSnTAn4fLV1oBENaymAXa
	95ZtNuPBnSFomq3E2phAnuusGYWYLfuLRhTpQe9EIZHxTDfS0+hdxMICxX2LMFfJNpIt5kvF1mo
	VXIPUGbdZoHMbpOZhCQ/b0M98irEiOKAMU3LtnWJxy3gO2Vxqc0y7gA8/ohBvlC7wcN4E3xy8WH
	81kAOhVPSWIuyVz1NSXXgkB50HoOh0q0w==
X-Received: by 2002:a05:6214:2dc9:b0:90e:8022:b66a with SMTP id 6a1803df08f44-90eca50ecaamr99641606d6.22.1788377691985;
        Wed, 02 Sep 2026 12:34:51 -0700 (PDT)
Received: from localhost (pool-71-126-255-178.bstnma.fios.verizon.net. [71.126.255.178])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90e9eec8099sm25284386d6.30.2026.09.02.12.34.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:34:51 -0700 (PDT)
Date: Wed, 02 Sep 2026 15:34:50 -0400
Message-ID: <32dd145d801e472375c21d582023ed40@paul-moore.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 
Content-Type: text/plain; charset=UTF-8 
Content-Transfer-Encoding: 8bit 
X-Mailer: pstg-pwork:20260902_1319/pstg-lib:20260901_1604/pstg-pwork:20260902_1319
From: Paul Moore <paul@paul-moore.com>
To: Christian Brauner <brauner@kernel.org>, linux-fsdevel@vger.kernel.org
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, Christoph Hellwig <hch@lst.de>, Seth Forshee <sforshee@kernel.org>, linux-security-module@vger.kernel.org, Mimi Zohar <zohar@linux.ibm.com>, linux-integrity@vger.kernel.org, Ilya Dryomov <idryomov@gmail.com>, ceph-devel@vger.kernel.org, Carlos Maiolino <cem@kernel.org>, linux-xfs@vger.kernel.org, Miklos Szeredi <miklos@szeredi.hu>, Amir Goldstein <amir73il@gmail.com>, linux-unionfs@vger.kernel.org, Namjae Jeon <linkinjeon@kernel.org>, linux-cifs@vger.kernel.org, linux-kernel@vger.kernel.org, "Christian Brauner (Amutable)" <brauner@kernel.org>
Subject: Re: [PATCH 17/27] fs: port ->tmpfile() to pass const mnt_idmap
References: <20260901-work-idmap-const-v1-17-54ccd48e100b@kernel.org>
In-Reply-To: <20260901-work-idmap-const-v1-17-54ccd48e100b@kernel.org>

On Sep  1, 2026 Christian Brauner <brauner@kernel.org> wrote:
> 
> Convert to const struct mnt_idmap.
> 
> A mount's idmapping is immutable. The only thing that is allowed to be
> modified afterwards is the reference count and that is hidden behind
> mnt_idmap_get() and mnt_idmap_put(). Everything else only ever reads
> from the idmapping. This is the same model that struct cred uses and the
> idmapping is also rather sensitive.
> 
> So make the idmap argument const wherever we can. The conversion is done
> from the bottom up so callers can continue to pass a non-const pointer
> to a const parameter until the conversion is finished.
> 
> No functional changes.
> 
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
> Reviewed-by: Jan Kara <jack@suse.cz>
> ---
>  Documentation/filesystems/locking.rst | 2 +-
>  Documentation/filesystems/vfs.rst     | 2 +-
>  fs/bad_inode.c                        | 2 +-
>  fs/btrfs/inode.c                      | 2 +-
>  fs/ext2/namei.c                       | 2 +-
>  fs/ext4/namei.c                       | 2 +-
>  fs/f2fs/namei.c                       | 2 +-
>  fs/fuse/dir.c                         | 2 +-
>  fs/hugetlbfs/inode.c                  | 2 +-
>  fs/minix/namei.c                      | 2 +-
>  fs/overlayfs/dir.c                    | 2 +-
>  fs/ramfs/inode.c                      | 2 +-
>  fs/smb/client/cifsfs.h                | 2 +-
>  fs/smb/client/dir.c                   | 2 +-
>  fs/ubifs/dir.c                        | 2 +-
>  fs/udf/namei.c                        | 2 +-
>  fs/xfs/xfs_iops.c                     | 2 +-
>  include/linux/fs.h                    | 2 +-
>  include/linux/lsm_hook_defs.h         | 2 +-
>  include/linux/security.h              | 4 ++--
>  mm/shmem.c                            | 2 +-
>  security/integrity/ima/ima_main.c     | 2 +-
>  security/security.c                   | 2 +-
>  23 files changed, 24 insertions(+), 24 deletions(-)

Acked-by: Paul Moore <paul@paul-moore.com> (LSM)

--
paul-moore.com
