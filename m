Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793116047;
	b=f0XZaz1lOgzLDfWbKYjFXGr6cCqHg1oFdXmqktWSnFegMtUHsMoYlxUcjzBhQm4NVUVt
	 f6+U1WwsOCbYIh1eUnY7E+1YVblPuLKtMzCQZzwpsL6z8BTNrlgOfTaVpNI42R1fNAB18
	 KKiO1GQDurZH+NmbYxerDRTMy1pJ3TEggNB2kcdV8G563ivLApR/dTcFVDf4VGH7BvGGI
	 DJufRuPRoCyXZwqnhP0MEi32H+T6c1IAZEk5/3w8JNNYrd/aWOQ5NMderktqHLowMi1Ft
	 2ptTUPONLAolpXDiG+35SSZiUiKRQ1Cssv1qHTXuFdqRXoprO1I0ymiju8dTHIN30qA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793116047;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=d2ojhVyA7G70YSFxIWDEXLUjmLV19PosvKcY5O6DkLk=;
	b=lPwwEaaSfAagBeSi/UO6PJAn91BpmgeQ9RazHdM2FjN0CawuEoLB0uXniAM6QQIVDVFl
	 hl6D9rjrQnTpgAGGZIoQmpxYchoAigw+V7JBlQKJ8q1f1LhFSagFA4Egu14CQi8Be77sX
	 x+Ih+0ba2ksinHKWSx25JosiNksyUwGsVucMxl9yfvnlHmAJ9+QkM/jZrKjUvYGIRzgAm
	 Jm46rZM+yzQji2UwJaHBhMXaDUlsf9LzH9fTwUj3anLJjvJzDkGb8G4kFrqetz/rvQQuH
	 u2xx0DsFBMrO2Tk13xtaXN0Yz6ekc+tbzAQMwUZ+p+U0ZBCRK7dy0S+llQN2tyMCs0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VwS1GD2u;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22EF606FCBC
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:47:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C22EF606FCBC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VwS1GD2u
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so3620873f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 08:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793116045; x=1793720845; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d2ojhVyA7G70YSFxIWDEXLUjmLV19PosvKcY5O6DkLk=;
        b=VwS1GD2uQIUAtVynptslNi32b8hDtW5hYaCUcKM7l7bDk8D2wwG0nN1Dd+qJlkwsd6
         MmVp8/dTgoB8uCoVh3luf4fXvzBIBvjHJtruTyc3TY1ZFSvlGD9NMJXS8VYD2ODxvcGe
         mYRxn75gVzpHewYITJkVaQBjRO8juzFR0MJL9cbnVL0f9JqNqCVHiZD1OrlIdwJbbxRa
         pbzfPAi2Ig0HsjJ9BerceMg9ZQDbn6GujqiuOVumpmTvpfh6Yg6TDdTLav4cqQ4WF2/x
         Dk5YE+esLyF8KIMN7snbZwHrz+XiLaHbVgDc6kXG6wmkyTzr2v0k+6QHcK1zfNOk/hz9
         yQVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793116045; x=1793720845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=d2ojhVyA7G70YSFxIWDEXLUjmLV19PosvKcY5O6DkLk=;
        b=zXevau9Bj7XgDp8Mkl+X4YxsYKvrDlQ8lUZQDgRrGOAEXiNgmGgBe6ZismkVvsApg6
         T+/FFoj5y1Bioowd/6FRiaqF2jEHIs/VN3AgiT5brMqS3CCm8xduHMPhTUUhB4RDccTk
         bBuVSpGaSNEKqObPvnZjSw5of043xKs/Zoe58uRL97c98/8Z05HknJTBSPARd6KoIW5L
         SjzFGCb8zx/+y6BuID9tQzul2MTuyM3ZB2vq4VSZn/8fol78xhhUPAg7uG0kKZYHzsL3
         OQ9/zId1+fxxsnKgiPi2yysOCbws1YU96Co5g1YCz/RKT2i+ZT3wTWy6q0+1evDoJSc2
         TdWg==
X-Forwarded-Encrypted: i=1; AKwUvBy093NpFbgYJjwMBGXWj9pZ8frtVrRFlJ8wMH0czEfSbeJJUzjaDPx978rXDsQx+Ix0ppCDeoVZAq+0qyY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIW5UDhkZ4j7JRHYlBViN5+W30wJVkqpc3LYbP+8+SDY+YFiYYH
	X+DmzSlXV+QikCZXgYdzdxsRusfA7HsfDmJOUBG45BXltpA98tvpwAcY
X-Gm-Gg: AYBFou3NylNWD2Gq6zRjxiZGR+q5CbZ85k/r+RHYe7SZzbsgkn7HSFmvbuIC0WxbYON
	zjzvFzxY1sO1y1fIak8rkMMz6gLsQW2oWffjUFd49LJfOdMEar5Oci+jimxMRbdJSTsALjLzvqy
	y2aTAEmm/Z6QCuCKsROTj/S/8YX1FLUmziQEPyeQe9DgcF6av4CLv0F6RdhXXG8tB9BZjysBnfp
	1AVHoCcGagkZ5w25+3X+UrufYypkdw4eGJpQPbbWD6GnTARPXKJmvPfMmS/HRkTLq+HdV4zbTKM
	QamOY6Lokk9z3SBUgoj1U5fRqd19pFG4C8g/AQUTgUXVoGTSqYI3vZhNFyFbNJlaNJ1HdatrpDW
	AueS5UlIf5wBeO6mSTSHELVHpUhZQT0z4UigwK/uIpVAbbvexp8SZKZGuKYvHrHA9k/l+u6Zygp
	E7JbwRHHEWM5qOJGELuAWYz9ugs+vhRVZCkhN/Dac2SJ9oVG1fi3JaW5GZ/6K8MjhBZY96Qk2ht
	bMohfYdz+Zihete6CmFf7bC6wNcdHhDyPtn1RI32Tb13rGsi4SYqjVp1byyzpfZ5Sw3ySvpqQn+
	OldjHJaxaiyPy6LLst5ueIePILvNl+qN4r7jr8+IgE7REc4ITPiWRmfr+bKQgA5Uh8xBmWGE5fZ
	TY3iFIzYn4em6zV/z/sCBrzqrzX/XoNbRfeyZX/NEjxRJUoXBVq0lBIAJocpawBoYeQ==
X-Received: by 2002:adf:f284:0:b0:48e:2980:d396 with SMTP id ffacd0b85a97d-48e3eb8d6a5mr16586892f8f.37.1793116044977;
        Tue, 27 Oct 2026 08:47:24 -0700 (PDT)
Received: from dev-dsk-fgriffo-1c-93421965.eu-west-1.amazon.com (54-240-197-234.amazon.com. [54.240.197.234])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb958sm23845574f8f.21.2026.10.27.08.47.22
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Oct 2026 08:47:24 -0700 (PDT)
From: Fred Griffoul <griffoul@gmail.com>
To: Ackerley Tng <ackerleytng@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Kevin Tian <kevin.tian@intel.com>
Cc: Alex Williamson <alex@shazbot.org>,
	Alexander Graf <graf@amazon.de>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Alexey Kardashevskiy <aik@amd.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Ashish Kalra <ashish.kalra@amd.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Baolu Lu <baolu.lu@linux.intel.com>,
	Bill Wendling <morbo@google.com>,
	Borislav Petkov <bp@alien8.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christian Brauner <brauner@kernel.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Connor Williamson <connordw@amazon.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dave Jiang <dave.jiang@intel.com>,
	David Hildenbrand <david@kernel.org>,
	David Rientjes <rientjes@google.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Erdem Aktas <erdemaktas@google.com>,
	Frank van der Linden <fvdl@google.com>,
	Gregory Price <gourry@gourry.net>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Hugh Dickins <hughd@google.com>,
	Ingo Molnar <mingo@redhat.com>,
	Jacob Pan <jacob.pan@linux.microsoft.com>,
	James Houghton <jthoughton@google.com>,
	Jan Kara <jack@suse.cz>,
	Jianxiong Gao <jxgao@google.com>,
	Joerg Roedel <joro@8bytes.org>,
	Joey Gouly <joey.gouly@arm.com>,
	John Starks <John.Starks@microsoft.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Justin Stitt <justinstitt@google.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Michael Roth <michael.roth@amd.com>,
	Mike Rapoport <rppt@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Oliver Upton <oupton@kernel.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Samiullah Khawaja <skhawaja@google.com>,
	Shuah Khan <shuah@kernel.org>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Tarun Sahu <tarunsahu@google.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Tycho Andersen <tycho@kernel.org>,
	Vishal Annapurve <vannapurve@google.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Will Deacon <will@kernel.org>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	Yan Zhao <yan.y.zhao@intel.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	x86@kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	kvm@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org,
	llvm@lists.linux.dev,
	iommu@lists.linux.dev
Subject: [RFC PATCH 13/14] samples/kvm: Back absent pages on demand in the sample provider
Date: Tue, 27 Oct 2026 15:46:48 +0000
Message-ID: <20261027154649.91571-14-griffoul@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261027154649.91571-1-griffoul@gmail.com>
References: <20261022-gmem-alternative-providers-v2-0-5dd1dc6c660a@google.com>
 <20261027154649.91571-1-griffoul@gmail.com>
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

From: Fred Griffoul <fgriffo@amazon.co.uk>

The sample provider fails get_pfn() for an absent page and keeps its
frames on a punch hole, so tests cannot exercise a provider that backs
a hole when it is asked for a frame, one that backs more than the page
asked for, or one that frees the frames that a punch hole gives back.

Add MPS_NEW_FILE_FILL: get_pfn() then backs an absent page with the
whole 2 MiB block around it, and put_pfn_range() makes the pages absent
again.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Fred Griffoul <fgriffo@amazon.co.uk>
---
 samples/kvm/mem_provider_sample.c | 29 ++++++++++++++++++++++++-----
 samples/kvm/mem_provider_sample.h |  9 ++++++++-
 2 files changed, 32 insertions(+), 6 deletions(-)

diff --git a/samples/kvm/mem_provider_sample.c b/samples/kvm/mem_provider_sample.c
index 670e36207e59..41e0ce5b6bc6 100644
--- a/samples/kvm/mem_provider_sample.c
+++ b/samples/kvm/mem_provider_sample.c
@@ -41,6 +41,7 @@ struct mps_info {
 
 	unsigned long *absent;		/* taken away by MPS_SET_PRESENT */
 	unsigned long *readonly;	/* set by MPS_SET_READONLY */
+	bool fill;			/* MPS_NEW_FILE_FILL */
 
 	struct inode *gmem_inode;
 };
@@ -62,8 +63,15 @@ static void mps_gmem_put_pfn_range(void *provider, pgoff_t index,
 				   size_t nr_pages)
 {
 	struct file *resource_file = provider;
+	struct mps_info *info = resource_file->private_data;
+	size_t i;
 
-	mps_zero_range(resource_file->private_data, index, nr_pages);
+	mps_zero_range(info, index, nr_pages);
+	if (!info->fill || index >= info->npages)
+		return;
+	/* Lockless, like get_pfn(): guest_memfd holds its invalidate lock. */
+	for (i = index; i < min_t(size_t, index + nr_pages, info->npages); i++)
+		set_bit(i, info->absent);
 }
 
 /* Byte range [offset, offset + len) of @info as page indices. */
@@ -228,7 +236,9 @@ static bool mps_bits_are(unsigned long *bitmap, unsigned long first,
 /*
  * The frame behind @index, and the largest aligned block around it that is
  * present and has the same attributes: the file's frames are contiguous.
- * Lockless: a change is followed by kvm_gmem_revoke() or kvm_gmem_restore().
+ * Lockless: a change is followed by kvm_gmem_revoke() or kvm_gmem_restore(),
+ * except a fill, which only gives frames to holes; guest_memfd tells its users
+ * about the block.
  */
 static int mps_gmem_get_pfn(void *provider, pgoff_t index, unsigned long *pfn,
 			    int *max_order, u32 *attrs)
@@ -241,8 +251,16 @@ static int mps_gmem_get_pfn(void *provider, pgoff_t index, unsigned long *pfn,
 	if (index >= info->npages)
 		return -EINVAL;
 
-	if (test_bit(index, info->absent))
-		return -EFAULT;
+	if (test_bit(index, info->absent)) {
+		unsigned long first = ALIGN_DOWN(index, PTRS_PER_PMD);
+		unsigned long i;
+
+		if (!info->fill)
+			return -EFAULT;
+		/* Absent pages are zeroed already. */
+		for (i = first; i < min(first + PTRS_PER_PMD, info->npages); i++)
+			clear_bit(i, info->absent);
+	}
 
 	ro = test_bit(index, info->readonly);
 	*pfn = info->base_pfn + index;
@@ -307,7 +325,7 @@ static long mps_ctl_new_file(void __user *uarg)
 
 	if (copy_from_user(&nf, uarg, sizeof(nf)))
 		return -EFAULT;
-	if (nf.flags || nf.pad)
+	if ((nf.flags & ~MPS_NEW_FILE_FILL) || nf.pad)
 		return -EINVAL;
 	if (!nf.size || !PAGE_ALIGNED(nf.size))
 		return -EINVAL;
@@ -337,6 +355,7 @@ static long mps_ctl_new_file(void __user *uarg)
 	info->cma_pages = pages;
 	info->base_pfn = page_to_pfn(pages);
 	info->npages = npages;
+	info->fill = nf.flags & MPS_NEW_FILE_FILL;
 	mutex_init(&info->lock);
 
 	fd = get_unused_fd_flags(O_CLOEXEC);
diff --git a/samples/kvm/mem_provider_sample.h b/samples/kvm/mem_provider_sample.h
index 57f494dc46fa..45ec9605b593 100644
--- a/samples/kvm/mem_provider_sample.h
+++ b/samples/kvm/mem_provider_sample.h
@@ -19,11 +19,18 @@
  * Returns the provider fd.
  */
 struct mps_new_file {
-	__u32 flags;	/* Reserved, must be 0 */
+	__u32 flags;	/* MPS_NEW_FILE_* */
 	__u32 pad;
 	__u64 size;	/* bytes, page aligned */
 };
 
+/*
+ * get_pfn() backs an absent page, with every page of the 2 MiB block around
+ * it, instead of failing, and put_pfn_range() takes the pages back: a
+ * provider that allocates on demand and frees on a punch hole, for tests.
+ */
+#define MPS_NEW_FILE_FILL	(1U << 0)
+
 #define MPS_NEW_FILE \
 	_IOW(MPS_IOCTL_BASE, 5, struct mps_new_file)
 
-- 
2.47.3

