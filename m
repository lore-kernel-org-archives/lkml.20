Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D5B2335067
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 05:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790574027; cv=none; b=oAD16fC3mS/ofK9v9faQ31Z2sKjSTysLabf0ODq2WKiaZAwmgtKESJteDXa0SwRw20MAyqSoXVwhZRmD37hfO3dY3K5cEhJmKl3xv1mC537by3adIPXRCi74E3EPeB49LiWweIWKLnWxo0i3N3Im23o0bY6uPk7hbKtHNXVP2js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790574027; c=relaxed/simple;
	bh=1uKtVGftoQYdcjYX3y8INcQ+33Q5MaoCX/IG0C6Hayw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GmRJ47i0DjHamC2gctXl0J5KUUvb2beRrxqoa4h426CTxBs8OWBOd2+FDG9vLfbwyuzYyyGth9K4n0RQ+hs2e748R8dBospB0lo0K2Zg+8EN3qW03fJjndXe2Yew8j4Rl0BY/n5WEaVaFbqcXyg/VDKq8biMxtOnIFDfEAuwmFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m96MPt4w; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m96MPt4w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A3C81F008A0
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 05:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790574020;
	bh=MV+9uT31RGIb/UayWDRDIElXeBW1lCojsnaPgq9d99M=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=m96MPt4w/pIuDrrxyHSvgqfg2HwVD8JFouZQT0e0Ehg0riYvezvd+elyfo/xcIYbG
	 URzkLwrOePXPVnbgccvhJ7hGrI5VLSzJTPPFV1xZx/0pA6PlSmaqy92hwe15PE2CC0
	 8PZhYwcmFCHOwtSN1RxnqUbI1hYKsKMzq9NwNVdI5C7QcmPRqkEYXXQM/5+OL6KLuq
	 Tau8krt+eBxk15S2vUenqbIPvb/CNGYrSC8FzrwLxr3ZpV8O9IjDPKffSKv2uyrhFa
	 oXxb8/I6skqmqSvaoyHgOyXfqBVMgHM79GjxCnfJvtmF3HLVH0lD+h4Av+BwPm+vyC
	 HOhMqlcbCK6Ug==
Received: by mail-ej2-f41.google.com with SMTP id a640c23a62f3a-c2dc50c6edfso108389466b.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 22:40:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxirD/sbmqK5pdT7JCMOScjkO14+QFW+Ht0bQ1Xox+PLqIP6O/ax/F4ardcb6sUjXsTTXhb6DwZ0sRNDrc=@vger.kernel.org
X-Gm-Message-State: AFuF++kLZayo1Lks8r9R5oRoqgL3h7ceUbmWDQ6072l3SsPx2oldR0oS
	nZzA+TemVLEoesmQb4UF6vHZtsBUZuchrcL86cTJbn+0A8gPMP/QJ+P1FbDyoD8gQbf5xkZBrpg
	DT3Dcyk4grTUQG7wYaXeAMIabeW0X6DZHkDLxBbGdmw==
X-Received: by 2002:a17:907:e0c7:20b0:c2d:c247:5400 with SMTP id
 a640c23a62f3a-c2dc2475ef8mr185889766b.27.1790574019351; Sun, 27 Sep 2026
 22:40:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916101929.149106-1-hebaoquan@kylinos.cn> <20260916101929.149106-11-hebaoquan@kylinos.cn>
In-Reply-To: <20260916101929.149106-11-hebaoquan@kylinos.cn>
From: Chris Li <chrisl@kernel.org>
Date: Sun, 27 Sep 2026 19:40:07 -1000
X-Gmail-Original-Message-ID: <CACePvbUn4xBNkKBjyniG0TLb5bA8wGNBiJ77JTF8FDGN9EgCWQ@mail.gmail.com>
X-Gm-Features: AclHuK8WVKaVl1u64EutxBAqx3N9IFZl8yBqJ6pjUQ8gMAlho2HuiWEWZdOufEY
Message-ID: <CACePvbUn4xBNkKBjyniG0TLb5bA8wGNBiJ77JTF8FDGN9EgCWQ@mail.gmail.com>
Subject: Re: [PATCH v3 10/14] mm, swap: refactor swapoff and add xswap_destroy
To: Baoquan He <hebaoquan@kylinos.cn>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, kasong@tencent.com, 
	nphamcs@gmail.com, baohua@kernel.org, youngjun.park@lge.com, 
	hannes@cmpxchg.org, yosry@kernel.org, shikemeng@huaweicloud.com, 
	chengming.zhou@linux.dev, baoquan.he@linux.dev, david@kernel.org, 
	linux-kernel@vger.kernel.org, kunwu.chan@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 12:21=E2=80=AFAM Baoquan He <hebaoquan@kylinos.cn> =
wrote:
>
> Extract __swapoff() from sys_swapoff() so the teardown logic can be
> shared, and make it work for file-less devices.
>
> Add xswap_destroy() to tear down a file-less xswap device by swap type,
> exposed via /sys/kernel/mm/xswap/destroy. Writing a swap type tears down
> that device; it requires CAP_SYS_ADMIN.
>
> Signed-off-by: Baoquan He <hebaoquan@kylinos.cn>
> ---
>  mm/swapfile.c | 205 +++++++++++++++++++++++++++++++++++++-------------
>  1 file changed, 151 insertions(+), 54 deletions(-)
>
> diff --git a/mm/swapfile.c b/mm/swapfile.c
> index 351c68bcd70b..cdcbcbaa6d87 100644
> --- a/mm/swapfile.c
> +++ b/mm/swapfile.c
> @@ -73,6 +73,7 @@ static int xswap_mapped_end(pte_t *pte, unsigned long a=
ddr, void *data);
>  static void xswap_try_shrink(struct swap_info_struct *si);
>
>  static int xswap_create(int prio);
> +static int xswap_destroy(int type);
>
>  static ssize_t xswap_create_store(struct kobject *kobj,
>                                   struct kobj_attribute *attr,
> @@ -103,8 +104,35 @@ static ssize_t xswap_create_store(struct kobject *ko=
bj,
>  static struct kobj_attribute xswap_create_attr =3D __ATTR(create, 0200, =
NULL,
>                                                         xswap_create_stor=
e);
>
> +static ssize_t xswap_destroy_store(struct kobject *kobj,
> +                                  struct kobj_attribute *attr,
> +                                  const char *buf, size_t count)
> +{
> +       unsigned long type;
> +       int err;
> +
> +       if (!capable(CAP_SYS_ADMIN))
> +               return -EPERM;
> +
> +       err =3D kstrtoul(buf, 0, &type);
> +       if (err)
> +               return err;
> +       if (type >=3D MAX_SWAPFILES)
> +               return -EINVAL;
> +
> +       err =3D xswap_destroy(type);
> +       if (err)
> +               return err;
> +
> +       return count;
> +}
> +
> +static struct kobj_attribute xswap_destroy_attr =3D __ATTR(destroy, 0200=
, NULL,
> +                                                        xswap_destroy_st=
ore);
> +
>  static struct attribute *xswap_attrs[] =3D {
>         &xswap_create_attr.attr,
> +       &xswap_destroy_attr.attr,
>         NULL,
>  };
>
> @@ -3399,65 +3427,44 @@ static void flush_percpu_swap_cluster(struct swap=
_info_struct *si)
>  }
>
>
> -SYSCALL_DEFINE1(swapoff, const char __user *, specialfile)

Here you relocate the swapoff function and causing a lot of diff
context due to the code movement.

I move your swapoff code back, right after
flush_percpu_swap_cluster(). Then the diff is much cleaner around
swapoff.

For example, here is what the new diff showed:
SYSCALL_DEFINE1(swapoff, const char __user *, specialfile)
 {
        struct swap_info_struct *p =3D NULL;
@@ -3391,6 +3393,11 @@ SYSCALL_DEFINE1(swapoff, const char __us
        spin_unlock(&p->lock);
        spin_unlock(&swap_lock);

+#ifdef CONFIG_XSWAP
+       if (p->flags & SWP_XSWAP)
+               cancel_work_sync(&p->xswap_shrink_work);
+#endif
+
        wait_for_allocation(p);

        set_current_oom_origin();

It means we will need some swap_ops->swapoff() for handling the async
workqueue canceling.

Chris

> +/*
> + * Drop @p from the avail and active lists and undo its accounting.  The
> + * caller must hold swap_lock and have checked that @p is WRITEOK and no=
t
> + * pinned for hibernation.
> + *
> + * Returns 0, or -ENOMEM with swap_lock still held.
> + */
> +static int swap_info_remove(struct swap_info_struct *p)
>  {
> -       struct swap_info_struct *p =3D NULL;
> -       struct file *swap_file, *victim;
> -       struct address_space *mapping;
> -       struct inode *inode;
> -       int err, found =3D 0;
> -
> -       if (!capable(CAP_SYS_ADMIN))
> -               return -EPERM;
> -
> -       BUG_ON(!current->mm);
> -
> -       CLASS(filename, pathname)(specialfile);
> -       victim =3D file_open_name(pathname, O_RDWR|O_LARGEFILE, 0);
> -       if (IS_ERR(victim))
> -               return PTR_ERR(victim);
> -
> -       mapping =3D victim->f_mapping;
> -       spin_lock(&swap_lock);
> -       plist_for_each_entry(p, &swap_active_head, list) {
> -               if (p->flags & SWP_WRITEOK) {
> -                       if (p->swap_file->f_mapping =3D=3D mapping) {
> -                               found =3D 1;
> -                               break;
> -                       }
> -               }
> -       }
> -       if (!found) {
> -               err =3D -EINVAL;
> -               spin_unlock(&swap_lock);
> -               goto out_dput;
> -       }
> -
> -       /* Refuse swapoff while the device is pinned for hibernation */
> -       if (p->flags & SWP_HIBERNATION) {
> -               err =3D -EBUSY;
> -               spin_unlock(&swap_lock);
> -               goto out_dput;
> -       }
> -
>         if (!security_vm_enough_memory_mm(current->mm, p->pages))
>                 vm_unacct_memory(p->pages);
> -       else {
> -               err =3D -ENOMEM;
> -               spin_unlock(&swap_lock);
> -               goto out_dput;
> -       }
> +       else
> +               return -ENOMEM;
> +
>         spin_lock(&p->lock);
>         del_from_avail_list(p, true);
>         plist_del(&p->list, &swap_active_head);
>         atomic_long_sub(p->pages, &nr_swap_pages);
>         total_swap_pages -=3D p->pages;
>         spin_unlock(&p->lock);
> -       spin_unlock(&swap_lock);
> +       return 0;
> +}
> +
> +/* Common swap teardown after list removal; shared by sys_swapoff() and
> + * xswap_destroy().
> + */
> +static int __swapoff(struct swap_info_struct *p)
> +{
> +       struct file *swap_file =3D NULL;
> +       int err;
>
>  #ifdef CONFIG_XSWAP
> -       if (p->flags & SWP_XSWAP)
> +       if (p->flags & SWP_XSWAP) {
>                 cancel_work_sync(&p->xswap_shrink_work);
> +               /* Wait out a shrink racing us from the sysfs write path.=
 */
> +               mutex_lock(&p->xswap_lock);
> +               mutex_unlock(&p->xswap_lock);
> +       }
>  #endif
>
>         wait_for_allocation(p);
> @@ -3469,7 +3476,7 @@ SYSCALL_DEFINE1(swapoff, const char __user *, speci=
alfile)
>         if (err) {
>                 /* re-insert swap space back into swap_list */
>                 reinsert_swap_info(p);
> -               goto out_dput;
> +               return err;
>         }
>
>         /*
> @@ -3509,15 +3516,21 @@ SYSCALL_DEFINE1(swapoff, const char __user *, spe=
cialfile)
>         kfree(p->global_cluster);
>         p->global_cluster =3D NULL;
>         free_swap_cluster_info(p);
> +       /*
> +        * The device is off swap_active_head and no longer WRITEOK, so n=
o
> +        * reader can observe these; clearing them here needs no lock.
> +        */
>         p->max =3D 0;
>         p->cluster_info =3D NULL;
>
> -       inode =3D mapping->host;
> +       if (swap_file) {
> +               struct inode *inode =3D swap_file->f_mapping->host;
>
> -       inode_lock(inode);
> -       inode->i_flags &=3D ~S_SWAPFILE;
> -       inode_unlock(inode);
> -       filp_close(swap_file, NULL);
> +               inode_lock(inode);
> +               inode->i_flags &=3D ~S_SWAPFILE;
> +               inode_unlock(inode);
> +               filp_close(swap_file, NULL);
> +       }
>
>         /*
>          * Clear the SWP_USED flag after all resources are freed so that =
swapon
> @@ -3528,10 +3541,61 @@ SYSCALL_DEFINE1(swapoff, const char __user *, spe=
cialfile)
>         p->flags =3D 0;
>         spin_unlock(&swap_lock);
>
> -       err =3D 0;
>         atomic_inc(&proc_poll_event);
>         wake_up_interruptible(&proc_poll_wait);
>
> +       return 0;
> +}
> +
> +SYSCALL_DEFINE1(swapoff, const char __user *, specialfile)
> +{
> +       struct swap_info_struct *p =3D NULL;
> +       struct file *victim;
> +       struct address_space *mapping;
> +       int err, found =3D 0;
> +
> +       if (!capable(CAP_SYS_ADMIN))
> +               return -EPERM;
> +
> +       BUG_ON(!current->mm);
> +
> +       CLASS(filename, pathname)(specialfile);
> +       victim =3D file_open_name(pathname, O_RDWR|O_LARGEFILE, 0);
> +       if (IS_ERR(victim))
> +               return PTR_ERR(victim);
> +
> +       mapping =3D victim->f_mapping;
> +       spin_lock(&swap_lock);
> +       plist_for_each_entry(p, &swap_active_head, list) {
> +               if (p->flags & SWP_WRITEOK) {
> +                       if (p->swap_file && p->swap_file->f_mapping =3D=
=3D mapping) {
> +                               found =3D 1;
> +                               break;
> +                       }
> +               }
> +       }
> +       if (!found) {
> +               err =3D -EINVAL;
> +               spin_unlock(&swap_lock);
> +               goto out_dput;
> +       }
> +
> +       /* Refuse swapoff while the device is pinned for hibernation */
> +       if (p->flags & SWP_HIBERNATION) {
> +               err =3D -EBUSY;
> +               spin_unlock(&swap_lock);
> +               goto out_dput;
> +       }
> +
> +       err =3D swap_info_remove(p);
> +       if (err) {
> +               spin_unlock(&swap_lock);
> +               goto out_dput;
> +       }
> +       spin_unlock(&swap_lock);
> +
> +       err =3D __swapoff(p);
> +
>  out_dput:
>         filp_close(victim, NULL);
>         return err;
> @@ -4128,6 +4192,10 @@ static void xswap_try_shrink(struct swap_info_stru=
ct *si)
>
>         mutex_lock(&si->xswap_lock);
>
> +       /* A swapoff raced us and is about to walk this mapping. */
> +       if (!(READ_ONCE(si->flags) & SWP_WRITEOK))
> +               goto out_unlock;
> +
>         nr_mapped =3D READ_ONCE(si->nr_clusters_mapped);
>         if (nr_mapped <=3D 1)     /* keep cluster 0 */
>                 goto out_unlock;
> @@ -4435,6 +4503,35 @@ static int xswap_create(int prio)
>         spin_unlock(&swap_lock);
>         return error;
>  }
> +
> +/* Tear down a file-less xswap device by its swap type. */
> +static int xswap_destroy(int type)
> +{
> +       struct swap_info_struct *p;
> +       int err;
> +
> +       p =3D swap_type_to_info(type);
> +       if (!p)
> +               return -EINVAL;
> +
> +       spin_lock(&swap_lock);
> +       if (!(p->flags & SWP_WRITEOK) || !(p->flags & SWP_XSWAP)) {
> +               spin_unlock(&swap_lock);
> +               return -EINVAL;
> +       }
> +       /* Refuse swapoff while the device is pinned for hibernation */
> +       if (p->flags & SWP_HIBERNATION) {
> +               spin_unlock(&swap_lock);
> +               return -EBUSY;
> +       }
> +
> +       err =3D swap_info_remove(p);
> +       spin_unlock(&swap_lock);
> +       if (err)
> +               return err;
> +
> +       return __swapoff(p);
> +}
>  #endif /* CONFIG_XSWAP */
>
>  SYSCALL_DEFINE2(swapon, const char __user *, specialfile, int, swap_flag=
s)
> --
> 2.54.0
>
