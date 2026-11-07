Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794025040;
	b=MVB+j1HjSlE7sXX9/nr4GFfli6SGXowiMIKWJOqgP5KW6/e7zJ3LII84wJfo3HeSGtNc
	 LbSCH1RIHhEaWbhWWv8SuKnCBV9yYQaxW8wjK5EHyy5ocaNX8D7Iro00ZsoqnWYcIqScu
	 ZzOl84QnAl8Os3ICUq6+B1quGakrsXwTy7fXlPqqP7EIEn989I0PA6rrRxWdPw1JtmPHS
	 GRrMxOVrrQRR5aK8ljzvRnpfeof06WHtvez+3ccpZghN2D448dwnudBVMzAVCy/qGflYY
	 SWwtR6xjFCOoOR7JKZvtDjH3PJQusqEU7UHWe/dqq2EC4oUJBniwpOaCX8w2cgFOxNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794025040;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=RTJ54tG+Gpt5tWtqaAvuvNbLYhFtkH+xR5r12FE3tHg=;
	b=wb3gRmOpcBOO/jx/MesQmNGXgBQSpJIHbxrOzwJ9ZRezfOPBn57vIDWvz7GZ1KOMtgTS
	 a3dG80XwyLJzhXsVOONQGQ0elJPdd12qx04wyp4aPfLLaz2hwn/IlEsw1o6eup9gW0Hmb
	 9Q7BUsqEYHt7Ncyuq/8T5NfNECugKCSp1OI7rs8nVncIj9fNgw5oqtrYcKdtiXhdbS7ZP
	 HylvD2cWdt/c4kvmeE2LC93OQUzSkZ9Kq/vUNvId55Ln6+9Pr6TPKKv1SQX+ARWFQZOHR
	 UORhjHi8EmwczoVNxyJWgmp6giWzLH2QxaHhPOfD9XNvd6vLWutsG3cDysWcKX+r4QQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I78gEhlc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED72606A32C
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 04:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I78gEhlc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF9CA1F008A2
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 04:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794025040;
	bh=RTJ54tG+Gpt5tWtqaAvuvNbLYhFtkH+xR5r12FE3tHg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=I78gEhlcHJDP0Bz5xQrZAc4pcrjZYI27oSxR/tWVNx85q5wGXIbX/K4GXBsSj99Nq
	 wUQMuWQtsF/1GuXKmCl1gKu7NYDy4WP2CegjJUCR+e1bn5x158VwCXXdzAw88HvU1A
	 vFCBC+8czUWIUM4gtvyqjoPbS4RXYz5bzn396hlv+14b6manVEi2N8UangdKHiSaug
	 MvX4vuw5aoidbW9uY5f0QluQhnsfqF/x0RFeW116hs9HbCOl8TB/ZnmnIYg7GVhpwM
	 wQqmP19ZhoWVlydxzjk1Is5RvPuKHuSUwLoCl0B8PoKVfYxlkROSbiK/cySk8gvEiM
	 9zYtZfgt34x5g==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5bccecba199so1278557e87.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 20:17:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHKmKZxMeHUSXW1aei3qJq7Ix+RZnSV663TGJcrvRCLly8NuhFTu5lyvu3XDguizdW+5pxnYP/qEzvZuAg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9teqFhfiLCXB73/Unn/DrglqNbnupKOQL/vZsDly1gyaJfW6uJ
	LxkGUY8ZDVDhzD0il/wyucCTAdLmA14ttFeAykqcfmtgSaRtBH387gQV0twmN9FlfMZ28EMKL/y
	a3jZKSBEXkVhK/lQsyYpb1N918Yo4AA4=
X-Received: by 2002:a05:6512:b84:b0:5bf:fbe3:7cf1 with SMTP id
 2adb3069b0e04-5c003c149e7mr1626109e87.62.1794025038687; Fri, 06 Nov 2026
 20:17:18 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <1793931193.6AED37B6.000.4jLN4k2qrnz23wX@fangwg01>
In-Reply-To: <1793931193.6AED37B6.000.4jLN4k2qrnz23wX@fangwg01>
From: Xiubo Li <xiubli@kernel.org>
Date: Sat, 7 Nov 2026 05:17:07 +0100
X-Gmail-Original-Message-ID: <CAOuZWzyZoQ9oAHKmxVg7B292Vx-QZ2E+QLt6xVnpfKpps+4Yfw@mail.gmail.com>
X-Gm-Features: AclHuK_AO2nP1B568IIQeBw7qHhP4TRBNEMRN2blc0PuhgjNtsctQcbDnQKWG48
Message-ID: <CAOuZWzyZoQ9oAHKmxVg7B292Vx-QZ2E+QLt6xVnpfKpps+4Yfw@mail.gmail.com>
Subject: Re: [PATCH] ceph: revalidate dentries under snapdir to drop stale snapshots
To: zhangdaolong <dlzhangak@isoftstone.com>
Cc: Ilya Dryomov <idryomov@gmail.com>, Alex Markuze <amarkuze@redhat.com>, 
	Viacheslav Dubeyko <slava@dubeyko.com>, ceph-devel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 zhangdaolong <dlzhangak@isoftstone.com> wrote:
> When a snapshot is deleted on one client node, its corresponding
> '.snap/<snapname>' dentry cached in the VFS dcache on other client nodes
> never gets invalidated. As a result, recreating a snapshot with the same
> name on another node fails with -EEXIST, and removing it fails with
> -ENOENT while still leaving the stale positive dentry in the dcache.

Hi Daolong,

Thanks for the patch. I can reproduce this with two kernel clients, and
it is a bit worse than described: after B removes .snap/s3 and creates a
new .snap/s3, A still reads the file contents of the old snapshot. A
removed ancestor snapshot also stays visible as .snap/_p1_<ino> in child
directories. Your patch fixes all of these cases.

[...]

>         /* always trust cached snapped dentries, snapdir dentry */
> -       if (ceph_in_snap(dir)) {
> +       if (ceph_in_snap(dir) && ceph_snap(dir) !=3D CEPH_SNAPDIR) {

With this change nothing can validate a dentry under .snap anymore. The
MDS issues no lease for it, the snapdir only has CEPH_CAP_PIN, and a
snapped inode has no real caps. So every path walk through .snap/<name>
does a synchronous LOOKUPSNAP. With 3000 stats of .snap/s3/f on a cached
snapshot (in a VM, so only the order of magnitude matters):

                 ops/s   LOOKUPSNAP   p50/p99 (us)
  unpatched     257834        0         3.1/6.9
  this patch     10065     3000        89.9/273.1
  realm check   234741        0         3.4/7.5

The "realm check" row is an alternative that avoids the round trip. The
client already knows which snapshots exist: the directory's snap realm
keeps the list in cached_context, and the MDS sends a snap update to
every client with caps in the realm when a snapshot is created or
removed. So d_revalidate can keep trusting a dentry under .snap while
its snapid (ceph_snap(inode)) is still in the realm's snap context of
the head directory, and only fall back to LOOKUPSNAP when it is not, or
when we hold no caps on that directory.

I tried this on 7.2.9. It fixes the same cases as your patch: recreating
a snapshot, reading stale data, removed ancestor snapshots, and 50/50
"B rmdir, A mkdir right away" rounds. It sends no LOOKUPSNAP on cache
hits. I can send you the diff I tested if it helps.

>                 if (!err && !req->r_reply_info.head->is_dentry)
>                         d_delete(dentry);
> +               else if (err =3D=3D -ENOENT)
> +                       d_drop(dentry);

Please make this a separate patch. With the revalidate fix, rmdir of a
stale snapshot already fails in the lookup and never sends RMSNAP. I
checked the MDS counter with and without this hunk. Also, this hunk
affects unlink() of regular files too.

Nits: the "always trust cached snapped dentries, snapdir dentry" comment
needs an update. Also, the trust-all check dates back to 2817b000b02c,
while 200fd27c8fa2 only added the unreachable LOOKUPSNAP branch, so
please explain the choice of Fixes: tag.

Thanks,
- Xiubo

zhangdaolong <dlzhangak@isoftstone.com> =E4=BA=8E2026=E5=B9=B411=E6=9C=886=
=E6=97=A5=E5=91=A8=E4=BA=94 03:13=E5=86=99=E9=81=93=EF=BC=9A
>
> When a snapshot is deleted on one client node, its corresponding
> '.snap/<snapname>' dentry cached in the VFS dcache on other client nodes
> never gets invalidated. As a result, recreating a snapshot with the same
> name on another node fails with -EEXIST, and removing it fails with
> -ENOENT while still leaving the stale positive dentry in the dcache.
>
> In ceph_d_revalidate(), the condition 'if (ceph_in_snap(dir))' matches
> both immutable snapped directories (ceph_snap(dir) <=3D CEPH_MAXSNAP) and
> the mutable virtual '.snap' directory itself (ceph_snap(dir) =3D=3D
> CEPH_SNAPDIR). Because it unconditionally sets valid =3D 1 when dir is
> CEPH_SNAPDIR, the CEPH_MDS_OP_LOOKUPSNAP revalidation path below inside
> 'if (!valid)' is rendered unreachable dead code.
>
> Fix this by excluding CEPH_SNAPDIR from the unconditional trust check in
> ceph_d_revalidate() so that cached dentries directly under '.snap' are
> revalidated via CEPH_MDS_OP_LOOKUPSNAP. Additionally, drop the dentry in
> ceph_unlink() when the MDS returns -ENOENT.
>
> Fixes: 200fd27c8fa2 ("ceph: use lookup request to revalidate dentry")
> Link: https://tracker.ceph.com/issues/81579
> Signed-off-by: zhangdaolong <dlzhangak@isoftstone.com>
> ---
>  fs/ceph/dir.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/fs/ceph/dir.c b/fs/ceph/dir.c
> index 6eb5b1cb039b..9f84beac189e 100644
> --- a/fs/ceph/dir.c
> +++ b/fs/ceph/dir.c
> @@ -1475,6 +1475,8 @@ static int ceph_unlink(struct inode *dir, struct de=
ntry *dentry)
>                 err =3D ceph_mdsc_do_request(mdsc, dir, req);
>                 if (!err && !req->r_reply_info.head->is_dentry)
>                         d_delete(dentry);
> +               else if (err =3D=3D -ENOENT)
> +                       d_drop(dentry);
>         }
>
>         ceph_mdsc_put_request(req);
> @@ -2003,7 +2005,7 @@ static int ceph_d_revalidate(struct inode *dir, con=
st struct qstr *name,
>         mdsc =3D ceph_sb_to_fs_client(dir->i_sb)->mdsc;
>
>         /* always trust cached snapped dentries, snapdir dentry */
> -       if (ceph_in_snap(dir)) {
> +       if (ceph_in_snap(dir) && ceph_snap(dir) !=3D CEPH_SNAPDIR) {
>                 doutc(cl, "%p '%pd' inode %p is SNAPPED\n", dentry,
>                       dentry, inode);
>                 valid =3D 1;
> --
> 2.48.1
>
>
