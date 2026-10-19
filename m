Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792452560;
	b=ivzlXiNXFKqzYJ1QVdaRBWaINk8PRTrsXnGaO4wdpghJ8EzCq8GYqEBp+ayQ1xcoFc3D
	 xV5nYMjYaDSzrsTE5vJdX7ob3sFtmdoVQNHvQVCPTgXVmTSwIHcXwF0Ma7hKRhP05HKNT
	 PNs2DiITBf26JSIdsfq/hkxRt/IpmYS1JRHJ17DbZZVK9FTA862ILfZTubBE2YksBEA69
	 cw+vXICT6qN/l3QeZ8QvD7frbdATeIAPNZTkqOaaBe6Ia+e2IGlJ7ZetB6zE+O1mEzzpt
	 BLNjK2jWKpOUsoOjOscFCnOswr53pSdFwLyvOFlMarcTg4b1zOp8lSqZhmjkq1AU/9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792452560;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:Autocrypt:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=4TirjOQRZRPCBDDxEN9G0F42E5yvl5uRZgUb6F1K8zs=;
	b=mx6MkHWeSqhWpvffPTHB5M6fPKjgVgAb6/HXnHdBbXe2WKNcXHJg5BZsJZiCzTGSxwrH
	 drDo5b9xvhe94SLe7EATpTxe5DoUhkMKsyVax7uMgg37UVyyP/Fdv+dGTVNl1pDx5jVgp
	 DKkaHFGYlVmpLHrzbMysRv2pM5LbmAZYUegFsYCQcMqDRmUtRBysD+JxRsxIatSkn7jjy
	 BcVz3sF2mP/YAtYRwH3rz437+Qyq5jjwovfo++FaP/hkKfqKl2GVwW47c2vHuOQoUXn9v
	 qBRGakn5UDdMbBzAaygqqrAYXzz4uiAnZpKbx+QQDW9k9BY4Y0NZG+TasNgyJRfFvVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dubeyko.com;
	spf=pass smtp.mailfrom=dubeyko.com;
	dkim=pass header.d=dubeyko-com.20251104.gappssmtp.com header.i=@dubeyko-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=Aagl7Qxp;
	arc=none smtp.remote-ip=74.125.224.50
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBCB7606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 23:29:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBCB7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dubeyko-com.20251104.gappssmtp.com header.i=@dubeyko-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=Aagl7Qxp
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-679a2297c55so1952209d50.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 16:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dubeyko-com.20251104.gappssmtp.com; s=20251104; t=1792452559; x=1793057359; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4TirjOQRZRPCBDDxEN9G0F42E5yvl5uRZgUb6F1K8zs=;
        b=Aagl7QxpNverpNeg9pGNLXE8RuBbwstWy7eM6gTw1jZczKGbcnYCrZ5r9/nBKl7TXs
         f9dxhBpwNhgIYZi7mQhfc1QmmtYBbZ/v7/gptWMxlJXIc3Qy5h9exzJvoLUmZ4iN0/vu
         y5fd8r7L0FTbQYUcT5F8fBaBVhFJNvbbOZNLJSudblxsqIBdoeOm0lDSdxAXGSiXMqjm
         tedi49TB9zumWq1i/5eI/rijUJ54BHIaoB7N/zIFTr6MS9/HXpI8AWgDQrUVihSWoFST
         +8wkHaxgopddkvBUd40nfSZmdwtqm1bEoNArRa0O0GwGxJHvojsx2XhyaIkZrzcV3Cmg
         IHpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792452559; x=1793057359;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4TirjOQRZRPCBDDxEN9G0F42E5yvl5uRZgUb6F1K8zs=;
        b=ZWiD71mPWSAA6LIT6zNclWuZdNq3Zr+yWdN3pLEU+bH8voRsFTqOPwzZXm6jwaPAZo
         hPc4T+a2MuY5YEtnOszJp07oNwR8LiUUUP7UjY8Och9WUSy/sXO86Jk5lTW/VvQWUDgH
         HnVUir6LDiRLigoU2m55rNJBVfoJSKaYD6fewhHUpRJKLBsElj2jqigL8w4UN5RJldRk
         74szTFNpQX0RR55q67fV9ZF2elqE9mOVvcgwgJQ7A3LdpyKJo/PYgDpM1dHpBpy11ECf
         tovM44xgh0JWU2RcuHGlaRdQWPqKfdcTBHsMf2zRf666DqSELiw7WHDzYuK6+Mb9KCgY
         8zqg==
X-Forwarded-Encrypted: i=1; AKwUvBxf+eFL2g+dJ/6z2olulSGpuWnvrwub5vJh0ib6mMy7BFXKQOBEXXA245TKC3NU0if7RgnxiqaOWO/56rk=@vger.kernel.org
X-Gm-Message-State: AFq9FYI6a2KcmP9MyV2aQANMWirfeKSUAXfVVtThNfu27UmWXQdH2zmW
	l2eg+6vjBcovoJU9Q8zjEFKZ3BvvNNhO19vEntjBxPU4XCttgVZ5pobolGinOv7lU9A=
X-Gm-Gg: AYBFou3bPuEpKF0wmTZGkpjNMnT+bJ+P6svP+uocBhBFFpBQNEflXtTXPJRlP3z78Qy
	T+R0hGbUC2tW7mzwYUgXqtggfl+I66sea8uovWLmTIL965TpKFWFK9CQqRjZYaUkVZBjblggHrc
	zsrefNaQlaIAJ+FTKUX3KJACz6mJdkGPHm9yvSuJeUHk+oiev11UsjSLvWTUL6efXrbMTGqybMA
	dcE6HTHuETADSEr7jVwTNXv9t0Yiuo66B1cLQ+gcWA6ejQ1BnYKRKB59i+Iya7DXqSbrlcki3va
	3F4H22mc/mQEkvlJlCxi2P8XT0Ig+RnhWnDslGwMd2HrCbGdAqtSw+bHmjaEUzJEEddJH2/9T6e
	jMcV58VoVDzPKgbVn3E+SZW/qF4uJNJB2EiMbcd+nxANQYgxqnU5+jex7uxLIuijnstjsUOhkxy
	XrNGbFl1LC8oxxm53ymxVFcikRxT6zMMnOqijn1T4JhTrO42S4rDxlCJo4qZQRFasOzzEvigip/
	xCkRquD0w69HYrH9wKMqastHZG/hjelk8kTOUhz4qPcSQci/wmQ9+5suTfkfYCgGPbOPYEqdtfQ
	lp/R1dsfp67r5C+phC1YBA9lTOg0ypFUlslx7bVq8KIBbVvpWfUYFcbYhMxzcg==
X-Received: by 2002:a05:690e:168c:b0:679:9793:5fbd with SMTP id 956f58d0204a3-679ca78f629mr3772919d50.42.1792452558870;
        Mon, 19 Oct 2026 16:29:18 -0700 (PDT)
Received: from ?IPv6:2600:1700:6476:1430:9597:5848:ae16:6bc? ([2600:1700:6476:1430:9597:5848:ae16:6bc])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-679b1e79bcesm4462270d50.12.2026.10.19.16.29.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 16:29:18 -0700 (PDT)
Message-ID: <b6f1cb66778d09015ad5862ff273edc37c44ef28.camel@dubeyko.com>
Subject: Re: [PATCH] hfs: avoid reusing occupied CNIDs after deletion
From: Viacheslav Dubeyko <slava@dubeyko.com>
To: Hengyu Liang <hengyul@cs.unc.edu>
Cc: glaubitz@physik.fu-berlin.de, frank.li@vivo.com, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Date: Mon, 19 Oct 2026 16:29:16 -0700
In-Reply-To: <20261015110114.1649059-1-hengyul@cs.unc.edu>
References: <20261015110114.1649059-1-hengyul@cs.unc.edu>
Autocrypt: addr=slava@dubeyko.com; prefer-encrypt=mutual;
 keydata=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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.1 (by Flathub.org) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Thu, 2026-10-15 at 07:01 -0400, Hengyu Liang wrote:
> Commit a06ec283e125 ("hfs: add logic of correcting a next unused
> CNID")
> made hfs_correct_next_unused_CNID() use the CNID of the last file or
> directory record in catalog key order to lower next_id after
> deletion.
>=20
> However, catalog keys are sorted by parent directory ID and name,
> not by the record's own CNID. The resulting next_id can still be in
> use, so hfs_cat_create() finds an existing thread and returns EEXIST.
> Commit 6592287869bf ("hfs: fix incorrect inode ID assignment in
> hfs_new_inode()") exposed this issue by correcting the inode ID.

Frankly speaking, I don't see how your modification can fix anything.
From my point of view, the current logic is correct. Probably, the call
of this method is not in the proper place.

>=20
> On a freshly formatted and mounted HFS volume, run:
>=20
> =C2=A0=C2=A0=C2=A0 mkdir z
> =C2=A0=C2=A0=C2=A0 : > a
> =C2=A0=C2=A0=C2=A0 : > b
> =C2=A0=C2=A0=C2=A0 rm b
> =C2=A0=C2=A0=C2=A0 : > c
>=20
> Without this fix, creating c fails with EEXIST, although c does not
> exist. With the fix, it succeeds on the first attempt.
>=20
> First look up the preceding CNID: if it exists, it must be the
> largest
> remaining ID. Otherwise, scan all file and directory records for the
> maximum, including files without optional thread records. Follow the
> leaf links regardless of node numbers, bound the walk by the total
> node count, and acquire a reference on every visit so malformed
> cycles
> cannot loop indefinitely or reuse a released node.
>=20
> Fixes: a06ec283e125 ("hfs: add logic of correcting a next unused
> CNID")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Hengyu Liang <hengyul@cs.unc.edu>
> ---
> The fallback follows leaf sibling links independently of node
> numbers.
> Bound its iterations by the tree's total node count and acquire a
> fresh
> node reference on every visit, including when a cycle returns to the
> tail.
> The budget check runs before acquisition; exhaustion returns EIO
> without
> using the partial maximum to update next_id.
>=20
> Tested on v7.3-rc6 with GCC 10.5 and the unchanged KASAN
> configuration:
> 14 normal-volume cases passed, including predecessor lookup, ID
> holes,
> missing file threads, concurrency and reordered leaf node numbers.
> Three malformed prev chains (tail self-loop, a loop returning to the
> tail,
> and a loop excluding the tail) each returned EIO after exactly
> node_count
> visits. The on-disk next CNID was unchanged; no KASAN or BUG was
> observed.
>=20
> =C2=A0fs/hfs/catalog.c | 80 +++++++++++++++++++++++++++++----------------=
-
> --
> =C2=A01 file changed, 48 insertions(+), 32 deletions(-)
>=20
> diff --git a/fs/hfs/catalog.c b/fs/hfs/catalog.c
> index 490c5e130da3..2d90f1857781 100644
> --- a/fs/hfs/catalog.c
> +++ b/fs/hfs/catalog.c
> @@ -269,48 +269,54 @@ void hfs_set_next_unused_CNID(struct
> super_block *sb,
> =C2=A0 * Correct the next unused CNID of Catalog Tree.
> =C2=A0 */
> =C2=A0static
> -int hfs_correct_next_unused_CNID(struct super_block *sb, u32 cnid)
> +int hfs_correct_next_unused_CNID(struct super_block *sb,
> +				 struct hfs_find_data *fd, u32 cnid)
> =C2=A0{
> =C2=A0	struct hfs_btree *cat_tree;
> =C2=A0	struct hfs_bnode *node;
> +	u32 max_cnid =3D 0;
> +	u32 remaining;
> =C2=A0	s64 leaf_head;
> =C2=A0	s64 leaf_tail;
> =C2=A0	s64 node_id;
> +	int res;
> =C2=A0
> =C2=A0	hfs_dbg("cnid %u, next_id %lld\n",
> =C2=A0		cnid, atomic64_read(&HFS_SB(sb)->next_id));
> =C2=A0
> -	if ((cnid + 1) < atomic64_read(&HFS_SB(sb)->next_id)) {
> +	if ((cnid + 1) !=3D atomic64_read(&HFS_SB(sb)->next_id)) {

I don't quite follow why do we need to change this check? If cnid + 1
is smaller than the maximum one, then cnid + 1 is in use yet. We don't
need to execute any additional logic. What am I missing here?

> =C2=A0		/* next ID should be unchanged */
> =C2=A0		return 0;
> =C2=A0	}
> =C2=A0
> +	/* If the previous CNID is still in use, it must be the
> maximum. */
> +	res =3D hfs_cat_find_brec(sb, cnid - 1, fd);

Why do we need to check something for previous one? If the bigger cnid
is in use, then we don't need to do anything here.

This patch doesn't make sense to me. I don't see how it can fix
anything. Could you please explain more clearly the problem and the
fix?

Thanks,
Slava.

> +	if (!res) {
> +		hfs_set_next_unused_CNID(sb, cnid, cnid - 1);
> +		return 0;
> +	}
> +	if (res !=3D -ENOENT)
> +		return res;
> +
> =C2=A0	cat_tree =3D HFS_SB(sb)->cat_tree;
> =C2=A0	leaf_head =3D cat_tree->leaf_head;
> =C2=A0	leaf_tail =3D cat_tree->leaf_tail;
> -
> -	if (leaf_head > leaf_tail) {
> -		pr_err("node is corrupted: leaf_head %lld, leaf_tail
> %lld\n",
> -			leaf_head, leaf_tail);
> -		return -ERANGE;
> -	}
> -
> -	node =3D hfs_bnode_find(cat_tree, leaf_tail);
> -	if (IS_ERR(node)) {
> -		pr_err("fail to find leaf node: node ID %lld\n",
> -			leaf_tail);
> -		return -ENOENT;
> -	}
> -
> +	remaining =3D cat_tree->node_count;
> =C2=A0	node_id =3D leaf_tail;
> =C2=A0
> =C2=A0	do {
> =C2=A0		int i;
> =C2=A0
> -		if (node_id !=3D leaf_tail) {
> -			node =3D hfs_bnode_find(cat_tree, node_id);
> -			if (IS_ERR(node))
> -				return -ENOENT;
> +		/* A valid leaf chain cannot visit more nodes than
> the tree. */
> +		if (!remaining)
> +			return -EIO;
> +		remaining--;
> +
> +		node =3D hfs_bnode_find(cat_tree, node_id);
> +		if (IS_ERR(node)) {
> +			pr_err("fail to find leaf node: node ID
> %lld\n",
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 node_id);
> +			return PTR_ERR(node);
> =C2=A0		}
> =C2=A0
> =C2=A0		hfs_dbg("node %lld, leaf_tail %lld, leaf_head
> %lld\n",
> @@ -331,42 +337,52 @@ int hfs_correct_next_unused_CNID(struct
> super_block *sb, u32 cnid)
> =C2=A0				pr_err("fail to get the keylen: "
> =C2=A0					"node_id %lld, record index
> %d\n",
> =C2=A0					node_id, i);
> -				return -EINVAL;
> +				res =3D -EINVAL;
> +				goto out;
> =C2=A0			}
> =C2=A0
> =C2=A0			entryoffset =3D off + keylen;
> =C2=A0			entrylength =3D len - keylen;
> =C2=A0
> -			if (entrylength > sizeof(rec)) {
> +			if (entrylength <=3D 0 || entrylength >
> sizeof(rec)) {
> =C2=A0				pr_err("unexpected record length: "
> =C2=A0					"entrylength %d\n",
> =C2=A0					entrylength);
> -				return -EINVAL;
> +				res =3D -EINVAL;
> +				goto out;
> =C2=A0			}
> =C2=A0
> =C2=A0			hfs_bnode_read(node, &rec, entryoffset,
> entrylength);
> =C2=A0
> =C2=A0			if (rec.type =3D=3D HFS_CDR_DIR) {
> +				if (entrylength !=3D sizeof(struct
> hfs_cat_dir)) {
> +					res =3D -EIO;
> +					goto out;
> +				}
> =C2=A0				found_cnid =3D
> be32_to_cpu(rec.dir.DirID);
> =C2=A0				hfs_dbg("found_cnid %u\n",
> found_cnid);
> -				hfs_set_next_unused_CNID(sb, cnid,
> found_cnid);
> -				hfs_bnode_put(node);
> -				return 0;
> +				max_cnid =3D max(max_cnid,
> found_cnid);
> =C2=A0			} else if (rec.type =3D=3D HFS_CDR_FIL) {
> +				if (entrylength !=3D sizeof(struct
> hfs_cat_file)) {
> +					res =3D -EIO;
> +					goto out;
> +				}
> =C2=A0				found_cnid =3D
> be32_to_cpu(rec.file.FlNum);
> =C2=A0				hfs_dbg("found_cnid %u\n",
> found_cnid);
> -				hfs_set_next_unused_CNID(sb, cnid,
> found_cnid);
> -				hfs_bnode_put(node);
> -				return 0;
> +				max_cnid =3D max(max_cnid,
> found_cnid);
> =C2=A0			}
> =C2=A0		}
> =C2=A0
> =C2=A0		node_id =3D node->prev;
> =C2=A0		hfs_bnode_put(node);
> =C2=A0
> -	} while (node_id >=3D leaf_head);
> +	} while (node_id);
> =C2=A0
> -	return -ENOENT;
> +	hfs_set_next_unused_CNID(sb, cnid, max_cnid);
> +	return 0;
> +out:
> +	hfs_bnode_put(node);
> +	return res;
> =C2=A0}
> =C2=A0
> =C2=A0/*
> @@ -420,7 +436,7 @@ int hfs_cat_delete(u32 cnid, struct inode *dir,
> const struct qstr *str)
> =C2=A0	inode_set_mtime_to_ts(dir, inode_set_ctime_current(dir));
> =C2=A0	mark_inode_dirty(dir);
> =C2=A0
> -	res =3D hfs_correct_next_unused_CNID(sb, cnid);
> +	res =3D hfs_correct_next_unused_CNID(sb, &fd, cnid);
> =C2=A0	if (res)
> =C2=A0		goto out;
> =C2=A0
