Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794361976;
	b=a36ZxvuaH30ndRnmTJ38pjUYXzm6TCT3KADTMae+8k2tTH78t5oLxQmO/xHUllrNwEL0
	 f7ZRkuu24tshvKUP+0Mg7l5LleOvXT6Mki8czWTIGa7VUDHIwp5nh2xMs9VMRQQqOwit+
	 V602Anm5cRtQHU9TaX+42ird9won6DZPMzIn19CY7kvErZtzDjvD53FHEuOxh0omdIbgS
	 e6tX8k5avYgLzkMrtuNi43HYoDBAwHj4DvHTEd1EMusikiLdDOhVU28WqFEmvnrTcIGB1
	 a9G3q6WCFGJ/nQwWCbX3Hy00l1OvYlhIG4n6dsRco27BEfaW2fCs4Z9IYga5p5TPNgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794361976;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Q6iGpR0ttPLpv4STp203ACG8keNkli3PVAv8aRaxUU4=;
	b=z/UBIosnJKMROKPjuZfvRyMYAV/EaSz+o64kmxPGO/9DILmgfHK6/jNzuZrSSVLmOTYI
	 NrQxA7zRKSiZw4fZQq/aPf3GyCGDD9mVmK3v0naTMkJABmgsdDbhqKlj/jF2/8WOncAIY
	 bL39JBztbMEhM69eh1nzRWViu30+6Q+ofmWJBPQ/hGFmPL4R8nVZqJv7grmh4L3RKNq/n
	 31twsW9Q+7S9AoatMBMffnM+N5yx+SnFJkaTZuSJRSNbLXRqcOarvWsfCNTjfSITVxZ1B
	 ZLOdkYi+Z0x1dEUfvccv/vziJpRLg8qips4VMVYooeksG/zMvU+oBKtKaEp1vY3JByA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JtEQHw3p;
	arc=none smtp.remote-ip=209.85.160.173
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46894606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 01:52:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46894606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JtEQHw3p
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-5363c8de563so27431461cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:52:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794361975; x=1794966775; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q6iGpR0ttPLpv4STp203ACG8keNkli3PVAv8aRaxUU4=;
        b=JtEQHw3pW2WsY7juzU7J2fzkunxnMqcvy7IEVFAr2lmhrrHc3Hw3Ci6REPiRdOo26J
         19E7TKf3fgaskL1yinCaiVcU8fvVwmazg+IVCn0OxaijmP5vLgHcnoYTIH45fzcK6+rl
         4aOftR7GLcNrHpPP5FG9O7nV1WZjFRVSgIUGcvcS/GYWl0N2GGmmgr1lluP5QEZaM7nX
         AntstIcW8LHe77myR0bu695jIp7ScXYPc08WDscpcaqARG8fL7ggBL6NyEqURU2BLFrv
         0pDni6C5NdXfVT1hvBbRh1Tof71NCt8EPB4b8ZBMlBP/hZ14Ygk+7J81ujOhbYxi9RQt
         /Zrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794361975; x=1794966775;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q6iGpR0ttPLpv4STp203ACG8keNkli3PVAv8aRaxUU4=;
        b=Ntt4LwqJ0iGl/y6t4CxNOxiiv3O+rmiod894VkOw1B02gKErVMUSLS8rUMKr3dOc0J
         Hksqs44IIhUhPFZxC6pcKmrN+8FrdbRPTehPTwtizUkJEbOUrcrb8VgWRPbzJ7Vmluvj
         zoBiOF2dYJ88iB7qJyIMEsHHP2RoGet6A1yIPgcDkJm60M7G8b66sl23xPQVsFdIZsvO
         cdI3RpBBDwJHgIL058cAFjtS4F0O0bzmpW7D2yY4pw2gowRk/x8keYb+Cr5ZEy0DWiR0
         AquFqKpYiF1lhRx9F7cM1JVgQ2FcnvsvbAzTgXiSeaBSY6M4Y7SK8ctWbS7gd2ff2W47
         RVjg==
X-Forwarded-Encrypted: i=1; AL+hErHg/Fh9SokX4VD8gFTBpz15yWo0g4xAGv3CVDsYabqmXchUujdlJFIe5X9NmNkuajhFKjSFnzLpWDPgfIg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9VI0+lYpikDZi26KiKfzn75yhyqg4ht3R0zumeospls15jDiFq
	QVfDCRAkRgVQk/RtKojU/iqSqNSwWhFtPvBEFn5dOivo2Ww8gaBjOAb/
X-Gm-Gg: AYBFou0GrkYiwEtNzevV8PNkFc1M+462c7FYCMpNWvS2sYPnbVQceoETu8exBmt0dD4
	aNH3UXTkGQ+2YXN9OYt2Qf/cxisoWi3rf8KQg7hnL7KB+kv8smMiyuKgndtXSFKuxnJA0GMnM5Q
	P+3tEDoTnbYOYHX1W8MiSo+ifcub+I6aTKMrdEPoRLrSSNA9fN7kY6DH6sIxR512yC3eCDYfu5s
	xBGnoj7YkDUUziFsLZrHXS7KS8K034GaqEMxeh7ISQtiMEVb9+k0/xFwwkFUhMyyO8ibmSvPQa7
	p0ZbgDeBc+sF8DpQEiyYt4L8HvV2ep82AaRBoxj+ukEVqmM2n9mdBRQ+B5C6yub8kvwvmYk7u7F
	KdiiUqGQhi2VG8EzV4EcPk6Fm+oUc64Xol7NX4XzoLNN/nrYlD2UKjUaDzgRbLrLWW4B/4qM7XH
	lKW8Kzw8V1Hfwle/0NGGZp9knjK2/7WKz6BY+iwV5bX3NRqbcGoNW/A3oPvtN3Fsft/SU5DQUAO
	8r5OmJAWgfp7t0dIMh5HLUValhOJmdMZ5UmmoaHCHn72/ALqYIYfk3lD24vX/A1c6oO1IX8LJt2
	8gzC2gCZ1elLRKSJBaS3qT0S+OC84xMkctM6u0wVDevWufIs4t7R3Q==
X-Received: by 2002:a05:622a:4014:b0:535:8509:3138 with SMTP id d75a77b69052e-556bd706ea1mr12927461cf.11.1794361975094;
        Tue, 10 Nov 2026 17:52:55 -0800 (PST)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e7d10c4sm361591285a.32.2026.11.10.17.52.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 17:52:54 -0800 (PST)
From: Yuho Choi <oss.patchbox@gmail.com>
To: Fei Li <fei1.li@intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shuo Liu <shuo.a.liu@intel.com>,
	linux-kernel@vger.kernel.org,
	Yuho Choi <oss.patchbox@gmail.com>
Subject: [PATCH v1] virt: acrn: Don't free a VM the hypervisor refused to destroy
Date: Tue, 10 Nov 2026 20:51:46 -0500
Message-ID: <20261111015250.1037116-2-oss.patchbox@gmail.com>
X-Mailer: git-send-email 2.43.0
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

acrn_dev_release() calls acrn_vm_destroy() and then frees the VM
whether or not it was destroyed.

Since commit 4c4c1257b844 ("virt: acrn: Do hcall_destroy_vm() before
resource release"), acrn_vm_destroy() returns early when
hcall_destroy_vm() fails, so that the VM can be destroyed again later.
The VM then stays on acrn_vm_list, and its ioreq clients and irqfds
still point to it. That commit names a real-time VM as a case where the
hypervisor refuses, since it can keep running without the Service VM.
The hypervisor also only destroys a paused VM, so the same happens when
the device model exits without pausing the VM.

Once the VM is freed, ioreq_dispatcher() still walks acrn_vm_list on
the next I/O request notification and dereferences the freed VM.

Leak the VM instead when it could not be destroyed.

Fixes: 4c4c1257b844 ("virt: acrn: Do hcall_destroy_vm() before resource release")
Signed-off-by: Yuho Choi <oss.patchbox@gmail.com>
---
Compile-tested only (x86_64 defconfig with ACRN_HSM, W=1); I have no
ACRN setup to test it on.

 drivers/virt/acrn/hsm.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/virt/acrn/hsm.c b/drivers/virt/acrn/hsm.c
index f170ff4617fdd..8403859e0c868 100644
--- a/drivers/virt/acrn/hsm.c
+++ b/drivers/virt/acrn/hsm.c
@@ -427,8 +427,13 @@ static int acrn_dev_release(struct inode *inode, struct file *filp)
 {
 	struct acrn_vm *vm = filp->private_data;
 
-	acrn_vm_destroy(vm);
-	kfree(vm);
+	/*
+	 * If the hypervisor refused to destroy the VM, it is still on
+	 * acrn_vm_list and its ioreq clients and irqfds still use it, so
+	 * leak it.
+	 */
+	if (!acrn_vm_destroy(vm))
+		kfree(vm);
 	return 0;
 }
 

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.43.0

