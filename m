Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.132
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794130428;
	b=4pf4uMnI7KdgmOCwe2gN6MB696JAYI0WPLD5UuSgj8c6bZWBVOXBez154h/5ezVuc03j
	 bTb7NnZTfa0PEf3Dnyyl4WeoDMpM+szPEjyaRwR5vV1XhQwjfu5+DDG/XbAcgAXAo+Khs
	 KMwH37uZCOOwh/DE2Ysm5+z4S7+fpn33ASYzzfYjjHAkwOQrJ1mMN49UhWoR2c5JFH7jD
	 NfVj29nV4CrgRH5k9CzqY8/CyDrjGRFauVl0aa5PI+jboiCvd+x/ypx38pWiKheL56MpV
	 BRkXMQHzo56IigyacAE+/5qJX41rMGdPLGxNvVGArTFupKUI720IkHGP+DU5V8s0Ghw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794130428;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=L1j8Lq8aH3eQS1NmaOYlRxmMWR7OBcOWfEbp3qYjkPs=;
	b=0bFH8Aah0yiHeW3EK4IubgWu4UUKQkIC6GEX8VjeHAXIoWdvG+fpmAYjx5iHIwjDzqGX
	 kM6g0QP0GM+h5k6mfNZIo1rCDMNbE62Fe3W/rCu29f2+JOfH003XG6jUMlTokHxdtWJBQ
	 t7W2rLc/qSPSD9RiiXqWtveVxvQffagosZkJ+fxeYaL7h+1vETRiSrBgsjTXIl7oWtVcR
	 edegnKhYcAlpkNOLm8l8M4a+j8YxC81iMXjypkqK8I1Uyeeo54WJbHH6sBVcVUaK0UKbv
	 1ALunGH5NpbPkVfBscvyFUQ8JyTuJNJEhhl0qUHDeypYuYp8s9BFBSwbHps1uWjM+iQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RP9z165K;
	arc=none smtp.remote-ip=74.125.227.132
Received: from mail-pj2-f4.google.com (mail-pj2-f4.google.com [74.125.227.132])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A2CC606A320
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 09:33:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A2CC606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RP9z165K
Received: by mail-pj2-f4.google.com with SMTP id d9443c01a7336-2e96b8bfb43so1495995ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 01:33:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794130427; x=1794735227; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=L1j8Lq8aH3eQS1NmaOYlRxmMWR7OBcOWfEbp3qYjkPs=;
        b=RP9z165KEp+5MwPPHpTSYj+QoMN/W5Amb8JZDE8BDIdWdwVJ+JgeDnYtlBp+2NyMM2
         dLJj9JcsLedjiWVMfim4M0hzOlwK2AiVSBKyf0wTAimcq0vbIPkpl1Vi22kgV/H4M2u+
         0mjpaxWA8ngIS6A88jwH+YAu2kvjYcoY/oxDx01pnsOVCl32UX1QMcLQ4HC15BWlL6m8
         DUx33dH2vlpP6iHPC0vgvOSBnoFcaLxeLbSBIRaHCZA4SozxjlbMTCtYhQffbQUC4Cd3
         hplthFOJaDj+X9a/9Hxr4WgXxtYLK7xoM4vE7Y7l8fDV43CTV055fFLJQvEfGy6zLwZb
         kM1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794130427; x=1794735227;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=L1j8Lq8aH3eQS1NmaOYlRxmMWR7OBcOWfEbp3qYjkPs=;
        b=Mc3WdShBip/EhM7GLD0DDiDngOR0wa+yPSmlq1qrxZhLzzOncNgtTZB9KSWqRQWkar
         5pyiggdtAPUOM+PTTfnb/kKhcEJ25qj9hUN9+GLcSDYeP0zRuewgyxOqwvXwRP1W6OkS
         kbwzZNQmLhA1HMvsvSwDKOuYoTE4xmXArLgC9yo5Z5w2LiAEcFvnjBN3A+a5k6eVYQL3
         6Wl0Kekj5X9hdQvtJnVF/sMfixxC/q0IFUNR9EegXHRKaSwKFksvub0dCKoTCdX8Es9u
         r47vWxCj1uVF8seU1Aa7v5b18hOWCdS3aPqkRmwWc7iZtYTLjRTTeO8BRNt/OWl4ZabA
         suiw==
X-Forwarded-Encrypted: i=1; AL+hErHb3/rXORIAWt7XnFDRoAZEVIKkDMQbGb4ifA2Gsi4AWV2YvXSVSTi5VslK4y0+r5tFnBerv4A1f9mAQk8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/biol8AaYZiThUujaT3bcWOXNSmOAK4topO53sTq5PP2VdtQWU
	ArE+LJBmgngUEjwZ3fi+ymqrCuU14iKHy3Ap7miwLYzHpONIVBvLSM6N4m3EvdYsmNjUAf/X
X-Gm-Gg: AYBFou2XPpPlfETRSdS6syYaDvE+ZGRKnPH1DV8of4hysGZZ7iW0pieu38KJUvVHSJt
	gceHr74bxzFbxcT6ggBXpQXsqVRXRHEaRNu2UoAiMuQy7ECqBdhaCGgPVDH00bZ1Zo63i9KV8Wh
	jaYhmXN/Nn7IKjerZ0IR5fPs8SCU8+dsWUnPhySKqvehGcOXX6VBRon4eUMcgOijjNYsdZwsSN3
	jSmDzDJw59BIuyUom8B2hxvDw9uGYTdV4KBNzmoQDcTZMV887thpPSWA8C+AjJi2jPuudCKiRjd
	ezuYZDnGTvDH3a8gS0ouc8n84sf0NNkPpLtyX7XK6PJZQjMSiqQ0b9/8LOyy0pncvKxiuguTc8f
	v9FVwAJw+V0/cwM8VnM4CjfqsaQehph/w4DETE0LVi/k8S+lHowtTA7NpB90ggxUQIZMym2GnOH
	KxOCBypL4R5bwJhAdTTUxDGcJ1vh9jGSPW8rqhAtHL6hpjFugDZ3C3WeHkFyCHh8A1F1ThNT029
	MSDehF/MBa2r724jw3tTgG9HRCDovN4hQLgz/sxAiSfo3v77OqGPfEmhBcX99B6VC13LED8Yqv5
	6p13DO9+Juo4N2t00CIyDGB3qkEA43R6c18B1tONYO4HnzWMN2vcyWc+I9KS
X-Received: by 2002:a05:6a21:485:b0:3de:71c4:a228 with SMTP id adf61e73a8af0-3eed232050bmr1065043637.15.1794130426673;
        Sun, 08 Nov 2026 01:33:46 -0800 (PST)
Received: from [192.168.50.20] ([50.7.253.42])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb969314a5sm558346a12.17.2026.11.08.01.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 01:33:46 -0800 (PST)
From: Aveline Noir <jm5905938@gmail.com>
Date: Sun, 08 Nov 2026 20:15:39 +1100
Subject: [PATCH] drm/amdkfd: preserve the byte address when removing retry
 faults
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
Message-Id: <20261108-kfd-fault-filter-address-20261108-v1-1-ef13f9dd24e4@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/z2N3QrCMAxGX0VybWAtMn9eRbxI19RFZyfJNoSxd
 3dV2OX5+DhnBmMVNrjsZlCexKTPK7j9DpqW8p1R4srgK187V53wmSImGrsBk3QDK1KMyma4PQ6
 pOtfJB0+OYPW8lZN8fo3r7c82hgc3QxGXRyBjDEq5actUEja9sMydZEZW7XUrHGFZvmGsM4y4A
 AAA
X-Change-ID: 20261108-kfd-fault-filter-address-20261108-4f096f2b2a1a
To: Felix Kuehling <Felix.Kuehling@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: David Airlie <airlied@gmail.com>, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, honghuan@amd.com, honglei1.huang@amd.com, 
 linux-kernel@vger.kernel.org, 
 Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>, 
 Natalie Vock <nat@pixelcluster.dev>, Philip Yang <Philip.Yang@amd.com>, 
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, 
 Prike Liang <Prike.Liang@amd.com>, psirt@amd.com, sashiko-bot@kernel.org, 
 sashiko-reviews@lists.linux.dev, Simona Vetter <simona@ffwll.ch>, 
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>, 
 Sunil Khatri <sunil.khatri@amd.com>, 
 =?utf-8?q?Timur_Krist=C3=B3f?= <timur.kristof@gmail.com>
X-Mailer: b4 0.16.0

svm_range_restore_pages() receives a CPU page number, but passes it
unchanged to amdgpu_gmc_filter_faults_remove() when recovery is deferred
or returns -EAGAIN. The software fault filter uses a byte address and
PASID as its key, so this can leave the fault filtered until the entry
ages out.

Pass the original byte address to svm_range_restore_pages() and derive
the CPU page number locally for range operations. Use the original
address for both filter removals. This also preserves the GPU subpage
offset when CPU pages are larger than the 4 KiB GPU page size.

Fixes: b3dc91f97317 ("drm/amdkfd: enable subsequent retry fault")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/r/sashiko-outbox-203586@kernel.org
Signed-off-by: Aveline Noir <jm5905938@gmail.com>
---
No testing on AMD hardware. Any test will be appreciated.
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c   | 7 ++++---
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h   | 4 ++--
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index c41e9c0916b7..86ef849097fa 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -3092,7 +3092,7 @@ bool amdgpu_vm_handle_fault(struct amdgpu_device *adev, u32 pasid,
 		drm_exec_fini(&exec);
 
 		if (!svm_range_restore_pages(adev, pasid, vmid,
-					     node_id, addr >> PAGE_SHIFT, ts, write_fault))
+					     node_id, addr, ts, write_fault))
 			return true;
 
 		/* Re-acquire the VM lock, could be that the VM was freed in between. */
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index 79455e23a030..c85d6bb73629 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -3130,8 +3130,9 @@ svm_fault_allowed(struct vm_area_struct *vma, bool write_fault)
 int
 svm_range_restore_pages(struct amdgpu_device *adev, unsigned int pasid,
 			uint32_t vmid, uint32_t node_id,
-			uint64_t addr, uint64_t ts, bool write_fault)
+			uint64_t fault_addr, uint64_t ts, bool write_fault)
 {
+	uint64_t addr = fault_addr >> PAGE_SHIFT;
 	unsigned long start, last, size;
 	struct mm_struct *mm = NULL;
 	struct svm_range_list *svms;
@@ -3249,7 +3250,7 @@ svm_range_restore_pages(struct amdgpu_device *adev, unsigned int pasid,
 	mutex_lock(&prange->migrate_mutex);
 
 	if (svm_range_skip_recover(prange)) {
-		amdgpu_gmc_filter_faults_remove(node->adev, addr, pasid);
+		amdgpu_gmc_filter_faults_remove(node->adev, fault_addr, pasid);
 		r = 0;
 		goto out_unlock_range;
 	}
@@ -3353,7 +3354,7 @@ svm_range_restore_pages(struct amdgpu_device *adev, unsigned int pasid,
 
 	if (r == -EAGAIN) {
 		pr_debug("recover vm fault later\n");
-		amdgpu_gmc_filter_faults_remove(node->adev, addr, pasid);
+		amdgpu_gmc_filter_faults_remove(node->adev, fault_addr, pasid);
 		r = 0;
 	}
 	return r;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
index c7d7adae4476..38744e716f74 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
@@ -178,7 +178,7 @@ int svm_range_vram_node_new(struct kfd_node *node, struct svm_range *prange,
 			    bool clear);
 void svm_range_vram_node_free(struct svm_range *prange);
 int svm_range_restore_pages(struct amdgpu_device *adev, unsigned int pasid,
-			    uint32_t vmid, uint32_t node_id, uint64_t addr, uint64_t ts,
+			    uint32_t vmid, uint32_t node_id, uint64_t fault_addr, uint64_t ts,
 			    bool write_fault);
 int svm_range_evict_svm_bo(struct amdgpu_bo *bo);
 
@@ -230,7 +230,7 @@ static inline void svm_range_list_fini(struct kfd_process *p)
 static inline int svm_range_restore_pages(struct amdgpu_device *adev,
 					  unsigned int pasid,
 					  uint32_t client_id, uint32_t node_id,
-					  uint64_t addr, uint64_t ts, bool write_fault)
+					  uint64_t fault_addr, uint64_t ts, bool write_fault)
 {
 	return -EFAULT;
 }

---
base-commit: 403b3d68346d7ba25f474f0686ad1d05feb65b7c
change-id: 20261108-kfd-fault-filter-address-20261108-4f096f2b2a1a

Best regards,
--  
Aveline Noir <jm5905938@gmail.com>

