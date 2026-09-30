Received: from mail-oo2-f43.google.com (mail-oo2-f43.google.com [74.125.231.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADD48518156
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 17:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790788946; cv=pass; b=EekunL6Q98HgporCfvhRVz8fVWEKBVHsnPqIRu7CTHi8mattBpyml9MMUgKBxxvSGzQRj3NJ8B0gr4K550vkJ3lokCmMqhtjPVu5GDQGQXYgOxRsZNOS6/6ch601dvyVLP2c5puYnq86iSsAnTFYJcai2fVhg2Hz0vYNt605FBQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790788946; c=relaxed/simple;
	bh=zRVMMlc5fCEgysqgVDUi/YSuX/Ogj7bmJUVr37RK9ug=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qKm+MGpVres/hnVZqxCQMiXR3Hpufbw3GiNgZyZSZPDF9QqnfLDMUp4v/0QPRwfiPRY2Os5X2MfcMTC4mR/0XwXe/b1Rz3C6+S2I7GhaQg4GgcqsWhvUXEP/puiU27KEffTSS8DC0eo+cNsnfF8ZW9qnW1iPs9koliLYrtO1gWQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lwNGCm9f; arc=pass smtp.client-ip=74.125.231.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lwNGCm9f"
Received: by mail-oo2-f43.google.com with SMTP id 46e09a7af769-81b15bca7e0so3162145a34.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 10:22:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790788943; cv=none;
        d=google.com; s=arc-20260327;
        b=ijpRqMcNcFdHBsmSx8lbd7+rf9JKVgbavrBH1zGN6ZKNohaY/jtz89KzC7VbSRSz6h
         bvmF4uirLMOdF8ZhYqzpT/gqTw/QMJ8x0b6kS0NwHIKe+jWX3y5lSqw0/LnMIfoQaJIN
         +w9c0Sr9yz1bxo4s13NQ3GtEeXBP9j/JBMVeKZDp01paYlFtDL6ybgqpp3g0mBDI9YWY
         /Qz9lbjQ+WdrIc9bXzHn1ALxT8QOVVVWnfp7OOlrmKl2FyMBS5qG39F1vk6RhpX+Ulwc
         Aa7lFAZL7N/g2Y+INhEZARMWm3kjdF75rcDiYjNkxEXZXaJwtMit6Ql7kAaVF8h+tma7
         QFxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yu5vPNZRGHwBy2ovp25s5yW4Pu1HCw1xplpSec6o1bA=;
        fh=fnKa4bJL0cWqXun5fCFzW50XTFEN/p/0Ipl6ehIDVig=;
        b=MY4lLLJuuLKzDXECzYI6OW6s2714amR4UCEzY7ZeqMqEKK3Cm3ReY3Cze29tJGjjAC
         rsHOg7pnxvS99g+jX5ZOSddQSnzNaKEyy+FLKKoBE6uVcqsng60lXJaQlg3T1H79oryt
         tHZOuRZ95KmsYR7nLFYmHxTNvhLBAgpazT4LlmKcQqRregwO5e4SOeSQVGZFRKocDlJy
         3/EJqUvPwsfqZ8gipeP+pu0U28AjCDkBqzCsfssWVftyA4o205gAHgGB3atw5QZEcdPy
         7+UkWc7Wh4qY9UxT7GRB4lptJLTuJPqWhyu+0PWRS+zJH3z6e+W+VnNIqm2hViBHXexL
         u11A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790788943; x=1791393743; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yu5vPNZRGHwBy2ovp25s5yW4Pu1HCw1xplpSec6o1bA=;
        b=lwNGCm9fTR04Eqo37bFz84HGQ5rJtphgobS00cWxmeDuQkySwL4MWn+gwF1w1S9+9U
         AmHKNcEL6omevnWV7aM3VOhp51vBVHvUCSsEhi3Qpa/UpnNpOlSiKdLm+HqwDO9YBkq/
         Tzs42UY/3QmQSh7H/iAtQJ2GNQqrDf6NWcJiDXlyNZqLSv4LZiHc1IPKlHN2cwcfZLdK
         c82FI+Tfbw3kXGT1IsCzafHYJxFRMOE1uFyKrqHEf1RWqq1LjUgUXdA+mMMfVoNBaNwV
         ld9mOrg+GocXEyj8iWXiS/ApVQlXuKoBt2k92Zc/rRC9xexwAtiIPOvKIEhg09f/WMaX
         AXGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790788943; x=1791393743;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yu5vPNZRGHwBy2ovp25s5yW4Pu1HCw1xplpSec6o1bA=;
        b=Rq9stY+4+R0cBAJPPWmlguUnsum3wC4RBZD9ikToKWzWVWX/Kwc3JGG9hOg/5ch16I
         48a2ZoU+5R2veDhvmhn/fZ3L2L53nex9azDNbbJIZe6UcmSfCWVz4WTZAUiQVQd0MvFV
         X3bLxHgiFvw9YJG7PZPEjlscqzTvA1Gb4i+dn/HyNl1uSFK+m19HQsfBbCtkjPmNcIdC
         dZhMEQ1zT8JI5ibLyj5xSc9ciTKjE/KmxcxD/2Ih84+dRiUR91X8NXELqlnsUXhEWZnO
         eRieK73uJdEjGn5M98x0jvB8GWStB2VZDxY++FMrwC1Jd8hLMe5tdtwmiWyE9MPV4Lhj
         lp8w==
X-Forwarded-Encrypted: i=1; AKwUvBynPE+HMgZqWWQFcRSt6yo1sHwsPLGsfHhpuV2igAReRxVWb0AT+Xjy8p7YHxB33MgYUyqptHp0J4xyegY=@vger.kernel.org
X-Gm-Message-State: AFuF++kjqq2peJlgUsFqzVek1jxIrjJrIb0t7SfpZawkwy6+LgmDxghg
	7GXaXHew1OcjwNYMLvLJa5oah7Jr5zho4wWUKnk9/KpLdcA8jz9yxDYmwuBVNghqTWxF+iXrpg3
	b22uZnlv2SS/IF5xwFuOb0UG5Opro2P8=
X-Gm-Gg: AYBFou3gZ3pukhiJOIXpJ+2fxNmNv0heQMEoJ09gqG0wCCMIphve1b/ydvpRei3enDd
	S6/0ORVM22Znt60w+1Sm4liLLObJ1B1kag68612gMeOTd53bqT2hV/stysxNLMxokrvl3cftkYq
	ZapA7F4WKhHFE0lk4FSlatcAxOJG5oQ7sfMUwKT2+qgv4vbyxme1XnhPZuYaWn0jSK23ZJnWNm/
	mEKfdrxBTxGiDFxs3WXUfojDUgGsKLNIJYIQqqrYIEcWvONQYyHTHk9iSEa973j6v+YedZadggp
	SqcgmKuDHQY5xWqktiS5YMnEcfUZV+Vpav50R8mBOpzI05e/MPYI7hBLweTyR4Gz
X-Received: by 2002:a05:6830:2a0d:b0:81c:37e2:2012 with SMTP id
 46e09a7af769-82049efa6ffmr2348274a34.15.1790788941936; Wed, 30 Sep 2026
 10:22:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260926-nsfs-prune-rfc-v2-0-53509260e4e7@gmail.com> <20260926-nsfs-prune-rfc-v2-1-53509260e4e7@gmail.com>
In-Reply-To: <20260926-nsfs-prune-rfc-v2-1-53509260e4e7@gmail.com>
From: Andrei Vagin <avagin@gmail.com>
Date: Wed, 30 Sep 2026 10:22:10 -0700
X-Gm-Features: AclHuK_q_WkZKtIVvL2_JZxQzOyxiVzzsuWi72MjhRzmIxNO0_froXd1yw4BveA
Message-ID: <CANaxB-yj2QV183nk3UC-2PD6qh6hh-_iLRuryTdUsebd+RqxdA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] mount: add OPEN_TREE_DROP_MNTNS_MOUNTS
To: Kir Kolyshkin <kolyshkin@gmail.com>
Cc: Christian Brauner <brauner@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Aleksa Sarai <cyphar@cyphar.com>, Jan Kara <jack@suse.cz>, Jeff Layton <jlayton@kernel.org>, 
	"Eric W . Biederman" <ebiederm@xmission.com>, David Howells <dhowells@redhat.com>, 
	Amir Goldstein <amir73il@gmail.com>, Andrei Vagin <avagin@google.com>, Shuah Khan <shuah@kernel.org>, 
	Giuseppe Scrivano <giuseppe@scrivano.org>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	containers@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 26, 2026 at 12:01=E2=80=AFAM Kir Kolyshkin <kolyshkin@gmail.com=
> wrote:
>
> A recursive open_tree(OPEN_TREE_CLONE) copies the nsfs mounts of any
> mount namespaces pinned below the source.  When the clone is attached
> inside a mount namespace younger than a pinned one, move_mount(2) fails
> with ELOOP from check_for_nsfs_mounts(), per the rule from commit
> 8823c079ba71 ("vfs: Add setns support for the mount namespace") that
> prevents mount namespace reference loops.
>
> This breaks container runtimes that use OPEN_TREE_NAMESPACE, such as
> crun [1].  The new namespace is younger than everything else, so bind
> mounting e.g. the host root fails on any host that pins a mount namespace
> (snapd does, under /run/snapd/ns).  By the time it fails, setns() has
> already run and userspace cannot recover: the host tree is out of reach,
> and the offending mounts cannot be unmounted from the detached copy.
>
> copy_mnt_ns() and create_new_namespace() already leave these mounts
> behind; only get_detached_copy() copies them.  Add an open_tree() flag to
> drop them from the clone, as suggested by Aleksa [2].  Locked nsfs mounts
> are dropped the same way copy_mnt_ns() does it, so nothing new is exposed=
.
>
> Keep it opt-in: open_tree(OPEN_TREE_CLONE) plus move_mount(2) is how
> mount --rbind works through a file descriptor, and in the caller's own
> or an older namespace such mounts remain usable.
>
> The flag requires OPEN_TREE_CLONE or OPEN_TREE_NAMESPACE.  With the
> latter it is a no-op, so a runtime can pass it unconditionally.
>
> Link: https://github.com/containers/crun/issues/2262 [1]
> Link: https://lore.kernel.org/all/2026-01-07-oldest-grim-captions-spills-=
ywC2O3@cyphar.com/ [2]
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Kir Kolyshkin <kolyshkin@gmail.com>
> ---
>  fs/namespace.c             | 14 ++++++++++++--
>  include/uapi/linux/mount.h |  1 +
>  2 files changed, 13 insertions(+), 2 deletions(-)
>
> diff --git a/fs/namespace.c b/fs/namespace.c
> index ae5dc64f8b45..a95173996a8f 100644
> --- a/fs/namespace.c
> +++ b/fs/namespace.c
> @@ -3062,7 +3062,8 @@ static struct mnt_namespace *get_detached_copy(cons=
t struct path *path, unsigned
>                         ns->seq_origin =3D src_mnt_ns->ns.ns_id;
>         }
>
> -       mnt =3D __do_loopback(path, (flags & AT_RECURSIVE), CL_COPY_MNT_N=
S_FILE);
> +       mnt =3D __do_loopback(path, (flags & AT_RECURSIVE),
> +                           (flags & OPEN_TREE_DROP_MNTNS_MOUNTS) ? 0 : C=
L_COPY_MNT_NS_FILE);

Overall, the patch looks good. One small thing is that open_tree() with
OPEN_TREE_DROP_MNTNS_MOUNTS doesn't fail on a mntns file if AT_RECURSIVE
isn't set:

  open_tree(AT_FDCWD, "/proc/self/ns/mnt",
            OPEN_TREE_CLONE|OPEN_TREE_CLOEXEC|0x4) =3D 3

With AT_RECURSIVE, __do_loopback() calls copy_tree(), which checks
!(flag & CL_COPY_MNT_NS_FILE) && is_mnt_ns_file(dentry) and returns
-EINVAL, but without AT_RECURSIVE it calls clone_mnt(), which doesn't
have such check.

Thanks,
Andrei
