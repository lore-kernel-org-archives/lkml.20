Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794115430;
	b=OJv0+Oj73vknF7GQaQ2xBUBeBOU4MtL4yFLSdKgVeKJG8o1oH9BX1k065IIZRhREi89k
	 8iuKB7vCBWFtAfBugOBbg1uwoK4DoonxXjYqELDzufmHdrAP5c71B3N68wSQkaF9xSRiI
	 1Wb53Iscc3dIheALOn4GOGUXULmCjNvqt1LL6XYcTZNfXxaNGY1mYIsrciRzGDUF56Vb9
	 V09cLKIbS9ddKgzNfaBXKLDHoQfYiaKiKZIlzlHjgtRpVANsiUSf6sK0BmY9d/IvxVRww
	 cylrVF26MJpaucDMkip7lpBTYJ0rVzay6Ux6VrgtbAiHOTnbhGjTKFbAEf+w/YF9clg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794115430;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=nPcc1C6VpjmCET3tBtMp/wreo0ZSVB6OHb06Azdk0dk=;
	b=Y4Ws4gayXCJc6PJMsGoTYNiRjIFyV6nvbWqOMMh6Epc12g4YxTlqoAcOPXEHQ5v7Ynyf
	 Y67CibADAGnUQKAf13DqYmrkhiASIIza77J86Rdqe2aRCcI6XJN/J2kX2dZS0qRLcUivE
	 O5u1qTB2YCuvD098ERlKSHctBPvkkW5QDSso1YAUQ/cKlIg2lWwVOm01VW47K9mFEq4Tm
	 aEE7I/AAGFqsBkmP8SSk/bCp12IlkRugRbKg4pGr3M5EDYngLWoC5rIic7PnvM4UtZ+w3
	 okC6JR1f0/4675xUs8LgNsbPg9SOc2daaQZsjt/69CV/lG0kfETgia1z10o3P1EXCZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Htn3eK60;
	arc=none smtp.remote-ip=74.125.227.198
Received: from mail-pi2-f6.google.com (mail-pi2-f6.google.com [74.125.227.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3F41606A31A
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 05:23:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3F41606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Htn3eK60
Received: by mail-pi2-f6.google.com with SMTP id 41be03b00d2f7-cdb536daf59so102844a12.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 21:23:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794115428; x=1794720228; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nPcc1C6VpjmCET3tBtMp/wreo0ZSVB6OHb06Azdk0dk=;
        b=Htn3eK60m0fQRkOycYcybiHKS7qAvG3OPf96vkbPHu3ZMD+I4mmiMAPe68wmhbHVTt
         vxAPUKAv1z2J3z/NRLXfSKprxbijGyufzKyoYOqAA5SbTOwawftDj9+8gTgtbVJ6prDY
         9WxAz4dTJn+3zq8YJvw5Vfg6lDKh4sbhLzEodt3FWORDmigghMogbYFCj59dCmA8kfUm
         kU+NjTMyf124tunHVWlN6A+wsV4paSiULd8JLDEGi+Fy4j0Kbg5RHGBozgSv4W6eUvBa
         eaovykhBE6DKW6iKusPOf3vbIXY/QHrwLadW7tGN/RGs9QYo114QnO6lYAJ46jQfJlMr
         ShAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794115428; x=1794720228;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nPcc1C6VpjmCET3tBtMp/wreo0ZSVB6OHb06Azdk0dk=;
        b=FEdaQu1lhUjmH01Pwq5/0/RdCmHHXVhtgfLl8bR9EHZYATHf2ejF8mM/EXvRLaqJuT
         iupjoU+opIogrodj6CuSiqE7DZaJS7pgvJi/5ku3wz1VZk0tdaDUIyWyeDX+bP/F0uTl
         FqHTMVUVyNKBiw4BnhbFjJWjwLsnTErIBjYM1X+IoUtT9c0NURTvHhaUU+tHWXeLKBMX
         pMwAqFgCHPBezyQL89ihfaWsOsfMdze6VBngumntWmHiTse2mOZBArBzKICm3Kzr8+k9
         n8c8yx6awROmENAhln9HCbp1+6U4WILH9MFa0toqoyVPT9d4vYhiBvlF1v4t5fCysOYe
         UWSg==
X-Forwarded-Encrypted: i=1; AL+hErFVbwQLyUis6oRcej2xtun5Tdqhh1+2m7XDnnjDx6e3wlBmCxTC7V8jNHSAprO9TS+in6vzQESyP7JjUus=@vger.kernel.org
X-Gm-Message-State: APuU4Z+5IfGa8LUt1o1cDNiSMROFP3Ss9SU6nrOHPdVUsGcH3c86ULdY
	rkoqxSFLLJtVthD8ad4SFX8a1MQKon9VdSmsvd5ccJE+TEv18gKH0+OO
X-Gm-Gg: AYBFou29i+7nNQU20Z7wbd3HsKn8WJQ+ndbr1DNPB2ZdgGFrHO6B7ChFUlHSo109+Hd
	YnEpVUW2ltPL7RMNMUdDRZh8s0dF/OjmrjZcSNt0Ncf13w1chprbGLWEsXsg1EyXYbbb+6+PLl0
	YSsN3gQCKOy+5uHphl5sYuO8YhAByxc4Krx5D4hI49+Nbr8th7UPUCPJKhUMReuUz8Up+Mbe0LB
	XNjt+DbkwMueIPiRGbNSflQC0We0eA/fo3h5zsZoz/457Rdq/6yOHQvfw2w2iDOCQ9ctRhlA6jJ
	vCOlI5eqKJv86etHJqHGPy1iteRVSG4ntL2UF/WBKSWp99A7bA20Z3GoBDotCHZL/+FA5JdeA/u
	dc8f+WM0aNeYT7wI5GC+DHVmC3L5ActXPYqai/LnsSB+LTCZi/QVvjY6/e3QgFZtUBmXjCfo5NE
	ovwTqmDKbeYVtT4HoNn6NodPsQnWYwZntwgPJsIT4bR90HL/c8RKYyVy3+0Lxej5KkmS7zDHa+c
	NxooggqCOkpVnPU1FXe9pn0g2BPucpK0xZ7X5uRkXkswzDt32s9kPRFkgwgSZY6jw1/VT/l9Zhg
	PbeL4gQPp5mbxmH80I6lA5ci4uOvoy7EVqsMimjWHI8RitTiQjZVsNZq/gZdFqFmNY2wLZr62Hm
	B2xw5RnwDl/KkJ88pL2VniJIv33hKq9y7l0eALVjoidH0Tug=
X-Received: by 2002:a05:6a00:3313:b0:890:a995:1f61 with SMTP id d2e1a72fcca58-8b66ef0603fmr596011b3a.15.1794115428353;
        Sat, 07 Nov 2026 21:23:48 -0800 (PST)
Received: from [192.168.50.20] (42-98-155-143.static.netvigator.com. [42.98.155.143])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b646bd4af6sm281341b3a.2.2026.11.07.21.23.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 21:23:48 -0800 (PST)
From: Aveline Noir <jm5905938@gmail.com>
Date: Sun, 08 Nov 2026 16:13:33 +1100
Subject: [PATCH 1/2] drm/amdkfd: handle SVM interval notifier registration
 failures
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261108-kfd-svm-baseline-errors-20261107-v1-1-9ef4008019ab@gmail.com>
References: <20261108-kfd-svm-baseline-errors-20261107-v1-0-9ef4008019ab@gmail.com>
In-Reply-To: <20261108-kfd-svm-baseline-errors-20261107-v1-0-9ef4008019ab@gmail.com>
To: Felix Kuehling <Felix.Kuehling@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Philip Yang <Philip.Yang@amd.com>, Sunil Khatri <sunil.khatri@amd.com>, 
 honghuan@amd.com, honglei1.huang@amd.com, psirt@amd.com, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0

The first interval notifier registration for an mm can fail while
initializing the interval tree. svm_range_add_notifier_locked() ignores
that error, so SET_ATTR and retry-fault handling can publish an SVM range
without a registered notifier. Subsequent HMM access can then dereference
an uninitialized notifier.

Propagate the registration error and register staged ranges before
publishing the SET_ATTR transaction. Remove successful registrations on
failure before freeing the staged ranges, preserving the original ranges
and the existing memory-accounting rollback. Also free an unpublished
retry-fault range and return its registration error.

Fixes: b1c46c7d622b ("drm/amdkfd: validate svm range system memory")
Signed-off-by: Aveline Noir <jm5905938@gmail.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c | 56 +++++++++++++++++++++++++++---------
 1 file changed, 43 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index ed5e3318877b..8184cbbb829e 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -106,16 +106,21 @@ static void svm_range_unlink(struct svm_range *prange)
 		interval_tree_remove(&prange->it_node, &prange->svms->objects);
 }
 
-static void
+static int
 svm_range_add_notifier_locked(struct mm_struct *mm, struct svm_range *prange)
 {
+	int r;
+
 	pr_debug("svms 0x%p prange 0x%p [0x%lx 0x%lx]\n", prange->svms,
 		 prange, prange->start, prange->last);
 
-	mmu_interval_notifier_insert_locked(&prange->notifier, mm,
+	r = mmu_interval_notifier_insert_locked(&prange->notifier, mm,
 				     prange->start << PAGE_SHIFT,
 				     prange->npages << PAGE_SHIFT,
 				     &svm_range_mn_ops);
+	if (r)
+		prange->notifier.mm = NULL;
+	return r;
 }
 
 /**
@@ -2257,6 +2262,7 @@ svm_range_split_new(struct svm_range_list *svms, uint64_t start, uint64_t last,
 /**
  * svm_range_add - add svm range and handle overlap
  * @p: the range add to this process svms
+ * @mm: the process address space, write locked by the caller
  * @start: page size aligned
  * @size: page size aligned
  * @nattr: number of attributes
@@ -2285,7 +2291,8 @@ svm_range_split_new(struct svm_range_list *svms, uint64_t start, uint64_t last,
  * 0 - OK, otherwise error code
  */
 static int
-svm_range_add(struct kfd_process *p, uint64_t start, uint64_t size,
+svm_range_add(struct kfd_process *p, struct mm_struct *mm,
+	      uint64_t start, uint64_t size,
 	      uint32_t nattr, struct kfd_ioctl_svm_attribute *attrs,
 	      struct list_head *update_list, struct list_head *insert_list,
 	      struct list_head *remove_list, struct list_head *remap_list)
@@ -2373,17 +2380,38 @@ svm_range_add(struct kfd_process *p, uint64_t start, uint64_t size,
 	}
 
 	/* add a final range at the end if needed */
-	if (start <= last)
+	if (start <= last) {
 		r = svm_range_split_new(svms, start, last,
 					READ_ONCE(max_svm_range_pages),
 					&new_list, update_list);
+		if (r)
+			goto out;
+	}
+
+	/* Register all notifiers before publishing any of the new ranges. */
+	list_for_each_entry(prange, &new_list, list) {
+		r = svm_range_add_notifier_locked(mm, prange);
+		if (r)
+			goto out;
+	}
+	list_for_each_entry(prange, insert_list, list) {
+		r = svm_range_add_notifier_locked(mm, prange);
+		if (r)
+			goto out;
+	}
 
 out:
 	if (r) {
-		list_for_each_entry_safe(prange, tmp, insert_list, list)
+		list_for_each_entry_safe(prange, tmp, insert_list, list) {
+			if (prange->notifier.mm)
+				mmu_interval_notifier_remove(&prange->notifier);
 			svm_range_free(prange, false);
-		list_for_each_entry_safe(prange, tmp, &new_list, list)
+		}
+		list_for_each_entry_safe(prange, tmp, &new_list, list) {
+			if (prange->notifier.mm)
+				mmu_interval_notifier_remove(&prange->notifier);
 			svm_range_free(prange, true);
+		}
 	} else {
 		list_splice(&new_list, insert_list);
 	}
@@ -3011,8 +3039,12 @@ svm_range *svm_range_create_unregistered_range(struct kfd_node *node,
 	if (is_heap_stack)
 		prange->preferred_loc = KFD_IOCTL_SVM_LOCATION_SYSMEM;
 
+	r = svm_range_add_notifier_locked(mm, prange);
+	if (r) {
+		svm_range_free(prange, true);
+		return ERR_PTR(r);
+	}
 	svm_range_add_to_svms(prange);
-	svm_range_add_notifier_locked(mm, prange);
 
 	return prange;
 }
@@ -3203,11 +3235,11 @@ svm_range_restore_pages(struct amdgpu_device *adev, unsigned int pasid,
 			goto retry_write_locked;
 		}
 		prange = svm_range_create_unregistered_range(node, p, mm, addr);
-		if (!prange) {
+		if (IS_ERR_OR_NULL(prange)) {
 			pr_debug("failed to create unregistered range svms 0x%p address [0x%llx]\n",
 				 svms, addr);
 			mmap_write_downgrade(mm);
-			r = -EFAULT;
+			r = prange ? PTR_ERR(prange) : -EFAULT;
 			goto out_unlock_svms;
 		}
 	}
@@ -3839,7 +3871,7 @@ svm_range_set_attr(struct kfd_process *p, struct mm_struct *mm,
 	mutex_lock(&svms->lock);
 
 	/* Add new range and split existing ranges as needed */
-	r = svm_range_add(p, start, size, nattr, attrs, &update_list,
+	r = svm_range_add(p, mm, start, size, nattr, attrs, &update_list,
 			  &insert_list, &remove_list, &remap_list);
 	if (r) {
 		mutex_unlock(&svms->lock);
@@ -3847,10 +3879,8 @@ svm_range_set_attr(struct kfd_process *p, struct mm_struct *mm,
 		goto out;
 	}
 	/* Apply changes as a transaction */
-	list_for_each_entry_safe(prange, next, &insert_list, list) {
+	list_for_each_entry_safe(prange, next, &insert_list, list)
 		svm_range_add_to_svms(prange);
-		svm_range_add_notifier_locked(mm, prange);
-	}
 
 	list_for_each_entry(prange, &update_list, update_list)
 		svm_range_apply_attrs(p, prange, nattr, attrs, &update_mapping);

-- 
2.56.0

