Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793899045;
	b=NRxXMXCmDSluZyWBMhbISx4BDrpF62hGHiQgUR2aY6GG8r7roCpS6aZ3plv2FTd1ew3J
	 4kZ+H271VZBnEwd94W4aO39XfF3eQzXi5L/W9A0DHtMLQLh9Jxfxu7QW9qOfNwCiI8PhB
	 JYzZcCco3x+cP9XDKMninVtCeb0zRe1FhxfssqrtAxIMfVKc94FQg3pfJ+LDxdBgU/cjp
	 2QoiAC6CIePM6Hqb+JiYeN8dMxzxYHymYaiPh+WUeO8K9pV8ao/RVqDMRtIP0NM5kTcvA
	 ItN33yVGCyHFn/dbKPBdx2omu288dg+dhl47KzjNX0ItskhgEiT8et0edJxOuCQsplQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793899045;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:From:To:Cc:Subject:References:In-Reply-To;
	bh=79WDsZ8DQ80lT6IYR2/z2VckZPQOpk+kKeChRc/2aFw=;
	b=tKMYrboB239tCr1yyVtBFBQ4nFAGfth5B6ZFhPQoFSaZpt/PdvJwS1N7g3s0x02IoOSA
	 GevIvdjNY7ktVZ2DTpd+zH8DfubNi68+HMYNq10AMqORXd8wh0/IK4PraLQ8HkhIrUWtg
	 f8fO18EMMwO7Zgx2NTHV/gGQ4/3xCZ3TF0oW3JQMeAWeKswU1vCnqfd87WBxOPyo65+7B
	 yNGdZsViElid3UPJ2LKpelit3bpNRMG5QyX4oCTnPDJCSCgWHXofB018Gu2vgLa+HOI/s
	 5//5sS5nlTv9NyV73wyu1nuvqPpPj8lx4Ye5u6qOjnw22DJE1bpix7xYXBdHTf7jD0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=paul-moore.com;
	spf=pass smtp.mailfrom=paul-moore.com;
	dkim=pass header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=cLPc9x7j;
	arc=none smtp.remote-ip=209.85.160.179
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAEB0606D81B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 17:17:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EAEB0606D81B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=cLPc9x7j
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-5364648ae07so19497181cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 09:17:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1793899044; x=1794503844; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :content-type:mime-version:message-id:date:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=79WDsZ8DQ80lT6IYR2/z2VckZPQOpk+kKeChRc/2aFw=;
        b=cLPc9x7jvBRPKGLaUOu54UMqiR1ObkA6UL9OCrhbqPX9g4NmKg/zblt9Wsv9fEA/8N
         bfhofYJpryCIY8PCsp0m9JmH3QBk2vVN3cuBJfzM1rw7DTTyuprQNKtdypqrmOJlfUuo
         tTxnbe7q4HfGNoaaJUKE2t0TJyS3vm2B+JEug42oBGHAwke7ltFDtwph2YYA+wqYqTLv
         RyZNPa/8f3D8FxHj4aqtvHjuSTK77Tf238oy2OeHYo1K9lOLPPri7exnGLz2MjMz4sXQ
         MU/q0kvcG8RzRq2nscsORKyWp8arN8J+MGu74tarc0lrpMVh8MCdGor29qt5yiNqzQba
         dnBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793899044; x=1794503844;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :content-type:mime-version:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=79WDsZ8DQ80lT6IYR2/z2VckZPQOpk+kKeChRc/2aFw=;
        b=00wvajPFuPMGHVNwZ6Cb7MtOjDHJ7DnwGIJFIRVOr2GWTZbHWPfsDJQBrQitNPZGs3
         VlFgGK2+HSeoZ0CtRhxcz9ZNaWMe8CbMz/oX05JO2cIXRnUvP6EcPmSLRCftiuTrcnw1
         CzCqU4K+4f8SvucXnKFcCFGRwBTLnHAcMWtUBwosCev/y5H7owHF2I1im6MR6dQt/6rP
         4XY96lwR4bhpRNe7m+mnbRYnFuid81GAZ3iN+nmLLpUFRyKWlqbfmPt6Z7zk2p+to+Q9
         gPNfK0GnYoI4uH42UuCm3faek+DVJrnm7Yl6flb3kvhOmZLLhvuYJzoVZfke7iv9LlNw
         IVBA==
X-Forwarded-Encrypted: i=1; AKwUvBxJlnWzP35teef6wBKc4gfIcuVuvg4GQqJApkwz254XkafOomljaed8gT/QXuz8LRCyJBtkhalgnKxYi0g=@vger.kernel.org
X-Gm-Message-State: APuU4Z9F6TLZeAIlmw8NZpEJ+iIRzPPGl2R5FEEZdz1q9NfuVAU5Jh8g
	R+9KvW3dc/c6vKgF98JENVM16qw3oNnhpXn+MlVVQ4CYfblvUZE6GY2QlSITEEjcTQ==
X-Gm-Gg: AYBFou0/3b8gUqqWluLdet4XL1vYUBxsgaJlDEzdR5XunQOFFdfW1VdRuCmi7p33wVx
	YfeMulwFSJkGlt+v5hXHnOfUL8K+1K/acmg3ArUu+5VgwWRjIRqldzZTNcU32MzmkOwVWEBAetF
	7eMzrfAIT/mZB5QpB9ej+HIP+2A59GEGL89A204wqea8PQ1gB9dhTk/AoqbLbR8dOB9ocEYf+w0
	C+IdNtBtlml5ORM1Ad/LCBs8IG4WnsA+i/nHzj88pIm/o7QZeeeEGsiV0y09KuM1QsteOVVs5dl
	IecTPWVQBpUkgYGYPrJ4+uGEMARzvFIq4aeC1qwu1Ejvj0blA7hwcHrbb8iO631pA/y3t/86u8d
	RRPRXI5k9tYb8nvcDB8JHXws6fNHnTjua2lIK0KVQbiF647y13kHkJPRmvA1GtPzWWh/sp+YVM0
	5A0123LzHPJQ9JmbHAzmqwa9C18SHNh6zTX2iFHEJnaB21CuH5RCsAqRBTKB6vWTcjcKeUVgpZg
	tkmV/bhA3lq1mULvayro6HuUH4c18S7mi8xUCphkk/FuMyEtr9Ah6JnX6OKHIF12VeguWECZGOg
	05NG0AiNDRTlYdL7k8cepIcPJoLKM1vjUeTPhTbzh3HhuZnzwMRKuV69C/DmFvEFdRoQ1sXV9CI
	3ZFPVpBh/KJYfZyQgej9Osu4QeHEI1A==
X-Received: by 2002:a05:622a:4896:b0:536:70cf:a87 with SMTP id d75a77b69052e-54e0feec2f3mr3881cf.2.1793899043450;
        Thu, 05 Nov 2026 09:17:23 -0800 (PST)
Received: from localhost (pool-71-126-255-178.bstnma.fios.verizon.net. [71.126.255.178])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-54b0d171102sm56001281cf.1.2026.11.05.09.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 09:17:22 -0800 (PST)
Date: Thu, 05 Nov 2026 12:17:21 -0500
Message-ID: <22ec774debd36b4f8edd85395349602d@paul-moore.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0 
Content-Type: text/plain; charset=UTF-8 
Content-Transfer-Encoding: 8bit 
X-Mailer: pstg-pwork:20261105_1157/pstg-lib:20261104_2058/pstg-pwork:20261105_1157
From: Paul Moore <paul@paul-moore.com>
To: DRIF ABDELMALEK MOHAMED SAID <drifabdelmalekmohamedsaid@gmail.com>, jmorris@namei.org, serge@hallyn.com, viro@zeniv.linux.org.uk, brauner@kernel.org
Cc: jack@suse.cz, linux-security-module@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, syzbot+975ace299d6ba2eb1cea@syzkaller.appspotmail.com, neganhat@gmail.com
Subject: Re: [PATCH] lsm: don't call d_path() when current->fs is NULL
References: <20261019222858.1766-1-drifabdelmalekmohamedsaid@gmail.com>
In-Reply-To: <20261019222858.1766-1-drifabdelmalekmohamedsaid@gmail.com>

On Oct 19, 2026 DRIF ABDELMALEK MOHAMED SAID <drifabdelmalekmohamedsaid@gmail.com> wrote:
> 
> When the last reference to a file is put from exit_task_work(), the task
> has already run exit_fs(), so current->fs is NULL.
> 
> syzbot reported:
> 
> Unable to handle kernel paging request at virtual address dfff800000000002
> KASAN: null-ptr-deref in range [0x0000000000000010-0x0000000000000017]
> 
> Call trace:
>  kasan_mem_to_shadow include/linux/kasan.h:65 [inline] (P)
>  kasan_byte_accessible+0xc/0x1c mm/kasan/generic.c:210 (P)
>  kasan_check_byte include/linux/kasan.h:402 [inline]
>  lock_acquire+0xa4/0x320 kernel/locking/lockdep.c:5916
>  seqcount_lockdep_reader_access include/linux/seqlock.h:73 [inline]
>  read_seqbegin+0x6c/0x144 include/linux/seqlock.h:838
>  get_fs_root_rcu fs/d_path.c:244 [inline]
>  d_path+0x224/0x4dc fs/d_path.c:287
>  audit_log_d_path+0xdc/0x19c kernel/audit.c:2221
>  audit_log_lsm_data+0xe0/0x12d0 security/lsm_audit.c:199

...

> d_path() renders a path relative to current->fs->root.  After exit_fs()
> there is no such root, and no substitute root is meaningful: the
> record's pid/comm describe a task that can no longer name the file, and
> the file may have been opened by a different task entirely.  Falling
> back to another root would produce a well-formed but misleading path,
> so report the field as unknown instead, as exe=(null) and name=(null)
> already do.
> 
> Handle this in audit_log_lsm_data(), where the meaning of the field is
> known, for LSM_AUDIT_DATA_PATH (Smack file_open), LSM_AUDIT_DATA_FILE
> (SELinux file_open), LSM_AUDIT_DATA_IOCTL_OP and the AF_UNIX path in
> LSM_AUDIT_DATA_NET.
> 
> Alternative: omit " path=" as it is done for inode in audit_log_lsm_data.

Once again, thanks for reporting this and providing a fix!

More on this below, but I think the idea that in the !current->fs case we
can follow the LSM_AUDIT_DATA_INODE example and log something useful, at
least more useful than "path=(null)" is a good one.

> Fixes: 4a9d4b024a31 ("switch fput to task_work_add")
> Reported-by: syzbot+975ace299d6ba2eb1cea@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=975ace299d6ba2eb1cea
> Signed-off-by: Drif Abdelmalek Mohamed Said <drifabdelmalekmohamedsaid@gmail.com>
> ---
>  security/lsm_audit.c | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/security/lsm_audit.c b/security/lsm_audit.c
> index 955b2e7b2c8e..5ed505d781bb 100644
> --- a/security/lsm_audit.c
> +++ b/security/lsm_audit.c
> @@ -169,6 +169,15 @@ static inline void print_ipv4_addr(struct audit_buffer *ab, __be32 addr,
>  		audit_log_format(ab, " %s=%d", name2, ntohs(port));
>  }
>  
> +static inline void audit_log_lsm_path(struct audit_buffer *ab,
> +									const struct path *path)

The horizontal spacing above looks ... odd.  Can you please fix this so
follows the established kernel style by aligning it with the parameter
list in the line above?

> +{
> +	if (current->fs)
> +		audit_log_d_path(ab, " path=", path);
> +	else
> +		audit_log_format(ab, " path=(null)");

What if we were to extract the LSM_AUDIT_DATA_INODE logging into a
helper function, similar to what you've done here, and call it when
current->fs is NULL?  What do you think?

I would also suggest we use "path=?" in the case when we can't resolve
the path or do any other meaningful logging; this is more consistent
with existing audit approaches than "path=(null)".

  static void audit_log_lsm_inode(ab, inode)
  {
    ...
  }

  static void audit_log_lsm_path(ab, inode, path)
  {
    if (current->fs)
      audit_log_d_path(...);
    else if (inode)
      audit_log_lsm_inode(ab, inode)
    else
      audit_log_format(ab, " path=?");
  }

> +}
> +
>  /**
>   * audit_log_lsm_data - helper to log common LSM audit data
>   * @ab : the audit buffer
> @@ -196,7 +205,7 @@ void audit_log_lsm_data(struct audit_buffer *ab,
>  	case LSM_AUDIT_DATA_PATH: {
>  		struct inode *inode;
>  
> -		audit_log_d_path(ab, " path=", &a->u.path);
> +		audit_log_lsm_path(ab, &a->u.path);
>  
>  		inode = d_backing_inode(a->u.path.dentry);

We would need to move the call down to here, but that should be okay:

  audit_log_lsm_path(ab, inode, &a->u.path);

>  		if (inode) {
> @@ -209,7 +218,7 @@ void audit_log_lsm_data(struct audit_buffer *ab,
>  	case LSM_AUDIT_DATA_FILE: {
>  		struct inode *inode;
>  
> -		audit_log_d_path(ab, " path=", &a->u.file->f_path);
> +		audit_log_lsm_path(ab, &a->u.file->f_path);
>  
>  		inode = file_inode(a->u.file);

Similar to the above:

  audit_log_lsm_path(ab, inode, &a->u.file->f_path);

>  		if (inode) {
> @@ -222,7 +231,7 @@ void audit_log_lsm_data(struct audit_buffer *ab,
>  	case LSM_AUDIT_DATA_IOCTL_OP: {
>  		struct inode *inode;
>  
> -		audit_log_d_path(ab, " path=", &a->u.op->path);
> +		audit_log_lsm_path(ab, &a->u.op->path);
>  
>  		inode = a->u.op->path.dentry->d_inode;

... and here:

  audit_log_lsm_path(ab, inode, &a->u.op->path);

>  		if (inode) {
> @@ -321,7 +330,7 @@ void audit_log_lsm_data(struct audit_buffer *ab,
>  				if (!addr)
>  					break;
>  				if (u->path.dentry) {
> -					audit_log_d_path(ab, " path=", &u->path);
> +					audit_log_lsm_path(ab, &u->path);

It's probably not very useful to have the inode info for a AF_UNIX
socket, so we can probably just do this:

  audit_log_lsm_path(ab, NULL, &u->path);

>  					break;
>  				}
>  				len = addr->len-sizeof(short);
> -- 
> 2.43.0

--
paul-moore.com
