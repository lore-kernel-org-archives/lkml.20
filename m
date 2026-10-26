Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.219
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792982512;
	b=rwmSI8IA474jM/hpN8ZSgaRfY0V1zJNeJXb2VusRud1SwvtS5AWXL8RkQWUXp42c72n3
	 PmII4CgppCeml4KcefMLYGDcNTNIpRxjYEbdeL+1I4GKaQBes+inHAZNsuoIluCctiCU/
	 ZaOY8wOxd5pB6rYmgV1AWjUpFqPmVKekfU/rzI6146W0eGdayOpSeF5pKQw1iobjHcRSf
	 TWEOp/iJMs+7TVyWBtuqimZTScDJOacPZSjibcZ3Nj2AcbOemdVs8WYMc6JqClbDQKJjt
	 geHZY1opSUxuZHMSEWRk3u9fDYYBszxynJLS7TZ71nST0dgpFmzDIMygQi0wW6BwF+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792982512;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Subject:To:CC:
	 References:From:Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=BmpIBmwz3s7h3zyf+rZ1e2cKX1mYlPZ38XsruGm9TcI=;
	b=j8CeQv1EnveVT/lVZkx9zKTkAqYgjVKRRWmFQCMOSeIQiR5PSGE21xAjbG2+ENt5Dgrs
	 72jIWyLx2iBapD+z//p+vfiS1ZnpR6y9fECphUdg58nHnAbEQ5Zmpw9GkjB+TCA5KaQqs
	 qf9qu9t6PSu0zFuPoumt/F3u53Lfm3HQZkdN2CI94sdMMwfQNNmRXl87Y8DVY4PQmCRqz
	 4lce1sptsBNa9oc1bUeN2FyNh9s0v5nm5/2/5WNx3fDIEwz9UfWfi0/uJcFyTCIMQvhX6
	 fns8zgsrs8oY/pjTEBhAggyBYZoh6RJ5Y2PRwOvAsVegR8cEoaRresSSlN4H6jsobIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=4pwsNjr4;
	arc=none smtp.remote-ip=113.46.200.219
Received: from canpmsgout04.his.huawei.com (canpmsgout04.his.huawei.com [113.46.200.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2602C606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 02:41:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2602C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=4pwsNjr4
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=BmpIBmwz3s7h3zyf+rZ1e2cKX1mYlPZ38XsruGm9TcI=;
	b=4pwsNjr4k1dDtecgaqj4G96wRk/wSjAV9JlrpoKUeZWLVXyBuTUyD5V774noLcMo9VSkno8uZ
	TPXsM/PEFgM/6V+WZCE7mL2y/6c13K6RdRk2FUvkP/QLSVT1Yp8ZHlOldOiAcUb4t4lg1J+zhLH
	SKSuFIoQEa0jEAn2LLd2ZRQ=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4jCdDT1kw2z1prPg;
	Mon, 26 Oct 2026 10:41:29 +0800 (CST)
Received: from whupemo200011.china.huawei.com (unknown [7.152.185.179])
	by mail.maildlp.com (Postfix) with ESMTPS id 006B140537;
	Mon, 26 Oct 2026 10:41:36 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 whupemo200011.china.huawei.com (7.152.185.179) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 26 Oct 2026 10:41:35 +0800
Subject: Re: [PATCH] ubifs: check the length of index branches before reading
 them
To: Alejandro Pacheco <ale@alepacheco.dev>, Richard Weinberger
	<richard@nod.at>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <82903e1b-56b0-4947-b0ed-5c24a536491a@alepacheco.dev>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <869bf284-451c-d70f-102f-c306ad452a54@huawei.com>
Date: Mon, 26 Oct 2026 10:41:34 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <82903e1b-56b0-4947-b0ed-5c24a536491a@alepacheco.dev>
Content-Type: text/plain; charset="gbk"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 whupemo200011.china.huawei.com (7.152.185.179)

ÔÚ 2026/10/24 20:30, Alejandro Pacheco Ð´µÀ:
> From: Alejandro Pacheco <ale@alepacheco.dev>
> 
> read_znode() validates each branch of the index node it reads: the LEB
> number and offset of every branch and, in a level 0 znode, the length of
> the leaf node the branch points to, against c->ranges[]. In a znode above
> level 0, where each branch points to another index node, the length is
> not checked:
> 
> 	if (znode->level)
> 		continue;
> 
> When such a child is loaded, ubifs_load_znode() calls read_znode() for
> it, which allocates c->max_idx_node_sz bytes and has ubifs_read_node()
> read zbr->len bytes into them. Before the read, that length is bounded
> by the space left in the LEB but not by the size of the buffer; the
> length in the node header is compared with it and with c->ranges[] only
> after the read. So an image with a branch length larger than
> c->max_idx_node_sz, but within the LEB, can cause a heap buffer overflow.
> 
> dbg_check_old_index(), which walks the old index on the media when the
> chk_index debugging check is enabled, reads each child index node by its
> branch length the same way, into a buffer sized for an index node of
> c->fanout branches, without checking the length.
> 
> validate_master() already checks the root index node's length,
> c->zroot.len, against c->ranges[UBIFS_IDX_NODE]. Give every other index
> branch the same check before it is used for a read: in read_znode(), by
> running the length check level 0 branches get with type UBIFS_IDX_NODE,
> and in dbg_check_old_index(). Images written by UBIFS or mkfs.ubifs are
> not affected: an index node is ubifs_idx_node_sz() of its 1 to fanout
> branches long, which is the range in c->ranges[UBIFS_IDX_NODE], and
> ubifs_read_node() already rejects a length outside it, though only after
> the read.
> 
> This needs a crafted image (the CRC of the index node holding the branch
> catches random corruption), and mounting UBIFS needs CAP_SYS_ADMIN in
> the initial user namespace.
> 
> It was tested on a KASAN UML kernel built from this tree, with UBI on a
> 64 MiB mtdram device and the chk_index debugging check enabled. A tree of
> 1,830 files in 30 directories was copied to a freshly formatted volume,
> read back after a remount, partly deleted and copied again, and read
> back after another remount; the same tree was read back from a second
> volume written by mkfs.ubifs. Across the remounts, read_znode() read 909
> index nodes above level 0, and dbg_check_old_index() walked the old
> index at 20 commits, the whole index of each volume as it was on the
> media among them, with no KASAN report, warning or UBIFS error. This only
> runs the new checks on valid index nodes: no image with a bad branch
> length was made. It builds with no new warnings (W=1, x86_64 defconfig
> with UBIFS and KASAN), and checkpatch.pl --strict reports nothing.
> 
> An LLM coding assistant was used to find this bug and to write this
> patch and its changelog.
> 
> Fixes: 1e51764a3c2a ("UBIFS: add new flash file system")
> Cc: stable@vger.kernel.org
> Signed-off-by: Alejandro Pacheco <ale@alepacheco.dev>
> ---
>   fs/ubifs/commit.c   | 5 +++++
>   fs/ubifs/tnc_misc.c | 6 +++---
>   2 files changed, 8 insertions(+), 3 deletions(-)
> 

Reviewed-by: Zhihao Cheng <chengzhihao1@huawei.com>
> diff --git a/fs/ubifs/commit.c b/fs/ubifs/commit.c
> index 5b3a840098b..0e50b584248 100644
> --- a/fs/ubifs/commit.c
> +++ b/fs/ubifs/commit.c
> @@ -696,6 +696,11 @@ int dbg_check_old_index(struct ubifs_info *c, struct ubifs_zbranch *zroot)
>   		lnum = le32_to_cpu(br->lnum);
>   		offs = le32_to_cpu(br->offs);
>   		len = le32_to_cpu(br->len);
> +		if (len < c->ranges[UBIFS_IDX_NODE].min_len ||
> +		    len > c->ranges[UBIFS_IDX_NODE].max_len) {
> +			err = 8;
> +			goto out_dump;
> +		}
>   		key_read(c, &br->key, &lower_key);
>   		if (iip + 1 < le16_to_cpu(idx->child_cnt)) {
>   			br = ubifs_idx_branch(c, idx, iip + 1);
> diff --git a/fs/ubifs/tnc_misc.c b/fs/ubifs/tnc_misc.c
> index 10b222dc6a5..e3ae17977c9 100644
> --- a/fs/ubifs/tnc_misc.c
> +++ b/fs/ubifs/tnc_misc.c
> @@ -357,9 +357,9 @@ static int read_znode(struct ubifs_info *c, struct ubifs_zbranch *zzbr,
>   		}
>   
>   		if (znode->level)
> -			continue;
> -
> -		type = key_type(c, &zbr->key);
> +			type = UBIFS_IDX_NODE;
> +		else
> +			type = key_type(c, &zbr->key);
>   		if (c->ranges[type].max_len == 0) {
>   			if (zbr->len != c->ranges[type].len) {
>   				ubifs_err(c, "bad target node (type %d) length (%d)",
> .
> 

