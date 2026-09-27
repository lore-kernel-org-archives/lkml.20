Received: from mail-ed2-f34.google.com (mail-ed2-f34.google.com [74.125.228.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D11F62D0C89
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 08:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790497949; cv=pass; b=h+YYiWVkugUHIQhLqo4l0KoH+cSabH4IBHL8YEasHHUBgZwh4mVnDy97pdOo6ChLs2WcQZtPGs/Qzgn5u4R+wMZWBedxus/DooSj839JwyTdKhlsjO68H4TuiqpOb8gZ+JdENcqWV9uu8MgODuj34jZ1LiQBr6JsVuQwYuUMycQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790497949; c=relaxed/simple;
	bh=Op4TF923PZN2pA1cGRLIOtwN+qOzyRIs41ZrhN5aXbM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gtmSeJJq+vwzbKrKvdOYrM62kfuf0pDFks+ud9QYrPAgX4hYWt94+du/H+w8mXh/n2u2C6gY8bHYCHPwUdR/jk3TvrNi8JJZWpM1Lg0ZpzkAHzmq9n7BlLnyX1diUMLiW4OEQJ1agWq/m95JbViJJaAXSLs8apBMvoKuaE5Kaxs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QbHon6ck; arc=pass smtp.client-ip=74.125.228.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QbHon6ck"
Received: by mail-ed2-f34.google.com with SMTP id 4fb4d7f45d1cf-6aaf2dd01d2so225613a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 01:32:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790497946; cv=none;
        d=google.com; s=arc-20260327;
        b=lnCVy3RDfk/C2TFgrmAVXkXNC6RUfrPBVnzD9aT4M8QO81XgxE3HoOLmM6xGsVPNY9
         M1bGNJR7yM3yuhbTo+tND76bkSKY/QjSeHFO3gIyzKMgje4OPhSZvBq7/sgQX2jXkVO/
         n5CG07zQD61TkH2gU+21qLtrwLxg5NLqacTA7WBqEbeJhkJQiSqb8WY66kpOLDYlThSf
         DYoyFezC2BNyMuApG/HdQnSIrK9MsHiGHJTDlaiiqn/pI7ZUBkiE2BCtppfnj6BqKjUQ
         1Cn0Rdxyt7huR/rXgx/7RBx8FABFzUFsRPweZDUDHYLhQfa3Fsh98WXFeqd/goXeusKn
         G82Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CUxHB4a9JqhTttVxs5UpiiqISs3GJlZ8HmVJ1p06eLc=;
        fh=SZUUUmjq9UKdqy+wJujvth1w30fW9Emze0L0U4hjfJo=;
        b=AueZlL4KohdY/DcwFng9EfHF2ZkjpxI5G5uU04/6qUDZwTFJGOPgh0u1nDBdxAYfTy
         JYVF+/IL4CIgpUkbwQMu5GRMO7wJNQXz9NznSH+xbm0/UIkc+bWCnXi2j77yXruV+vS9
         B26QkG3SfQAL80isSx8w84Xzj9wBwiGcHZyM/+jKlQJbt+7lRnx2LUr2Rg1BXc+j0aQ9
         GBgUq8YjUJWSAXoeHUPEt5+4Nj022hid6pMANzGG/G8U4YqPDiMyUQl4LmoQB13oXiTe
         QGFTpJpIR9AHWpaCJ47RVWA3U06JY6KhE64ewGL2X1wdpv34cyKeMazUqvAtBPS8fM27
         xNRA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790497946; x=1791102746; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CUxHB4a9JqhTttVxs5UpiiqISs3GJlZ8HmVJ1p06eLc=;
        b=QbHon6ckRYMsI0mEyPG+ga7CzGgVyF9FopesfeHbDuuo+B0mBPtvABUOKpz8hHrE/Z
         22qbB19tDzgvAnm3sk92uOWUYPgEbSUNzUxoqRXAmK4x9BREZPTpQGoTxabyAaHVV9r6
         D1HVvCn3Wo3+faeCDEjgnnAyB5ZqCHA7UCom950omUPhW8ngruBHY4wTXlORoOg4IL97
         1z7sWPwwKcZ/m818pdG1nOc+4URg5oLu1wbC/cCrxPhy0Qd8BKth+H+rUdtyspPDT8fY
         UQpMFhN8nJSWBDrpSvdW3V5a7HOLYqLxRdRgyZNxvkOrKCwmQ6UiO4MFYFyRmcfUEkR1
         YKNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790497946; x=1791102746;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CUxHB4a9JqhTttVxs5UpiiqISs3GJlZ8HmVJ1p06eLc=;
        b=Yj54plmYmyhUn4s0MtsprnUYCvDE5uQkLFIISWXHgxbk3YAcrWFY73VGNe/O+N3Yic
         qphyzANzGWAq4N8WrNMQYrztYIaTzeaOio66t879pzpiH2I8kso4qFXDuIdEL3Hn0znK
         Rfpu3lXTaPnv7dQ6jh05Wz7/WR5/Lpv2CCQDMaUgr7XMqecXkZATw/fyY8+0vhJ0/SH5
         ddHqYR+C8xbZ2g1cw7cMwtDvyNVTb6xiJnH0J52rcMvgvlZYWyZR2a0QKhiR0cskejRy
         jB+zQm+IePBLK0EDYyKGbaL3+CY9CIgibYJWO2AuQZj98U2kP0LfSoT7PZz7tAXBoapJ
         aG7g==
X-Forwarded-Encrypted: i=1; AKwUvBwQ7lozlz+6RcNIR191MKSuVRW5+/hgKRa4jtm2YHRt4Z8ugmkCki15naRj1ZvdtkulzykOytyXrrZgfTk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLCQvMcjxrcVmTuYpC6lYtE0L6WlSArjZCBDuGMRtVjJUnH+pNx
	Z8rMzXZeYqgY8Bs5zs61yf8Ynq7Dgh7YcgBgyyd/YTAJSxCHx8nVSq9H9ntgzTyZm1hnggDXcBk
	yJTjtib0bKKfQfIoNOM4Z2hx9IoKstMzTdHD2dv3Y8qQ6
X-Gm-Gg: AYBFou2XvM7GjFRpaAW+PlSBmUgZ/IaP/crdXBRwww6FDuP0n1kihPQanh6Qr+Ghlkt
	NFisJw+gCbc8bv5SePmyYbZpyzFy7LxnLM5qi6m/m/w+OHIwXehrnIgn31KNuwYdh1+NLwLNtIf
	ckHOzJbFZEzVrujxw4IsbsnfHC3ESfOFJVxq48aIljyt2asttge+EX8fGc9IGOtB7exWLidB7ES
	HSo3367ER1p5+i21b268wx9t2GD0azf5gqtj9K1hobX1L+1rn/gLuwEtTk42XjBxhd9enCt5XyA
	LDi4QyVco9s5oUl9o7lYrJ/LgjHmHGLNOSniyc+imhkXgCsYenGsL6EgcQa7F3q86vk4J+Dv3KB
	mZrRyskxOB6ny+B3frYKpDw==
X-Received: by 2002:a05:6402:50c6:b0:6aa:f240:241 with SMTP id
 4fb4d7f45d1cf-6aaf24004c5mr4822258a12.0.1790497945733; Sun, 27 Sep 2026
 01:32:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260926172600.2394088-1-nicoyip.dev@gmail.com> <179049714090.25414.9706892666916736240.b4-review@b4>
In-Reply-To: <179049714090.25414.9706892666916736240.b4-review@b4>
From: Chengfeng Ye <nicoyip.dev@gmail.com>
Date: Sun, 27 Sep 2026 16:32:14 +0800
X-Gm-Features: AclHuK-VVl8oMxw1DKEDd6CYLQdS-fllp6XQOLEY4IQxZkl62p2gPbF455zhrGI
Message-ID: <CAAo+4rXRTJz0wh=Xjv3ME8kfBsdgDC4q-n=M0-Z+uuOWik8fOg@mail.gmail.com>
Subject: Re: [PATCH net] batman-adv: Close OGM aggregation before transmission
To: Sven Eckelmann <sven@narfation.org>
Cc: Marek Lindner <marek.lindner@mailbox.org>, Simon Wunderlich <sw@simonwunderlich.de>, 
	Antonio Quartulli <antonio@mandelbit.com>, b.a.t.m.a.n@lists.open-mesh.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the quick review.

On Sun, Sep 27, 2026 at 4:19=E2=80=AFPM Sven Eckelmann <sven@narfation.org>=
 wrote:
>
> Thanks for the fix.
>
> Please don't submit batman-adv changes to netdev directly. And please sen=
d the
> patch also to the person which introduced the problem. You can use tools =
like
> `b4 prep --auto-to-cc` or just the underlying ./scripts/get_maintainer.pl
>
>     $ b4 mbox 20260926172600.2394088-1-nicoyip.dev@gmail.com
>     $ ./scripts/get_maintainer.pl 20260926172600.2394088-1-nicoyip.dev@gm=
ail.com.mbx
>     Marek Lindner <marek.lindner@mailbox.org> (maintainer:BATMAN ADVANCED=
)
>     Simon Wunderlich <sw@simonwunderlich.de> (maintainer:BATMAN ADVANCED,=
blamed_fixes:1/1=3D100%)
>     Antonio Quartulli <antonio@mandelbit.com> (maintainer:BATMAN ADVANCED=
)
>     Sven Eckelmann <sven@narfation.org> (maintainer:BATMAN ADVANCED,blame=
d_fixes:1/1=3D100%)
>     "Linus L=C3=BCssing" <linus.luessing@c0d3.blue> (blamed_fixes:1/1=3D1=
00%)
>     b.a.t.m.a.n@lists.open-mesh.org (moderated list:BATMAN ADVANCED)
>     linux-kernel@vger.kernel.org (open list)
>
> This change should not go directly to net.git. The target tree must be
> batadv.git

No problem, I will send the v2 to batadv.

>
>     $ ./scripts/get_maintainer.pl --scm 20260926172600.2394088-1-nicoyip.=
dev@gmail.com.mbx
>     [...]
>     git https://git.open-mesh.org/batadv.git
>     git git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>
> The last tree is irrelevant for you because it is really unlikely that Li=
nus
> Torvalds will apply your patch directly.
>
> > The OGM send worker leaves its forwarding packet on forw_bat_list until
> > after batadv_iv_ogm_emit() returns. Aggregation holds forw_bat_list_loc=
k,
> > but emission reads and clones the packet without that lock.
> >
> > CPU 0 can therefore start emitting a queued packet while CPU 1 takes th=
e
> > list lock, finds the same packet and appends another OGM. The sender ca=
n
> > observe the new packet length before the corresponding direct-link flag
> > is set, or clone the skb while its length and payload are being updated=
.
> > This can transmit an OGM with incorrect flags or inconsistent data.
> >
> > KCSAN reported:
> >
> >   BUG: KCSAN: data-race in batadv_iv_ogm_queue_add / batadv_iv_send_out=
standing_bat_ogm_packet
> >   write to 0xffff888100fedcf8 of 2 bytes by interrupt on cpu 1:
> >   read to 0xffff888100fedcf8 of 2 bytes by task 70 on cpu 2:
> >   value changed: 0x00c0 -> 0x00d8
>
> Is there a reproducer and where can I find it?

I will prepare one and send it right away. The KCSAN was triggered
with a kernel-side delay() instrumentation.

> > Set num_packets to BATADV_MAX_AGGREGATION_PACKETS under the list lock
> > before emission. This waits for any ongoing append and makes the existi=
ng
> > aggregation limit check reject further appends before inspecting mutabl=
e
> > OGM flags. Emission walks packet_len rather than num_packets, so the
> > queued contents are still sent normally. Keep the packet on the list so
> > interface purging can still wait for the worker and retain its existing
> > ownership of the packet when freeing it.
>
> I might be wrong but this reads a little bit like it was written by an LL=
M. If
> this is the case, please think about following the annotation style descr=
ibed
> in https://docs.kernel.org/process/coding-assistants.html

Yes, it was generated with gpt-6-Astra, and I will add the missing tag
on v2 following the doc.

> > Backports before Linux 6.15 need count-handling adaptation.
>
> This is wrong. You are depending on 434becf57bdc ("batman-adv: Limit numb=
er of
> aggregated packets directly") and not the counting adaption. Of course, f=
or
> 4.10.x-6.14.x, you also need to change the BATADV_MAX_AGGREGATION_PACKETS=
 to
> BITS_PER_TYPE(forw_packet->direct_link_flags)
> And it doesn't belong in the commit message (like this). Please annotate =
the
> dependencies as described in
> https://docs.kernel.org/process/stable-kernel-rules.html#stable-kernel-ru=
les
>
> > Fixes: 9b4aec647a92 ("batman-adv: fix rare race conditions on interface=
 removal")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Chengfeng Ye <nicoyip.dev@gmail.com>
> >
> > diff --git a/net/batman-adv/bat_iv_ogm.c b/net/batman-adv/bat_iv_ogm.c
> > index 53fbdbbe8f4f7..59847299a1237 100644
> > --- a/net/batman-adv/bat_iv_ogm.c
> > +++ b/net/batman-adv/bat_iv_ogm.c
> > @@ -1909,6 +1909,10 @@ static void batadv_iv_send_outstanding_bat_ogm_p=
acket(struct work_struct *work)
> >               goto out;
> >       }
> >
> > +     spin_lock_bh(&bat_priv->forw_bat_list_lock);
> > +     forw_packet->num_packets =3D BATADV_MAX_AGGREGATION_PACKETS;
> > +     spin_unlock_bh(&bat_priv->forw_bat_list_lock);
> > +
>
> Can you add a small comment above like "mark aggregate as full before for=
cing
> emit" (or something similar).

No problem, the commit message and the comment will be adjusted accordingly=
.

> --
> Sven Eckelmann <sven@narfation.org>
