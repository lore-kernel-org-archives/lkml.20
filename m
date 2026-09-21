Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15237499F17
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 12:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789993428; cv=none; b=abhyJx6WbmEg16AnGWufZTbV1VyTzhgHNSF4VfM8zul2/Fl4MLijZRF8gASoohV3M0QAMYzP7FWLnspI/q+ckZLdj9LjB/65VROICqSX6Uj7RKSa0Jnu0VPJIsqqvgrK0bew8MI3Gs2PyEhKj4sJixMwA9pFG8/RCf8VuCthoiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789993428; c=relaxed/simple;
	bh=KelE4SWm1+HYl0DpOC+bCl0jk0qcaELIIMi1khMiueE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VUIo4s9BBR4Gyw+bXSOZRa7tdeNXIFCDS3ktp3i61FD9+XwX40mmBd8xOuBxsA2IYWAt44z7e5lUj4z07kVz3YyklXwxzTrAl4F7FqS8iyoLx+GOcqXZIFTGP6Za15Y+LzF1On6hfsvDIwWzM5X3859eOsL+viqHBQoG9Yb1sfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mCgPbx6w; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mCgPbx6w"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a605844571so3465733a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 05:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789993425; x=1790598225; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EF+sKWuB3CWbGRd7nfbQrjAa992ig3a8RDVONCAqUWU=;
        b=mCgPbx6we7NYaWk5pZs/ewxGcndbQRWXDBQ4GRUZlYPBT1otTltQEbwWSrQh7Fo+9F
         AEu/twEsbZajkN7d4fuLkKYKoAbz83+UiYym4G+Dv6EU2svA4R8V93BKIL86WDaI7fck
         cCyTsGzDCwotzF/AqhMNnL5MNpKjmU+g0rvJfeyVWWKnkKvBzzeDzKCYTXyOeVotIjTR
         1VGKu9Gf16veb00EoUQ40bOsjrktGwG1xa2SO04U54RIyp6UZ2eNHEWlfjwoaYoS3LmK
         XbD99Eddl8mxhOGJrw/F9QK7Ye2xT5lLTDBCQN7nxLbl6KW9TNJTGOFLa88wfhzyc+4F
         haBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789993425; x=1790598225;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EF+sKWuB3CWbGRd7nfbQrjAa992ig3a8RDVONCAqUWU=;
        b=PcIroRAeFetKePRwaoj9suMMmPg83KqXpvWs4Nwfwgt9uWTHehpYOIrKmUn33serFn
         wphF+BdnGy/WGhzEHxl0Yq3kpJEav9fEAyF5ogJGMhzQu64b4pjZBFWq3I9GhRec4xG0
         5Ck2D4RaJWxgVMBnXGQC7VS9SBIXEFLV47e8pNu36ANykqpgzU3p+1RFOZFT92lDZeYn
         RnG4uuUl4Lrc9w/4ZgYoRRbQIPHEyVITDtuxaoLS26awu/3ZuLS7dBDFzwjJ3VLfoQWn
         UknVXaOyubRWO8AdPGWzCLYxuohja0AePNl7IXThFmz9O3Cuw3QflELicQswSot1Gtad
         p0hw==
X-Forwarded-Encrypted: i=1; AKwUvBzRG2uHDmUVn4Fhq6SFCCukGZ8o+eMTKvokarh3a8r/6dR+12Mx8nd8Kk7fLTrr8Z/g+h3F8k7XAw3ASYU=@vger.kernel.org
X-Gm-Message-State: AFuF++m/Jz42h0Fr6Zxd0mpfMg3MqfjlYn848kC3OwGaoiHYxHbZJbv0
	rqcN2pWXm+Xhuq1dfX4Xq/A7SUS2cgWLtmxi5mJqcfLczmgzFEIDTtHW
X-Gm-Gg: AYBFou1K+/WaFzU3Lqb4l4KDz4RnEI2xoKrIMD+UNY0uK1a1kGdpqBqGlvjkFDsipvv
	Pq/AFNrL0Nq8uLs0AFO47Y9HlpfHzcZ4mo+YgYkfgdJ2WN/xqd3j1BJaztNrnb9kkyXX4nfVWKP
	1AppETmzQNJuVSa5mUMITIDp0GUC9V+EzVecYypp8Bq0PAfVy+RFibRXLyQ6yXaz6bp1ElI/8f+
	/qhFga5x+v68tyzkOIINSmCzxNFqmvNwiPEw3zvF6DzOXx5ZhfP/SoQzP6tjIgE/XxWpD4exU9I
	tWY7lmdMoZsEmLfyVOxzZb2jT0aAvel1m8F6orvbAz+RKyyvuKT2PIcbyhpmhoQaOxxJBOWrGuM
	KOwzpp1bEe73EiT74lBNbMQ2gnEsUs4PMIO/mRxkNe8iDs2hbc7wLy2o8VLwIRlw4Ns6zRTIBTQ
	hwPwqh0+S5q9rSkrIj0X73HjRr72uEXJONb5ayS0xW3SFS2kAgLWjAE7a0RraVf0KznT4UWEbZd
	TX+Uw==
X-Received: by 2002:a05:6402:4018:b0:6aa:7fb:7696 with SMTP id 4fb4d7f45d1cf-6aa545f8024mr8446773a12.2.1789993425204;
        Mon, 21 Sep 2026 05:23:45 -0700 (PDT)
Received: from SurHub.localdomain ([196.188.112.50])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa67b5eddcsm4228761a12.0.2026.09.21.05.23.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 05:23:44 -0700 (PDT)
From: Abdifatah Suruur <suruurism@gmail.com>
To: kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: alex@shazbot.org,
	eric.auger@redhat.com,
	smostafa@google.com,
	praan@google.com,
	ioana.ciornei@nxp.com,
	nipun.gupta@amd.com,
	nikhil.agarwal@amd.com
Subject: [PATCH 3/7] vfio/cdx: prevent read-only region mappings from becoming writable
Date: Mon, 21 Sep 2026 15:23:30 +0300
Message-ID: <20260921122334.2099-4-suruurism@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260921122334.2099-1-suruurism@gmail.com>
References: <20260921122334.2099-1-suruurism@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vfio_cdx_mmap() rejects writable mappings of regions without the WRITE
flag, but leaves VM_MAYWRITE set.  Userspace can map such a region
read-only and then upgrade the mapping to writable with mprotect(),
writing to MMIO regions the device marks read-only.

Clear VM_MAYWRITE for regions without the WRITE flag, as i915 does for
its read-only objects and as fixed in drm/vc4 (CVE-2026-68445),
drm/panthor (CVE-2024-53071) and commit a5edadbae57e ("ptp: vmclock:
prevent read-only mappings from becoming writable").

Note this is defensive hardening: no in-tree cdx device currently
publishes a region without the WRITE flag.  The guard costs nothing and
keeps the mmap() interface honest if a read-only region ever appears.

Fixes: 234489ac56130 ("vfio/cdx: add support for CDX bus")
Signed-off-by: Abdifatah Suruur <suruurism@gmail.com>
---
--- a/drivers/vfio/cdx/main.c
+++ b/drivers/vfio/cdx/main.c
@@ -284,5 +284,9 @@
 	if (!(vdev->regions[index].flags & VFIO_REGION_INFO_FLAG_WRITE) &&
 	    (vma->vm_flags & VM_WRITE))
 		return -EPERM;

+	/* Prevent read-only region mappings from being upgraded with mprotect() */
+	if (!(vdev->regions[index].flags & VFIO_REGION_INFO_FLAG_WRITE))
+		vm_flags_clear(vma, VM_MAYWRITE);
+
 	return vfio_cdx_mmap_mmio(vdev->regions[index], vma);
 }
