Received: from mail-yx2-f41.google.com (mail-yx2-f41.google.com [74.125.224.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B7B47DFB6
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 23:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790809479; cv=none; b=ahJHqNzH/MAS7MI9TVRVcDd2XjVCx93YhzKIKHQQUJFw56QRd4nl1hTgEWuDpgjkdI8N96eSbDM3BtTX3EFPxa5TtXl2dg/pXywd2Dxh6HA723HCHgtHVXNjI4UB2rLLKYqb+hVyJ0gYgaDTpumyJnZhzxXBdNgZvtSDYa1ZHh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790809479; c=relaxed/simple;
	bh=ThQU2yfzHfJ+3NMv4vbKr85wtEn+dgPKPZN3eTjs8vE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=H7yR7xtsI37h84+P3pbE6fVBV6Lc4U+ia/0LiHxR1SFTi0ijNqp7xZEEm6csJRtsojtslWlF6fowAviG1/zH795ocHf3/zt7BwRlrkoxHFjlpr+aLS+z07QHR+oFRpOX3rxE8ZCQCUeCMUX5jKF/vAFQBchKM43Vm4D92u20UCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dubeyko.com; spf=pass smtp.mailfrom=dubeyko.com; dkim=pass (2048-bit key) header.d=dubeyko-com.20251104.gappssmtp.com header.i=@dubeyko-com.20251104.gappssmtp.com header.b=tu8DMyjj; arc=none smtp.client-ip=74.125.224.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dubeyko-com.20251104.gappssmtp.com header.i=@dubeyko-com.20251104.gappssmtp.com header.b="tu8DMyjj"
Received: by mail-yx2-f41.google.com with SMTP id 956f58d0204a3-6737f0593faso5022513d50.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 16:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dubeyko-com.20251104.gappssmtp.com; s=20251104; t=1790809474; x=1791414274; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7cdr/pnLmGxl2LSkGBhkrB7Pq0DQE4Hq/ddKIR38DJ0=;
        b=tu8DMyjjM6g0j0q0oq3sr3Fd2rY2s8OFaY3UvoTSnYO1DClVMX9bJCAWnC5SnRxqUe
         snLWhg5h0FhYNC75BQUQZSRsdWk0iAGHnSpXzRi4Gf69QeFL/LEP+vi3kIiHnCP78Dgg
         IxFkNMbTDa5wMEX4gZpXuZrSlxbyuhBXhrWwdPWJ1u7FFqe7alcv3szElXFSQsfqswH0
         kn5ubxi74sScdFz2lFGnNHdZWM2tAz3DQB4RQhdra6O0cGgXeEaOPYMlR8m9DGXJTW6z
         QZsfZHY08s2brjDKGb7Q3scP8av0A2+jlLTBO5D0v8Uv6rXC7E8PvvMNBDHxBrh+oF5h
         o5Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790809474; x=1791414274;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7cdr/pnLmGxl2LSkGBhkrB7Pq0DQE4Hq/ddKIR38DJ0=;
        b=robunbUEhfDel8szh84qUmxEtu9YUG7Io9mbDZbytfDdeHSfU/igCUjdC1KsnBVS1l
         ckwL+dBm9Ee9s9ERsXXUdoRrJyqGwc+WapVXYhNsh9uS25Z275VLzE6Hay64Oo1+3I/Y
         TboKKMq2fBJ08XXJVitQxsGW9mMpB3nGsbQ64OYE1gBnmHxo1gYyqP/x2py18i9IgruG
         OVu3ze3kqmYST34+Pa/Kkw6lRzuucT4wvaS6jG1a1eunycXHThnNXL/chU8jAco/Y+sn
         l5uOnxlZywbkGI//kuXntg6ifAjpqRzjB7tXkkJEo9CO20utrIOSM6WFyTQVSjAmBm6w
         Tslg==
X-Forwarded-Encrypted: i=1; AKwUvBxJ+pz17sixEj0OfoCYfmIFj+ubtYUsk7BpfD5nys+2muWw6STXM86Rf17r71FqtbFTJ0PIAWy2dNULyRE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJkkI+7r2M/WpZNDRX13gj04pmZBy2G4WyEJF4Y/6z79M9fA4+p
	o0QRjtib0SUf+ihC5CfhtfAOC0b7kJY2vCCcqm/1THVEe0eHzapt8cfDFYKf2m2JbRk=
X-Gm-Gg: AYBFou2rHljtHRucqOcMp07R7arEjne/GSc15biWISNcS9WX27gxH26lb91JYG2pz8T
	jEn+LX4Bfw1CCW4bxVa2LP70sYpjCZdtAoHvwvnVsanax727PnWmiReK9Ev9Ro/jdVdPXo2oCL4
	Uxb2Pg68sdNdkoH1cjGWMsOtjNVqvrWEWsah40ys0J4TaYeWQfm86lqCrfliuH/YTHaQgG1VGgl
	Hipsjh41rVFvx4MI3nV4W6ggF2CctKQKaqNoJw3zzIKfpll2u/UvVvugQAPmQOOBOffhqEj1a4K
	sc9Q7jvVZk64KqHm/CG+0JjpnKJOmNyhxns9FAfpSt1GcUU8gBzkc5syRdBBK7sVg63mCEDETH5
	RiW1yqXWuh+/d22vjniGLW0KSUSclcEQPHhhdRa0hT7hku+sRf5ZVBkYayJDE2vY9b6Kr9mQ2xj
	blnYChSeghvelEK0kG5z/1JrpIsGaz1/dYMGz4ZarWmVpuKbLfoa+jVgXl1fmXXS9UCTdkMC5mP
	/O0+PSLYk3zOgth9c/yKsUjpaucyHLfhyg472olRlVvah6bNAXpw29eCqDL5RoYmtkzX3giOfWc
	KHRrVfERHZz/D+nBvUpNdO5I3tSOYXHO/GS/oZzehWEwrJAo7P9lQAjP3kWKZEJ4
X-Received: by 2002:a05:690e:b86:b0:672:d629:df30 with SMTP id 956f58d0204a3-6768316bf0cmr1354412d50.0.1790809473567;
        Wed, 30 Sep 2026 16:04:33 -0700 (PDT)
Received: from ?IPv6:2600:1700:6476:1430:487b:bc91:650e:71d4? ([2600:1700:6476:1430:487b:bc91:650e:71d4])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67691838a44sm376245d50.10.2026.09.30.16.04.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 16:04:32 -0700 (PDT)
Message-ID: <ea8cfa5978a90d27e498fae626edfdae5bf84af7.camel@dubeyko.com>
Subject: Re: [PATCH] hfsplus: free cached B-tree nodes on hfs_btree_open()
 error path
From: Viacheslav Dubeyko <slava@dubeyko.com>
To: Mahmut Emin Kurhan <guvenlik@noroxi.com>, linux-fsdevel@vger.kernel.org
Cc: glaubitz@physik.fu-berlin.de, frank.li@vivo.com, 
	linux-kernel@vger.kernel.org
Date: Wed, 30 Sep 2026 16:04:29 -0700
In-Reply-To: <20260930185033.1335238-1-guvenlik@noroxi.com>
References: <20260930185033.1335238-1-guvenlik@noroxi.com>
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

On Wed, 2026-09-30 at 20:50 +0200, Mahmut Emin Kurhan wrote:
> hfs_btree_open() can fail after hfs_bnode_find(tree,
> HFSPLUS_TREE_HEAD)
> has already inserted the head node into tree->node_hash.
>=20
> __hfs_bnode_create() inserts the new bnode into tree->node_hash
> before
> it reads the node's pages; if a page read fails it sets
> HFS_BNODE_ERROR
> and returns the node still hashed. hfs_bnode_find() then takes its
> node_error path, which calls hfs_bnode_put(). hfs_bnode_put() only
> frees
> a node once its refcount reaches zero *and* HFS_BNODE_DELETED is set;
> for
> the errored head node that flag is not set, so the node stays in
> tree->node_hash with a zero refcount.
>=20
> hfs_btree_open() then sees IS_ERR(node) and jumps to free_tree:,
> which
> does a bare kfree(tree). Only hfs_btree_close() walks tree-
> >node_hash[]
> and frees the cached nodes, so the head node is leaked. Mounting a
> crafted HFS+ image whose head B-tree node fails to read therefore
> leaks
> kernel memory on every attempt.

I assume that HFS code requires the same fix. Am I right?

>=20
> Reported by kmemleak while fuzzing HFS+ image mounts:
>=20
> =C2=A0 BUG: memory leak
> =C2=A0 unreferenced object (size 192):
> =C2=A0=C2=A0=C2=A0 __hfs_bnode_create+0x105/0x8d0 fs/hfsplus/bnode.c
> =C2=A0=C2=A0=C2=A0 hfsplus_bnode_find=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fs/hfsplus/bnode.c
> =C2=A0=C2=A0=C2=A0 hfsplus_btree_open=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fs/hfsplus/btree.c
> =C2=A0=C2=A0=C2=A0 hfsplus_fill_super=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fs/hfsplus/super.c
>=20
> Free any nodes still present in tree->node_hash on the error path
> before
> freeing the tree. The paths that reach free_tree before
> hfs_bnode_find()
> have an empty hash, so the loop is a no-op there.
>=20
> Found via coverage-guided fuzzing (syzkaller + kmemleak) by Noroxi.
>=20
> Signed-off-by: Mahmut Emin Kurhan <guvenlik@noroxi.com>
> ---
> =C2=A0fs/hfsplus/btree.c | 18 ++++++++++++++++++
> =C2=A01 file changed, 18 insertions(+)
>=20
> diff --git a/fs/hfsplus/btree.c b/fs/hfsplus/btree.c
> index 2ea8cd565..3de32f221 100644
> --- a/fs/hfsplus/btree.c
> +++ b/fs/hfsplus/btree.c
> @@ -403,6 +403,24 @@ struct hfs_btree *hfs_btree_open(struct
> super_block *sb, u32 id)
> =C2=A0	tree->inode->i_mapping->a_ops =3D &hfsplus_aops;
> =C2=A0	iput(tree->inode);
> =C2=A0 free_tree:
> +	/*
> +	 * A B*tree node may already have been inserted into tree-
> >node_hash
> +	 * (e.g. an errored head node from hfs_bnode_find()).=C2=A0 Only
> +	 * hfs_btree_close() frees hashed nodes, so a bare
> kfree(tree) here
> +	 * leaks them.=C2=A0 Release them before freeing the tree.
> +	 */
> +	{

I don't like of introducing the brackets here. Let's declare the
variables at the beginning of the method.

> +		int i;
> +		struct hfs_bnode *node;

We already has this declaration [1].

> +
> +		for (i =3D 0; i < NODE_HASH_SIZE; i++) {
> +			while ((node =3D tree->node_hash[i])) {
> +				tree->node_hash[i] =3D node-
> >next_hash;
> +				hfs_bnode_free(node);
> +				tree->node_hash_cnt--;
> +			}
> +		}

This logic looks pretty similar to the hfs_btree_close(). Should we
introduce a small method that can be reused in both cases?

I assume that you are not using the spin_lock(&tree->hash_lock) because
the tree creation is not finished and nobody can try to use the tree.
Am I right?

Thanks,
Slava.

[1]
https://elixir.bootlin.com/linux/v7.3-rc3/source/fs/hfsplus/btree.c#L273

> +	}
> =C2=A0	kfree(tree);
> =C2=A0	return NULL;
> =C2=A0}
> --
> 2.43.0
