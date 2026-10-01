Received: from mail-yx2-f41.google.com (mail-yx2-f41.google.com [74.125.224.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8857E48095F
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 20:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790884997; cv=none; b=oSvaxzLxZq7KyJSgsB6rlCMYFtv1cNrMTCPug5FX/rzkf+jPLSmBekH8kjbPnINLepVdT4Mop2mK8mrMibq9t2c9tqV2rbpvev38+dxE5GHoad67ejeXAtJ3Jn6UxEmhzFgNOslYhzIafjBEC/IuIH/a5DUlKoVfF5pWcjqA5hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790884997; c=relaxed/simple;
	bh=FUxiGFNE/PJoZXySOPijoNHLpRWHLHeESFpN6+9jSv0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=O5YU5wL2POoulpyeC9TNGuwnhrGVS3xgX1ArSK4ccHmMatu/YXisq1pJ6QhEPiJn9LiGgKdqCDQ4FLynH3R7J4Uv/fkX0SMKEVqvvZjOY1ll6Ei3sWEwL5j0QbLZk2669hGc8oYp4iHx/3yD9A5DP/TMhqwA+YF5Zw7f11D8DTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dubeyko.com; spf=pass smtp.mailfrom=dubeyko.com; dkim=pass (2048-bit key) header.d=dubeyko-com.20251104.gappssmtp.com header.i=@dubeyko-com.20251104.gappssmtp.com header.b=T9vSWQW8; arc=none smtp.client-ip=74.125.224.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dubeyko-com.20251104.gappssmtp.com header.i=@dubeyko-com.20251104.gappssmtp.com header.b="T9vSWQW8"
Received: by mail-yx2-f41.google.com with SMTP id 00721157ae682-8a8496fd8c3so76237457b3.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 13:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dubeyko-com.20251104.gappssmtp.com; s=20251104; t=1790884993; x=1791489793; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nZvMd8RmzK2lXJt021rZATivqtCbSEVqDFL4v6LZrNE=;
        b=T9vSWQW8dY1lbg/0v0N7VQsbzS3L7+6a+mmQ6YWWqSAjqA3ApCeYJ/u9GMLPDZHQ/F
         kwFVGAKZmaK63khgPx+iv3Zwv9tdYSfFMEpc4AcrkyRwGX6bgAZsIy4BpvuL/Yz9bt/e
         P8KYopOxYImH6lrHNVqChjhf9Fwah5W/m6eHBZ4KLew1b2cVuHSW25HMHJYGJyITIzBd
         B08OtYRetr1g8Zb7bmdiR2UXiwbunZtpsXm0S0cQ8lLdVHuTIJ/5kUtlkgFzF7wu9IG+
         6/iX8tKgda8/z4rUSC3SVp1FSR+YOuhNIIYwBkEWUIpOlnW26vzdaj/CEr7Itz5nejzQ
         VJQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790884993; x=1791489793;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nZvMd8RmzK2lXJt021rZATivqtCbSEVqDFL4v6LZrNE=;
        b=XKpY8jbnPXCBUH/EJvVk79OAdCca0mTDfQ8Tbx29ZCxxuAMW7eoQuShvWOkV/B83XX
         osnQij5wNmFO1qVq5BdRmrWrf8VRmOG+OiSTdgvlNnD1gYjEHPYU/0nfoC4nTrKrKUz0
         HVccg5hGGkrczZF3MwltpRmshedPmgjMtBm2L2kC7DL4It90IiqX7fHFS0oT1KT/lcdd
         6Vr/axd8swVON9A445RjOjPLvMlaaOWZ1QfrXEbH7ttqCkQ3rqwb4MF7zCTH37a9CYTK
         +YODI7j/s4p4A5pNen1hywY5BNvk4Ow1sBLdwmJcTBfoNQmIU8ubEIDUMOQeKgj5Cgnh
         mAOw==
X-Forwarded-Encrypted: i=1; AKwUvBxuUnE2lRPo2/rC9GI1ACPCKWeyN+8+kBSn/FWuYE0tlMlw9VMiCxHdZizDNINF2u7P4vRV1aC9hh6vC3k=@vger.kernel.org
X-Gm-Message-State: AFq9FYJybbKqZP9MSHRCBfdwIHCbw286SVVj6Br7MWvNSWsxAE8UeTuz
	MTjoCAFN80WEFhG0QJkA0SUJBTNVhnD49i6sXKiaYfpvAgr6oGz7/b5j//u8CXReANg=
X-Gm-Gg: AYBFou214sRybloroafPITcaeGtZn/8U38FthWFWPL9vdKJIJy10MiNGJLVBSSjB+ed
	oehFsAH/Vm7UC8qDZWVOYS+5iiwhsjFM7aRn1tUYPq+0v/2+OyXRpy4xMCgLdKAjJkHSZdoFcAb
	3ZGRu6GXZdoVQ9QCJOj5BY/HsMSqmBILCgkYygpycaFo2NNwqES/S4JJxtl9Z7KHIGb0np1OQ6U
	ofadyZ+wSo0G5iNXWwfAbt89dZsB8mwIDW1TsS/p7tNOX54Aq5o+aAIXsByhZx347tSMKCupNSb
	LWL+vD6qZ6K5FVvo8pPwJN2fwr8uzBLRRxVkTjkaorbXPrFbgPEbvOK4fTTE6HfF18B8AsQVaur
	pMRb9hQYC1jVHMLjd3eCsBIik7oRL2dZ2OC+mikp2RS7yaht9E8Y/26Ep7y+EW+imYv3peY0DoU
	WQq+NkLoEPK3EuncuEXmqqWY5E0sTrlFq773MSx7H5lwCaLys7bWNtHr7kc8cF9jD7IG6iSvmrk
	NGGl/t+s6yrpkgLMd9uD4P91xnfcZHIDRTFvJGE+Xhtdth3k0AfV04d9LQ8X35uZyk680N952Iq
	covVfDtWrHw/KpeWv0yWdhZ6AKXTiVJOYBwQtQkA82PnCR+66C500m7PQO+bOEWqTg==
X-Received: by 2002:a05:690c:e142:20b0:8a8:7fda:15f9 with SMTP id 00721157ae682-8ae3a3f0c31mr1362777b3.61.1790884993428;
        Thu, 01 Oct 2026 13:03:13 -0700 (PDT)
Received: from ?IPv6:2600:1700:6476:1430:67c2:3447:e08d:9418? ([2600:1700:6476:1430:67c2:3447:e08d:9418])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8ae333e6341sm1536497b3.35.2026.10.01.13.03.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 13:03:11 -0700 (PDT)
Message-ID: <0de056179e3e0a7c4ef525cdb143647b7493dc71.camel@dubeyko.com>
Subject: Re: [PATCH v2 1/2] hfsplus: free cached B-tree nodes on
 hfs_btree_open() error path
From: Viacheslav Dubeyko <slava@dubeyko.com>
To: Mahmut Emin Kurhan <guvenlik@noroxi.com>, linux-fsdevel@vger.kernel.org
Cc: glaubitz@physik.fu-berlin.de, frank.li@vivo.com, 
	linux-kernel@vger.kernel.org
Date: Thu, 01 Oct 2026 13:03:07 -0700
In-Reply-To: <20260930232312.1405042-2-guvenlik@noroxi.com>
References: <ea8cfa5978a90d27e498fae626edfdae5bf84af7.camel@dubeyko.com>
	 <20260930232312.1405042-1-guvenlik@noroxi.com>
	 <20260930232312.1405042-2-guvenlik@noroxi.com>
Autocrypt: addr=slava@dubeyko.com; prefer-encrypt=mutual;
 keydata=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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.1 (by Flathub.org) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2026-10-01 at 01:23 +0200, Mahmut Emin Kurhan wrote:
> hfs_btree_open() can fail after hfs_bnode_find(tree,
> HFSPLUS_TREE_HEAD) has
> already inserted the head node into tree->node_hash.
>=20
> __hfs_bnode_create() inserts the new bnode into tree->node_hash
> before it
> reads the node pages; if a page read fails it sets HFS_BNODE_ERROR
> and
> returns the node still hashed. hfs_bnode_find() then takes its
> node_error
> path and calls hfs_bnode_put(), which only frees a node once its
> refcount
> reaches zero *and* HFS_BNODE_DELETED is set. For the errored head
> node that
> flag is not set, so it stays in tree->node_hash with a zero refcount.
>=20
> hfs_btree_open() then sees IS_ERR(node) and jumps to free_tree:,
> doing a
> bare kfree(tree). Only hfs_btree_close() walks tree->node_hash[] and
> frees
> the cached nodes, so the head node is leaked. Mounting a crafted HFS+
> image
> whose head B-tree node fails to read leaks kernel memory on every
> attempt.
>=20
> Factor the node-hash freeing out of hfs_btree_close() into a small
> helper
> hfs_bnode_hash_free() and call it from both hfs_btree_close() and the
> hfs_btree_open() error path. No hash_lock is taken because the tree
> is not
> published yet, so no other thread can reach it.
>=20
> Found via coverage-guided fuzzing (syzkaller + kmemleak) by Noroxi.
>=20
> Signed-off-by: Mahmut Emin Kurhan <guvenlik@noroxi.com>
> ---
> =C2=A0fs/hfsplus/btree.c | 35 ++++++++++++++++++++---------------
> =C2=A01 file changed, 20 insertions(+), 15 deletions(-)
>=20
> diff --git a/fs/hfsplus/btree.c b/fs/hfsplus/btree.c
> index 2ea8cd565..41e01380d 100644
> --- a/fs/hfsplus/btree.c
> +++ b/fs/hfsplus/btree.c
> @@ -265,6 +265,24 @@ static const char *hfs_btree_name(u32 cnid)
> =C2=A0}
> =C2=A0
> =C2=A0/* Get a reference to a B*Tree and do some initial checks */
> +static void hfs_bnode_hash_free(struct hfs_btree *tree)
> +{
> +	struct hfs_bnode *node;
> +	int i;
> +
> +	for (i =3D 0; i < NODE_HASH_SIZE; i++) {
> +		while ((node =3D tree->node_hash[i])) {
> +			tree->node_hash[i] =3D node->next_hash;
> +			if (atomic_read(&node->refcnt))
> +				pr_crit("node %d:%d still has %d
> user(s)!\n",
> +					node->tree->cnid, node-
> >this,
> +					atomic_read(&node->refcnt));
> +			hfs_bnode_free(node);
> +			tree->node_hash_cnt--;
> +		}
> +	}
> +}
> +
> =C2=A0struct hfs_btree *hfs_btree_open(struct super_block *sb, u32 id)
> =C2=A0{
> =C2=A0	struct hfs_btree *tree;
> @@ -403,6 +421,7 @@ struct hfs_btree *hfs_btree_open(struct
> super_block *sb, u32 id)
> =C2=A0	tree->inode->i_mapping->a_ops =3D &hfsplus_aops;
> =C2=A0	iput(tree->inode);
> =C2=A0 free_tree:
> +	hfs_bnode_hash_free(tree);
> =C2=A0	kfree(tree);
> =C2=A0	return NULL;
> =C2=A0}
> @@ -410,24 +429,10 @@ struct hfs_btree *hfs_btree_open(struct
> super_block *sb, u32 id)
> =C2=A0/* Release resources used by a btree */
> =C2=A0void hfs_btree_close(struct hfs_btree *tree)
> =C2=A0{
> -	struct hfs_bnode *node;
> -	int i;
> -
> =C2=A0	if (!tree)
> =C2=A0		return;
> =C2=A0
> -	for (i =3D 0; i < NODE_HASH_SIZE; i++) {
> -		while ((node =3D tree->node_hash[i])) {
> -			tree->node_hash[i] =3D node->next_hash;
> -			if (atomic_read(&node->refcnt))
> -				pr_crit("node %d:%d "
> -						"still has %d
> user(s)!\n",
> -					node->tree->cnid, node-
> >this,
> -					atomic_read(&node->refcnt));
> -			hfs_bnode_free(node);
> -			tree->node_hash_cnt--;
> -		}
> -	}
> +	hfs_bnode_hash_free(tree);
> =C2=A0	iput(tree->inode);
> =C2=A0	kfree(tree);
> =C2=A0}

Now your patch conflicts with [1]. Please, base your patch on for-next
branch of HFS/HFS+ git tree [2].

Thanks,
Slava.

[1]=C2=A0https://lore.kernel.org/r/20260921153729.600313-1-bruno.produit@tr=
ailofbits.com
[2]
https://git.kernel.org/pub/scm/linux/kernel/git/vdubeyko/hfs.git/log/?h=3Df=
or-next
