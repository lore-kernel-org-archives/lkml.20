Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793352418;
	b=unpEtuoxcKFc1aoQrLYva7IBu+1bEvztZeQri+IR3YLKFQIhHhdnx5JxI2CKaMOK55Lo
	 671r29Td8EOrOO4X8UNakCp41+bx8AXnbZcbF9Zpj0j3yslrgTPbVaVh9pCfIG8cXpeXw
	 VD0Iia5gUrIpUdquDSD/MIKm4kMwKVR1/S1y6f5rVOhpdSW6ItQVikN4xo44HxtNMJFV/
	 EYE4joo1JUn9jiU3gwkyZ35zbcY7rm6wuSqL+zwvnqZWiGdnfoB8XTNdHPj8h+nakZ81R
	 tCgR1JYFF+vfto/AUVNwoXRBMnJgGS57YcSXf+CQJx//z2SIAu/lcl/smCUp4D3ENWw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793352418;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=a7q+/4+4zxMUP673wzD4KRVvcydFuIy84hUuAGiF6LM=;
	b=E2+jOD6uevzUUi/jd6zjiSBxN/fDNOH6J9N5tdxckj23VSq+uhqts7ZpzIGxdspXPK3r
	 4TDaknqUrx4FviTA2MZ8HwFC3LzbQxbGMcKhu0FwlOolGY1fWE0QBiM9Db/qmDbFgElxO
	 AYK2gsYfPnpfXlj0DRAx31lX9yJmIvsU3YoNL7YtRnBVan4Yrk7ZDJBo6XEKvcV/30wFJ
	 T8U8n9WllvrPlLP4M+UvtNNuJdVPjLt+TAM9bwp0QeHrD0pOfTWFq88GKg3CzZ3Dm2zrB
	 qpNpeMXwa1upzdZpSdH0N8CmkXQ/FrpQmW0toCEDu7QulgEW79sdnJk7JiwHjuyHffQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ayciZqaX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6633E606A322
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:26:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6633E606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ayciZqaX
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b488586facso537261a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 02:26:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793352416; cv=none;
        d=google.com; s=arc-20260327;
        b=Phm+0XC9hq6VrKiwyb0XeBTQECv7XDZGGPcwy8g3OKCjiJlEHMhwpuqYga+hID/l5n
         cgPsJ6XWFxF0l+wsxAlemrTFACdfxXGdtmwNKNmkEC/T9xeBUXK/zf696uajWEOio4vC
         egYGK8FWWE93B40uidAOsbliyJb4ePT7a4qW56Lcr5YUob21ZgtFm3Kmszg71h48GG+Y
         jiqvX8LJAMKECE8suDQov0uEYBOk6+676R+64V4SmpA4/1z0qwjFa9fhi61e4ZDuS436
         ZZoKVjgN82mrsmyVcjJPeeAU7vU7f6No8p7ckuDE5U3ncTh6bB6Ti3XQqDH6AoiBIW2j
         +k8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=a7q+/4+4zxMUP673wzD4KRVvcydFuIy84hUuAGiF6LM=;
        fh=cFtO6HJ/AVO6u3W1Kfmj9p2LByCBFZ5+IIPzD8u0FuE=;
        b=XaxEdGeuM6sZGj/KUhicNF4RJguJOc/1TDbTpR2kWMK4VUZqWN9c30d5fm+e3yRYMB
         CWGGW1X1zt5CMZUfkFLYWpQSQOxKYDMyK9ce9KrOEW7jhgpfbjrB8rXAk+vYroJtw+HB
         jElvhhSwni3rIMDvez7i0A7POL+VvSbRIerJFvX41pU3oHd4F8HoCRLRj3UObMXz8oQA
         TRJyhgCA/dTKPkqBSOpSEuhCLiX2v8U8VMRtmyztZYoIDaBWh0nRcyXw2bUyiBcGLGq0
         UkFTcp1cp4KR/vGsK1WTK6BmkLjvxgqWItQjU35vis1UxI+wcLMN/kSOPaDXXKHKNH4W
         qHmA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793352416; x=1793957216; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=a7q+/4+4zxMUP673wzD4KRVvcydFuIy84hUuAGiF6LM=;
        b=ayciZqaXdQP8kxCzQupvDq5/ksF/5+X55nmxdHSDPXRtmFf8SIUDZkZaCXg6JnRxZT
         /PTNG35skuMUuytLlEpxoAJQ6sNewaygA79NJwF8mxa/zBRUdamK5O6BmpwPv3afvnYc
         NJ8Hbr3+omGNtgKFNtMzEGPHzmcIS3++nOUYbqexCw6Ob9qX3CD3rpUt2Ukp7kJZT264
         NpxOo0kDthQ25ZLLxaw87HUmbG7uFxnkhcYvmkjcaZXyCnX6/5bGiw55XEbK57jZhFJ8
         45Vse3mblR+uUMn6tMWl5Odsfk2aOVTQ/Nar5QHsjTE3aU7OBwVlXyMXOj2D/BB5ss/c
         WEdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793352416; x=1793957216;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a7q+/4+4zxMUP673wzD4KRVvcydFuIy84hUuAGiF6LM=;
        b=MOOpz9BDKYAZqzTeTNR4PTVKkm8doTgtltxcJxx2bHreAS6rrdQCKbi6ShUSs2m5e1
         ZmWzqh83el5JaIJ87VyLRczFDBjBRZpxsFG/Cgk7j3LwegE3y4N+HNt1cmNkxZdK3XCQ
         ZNZAqDXBR3lyr5fGhL43J3YFpmPs6OvkvPKRFBFjMHj0YV3uwhbvVSxTeQcXQZBq37vk
         n/LPvTSfFT2RrMu/TXwRXhDEM0yn+PmQOWtDGPMuM8DReELuza7c/GiKBaoUs3SzLdLb
         Tmo9uEZWpxnsQdsz54NtHnLrHNn7vxdur3LXo4+CjocDq/u3vCrGPcoupDH38SMyIf4W
         tdjA==
X-Forwarded-Encrypted: i=1; AKwUvBzYHIkMb2QPSsAaa3gmnzFsX+L8uXO9pI2PT4NUVfshQPO/krZqLaDxjKYgbIU1v/KGkOvlQf9YSCG7tyk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKzaoc7fp9Knu0qfE5KPV3mJACyEvg92dxlDKmIrC7j0KbdmPde
	zwNqzZeQtrpSjIT/2W0oZ1G7MyOKFls7twOpmgQ5YQaiS2DpGnOoltpI14tDBUFgyG1llWBuzgs
	t9JJ6LoXnHCHpDdL+Fb0U4S4RkwNhwgJ+WBSQ
X-Gm-Gg: AYBFou3uOQcz/rWxHU4XExk/n4UH27XT8AOsSvl+EmVbkGlZEznbJ3IQ7b7rgmwhLTq
	ZYiBgBkNOtpQBas6FGGicnYKI3irbAb+4oRf6ZKrfGXpRoGuOdCcCTjQfXUD4W6jnFFTIaoAVt+
	8CjG9p4aizalr3kmpHpvb4W39ZNEzdjiV55Z/AivvMdDfTbWEXMY08GwY5/1NZdwYuJKchFM2/s
	wMRUkZ70ocGIEmFNIsCM+UAaLLToKLllGovsMdjtTrnWJuKgt5UiVnskMWYbog91zqbuXcRy5ld
	RzYSg5kiakGhxqIlP/7YkqYOuQa3CyFkmGmCh4Gvr33jJJqkyDRZ3pSoUYSpPpeTud82qhLBOVy
	JB6cd9jR7JjutM6yM6rGd2V93QWnwZdDIRZ2+TNQaMSdow337IVe4AJGDYLKMHn8A+aKscw==
X-Received: by 2002:a17:907:72c8:b0:c41:c106:9772 with SMTP id
 a640c23a62f3a-c4ca792f071mr151923666b.1.1793352415540; Fri, 30 Oct 2026
 02:26:55 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <P58Wrer--F-9@tuta.io>
In-Reply-To: <P58Wrer--F-9@tuta.io>
From: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 30 Oct 2026 10:26:44 +0100
X-Gm-Features: AclHuK_RA6XrlgVHuWWMqlPNjOqYiitwMvc6OBqsxoVy-pqo9NlWDMGkDue8iP8
Message-ID: <CAOQ4uxjqa_bTBaScWMfoUvhHL_xSxDQ2xK7+r9YsaWOaXfKC5Q@mail.gmail.com>
Subject: Re: [PATCH v3] fs: let backing files inherit FMODE_NONOTIFY from the
 user file
To: Edvard Conrad <edvard@tuta.io>
Cc: Miklos Szeredi <miklos@szeredi.hu>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, 
	"linux-unionfs@vger.kernel.org" <linux-unionfs@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 10:18=E2=80=AFPM Edvard Conrad <edvard@tuta.io> wro=
te:
>
> When fanotify reports a permission event, copy_event_to_user() creates
> the event fd with dentry_open_nonotify(), so that the listener's use of
> that fd does not generate further events. If the event's path is on a
> stacked filesystem, the stacked filesystem's ->open() opens the real
> file with backing_file_open(). Since commit ebe559609d78 ("fs: get rid
> of __FMODE_NONOTIFY kludge"), FMODE_NONOTIFY lives in f_mode only and
> the backing file does not inherit it: it is allocated with the default
> fsnotify mode, and fsnotify_open_perm_and_set_mode() raises FS_OPEN_PERM
> on the real path if the backing filesystem has permission event
> watchers.
>
> Before that commit __FMODE_NONOTIFY travelled in f_flags, and overlayfs
> copies the user file's f_flags into the backing open
> (ovl_open_realfile()), so the backing file was exempt implicitly. Commit
> bc2473c90fca ("ovl: enable fsnotify events on underlying real files")
> relied on that when it dropped FMODE_NONOTIFY from OVL_OPEN_FLAGS.
>
> The nested event is queued to the same group, from inside the
> listener's read(2), and can only be answered by another reader thread
> of that group. A listener holding filesystem marks on both the stacked
> and the backing filesystem therefore deadlocks as soon as all of its
> reader threads are inside such a read(2) at the same time, and every
> other task that touches a marked filesystem queues up behind it.
>
> Observed with a commercial anti-malware agent (16 reader threads) on an
> ostree/composefs host: / is an overlayfs whose data layer is the ostree
> object store on the same btrfs that holds /etc and /home, and a
> systemd-sysext overlay sits on /usr. Every on-demand scan of /usr wedged
> the whole machine until the group was killed. Stack of a blocked reader
> thread on 7.2.7:
>
>   fanotify_get_response
>   fanotify_handle_event
>   send_to_group
>   fsnotify
>   __fsnotify_parent
>   do_dentry_open
>   vfs_open
>   backing_file_open
>   ovl_open_realfile [overlay]
>   ovl_open [overlay]
>   do_dentry_open
>   vfs_open
>   backing_file_open
>   ovl_open_realfile [overlay]
>   ovl_open [overlay]
>   do_dentry_open
>   vfs_open
>   dentry_open_nonotify
>   copy_event_to_user
>   fanotify_read
>   vfs_read
>   ksys_read
>
> Userspace cannot avoid this: the backing open happens while the kernel
> builds the fd, before the event is reported, and fid reporting is not
> available for permission event classes.
>
> Make a backing file inherit FMODE_NONOTIFY when the user file it is
> opened for must not generate events. This restores the pre-6.14
> behaviour for the fds that fanotify creates (and for any other
> FMODE_NONOTIFY file), while ordinary opens through a stacked filesystem
> keep generating events on the real path, as intended by bc2473c90fca.
>
> Verified with a self-contained reproducer (private tmpfs lower layers, an
> overlayfs over them, FAN_OPEN_PERM filesystem marks on the overlay and on
> one lower layer, a child opening a file through the overlay) in a qemu
> VM on this tree built with defconfig plus OVERLAY_FS, FANOTIFY and
> FANOTIFY_ACCESS_PERMISSIONS: without this patch the listener's read(2)
> never returns and the child's open is released only by the listener's
> death; with it read(2) returns, the event is answered and the open
> completes.
>
> backing_tmpfile_open() is left alone: its only caller is
> ovl_create_tmpfile(), whose user file is a regular overlayfs file.
>
> Fixes: ebe559609d78 ("fs: get rid of __FMODE_NONOTIFY kludge")
> Cc: stable@vger.kernel.org
> Reviewed-by: Amir Goldstein <amir73il@gmail.com>
> Signed-off-by: Edvard Conrad <edvard@tuta.io>
> ---
> v3:
> - Back to the v1 change in backing_file_open(). The init_file()
>   variant posted as v2 was larger without being more general; Amir
>   withdrew that suggestion and reviewed v1 instead.

Apologies for the detour

> - Add Amir's Reviewed-by. Drop the Assisted-by and Suggested-by
>   trailers and the blank line in the trailer block, as asked.
> - Keep the subject line from v2, which is the prefix used for
>   fs/backing-file.c.
> - The reproducer posted inline with v1 is now an LTP test, under
>   review as syscalls/fanotify26:
>   https://lore.kernel.org/ltp/P50G-yE--F-9@tuta.io/

Thanks for following up on that!
Amir.

>
> v2: https://lore.kernel.org/all/P4wV1J9--F-9@tuta.io/
> v1: https://lore.kernel.org/all/P4sl5iz--F-9@tuta.io/
>
> Tool disclosure (Documentation/process/generated-content.rst): the
> stack analysis, the git-history search for the regressing commit, the
> patch text, the commit message and the reproducer were produced with
> an AI coding assistant (Anthropic Claude Code) under my direction over
> interactive sessions; I reviewed, built and tested the result. No
> static analysis tools beyond checkpatch were used.
>
>  fs/backing-file.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/fs/backing-file.c b/fs/backing-file.c
> index 5614cb7801e..24357bf9328 100644
> --- a/fs/backing-file.c
> +++ b/fs/backing-file.c
> @@ -43,6 +43,17 @@ struct file *backing_file_open(const struct file *user=
_file, int flags,
>         if (IS_ERR(f))
>                 return f;
>
> +       /*
> +        * A user file that must not generate fsnotify events (e.g. the f=
d
> +        * that fanotify creates for a permission event with
> +        * dentry_open_nonotify()) must not generate them through its bac=
king
> +        * file either. Otherwise a listener watching the backing filesys=
tem
> +        * gets a nested permission event from its own read(2), which onl=
y
> +        * another reader of the same group can answer.
> +        */
> +       if (FMODE_FSNOTIFY_NONE(user_file->f_mode))
> +               file_set_fsnotify_mode(f, FMODE_NONOTIFY);
> +
>         path_get(user_path);
>         backing_file_set_user_path(f, user_path);
>         error =3D vfs_open(real_path, f);
> --
> 2.56.0
>
