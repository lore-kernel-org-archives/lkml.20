Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794474857;
	b=j5P3La0ciVImVuFMSQqLgp1VVKXDy8yFn9de05T37goLh+AyCcrtcMiPY/zKbuKHSL6B
	 5Q3COikHwR9LGy/mC9L4ZZAnR5c/2vmz5JePCJDdviS9cljttW0AwkTIcFvVfDoV8vggt
	 jBP67FuKynej6NVvwr7I4rwY2/2X2fD+ki2rM2n2WA+TKeMk/mMR5HkN9dnVLalW9OSL3
	 LvV7bBaiwoD/5ByNJVE2onflO5lAK5/pZ7KTgACRQG7iqfwjNROb8sy5xDazuGNXSQGAX
	 e8ZAKCdZFqX66LZN+G/5r8I2pWMAcJZ0t6o8KdzMScmAhVyub/UcwmTNy1XobBdm9kw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794474857;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=VoI2Gu86mrP3eADBphQdgZoK4/GEKT8FnpX3YKlKF2k=;
	b=eaG/OCJv4H7i/2tgOBWuXVeBYxEM73AATk+N8SKvefzmSJt/ggl4W1C2GUC/KMQwNneQ
	 nbO/cpryr9uJvS4jAqVDbMlSvRC+1NLQtM8CaGTHD1H8/uiyLXdXs2rHyr6QsphHy55tG
	 HaMvXKufr2bejwRvvlZaAaDGCr5OgIxHQRmMUVAMAledoX7yY5WmONl/tER48f/MP8MqP
	 JtHXSLEznIL00b7jcPzjOVHCE8PMSY3OGMZIyRjVraAkMMxJEJsbr77Uqre98upeybsrB
	 m5R0fDZ1bchsN0kfoEYiHAqAgCLrHfgbOg5KseCq5VRCpXUAKISn//l35NWPAZgp/Ng==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0gFtwHnS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D50D606A323
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:14:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D50D606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0gFtwHnS
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so31495435e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:14:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794474855; cv=none;
        d=google.com; s=arc-20260327;
        b=YG+1jMxExbj1HpgigwqzLdVfQr8Kxf1WdUiet64cjjoaiuxNAXC4vfgjz0C/uBUFbb
         7nlGLnofFv3WA8N8ie/ihXktgGCMfw7PzLwmqCknolTQet8TV2YZie3ctrLbXm5IjpdF
         jF/0At5NLaIzFpQ/lprlWZIGqz8XR0SBfWwBw3QoKj6gJho9QUho/YedvMtSJ7QL3X5n
         T6BWrCAf9raKN3Y7L3SGafoUR50mQ3LL0iC3vftrDCOHVGSm6HXB+RCdcFqGonMnr98s
         VXJY6Y2lTvI9Tmxj/pvlauXlmjI8wf8+OqeXwMkhtuIXBYCcI+znbXF8CLSF9OoPFSOi
         EMUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VoI2Gu86mrP3eADBphQdgZoK4/GEKT8FnpX3YKlKF2k=;
        fh=qo8sq9zo1cVKnjO+hez7BMoPoYKCIKVGBV08gQ1f3WA=;
        b=OHB7gOqcB7qRz+mFxURZ2D1KKFLG+EyU+58O3nyWEYMOfhZssMPGnov/as8x1phGXI
         wj/ZnZICWyhqzbhSd0b8aGfUXJI60iCHU2n8xsdh9GRP3ZP76pPdpF9N13tJH8blgmVk
         enShssebybljHKvIiUIrQlc8elbF+Ryfl5pWI9rxCnW2wV89JBNkdf3V6NmDqzZ1J2Jp
         nDeSejpMOzgt2Q5mabKdHayk2HEaUyy8PZLWUKXdY215oektyBvfUXpMwHxbBvKtrCHz
         yxP+JT5JDrhACo/AJmCi4OB1p4/Nmu/jxsI1Qf5amMnPAhEOynXgHggoyu9r6mrmw4Iz
         pyrA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794474855; x=1795079655; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VoI2Gu86mrP3eADBphQdgZoK4/GEKT8FnpX3YKlKF2k=;
        b=0gFtwHnShn2C/o+jiCRQB3k3nLuLlZfzt/D8Wz8fDaj+97nYCBYAj93JDHHnuxmZ9S
         LNyD1rvlKEHOICKnY0tqrE2xszteV92SBlwryynUtDx78+ea85x246PdiX0AATBnESLY
         /D9C/pql2FShRGuLt1GvDlC7MsbjO8/+jjSrSi92gCijPjleqk5HlOX/BAC0ckkTqKAG
         2ThgiHzd0PJ/i9aFGz1EtrVJ2BAEtwWu7+KGs0qCCctVkpxdm/yLmiiOd0fynb4UWAt9
         dx3SL+8+eOxQTv0uVRpkhofwH4ZUiEgQnvif0J9C7wafS7hYsPM7Axcy/S1PuYdX9Hvk
         D10w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794474855; x=1795079655;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VoI2Gu86mrP3eADBphQdgZoK4/GEKT8FnpX3YKlKF2k=;
        b=cVh4clsc0+qPIJ8Ry4zCjdPX/zHKFwLZVFh4dfXITp/AWO+fVg3ABdpaU0Vmhtb+s3
         ZcHa14KuFD46ZO2ZtLT0ez3d165Cgj2U/hXFgtRYBpLG5buGNDuYy9mol0Ap7Q6w+sb5
         fH7briH0tT7nvfdx4tZZEdCgI8DV9bC8DBveMv/l0rjIj6jvWDfrEQj1ECxLItJPSU+r
         PsQMJf4niEDwf1hXpSalMRqul5WVpyrmMkEyja6mhEqqCK5YM0f/RNu243qtsCQgHqPk
         Z/sQrvHZ0I+pU3QNq1jCU/Hq6pj+3dUEqdR+JTzqDyH+01ZIbeSji5jELNA5s+jRwkcx
         JebA==
X-Forwarded-Encrypted: i=1; AL+hErFS3Uj87Ih918AnbLOwTOgFOPDo7zVrciwyLPoNCQCZzdFJDj/I6uBeeEeOr9JbtyPIaw5eUikaa646XI0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/cV3tFpiUPeGMy2Ja5SPG4q9DlCBehlAu89+tJ34xYWPTrS8z1
	Yqssm0rtfvarem2wGqoVz4WokIDCp+yMk+DKo1QQo/cLbBDY/YYto7A//DMG65iZ1+er0Qq2ukv
	tJF730t4OIvNzY06khUINzsDKYmamgY4=
X-Gm-Gg: AYBFou3Peov+vR6yuRKhmkIaH8xQUZ8JZFas49vA5AoHLbpJgZ0/iIgfDR6BbpvnWvA
	2u6zdUOgP/jUMmiwps/0FovJecli3XLq+JjUNxlP4mKSRPdzvjI7e968ooLS6ySiNQb2pgJHh4l
	V1yKDgJlQej0bd7A0aCox4MEGzNjSXuLAGysGNnCB2aa1q2aOUvdKhilDteHTELDgZ6x25nmtUE
	JfjeRxMg1AFi3j/JzSss1WxxlV2MBTfKHtSpir2Bv8TY30/50hVwtBIwZFcKY/NeoxCOveeplBj
	9+Z9WNJ7250BnGuDmE4V3nr6JcZsg9B4UzlOfCTCMMbz6F0YylNMI3ZM2F2hS7v/arQsoPhYaIR
	cfDTq9pZlz6l0ujrazbgn4ID5TN9Ex6qQCgy0FZOO6NsnIqNxmhYZ3Hivlbk=
X-Received: by 2002:a05:600c:4ecb:b0:4b9:ff69:19ac with SMTP id
 5b1f17b1804b1-4ba093811d3mr86501335e9.11.1794474854734; Thu, 12 Nov 2026
 01:14:14 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111145949.70845-1-mathieu.desnoyers@efficios.com> <20261111145949.70845-4-mathieu.desnoyers@efficios.com>
In-Reply-To: <20261111145949.70845-4-mathieu.desnoyers@efficios.com>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Thu, 12 Nov 2026 17:14:02 +0800
X-Gm-Features: AclHuK_dWrW_xJeY20DnlDcR725zYdAhmbejoXx7T_vAQBflKdgL48xqw5EE9N8
Message-ID: <CAN_Opa__N0OXoimufuJ5bNgVtYtqc2KTC=Cj3a6WiCUJ0ZRzDw@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] srcu: Make atomic SRCU readers NMI-safe
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: "Paul E . McKenney" <paulmck@kernel.org>, linux-kernel@vger.kernel.org, 
	David Woodhouse <dwmw2@infradead.org>, Frederic Weisbecker <frederic@kernel.org>, 
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Josh Triplett <josh@joshtriplett.org>, Boqun Feng <boqun@kernel.org>, 
	Uladzislau Rezki <urezki@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Lai Jiangshan <jiangshanlai@gmail.com>, Zqiang <qiang.zhang@linux.dev>, 
	Davidlohr Bueso <dave@stgolabs.net>, Puranjay Mohan <puranjay@kernel.org>, rcu@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Kunwu Chan <chentao@kylinos.cn>

On Wed, Nov 11, 2026 at 10:59=E2=80=AFPM Mathieu Desnoyers
<mathieu.desnoyers@efficios.com> wrote:
>
> Atomic SRCU readers count themselves with __srcu_read_lock(), whose
> this_cpu_inc() is not NMI-safe on every architecture. With
> CONFIG_PROVE_RCU, which lockdep enables, __srcu_check_read_flavor() also
> warns when an atomic reader runs in NMI. So an NMI handler cannot use
> atomic SRCU, while a tracer or a BPF program may need to read a
> structure that atomic SRCU protects.
>
> Count atomic readers with __srcu_read_lock_nmisafe() and
> __srcu_read_unlock_nmisafe() instead. They use NMI-safe increments on
> the architectures that need them, and keep the full barriers that
> synchronize_srcu_atomic() pairs with. The __srcu_read_lock_fast()
> helpers have no such barriers: they rely on a grace period that calls
> synchronize_rcu(), which synchronize_srcu_atomic() cannot do while it
> spins.
>
> Also accept the atomic flavor in NMI in __srcu_check_read_flavor().
> Annotate an atomic reader in NMI as a trylock for lockdep, as
> srcu_read_lock_nmisafe() does. An NMI can interrupt lockdep itself, and
> lockdep then reports any other acquisition of a lock that a grace
> period has used.
>
> On the architectures that need NMI-safe counters, every atomic reader
> now pays an atomic increment at lock and at unlock.
>
> Suggested-by: Paul E. McKenney <paulmck@kernel.org>
> Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> ---
>  include/linux/srcu.h  | 18 ++++++++++++++----
>  kernel/rcu/srcutree.c |  3 ++-
>  2 files changed, 16 insertions(+), 5 deletions(-)
>
> diff --git a/include/linux/srcu.h b/include/linux/srcu.h
> index d4dcaeb83e2b..e3b541ceb8dd 100644
> --- a/include/linux/srcu.h
> +++ b/include/linux/srcu.h
> @@ -93,7 +93,7 @@ int init_srcu_struct_atomic(struct srcu_struct *ssp);
>  //                                     0x04            // SRCU-lite is n=
o longer with us.
>  #define SRCU_READ_FLAVOR_FAST          0x04            // srcu_read_lock=
_fast(), also NMI-safe.
>  #define SRCU_READ_FLAVOR_FAST_UPDOWN   0x08            // srcu_read_lock=
_fast_updown().
> -#define SRCU_READ_FLAVOR_ATOMIC                0x10            // srcu_r=
ead_lock_atomic().
> +#define SRCU_READ_FLAVOR_ATOMIC                0x10            // srcu_r=
ead_lock_atomic(), also NMI-safe.
>  #define SRCU_READ_FLAVOR_ALL           (SRCU_READ_FLAVOR_NORMAL | SRCU_R=
EAD_FLAVOR_NMI | \
>                                          SRCU_READ_FLAVOR_FAST | SRCU_REA=
D_FLAVOR_FAST_UPDOWN | \
>                                          SRCU_READ_FLAVOR_ATOMIC)
> @@ -372,6 +372,9 @@ static inline int srcu_read_lock(struct srcu_struct *=
ssp)
>   * The lock and matching srcu_read_unlock_atomic() must be invoked on
>   * the same CPU, from the same context; passing the return value to
>   * another task is not permitted for this flavor.
> + *
> + * This function is NMI-safe, in a manner similar to
> + * srcu_read_lock_nmisafe().
>   */
>  static inline int srcu_read_lock_atomic(struct srcu_struct *ssp)
>         __acquires_shared(ssp)
> @@ -391,8 +394,15 @@ static inline int srcu_read_lock_atomic(struct srcu_=
struct *ssp)
>         if (in_task())
>                 non_block_start();
>         srcu_check_read_flavor(ssp, SRCU_READ_FLAVOR_ATOMIC);
> -       retval =3D __srcu_read_lock(ssp);
> -       srcu_lock_acquire(&ssp->dep_map);
> +       retval =3D __srcu_read_lock_nmisafe(ssp);
> +       /*
> +        * An NMI may interrupt lockdep itself.  Annotate it as a trylock
> +        * there, as srcu_read_lock_nmisafe() does.
> +        */
> +       if (in_nmi())
> +               rcu_try_lock_acquire(&ssp->dep_map);
> +       else
> +               srcu_lock_acquire(&ssp->dep_map);
>         return retval;
>  }
>
> @@ -599,7 +609,7 @@ static inline void srcu_read_unlock_atomic(struct src=
u_struct *ssp, int idx)
>         WARN_ON_ONCE(idx & ~0x1);
>         srcu_check_read_flavor(ssp, SRCU_READ_FLAVOR_ATOMIC);
>         srcu_lock_release(&ssp->dep_map);
> -       __srcu_read_unlock(ssp, idx);
> +       __srcu_read_unlock_nmisafe(ssp, idx);
>         if (in_task())
>                 non_block_end();
>         preempt_enable();
> diff --git a/kernel/rcu/srcutree.c b/kernel/rcu/srcutree.c
> index 8075da4b1bb5..8fa366861dcc 100644
> --- a/kernel/rcu/srcutree.c
> +++ b/kernel/rcu/srcutree.c
> @@ -828,7 +828,8 @@ void __srcu_check_read_flavor(struct srcu_struct *ssp=
, int read_flavor)
>
>         /* NMI-unsafe use in NMI is a bad sign, as is multi-bit read_flav=
or values. */
>         WARN_ON_ONCE(read_flavor !=3D SRCU_READ_FLAVOR_NMI &&
> -                    read_flavor !=3D SRCU_READ_FLAVOR_FAST && in_nmi());
> +                    read_flavor !=3D SRCU_READ_FLAVOR_FAST &&
> +                    read_flavor !=3D SRCU_READ_FLAVOR_ATOMIC && in_nmi()=
);
>         WARN_ON_ONCE(read_flavor & (read_flavor - 1));
>
>         sdp =3D raw_cpu_ptr(ssp->sda);
> --
> 2.47.3
>
