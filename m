Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E5C13603E9
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 06:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791354747; cv=pass; b=cx0S9HAXqHeRIBPPMDOsuRHnVUs1S09ptBGUigg4aabuFGYBTbC1YLUN10lbUfWI2mK3d93SdOZK4a4DX/mVzwtGN6ApTWS8Upw6pI0dB5o83MgGDKlqyMrvcVm2HqANKgnF1PmWIiaSzr0/IehsoBfG4tThb6P42q9OADFXRsU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791354747; c=relaxed/simple;
	bh=t66la9jDSzcPXVYljESzX6XmoeVTmQ0McXPLdJU+xko=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s9MkFSbq1EIASyPGSysrgnEYGGF8TOjd+cdaxN8mB/k8s3pwA8JWKQccnMN0YsQ47yPnq0BFCAtCGjvp3yQqr8LgrUOTh3ZhyD9O1lETI7jjJAf1wGF9GiVu0we63p5uYzySB75RKkksgGDRL80JTL24obx8Ujvz0tJYpjPmRPs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ep4kOdtK; arc=pass smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ep4kOdtK"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a17baef589so9523975e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 23:32:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791354744; cv=none;
        d=google.com; s=arc-20260327;
        b=FybIpC6K/14mnD6r15tvWGqEHYbMOgzNqajQjZv6lKANlInNiiG7y3rEFCrPPcLdZt
         Vy+DdshAqo9THuLpqatG8BKso5NEdwHYO9DYe07v5IflNbdsgMyczixisc73oW5kiqr9
         rJjLWK9GT4r/9uNHXYBBideNwLcY5+cYpz8NZwj419UmMm+ZzDxi27tAdF+obXvRN9Uj
         E5Vn0dfIdlgKiaPpgAjm10tX6GsoDPNqk9i/1MVdSrr4LN70/kA9Z3RsAsbl4GGHPpWb
         zyAKDr8Kn+yfyL/lhpwAo8Zip5Qqc26mQogf8knJJxAafvK4UxKS4awQhanz8hE2ZPOg
         vq2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1Bbm+Jt9jzddxkMmLohq8T3HSBTZ/bcZvbUTV/gvMg8=;
        fh=SAprlcJglnWuXGzWmrIan3iXMGQZAnUIzDlZIOkgMZk=;
        b=CBzdQM2edC/T0iRaULB+ApTw/0behPCR1wvjWQ82RUTnrOMyqlluhPG9nmYNsXuXBL
         XoxbLe0nxaQ7yHHaBKFS8HGCUpm7fhkfyEfMxQUr8KMva6Wgq+1SpGW1w8HzwDFCD+0L
         1uq/3zLwLw73SYnoJHcWHAcUd4KUFWf/2fXrPrOgxrtofOresT8nQjJHm8mFTN1ZPpOM
         foCQgctpD5ybDKOks7B7Jt8kevImaNFCnlJQm8tDp9ynyltvSlkyYIHQeU8yZq1d3RUu
         ijhyshqGBwjWKxgT0BFkmDnLjRqRk1yzCWCjjSCTyJq6KwjdLyx0khevulyZPz4CDxZu
         3Oqw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791354744; x=1791959544; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1Bbm+Jt9jzddxkMmLohq8T3HSBTZ/bcZvbUTV/gvMg8=;
        b=Ep4kOdtKUUKnozD+WB1tNkPDN7VXeytxLuX/sl4BzohxKi+bxg8BY/cBp4beCsgZS+
         BsLxiG27JJKS1rFGeREWdreIdcTPxRLCsVL5jOcwaNTwRXb0hyj5chGdJIRROA+uyY1T
         BYIrqKM1eWgWJWOQNO6hfX6thxc5kqBuqv9tuZpvk5H/PBTqclZKvySUMIXPMnA5yP4r
         bZEeTLYJxzwXg0LqMixj/BBpGKJ1Fu4ErRouVBEzG8QRySfqFGriDP9PC+J78QbLqJoc
         0ulKrG1URta/k2yTk27ta4cACFbPTWguT1khdMzXlbEAgIOxXZmk0Zn6ejFS9UOG7XV4
         TbGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791354744; x=1791959544;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1Bbm+Jt9jzddxkMmLohq8T3HSBTZ/bcZvbUTV/gvMg8=;
        b=x3wnGget8j/SFY2mGyj6FLoeTtylr0L/9cyvhlVT/B+83xiI+HdlIXwaqxTQZcKsO6
         QQnhLQoGqucLPYwwBGLipmaPnnFv5E+7dukgjVYJLW03fvt8pJv2ojjYieYYiTzjI31A
         wCdHxFqIzaK56Qrg5TZZ6ex8CXGJyOvr3u4zFvHsUxbpzKN7E8tlAWoshJu5BhxV11qZ
         /+Kumqt8MLdXWzaOkBD1QWo/wcwQKakGSf9jCHx2LxWcLeNr/POJyFQcCc0xdVsFEXHB
         cqEAijzAI7gLIOs7CcFwK50zumr7voIBJ2NTOM/b14btCjvRXAEUwkYn04PZCY9oecFT
         KqQQ==
X-Forwarded-Encrypted: i=1; AKwUvBwbHqOTLj8OOZG0hyZeIVs3IZy20mAI3C+ydL1LePeVm/g+9PYhzzLzEqWm7j86MRo/zNIabQoY1EVwy2k=@vger.kernel.org
X-Gm-Message-State: AFuF++nN2sM6VwAHBfSZDtvNr5J5i9IukPlHp316BCX5jRIUsiud3VIN
	eySUh0zK+i6h8s1MQi5ytXHzsmWdR7plSBhc9UhEPWo0A1bw/ziXt/d3Ed9dHm+GMzGHBXrpRkR
	Onhkai/b+YPu7hjpy0Ero4rslGs5JUqM=
X-Gm-Gg: AYBFou2E9hC48S/svffoDFc7iO89iLQcbKOk4JgosOp3S5YfauzOK5RS1oLb0kREiHK
	kAfKQdl65aIk7wQsKp2bETMCXypw1mHg/cTQtm2v5Fx5qBl8rr08IxqgXiMggtQt9lC5hRMB5tm
	tuOlTf7dcB3bUZqGgG2+4u+VTgMDflxCD1hdgWeH4/TU3hUWgdkxq7TG4dK2h+2ELQcOXyVYIfO
	y/OvvQkVXDcSU9WX9WSMNTGI1UjTuGtPMq+Pg/2jTl9GbwBBA/BK2dNt0dTbzXIqsIyv+5aiheN
	wb+o52lgUnwB1l/wcRrseuOrgUJcVY/qkZej8H7iFVaBA3Gf5kYKl3IjtMSSvKjy6sY3
X-Received: by 2002:a05:600c:8115:b0:49e:7a00:b9a5 with SMTP id
 5b1f17b1804b1-4a1802dc9a6mr13837625e9.4.1791354742898; Tue, 06 Oct 2026
 23:32:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261003003136.750633-1-hebaoquan@kylinos.cn> <20261003003136.750633-5-hebaoquan@kylinos.cn>
In-Reply-To: <20261003003136.750633-5-hebaoquan@kylinos.cn>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Wed, 7 Oct 2026 14:32:11 +0800
X-Gm-Features: AclHuK8ioXsPhv8_cUzws9u2NgzD0PJNj5QWO-aICF4rQ9f-Ad3gjVsuRLcIrTg
Message-ID: <CAN_Opa9UncjeNSN9AHkaZPO1b2MqAK7VsDDweig6B9R4GpXVuA@mail.gmail.com>
Subject: Re: [PATCH v4 04/14] mm, swap: add sysfs create interface for xswap
To: Baoquan He <hebaoquan@kylinos.cn>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, chrisl@kernel.org, 
	kasong@tencent.com, hannes@cmpxchg.org, nphamcs@gmail.com, baohua@kernel.org, 
	youngjun.park@lge.com, yosry@kernel.org, shikemeng@huaweicloud.com, 
	chengming.zhou@linux.dev, baoquan.he@linux.dev, david@kernel.org, 
	linux-kernel@vger.kernel.org, klarasmodin@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 3, 2026 at 8:32=E2=80=AFAM Baoquan He <hebaoquan@kylinos.cn> wr=
ote:
>
> xswap devices have no backing storage, so there is no file to swapon.
> Add a sysfs interface to create them directly:
>
>   /sys/kernel/mm/xswap/create    write an optional priority to create
>                                  a device, empty for the default
>
> A new device is created with si->max and nr_clusters_max both equal to
> twice RAM: the cluster_info array is a sparse VM_SPARSE area mapped
> lazily, so an idle device costs nothing. The device shows up in
> /proc/swaps as "xswap<N>".
>
> It takes the highest priority by default. Swapout picks the
> highest-priority device that has room, so a real device ahead of an xswap
> one would take the page directly: zswap would still cache it, but the
> slot on the real device is taken either way, and not taking it is the
> point of xswap. A lower priority can be asked for, not a higher one.
>
> Hibernation device discovery skips xswap devices: they have no bdev
> to carry a resume image.
>
> Signed-off-by: Baoquan He <hebaoquan@kylinos.cn>
> ---
>  mm/swapfile.c | 169 ++++++++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 164 insertions(+), 5 deletions(-)
>
> diff --git a/mm/swapfile.c b/mm/swapfile.c
> index 767d3f46877f..9c204e455ef9 100644
> --- a/mm/swapfile.c
> +++ b/mm/swapfile.c
> @@ -16,6 +16,8 @@
>  #include <linux/kernel_stat.h>
>  #include <linux/swap.h>
>  #include <linux/vmalloc.h>
> +#include <linux/kobject.h>
> +#include <linux/sysfs.h>
>  #include <linux/pagemap.h>
>  #include <linux/namei.h>
>  #include <linux/shmem_fs.h>
> @@ -48,6 +50,13 @@
>  #include "swap_table.h"
>  #include "internal.h"
>  #include "swap.h"
> +#define DEF_SWAP_PRIO  -1
> +
> +/*
> + * Above every real swap device: one ahead of xswap would take the page
> + * directly, and taking that slot is what xswap exists to avoid.
> + */
> +#define DEF_XSWAP_PRIO SWAP_FLAG_PRIO_MASK
>
>  #ifdef CONFIG_XSWAP
>  /*
> @@ -66,7 +75,65 @@ static int xswap_map_clusters(struct swap_info_struct =
*si,
>  static void xswap_unmap_clusters(struct swap_info_struct *si,
>                                  unsigned long start_idx, unsigned long n=
r);
>  static int xswap_mapped_end(pte_t *pte, unsigned long addr, void *data);
> -#endif
> +
> +static int xswap_create(int prio);
> +
> +static ssize_t xswap_create_store(struct kobject *kobj,
> +                                 struct kobj_attribute *attr,
> +                                 const char *buf, size_t count)
> +{
> +       int prio =3D DEF_XSWAP_PRIO;
> +       int err;
> +
> +       if (!capable(CAP_SYS_ADMIN))
> +               return -EPERM;
> +
> +       /* "[<prio>]" is optional; a lower one is allowed, not a higher. =
*/
> +       if (*skip_spaces(buf)) {
> +               err =3D kstrtoint(buf, 10, &prio);
> +               if (err)
> +                       return err;
> +       }
> +
> +       err =3D xswap_create(prio);
> +       if (err < 0)
> +               return err;
> +
> +       return count;
> +}
> +
> +static struct kobj_attribute xswap_create_attr =3D __ATTR(create, 0200, =
NULL,
> +                                                       xswap_create_stor=
e);
> +
> +static struct attribute *xswap_attrs[] =3D {
> +       &xswap_create_attr.attr,
> +       NULL,
> +};
> +
> +static const struct attribute_group xswap_attr_group =3D {
> +       .attrs =3D xswap_attrs,
> +};
> +
> +static struct kobject *xswap_kobj;
> +
> +static void xswap_sysfs_init(void)
> +{
> +       xswap_kobj =3D kobject_create_and_add("xswap", mm_kobj);
> +       if (!xswap_kobj) {
> +               pr_err("xswap: failed to create sysfs kobject\n");
> +               return;
> +       }
> +       if (sysfs_create_group(xswap_kobj, &xswap_attr_group)) {
> +               pr_err("xswap: failed to create sysfs group\n");
> +               kobject_put(xswap_kobj);
> +               xswap_kobj =3D NULL;
> +       }
> +}
> +#else /* !CONFIG_XSWAP */
> +static inline void xswap_sysfs_init(void)
> +{
> +}
> +#endif /* CONFIG_XSWAP */
>
>  static void swap_range_alloc(struct swap_info_struct *si,
>                              unsigned int nr_entries);
> @@ -94,7 +161,6 @@ atomic_t nr_real_swapfiles;
>  EXPORT_SYMBOL_GPL(nr_swap_pages);
>  /* protected with swap_lock. reading in vm_swap_full() doesn't need lock=
 */
>  long total_swap_pages;
> -#define DEF_SWAP_PRIO  -1
>  unsigned long swapfile_maximum_size;
>  #ifdef CONFIG_MIGRATION
>  bool swap_migration_ad_supported;
> @@ -2275,6 +2341,9 @@ static int __find_hibernation_swap_type(dev_t devic=
e, sector_t offset)
>
>                 if (!(sis->flags & SWP_WRITEOK))
>                         continue;
> +               /* xswap has no bdev to match a resume device */
> +               if (sis->flags & SWP_XSWAP)
> +                       continue;
>
>                 if (device =3D=3D sis->bdev->bd_dev) {
>                         struct swap_extent *se =3D first_se(sis);
> @@ -2462,6 +2531,8 @@ int find_first_swap(dev_t *device)
>
>                 if (!(sis->flags & SWP_WRITEOK))
>                         continue;
> +               if (sis->flags & SWP_XSWAP)
> +                       continue;
>                 *device =3D sis->bdev->bd_dev;
>                 spin_unlock(&swap_lock);
>                 return type;
> @@ -3425,7 +3496,8 @@ static void *swap_start(struct seq_file *swap, loff=
_t *pos)
>                 return SEQ_START_TOKEN;
>
>         for (type =3D 0; (si =3D swap_type_to_info(type)); type++) {
> -               if (!(si->swap_file))
> +               if (!si->swap_file &&
> +                   !((si->flags & SWP_XSWAP) && (si->flags & SWP_WRITEOK=
)))
>                         continue;
>                 if (!--l)
>                         return si;
> @@ -3446,7 +3518,8 @@ static void *swap_next(struct seq_file *swap, void =
*v, loff_t *pos)
>
>         ++(*pos);
>         for (; (si =3D swap_type_to_info(type)); type++) {
> -               if (!(si->swap_file))
> +               if (!si->swap_file &&
> +                   !((si->flags & SWP_XSWAP) && (si->flags & SWP_WRITEOK=
)))
>                         continue;
>                 return si;
>         }
> @@ -3488,7 +3561,14 @@ static int swap_show(struct seq_file *swap, void *=
v)
>         inuse =3D K(swap_usage_in_pages(si));
>
>         file =3D si->swap_file;
> -       len =3D seq_file_path(swap, file, " \t\n\\");
> +       if (file)
> +               len =3D seq_file_path(swap, file, " \t\n\\");
> +       else {
> +               char name[16];
> +
> +               len =3D scnprintf(name, sizeof(name), "xswap%d", si->type=
);
> +               seq_puts(swap, name);
> +       }
>         seq_printf(swap, "%*s%s\t%lu\t%s%lu\t%s%d\n",
>                         len < 40 ? 40 - len : 1, " ",
>                         swap_type_str(si),
> @@ -4011,6 +4091,83 @@ static int setup_swap_clusters_info(struct swap_in=
fo_struct *si,
>         return err;
>  }
>
> +#ifdef CONFIG_XSWAP
> +/* Create a file-less xswap device, sized at twice RAM. */
> +static int xswap_create(int prio)
> +{
> +       struct swap_info_struct *si;
> +       unsigned long ram, maxpages;
> +       int error;
> +
> +       if (prio !=3D DEF_XSWAP_PRIO &&
> +           (prio < 0 || prio > SWAP_FLAG_PRIO_MASK))
> +               return -EINVAL;
> +
> +       si =3D alloc_swap_info();
> +       if (IS_ERR(si))
> +               return PTR_ERR(si);
> +
> +       INIT_WORK(&si->discard_work, swap_discard_work);
> +       INIT_WORK(&si->reclaim_work, swap_reclaim_work);
> +
> +       ram =3D totalram_pages();
> +       maxpages =3D min_t(unsigned long, ram * 2, swapfile_maximum_size)=
;
> +       /* si->max is an unsigned int: don't overflow it. */
> +       if (maxpages > UINT_MAX)
> +               maxpages =3D UINT_MAX;
> +       /* Cluster-aligned, so no cluster holds a slot past si->max. */
> +       if (maxpages > SWAPFILE_CLUSTER)
> +               maxpages =3D rounddown(maxpages, SWAPFILE_CLUSTER);
> +       if (maxpages < 2)
> +               maxpages =3D 2;
> +
> +       si->bdev =3D NULL;
> +       si->flags |=3D SWP_XSWAP | SWP_SOLIDSTATE;
> +       si->max =3D maxpages;
> +       si->pages =3D maxpages - 1;
> +       /*
> +        * No backing file: setup_swap_extents() is only reachable from t=
he
> +        * file-backed swapon() path, so set ops here.  Only ops->flags i=
s
> +        * used, by may_enter_fs(); the IO methods are never called becau=
se
> +        * swap_writeout()/swap_read_folio() short circuit xswap.
> +        */
> +       si->ops =3D &swap_bdev_ops;
> +
> +       error =3D setup_swap_clusters_info(si, NULL, maxpages);
> +       if (error)
> +               goto bad_swap;
> +
> +       error =3D zswap_swapon(si->type, si->max);
> +       if (error)
> +               goto bad_swap;
> +
> +       mutex_lock(&swapon_mutex);
> +       si->prio =3D prio;
> +       si->list.prio =3D -si->prio;
> +       si->avail_list.prio =3D -si->prio;
> +       /* si->swap_file stays NULL: this is a file-less device */
> +       enable_swap_info(si);
> +       pr_info("xswap: adding extendable swap type %d (prio %d, %u pages=
, max %lu)\n",
> +               si->type, prio, si->pages, maxpages);
> +       mutex_unlock(&swapon_mutex);
> +       atomic_inc(&proc_poll_event);
> +       wake_up_interruptible(&proc_poll_wait);
> +
> +       return si->type;
> +
> +bad_swap:
> +       kfree(si->global_cluster);
> +       si->global_cluster =3D NULL;
> +       destroy_swap_extents(si, NULL); /* safe: xswap never sets SWP_ACT=
IVATED */
> +       free_swap_cluster_info(si);
> +       si->cluster_info =3D NULL;
> +       spin_lock(&swap_lock);
> +       si->flags =3D 0;
> +       spin_unlock(&swap_lock);
> +       return error;
> +}
> +#endif /* CONFIG_XSWAP */
> +
>  SYSCALL_DEFINE2(swapon, const char __user *, specialfile, int, swap_flag=
s)
>  {
>         struct swap_info_struct *si;
> @@ -4357,6 +4514,8 @@ static int __init swapfile_init(void)
>                 swap_migration_ad_supported =3D true;
>  #endif /* CONFIG_MIGRATION */
>
> +       xswap_sysfs_init();
> +
>         return 0;
>  }
>  subsys_initcall(swapfile_init);
> --
> 2.54.0
>

The create path and priority handling look consistent with the
existing swap priority rules. In particular, an xswap device has no
`swap_file`, and the changes to `swap_show()` / `swap_start()` /
`swap_next()` account for that when enumerating and displaying swap
devices.

The `VM_SPARSE` mapping avoids allocating the full cluster metadata
backing up front, while allowing the mapped range to grow later.

The overcommit interaction (`si->pages` -> `total_swap_pages` ->
`__vm_enough_memory()`) is an open design item already called out in
the cover letter. I don't see it as a reason to block this phase, but
it should remain explicitly tracked.

Acked-by: Kunwu Chan <chentao@kylinos.cn>

Thanks,
Kunwu
