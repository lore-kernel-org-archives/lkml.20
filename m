Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C95390CB7
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 19:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788377698; cv=none; b=hItn3dfHTBb3L+quKtWD0zW/E/o0x1iRTHfHLirTFU4ESW/Lpmc5JzVtK49vpVCXsY9Yh7KsvRUV/nCuLqnKEdv/RzI9bsm+q97/RDQjjf7fL6C4Ba3XDdqUgrLLP1q43Mge2JeKKK67Wbz7vVi5nYauGaxrgdLP9fWTCrjGqwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788377698; c=relaxed/simple;
	bh=eh+it0zb54ufEP/JnblEMEpySL7Prj/F5s/H28111ro=;
	h=Date:Message-ID:MIME-Version:Content-Type:From:To:Cc:Subject:
	 References:In-Reply-To; b=d+wqk5S4blhkUbswGgWmylfBsEZeHbWQcG6b8L5UyMWtNzuD9xr31BxAMgAf2gxMOypqJuphhtzkNENFJNrIhL7P5r/YWI48iblZ3r/8Gb1HMCxkQOZ4OscPEMyNlfwU4JRiizuxQzaYK6RcBdAUzbjjbx9FRePJ14GQvMKQBVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=BApmi94N; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="BApmi94N"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-90ccb6102a1so12547066d6.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 12:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1788377687; x=1788982487; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :content-type:mime-version:message-id:date:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GJ6syoQl7zUGKH+u6+bqTcHjjLcFH2wSt0NVpBp7lDc=;
        b=BApmi94N0haia63+fWtF0lO8gtf7CPbnhyiBUjO2IH+nYwAJb4uJXYRK7Cr6JJKpFk
         YxGptCgPyiA1YZmnPhS3FOGlqVAlbkwTb/eVF5NtLCuLuSICFUx37nq/Nns4yNA2zgH0
         CFYc13B4d2J1cC4nKVeZUp+yNmFJrn0DoYd6ScYOlVDpCIQWM8wV9IJ51HJQi6KW+GVF
         nI2FzCFnKFMfXHpWkki8P6hmZ4q8a2BhC/Xez0+PIPWLa+R4Uc0B91tXHiwfcP+6AsP1
         FRMH/M4HjtVOxsSROaRN5mJYZjmLY8FnTjlOzEo1VRpzChFgoAHEReRUhVrJL43U/Yma
         Kkhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788377687; x=1788982487;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :content-type:mime-version:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GJ6syoQl7zUGKH+u6+bqTcHjjLcFH2wSt0NVpBp7lDc=;
        b=q/FJC/TO2u2c/mtfLP9jI8b4rPmY/Va4eSvdz4/OphZnLWv4DobQuH9S3FpduqinaB
         169ijAMv3cdJsWxmNxXVnrRHiK2hiYSbr9Oj3VXzIDi+RUD+ZRRLKU06xWa13sLJhfRb
         N9vRGKcQSebz35GW1tcpCE6Iv8/WTSbTgLIeOVqARXdM2Z3T3BfWt8V1fdL9/Ft+8FDq
         nLwDmfOk6odGmyWVRJ9v3qHGAyXpwF+JzVv205xTaeo1sNr6yjt2pVOvb7GBOch3kADd
         i7kIDD1syDHVMlvxopgiug1O0ONf0caW8Ry8UXFmMbn0igveqtRY6YH8Jn5lC/v/YPLj
         GHqQ==
X-Forwarded-Encrypted: i=1; AKwUvBzKf/DEi9CySEyOmythUgBNoWIFtZEdP+kab4530AG2QQ+Kdeb2MHfIAWzX+qbjthkF18pD/aQ1pmvQCh4=@vger.kernel.org
X-Gm-Message-State: AFuF++lm1ZSEr/hHeiQun/MmQJwct5Nb1ZuP79HgfZke8NHmsqVxEOW4
	FSMZc4yr6HazbWSBbVRNey8A9SaloYxFNymv8lnbXBMBuYvuEi+7ufvA/9c/AXkejg9FNvSdZH+
	dFRoIoQ==
X-Gm-Gg: AYBFou0+IXQiQsFuXr3fjCq4RFWKn74EHqiqAxnH2cfUG86oqyXvk0uUQTyB/uiYbLz
	eX9n2hXAhK+XW/lbufRhbUQqSnUm6w1TbRtAYRvzh5Q1GzPKo46qAynKJewguzCo7bXCLsrTtsi
	U1BDsFddQUqGcHOxlzmBAUcfiCnMZYXyXmvclVRAntjpLAdgdIv0Q+f3NNwCiBa2EUpXtAU74GD
	IgU2E74HHfEyxmk5unFYCY/wWB+n6Hc2r4joAg8CxK1fXtjvO1UACForBW6H+do6zo6vUpc7DLl
	+AkL0izbQzkn4lScz3C8aAYAtfepfh98xzOEadvLLzwuj3w434TKLC2SfYXFxT+M8FvxTVfxUxn
	QDyJd9Ew6Wj8RPwvXF0R+VHH5q5HlQCjLXCeJZnYrWU03pujvJjCjPuQju4e4B2DlFpgHhKMtyY
	7vygUZuwDM9cRmIHcaIBhpYlAGvdDaT/iRk/CE5iWnYv1TW0JPOorGMAgsoyOnnCrHcFxOcQwi/
	z2buRCFRu+bcSUbn93DNbPixJMXTh3zww==
X-Received: by 2002:a05:6214:e85:b0:90e:7de2:d81f with SMTP id 6a1803df08f44-90ebabbac8emr90744936d6.20.1788377687526;
        Wed, 02 Sep 2026 12:34:47 -0700 (PDT)
Received: from localhost (pool-71-126-255-178.bstnma.fios.verizon.net. [71.126.255.178])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90e9ee08710sm25176366d6.2.2026.09.02.12.34.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:34:46 -0700 (PDT)
Date: Wed, 02 Sep 2026 15:34:46 -0400
Message-ID: <e266759fa7a20e9620b16c1b5a717744@paul-moore.com>
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
Subject: Re: [PATCH 11/27] fs: port acl to const mnt_idmap
References: <20260901-work-idmap-const-v1-11-54ccd48e100b@kernel.org>
In-Reply-To: <20260901-work-idmap-const-v1-11-54ccd48e100b@kernel.org>

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
>  fs/ntfs/ea.c                          |  4 ++--
>  fs/ntfs/ea.h                          |  2 +-
>  fs/ntfs/namei.c                       |  2 +-
>  fs/ntfs3/inode.c                      |  2 +-
>  fs/ntfs3/ntfs_fs.h                    |  4 ++--
>  fs/ntfs3/xattr.c                      |  4 ++--
>  fs/posix_acl.c                        |  6 +++---
>  include/linux/lsm_hook_defs.h         |  8 ++++----
>  include/linux/posix_acl.h             |  4 ++--
>  include/linux/security.h              | 16 ++++++++--------
>  security/integrity/evm/evm_main.c     | 10 +++++-----
>  security/integrity/ima/ima_appraise.c |  4 ++--
>  security/security.c                   |  8 ++++----
>  security/selinux/hooks.c              |  6 +++---
>  security/smack/smack_lsm.c            |  6 +++---
>  15 files changed, 43 insertions(+), 43 deletions(-)

Acked-by: Paul Moore <paul@paul-moore.com> (LSM, SELinux)

--
paul-moore.com
