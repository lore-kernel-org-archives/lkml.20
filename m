Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BBA1363083
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 03:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790133985; cv=pass; b=L9+uTwLLPTmnO9W//IeeDB5blxMrQDGrX0k9vEGAZLhONO8Xct3FWYpzVw4AiHxFa5VCVEFKjGEcUjnamCG2whz5GARoCKxC25yV6g9N+gj8pXLbIyr48Y9e5ijQvJxSugcvf4sqnAqAcbadgnGR1hFdbRt1XyZdkIIoRRX5q0w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790133985; c=relaxed/simple;
	bh=Omg5KR0EjDJz43MkkDKOw8fxlg1xqr/mciolGS1iQF0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jN+xqttmF0LyunuQzdC0MfNhXyXekH2GA0GwEkEDL51FW1sJyc8HT4lAzyEjIgAXGuy6m1b3hYXoEZG/ORd4E8ut2PU3ZLBFOB3IRc/TjrCzrjOKkDgXjnMbTUDwe6GXxTJ7NU5uhWbau8eGmXwnKumBkb4/XDsudRyhyOe+ULQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O3wX8Jmy; arc=pass smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O3wX8Jmy"
Received: by mail-yx2-f13.google.com with SMTP id 956f58d0204a3-66e4ab1ba47so263550d50.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 20:26:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790133983; cv=none;
        d=google.com; s=arc-20260327;
        b=pk8RtFYgM54t+PaPB9vJqtFf14WP3ul4czetCQNGUvFi4wdwUDSI0T26oyIEyyGRAp
         NM4k08sCmGTxd/xQSHsB+7/dL9ShXKhJXeA3N5j8eoDbN3+2L2JT+9CON0XPdPUWcLBD
         XLt52kDzXBtzxJluBmBEz2hc1FR8hcZ3bUiQQFy8XpvebmTL7a4PV9gkXoRjjDUo6xID
         0Lh3gggqhtXcRu6kL1sRfazL2xx7yo4FMYnp8xjhiukForCANhAMQW6fQfzmUrE5dSlv
         xLakwTjt0NrzRM/TyeXJLRdGCHiExWi6JZQ8dbzbZRkZsN6kXDOdYQ3DukNVuqw/anjU
         rDxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TlVDedwOJszRf8guxkWv3WTHF9ytNYNROgU4kKLvbvI=;
        fh=Wzn7k7r2pVFLCOplUIHv8jCaYwpSeMzKF4RCPbXoxsE=;
        b=iX1ihRr+VoyNymzGtWs9/dFvLHmhdYQPD2Nl+gmRo0zMNGFFy3PJZ1kKb393/QQ3eB
         CFd6FZ3AsK/fRMMFXygCni+kubl8hbT68lzae3ooT0qmvZ+z78NsL9MHq6r8ZobqNKIa
         Xlg1nyANkcWW7SCR77GnvA6SIMM4omSkL5KP8wZ3Yr88bYLhYnBS0izkQ4+NLjHTvut0
         3zEYsaR+7t5Hdtb4G0QX3s24zC20NX9WV0Z31zvS42xMkOtSe9NGKIvbofTCz59B+ZAY
         j5zzzk+6Rmlcufz7XsilnVheJukyG/ADw4tEbj6pBRzpEvI7pFG2Syc2jQ37vwkIYLR4
         pW4Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790133983; x=1790738783; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TlVDedwOJszRf8guxkWv3WTHF9ytNYNROgU4kKLvbvI=;
        b=O3wX8Jmy3in4bYg4N48YI1jQYERxI3oZ9VMmkx7L0f/2sRFUiuibSWH+QNALp4cM3d
         B21rZ145Uga8zj0YZNZ2H7/yoCvIqvor/E+luwJ70kNUFJEqz0IuUO7EKCZ8qYoHsJZC
         t6bPXcarrzo/f93YWly9qOXagazqg1Ji3TTcDOAR75ENIQ7+07zSkJNvz5VIfdTOlyHL
         Gfadg97Wq4mtWGHzVfNY7CERBRd32XfcN32efulLs8rYjoJbyctqaX4LRC83/d37nQKt
         +P/D6fhyENvSmAl4nCpwF4GkHMyXbLEUSgJsW+NAVUWtw7xkECRXjZQ5FgZODo7TUGlV
         TgyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790133983; x=1790738783;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TlVDedwOJszRf8guxkWv3WTHF9ytNYNROgU4kKLvbvI=;
        b=CD9e4jUPPZRnOCUWYPOvwytCyLbEaSIvzFfssPqzjC//5F48OVFaFv/1ae1DFhxqnr
         oUpuPgKqtKuDNylTL2V74EzibDQMnuoE9eXR/NMSXH9D0nsiSIgDOH6uqUi1SwmtjDZz
         rZ4n8+HGMncvZz7ELiFEZqTyQg3Dpi5k1JQ/8wMUu5xgw2NrH4lVrEb6iv603gx0al1c
         F5Y2NXZPF//8A1VtkDPwlXU4Q6FdlO90WXRfvIZhkS8+T6F1G6lDEEmrqduQo4yYv56E
         Os7qDY1/UYjcSxzHM9ynlN4W7HLymAPN4ihFlsQW1x2IyC7AZz6/WruU1tfCXaKZhrWi
         DPYQ==
X-Forwarded-Encrypted: i=1; AKwUvByrfvOSXq1vmgevXh0PnGSvdh3qax9JofJrBqi3GGxxdKBN4cvAcl5MrglDWJqreXaNDhgptVqEYJcJFwo=@vger.kernel.org
X-Gm-Message-State: AFuF++nbIdfqdjkr4rn/8NLoHMDLGN8Nl/X6Vl+Qe19HSuVQWi/dw6SV
	044FqexCui/T6y3IxUsqODQn2LjxJzjjc90FEbO66PQtyf0B4U0NwyTyO5Le+kZ1/fbDiIXomyk
	XQTaIPaSizX55LmjYAU1CHNmWllvcuas=
X-Gm-Gg: AYBFou1Mtt80xl+mfFEY8aiJHme8Te+lq/R6wJrQKmbq6AKsyuUR3qcu9ebeZx81cvY
	fhDBSsL8CTz2Hkhhk3QAth+3TqSHJrR3pj7ms86QNalGNB78wR9b55jxWBDzm9mrfrKItdk+xyp
	2tNGgATUM+WGwuodVgmzCQ4srJuPWwflCLIKTHKrwVe6D2e+ijFM0svsY9zMjIPD1dWmMNjecax
	MYpdt4zpatw/v5LpeKC44IBSVXmO9NSbO4VWutX2nlP4HWCNtI+D3giD4lKRXJUBfwPaFdtbEhh
	pOT4a2uVm12TqMzPG1u66yLf2ItkagKq5e9gBrwFwdj8fHpTsI/JCP02cnDtUvEfPLIKTlPsrmS
	4wlbW0fDSikdKQNRInvzaKIKwaCYUoeUBTatb8pNAZBg=
X-Received: by 2002:a05:690e:1444:b0:671:484e:5686 with SMTP id
 956f58d0204a3-672d58aaec2mr765014d50.20.1790133983287; Tue, 22 Sep 2026
 20:26:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904235710.16317-1-kartikey406@gmail.com>
In-Reply-To: <20260904235710.16317-1-kartikey406@gmail.com>
From: Deepanshu Kartikey <kartikey406@gmail.com>
Date: Wed, 23 Sep 2026 08:56:12 +0530
X-Gm-Features: AcwNN1Xi3pr9-XNdJGHdMuy6-rNdPWkFL914JN79XvGB6zt_znFheaWLnKBIk6Q
Message-ID: <CADhLXY6+vNT5UaeczdDsXC-wrDeotaj6ngpaKcN+vrjfELDmsw@mail.gmail.com>
Subject: Re: [PATCH] ocfs2: fix use-after-free in o2hb_region_dev_store
To: mark@fasheh.com, jlbec@evilplan.org, joseph.qi@linux.alibaba.com, 
	akpm@linux-foundation.org, brauner@kernel.org, jack@suse.cz
Cc: zzzccc427@gmail.com, ericterminal@gmail.com, ocfs2-devel@lists.linux.dev, 
	christophe.jaillet@wanadoo.fr, linux-kernel@vger.kernel.org, 
	syzbot+3025e3e8fc0b928af8f5@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 5, 2026 at 5:27=E2=80=AFAM Deepanshu Kartikey <kartikey406@gmai=
l.com> wrote:
>
> Concurrent writes to a region's "dev" attribute can race, letting two
> tasks both allocate/free reg->hr_slot_data for the same region and
> causing a use-after-free. Add a per-region mutex to serialize
> o2hb_region_dev_store() against itself and against
> o2hb_region_release().
>
> Fixes: 1d3aa0b97c55 ("ocfs2: port block device access to file")
> Reported-by: syzbot+3025e3e8fc0b928af8f5@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3D3025e3e8fc0b928af8f5
> Tested-by: syzbot+3025e3e8fc0b928af8f5@syzkaller.appspotmail.com
> Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
> ---
>  fs/ocfs2/cluster/heartbeat.c | 23 +++++++++++++++++++----
>  1 file changed, 19 insertions(+), 4 deletions(-)
>
> diff --git a/fs/ocfs2/cluster/heartbeat.c b/fs/ocfs2/cluster/heartbeat.c
> index 1c3def99bb07..6f03de1b6d4a 100644
> --- a/fs/ocfs2/cluster/heartbeat.c
> +++ b/fs/ocfs2/cluster/heartbeat.c
> @@ -273,6 +273,9 @@ struct o2hb_region {
>
>         /* last hb status, 0 for success, other value for error. */
>         int                     hr_last_hb_status;
> +       /* Serializes dev_store() against itself and region_release() */
> +       struct mutex            hr_dev_write_mutex;
> +
>  };
>
>  static inline struct block_device *reg_bdev(struct o2hb_region *reg)
> @@ -1616,7 +1619,10 @@ static void o2hb_region_release(struct config_item=
 *item)
>
>         o2hb_quiesce_timeout(reg);
>         o2net_unregister_and_flush_handler_list(&reg->hr_handler_list);
> +
> +       mutex_lock(&reg->hr_dev_write_mutex);
>         o2hb_unmap_slot_data(reg);
> +       mutex_unlock(&reg->hr_dev_write_mutex);
>
>         if (reg->hr_bdev_file)
>                 fput(reg->hr_bdev_file);
> @@ -1879,9 +1885,6 @@ static ssize_t o2hb_region_dev_store(struct config_=
item *item,
>         ssize_t ret =3D -EINVAL;
>         int live_threshold;
>
> -       if (reg->hr_bdev_file)
> -               return -EINVAL;
> -
>         /* We can't heartbeat without having had our node number
>          * configured yet. */
>         reg->hr_node_num =3D o2nm_this_node();
> @@ -1906,12 +1909,20 @@ static ssize_t o2hb_region_dev_store(struct confi=
g_item *item,
>         if (!S_ISBLK(fd_file(f)->f_mapping->host->i_mode))
>                 return -EINVAL;
>
> +       if (mutex_lock_interruptible(&reg->hr_dev_write_mutex))
> +               return -ERESTARTSYS;
> +
> +       if (reg->hr_bdev_file) {
> +               ret =3D -EINVAL;
> +               goto out_unlock;
> +       }
> +
>         reg->hr_bdev_file =3D bdev_file_open_by_dev(fd_file(f)->f_mapping=
->host->i_rdev,
>                         BLK_OPEN_WRITE | BLK_OPEN_READ, NULL, NULL);
>         if (IS_ERR(reg->hr_bdev_file)) {
>                 ret =3D PTR_ERR(reg->hr_bdev_file);
>                 reg->hr_bdev_file =3D NULL;
> -               return ret;
> +               goto out_unlock;
>         }
>
>         sectsize =3D bdev_logical_block_size(reg_bdev(reg));
> @@ -2029,6 +2040,8 @@ static ssize_t o2hb_region_dev_store(struct config_=
item *item,
>                 fput(reg->hr_bdev_file);
>                 reg->hr_bdev_file =3D NULL;
>         }
> +out_unlock:
> +       mutex_unlock(&reg->hr_dev_write_mutex);
>         return ret;
>  }
>
> @@ -2149,6 +2162,8 @@ static struct config_item *o2hb_heartbeat_group_mak=
e_item(struct config_group *g
>
>         config_item_init_type_name(&reg->hr_item, name, &o2hb_region_type=
);
>
> +       mutex_init(&reg->hr_dev_write_mutex);
> +
>         /* this is the same way to generate msg key as dlm, for local hea=
rtbeat,
>          * name is also the same, so make initial crc value different to =
avoid
>          * message key conflict.
> --
> 2.34.1
>

Gentle Reminder. Please let me know the status of this patch.

Thanks

Deepanshu
