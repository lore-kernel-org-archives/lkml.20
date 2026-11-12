Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794494934;
	b=TDjPZsTm2KCPNKV1x1OsKJzMFdNBsh1AFRGhPOlBbIIIZmPGhJueQG+o9wbfHKxdb9DV
	 hOSufQT3Q6FTXBi3a9v+RB/y3fALsyKa4x3Bim9kbCtH+rdK1rBUyt6KItGRjkVV8xDOA
	 lqWK+ZaEjohEgOr1lyc0qTA089jW58XAkzBYKXew67z4xlAjDruH2xbZEK3jllvKd2Qai
	 gtcvjNnexLlwnA9sa3WIfy2qeQHII1+bpyqn8SQk7oH8M6nrMwla6+6p0oL5AeMDtnK8L
	 Rf9ivNXp6S0KOmcu/4XeyzOn58kq3Xw2LkI7bh55lOV9sp7KceGddXRtMepYCfwH0/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794494934;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=NK6DQy/PgvE1uinYZL0z00JjXXDXdQ+VD4k9F1j0Myc=;
	b=C8VL0b8Pd7uYNpWtYqiI7u1Y542tyxjgqkOTCcwSv07d3tX7OR7An1vraDTj5e+ZyJmp
	 /aYULKhFeQw1GqPs6Y6j5GEQXnvDJBdC9vt+O5nOqPiJZq/+BYnwp8bT1+MYtlbozqYze
	 mhffb/7MKMrt3GFyKBwlINHmdTnQ+tLGN4PWmsLNoSo4xZUc82RDqv79PmBHvgYEkE0km
	 aeWaAHFGdGHVl+5qEarvb7+kqtkQZs03RV5QZDgyKW3RTjP2c/YqLMQZXRK1KyIL7pqn7
	 5i3U0B6hhBRi+1tTK/fJSIQDNpaCkDHpmQFvynG9sU1vl00LXOa+zhTQkshaDpJ3WMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BkuCx9bd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38E1606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 14:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BkuCx9bd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1E4B1F00A09
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 14:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794494934;
	bh=NK6DQy/PgvE1uinYZL0z00JjXXDXdQ+VD4k9F1j0Myc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=BkuCx9bdEB09GpIY01z+Og6iW+RcWJ+lQNAihF3bcuIpZoNy/X2c/JjmNQxFMga0Y
	 7jL1iZkU1/A7NBXZiwaAbtb/yzJ7ebyUGZsY8MZP08mTbgGxfuTnbgHl3rqwPm/Fxc
	 rc1T2Sh56lEdAm1FmDc4q4s0CFqZ27B2iRwEN/Nw1XM/i8CIZ6mfoR6uNk8roF853+
	 OVQVGFZssuOfxWwIm6cHUcBi9CTsfMakuNi7VBlhEWt4E7d8uaWsx6KHQJfFCNzVql
	 Op+0YuuhSPNt5oqENhxALjT5xkqxvClVY/7N9Kih9YlCCBJ+tZD4DGZmQLuq4z/lCN
	 KmTYaWA9k9FKA==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3accd1ff4c3so34869081fa.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 06:48:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFFnmmDoOFYEwbxJPS8lVwceG/Wo3IRscdVDIJZ3e1fupjOK/wh+HzlOypL7x8d6n1HA9PWQxl69cj6s2M=@vger.kernel.org
X-Gm-Message-State: APuU4Z+e+lqviu4AQtWMPkcD3zJcYlFj3jQNj71HRj5GyVGU988Vp7Oj
	G1EXjsPJ4Z9jb0D7CW07xBAbXl6PNnOwf3xKyqsOqzXPDTx7u/hBxKFav5Y5sTZS83gr4eW9Lp7
	lU5zSUQBdhXbJHJ46YgkklIT2dgwuk58=
X-Received: by 2002:a05:6512:1384:b0:5be:5199:1c11 with SMTP id
 2adb3069b0e04-5c15d7a649emr1931998e87.60.1794494933355; Thu, 12 Nov 2026
 06:48:53 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111161830.1336485-1-max.kellermann@ionos.com>
In-Reply-To: <20261111161830.1336485-1-max.kellermann@ionos.com>
From: Xiubo Li <xiubli@kernel.org>
Date: Thu, 12 Nov 2026 15:48:41 +0100
X-Gmail-Original-Message-ID: <CAOuZWzxtPXvbXKiEOeTOb8cNG1h49Frx7xkQyn+Gg0HCWnmQUQ@mail.gmail.com>
X-Gm-Features: AclHuK-ky70TlfaGrCLe-ZVXnIOAqR_PdwHrfvAXgBZp77G1oVwzCh_Qxqhd7DM
Message-ID: <CAOuZWzxtPXvbXKiEOeTOb8cNG1h49Frx7xkQyn+Gg0HCWnmQUQ@mail.gmail.com>
Subject: Re: [PATCH 0/9] ceph: fix mdsmap and osdmap use-after-free in
 unlocked readers
To: Max Kellermann <max.kellermann@ionos.com>
Cc: xiubli@redhat.com, idryomov@gmail.com, amarkuze@redhat.com, 
	ceph-devel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Max,

Tested on a KASAN+lockdep kernel (on top of the ceph testing branch)
with sleep injection widening each window: all the UAFs fixed by
patches 1-6 and 9 reproduce on the base and are gone with the series;
patches 7-8 were exercised under osdmap churn; lockdep stays quiet,
also across fsstress with MDS failovers.

One reader is missed: send_mds_reconnect() still does

        ceph_con_open(&session->s_con, CEPH_ENTITY_TYPE_MDS, mds,
                      ceph_mdsmap_get_addr(mdsc->mdsmap, mds));

with only s_mutex held, and it is reached from mds_peer_reset() (the
path patch 5 fixes).  With the series applied:

  BUG: KASAN: slab-use-after-free in ceph_con_open+0x14f/0x230 [libceph]
  Read of size 136 ...
   send_mds_reconnect+0xa91/0x1710 [ceph]
   mds_peer_reset+0x26c/0x36b [ceph]
   process_session_reset+0x349/0x540 [libceph]
  Freed by: ceph_mdsmap_destroy <- ceph_mdsc_handle_mdsmap

Copying the address into a local while mdsc->mutex is held for the
sessions[mds] check a few lines earlier would fix it; could you add
that as a follow-up patch?

Nit for 7-9: incremental maps are applied in place, so the osdmap is
only replaced on a full map; the rbd case is really hit through
incrementals (a pool rename kfree()s pi->name).

Thanks
- Xiubo

Max Kellermann <max.kellermann@ionos.com> =E4=BA=8E2026=E5=B9=B411=E6=9C=88=
11=E6=97=A5=E5=91=A8=E4=B8=89 17:25=E5=86=99=E9=81=93=EF=BC=9A
>
> The MDS and OSD clients replace their maps and free the old ones
> under a lock: mdsc->mutex for the mdsmap and osdc->lock for the
> osdmap.  Several readers dereference these maps without that lock and
> can therefore access freed memory if a new map arrives concurrently.
> The worst is ceph_statfs(), which any user can reach and which loads
> and dereferences a pointer from the old mdsmap.
>
> Each patch takes the lock that protects the replacement around the
> reads.  __ceph_setxattr() cannot take mdsc->mutex under i_ceph_lock,
> so it uses a copy of m_max_xattr_size kept in the mds client.
>
> The same problem in ceph_compare_options() was already fixed by
> commit 19db525816db ("libceph: use RCU to protect monmap in
> ceph_compare_options()").
>
> These bugs were found by code review and have not been reproduced.
>
> Max Kellermann (9):
>   ceph: fix mdsmap use-after-free in ceph_statfs()
>   ceph: fix mdsmap use-after-free in debugfs mdsmap_show()
>   ceph: fix mdsmap use-after-free in __ceph_setxattr()
>   ceph: fix mdsmap use-after-free in send_renew_caps() and
>     renewed_caps()
>   ceph: fix mdsmap use-after-free in mds_peer_reset()
>   ceph: fix mdsmap use-after-free in ceph_get_tree() error path
>   ceph: fix osdmap use-after-free in ceph_sync_setxattr()
>   libceph: fix osdmap use-after-free in ceph_wait_for_latest_osdmap()
>   rbd: fix osdmap use-after-free in pool lookups
>
>  drivers/block/rbd.c    | 13 +++++++++++--
>  fs/ceph/debugfs.c      | 12 ++++++++++--
>  fs/ceph/mds_client.c   | 18 ++++++++++++++++--
>  fs/ceph/mds_client.h   |  7 +++++++
>  fs/ceph/super.c        | 19 ++++++++++++++-----
>  fs/ceph/xattr.c        | 13 +++++++++----
>  net/ceph/ceph_common.c |  8 +++++++-
>  7 files changed, 74 insertions(+), 16 deletions(-)
>
> --
> 2.53.0
>
>
