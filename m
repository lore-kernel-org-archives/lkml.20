Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD8A51FCBC
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 15:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791905344; cv=pass; b=j4xttvFOTheHDuSbdk87EGHzHT6ZwAWJyCZkd0/P1p/Qopx6qUMbm859Z/gKf0K8BmcKtNMrwGpgRBUhffrHtzWBGKowbBzfQmSOfTby1ouOOHV0+AJaVIosuV4wQ7v/zYTzToKtUfi6W8uyjJ/IRUTz2iarCyU18jRH1zmIg5U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791905344; c=relaxed/simple;
	bh=8F4y4gM41vfcvr2/5sX90kjdwyfO5OISRkrKigX6rOc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OKDIosijcVEmO5HfPMkI+LrwUBg677yYvr+NujEG9t2mGnQ/twz4QeMR6E0/BHjTJFvDMfDWeE+wlp6O/8y5h8twTZUQXgIuujcJJmudzDlTKLr/m+XtDyDwFA276SU2B/D52DJQ7Rk6zrX3rxMQ5emvRyLtP8PPqiGY94lu9nM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nGRsgDOZ; arc=pass smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nGRsgDOZ"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-8ac8a2ac52bso31337827b3.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:29:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791905342; cv=none;
        d=google.com; s=arc-20260327;
        b=pceFkidOqnDDp5MmRlkUK4EhjBmngTnDp1/zFSOmMQMKRSeKN90H7gbSrQ/bBGO2/D
         nKAIpigOp2KAjTwGpl35BlyY0x6CrTdiyWKBIQacRTQORi+UdtCwq5aH+sIC9Wbnh/fN
         m2lfYvTMZgB4v7loB63yFQPAYkaC5Tl5wGO0IASe2x1akEP8dnwdbXnAKiEeC02DW2nH
         vE33NWQ36Qi2WVRFvXtz3xbjjL2CJbdAeDRUUwhDJPbQu0QI2PbBRLWB+bEzGQgMoZRr
         iW+Oc8BT9hZ2zgNhgiC9X7ScCkoPQI6Gkuz1WqSSdf55hMkBA8rOJkoacUOIKxiKhA3Q
         Go2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ou8JCGhLWABLlFxIIwwM7Of4HwOSgAx7oyD41bQSrEU=;
        fh=ESD+R93rXB5ceK6yjOWQ5be/ZbAku73VRhdLex+GDG8=;
        b=nPpmiGGyNJ0RWXB5mr7vI44/r9+f0PB0xAH6eOye/MW3t/OJonxssbz7Y87L95cJvH
         cFG2Dh6OwItHgcaJzlP0+Xm5mBBaFZQNnxgm7lB63xjOT7FYdUgVJBN4C7nrtO3xAQ0o
         3wU3NHo0Lz//DEap20i8g0kCTrX6ajvSA9I0N6q22Nywsx/F9g2+FSVbzM2I3E34A1w0
         KxWymkFd3xlmvHA9IqVhfZ/BYZ16l4ZhNSZNVWV5biRlhG3gytEkodYTi9UFVXeuyibj
         zmu2lSCf/u8/4/X5QuOBgTK8sdU48GpqzZ2vQ0jBUrQ2S1zgoBcDc6IBmlLH6IOBqBd+
         THVw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791905342; x=1792510142; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ou8JCGhLWABLlFxIIwwM7Of4HwOSgAx7oyD41bQSrEU=;
        b=nGRsgDOZHbUcVrnszhuSYWi8iKpFyFk0xn/U0SQyRGD2PV9n0z5n7KkEHiYXv2wrd5
         dr+erH/SAPGKhhcZ0FPwMUkqAxUZDyxspndRUnW4WTUU3pj41pc+nJXydgIC5XcmCiif
         aa/UxqUa1H3K5Zo77pZqrhvGnFzulPp+mWBw4V9RFQX7c4Y1XIjeAlR0cp/qrPiDcQI4
         5mc24JV2UpWZyfmS7hGcZ3uiuEFMwoBp6Cb5J7U3U24ALFiWlMP1zYRv3ZqA0OXzK7Qn
         quBqskofQ4dtzZNyAbboQFTIkwlEc9EByiy3NMgpiZ/D/6fajbx/7qTpgGr37K4LqFaC
         tXRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791905342; x=1792510142;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ou8JCGhLWABLlFxIIwwM7Of4HwOSgAx7oyD41bQSrEU=;
        b=lRZn0qp6n84cgy+L4kXw4dBFCtsFEguR0ThHDlOeiikTPyoKdwmyLChuLLefG9aRjQ
         NeZPfUJxRyQQnyXScOrZOcrUQF3AS+2WGAp6vQQaj/xibyLvamlmV12U0brgAioa4ibr
         e/KxMciyCfatw3yY5eojNHp5Mi9dXjA5MeIKLOzseLpodbugIC40ylQmjvnyIdqJ+BXY
         d60CqkYZubXpX9y27WKtMsReJpECgHWrxXx3qTs4I5uZlleIxvjGRPekc2QSAdGJY9qc
         4InMPOmWLePWB1JDZO/K4o3iIcZAPfAFmm7Nn0d6kEiboV7RbSINlCHX51EkXs+UGo0z
         0fnw==
X-Forwarded-Encrypted: i=1; AKwUvBzYTb7OdCaLBLo4k58l1kIQ4+HyiqYddQjXI5B8XWiaJJ0b3aO5/coW6wuazgdwBcmdpSchP+JyJnhUsyM=@vger.kernel.org
X-Gm-Message-State: AFq9FYK+0adGMmLumEgsCQMo+9kWObmMYoVtZZgANOEH5pF038Qzp25I
	xKjTgMxvLkp4lzbd3ONXfzM+rPCjZQtqfWdmko4Q+KIYydiOawMzo8Yq/VkQc5fPySQzP4qV9GM
	DREQvbhPUKIU8kHGRfICQFVJE0nK3ocM=
X-Gm-Gg: AYBFou1NlDl6OYB45EEYmfL24LJhcL3ZzeCyLUq8ujvVQ6LqgDbWps6fRkj0u6oXTXT
	XIM+mdXn3NWPb4U9GJWqOCvVrlHnVXtuFyiL+/5iHGynFfhZPN7bSQ4jH/04IdOLbq6AkMmrmZV
	5MZDnEIVDgUvqP59wvC05Jb+Wyzi3yF1VA1mvG96P92oDa1YD9M+qAVJ4BOnfmYxTt/r0dhFLSq
	3bROV+7HnGAQQRSWQwH4tY5iljC5EiwvKHxfNHc6fhPPMP2gSiunkPIClQuhQK7kk52ydZkviLq
	AL5ik7q2Ao4JGJ6vIGJSvmkkU/6a9tjSvfAGWLSyDcvoQl02FLq+GVLU4Q==
X-Received: by 2002:a05:690c:6b01:b0:8ae:98ce:5497 with SMTP id
 00721157ae682-8b07d04696emr43402117b3.0.1791905341571; Tue, 13 Oct 2026
 08:29:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <pm-ocfs2-objects-candidate-0065-v4-f45e5cef38dd587b2cfd@gmail.com>
 <f8f5ef83-6f71-43c7-8adf-c1d3adb15e8e@linux.alibaba.com>
In-Reply-To: <f8f5ef83-6f71-43c7-8adf-c1d3adb15e8e@linux.alibaba.com>
From: Cen Zhang <zzzccc427@gmail.com>
Date: Tue, 13 Oct 2026 23:28:50 +0800
X-Gm-Features: AclHuK-pA19AS4y6365Cz2aBlJYpfr4n5ENcqDbiPLkhBY7-RumD28kt5CFUd7Q
Message-ID: <CAFRLqsXENKDVSkmEVOzBS4TaN1PTJ8QgbO7XOUkcoPOcY+D_eg@mail.gmail.com>
Subject: Re: [PATCH] ocfs2: unlink socket containers before releasing their nodes
To: Joseph Qi <joseph.qi@linux.alibaba.com>
Cc: mark@fasheh.com, jlbec@evilplan.org, heming.zhao@suse.com, kees@kernel.org, 
	kuba@kernel.org, akpm@linux-foundation.org, sunil.mushran@oracle.com, 
	ocfs2-devel@lists.linux.dev, linux-kernel@vger.kernel.org, 
	baijiaju1990@gmail.com, jjzuming@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Joseph,

Joseph Qi <joseph.qi@linux.alibaba.com> =E4=BA=8E2026=E5=B9=B410=E6=9C=8813=
=E6=97=A5=E5=91=A8=E4=BA=8C 20:10=E5=86=99=E9=81=93=EF=BC=9A
>
>
>
> On 10/12/26 9:30 AM, Cen Zhang wrote:
> > A socket container's node must remain alive while the container is on
> > sock_containers. The debugfs formatter reads sc_node under
> > o2net_debug_lock without taking a node reference, but sc_kref_release()
> > drops the node reference and clears sc_node before taking that lock to
> > unlink the container.
> >
> > With CONFIG_DEBUG_FS enabled, removing a disconnected remote node while
> > a synchronous sender releases its last socket-container reference can
> > expose the freed node to a debugfs reader. The following order is possi=
ble:
> >
> > 1. o2net_send_message_vec() holds a reference acquired under nn_lock.
> >    o2net_disconnect_node() detaches the connection and flushes o2net_wq=
,
> >    draining the socket callbacks and workers. The synchronous sender's
> >    reference survives because its caller runs outside that workqueue.
> > 2. The sender's final sc_put() enters sc_kref_release() and calls
> >    o2nm_undepend_item(). Configfs rmdir can now pass the dependency che=
ck,
> >    call o2nm_node_group_drop_item(), and drop its node item references.
> >    Its disconnect flush does not wait for the sender's release.
> > 3. The sender calls o2nm_node_put(), freeing the node while the contain=
er
> >    is still listed and sc_node has not yet been cleared.
> > 4. Before the sender clears sc_node or unlinks the container, a debugfs
> >    reader selects it in sc_seq_show() under o2net_debug_lock and format=
s
> >    sc_node->nd_name, reading the freed allocation.
> >
>
> Better to change the patch title to "ocfs2/cluster: xxx"
>
> Please describe the race in a sequence diagram.
>
> > Move o2net_debug_del_sc() before o2nm_node_put(). Unlinking under the
> > existing debug lock waits for an active formatter to finish and prevent=
s
> > later readers from selecting the container. The retained node reference
> > therefore covers every debugfs node access, including the node number
> > read by the stats formatter. The lock is released before the node put.
> >
> > KASAN report as below:
> >
> >     BUG: KASAN: slab-use-after-free in string+0x42b/0x470
> >     Read of size 1 at addr ffff88810f56fc90 by task python3/506
> >
> >     CPU: 0 UID: 0 PID: 506 Comm: python3 Not tainted 7.3.0-rc4-next-202=
60921-pmb-ocfs2-functional-v1+ #1 PREEMPT(lazy)
> >     Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX + PIIX, arch_caps fi=
x, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
> >     Call Trace:
> >      <TASK>
> >      dump_stack_lvl+0x93/0xd0
> >      print_report+0xce/0x630
> >      kasan_report+0xe0/0x110
> >      string+0x42b/0x470
> >      vsnprintf+0x330/0x1110
> >      seq_printf+0x1a8/0x260
> >      sc_seq_show+0x604/0x9f0
> >      seq_read_iter+0x480/0x1110
> >      seq_read+0x362/0x5a0
> >      full_proxy_read+0x11f/0x180
> >      vfs_read+0x1a0/0xc20
> >      ksys_read+0x111/0x200
> >      do_syscall_64+0x114/0x620
> >      entry_SYSCALL_64_after_hwframe+0x77/0x7f
> >
> > (User register dump omitted.)
> >
> >      </TASK>
> >
> >     Allocated by task 497:
> >      kasan_save_stack+0x33/0x60
> >      kasan_save_track+0x14/0x30
> >      __kasan_kmalloc+0xaa/0xb0
> >      __kmalloc_cache_noprof+0x28d/0x610
> >      o2nm_node_group_make_item+0xea/0x1a0
> >      configfs_mkdir+0x762/0xca0
> >      vfs_mkdir+0x399/0x7e0
> >      filename_mkdirat+0x129/0x450
> >      __x64_sys_mkdir+0x70/0xa0
> >      do_syscall_64+0x114/0x620
> >      entry_SYSCALL_64_after_hwframe+0x77/0x7f
> >
> >     Freed by task 505:
> >      kasan_save_stack+0x33/0x60
> >      kasan_save_track+0x14/0x30
> >      kasan_save_free_info+0x3b/0x60
> >      __kasan_slab_free+0x5f/0x80
> >      kfree+0x308/0x580
> >      config_item_cleanup+0x14b/0x230
> >      config_item_put+0x79/0x90
> >      sc_put+0x454/0x6e0
> >      o2net_send_message_vec+0x63d/0x1560
> >      o2net_send_message+0xa6/0xe0
> >      validation_send_write+0x17f/0x1d0
> >      full_proxy_write+0x11f/0x180
> >      vfs_write+0x25a/0x1010
> >      ksys_write+0x111/0x200
> >      do_syscall_64+0x114/0x620
> >      entry_SYSCALL_64_after_hwframe+0x77/0x7f
> >
> >     The buggy address belongs to the object at ffff88810f56fc00
> >      which belongs to the cache kmalloc-512 of size 512
> >     The buggy address is located 144 bytes inside of
> >      freed 512-byte region [ffff88810f56fc00, ffff88810f56fe00)
> >
> > (Page and shadow-memory dumps omitted.)
> >
> > Fixes: 2309e9e040fe ("ocfs2/net: Add debug interface to o2net")
> > Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
> > Assisted-by: LLM
> >
> > ---
> > diff --git a/fs/ocfs2/cluster/tcp.c b/fs/ocfs2/cluster/tcp.c
> > index 8b3830b601ba..213ee7392712 100644
> > --- a/fs/ocfs2/cluster/tcp.c
> > +++ b/fs/ocfs2/cluster/tcp.c
> > @@ -399,11 +399,13 @@ static void sc_kref_release(struct kref *kref)
> >       }
> >
> >       o2nm_undepend_item(&sc->sc_node->nd_item);
> > -     o2nm_node_put(sc->sc_node);
> > -     sc->sc_node =3D NULL;
> >
> > +     /* Keep the node alive until debugfs readers finish. */
> >       o2net_debug_del_sc(sc);
> >
> > +     o2nm_node_put(sc->sc_node);
> > +     sc->sc_node =3D NULL;
> > +
> >       if (sc->sc_page)
> >               __free_page(sc->sc_page);
> >       kfree(sc);
>
> It seems 'sc->sc_sock' also has the same risk.
> So a smaller fix may be:
>
> diff --git a/fs/ocfs2/cluster/tcp.c b/fs/ocfs2/cluster/tcp.c
> index 8b3830b601ba..0eaf2c4a6989 100644
> --- a/fs/ocfs2/cluster/tcp.c
> +++ b/fs/ocfs2/cluster/tcp.c
> @@ -393,6 +393,9 @@ static void sc_kref_release(struct kref *kref)
>
>         sclog(sc, "releasing\n");
>
> +       /* Unlink before freeing anything the debugfs readers dereference=
. */
> +       o2net_debug_del_sc(sc);
> +
>         if (sc->sc_sock) {
>                 sock_release(sc->sc_sock);
>                 sc->sc_sock =3D NULL;
> @@ -402,8 +405,6 @@ static void sc_kref_release(struct kref *kref)
>         o2nm_node_put(sc->sc_node);
>         sc->sc_node =3D NULL;
>
> -       o2net_debug_del_sc(sc);
> -
>         if (sc->sc_page)
>                 __free_page(sc->sc_page);
>         kfree(sc);
>
> Thanks,
> Joseph


Thanks for the review and the suggestions.

I'll also address them in v2.

Best regards,
Cen
