Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5DEE39FCC8
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 19:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788377710; cv=none; b=sHrvrPTFtRfaNiQ5Iw57dxzWBAauVKX/lNw2TH7X5fEfaqhUP1liS1ueZ1rjHio/76VSDHduF2/pZx6tVZzhTAJASYxZNA6SS4GM7TTiKgctmixMF5+NFL0DY/uhjF1fPgH6CBA4mwXoIEbDxOGivQaji+oPdG8QoLnyWUXN3E0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788377710; c=relaxed/simple;
	bh=hV2MW1omBZf24pDu1TyLQ7VokUTMjJdalm/WKcqe5oQ=;
	h=Date:Message-ID:MIME-Version:Content-Type:From:To:Cc:Subject:
	 References:In-Reply-To; b=qQKGJy8Im57Y1Gx8pKF+icyBzFLfq9Wv+hcdD9I7ltrdljBzUmAc1GPvMNUNkJ3VsYtFOhHVUlx/dPjnC5LmlhENoMRWbJaY3PG36etEn05lhTuzYVoqVi2zCoAuNvKgmTZyuCC/MK52b0fRGDQdT1RsEB9NOAcFzg2zbJsM8jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=GOKkdTYL; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="GOKkdTYL"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-92ea24a2dbfso189681385a.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 12:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1788377695; x=1788982495; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :content-type:mime-version:message-id:date:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GC4FIfkk2kp9PFt1uwqlIhd5i3bfmRn6wjlpVpmfWwA=;
        b=GOKkdTYLHtwfO3ngYpVGTvFI8bS9jy2AxeRMxBguqtyz+mrrUORq9lf9kDCSAKxOoR
         I2u1MFMWwWZGUNwTNq/9I+IlnwmgCDArVPN+m+Iu/wTXYKIlMgFa93lR+Jynm0Mu4qEf
         5PxuBOn4U3HwoWjMrUL94iXOSPSBHNeM4yrBPcctQBFB5MDB+AQSFM9k5owfyUGQEbiN
         HUGDO1RvIz7iOVnLN1KfotthYbhUcF+ZHQXILDGx1Sj+n9/Ike59tT+7EsIK6KEFRo2/
         Badzc6YVVwyjOiepd7sGNucttV9+0d0PqG4UHoWs9HhvSznmEOYBaD96nPZTIopNTfjc
         ituw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788377695; x=1788982495;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :content-type:mime-version:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GC4FIfkk2kp9PFt1uwqlIhd5i3bfmRn6wjlpVpmfWwA=;
        b=qiEqNSjYwo+E3gKc37HiNlxOkcW9Spno9oM/qKcCplDsDauRvf9CodxRCs7R0u0BWG
         MCBfFvdZDL17xUabmmRdsdfk5cBeo99XwL5C+Cavpz3RtZz1ZIRWSI793VMmZrXj3SHr
         +euHQOQETitrHafuA/A3p4mitXPpkx8gdD5rweB3RDDEv05phJ+R7wuz7UPpzoz3KcFV
         Kjw1pyhBVWeKMOTH5fvhMJBS7V5I2X2HwkXR8CxhpHn3Bz2lLRs1KZEOFRjFq8wdkuTU
         DuZDHBS2ejQtxe42PBii10HKAoDkidFpmHrfvgjJgn1nmvWMkkqhkR7lF0Ay5d6j69eB
         OJrg==
X-Forwarded-Encrypted: i=1; AKwUvBw0u+taz8NYMgMOs5yItxws0nidc6PxOjHrb34Z+JBu18JxEp61MqJwsKx6UNm/WwlVlHjWgqYW5/25SsY=@vger.kernel.org
X-Gm-Message-State: AFuF++nhxrhhWklJoD08K9IG6YGaLkjrj1CYH7hdgdR9ovZylL1qcnbM
	DiManTSjuSBP1Hz3bUz1yM8ru+EZPNUEzKCIslOKLd2OlKzg2XMkWxR6Axgc688v3g==
X-Gm-Gg: AYBFou1OFF1vuKyL1GubytA8Zz57QUcbDSkI+1ckOf7xhtTZspo6oINm0nhFzd7DfDO
	r70ZhMgzLT9LsJME7pzm2eyls+d292DU2umJ+RV88jVJdWRpEHQouCVA9GFQ8A+pnaweA/k5Xez
	YM2Do9AkW5eA9AOBgpZSccZ2+ITaKwxnooE1aAdVc9Kmri5WbSIzpHdzmq6C9d48+nwZSaihSsx
	lwWsSo3/VsIsWQwvvurPtnzlgdI0PRPhXd23gPQBsusgUf0D1lugAzWeiceXym9CbftyxlxCzxx
	Hg6LtVkfYyc1Vf0haMTlPnXGc+8CYQEp5lZO+Qt8lLtrx/OmVNC9mZddWpnDkr9wC2ipI1cPx8V
	HElStDZ4FIOoFa5v2MP9oe55YnL0C1J3RgHSWG17ka4nIMTdsZOL1zZivbxBD0k3OQziMgk6mtO
	Hqg3HT1lJWxnjpIrdo5xQGEzm5P3Njq/xMceSMojlMfKdlaHUMI6io2Ej7YdGv24HSA7SV6Efuh
	kGDM/ZV11lcVJZ+bSJm1xPamZ+9xhCpN/4=
X-Received: by 2002:a05:620a:d94:b0:939:6de9:4cfb with SMTP id af79cd13be357-9396de968a9mr206623085a.46.1788377695492;
        Wed, 02 Sep 2026 12:34:55 -0700 (PDT)
Received: from localhost (pool-71-126-255-178.bstnma.fios.verizon.net. [71.126.255.178])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90e9ef0e9b1sm25737496d6.43.2026.09.02.12.34.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:34:54 -0700 (PDT)
Date: Wed, 02 Sep 2026 15:34:53 -0400
Message-ID: <0a5d61e6a17442e42646e98ac73dd7df@paul-moore.com>
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
Subject: Re: [PATCH 24/27] fs: port ->setattr() to pass const mnt_idmap
References: <20260901-work-idmap-const-v1-24-54ccd48e100b@kernel.org>
In-Reply-To: <20260901-work-idmap-const-v1-24-54ccd48e100b@kernel.org>

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
>  Documentation/filesystems/locking.rst     | 2 +-
>  Documentation/filesystems/vfs.rst         | 2 +-
>  arch/powerpc/platforms/cell/spufs/inode.c | 2 +-
>  fs/9p/v9fs_vfs.h                          | 2 +-
>  fs/9p/vfs_inode.c                         | 2 +-
>  fs/9p/vfs_inode_dotl.c                    | 2 +-
>  fs/adfs/adfs.h                            | 2 +-
>  fs/adfs/inode.c                           | 2 +-
>  fs/affs/affs.h                            | 2 +-
>  fs/affs/inode.c                           | 2 +-
>  fs/afs/inode.c                            | 2 +-
>  fs/afs/internal.h                         | 2 +-
>  fs/anon_inodes.c                          | 2 +-
>  fs/attr.c                                 | 2 +-
>  fs/bad_inode.c                            | 2 +-
>  fs/btrfs/inode.c                          | 2 +-
>  fs/ceph/inode.c                           | 2 +-
>  fs/ceph/super.h                           | 2 +-
>  fs/coda/coda_linux.h                      | 2 +-
>  fs/coda/inode.c                           | 2 +-
>  fs/configfs/configfs_internal.h           | 2 +-
>  fs/configfs/inode.c                       | 2 +-
>  fs/debugfs/inode.c                        | 2 +-
>  fs/ecryptfs/inode.c                       | 2 +-
>  fs/efivarfs/inode.c                       | 2 +-
>  fs/exfat/exfat_fs.h                       | 2 +-
>  fs/exfat/file.c                           | 2 +-
>  fs/ext2/ext2.h                            | 2 +-
>  fs/ext2/inode.c                           | 2 +-
>  fs/ext4/ext4.h                            | 2 +-
>  fs/ext4/inode.c                           | 2 +-
>  fs/f2fs/f2fs.h                            | 2 +-
>  fs/f2fs/file.c                            | 2 +-
>  fs/fat/fat.h                              | 2 +-
>  fs/fat/file.c                             | 2 +-
>  fs/fuse/dir.c                             | 2 +-
>  fs/gfs2/inode.c                           | 2 +-
>  fs/hfs/hfs_fs.h                           | 2 +-
>  fs/hfs/inode.c                            | 2 +-
>  fs/hfsplus/inode.c                        | 2 +-
>  fs/hostfs/hostfs_kern.c                   | 2 +-
>  fs/hpfs/hpfs_fn.h                         | 2 +-
>  fs/hpfs/inode.c                           | 2 +-
>  fs/hugetlbfs/inode.c                      | 2 +-
>  fs/inode.c                                | 2 +-
>  fs/internal.h                             | 2 +-
>  fs/jffs2/fs.c                             | 2 +-
>  fs/jffs2/os-linux.h                       | 2 +-
>  fs/jfs/file.c                             | 2 +-
>  fs/jfs/jfs_inode.h                        | 2 +-
>  fs/kernfs/inode.c                         | 2 +-
>  fs/kernfs/kernfs-internal.h               | 2 +-
>  fs/libfs.c                                | 4 ++--
>  fs/minix/file.c                           | 2 +-
>  fs/nfs/inode.c                            | 2 +-
>  fs/nfs/namespace.c                        | 2 +-
>  fs/nilfs2/inode.c                         | 2 +-
>  fs/nilfs2/nilfs.h                         | 2 +-
>  fs/ntfs/file.c                            | 2 +-
>  fs/ntfs/inode.h                           | 2 +-
>  fs/ntfs3/file.c                           | 2 +-
>  fs/ntfs3/ntfs_fs.h                        | 2 +-
>  fs/ocfs2/dlmfs/dlmfs.c                    | 2 +-
>  fs/ocfs2/file.c                           | 2 +-
>  fs/ocfs2/file.h                           | 2 +-
>  fs/omfs/file.c                            | 2 +-
>  fs/orangefs/inode.c                       | 2 +-
>  fs/orangefs/orangefs-kernel.h             | 2 +-
>  fs/overlayfs/inode.c                      | 2 +-
>  fs/overlayfs/overlayfs.h                  | 2 +-
>  fs/pidfs.c                                | 2 +-
>  fs/proc/base.c                            | 2 +-
>  fs/proc/generic.c                         | 2 +-
>  fs/proc/internal.h                        | 2 +-
>  fs/proc/proc_sysctl.c                     | 2 +-
>  fs/ramfs/file-nommu.c                     | 4 ++--
>  fs/smb/client/cifsfs.h                    | 2 +-
>  fs/smb/client/inode.c                     | 2 +-
>  fs/tracefs/event_inode.c                  | 2 +-
>  fs/tracefs/inode.c                        | 2 +-
>  fs/ubifs/file.c                           | 2 +-
>  fs/ubifs/ubifs.h                          | 2 +-
>  fs/udf/file.c                             | 2 +-
>  fs/ufs/inode.c                            | 2 +-
>  fs/ufs/ufs.h                              | 2 +-
>  fs/vboxsf/utils.c                         | 2 +-
>  fs/vboxsf/vfsmod.h                        | 2 +-
>  fs/xfs/xfs_iops.c                         | 2 +-
>  fs/zonefs/super.c                         | 2 +-
>  include/linux/fs.h                        | 6 +++---
>  include/linux/lsm_hook_defs.h             | 4 ++--
>  include/linux/nfs_fs.h                    | 2 +-
>  include/linux/security.h                  | 8 ++++----
>  mm/secretmem.c                            | 2 +-
>  mm/shmem.c                                | 2 +-
>  net/socket.c                              | 2 +-
>  security/integrity/evm/evm_main.c         | 4 ++--
>  security/integrity/ima/ima_appraise.c     | 2 +-
>  security/security.c                       | 4 ++--
>  security/selinux/hooks.c                  | 2 +-
>  security/smack/smack_lsm.c                | 2 +-
>  virt/kvm/guest_memfd.c                    | 2 +-
>  102 files changed, 112 insertions(+), 112 deletions(-)

Acked-by: Paul Moore <paul@paul-moore.com> (LSM, SELinux)

--
paul-moore.com
