Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.128.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792426614;
	b=Ny+rtwsOUna5+LfY7aJgLVlF1QT3wmFNR0mEiwWYTVCnr7afyP4lTBquDE62GgC1Wi7Q
	 tcU2iWo0ieL9pMsY+PQxtOsq/o6JsAJAu27C9gu99Og6MR5o//91GGAEzuWur8I0Svj6M
	 WX5hd8b3vEIey0Txs3bOgYAR66nxTMK44MdIy4EbpLRwHM8vz4J8+Wb0ksHe6y9JxRItP
	 MmugVjr4TFgXc6f9otqinCZiXb/eeuX9PgEFNE9fUwYfmd5SfFt5YOSQaJl+8Oi+YHqw/
	 1bWVqg9uzA7bKhtYBmmPpXBhbcG4qLsA+/TBap+laxefyDICC5Zo4m80SJIC+SH+Wow==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792426614;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=tzy2/hZNZgxPkh/2CJVsFN5uf24dNj2kZ/M8pdTK09Y=;
	b=BnRx/gWfHeUmKhBeg+8r8uMEvKO67HSBypqBDZ38KwLWk749OOmbKBHFCrg0nusE7WEc
	 ruANTEzidGsHYVUTG5BVohyrgyUxSQtvGHlPDo4guXPzc1DkhxysSv1UPZNi8TxrWLlWK
	 3F+uIELDintEcc+UnxRxufMCnVhKphUWc04lQLzrFebk/6Qm4w4sN3O5hlqgnwHCqdB0K
	 qRFh7tq6778WINWXYVOsA5zU32vfuKED4Xnq+DWABESI2ERHP5ZjmjuX7kH724fr2Kc5v
	 VxPEMywPtnv9Io2j8F6nf7mIEPC72Oo4JC2JLY5LPc24PIA+vEfLu3XtMzOguvMGn6w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NqQsvs3v;
	arc=fail smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D71D5606A326
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 16:16:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D71D5606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NqQsvs3v
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a018dc1f98so16474115e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:16:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792426612; cv=none;
        d=google.com; s=arc-20260327;
        b=aBPX6K8OHZK37ZitoqxLtFIs91xGB14JzGCmGJKgW6C+BxS153qSuQvB09DiEXWKty
         FEDM/a8ogGyau/jfu0uKKGIVYOqYLqCKBed67QunYM0O6IArcJ2RE+kPqxXEXj3fOePu
         t67EhPhyEmCa0RQxjHuelK4hX4EKjxXv7mhnCW4C1NYrcjR0pbkQU3+sVxkK5EoxKj9p
         WWmUZrBJZH9ADubdem2t33ZgqlcEaARrwVadl/6QBM0uyAWonyHu1ioT/L8/ZQKsSUqy
         KY0lBTiZCoR/VdwVS9xSNIxVBXA4qSJzpySobgGssxDDiakmtp2isJBENrVDmtrZxxHc
         XUvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tzy2/hZNZgxPkh/2CJVsFN5uf24dNj2kZ/M8pdTK09Y=;
        fh=Q86hKJAWFUIidI9xMlU6SQW6A2DES6sERXAIZQyEFFM=;
        b=qMyYkCrMsZC/tbGK2REH95sTAEvkrROWEFp4qKscTkU2FYyPRWSpLVeHowByuSudSf
         sGe8hRGWy+/wD9P0jH1mpYj04QQHhR2ch93qqCHoL4iNw0dAcfoUHkQ8L4dcdpjKP+JA
         e+4X8GwLFGjdb1PCCNonhFbX1EDnLjDL+8onvLDPflQDTWvMKeHFUF2e09OZDHdcia+S
         R09ibyAEXQ+Go51CbuMWBnd2LLKyVcNzStpZPPETqAo9fxtl8PrMHz7XBYjZm9wy7i9C
         vmG2O9/grf7uMLneZOxY37i/1aM1lATK4aCUpRAHBkKlj92z53CI41rdPahHElLIIPDx
         n0kg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792426612; x=1793031412; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tzy2/hZNZgxPkh/2CJVsFN5uf24dNj2kZ/M8pdTK09Y=;
        b=NqQsvs3vML6MmqqfPRgsuOSQTNkEyef/wmJ4JznLZyk1JNB1aPOGbKGbF8HO70mbzI
         ZvWiXoM5A7Hyr3iiD4Cg991Fg7uhqcNf8UG3Ce0qtvIA6jQXwqWJxykk6XrILETG1q0p
         +jH18mOc2HhhJ6ivo4lTVVwvrqDqQF84mDlj+x4oYWhLPC4/ncEMZqat9/hAMcW+Sz3B
         e4F0Viz8er5TxZtaw8SNTrBQlItVFN/yWFL942RNPhzhyxSUKOKU7V75yJTwWMuoJEAr
         q1B6yl4LNGGom6YXvYOq6ibYLNef2aOVSemRDjb0BK0+KtkoVnHqgod7cG7UnOHp1T5i
         YKMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792426612; x=1793031412;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tzy2/hZNZgxPkh/2CJVsFN5uf24dNj2kZ/M8pdTK09Y=;
        b=atmPQzy16pxze5IDGhSG7mcosKx21xjsO5/G+Wy4ulPjxBbxmKKYElf+MP5kun5pxB
         G477US8QC6A9ZqaLmLGMddlEhGPf5pdwHZ5Ionn8jl2+gV8ZOWN8Z88Qv1IUFcBSE/hQ
         MRTK3vTMAkFR4EgWXu4juEe+rlk2Jdy+LAS4YRboTa/4DoW9brPcMBTeiso7g1oOTItu
         BGBpxV9Jc5NNkMg76G/GQLw145C/oak2DGQlRroKgEWYQblmAXxWDy8Z8RhD8vVW5wOv
         /WxQbrX0f8z+qvwf3j7/FohVKI7uL22h2vEwMNFAdS5rX/bMwwOE13jHpK/n1PxH0HVD
         U/8g==
X-Forwarded-Encrypted: i=1; AKwUvByZzO/GubMdonjqHQTxQmeWuV+Oe+dDKyDKUBX0DJLDGss4ihPg5sGxGOcuX/xQiBSduNdBLjN43XfJAuE=@vger.kernel.org
X-Gm-Message-State: AFq9FYL7VTzvgLfgImrFoDNwgnoBXr763WkT2VQUlVWFR7h3THsHtQI9
	l4eDpjx6C1nL4YF9m94IzJYlFMESGiUPPNiRNJEcvZ46/fn19rrCWZzi2eapcH0x7kkiPHNEYVH
	NHUaYh4J/ssnrZz4x3dh5zaL7kLVcbms=
X-Gm-Gg: AYBFou2f+yVPcXVaXvpkc7LxizE2dqTYnzhsQqES/uM9xPCxqzd3So1SLHGHMHN8bRR
	NPS1aEfrKIjtkvOjx5pkmEZdYCmHyb47buv8olDR/J3I2x4SKqGWXYX8FbtVExE/Q9AAYm5zFcm
	mEujDcVJ76wUNh+rzPtgQdm5BBr0NeCheawgB44MGEzhuySTYjBRppZRudQY8ORVyJdj7CCeO9r
	G48p3Jvos2oxkrZpBuML44lPirKGlS58s0XHhns5dPpSJYQAzlxP8xMOYIoNb1cYMUECjfbat7k
	maNo5ABqrUDD+75D5BdjF1VVY0maoCPPgH5HlyNvPUCbqVrwWfPjLlJMOs8/pvBDosQp0CVbxTe
	52zll4zgo9ttKtDMgujswcGd670Yx8QTezre6zd2D5JL4V/XwftWjfcOblXHojZUdBUBb725Anm
	I3aILzsw==
X-Received: by 2002:a05:600c:3e85:b0:4a1:6991:36d7 with SMTP id
 5b1f17b1804b1-4a1d75e385fmr158858205e9.10.1792426611931; Mon, 19 Oct 2026
 09:16:51 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019160615.2348500-1-nphamcs@gmail.com>
In-Reply-To: <20261019160615.2348500-1-nphamcs@gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Mon, 19 Oct 2026 09:16:40 -0700
X-Gm-Features: AclHuK-V3wuqh2II4jQy2GzXwFR6X_qUKiksPsMgYsjyzYDn2Cz39hAf5ULvwpw
Message-ID: <CAKEwX=O7i6ehqyLNCpp9bqoREmahXwGS4Ja8bCsKUzyAMu_QLg@mail.gmail.com>
Subject: Re: [PATCH] mm, swap: revalidate populated clusters before scanning
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>, 
	Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>, 
	Youngjun Park <youngjun.park@lge.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 9:06=E2=80=AFAM Nhat Pham <nphamcs@gmail.com> wrote=
:
>
> swap_cluster_populate() can publish a cluster's table with the cluster
> lock dropped. A cached allocator can use and empty it before the
> populating allocator reacquires the lock. The resumed scan can then
> dereference a NULL table.
>
> For example, CPU1 can retain a cached cluster offset on an SSD with
> per-page discard disabled:
>
>     CPU0                          CPU1
>     ----                          ----
>     swap_cluster_populate()
>       swap_cluster_alloc_table() fails
>       spin_unlock(&ci->lock)
>       local_unlock(&percpu_swap_cluster.lock)
>       swap_cluster_alloc_table()
>         rcu_assign_pointer(ci->table, table)
>                                   swap_alloc_fast()
>                                   local_unlock(&percpu_swap_cluster.lock)
>                                   mem_cgroup_try_charge_swap() fails
>                                   swap_cache_del_folio()
>                                     __swap_cluster_free_entries()
>                                       free_cluster()
>                                         __free_cluster()
>                                           swap_cluster_free_table()
>                                             rcu_assign_pointer(..., NULL)
>       local_lock(&percpu_swap_cluster.lock)
>       spin_lock(&ci->lock)
>       return ci
>     alloc_swap_scan_cluster()
>       cluster_scan_range()
>         __swap_table_get()
>
> Reject an unusable cluster under its lock before scanning it. Relocate
> it only while its table is present.
>
> Fixes: cdd77f84d966 ("mm, swap: consolidate cluster allocation helpers")
> Cc: stable@vger.kernel.org
> Signed-off-by: Nhat Pham <nphamcs@gmail.com>

I'm revisiting the lifecycle of clusters, because vswap introduced
dynamic (i.e run-time freeing) behavior to it. For the most part it
looks good (both physical and virtual side), but this look racy to me.
I don't see how it can be safe. Once you drop the lock, all bets are
off...

But at the same time, I have not been able to reproduce it (yet). Will
report here if I manage to.

(Side note: my vswap code is actually safe in this scenario. CPU0
allocates a new cluster entirely, and lock it before publishing it. So
even if the cluster index is cached in CPU1, this race cannot happen).
