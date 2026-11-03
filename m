Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793686229;
	b=i4r1RRD3vVv+OqWM/1LZDfZNwZxFf57DpgPf72BPJDeqmB4K+djeRV2b6kqCMWC7Vyc+
	 YMGxhljT81xQF9MXp0K4sfvk99B+XI2d7HfoqN1vHgb9LkyRJkmyaTUuAiwA4r4AA2sp5
	 /DOEyc/7QuCcziPx6tW4dhi6mN1/HTmDnRs9Fd49ybXFbiPMKDzKo9qagTVFCft9llXU+
	 jaWh5k/Lzg2Z+hT7mjfIq1KcUUTfi1MchtI4SeFQmZGAnvsCb9lINXiDSSlkjJ8Lj0bdc
	 EJuh5n6oLg4N8RPTejBjou87RNevpD45r4KxN8sgfFXWFM+zfU7wlnAmDV9a++ctKtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793686229;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=KFsSEq0aVdJiuWqCXjRsBsH/M8MUcBlXiOUuWRY98v0=;
	b=0e9ecuN/GQsuz2McdiDvegjW4i0CdsXU4VHuqvwewfAGPV0Bsy7AyirU8uH1d3rnCfcT
	 vj3N0CunDRHgnBAjFNqT8vggsTyGizhovrCV2MFnvwKmLTZtE/2KXXDXjWVAdeiCF2EXa
	 erHiOsomvAnh+ivUSZa19DR2o5oraxutKxJjV/qUwaOYV5vfylM/zgSTUJL/jn4wuD1Eu
	 h+maCyiVDeH3Lz10pPTmQXXHwfUESwffr0HP4ZvSOfdzNmbJxrNeLdeMh7YFh9RT56sZL
	 AMbTahKzJKvExQ1p4EmixDEe2IhD4fAMTLLBTI/s8wQr4h+qQBFIZQqAMgmrID+jbmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=asu.edu;
	spf=pass smtp.mailfrom=asu.edu;
	dkim=pass header.d=asu.edu header.i=@asu.edu header.a=rsa-sha256 header.s=google header.b=dVKg+QM7;
	arc=none smtp.remote-ip=209.85.219.46
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB3B5606A32D
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 06:10:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB3B5606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=asu.edu header.i=@asu.edu header.a=rsa-sha256 header.s=google header.b=dVKg+QM7
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-91c847584b8so4795036d6.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 22:10:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asu.edu; s=google; t=1793686228; x=1794291028; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KFsSEq0aVdJiuWqCXjRsBsH/M8MUcBlXiOUuWRY98v0=;
        b=dVKg+QM7TdJgDvPFRaY38a2lY3jCT8T3KR7+8m5gJsxM9VCBYa7/HJKMJtiyfJK1O8
         +Gnfanuh65RUjNXRznrW4CtbLeAZDc5iC+6yZM1qWVWgsURm6144zsqt+eNgFeJKrTm7
         yI+6zUSIly1nLpYRUm3mUAZuHhMnC5GhDNve6oFk7vjX0lg3tk3jUAwoJV54EExSdVrt
         dp1Kr7MtxVlpjegF1lBZUU5w9xk3EuxH44AOCB46YcBuM8EPCiSrdRG23AeEmUSmVeYX
         KEkzYIk9v9JokiZbj5MnHr245Njo5soUMLHRtnmS11WD5fM9/U3eYweOS0GABoxA9ibZ
         CJ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793686228; x=1794291028;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KFsSEq0aVdJiuWqCXjRsBsH/M8MUcBlXiOUuWRY98v0=;
        b=es3w48SbeMeCC2o9RiCUqFsk8vgQH72QjM+yaeuByZFt8vOJnmDnUARy+xST4mgn8E
         fC7SthoVZCQ2X9JZ6wZ/PNAISAVZOff5tWuxFvsR7sMsp3Ez6DiJc3NY9XS2IMevNEFH
         VrTktwPYkkOPOAIPsECdhbGXr0rcfF6TiMVi8xye+a7NpyJEMhgh7lMGX36PUDBaF2ht
         SeqJK9x/AXBi4cka/yB0tFQ0Kcyxn7osA5eKwXmqzQgDa34KzUM1cr/J2j/W1K74aFEk
         DOcK61kAfBZ3fHjAn2l+FKI925Thh02vAqlRGDFRSybmTvbMMYpQirU/i/5GlAjkCmHl
         aIuw==
X-Forwarded-Encrypted: i=1; AKwUvByI/hqukjgJXuq0lIq5VFVeavBQ+edd66p6nvyNRnfOxQf2Yl5trZkdt4BUcMpc6wYXR5TdDUoJ7URG+lw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+qvaqGt0+Oo70Wgx3eYmFxXwXU5BaMzaDsQUvFRgLoSdWxFQoW
	+xTNgOJNln+UI9PY4+qy4/dY7SicKRiFCqov66hRCCQqF35uajSkDSrR5rHUpLZkrQ==
X-Gm-Gg: AYBFou2XEBbzAn/QhgnbFMz/kxY9eKG/yXF7e5ot3Qp/R8VSIN7QDX0s4VUP9GTbEJy
	VHSsFIF/OvWmvY114VmJQuGj9r6dv899fRk9wEAR1zNDPMFQLdf9pC0FgOHy0p0OMKWMidB9YEh
	LtYHeTTw4e28r7BBJ2hdzP12Y85v0FQPdOUMS341iVOj1LSsaLLDw+fkfau15BnopaAJTda9AAJ
	2RvTb2IAoFTTO48MOfr25FwY0Zam63dMvnSmmvWeitdkwboNTnbh6VLMMse7jGI58aPd7DwJUj+
	srMNEmBvd3n5oX06kN8Hw2OLefrZg+vX1cJvcyhKzGZQNF+ZmtCONvY5Kw39zk5I0xtSHaBVQtw
	0fZ+4XMrbY7JOvrlu4Pnzn6goNdCqa0T926TsfpZ+rUgkBXEfosc2S78VRiPhKmOqskdwV5cA3b
	axqeQLdIcufGERZqhkmy2xH3m7S+uOZvGZneJR3fckH/LIY9B5YF5W8JlwJAshw+pXY20NhePXm
	+f9Umjp8mzItJl219GJP0Rmn2NobIVIHhJ3Xy3gxfZ+4zbzFHIxwKrtRg/i5vutfjoLz2fNccx9
	IKAxqIcR2+1wAZOZxD8j/hkulVK53YvZQMxpyV1XiKolz+KPvql5TgRJQwVE50k=
X-Received: by 2002:ad4:5ccb:0:b0:914:3120:b7c3 with SMTP id 6a1803df08f44-91ca4af982emr184100466d6.7.1793686227688;
        Mon, 02 Nov 2026 22:10:27 -0800 (PST)
Received: from localhost.localdomain ([2600:1011:b1ae:f075:aa26:e161:414d:7ec7])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ca807d8fasm109173076d6.41.2026.11.02.22.10.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 22:10:27 -0800 (PST)
From: Siddharth Mishra <smish149@asu.edu>
To: dsterba@suse.com
Cc: wqu@suse.com,
	boris@bur.io,
	mason@kernel.org,
	linux-btrfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Siddharth Mishra <smish149@asu.edu>
Subject: [PATCH v2 0/2] btrfs: tree-checker: reject simple quota metadata without SIMPLE_QUOTA
Date: Mon,  2 Nov 2026 23:10:19 -0700
Message-ID: <20261103061021.2213691-1-smish149@asu.edu>
X-Mailer: git-send-email 2.54.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simple quotas put two types of metadata on the disk : the status item
with SIMPLE_MODE, and the owner ref in an extent item.  These two types
are correct only when the super block has the SIMPLE_QUOTA bit.  Several
functions ASSERT() this rule.  The tree-checker does not enforce it :

- The tree-checker does not examine the status item.  A status item
  with SIMPLE_MODE and no SIMPLE_QUOTA bit causes a BUG at mount, in
  qgroup_read_enable_gen().  Patch 1 adds a check.

- For an owner ref without the SIMPLE_QUOTA bit, check_extent_item()
  gives a WARN_ON() and accepts the leaf.  When btrfs frees the extent,
  btrfs_get_extent_inline_ref_type() causes a BUG.  Patch 2 rejects the
  leaf.  syzbot found both symptoms in 2024, without a reproducer.

Two sources can put these states on a disk : a damaged or crafted
image, and a power failure just after simple quotas were enabled on a
kernel without commit f2363e6fcc79 ("btrfs: fix transaction atomicity
bug when enabling simple quotas").

Found by fuzzing. An AI tool helped with the analysis and the patches.

I reproduced both problems with crafted images on for-next.  With the
patches, the tree-checker rejects the bad leaf.  With patch 1, btrfs
then mounts the filesystem without quotas.  With patch 2, the mount
fails.  A clean simple quota filesystem still mounts, writes data, frees
extents and mounts again.  The fstests group qgroup has no new failure.

Changelog:
v2:
- Remove the paragraph about fuzzing and testing from the commit
  messages
- Remove the Fixes: tags; keep the stable tag, because kernels without
  f2363e6fcc79 can write this state
- Patch 1: add a tree dump of the status item, remove the code comments
- Patch 2: move the crafted image from [BUG] to [CAUSE]

v1: https://lore.kernel.org/linux-btrfs/20261103034932.1790235-1-smish149@asu.edu/

Siddharth Mishra (2):
  btrfs: tree-checker: validate qgroup status item
  btrfs: tree-checker: reject extent owner ref without simple quota

 fs/btrfs/tree-checker.c | 39 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 38 insertions(+), 1 deletion(-)


base-commit: d6f76ca0a70d0c814731394a625ff0dc1feb390e
-- 
2.54.0

