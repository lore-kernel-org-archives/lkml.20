Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04DC52C15BE
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 00:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790382813; cv=pass; b=QYZMfe2DK3YgzKTrmGzdzw59ybtj/YqB86Md28wZNmVZ0+oEnm4f/nS1UzX2a4iTOSdKqvFPXYrcKpgUsQoQkdfkr+mdW1IoGTh7gtfxmpC9wBlkreUV0YJO79YBGKU8m9LpoA3i+Nh8T/N5gZ5z73IGVEvpLwz3FZyRldOd8UY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790382813; c=relaxed/simple;
	bh=KtCpqKwDC0aQ3Jb2ji3D6vLbjLUjIcplOD8xjiZZMrM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kYsj/5T+f4qJH7QjwZpVIFxhdZMOjEaidNaDaASN9Limz5lRBKu5TuJxCwA+kqeqP0mubFd2f2vmVu9s6l5cM7wrMQOUOL0AVl1jKyjZ6Yq6JbIYrKTIIKf8at3RG7a8c3lxE88/NopjSjy/Ye2V8XoImM4jky4xGbFgJMNLONc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KR9GA7el; arc=pass smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KR9GA7el"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3a65c6fdaffso436671fa.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 17:33:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790382810; cv=none;
        d=google.com; s=arc-20260327;
        b=TajsImWqzb4+GWRLaN8Lr9MXwYFnVB23ZjfpSpJFxlfvNRu3ZuVAavHMbMioG+eImZ
         YGPu0R8heKvvxMiDjfO7/xpOoDrMfoFPy+z8mKWkaRPdim9ffoZQMkqFZtSd4bBptt5q
         OjN63Fo8uZ7wxguo09o5sNq3gg/w9yKlZ8ACf5Pq8cCF68mLTiipc3P3VS2RtEjupCY9
         8BEFI4bU0zzFaVkxVMCjdrwm843g+bJi0t9na+XNNIiZiYNTXB2FHwBW/IORCWPrYy60
         wbfWvQXgMpVfZKjwjm8BAdev8XrTS1cBxqo7u0gxQF2tEueOKml08gvnvZo9npk2fLw6
         6Jig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=O17YbHvrX0PAAQbh5o1w0redMP420Im1AjYq+vdSjRs=;
        fh=nAwwMpGiGJACrCsAWmzR0/RE096Pnh4CrS77yUdbE9Y=;
        b=ISgxTdeRSN37o1OLvNJUGon+Ltge0fPJpTIoelEuHm94W8gnyVe5zSenSQ3EWUyS0C
         iCSx7fnd8RYQOlT1fDoUNJrhPLdqyhJAb+/VbbposSp56saCzqENP6kHwflGMEyygcMT
         rh/aVTNnYMDiiXLOZYRdQxkLrirlEYe54MQvfrmEEVIjMRKeYqdTAbW3HiwRHkmIn1GG
         6x6uphxxwuYIciMa8f5BIMAdc/Y57swOKgpljw+c5/rtY/RIq6/pZ2PhNv5OGEM8ep0T
         uQkAb84Q/xTHKb+yzdyakBIl5jULpU1aksC5OSE8YuPyCHP6pKsdEo3/VdWxGUuN4f3D
         cBqg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790382810; x=1790987610; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=O17YbHvrX0PAAQbh5o1w0redMP420Im1AjYq+vdSjRs=;
        b=KR9GA7elVjhy6T0F1mri2doofPuj1DZDZnj8KhT6YdOtsj9HBmHo57P+AlkXswCrKd
         usAQGkyxHXx//hz30VpK6xH0oSkKx2J3trEXYfQ6AloT2u7M8Aga1WNOVamlP/uA0Zpp
         u3co0f/3G2UT8m7w+ivfvXiHjLBnO0cMQHeLIgITJGMGdFDDI7NikMUnRsZ+rzgdCgWU
         qPpbXL5yMWM0x0OebUjM+PRvGk9vncLm9RsSs/raWyviRHT5x5BJaSC81I+EL1yvGIHK
         Bn7Q9vI3zBsjUwHne0WHovFlSAiF75e5OKVHlse8H9MnYKQ3UKlpbOkTP4lyse7aqn3G
         f5tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790382810; x=1790987610;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O17YbHvrX0PAAQbh5o1w0redMP420Im1AjYq+vdSjRs=;
        b=gBq2rluWk74b3Ey9STvIOhN9/+7qNq9AMgYXLB9lYpVZ2HFGZRXN3pEHoZfN0c3fJs
         pMSHZNRBgnPU8pUIdf1enopNUq2a/iszfqk1MC45s13qDewquPUZbkNqr7q4rfTCsUqZ
         5sa++f3Qgo8GMZ1Fe8BOUrOSkIHJPZ8FHfJnVSNhC+tEMXFvAT029VpQvariYRipItd6
         QG4gVe4fTwUxXAH58SPEMdBTTReb/aA28Hb0i5i8rOhKJwRweYHbnAy4/s8W04uZyyNp
         keK325VaF6A5b3k1rnIp8o+4BvH9r0sf7qmX2mvptn+JocMtESPEm/0Z/DrR02EUpSa6
         1Nxg==
X-Forwarded-Encrypted: i=1; AKwUvBxmT4+QdO3asGhjBaKr+dg6CUHuSgYSBfXwEv/nqbNEUzC0FAn8bU1Y0npAhQ6j0QLEzvFO3DCZy8nZD/E=@vger.kernel.org
X-Gm-Message-State: AFuF++msCq1GJMNkEXGyu/2DsS6XRn4sntjKfAA+lib+CbEoVFW2Sd6J
	wLk5bvl9K1Vv3f6OhzLQ2ck6AL1eVpGNPXWx/NCLbEuDQ6wLdsQrBjAeBlD7oojq+rPgiCKa7mh
	27F6e3QcU1Q4QT4/ZQ7iIsIiJp5AIg7Q=
X-Gm-Gg: AYBFou2fRnSi3xlWBjPp8b+nGeK60dWSAwRsCiZZpVrc9DX2QHOOG4G93aqq0Zq2EBs
	6U4tOg1cOfb7gkB9iU8MSQRZOWMqW/fufXg1EFrXVzriIXLMNBk0azrUPtjKkQVxhE7PM8iGsHP
	44s39snqsv4Oy5JwNDIEyzk4dBq0LUtgADCKbF6XowRrhIViQ0hndzyynySXu3ZXak7JJiNeDsY
	xGJh+GNz+AzIP/XAksjCPg2odRhX+KjD3R5n9l+JHhuXiqzshOQIte4R9YXQUfP3Db0JxQ59Yhe
	7/fuX4F9TKKjeN0XdlFmEONVMJZyZaYT07O+ZoKu7/dzuKe+QkZefkeIMw==
X-Received: by 2002:a05:6512:318c:b0:5b8:d50d:9f21 with SMTP id
 2adb3069b0e04-5b8df20e794mr2225898e87.37.1790382809696; Fri, 25 Sep 2026
 17:33:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924090102.2865942-1-liubaolin12138@163.com>
In-Reply-To: <20260924090102.2865942-1-liubaolin12138@163.com>
From: Hyunchul Lee <hyc.lee@gmail.com>
Date: Sat, 26 Sep 2026 09:33:15 +0900
X-Gm-Features: AclHuK_qmxs54f3QKzPDOufhh3oPGrGix3RysP4LVi2HSwQAI62dqjvM8f8mKnk
Message-ID: <CANFS6bZu50diLF6Rk2BNLgpCWry3yW3n+JAjiqBXTijviRJ8JQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] ntfs: report filesystem errors through fsnotify
To: Baolin Liu <liubaolin12138@163.com>
Cc: linkinjeon@kernel.org, ntfs@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Baolin Liu <liubaolin@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Baolin,

2026=EB=85=84 9=EC=9B=94 24=EC=9D=BC (=EB=AA=A9) =EC=98=A4=ED=9B=84 6:02, B=
aolin Liu <liubaolin12138@163.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> From: Baolin Liu <liubaolin@kylinos.cn>
>
> Report NTFS metadata and shutdown errors through the generic filesystem
> error notification infrastructure. Use file-level events for errors

There appear to be several error paths that identify corruption
but don't call any report_*_error(). For example:

* ntfs_lookup_inode_by_example(), ntfs_ib_read(),
  ntfs_read_iomap_begin_non_resident(), and etc.

> associated with an affected inode, and volume-level events for volume
> metadata and shutdown errors. Preserve the volume error flags and report
> failed recovery independently of the error that triggered it.
>
> Report errors where they are detected and leave queued event merging to
> fanotify. No error_reported state is carried through search contexts,
> mapping-pairs updates or MFT mappings, so releasing a context cannot lose
> that state or suppress a later rollback or restore failure.
>
> Changes since v2:
> - Follow Hyunchul Lee's suggestion to remove error_reported tracking and
>   the reporting-aware mapping APIs throughout the series.
> - Report independent cluster, mapping-pairs, ATTRIBUTE_LIST and MFT
>   bitmap recovery failures while preserving the original operation errno.
> - Base the series on ntfs-next at 401898d748fc ("ntfs: validate
>   attribute-list sizes before allocation"). Retain its MFT parent BIO
>   and folio writeback implementation. Report synchronous and asynchronous
>   device errors in the existing completion callback; fserror itself
>   defers notification work and holds the inode reference. No additional
>   NTFS completion workqueue or pending-I/O counter is introduced.
> - Cover stale extent references, failed extent-record cleanup, mirror
>   failures and MFT preparation errors. Resolve attribute-inode reports
>   to their base inode and keep cluster-free counts in 64-bit variables.
> - Split MFT reporting into two patches: metadata validation, allocation
>   and recovery in patch 4; write preparation, mirror and BIO completion
>   errors in patch 5. This keeps the two review topics separate.
>   Shutdown reporting is now patch 6.
>
> Testing on this base:
> - QEMU passed mount/read/write/fsync/truncate/xattr/rename/unlink, MFT
>   growth and unmount without FAN_FS_ERROR events during normal operation.
> - Verified EIO with a valid FID for file MFT corruption, EUCLEAN without
>   a valid FID for an MFT bitmap mismatch, and ESHUTDOWN for forced
>   shutdown.
> - Fault injection of an initial mapping-pairs error followed by an
>   independent restore failure produced a merged FAN_FS_ERROR event with
>   error_count=3D2. Synchronous and asynchronous MFT completion failures
>   also generated notifications. The injection code is test-only and is
>   excluded from the series.
>
> Baolin Liu (6):
>   ntfs: report allocation metadata errors to fsnotify
>   ntfs: report attribute errors to fsnotify
>   ntfs: report inode metadata errors to fsnotify
>   ntfs: report MFT metadata and recovery errors to fsnotify
>   ntfs: report MFT writeback errors to fsnotify
>   ntfs: report shutdown errors to fsnotify
>
>  fs/ntfs/attrib.c   |  84 ++++++++++++++------
>  fs/ntfs/attrlist.c |  17 ++--
>  fs/ntfs/bitmap.c   |   2 +-
>  fs/ntfs/inode.c    |  12 ++-
>  fs/ntfs/lcnalloc.c |   4 +-
>  fs/ntfs/logfile.c  |   2 +-
>  fs/ntfs/mft.c      | 192 ++++++++++++++++++++++++++++-----------------
>  fs/ntfs/super.c    |  32 +++++++-
>  fs/ntfs/volume.h   |   4 +
>  9 files changed, 235 insertions(+), 114 deletions(-)
>
> --
> 2.51.0
>


--
Thanks,
Hyunchul
