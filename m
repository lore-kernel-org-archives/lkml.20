Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D72F433D6D6
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 00:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788224196; cv=pass; b=ImP/2KMX/bU1IMl7Y/P54HPFWq1XsU4jyYFgpnlGDm1KoRe5LSbpwoblXMXCDRn6L6reSlok+bcLnXF+KeFwqO6aKYKhkgi8uiL+6A5rylSJ7NT2tzW2sOPxSZiodLJpIuzV+hxws9BAp6HeJtyBBJwSedekjEuV6jix7z0HerA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788224196; c=relaxed/simple;
	bh=K7gHhkYZQIa8pYKfLfUjLbfCsj1BW9H7kFSIDjYWZF4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UT5e2WWProWptcNRKgFt4ZjQOtz0OJ/eN5GEHzUK5thHhf6q9Js1u5O1oDavodJ/sDjRCEhQxx5F78UQ/YF1YIHsRifygTdF6Ad7FNlBJtcLOdMhIObxQq5CMeKZ7y5dmiO5nROWrNc0HqLi3VxtUudW/tJDiL/VI2vr3xnpPKU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iVOLHYar; arc=pass smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iVOLHYar"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5b0115b9e17so245017e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 17:56:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788224190; cv=none;
        d=google.com; s=arc-20260327;
        b=R+AjMffdC3E1lo4kg4Yu9fS8HRzW2Y2gq5UFt7uWbuDip2wH2OGbKtVsTHPD4vGWQS
         SZtrRquCmemA1BHkC8ykXDY6w1+95HjmeuIn2UcilnlZDDglaRz8Cgw5YjzeFUTGcQ6P
         Pj0hNftJY5rnxV9qIB5T3RU+BFyK3sqcygzePA6pilVQIKVCON2y+znfdRE/2n19Duib
         7VqQo9+JXuBWlqnhWOhQeJ8zD6DxsF3/4ihSlsHs07YcMWvh6A69PJBtkNxJXhADp/ON
         Aso7VTENPsBaa+nmF5Wbpt0/CpPMvXcxDJr86dN/RfB5ec8D3+7cw15WZutP73m+D+hd
         RAgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=axmxmHNn+Z5yVsL58C0mrvkNLazBBztQfpKNwbM+VRE=;
        fh=gRX2TEt/fccLBDF6pTkSCLzc//yYT3P2ecFiamcV/1E=;
        b=RpYP6Md1CQPMoMpawk9E/EiFcvUyABKVPb+XZcCDWNVAjr2h3ag9e3eFnCvYJvGewp
         7Ys1xFFd1YocjRIlFhdhwKX7utUnABC0JUPEE1QORg7YUWntK382MCRquAGi6TpRdOqq
         JSFkA0USkiJkrglFnq/Zx2r+l6YbC8du5hJS0byxslvkMaGV8nIM6B0WmiKtPYxrCIY+
         +6oelkRKqDE02UipImv/OY6Tb+q4XwiGXfV4etFAvFc+VTIJQyF+x7g+BGkFPvSjPMK0
         +YqaHUgdg95kMe17espuh6EJZ/ZjXGn0lViKFAc5spvI7zJ2oRfq9n3SZEXB4KoxNy2i
         qIyQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788224190; x=1788828990; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=axmxmHNn+Z5yVsL58C0mrvkNLazBBztQfpKNwbM+VRE=;
        b=iVOLHYarKeylTzAuZg67Ua7qV5r8+6QPKEZieph0TZfTXeZzOsFrMjxmO/5RnZZYP7
         dS+E5r6QpHhfuN2xMbPgKVkI+wzmAssVO4UehvQfaNwFLN5EEz4UDe/Fza8ezH5CNaPc
         sDAYdVMmKUgZuH9bLZ0fPo+Pw5plNL3TYgqwt9hBQCMV+o8ZLEyz/xiUAJa3MbnIcJq6
         45AREkFGYGZt6U2/HvAu7MGIX5ghNI39PBzNDm5/9PwThNdDT6wGU6g/VNtKF4qnCHBi
         NGQlkXjQ+Sej7AZV0wSO8eAyF/TCecPY41n9pxquRmZwp/ZLR2PtdE3I0lPaLjXIL2NF
         WCVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788224190; x=1788828990;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=axmxmHNn+Z5yVsL58C0mrvkNLazBBztQfpKNwbM+VRE=;
        b=OEAwjW/auTh9y8BvS4bOetDqes4Xt3nQ2peXjsex2XW6E1mDY8owXmGOmhI6MLcH3c
         kq78GgH8VgFDS8G7lMQizoUxHIGyyM361wAud/nmyWKxiMmpX8kUgIJgu6uHZ1+bVzx5
         0kr5s+cNkCWHbjBHUyMyzVYi6iQr35j0B5mbLd1S3l6Q9zxIdumA5e2HUiLCwKSr5eZu
         xnYbhrlsTKB64Uf2bKBtL9YNDLT7OxIGdcoA65SZLTlPNoJXBj87B3RBholSWI4zMiL1
         rCLxKps8DmCZThDunFxezTT2BT9j6lRbDKsV3xxmzW1l0WDDIDPby5YY7Nx2fXJuiisc
         VgNg==
X-Forwarded-Encrypted: i=1; AKwUvByJ3utdmPq7JZL5cQGjgdt+xuJnLX5ZmSFz060k0L4x/w5grh/wZshptx77nG2E+ABTZ5YCt944YsIfXKY=@vger.kernel.org
X-Gm-Message-State: AFuF++kKlOys9ggKOp+gRzQPU3XQWfle+/xzWMfiC+v0Riinh6GliaOH
	WYBEAaTKxxcv1A3v5oRD8s+FmhUf6ygsn+WuuLCjS4CHNLEr2BDcom3lVvnSHoCw0r9rQigw0ps
	HXTZwQCRkULokm0x8i41gqn0mCplDvwc=
X-Gm-Gg: AYBFou2HrtWHxMelpHyC5A4Ob4Oq3pPFZ0zEDSVdpkxZRLdkcVxJ5tF6XEk74Ru8jvR
	QsgGO8bX6habLdvK0jYT2cfaXDOBWoN1OVY6oVmxiT7jPLNbXyqAM0XKJRphHu44Hi5Ik1jCCt2
	iHcsiPC3TzPTm9QufX8p8zqbRfl8L/r+vynztSeN91D5t+8O22juPr6Si8W+rQe23jyTzWSML69
	n/Vk1omhYvKO2mPrYslr0OlPfiikYes9xALqHtIZ7yiUcrCQGEHmvmC211SLEmXlEIl1arM+evZ
	/SGcshCVNregPU3ksIZEGMB1M5UTd6vxI0cBz3JCOeEnWcXI8ByAhHz3mjX/P25y/BG7OIbpdhr
	bXwQNUKsonuXcHZHJ1MwbW6ONH4GXYdtI/k3xx3t8ljkv
X-Received: by 2002:a05:6512:2316:b0:5b0:11b4:fd7f with SMTP id
 2adb3069b0e04-5b5e68d90b8mr8726580e87.10.1788224189681; Mon, 31 Aug 2026
 17:56:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1788213716.git.zhangxp1998@gmail.com> <a21bc0d17ce657d0ccd86fd398785b946fa268d6.1788213716.git.zhangxp1998@gmail.com>
In-Reply-To: <a21bc0d17ce657d0ccd86fd398785b946fa268d6.1788213716.git.zhangxp1998@gmail.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Mon, 31 Aug 2026 17:56:16 -0700
X-Gm-Features: AcwNN1UsBx_qEVIR2Ip417wq8HuaeNL2rm0qsnwqKaGRH0YmsIeNDStHRoJdzTI
Message-ID: <CACOAw_zvPTBFiHwyL5XHwmtxEE2nusoxRtBhYU9jfiRS1fO3KA@mail.gmail.com>
Subject: Re: [f2fs-dev] [PATCH v7 06/11] f2fs: describe {i, d, id}node block
 layout dynamically
To: Kelvin Zhang <zhangxp1998@gmail.com>
Cc: linux-f2fs-devel@lists.sourceforge.net, jaegeuk@kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2026 at 3:12=E2=80=AFPM Kelvin Zhang <zhangxp1998@gmail.com=
> wrote:
>
> An inode block ends with five i_nid entries followed by a node footer.
> Data block address pointers (i_addr[]) precede them. Similarly, direct an=
d
> indirect node blocks contain data addresses or node IDs followed by a nod=
e
> footer at the end of the block.
>
> Describe struct f2fs_inode, struct direct_node, and
> struct indirect_node using flexible array members. Compute the locations
> of i_nid and node footers dynamically from the filesystem block size.
> Introduce F2FS_INODE_NIDS() and F2FS_NODE_FOOTER() helpers to access thes=
e
> tail fields.
>
> Compute sbi->addrs_per_inode, sbi->addrs_per_block, and
> sbi->nids_per_block in init_sb_info(), and update node management, file
> mapping, and recovery paths accordingly.
>
> Signed-off-by: Kelvin Zhang <zhangxp1998@gmail.com>
> ---
>  fs/f2fs/data.c          |  2 +-
>  fs/f2fs/f2fs.h          | 32 ++++++++++++++++++-------
>  fs/f2fs/gc.c            |  2 +-
>  fs/f2fs/inline.c        |  3 +--
>  fs/f2fs/inode.c         |  5 ++--
>  fs/f2fs/node.c          |  4 +---
>  fs/f2fs/node.h          | 53 +++++++++++++++++++----------------------
>  fs/f2fs/super.c         |  5 ++++
>  include/linux/f2fs_fs.h | 26 +++++++++++++++-----
>  9 files changed, 79 insertions(+), 53 deletions(-)
>
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 6ae0eb37d20f..751b7a457d9a 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -2027,7 +2027,7 @@ static int f2fs_xattr_fiemap(struct inode *inode,
>
>                 phys =3D F2FS_BLK_TO_BYTES(ni.blk_addr);
>                 offset =3D offsetof(struct f2fs_inode, i_addr) +
> -                                       sizeof(__le32) * (DEF_ADDRS_PER_I=
NODE -
> +                                       sizeof(__le32) * (DEF_ADDRS_PER_I=
NODE_SBI(sbi) -
>                                         get_inline_xattr_addrs(inode));
>
>                 phys +=3D offset;
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index d2e54573ed34..247e56522441 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -1853,6 +1853,9 @@ struct f2fs_sb_info {
>         unsigned int log_blocksize;             /* log2 block size */
>         unsigned int blocksize;                 /* block size */
>         unsigned int nat_entries_per_block;     /* NAT entries in a block=
 */
> +       unsigned int addrs_per_inode;           /* addresses in an inode =
block */
> +       unsigned int addrs_per_block;           /* addresses in a direct =
node block */
> +       unsigned int nids_per_block;            /* node IDs in an indirec=
t node block */
>         unsigned int sit_entries_per_block;     /* SIT entries in a block=
 */
>         unsigned int orphans_per_block; /* orphan inodes in a block */
>         unsigned int dentries_per_block;        /* dentries in a block */
> @@ -2248,6 +2251,7 @@ static inline struct f2fs_sb_info *F2FS_F_SB(const =
struct folio *folio)
>
>  #define SIT_ENTRY_PER_BLOCK(sbi)       ((sbi)->sit_entries_per_block)
>  #define NAT_ENTRY_PER_BLOCK(sbi)       ((sbi)->nat_entries_per_block)
> +#define DEF_ADDRS_PER_INODE_SBI(sbi)   ((sbi)->addrs_per_inode)

The awkward `_SBI` suffix in DEF_ADDRS_PER_INODE_SBI(sbi) was introduced be=
cause
DEF_ADDRS_PER_INODE(inode) was already defined in include/linux/f2fs_fs.h u=
sing
the kernel VFS helper i_blocksize(inode).

However:
1. include/linux/f2fs_fs.h is a shared UAPI/on-disk header (synced
with f2fs-tools),
   so embedding kernel VFS helpers like `i_blocksize(inode)` does not
belong there?
2. All other geometry macros in fs/f2fs/f2fs.h consistently take
`(sbi)` and return
   the precomputed cached values (e.g. DEF_ADDRS_PER_BLOCK(sbi),
NIDS_PER_BLOCK(sbi),
   SIT_ENTRY_PER_BLOCK(sbi), NAT_ENTRY_PER_BLOCK(sbi)).

To make the interface clean and consistent:
1) In include/linux/f2fs_fs.h (formula parameterized by blocksize for
tools/generic use):
   #define F2FS_DEF_ADDRS_PER_INODE(bs) \
       (((bs) - OFFSET_OF_END_OF_I_EXT - SIZE_OF_I_NID - \
         sizeof(struct node_footer)) / sizeof(__le32))
2) In fs/f2fs/f2fs.h (kernel fast-path lookup, matching other macros):
   #define DEF_ADDRS_PER_INODE(sbi)    ((sbi)->addrs_per_inode)
   #define DEF_ADDRS_PER_BLOCK(sbi)    ((sbi)->addrs_per_block)
   #define NIDS_PER_BLOCK(sbi)         ((sbi)->nids_per_block)

This eliminates the awkward DEF_ADDRS_PER_INODE_SBI() macro completely and =
keeps
macro naming consistent across the entire subsystem.

>  #define F2FS_ORPHANS_PER_BLOCK(sbi)    ((sbi)->orphans_per_block)
>  #define GET_ORPHAN_BLOCKS(sbi, n)      DIV_ROUND_UP((n), \
>                                         F2FS_ORPHANS_PER_BLOCK(sbi))
> @@ -2297,6 +2301,12 @@ static inline struct f2fs_checkpoint *F2FS_CKPT(st=
ruct f2fs_sb_info *sbi)
>         return (struct f2fs_checkpoint *)(sbi->ckpt);
>  }
>
> +static inline struct node_footer *F2FS_NODE_FOOTER(const struct folio *f=
olio)
> +{
> +       return folio_address(folio) + F2FS_BLKSIZE -
> +               sizeof(struct node_footer);
> +}
> +
>  static inline struct f2fs_node *F2FS_NODE(const struct folio *folio)
>  {
>         return (struct f2fs_node *)folio_address(folio);
> @@ -2307,6 +2317,12 @@ static inline struct f2fs_inode *F2FS_INODE(const =
struct folio *folio)
>         return &((struct f2fs_node *)folio_address(folio))->i;
>  }
>
> +static inline __le32 *F2FS_INODE_NIDS(const struct folio *folio)
> +{
> +       return folio_address(folio) + F2FS_BLKSIZE - sizeof(struct node_f=
ooter) -
> +               SIZE_OF_I_NID;
> +}
> +
>  static inline struct f2fs_nm_info *NM_I(struct f2fs_sb_info *sbi)
>  {
>         return (struct f2fs_nm_info *)(sbi->nm_info);
> @@ -3277,13 +3293,11 @@ static inline void f2fs_radix_tree_insert(struct =
radix_tree_root *root,
>                 cond_resched();
>  }
>
> -#define RAW_IS_INODE(p)        ((p)->footer.nid =3D=3D (p)->footer.ino)
> -
>  static inline bool IS_INODE(const struct folio *folio)
>  {
> -       struct f2fs_node *p =3D F2FS_NODE(folio);
> +       struct node_footer *footer =3D F2FS_NODE_FOOTER(folio);
>
> -       return RAW_IS_INODE(p);
> +       return footer->nid =3D=3D footer->ino;
>  }
>
>  static inline int offset_in_addr(struct f2fs_inode *i)
> @@ -3292,9 +3306,11 @@ static inline int offset_in_addr(struct f2fs_inode=
 *i)
>                         (le16_to_cpu(i->i_extra_isize) / sizeof(__le32)) =
: 0;
>  }
>
> -static inline __le32 *blkaddr_in_node(struct f2fs_node *node)
> +static inline __le32 *blkaddr_in_node(const struct folio *folio)
>  {
> -       return RAW_IS_INODE(node) ? node->i.i_addr : node->dn.addr;
> +       struct f2fs_node *node =3D F2FS_NODE(folio);
> +
> +       return IS_INODE(folio) ? node->i.i_addr : node->dn.addr;
>  }
>
>  static inline int f2fs_has_extra_attr(struct inode *inode);
> @@ -3311,7 +3327,7 @@ static inline unsigned int get_dnode_base(struct in=
ode *inode,
>  static inline __le32 *get_dnode_addr(struct inode *inode,
>                                         struct folio *node_folio)
>  {
> -       return blkaddr_in_node(F2FS_NODE(node_folio)) +
> +       return blkaddr_in_node(node_folio) +
>                         get_dnode_base(inode, node_folio);
>  }
>
> @@ -3639,7 +3655,7 @@ void *inline_xattr_addr(struct inode *inode, const =
struct folio *folio)
>  {
>         struct f2fs_inode *ri =3D F2FS_INODE(folio);
>
> -       return (void *)&(ri->i_addr[DEF_ADDRS_PER_INODE -
> +       return (void *)&(ri->i_addr[DEF_ADDRS_PER_INODE_SBI(F2FS_I_SB(ino=
de)) -
>                                         get_inline_xattr_addrs(inode)]);
>  }
>
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index c15c6ba91597..f15ab07a7347 100644
> --- a/fs/f2fs/gc.c
> +++ b/fs/f2fs/gc.c
> @@ -1176,7 +1176,7 @@ static bool is_alive(struct f2fs_sb_info *sbi, stru=
ct f2fs_summary *sum,
>
>         if (IS_INODE(node_folio)) {
>                 base =3D offset_in_addr(F2FS_INODE(node_folio));
> -               max_addrs =3D DEF_ADDRS_PER_INODE;
> +               max_addrs =3D DEF_ADDRS_PER_INODE_SBI(sbi);
>         } else {
>                 base =3D 0;
>                 max_addrs =3D DEF_ADDRS_PER_BLOCK;
> diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
> index 718dd785865a..73cd9b6ddcc5 100644
> --- a/fs/f2fs/inline.c
> +++ b/fs/f2fs/inline.c
> @@ -36,14 +36,13 @@ bool f2fs_may_inline_data(struct inode *inode)
>
>  static bool inode_has_blocks(struct inode *inode, struct folio *ifolio)
>  {
> -       struct f2fs_inode *ri =3D F2FS_INODE(ifolio);
>         int i;
>
>         if (F2FS_HAS_BLOCKS(inode))
>                 return true;
>
>         for (i =3D 0; i < DEF_NIDS_PER_INODE; i++) {
> -               if (ri->i_nid[i])
> +               if (F2FS_INODE_NIDS(ifolio)[i])
>                         return true;
>         }
>         return false;
> diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
> index 96cc0e777567..fda9ee3bfc61 100644
> --- a/fs/f2fs/inode.c
> +++ b/fs/f2fs/inode.c
> @@ -150,9 +150,8 @@ bool f2fs_enable_inode_chksum(struct f2fs_sb_info *sb=
i, struct folio *folio)
>
>  static __u32 f2fs_inode_chksum(struct f2fs_sb_info *sbi, struct folio *f=
olio)
>  {
> -       struct f2fs_node *node =3D F2FS_NODE(folio);
> -       struct f2fs_inode *ri =3D &node->i;
> -       __le32 ino =3D node->footer.ino;
> +       struct f2fs_inode *ri =3D F2FS_INODE(folio);
> +       __le32 ino =3D F2FS_NODE_FOOTER(folio)->ino;
>         __le32 gen =3D ri->i_generation;
>         __u32 chksum, chksum_seed;
>         __u32 dummy_cs =3D 0;
> diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
> index 960c6657d0d6..e3f594f7bcce 100644
> --- a/fs/f2fs/node.c
> +++ b/fs/f2fs/node.c
> @@ -3001,7 +3001,6 @@ int f2fs_recover_inode_page(struct f2fs_sb_info *sb=
i, struct folio *folio)
>  int f2fs_restore_node_summary(struct f2fs_sb_info *sbi,
>                         unsigned int segno, struct f2fs_summary_block *su=
m)
>  {
> -       struct f2fs_node *rn;
>         struct f2fs_summary *sum_entry;
>         block_t addr;
>         int i, idx, last_offset, nrpages;
> @@ -3023,8 +3022,7 @@ int f2fs_restore_node_summary(struct f2fs_sb_info *=
sbi,
>                         if (IS_ERR(folio))
>                                 return PTR_ERR(folio);
>
> -                       rn =3D F2FS_NODE(folio);
> -                       sum_entry->nid =3D rn->footer.nid;
> +                       sum_entry->nid =3D F2FS_NODE_FOOTER(folio)->nid;
>                         sum_entry->version =3D 0;
>                         sum_entry->ofs_in_node =3D 0;
>                         sum_entry++;
> diff --git a/fs/f2fs/node.h b/fs/f2fs/node.h
> index 0dce97aac5fc..6a2b7c63f4a3 100644
> --- a/fs/f2fs/node.h
> +++ b/fs/f2fs/node.h
> @@ -252,73 +252,68 @@ static inline void set_to_next_nat(struct f2fs_sb_i=
nfo *sbi,
>
>  static inline nid_t ino_of_node(const struct folio *node_folio)
>  {
> -       struct f2fs_node *rn =3D F2FS_NODE(node_folio);
> -       return le32_to_cpu(rn->footer.ino);
> +       return le32_to_cpu(F2FS_NODE_FOOTER(node_folio)->ino);
>  }
>
>  static inline nid_t nid_of_node(const struct folio *node_folio)
>  {
> -       struct f2fs_node *rn =3D F2FS_NODE(node_folio);
> -       return le32_to_cpu(rn->footer.nid);
> +       return le32_to_cpu(F2FS_NODE_FOOTER(node_folio)->nid);
>  }
>
>  static inline unsigned int ofs_of_node(const struct folio *node_folio)
>  {
> -       struct f2fs_node *rn =3D F2FS_NODE(node_folio);
> -       unsigned flag =3D le32_to_cpu(rn->footer.flag);
> +       unsigned int flag =3D le32_to_cpu(F2FS_NODE_FOOTER(node_folio)->f=
lag);
>         return flag >> OFFSET_BIT_SHIFT;
>  }
>
>  static inline __u64 cpver_of_node(const struct folio *node_folio)
>  {
> -       struct f2fs_node *rn =3D F2FS_NODE(node_folio);
> -       return le64_to_cpu(rn->footer.cp_ver);
> +       return le64_to_cpu(F2FS_NODE_FOOTER(node_folio)->cp_ver);
>  }
>
>  static inline block_t next_blkaddr_of_node(const struct folio *node_foli=
o)
>  {
> -       struct f2fs_node *rn =3D F2FS_NODE(node_folio);
> -       return le32_to_cpu(rn->footer.next_blkaddr);
> +       return le32_to_cpu(F2FS_NODE_FOOTER(node_folio)->next_blkaddr);
>  }
>
>  static inline void fill_node_footer(const struct folio *folio, nid_t nid=
,
>                                 nid_t ino, unsigned int ofs, bool reset)
>  {
>         struct f2fs_node *rn =3D F2FS_NODE(folio);
> +       struct node_footer *footer =3D F2FS_NODE_FOOTER(folio);
>         unsigned int old_flag =3D 0;
>
>         if (reset)
> -               memset(rn, 0, sizeof(*rn));
> +               memset(rn, 0, F2FS_BLKSIZE);
>         else
> -               old_flag =3D le32_to_cpu(rn->footer.flag);
> +               old_flag =3D le32_to_cpu(footer->flag);
>
> -       rn->footer.nid =3D cpu_to_le32(nid);
> -       rn->footer.ino =3D cpu_to_le32(ino);
> +       footer->nid =3D cpu_to_le32(nid);
> +       footer->ino =3D cpu_to_le32(ino);
>
>         /* should remain old flag bits such as COLD_BIT_SHIFT */
> -       rn->footer.flag =3D cpu_to_le32((ofs << OFFSET_BIT_SHIFT) |
> +       footer->flag =3D cpu_to_le32((ofs << OFFSET_BIT_SHIFT) |
>                                         (old_flag & OFFSET_BIT_MASK));
>  }
>
>  static inline void copy_node_footer(const struct folio *dst,
>                 const struct folio *src)
>  {
> -       struct f2fs_node *src_rn =3D F2FS_NODE(src);
> -       struct f2fs_node *dst_rn =3D F2FS_NODE(dst);
> -       memcpy(&dst_rn->footer, &src_rn->footer, sizeof(struct node_foote=
r));
> +       memcpy(F2FS_NODE_FOOTER(dst), F2FS_NODE_FOOTER(src),
> +              sizeof(struct node_footer));
>  }
>
>  static inline void fill_node_footer_blkaddr(struct folio *folio, block_t=
 blkaddr)
>  {
>         struct f2fs_checkpoint *ckpt =3D F2FS_CKPT(F2FS_F_SB(folio));
> -       struct f2fs_node *rn =3D F2FS_NODE(folio);
> +       struct node_footer *footer =3D F2FS_NODE_FOOTER(folio);
>         __u64 cp_ver =3D cur_cp_version(ckpt);
>
>         if (__is_set_ckpt_flags(ckpt, CP_CRC_RECOVERY_FLAG))
>                 cp_ver |=3D (cur_cp_crc(ckpt) << 32);
>
> -       rn->footer.cp_ver =3D cpu_to_le64(cp_ver);
> -       rn->footer.next_blkaddr =3D cpu_to_le32(blkaddr);
> +       footer->cp_ver =3D cpu_to_le64(cp_ver);
> +       footer->next_blkaddr =3D cpu_to_le32(blkaddr);
>  }
>
>  static inline bool is_recoverable_dnode(const struct folio *folio)
> @@ -378,11 +373,12 @@ static inline bool IS_DNODE(const struct folio *nod=
e_folio)
>  static inline int set_nid(struct folio *folio, int off, nid_t nid, bool =
i)
>  {
>         struct f2fs_node *rn =3D F2FS_NODE(folio);
> +       __le32 *inode_nids =3D F2FS_INODE_NIDS(folio);
>
>         f2fs_folio_wait_writeback(folio, NODE, true, true);
>
>         if (i)
> -               rn->i.i_nid[off - NODE_DIR1_BLOCK] =3D cpu_to_le32(nid);
> +               inode_nids[off - NODE_DIR1_BLOCK] =3D cpu_to_le32(nid);
>         else
>                 rn->in.nid[off] =3D cpu_to_le32(nid);
>         return folio_mark_dirty(folio);
> @@ -391,9 +387,10 @@ static inline int set_nid(struct folio *folio, int o=
ff, nid_t nid, bool i)
>  static inline nid_t get_nid(const struct folio *folio, int off, bool i)
>  {
>         struct f2fs_node *rn =3D F2FS_NODE(folio);
> +       const __le32 *inode_nids =3D F2FS_INODE_NIDS(folio);
>
>         if (i)
> -               return le32_to_cpu(rn->i.i_nid[off - NODE_DIR1_BLOCK]);
> +               return le32_to_cpu(inode_nids[off - NODE_DIR1_BLOCK]);
>         return le32_to_cpu(rn->in.nid[off]);
>  }
>
> @@ -406,8 +403,7 @@ static inline nid_t get_nid(const struct folio *folio=
, int off, bool i)
>
>  static inline int is_node(const struct folio *folio, int type)
>  {
> -       struct f2fs_node *rn =3D F2FS_NODE(folio);
> -       return le32_to_cpu(rn->footer.flag) & BIT(type);
> +       return le32_to_cpu(F2FS_NODE_FOOTER(folio)->flag) & BIT(type);
>  }
>
>  #define is_cold_node(folio)    is_node(folio, COLD_BIT_SHIFT)
> @@ -416,14 +412,13 @@ static inline int is_node(const struct folio *folio=
, int type)
>
>  static inline void __set_mark(const struct folio *folio, bool mark, int =
type)
>  {
> -       struct f2fs_node *rn =3D F2FS_NODE(folio);
> -       unsigned int flag =3D le32_to_cpu(rn->footer.flag);
> -
> +       struct node_footer *footer =3D F2FS_NODE_FOOTER(folio);
> +       unsigned int flag =3D le32_to_cpu(footer->flag);
>         if (mark)
>                 flag |=3D BIT(type);
>         else
>                 flag &=3D ~BIT(type);
> -       rn->footer.flag =3D cpu_to_le32(flag);
> +       footer->flag =3D cpu_to_le32(flag);
>  }
>
>  static inline void set_cold_node(const struct folio *folio, bool is_dir)
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 8d2224e585d3..fcaeaacaab33 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -4384,6 +4384,11 @@ static void init_sb_info(struct f2fs_sb_info *sbi)
>         sbi->blocksize =3D BIT(sbi->log_blocksize);
>         sbi->nat_entries_per_block =3D sbi->blocksize /
>                 sizeof(struct f2fs_nat_entry);
> +       sbi->addrs_per_inode =3D (sbi->blocksize - OFFSET_OF_END_OF_I_EXT=
 -
> +               SIZE_OF_I_NID - sizeof(struct node_footer)) / sizeof(__le=
32);
> +       sbi->addrs_per_block =3D (sbi->blocksize -
> +               sizeof(struct node_footer)) / sizeof(__le32);
> +       sbi->nids_per_block =3D sbi->addrs_per_block;
>         sbi->sit_entries_per_block =3D sbi->blocksize /
>                 sizeof(struct f2fs_sit_entry);
>         sbi->orphans_per_block =3D (sbi->blocksize -
> diff --git a/include/linux/f2fs_fs.h b/include/linux/f2fs_fs.h
> index d1059a27e1b9..3d0fe2c78e12 100644
> --- a/include/linux/f2fs_fs.h
> +++ b/include/linux/f2fs_fs.h
> @@ -16,6 +16,7 @@
>  #define F2FS_MAX_LOG_SECTOR_SIZE       PAGE_SHIFT      /* Max is Block S=
ize */
>  #define F2FS_LOG_SECTORS_PER_BLOCK     (PAGE_SHIFT - 9) /* log number fo=
r sector/blk */
>  #define F2FS_BLKSIZE                   PAGE_SIZE /* support only block =
=3D=3D page */
> +#define F2FS_MAX_BLKSIZE               PAGE_SIZE
>  #define F2FS_BLKSIZE_BITS              PAGE_SHIFT /* bits for F2FS_BLKSI=
ZE */
>  #define F2FS_MAX_EXTENSION             64      /* # of extension entries=
 */
>  #define F2FS_EXTENSION_LEN             8       /* max size of extension =
*/
> @@ -343,18 +344,25 @@ struct f2fs_inode {
>                                                  */
>                         __le32 i_extra_end[0];  /* for attribute size cal=
culation */
>                 } __packed;
> -               __le32 i_addr[DEF_ADDRS_PER_INODE];     /* Pointers to da=
ta blocks */
> +               DECLARE_FLEX_ARRAY(__le32, i_addr); /* data block pointer=
s */
>         };
> -       __le32 i_nid[DEF_NIDS_PER_INODE];       /* direct(2), indirect(2)=
,
> -                                               double_indirect(1) node i=
d */
> +       /*
> +        * __le32 i_nid[DEF_NIDS_PER_INODE];
> +        *
> +        * It is stored immediately before the node footer at the end of =
the
> +        * filesystem block. Its offset depends on the filesystem block s=
ize, so
> +        * locate it dynamically with F2FS_INODE_NIDS().
> +        */
>  } __packed;
>
>  struct direct_node {
> -       __le32 addr[DEF_ADDRS_PER_BLOCK];       /* array of data block ad=
dress */
> +       /* The address count depends on the filesystem block size. */
> +       DECLARE_FLEX_ARRAY(__le32, addr); /* array of data block address =
*/
>  } __packed;
>
>  struct indirect_node {
> -       __le32 nid[NIDS_PER_BLOCK];     /* array of data block address */
> +       /* The node ID count depends on the filesystem block size. */
> +       DECLARE_FLEX_ARRAY(__le32, nid); /* array of data block address *=
/
>  } __packed;
>
>  enum {
> @@ -373,7 +381,13 @@ struct f2fs_node {
>                 struct direct_node dn;
>                 struct indirect_node in;
>         };
> -       struct node_footer footer;
> +       /*
> +        * struct node_footer footer;
> +        *
> +        * It is stored at the end of the filesystem block, after the ino=
de or
> +        * direct/indirect node data. Its offset depends on the filesyste=
m block
> +        * size, so locate it dynamically with F2FS_NODE_FOOTER().
> +        */
>  } __packed;
>
>  /*
> --
> 2.53.0
>
>
>
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
