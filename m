Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D2E44C66A
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791960196; cv=pass; b=N/bbCzXGOWf/VbEvhCqqStLLNl281amBL+ZaJtxH6aHY8eh/YukeYtjpSxpoyAHwo62d1Brln+nmih3sMmO7OMaLtDM2o06v+LOcyWUSbUKGQ7d6MlP46i3LUD/92CNoMB1rjNHVZ+JimgePm486qSI3LMhovQhoNSnWEhYBuJs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791960196; c=relaxed/simple;
	bh=kF9c+8KKO+ipWwSE4hjYVCkfFFSKZ4K0zjQHaC5WzaA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AUVrHB79Sg5ejZkOulnZWCpgGkfrxlhMQTBvd19zvcMrpSLyka7kEGcpJf5IBSO+g5gAcqLGz816l5dyMisSJNBszFYNWnVy3GgFjbmvuZ4gcDYjwRGC1nIaXZUYbZmsg4SDLs1yhj6sjC/W2zSCY+3rhgbbB8ZPjVvYTGR7ZJ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CLoD31v+; arc=pass smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CLoD31v+"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3a808f09021so5102321fa.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 23:43:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791960192; cv=none;
        d=google.com; s=arc-20260327;
        b=f7r5UEiqIeEq+BB0Ndu5YykTlAfcgehFL8OfYC22+a+2rKXKaQQZFWTbcBCTzjV3Z8
         wIarxr6EaW9OUb8lcDcFtqsWCaD4okx7ANiFjaJeU88EEpt8s0zX6C/wpT+yKoRd8g5K
         qqKHopdFQ9Tr7ZNjKDM3KCcneKM0GJ11HMyOQmhD3LTne59xGZ95wgmgeqTpJbSrwuEv
         lcfJCLg/fttKPXHbvsERKXltXY4mj2x7XxDo9lV05NKYQNWyVnGUpqTTKL0cwio4mAkr
         Hkp06qSbe0W1cclKnDTXxp/Z6liPKkcAYBVTzneII0yuNdJxn2b4y7MXBlUP93Iw6h6x
         Bbdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ZwsjYHPheqBa+JzSbow2ZB78X+lBjsll/uWCTK8ljxY=;
        fh=eHDGF2I9M27Fzbflc5W4W3lsR9t5YPWq494HSBq025o=;
        b=ho56EMCTQLr6J9XcbOf7a4dcQKUNuvMPifrSNWc8Ir7rv2Jky6IhJQZCdnC2MqTBjn
         9hdFf17tw7IaYJRRoNzi764Mar0+8TrSKZCj9vVLmFWD+/TArDHrvpDr+E/uGAoktdxi
         NNeujSm4zpM/zLVLjnEUPYSoVVIE7G7J9Nrt6NDS8EGzS78Tmf7nNuIF7MqmdpSP8vCu
         db5Op9/AfbZGO0zBU2y5nW17EIgJDIC3GgL4ErK0xq5WMbRGPBVo87XsE8juI/gimTy1
         +irTfsHHAdnXVdiOoKvomgRLZ8draextwcZXthRkfLZykgNNAs/ww6g7cKplMfZPIPnm
         6t+A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791960192; x=1792564992; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZwsjYHPheqBa+JzSbow2ZB78X+lBjsll/uWCTK8ljxY=;
        b=CLoD31v+l1P72fEBKMMdTK/TXv9KLYzmoKJNius6R6Byr8VKxMGnOOzvfpavPXzbz9
         qiRs7/egnR+74oM8DggBI8FU859CG5PQ2cN5BOWJq0amkZ+nKidrM49O11RHAC7zQKLr
         crF/kJD1Wp/UkMsdRlCXbI1ooqI9nQLlhGf+RRPWspNKKSAB5T0d0l8XJJCUFsH/YenU
         rcPJRWd8r96/8jjRxcu1sTGCKIuD7DmSVcyt87IpbbGYgvuJZdP2sQF4thbB5jKphRgq
         3NRw80c1OQSuhCVzr1Yju7hgD6iAwwec+4RRmi+hhInmQ5E9s7vYi1FxBzksp5io1Jlp
         154g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791960192; x=1792564992;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZwsjYHPheqBa+JzSbow2ZB78X+lBjsll/uWCTK8ljxY=;
        b=VSq4C24LowTjng3BhSHz5DHB2MvrXiLLK3/qj+82ZvrbZeF4mqEVubg6k8rYY/0eng
         URYOw08+ctm6w8rnLPDdXdhFwOvcHUhl79uwE1qTQPMWqbs1G9lz90beEqj7vPmSNqC7
         5eNAR+ShoyxIW9V4gMrWiKoaB8TubIvTZlwMdJuNsgaoHGkLMOvRxhQ29m/LjI/MFV7U
         s3ymhO04yP7kOeeUQydu0eYmPMRqRJCJZmeD6/r0d7TYVlGWxNPMYe4hSoKAKxYUvFVi
         wV4N70ZlGYZqNkok3P6ji/4KcBzw90fY5ebaMg1ec4OIfqT+4Cmn/5KcQpygcWrBScTb
         1lHQ==
X-Forwarded-Encrypted: i=1; AKwUvBxaBZYPX8yIR9F96P1fjdrrNYEQ9ZHAhiz6s+pOq1ZzWdui5v+6BCNffU54nDU0B/lqZqAN+iu4AF6sPTc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIPYmg/E3EBSUANvcjL6x//EKMMBBjXQtUjxtG1HKFfFe+owRjH
	W/fK/o3FZKmF4lsINTIkuQzhnTUfrly9xNEDtQnBrsMnAOOETj84bj181BRY6HnxlUSQQg8Yw0i
	IVU+bAhSVg3aJZge3qIx00bWEJLZEvik=
X-Gm-Gg: AYBFou1I2c3FZ6pbnn0AT3JhlPNHeNZeV4s4YmpE3KypnzXM54J7VEVQ1l73uPt9kmx
	ILSHr1jAvg/AhfCdNbtcMdUy0bYzD/vk5KGTk3KZn50b9VlWYknQEAn0z855lrP3p/FRPvPWAZR
	gPrds2eTvnxX2hQKfjOd+td3Llv4HFK5/wAcudwDHJmdiyvd7O6Z4dvQdXn8u55JGq6OmdKvfUb
	a+LrtLRIl4aHVsQ5y8IXCV6OeG43TH8TzCrpehTUsNgFmg5Eu4wvmufIvdB02Trb8lntqtpBaef
	vJ6zee+fmnUtcF21obPFBQpXzFGGyCRKptQx18j57ykt0OMB/erj6i6nDHFEIPlZZNI8N7TKmwx
	XXfX4wSra83Gb/jnhTmVe/sGfJbl9NIh+l6YFhfH6mr20EbJY2AnCoDL+9yIpBK75keaWZM6dBw
	==
X-Received: by 2002:a2e:b888:0:b0:3a9:82c2:ec1e with SMTP id
 38308e7fff4ca-3a9c537ed07mr33111191fa.15.1791960191931; Tue, 13 Oct 2026
 23:43:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929094812.93374-1-tkhandelwal32@gmail.com> <CAPwBhz_ow3BFEns2WL69Gj2BmOHGiFOEzP7U-=FfzSvoH=DZSA@mail.gmail.com>
In-Reply-To: <CAPwBhz_ow3BFEns2WL69Gj2BmOHGiFOEzP7U-=FfzSvoH=DZSA@mail.gmail.com>
From: Tarun Khandelwal <tkhandelwal32@gmail.com>
Date: Wed, 14 Oct 2026 12:12:34 +0530
X-Gm-Features: AclHuK_roABVrEaRhuHK5p8P-AhgVeh6e8Rm4bmNzCFIfTidAX3p_1c6lDNfvkM
Message-ID: <CAPwBhz-yAXeZTca0iFT=9fVhD8k7rUQBtjNKCw_FKPFzYFC2gw@mail.gmail.com>
Subject: Re: [PATCH] fuse: propagate SB_POSIXACL to submounts
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: fuse-devel@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
	virtualization@lists.linux.dev, German Maglione <gmaglione@redhat.com>, 
	Vivek Goyal <vgoyal@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
	=?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	linux-kernel@vger.kernel.org, Tarun Khandelwal <tarun@supabase.io>
Content-Type: text/plain; charset="UTF-8"

(Resending as plain text, the lists bounced the previous copy.)

Hi Miklos,

Gentle ping on this one.

It fixes POSIX ACLs being unusable (and not enforced) on virtiofs
submounts, so it may be a candidate for fixes. If leaving SB_POSIXACL
off submounts was intentional, I'm happy to rework or drop it.

Thanks,
Tarun

On Wed, 14 Oct 2026 at 11:22, Tarun Khandelwal <tkhandelwal32@gmail.com> wrote:
>
> Hi Miklos,
>
> Gentle ping on this one.
>
> It fixes POSIX ACLs being unusable (and not enforced) on virtiofs
> submounts, so it may be a candidate for fixes. If leaving SB_POSIXACL
> off submounts was intentional, I'm happy to rework or drop it.
>
> Thanks,
> Tarun
>
> On Tue, 29 Sept 2026 at 15:18, Tarun Khandelwal <tkhandelwal32@gmail.com> wrote:
>>
>> From: Tarun Khandelwal <tarun@supabase.io>
>>
>> fuse_fill_super_common() always sets SB_POSIXACL on the superblock, but
>> fuse_fill_super_submount() never does. Submount superblocks are created
>> from an fs_context with no sb_flags, so the superblock of an automounted
>> FUSE_ATTR_SUBMOUNT directory (e.g. a virtiofs export containing another
>> host mount) lacks SB_POSIXACL, even though it shares the fuse_conn, and
>> thus fc->posix_acl, with its parent.
>>
>> Since IS_POSIXACL() is false on such a submount, the VFS:
>>
>>  - fails setting POSIX ACLs with -EOPNOTSUPP and hides existing ACLs,
>>    without sending any request to the server;
>>  - applies the umask itself on create, so default ACLs on the server are
>>    not honoured for new files;
>>  - skips ACL checks in acl_permission_check(), so with
>>    default_permissions (implied by FUSE_POSIX_ACL) access is decided by
>>    the mode bits alone and restrictive ACL entries are not enforced.
>>
>> Copy SB_POSIXACL from the parent superblock, as is already done for the
>> other superblock fields inherited from it. It cannot be set in
>> fuse_sb_defaults(), because fuse_fill_super_common() checks whether the
>> flag was passed at mount time to decide fc->dont_mask before setting it.
>>
>> Reproducer, with virtiofsd 1.10.0 started with --posix-acl and an export
>> containing a nested mount:
>>
>>   host# mount -t tmpfs none /srv/share
>>   host# mkdir /srv/share/child
>>   host# mount -t tmpfs none /srv/share/child
>>   host# touch /srv/share/rootfile /srv/share/child/childfile
>>   guest# mount -t virtiofs <tag> /mnt
>>   guest# setfacl -m u:12345:rw /mnt/rootfile           # works
>>   guest# setfacl -m u:12345:rw /mnt/child/childfile
>>   setfacl: /mnt/child/childfile: Operation not supported
>>
>> With this patch the second setfacl succeeds, ACLs set on the host are
>> reported by getfacl on the submount, and default ACLs and ACL-based
>> access checks behave the same as on the root mount. Tested on v7.3-rc5
>> in a QEMU guest.
>>
>> Signed-off-by: Tarun Khandelwal <tarun@supabase.io>
>> ---
>> I wasn't sure whether leaving SB_POSIXACL off submount superblocks was
>> intentional. I would have opened an issue first, but since the fix is a
>> one-liner I'm sending the patch directly. If there is a reason for the
>> current behaviour, I'm happy to rework this or drop it.
>>
>>  fs/fuse/inode.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/fs/fuse/inode.c b/fs/fuse/inode.c
>> index e9552be36..ef3c7fac4 100644
>> --- a/fs/fuse/inode.c
>> +++ b/fs/fuse/inode.c
>> @@ -1629,6 +1629,8 @@ static int fuse_fill_super_submount(struct super_block *sb,
>>         WARN_ON(sb->s_bdi != &noop_backing_dev_info);
>>         sb->s_bdi = bdi_get(parent_sb->s_bdi);
>>
>> +       sb->s_flags |= parent_sb->s_flags & SB_POSIXACL;
>> +
>>         sb->s_xattr = parent_sb->s_xattr;
>>         sb->s_export_op = parent_sb->s_export_op;
>>         sb->s_time_gran = parent_sb->s_time_gran;
>> --
>> 2.43.0
>>
