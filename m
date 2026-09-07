Received: from mail-pj2-f1.google.com (mail-pj2-f1.google.com [74.125.227.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36629391513
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 07:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788766484; cv=none; b=UNae98uw4i7BfRsneN06A45Vathe1oFssytU/iTppqAJpwBaPqOYSn5u1RQbPm5n1ERoTJFUqdejFd64DrWnxQbhg2MT0tUN1E7x7xwvV8fbXAl+sXkJZ0TUiFewbvpr0KZyGBZrI20kNIjBIvCUhy0MlRn5gEUZVzhiI3e5ZG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788766484; c=relaxed/simple;
	bh=1LuhtFpeZMoHlaadv8HWg5eSoCxiA0OdmZHsA/Oz2YM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zj8kDj/c7EW6MAoYwn/kjngkOxCkJBy+fDX6+42qLieyEpHkwyOJQFtyAdjD9jSh9vyBq1QcSQJDTcPXcawHa3ISOjJIIdGKUeivX8cp/bk9HNBGZwyzxxINkNicRPBHfwCdvG7Tb8TG1Z5fAp/gOjbFMmonDLGlUzzRxDxPVkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fs90VAhQ; arc=none smtp.client-ip=74.125.227.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fs90VAhQ"
Received: by mail-pj2-f1.google.com with SMTP id 98e67ed59e1d1-398e10200a6so1702511a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 00:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788766482; x=1789371282; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b1N9xD6I1AtFBGROnAwiAj6AvG5a0JupI+PeFixM7Bw=;
        b=fs90VAhQYAiiMrIFTcO7kdOxV3MCzfFXLnGHPCnvL/cEzaNg+zeEomOWTpGeU/9ezC
         vBU7Ql6K5X4IakeBWjqy/ALLJv3eqQhY5bHkHMfBtl9Zutrf7yj3btkuS0ng7xdBvpbk
         fMm+WCE/chgestRWC3DZgrw5SxPwSjk3c+d9JW/0qpJLkWhUEeFTuFJNZWisDBRJRX+U
         XLtJcppXCZcqYPKXGMUQOBCpN2n7nhNosXY7AA9bFOr5HkzGHM9LVPysvBPMFpFk0poB
         U69joqol9qJR8opxd6PCKYwuXwHOZlK0b+1vjpqaiMCnh3mvLXqQ0/Ym+IRHQP0BfW8J
         Jhmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788766482; x=1789371282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=b1N9xD6I1AtFBGROnAwiAj6AvG5a0JupI+PeFixM7Bw=;
        b=J6JyftyfIPdnruOaj1FAVTibQTwsO9Jy3RRlnPXDjpcSl2btRHW/OJhpx2/WYDWToG
         27o25OdLWQiHqY6G3WIcpCzPykmy1kEkjhLmw3UGbknFSWgur5WfEqw72CJDOXoH6mgQ
         1PobrSJFjtbHDEya4/qV6b+o5xtDk46QWw7ek4U8gqQUJiO3BmDYYzPPnlvMEeKT1nBu
         THiaO1alFAyCP4c9wWcd3XjuQbQvWQVa/PM68b5bw5VJp9Mb2YjMXaIvXpyQWmcyqVa/
         sqSu3bN2bjAvrgmF+giYhso5C/wlcbinsX4igWo9AH/NtlYgPpX0Pp9hEp4pos7HWOLe
         RY2w==
X-Forwarded-Encrypted: i=1; AKwUvBzp9aV90JO+NWWnExzpw6T+fne1x5KiRltUgquBNJ6TP+42xeWbMM0hmHCtWNUM1zKQVI3ebBuFhrfCuR4=@vger.kernel.org
X-Gm-Message-State: AFuF++mfRxSNGBT8BrD953fdPQis9dyA04yUwKC7O4kB9CxX1qvtCEJN
	a4eGqPqIxQ48cFFHO49zR/tHcpjWMfC9U4gvv/HZ8DZvdTccZ7VUkrXd
X-Gm-Gg: AYBFou2URSNz8ZHOSaH1M6FZut8KmZvxFqjHUGW24tlw/fp9v/R8/KfkH/7fta4/GWc
	kGr8CUF3JKeA+CpHWXr0Bc1I3D/C9zQPPudPDvcjGF3fLBMu2o4JkxEaPFXpTERz9Y6cV811o7G
	07V4wzC5J72nI4NzSobf4/wYEAbmnT0g+wr0pss/vpZFI41IEjcv6cRjRd92wQhkEg64yc5OLvo
	NFHGh/L8ZxRg1rsdyfFM02j5Ug0HTtoCyDcHl0Yd7PEbA61Mm+b6LDleAqVBgnHJf/2a0nGUPtE
	vLemGoYI/S0TSd9WeYF7cQ1k9oNMzrINRjZHvD/4KkH9XcjUMn9CMBjG1j8AYcO794rY1ah5c35
	tUBNh3BU7e5joSsk8Dbq3lj7j8d85ba8+c+xfVbUGLi+8wuTdRbK/go2ZdRpEUl326RrMWWPk9b
	0RyqahpFO4ouNWUgz/lGepvS0r/SGBkCg3QaSyFMYoWuDXIoI5Y7Zia0+sknoTOgUMad0beoZqf
	W+veuqvZ/OV6uR2RJsy5Se2/A==
X-Received: by 2002:a17:90b:1c8b:b0:398:9bd5:490c with SMTP id 98e67ed59e1d1-39b26214502mr30069462a91.19.1788766482294;
        Mon, 07 Sep 2026 00:34:42 -0700 (PDT)
Received: from nzzhao-ThinkCentre-M760t.mioffice.cn ([43.224.245.179])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08c397b1sm24931008a91.8.2026.09.07.00.34.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 00:34:41 -0700 (PDT)
From: Nanzhe Zhao <nzzhao.sigma@gmail.com>
X-Google-Original-From: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
To: Chao Yu <chao@kernel.org>
Cc: linux-f2fs-devel@lists.sourceforge.net,
	Barry Song <baohua@kernel.org>,
	Juan Yescas <jyescas@google.com>,
	Pengfei Li <lipengfei28@xiaomi.com>,
	Dev Jain <Dev.Jain@arm.com>,
	linux-kernel@vger.kernel.org,
	David Hildenbrand <David.Hildenbrand@arm.com>,
	Bo Zhang <zhangbo56@xiaomi.com>,
	Kalesh Singh <kaleshsingh@google.com>,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	Ryan Roberts <Ryan.Roberts@arm.com>
Subject: Re: [f2fs-dev] [PATCH 06/14] f2fs: prepare mmap write faults for large folios
Date: Mon,  7 Sep 2026 15:34:34 +0800
Message-ID: <20260907073434.2349510-1-zhaonanzhe@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <eecd3a49-d252-4d36-9e5a-44ac3eb02108@kernel.org>
References: <eecd3a49-d252-4d36-9e5a-44ac3eb02108@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 27 Aug 2026 20:36:02 +0800, Chao Yu wrote:
> We only need to call f2fs_get_block_locked() for vmf->page?
>
> Hi Barry, could you please help to confirm this? Only vmf->page contain dirty
> data, rather than whole large folio contain dirty data?

Thanks for the review. Here is the write-fault path on current
mainline (mm/memory.c):

do_pte_missing()                          memory.c:4561
  -> do_fault()                           memory.c:5964
    -> do_shared_fault()                  memory.c:5914
      -> __do_fault() -> filemap_fault()  : fault in folio (may be 16KB)
      -> do_page_mkwrite(vmf, folio)      : page_mkwrite ONCE per folio (memory.c:5936)
         -> vma->vm_ops->page_mkwrite(vmf)  memory.c:3684
      -> finish_fault()                   memory.c:5617
         -> set_pte_range()               memory.c:5558
            if (write)
                entry = maybe_mkwrite(pte_mkdirty(entry), vma);   memory.c:5575
            set_ptes(vma->vm_mm, addr, vmf->pte, entry, nr);      memory.c:5586

So page_mkwrite is entered once per folio, and afterwards the PTEs of
all subpages are installed writable in one go - writes to other
subpages of the same folio will not fault again. That is why
f2fs_vm_page_mkwrite() preallocates/marks dirty_len rather than
handling vmf->page only.

I'll add a comment in f2fs_vm_page_mkwrite() in the next version to
make the point clear.

Thanks,
Nanzhe
