Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E3F3D3B3
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 01:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789175308; cv=pass; b=nfYNnNvwCDBKsHC62hGvFC7BOZbFiL9vuVnVijswq4CIJPas3WS+fSGeIBKgz8aINCTPw7pRkQMcX8a5cN0T33C6rox56RMO8kUzhxltsSebV0Y48cxkmmaoLOBYR3cbe9OVHSr7UVm0wPvMG9XQK4cVF8gqLIDU0fbEvQ4JW5Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789175308; c=relaxed/simple;
	bh=JuSdftbLM7gz2+fCddjwRvX45m0suOuD8dB8lMJo/iw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IcpMv1MR5+iU31NCr6JXATYM+Ghb0DUishEQQJXGVAKY6R998OleQnKsY4ywhZVGyOBKyAqhIZtjmPC0WW1zKuJX7IrpmY8mnxZQrVniXEnj6NyHiTzrW6YgEasfa74SrNeOQeNN0fxzRznhVe9PY3jgR477K37+lNMVZkaBh8U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qN9QALV4; arc=pass smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qN9QALV4"
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-66e4aae314aso341519d50.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 18:08:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789175305; cv=none;
        d=google.com; s=arc-20260327;
        b=GaS2ICgnoNB9/LCPGRHfbY4XbqWh8kJysYlasVAA7fOjHfbgIC7EC8JiMuHbgaxU6z
         cLv5UETrWGt6scjeuO5B5Z87AtUCo6fZNEUS8yU6+Qg5jwloUyTFvFn2a0nNdq/Z762D
         FLJ3qL9Re4+Yo+oIlvU/RXloSEWmGe2fSIRw8jLWxThrT6OVOjHFGPka1Cz4Jtf6usQT
         tMyRbDmSDbwlPgIS+fKur3j/UcWdsiy8GL4pUbruVqTaYCcQwoi3tKSDYATvPbxpT+v8
         B9oG+jL6qOYDfmjMTM98mx1OhaVq0QbaChGxudnjHawZYQQJQewbYK4pmrTuPVRquJKL
         TAaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KKyJZHwsFn0BbxzZ5YQb+9hvZXMLKbPzB6qiWwqhbV8=;
        fh=ulgHZRzly0EjGy57U7KBQRit6ktCUV7SUANgT2/rWfw=;
        b=s9+vG0D/Q1Ag9MmYruGDYzuHCLGVLfH3Ony8lpubmh2CiCt9FHD6KzS9j+Qwq+QIoo
         IBDo5odq8+ISWKbWI4e43qVTKt+VJZXyQUGGqpv/Tbf8VhsLJCkMnv6pRThPoX9iwjoR
         nhDl2YkT6jbi8+EmW8CBqAKGNF5xu5URaQqkYCxTXqNCLOX1McxWh8xL763Ymu/12Eep
         rXsOILqLJzdtX3Uzp2hmDybA+gDC2e8vjK406RcswoK3+s4hp/V+Hg5zGx24yZJ32HVB
         AA+JRTEeKECvDCvBTodxbFulXqARxXefHXSdMkliHAUJ9ZXh8ShTomBAtBDg08iLlbdz
         KHgA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789175305; x=1789780105; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KKyJZHwsFn0BbxzZ5YQb+9hvZXMLKbPzB6qiWwqhbV8=;
        b=qN9QALV4tGZoS8ro55XzmN/bgyu5894wPC74rje9k3BkLI2sFXW5eGMHkdedg7oGpq
         anLdoPoTRtAC9Sbn+UVHCQSXPoIsq3N1m/9lQQePBkFnjdwk+nWkoQU578263a8Q7bPv
         2socnzJW2y/iraAoSAYfG7mE/JbWXIBL8eki/fdkMBb09HNUjAg1y8BXTURCYT8n48r1
         w1dimVJkhajhvYmufUog5Mp7tymtkIcHgQBJS1mPUWz5mNMu2Kgo4EdcAqZ+PMZB8OU0
         QHCJZEpAul/R2IgWahvKYyAZuLxdB6jsKOJvF/o1in9D29/hebZYMEh8uqErYXmWf8Wq
         3j7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789175305; x=1789780105;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KKyJZHwsFn0BbxzZ5YQb+9hvZXMLKbPzB6qiWwqhbV8=;
        b=ZdniScThUNeo300o+WnaIIP6AIbCjM/k0/9+1RQqeg92QFym7fsJB50oRsAo8CB9kp
         4jzm9FWb3M87aP+bbV/xSpREPSBwTATCjjkCYDyt+1p9rFgWGV7CCAUYH1oV9ure9sW2
         SrtsgWRAl/JJMlgnqQV4FteICWZA1SmI1mTBCS7CZCMXF2tUdsCh77j9Jn4UKSSyIygR
         4la20EKe/JQjGHIovLTBVlGSL01qL+JHRwkDiPm30ZMGNJ+JEVIvnWsV1qNz2rW3dPj+
         xLK19zpNmBJhT0h+oxiwKiwGBzEPnVFaYa2KW1crbQzBDZpAGlo36C3qNMnevx7ZpAn6
         FDqQ==
X-Forwarded-Encrypted: i=1; AKwUvByNpUUgFAnsvZjVgzXEhNFacGY/VEZEKDXRC1SQLJ5HAnwHUEFT5/FPzIcMqkmVXl+Dkq9FnPEixea0ydI=@vger.kernel.org
X-Gm-Message-State: AFuF++lgVRi5hi0t54/tXiOkjXdYBMlP5tZCt3dM6McVDqZWSVuoNjmN
	1IB4RkknRfdKUp5I8C4mARwxORZ50YdUKLJnbt3jBJ0O0Zx+s+e6AbellyH67uEwHWGxi9wF9EK
	gWpg7S5v0t+yLd/c99KyWiuFjZyh7hWw=
X-Gm-Gg: AYBFou1jbiPeobixtLyC+BCkMOVD3k7s4LOgXZS/kFVMLr3socQ8PYbDOS9+eH37NT+
	Gsm4JuG+Kt3SzYdTluGnjuIZqNxSCsTiMUifUZq7pIgn13TgwJ6D/PrJmWNzUe1ATwRY0rCFVyd
	Rx17n2p7CdvTk+1MHO8uEPrhljzRY2A7Cf+CTUiiIEQPhTtcThfS354KU7iWMOa8Py31ZvIyVTG
	A89xKr43BSoXLOw65CGLvCW2+v/bW4oxJHXvqB5IBA4tiuO5avIzCL3crEBk54wmswg+d+kLeVD
	2Dw+WcPNzvET6DeFm0TXYKy8vrOxyaHiB0vnbu+oXPsb2y+Nh/95GcJAvTMsBpYObJjX+bOvtaT
	sMvdabsO2NctF3WxUPbF59pVRcXTp9MrXJzrwh1oxv+Vw
X-Received: by 2002:a05:690e:440c:b0:66c:7f92:176c with SMTP id
 956f58d0204a3-6712454b9f9mr2374904d50.2.1789175305542; Fri, 11 Sep 2026
 18:08:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260823152648.23136-1-kartikey406@gmail.com>
In-Reply-To: <20260823152648.23136-1-kartikey406@gmail.com>
From: Deepanshu Kartikey <kartikey406@gmail.com>
Date: Sat, 12 Sep 2026 06:38:13 +0530
X-Gm-Features: AcwNN1VQytEq1qS-XLzgRJP3xvclzDl0_eCXcNycdIuh8Uwjwmu232U5iEo2u2s
Message-ID: <CADhLXY5uco9Wq8ZmW5UnvGgTrrcLtj+X5Ne+AqaNyyBdKrQ8qg@mail.gmail.com>
Subject: Re: [PATCH] jffs2: fix double-free of f->target in jffs2_alloc_inode()
To: dwmw2@infradead.org, richard@nod.at
Cc: kees@kernel.org, viro@zeniv.linux.org.uk, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, 
	syzbot+675e84fdf3dde67b4946@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 23, 2026 at 8:57=E2=80=AFPM Deepanshu Kartikey
<kartikey406@gmail.com> wrote:
>
> jffs2_alloc_inode() does not initialize f->target before returning
> the new inode. It is normally cleared later by
> jffs2_init_inode_info(), called from jffs2_iget(), but that runs
> only after alloc_inode() has already returned successfully.
>
> If inode_init_always() fails in between, alloc_inode() calls
> ->free_inode() directly on the half-initialized inode.
> jffs2_free_inode() then does kfree(f->target) on whatever stale
> value was left in the reused slab object, which can be a pointer
> that was already freed, causing a double-free.
>
> Initialize f->target to NULL in jffs2_alloc_inode() to close this
> window, and clear it in jffs2_free_inode() after freeing it so a
> reused or re-freed object can never carry a dangling pointer.
>
> Fixes: 4fdcfab5b553 ("jffs2: fix use-after-free on symlink traversal")
> Reported-by: syzbot+675e84fdf3dde67b4946@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3D675e84fdf3dde67b4946
> Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
> ---
>  fs/jffs2/super.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/fs/jffs2/super.c b/fs/jffs2/super.c
> index 81396a092ba8..30d753d4c263 100644
> --- a/fs/jffs2/super.c
> +++ b/fs/jffs2/super.c
> @@ -42,6 +42,7 @@ static struct inode *jffs2_alloc_inode(struct super_blo=
ck *sb)
>         f =3D alloc_inode_sb(sb, jffs2_inode_cachep, GFP_KERNEL);
>         if (!f)
>                 return NULL;
> +       f->target =3D NULL;
>         return &f->vfs_inode;
>  }
>
> @@ -50,6 +51,7 @@ static void jffs2_free_inode(struct inode *inode)
>         struct jffs2_inode_info *f =3D JFFS2_INODE_INFO(inode);
>
>         kfree(f->target);
> +       f->target =3D NULL;
>         kmem_cache_free(jffs2_inode_cachep, f);
>  }
>
> --
> 2.34.1
>

Gentle Reminder. Please let me know the status of this patch.

Thanks

Deepanshu
