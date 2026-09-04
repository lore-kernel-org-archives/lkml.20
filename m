Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D614F55AC
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 15:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788535911; cv=none; b=FdmIO4hxnNGrrfnrbywaKClRHYyOaM6qcZeVK88KKAVcvydkgfLFiYFuSW7MJTCNbk9DyBJmUSj0rYoGdgkGepUNLj1RfqLRKnMQmlVhp5s/VnVwr0BjCYFzrxA4gypiPkEYlf6vtZzztTwa6suow2zcNuLYPUxFNpg5mn3leoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788535911; c=relaxed/simple;
	bh=ocI4dQsxB8t5prCDfeqVv/27rqEw33aRyRMZvwh2m9w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=c+hhhkwIgoAyB+RB7P9gqBAC+09yJgIAYE6GPtjRLFyTZFrvQahSevV3zcuz7dfUONYDjZl3eIIyIN7E0+Ml+ROlylKCCkEu/rnWo0WgeMy7Z6UuxuR7brlz+DHFhvialx4RDA8aD7tXjkQ2ik6xYi1ADb+EJDwMEw/mXrvAw8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LE/QfN82; arc=none smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LE/QfN82"
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-4650773fa99so536895fac.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 08:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788535908; x=1789140708; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AA+yqbwYZteLCNaSIMYbow92ZoGZzXWDMvvS4HzPIJ0=;
        b=LE/QfN829mV4sNEcQNrgIRW8sFqdBKPl0zVlsuF8xvraJCXjmg8D0R7fRuIIM2yg+r
         BcPNmmBDZvvabeRFJuFpbxSMBtPZGu1wJ/3YDnQMWNemiCcF5rJRMexBQ/TBVKVLJM8U
         aWTCiqhkmziJPC/qr7LuNgG1r7gVzOcWUYvR7BNFc+NKllcID4x0sPyD2eSbeuYi/VNG
         VkVYDDT/d0Lvx6o/HamOON167zQV2wm9bwVs9l3tl5xAUMIaWzmM2NcaRq06ebMPA3I4
         EkIBt4C1ZdU6Dx7FF2nFHvxdtpwUc+4FX/gdAf50IeQa5eWrjmLQOklC+WIYgaJ1iToP
         cx8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788535908; x=1789140708;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AA+yqbwYZteLCNaSIMYbow92ZoGZzXWDMvvS4HzPIJ0=;
        b=Yn2h+qqDBUK80m/x+j/B5Eby2lLt4gmkJ21fl47uYtrhax5ExGa1oZHaF8SRsGYLTG
         3B12sxxxSo+6synTCSZ2AcsemWms0lW/KEM9Zmm6aHjzAMxOpQIbgs7/ei+1Xo3lMcm3
         RSsnEhdlfgWjGBixZGuSjRL/ymP6Z7t/0ctzUPNkSjFn2FMmbZnBaQKZ1DKDrxI1cJ0J
         x5/zKPcAtWIerNcS+4+/rZmiDEL4+g3MoexVjvsNLJpOBKB+8KYfHiMRPQQqxR1oHURk
         j7rIGVVW1Bq9ysRW/ufc0ZOp/flWJvBHTFg7opoB6E3AWhOHW6R2XILtjjnKNpptVzSo
         Rinw==
X-Forwarded-Encrypted: i=1; AKwUvBwYaBQ3X9eF1XW+teCAcLzgGnHTscSQ78WhVv18Ijm6p3JTGs2pHQUp72wGvPfXghAeoB0HgNTeQTzU5Ls=@vger.kernel.org
X-Gm-Message-State: AFuF++kaW0+eAAhxsbydm6GkruqB2qMemK7VVIkIRSn7XmwjGnMayPIn
	6VNfoJruutFl/YBDFT4CuMp1sYdpzDVzBNdbwLowXXne6rljjCgxnBDq
X-Gm-Gg: AYBFou0NdS1xIciI8n8WvhmzYHfSuiwBz2kGhwxomd13jR84xnGDEFi0X93nD694hJY
	iWcdGO5vlDps0s2LPBWwBlr+J1QrJnaQWNM8+xMzPnm7wiDBLPbY6EN23UPkPuXV54KQj12UQOb
	bu8Z0hkUfkEjzrwVh8OGXpz87LEMAIg1FymGtoawtk/q8ygEydty3D7JTbd3FotKehzXOxeS3ZW
	+6XhdKp83EYC5xfTwV4fJEaxKO+Zy1UjXyVPFxglvKnVlS65uoqoKrFzYQmT+79YIR2zQx3fUO7
	t0WYxkF5ap9WVXZ+TTVSyNb9zLmrq1bUpjyUVsqMepdrBBHVoS0JSbi6ezb/7UjEtEyY73iGkV9
	03nHj93bqt91GHmbPktZ0OTHDNIm73UAN4DLVe1umgSqvdy7uWRY8yj0mg3bUm6xOQ3ruu+1IO1
	mDCovKhZFcf1qHS7G4PKAMsnGGqgp8qNalsCb21ixIRodPezrMqDZJC7HZGdiAwFILFJxPz4x5u
	pTaN8xu3kde7+llm7e+KZVmOmrA6jk=
X-Received: by 2002:a05:6870:c10c:b0:448:71f4:a28 with SMTP id 586e51a60fabf-4754f7c25c0mr6819282fac.2.1788535908255;
        Fri, 04 Sep 2026 08:31:48 -0700 (PDT)
Received: from archlinux.lan ([136.34.156.120])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47554b60b21sm2371315fac.14.2026.09.04.08.31.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 08:31:47 -0700 (PDT)
From: Danish Khateeb <danishkhateeb03@gmail.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	linux-efi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danish Khateeb <danishkhateeb03@gmail.com>
Subject: [PATCH] efi/capsule-loader: Replace kmap() with kmap_local_page()
Date: Fri,  4 Sep 2026 10:31:31 -0500
Message-ID: <20260904153131.134383-1-danishkhateeb03@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

kmap() is deprecated in favour of kmap_local_page(), as described in
Documentation/mm/highmem.rst.

The conversion is safe here. efi_capsule_write() maps the page and
releases it within the same call, on both the success and the fail_unmap
error path, so the mapping never escapes the thread that created it and
the stack-based unmap ordering is preserved. No atomic context is
involved: the page is allocated with alloc_page(GFP_KERNEL) just above,
and the copy_from_user() performed while the page is mapped is fine
because faults are permitted in a local kmap region.
efi_capsule_setup_info() also runs while the mapping is live, but only
reads through the pointer.

kunmap_local() is handed a pointer that has been advanced into the page,
which is fine as it masks the address back down to the page boundary.

Build-tested only, on i386 with CONFIG_HIGHMEM=y -- where
kmap_local_page() actually establishes a mapping rather than returning
the direct-map address -- and on x86_64. No new gcc or sparse warnings.

Assisted-by: LLM sparse
Signed-off-by: Danish Khateeb <danishkhateeb03@gmail.com>
---
 drivers/firmware/efi/capsule-loader.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/efi/capsule-loader.c b/drivers/firmware/efi/capsule-loader.c
index 8e8f81f0a5a0..e423df3438da 100644
--- a/drivers/firmware/efi/capsule-loader.c
+++ b/drivers/firmware/efi/capsule-loader.c
@@ -197,7 +197,7 @@ static ssize_t efi_capsule_write(struct file *file, const char __user *buff,
 		page = cap_info->pages[cap_info->index - 1];
 	}
 
-	kbuff = kmap(page);
+	kbuff = kmap_local_page(page);
 	kbuff += PAGE_SIZE - cap_info->page_bytes_remain;
 
 	/* Copy capsule binary data from user space to kernel space buffer */
@@ -217,7 +217,7 @@ static ssize_t efi_capsule_write(struct file *file, const char __user *buff,
 	}
 
 	cap_info->count += write_byte;
-	kunmap(page);
+	kunmap_local(kbuff);
 
 	/* Submit the full binary to efi_capsule_update() API */
 	if (cap_info->header.headersize > 0 &&
@@ -236,7 +236,7 @@ static ssize_t efi_capsule_write(struct file *file, const char __user *buff,
 	return write_byte;
 
 fail_unmap:
-	kunmap(page);
+	kunmap_local(kbuff);
 failed:
 	efi_free_all_buff_pages(cap_info);
 	return ret;
-- 
2.55.0

