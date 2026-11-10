Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794280235;
	b=Z3lg4/6DRRuJE64vH2z6gXP11dFxT21UdTHpDCNkxZCXbrOgirOrZl1hwRe+GfYGmiwA
	 kK7aIyZNGaWRmB0R3qbfk98qCrdhVUMFSnvsXQh7sIGYmfi6laFHHACBep23JFUqkG1u4
	 NnEnoNStOw4ND4nJRA8RMX7tYkZoWNGMIwd13T0oObSCo3viDNE2MU5m93HntHzyMs6IV
	 lXqoW/A9YIR2mreKVWmLlM8RHzLK+Mbc9ABLZEn03Q9BnZqUTM4wfwp0ZhjmEENL0bOCR
	 7YnPMMYgVe/KfvTx+ujn0akksyUkkahFHQCoD2wtSIpxmXTqTp0Sg2jL1um+v3cDLBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794280235;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=cD2q8lmayKZhvvc4jXyncva8Umu3E5o/3XQZXTEOLIE=;
	b=aTYXCUrcBxyvo72AK5ZgCDXwtvQPs4YMz2+ifrPHQMH1XBLVV5bu7QlmJx7z3vQ+bwOO
	 MjULNWqG7CLylv9bgN6jieVNuli5/aD2jBAw4ziv4r7hkB+N3gOPZL2ZyKCNq+ZMoKxel
	 Z7TvbW9SKaJzE4gmUbHrouBsNEeJ1n3VXl46+/J86q4M2nOuDWbLDpm9gL8Qym7h7wtMg
	 qpxmoNki3MauOUeTjCT5l8WDHr72wkzBRdFEOS1PbPUXCuHf2BU81MeqIKu62qsBnMRU1
	 VApTzfQi75E27eHY+XfaP0yfonPvd4inscpyvv4/g0iHsSH/i711lfh3Q5SCJXiRF+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=J4lnsK5W;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE47606A32E
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 03:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=J4lnsK5W
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 933A91F008A6
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 03:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794280233;
	bh=cD2q8lmayKZhvvc4jXyncva8Umu3E5o/3XQZXTEOLIE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=J4lnsK5WGRiL7j24ISv/ubKvAWZnF0URwF8So3bgnEntJKYVgBisDlwTbQHRrFP+M
	 NHzMFIQYf7trvvP6+pG4rHOB+fy6gNoOepcdmdu6ZV0FOQvdMQLF75Q5w6MrKlb0J9
	 VVi7TeI68JIhuwdpd8vPzq8P+Zw36yMDlUuI+IgsCdwx3ocQ9HMrpHa8g9lFDljcCq
	 IXK7ellFHvS4ekVsbtwx660juC0zUzad5fb3z6M4CABk9C+Zk68+WpPOnXxIzA/sWR
	 260P3ACmnSA/WbQxW3Olet9093Xo4HTIpbVkw+iXa1X413n7v1C/rjoEMieInwb8QF
	 OKAHlKbBoo4JA==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5c14f6f58aeso1333763e87.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 19:10:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHvwrqv9HLorUeKD+4K2CUmV8XwUFTQCp4hUj1CENhWhmbsVZuQSBph8y76t1J/+5wRZI2X63C0w5vmCGw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9T6768ZSvKtM//cCLnixK1Y+UUz4v7wlvqGOMXT/p3kX2/9rZT
	CBbx1x6Qx7hZ5qOltRRCLlwM9OwBXgv3282dmnXUu5LDHJ7HO5y/KhUaDZ90e7Magsg119VCMjQ
	lQ2eEGdPhXUGnZAZuXl2q1VJsCnpMbdA=
X-Received: by 2002:a05:6512:3d03:b0:5bf:ce20:57e8 with SMTP id
 2adb3069b0e04-5c156ebe560mr373613e87.40.1794280232302; Mon, 09 Nov 2026
 19:10:32 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAOuZWzx7eg1bNzyoY+kTP2CB4NqwwC23K1RC-etdWW1VyF01fA@mail.gmail.com>
 <1794209399.6AF17675.001.4jNLys3BPKz22sb@fangwg01>
In-Reply-To: <1794209399.6AF17675.001.4jNLys3BPKz22sb@fangwg01>
From: Xiubo Li <xiubli@kernel.org>
Date: Tue, 10 Nov 2026 04:10:19 +0100
X-Gmail-Original-Message-ID: <CAOuZWzx2Mpb2oa0zgMY_0P7EGNk9mYscQdowKROvyXH4HAM7qQ@mail.gmail.com>
X-Gm-Features: AclHuK8sGXNDOQkNxoThiKTLItdc_bQUiTtZeN4XokLXlMVvF82ps0uFSfnyt9M
Message-ID: <CAOuZWzx2Mpb2oa0zgMY_0P7EGNk9mYscQdowKROvyXH4HAM7qQ@mail.gmail.com>
Subject: Re: [PATCH v2] ceph: revalidate dentries under snapdir to drop stale snapshots
To: zhangdaolong <dlzhangak@isoftstone.com>
Cc: Ilya Dryomov <idryomov@gmail.com>, Alex Markuze <amarkuze@redhat.com>, 
	Viacheslav Dubeyko <slava@dubeyko.com>, ceph-devel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 9, 2026 zhangdaolong <dlzhangak@isoftstone.com> wrote:
> - Note: Xiubo, please feel free to change Suggested-by to Co-developed-by
>   (with your Signed-off-by) if you prefer.

Hi Daolong,

Thanks for v2. The code is the same as the diff I tested.

Reviewed-by: Xiubo Li <xiubo.li@clyso.com>

Thanks,
- Xiubo

zhangdaolong <dlzhangak@isoftstone.com> =E4=BA=8E2026=E5=B9=B411=E6=9C=889=
=E6=97=A5=E5=91=A8=E4=B8=80 08:30=E5=86=99=E9=81=93=EF=BC=9A
>
> When a snapshot is deleted on one client node, its corresponding
> '.snap/<snapname>' dentry cached in the VFS dcache on other client nodes
> never gets invalidated. As a result, on another client node:
> - recreating a snapshot with the same name fails with -EEXIST;
> - removing the already deleted snapshot fails with -ENOENT while leaving
>   the stale positive dentry in the dcache;
> - if the deleted snapshot is recreated with the same name on the remote
>   node, the local client still reads the file contents of the old
>   snapshot;
> - a removed ancestor snapshot stays visible as '.snap/_<name>_<ino>' in
>   child directories.
>
> Since commit 2817b000b02c ("ceph: directory operations"),
> ceph_d_revalidate() has unconditionally trusted all dentries whose
> parent directory has ceph_snap(dir) !=3D CEPH_NOSNAP (later written as
> ceph_in_snap(dir)). Because that condition matches both immutable
> snapped directories (ceph_snap(dir) <=3D CEPH_MAXSNAP) and the mutable
> virtual '.snap' directory itself (ceph_snap(dir) =3D=3D CEPH_SNAPDIR), it
> unconditionally sets valid =3D 1 when dir is CEPH_SNAPDIR, rendering the
> CEPH_MDS_OP_LOOKUPSNAP revalidation path added in commit 200fd27c8fa2
> ("ceph: use lookup request to revalidate dentry") unreachable.
>
> However, simply falling back to CEPH_MDS_OP_LOOKUPSNAP for every dentry
> under CEPH_SNAPDIR would cause every path walk through '.snap/<name>' to
> send a synchronous LOOKUPSNAP request to the MDS, because the MDS issues
> no lease for dentries under '.snap', the snapdir only has CEPH_CAP_PIN,
> and a snapped inode has no real caps.
>
> Instead, introduce snapdir_dentry_is_valid() to validate cached dentries
> under CEPH_SNAPDIR against the snapped head directory's snap realm
> cached_context. Because the MDS sends a snap update to every client
> holding caps in a realm whenever a snapshot in it is created or removed,
> we can keep trusting a cached dentry under '.snap' as long as we hold
> real caps on the head directory and the snapshot's snapid
> (ceph_snap(inode)) is still present in its realm's cached_context, and
> only fall back to CEPH_MDS_OP_LOOKUPSNAP when it is not or when no caps
> are held on that directory.
>
> Fixes: 2817b000b02c ("ceph: directory operations")
> Link: https://tracker.ceph.com/issues/81579
> Suggested-by: Xiubo Li <xiubli@kernel.org>
> Signed-off-by: zhangdaolong <dlzhangak@isoftstone.com>
> ---
> Changes in v2:
> - Add snapdir_dentry_is_valid() to validate dentries under .snap against
>   the head directory's snap realm cached_context when holding caps,
>   avoiding unnecessary LOOKUPSNAP round trips on cache hits (Xiubo Li).
> - Drop the ceph_unlink() -ENOENT hunk (to be sent separately).
> - Update comments in ceph_d_revalidate() and point Fixes: to 2817b000b02c=
.
> - Note: Xiubo, please feel free to change Suggested-by to Co-developed-by
>   (with your Signed-off-by) if you prefer.
>
>  fs/ceph/dir.c | 64 +++++++++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 62 insertions(+), 2 deletions(-)
>
> diff --git a/fs/ceph/dir.c b/fs/ceph/dir.c
> index 6eb5b1cb039b..21983e14cb67 100644
> --- a/fs/ceph/dir.c
> +++ b/fs/ceph/dir.c
> @@ -1979,6 +1979,58 @@ static int dir_lease_is_valid(struct inode *dir, s=
truct dentry *dentry,
>         return valid;
>  }
>
> +/*
> + * Check whether a cached dentry under .snap still names an existing sna=
pshot.
> + *
> + * The MDS issues no lease for these dentries, but it sends a snap updat=
e to
> + * every client holding caps in a realm when a snapshot in it is created=
 or
> + * removed.  So as long as we hold caps on the snapped directory, its re=
alm's
> + * snap context tells us whether the snapshot still exists.  Without cap=
s we
> + * cannot tell, and the caller has to ask the MDS.
> + */
> +static int snapdir_dentry_is_valid(struct inode *dir, struct dentry *den=
try,
> +                                  struct ceph_mds_client *mdsc)
> +{
> +       struct inode *inode =3D d_inode(dentry);
> +       struct ceph_vino vino =3D {
> +               .ino =3D ceph_ino(dir),
> +               .snap =3D CEPH_NOSNAP,
> +       };
> +       struct ceph_snap_context *snapc =3D NULL;
> +       struct ceph_inode_info *pci;
> +       struct inode *parent;
> +       u32 i;
> +       int valid =3D 0;
> +
> +       if (!inode || ceph_snap(inode) > CEPH_MAXSNAP)
> +               return 0;
> +
> +       parent =3D ceph_find_inode(dir->i_sb, vino);
> +       if (!parent)
> +               return 0;
> +       pci =3D ceph_inode(parent);
> +
> +       down_read(&mdsc->snap_rwsem);
> +       spin_lock(&pci->i_ceph_lock);
> +       if (__ceph_is_any_real_caps(pci) && pci->i_snap_realm &&
> +           pci->i_snap_realm->cached_context)
> +               snapc =3D ceph_get_snap_context(pci->i_snap_realm->cached=
_context);
> +       spin_unlock(&pci->i_ceph_lock);
> +       up_read(&mdsc->snap_rwsem);
> +       iput(parent);
> +
> +       if (!snapc)
> +               return 0;
> +       for (i =3D 0; i < snapc->num_snaps; i++) {
> +               if (snapc->snaps[i] =3D=3D ceph_snap(inode)) {
> +                       valid =3D 1;
> +                       break;
> +               }
> +       }
> +       ceph_put_snap_context(snapc);
> +       return valid;
> +}
> +
>  /*
>   * Check if cached dentry can be trusted.
>   */
> @@ -2002,12 +2054,20 @@ static int ceph_d_revalidate(struct inode *dir, c=
onst struct qstr *name,
>
>         mdsc =3D ceph_sb_to_fs_client(dir->i_sb)->mdsc;
>
> -       /* always trust cached snapped dentries, snapdir dentry */
> -       if (ceph_in_snap(dir)) {
> +       if (ceph_snap(dir) =3D=3D CEPH_SNAPDIR) {
> +               /* a snapshot under .snap may have been removed by others=
 */
> +               if (flags & LOOKUP_RCU)
> +                       return -ECHILD;
> +               valid =3D snapdir_dentry_is_valid(dir, dentry, mdsc);
> +               doutc(cl, "%p '%pd' inode %p under snapdir, valid %d\n",
> +                     dentry, dentry, inode, valid);
> +       } else if (ceph_in_snap(dir)) {
> +               /* snapshots are immutable: trust dentries inside one */
>                 doutc(cl, "%p '%pd' inode %p is SNAPPED\n", dentry,
>                       dentry, inode);
>                 valid =3D 1;
>         } else if (inode && ceph_snap(inode) =3D=3D CEPH_SNAPDIR) {
> +               /* the .snap dentry itself */
>                 valid =3D 1;
>         } else {
>                 valid =3D dentry_lease_is_valid(dentry, flags);
> --
> 2.48.1
>
