Received: from mail-lr2-f35.google.com (mail-lr2-f35.google.com [74.125.230.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C07B1449EA8
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 07:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789976866; cv=pass; b=lAcMzeg1VVFP4Wv5Q85TUTUG7omlkdKr8fMeq46zJ/s5aBjiWjFmc554YuIGvc1tF85e0bM6uSdxIQ7PQZ5zyvnccDjlKJKI4JRR3mQ9fKWnOc1blQ/P1Kfmv4hKCHqqPtqep1Z2H/d3UnB+1Hq6fIZJ3vzUxPmLtnMM4N94PUE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789976866; c=relaxed/simple;
	bh=KXxGTuxzh5HQFPptUgQ65qoWgJYcpw7UQPKggFX9gnA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eiRAFkGiUfTVFMG/8xPcdlmK+DrdR5myt1KjGMWzDUNQ3J3DtDpna9AtoiuMDdB2qgzlR1Xq1CX3i7TLUnVaLs3+8KMis4RVeoy3r7kPJTW7s9BqNeaX28H21s8Y6YYczvbaiKSKxbcBAtN2H9JWJJ05AKw6x06x0AoFT7eaVpo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ESN3o5oy; arc=pass smtp.client-ip=74.125.230.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ESN3o5oy"
Received: by mail-lr2-f35.google.com with SMTP id 38308e7fff4ca-3a47f740839so21475431fa.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 00:47:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789976862; cv=none;
        d=google.com; s=arc-20260327;
        b=ckJd1Rw0e/uW6dPAgAmynhYjp6drnD2/yQeZE01+CveJxips7rwAGC3IqUbkCF2WDu
         iY2rcGe3dJM/S+ae3NtPV/aM6YGHqhe25zey9LBiwYyHKn4+vt3YaqRyDtwLCXRYRAFZ
         JGE3JZ994oHbxonjyZ7//tLmk6XzlZfCSqSJf9IBhppfkDJh1xbUiDudSIm1jXcG4Sy4
         1en9eZyhgjYn9Nn7H56dX0LW/s3PuxKXi3xcVC49F49dPyB2RXT4bcMtLfyeeONkacj5
         yDheM1Z93a2z6iloIwnurwyDVF+gqxL2UAR2QwIVvDrQaVIphZyMfKDXVh6p/8ZMXo1Z
         RvSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ql+wH4qVovd9jAggtOkZvhGPFd9egOe0LH+fm0OHgS8=;
        fh=Ca6K8Nb2tQnT6ZlKFfX4cKVvXcd6wrKw8tdfN8mx/PY=;
        b=cd5era0Bk9fdnypwVxsh8uBtLAmXjo4ssYpePOylJdjyYH5vkQsmOvzbrzk8SWntJ4
         2pKPqKBFBqXkC3KK6V3h9Ue3mcfZC5eY2DFZC8mHzn2EkvzBO0623SA8tY8MZMeCiKtc
         c39j+rib+30/sTfb8Gekkn7n78ecQAdABFNts28U3EvFGQC98T4CtGWg2otA+ha5QsnA
         DPDYrlS6vSS59Q9u0mfdAkgCOUF4uHVmPdl7koN8mu7c2Cn5zR3bLOrVOIEcbqcnlcdF
         5xjawlAmv4LNpSHczDx8fW59erTyXur0QoyBMO9hfcOZroDyRHAQq89k4mdCVzz9K4qc
         eqRg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789976862; x=1790581662; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ql+wH4qVovd9jAggtOkZvhGPFd9egOe0LH+fm0OHgS8=;
        b=ESN3o5oyt4hVhz3mwTfI+vJ6xtOiROi/WsTjZSeKXZ22ndjPtcfhVLpMT1qco6Y474
         1Gf5q+RV8TcwLrmQgRt14p4VJmMmIYw0Za8RAcwBA9obV0RsXY8QPQ09GglIuni5Virm
         /VxAUrduUQDfNZKL/GUcETPZXUP8mA+36Da8EhrIMyQAO5DjUdNA2fEOxEm2yZDwzRgG
         PmQ0lJY9EG8EszQDYK4PWauiCbsO8Lb6WDcyuw68nov0Fvf+k2KZ/o7yDT2EUX32ccaj
         JTOSkXCMLGgarEMXfXjHK+xsNORoJP5P5I5g4i06Grq4R1ZJkR6z0j6Tl9qleFVVwC6u
         vIqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789976862; x=1790581662;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ql+wH4qVovd9jAggtOkZvhGPFd9egOe0LH+fm0OHgS8=;
        b=izNmtwVBKGUR5gAi/jXioWbW+ZyVMCb6rfy1V84Y/3bvbECoA9EFBgwjS9kbcpzL70
         GSgyt2+vdsbVHWtyuAGXNKOAWzb3YxGwjwQccTUCY4UKF2t32zpkMsqLvod6xZWb1J9M
         g6x7BXcmXyYiJYI+igxZN3O3DjOv3dNGIe0MnADplP1Q8F9kGf6b4ibmyG16WncWhOZW
         Lu98dAGevWPNw1ge1ONZ8pAt1pJS8+3pVjlACViqfzTkKQmklfTz1RbEc5X9c9Zq/yXh
         rMWkf0WblbIg8Q6GZrizQrK/xqzQ+b0yowiOEfwrDrvDD6DoGZzX/4vSIC6Lrc1e10EM
         Mf8g==
X-Forwarded-Encrypted: i=1; AKwUvByWDd407oJvXLKGDZw8/6G+lRJN8B92zvNRhmKvTY+vgEPefTsZHs57fm/3D/H3utXtqNmXunLgCj+ktBg=@vger.kernel.org
X-Gm-Message-State: AFuF++kmtBotI8Z2GUl1Zrf2irKiGL/lrMVUO/Ss+5df2vD6SABZMJTp
	c/ozPzj5qcN9+sLPJEk0AMQql6rW7Aq+DkjzHU/QwzMimOpNzbEtAkTojsAkufDhDxEaCYIxbfR
	WIdfrC+8k7t3lhtbyZLeiXTq8hiYqbUE=
X-Gm-Gg: AYBFou0x2b6SczREkIlijmSL9C/DMTpzkAknGRpoLmoS6dzqtbJ+1oK+QL3/PAzCj1D
	h46jAxGDKVSSwUBdojVYtyXg2VvglPwz+wV3lYTyrf8bwjp6uXOZSgxXIU3fHJ+VSS98Y73tQkZ
	/h3vpFjSXL6Pj6mypf3h26yIs5b166JbpUPDGX9dWM+T9/1F89duVrNM+zWBqf1No06xW9+1gX+
	p89MAmRmti60ReUpo0j9qm5dWda6ba0QPnfyuAT4BlzYgvrR6itlmWNKq/0Z17xAfDEQyxL1ggk
	O+7nbeD3GxjdSPpqg+xBI8F0yemHLJ6a055FlD9AjsMp7utFsyRBvmQW
X-Received: by 2002:a2e:a9a5:0:b0:3a3:476:2e37 with SMTP id
 38308e7fff4ca-3a5fbe36d88mr21411961fa.6.1789976862279; Mon, 21 Sep 2026
 00:47:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <13b330df140a2ee488952b4c7145e261ec884555.camel@dubeyko.com> <20260918212153.23651-1-qwe.aldo@gmail.com>
In-Reply-To: <20260918212153.23651-1-qwe.aldo@gmail.com>
From: Ryusuke Konishi <konishi.ryusuke@gmail.com>
Date: Mon, 21 Sep 2026 16:47:24 +0900
X-Gm-Features: AcwNN1XF1zg9V9W7pIcfaTTC797llgXNMo377_BEL2cpbxL6SjSpyOdv0GuJxt8
Message-ID: <CAKFNMoneRHw=-hsGvzY+Mdktm3+EtodSU2vpNoaXZnheu+VjgQ@mail.gmail.com>
Subject: Re: [PATCH v3] nilfs2: fix checkpoint root lifetime on sysfs errors
To: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
Cc: slava@dubeyko.com, linux-nilfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 19, 2026 at 6:22=E2=80=AFAM Aldo Ariel Panzardo wrote:
>
> Hi Slava,
>
> No, wait_for_completion() without a timeout is intentional here.
>
> The kobject subsystem guarantees that the release callback will
> eventually run -- CONFIG_DEBUG_KOBJECT_RELEASE only defers it, it
> never drops it. So the wait is bounded in practice.
>
> If we used wait_for_completion_killable_timeout() and the timeout
> fired (or a signal arrived) before the release callback ran, we
> would kfree() the root while the kobject release is still pending.
> When the callback finally runs it would access freed memory -- a
> use-after-free.
>
> wait_for_completion_killable() (without timeout) has the same
> problem: if the wait is interrupted by a fatal signal, we cannot
> safely free the container because the release callback may still
> reference it.
>
> The unconditional wait_for_completion() is the only safe choice
> when the caller must free the container of an embedded kobject.
> This is the same pattern used by other subsystems (e.g.,
> blk_mq_tag_set, configfs subsystems).
>
> Aldo

Hi Aldo,

Thank you for the patch.

However, in my view, introducing a mutex for synchronization (either
by replacing the spinlock or adding a mutex alongside it) is
unnecessary and suboptimal.

nilfs_sysfs_create_snapshot_group() performs memory allocations and
sysfs node creation, which can sleep.  Holding 'ns_cptree_lock' across
this operation causes concurrent read-only callers like
nilfs_lookup_root() to block unnecessarily on a lock that originally
protected a very fast, in-memory rbtree lookup.

Note that checkpoint and snapshot mounts themselves are serialized by
'nilfs->ns_snapshot_mount_mutex', so strict mutual exclusion between
concurrent insertions is not required; we only need to eliminate the
race against nilfs_lookup_root().

Instead of converting 'ns_cptree_lock' to a mutex, I think it would be
cleaner to keep 'ns_cptree_lock' as a spinlock and structure the
creation flow so that new is fully initialized and registered with
sysfs *before* acquiring the spinlock:

1. Allocate new and initialize the basic fields required for sysfs
creation (cno, nilfs, etc.).
2. Call nilfs_sysfs_create_snapshot_group(new) *before* taking the lock.
    - On error, wait_for_completion(&new->snapshot_kobj_unregister),
      kfree(new), and return NULL.
3. If sysfs creation succeeds, acquire spin_lock(&nilfs->ns_cptree_lock),
   link new into ns_cptree, and drop the spinlock.

In nilfs_put_root(), we can keep refcount_dec_and_lock() with the
spinlock, erase the node from the tree, drop the spinlock, delete the
sysfs group, wait for completion, and free root.

Could you please update the patch to keep 'ns_cptree_lock' as a
spinlock and complete sysfs registration before inserting the root
into ns_cptree?

I think this approach should work, but please let me know if I've
missed anything.

Thanks,
Ryusuke Konishi
