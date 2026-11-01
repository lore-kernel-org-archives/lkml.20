Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793544428;
	b=G9R+oGVhEA1vYs6Gx2YcjmvywXjVi2WOmEpU1UowJobm4iqeKuY/zg5fqFgEKYv2JBzG
	 8aXa+C0dvSImawOEe+JY+oxAyQl9eF+CZo1gAh1QGaj1AdOV39GnGuYEo/zsxw5HgW4bu
	 UGqQt/rlc5cIVDgNRYt6f3TL2ZLj6LpRxTHmdUQK/VIAEcIK99bMvytKMjJoTPIN2g9LI
	 VtGfpSN5vuYQqY6/TbA+VURlVsg6n14RWqvAX4CMs4oFGSnvekBuC077Lfl0ilmi9+nyf
	 7pO0SN8KqXk5F6MVvDRR8HbFpYf9hdaf2gU8gtYx1oFxwG/f3XTSYE2fTulgjHj2DAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793544428;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FazxrWHX2Tn7PurYTqREXzQh0pHc6RTMEU3g/b7/CQI=;
	b=LWgIN3YfSKp4SRFVCvLGIZ690DpiqJb9fMIKrEkqVncSWuEpfG4ztRWDQtWUcx3Ehcge
	 WnX+eoyYWI7IAb5cBIQQK3yBUteuMxrMe6DRz9g/7h/7A9DROUyzXqctYVSWV22sGXWIO
	 3L7IOD1HJNEVBIlI30plIE9IWJ2kT1tM5xg/B0+yDyHXOvrqpjgZQ37u0/wkAOasC8zb1
	 o+jO4VbEcTW67aHGIcoe+t3slBnSvj1BQy2HEHiGYgRos64etB1oxAk/X7B0VdrPlHZbI
	 +4WQp8KLEu5gB1PvVox23GsonaAEKICYBQxsjhyoy9+Wj201wEr7vxJ+sCCzWAKdnjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FUUrGbO+;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D6B606A326
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 14:47:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4D6B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FUUrGbO+
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso3854050eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 06:47:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793544427; x=1794149227; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FazxrWHX2Tn7PurYTqREXzQh0pHc6RTMEU3g/b7/CQI=;
        b=FUUrGbO+xq4aOYa6yPI9vfJDuuFU/Co51nOHhg/j/X53Bt5FC+rWBDxmj3UZQJr8fu
         6cHq2W7LKnrZMW7wxBWA7/X9eGGHsW9yGdvUjs5S/Bs6QxlgWHsm7BTKCdmphkXw4OJJ
         MhtvF7t6Gwbxo5ZcGSD6Iyx4WaNF7ATJvINapEeWncZR9SAnq7VIrv4yxBwb9+QbDmR1
         3fGslmiZjRKruHQdcur1cV6O61h0pFKw71i3BVcgHtkSgdq8rWfdzO2zsldnKRmIbHIk
         IzcFriyh8EQU206CBWfSKyaIAY9SFoGPj4Z1VgQLWn9gkVzgVJIpSlY1ogZxJPNWv4ET
         QPzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793544427; x=1794149227;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FazxrWHX2Tn7PurYTqREXzQh0pHc6RTMEU3g/b7/CQI=;
        b=hPL947drUe7igUEPoaBZF8+u/5/UivA6Idy5j3xlryV/OjzQgX+lLsyjYCqWCO1k/A
         nwavcylkvkzM8WEeuzlkJiYvl54dQIg+TZcrmAspgx2yzVCY+zHABj2heTU9TzKpumWA
         fbvA+GxnYunGIfSw+untXhDi3FVb/m9oqG5u03+efPexssjXiQ3fxA3ok0pa6+NuvQX2
         1P6r43GFkHz5r2xI2jThvQtmRZVojL2SB3nUqkCMqk9LZp+lZ7gI4Rl/okLZ3sPcGRN+
         W3Y0mUzLdDvHKw0F4HEMh8gM3c8FqL2gopIlOCI8OceuvXy0n6+D8lIb2SvfzL8GRwTk
         FVbw==
X-Forwarded-Encrypted: i=1; AKwUvBxoCM0YljRfVUU3PXKl6HqDMdzUn2mXOO6BdOnvknSEa6I6hRxzZI5SLWr1wMLB52+iR5qqr9xSK6ZnmEQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8L5BfDP3z7CHog32Di8WGpsG6rDfvChOC4n5Wg2JG20AeK5FhE
	3mxk4HRfpISGDm+zD8i5U4JM1ldab17S9xZWL65OjFjezAz3noPGW7cd
X-Gm-Gg: AYBFou1tVklKXGi5uyKEveRzKWzf/lC6AdaHXay++aFb1R1gZTL/Dr2koypDsh9SM0p
	gb4GLXgMbJ+R6s9N53PmpaQPcj19QxF1aJz3dYUUNnqHvC93idXix+FTmUz2QuCyamL6npnuM/2
	SefHyDPXap8HaefzO0RLAbh0hB3ZwPT2zHk0YZo/lV9uVDAUbDI490dHAJMfFhvBLb88Btn4v+O
	C7f+5S4fhIahVeSAOCylvRwsjgeMzdNiKdUMTCiUe2jg+Q8e/Wo7kgMui+Oov2wRY0urxhcKV5q
	jp3RTr3uY7AJn8syqch2x6DhjNkIIbMA+1ygYlAvp5arJuqU6F12cR9Xy/IVIz09F6yJDiMo2BY
	LpmlpgslNCtnfOhNXHjYRr+/FGub0FxuBC/QaBzVFz90xcg9360Pib1MucOJ0STIhH1hLM2B0gD
	IOYfuTvi9cKncdZLErOCNWVOAXiv0ideltPnSosIwvtlxnonMoWkqFdlup0EbxronpDFXD7Zu09
	IKv9m6CTgCv6FiGLQMZKUA1hRuqW80S4BEjBgBfO4q/NV3uOnPdHB/JBhJl+SjKkK3pbW4aXfHY
	c3R34b0KiO3C6GKzo4sonfPlW6+F2boZJ6ieUg6osnMCgTEl+lafwwY=
X-Received: by 2002:a05:7301:4b10:b0:35c:85fa:5a61 with SMTP id 5a478bee46e88-36a424940d9mr12002995eec.38.1793544426610;
        Sun, 01 Nov 2026 06:47:06 -0800 (PST)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a6f7f9sm32747545eec.25.2026.11.01.06.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 06:47:05 -0800 (PST)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	linux-kernel@vger.kernel.org,
	chleroy@kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	kvm@vger.kernel.org,
	Anushree Mathur <anushree.mathur@linux.ibm.com>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [PATCHv2 4/7] KVM: PPC: Book3S HV nestedv2: cap max vcpus to PAPR limit
Date: Sun,  1 Nov 2026 20:16:29 +0530
Message-Id: <07e2642826613998b6b1ecd7acd239fbdbaba110.1793543627.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1793543627.git.ritesh.list@gmail.com>
References: <cover.1793543627.git.ritesh.list@gmail.com>
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

PAPR spec for H_GUEST_CREATE_VCPU says:

 "Only 2048 VCPUs can be created, and the specified ID must be in the range of 0
  to 2047"

However, KVM reports KVM_CAP_MAX_VCPUS as NR_CPUS and KVM_CAP_MAX_VCPU_ID as
8 * NR_CPUS. It also passes the userspace vCPU id through to the hcall unchanged.
On a nestedv2 host (KVM on PowerVM / pseries nested PAPR) built with
NR_CPUS > 2048, kvm selftest e.g. kvm_create_max_vcpus will create vCPU
2048 and fail with EINVAL when the hypervisor returns H_P3.

Following error gets reported (with a debug print added to selftest to
print failed vcpu_id number):
    ./kvm_create_max_vcpus
    Random seed: 0x6ec3f539
    KVM_CAP_MAX_VCPU_ID: 65536
    KVM_CAP_MAX_VCPUS: 8192
    Testing creating 8192 vCPUs, with IDs 0...8191.
    [   62.655458][  T302] KVM: Create Guest vcpu hcall failed, rc=-56
    [   62.655458][  T302] KVM: Create Guest vcpu hcall failed, rc=-56
    Failed KVM_CREATE_VCPU for vcpu_id 2048 with errno 22

    ==== Test Assertion Failure ====
      lib/kvm_util.c:1395: vcpu->fd >= 0
      pid=302 tid=302 errno=22 - Invalid argument
         1  0x00000000100061d3: __vm_vcpu_add at kvm_util.c:1395 (discriminator 6)
         2  0x0000000010001a6b: test_vcpu_creation at kvm_create_max_vcpus.c:32 (discriminator 3)
         3  0x000000001000160b: main at kvm_create_max_vcpus.c:59
         4  0x000000001001b713: __libc_start_call_main at libc-start.o:?
         5  0x000000001001bb47: __libc_start_main_impl at ??:?
      KVM_CREATE_VCPU failed, rc: -1 errno: 22 (Invalid argument)
    [   65.316986][  T302] KVM: TLB LPID invalidation hcall failed, rc=-2
    [   65.316986][  T302] KVM: TLB LPID invalidation hcall failed, rc=-2

Cap both extensions at 2048 when kvmhv_is_nestedv2() is set, so
userspace never requests an id the L0 cannot create. PowerNV and
nestedv1 are unchanged. The issue is only seen with nestedv2.
While at it, this also fixes the limit for KVM_CAP_NR_VCPUS.

Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/include/asm/kvm_host.h | 1 +
 arch/powerpc/kvm/powerpc.c          | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/arch/powerpc/include/asm/kvm_host.h b/arch/powerpc/include/asm/kvm_host.h
index 708a32f89776..c068cc1dd51f 100644
--- a/arch/powerpc/include/asm/kvm_host.h
+++ b/arch/powerpc/include/asm/kvm_host.h
@@ -35,6 +35,7 @@
 
 #define KVM_MAX_VCPUS		NR_CPUS
 #define KVM_MAX_VCORES		NR_CPUS
+#define KVM_MAX_VCPU_IDS_NESTEDv2	2048	/* PAPR H_GUEST_CREATE_VCPU vcpuId */
 
 #include <asm/cputhreads.h>
 
diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
index 9194cf492d1c..cf620b6534de 100644
--- a/arch/powerpc/kvm/powerpc.c
+++ b/arch/powerpc/kvm/powerpc.c
@@ -663,12 +663,18 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
 			r = min(num_present_cpus(), KVM_MAX_VCPUS);
 		else
 			r = min(num_online_cpus(), KVM_MAX_VCPUS);
+		if (kvmhv_is_nestedv2())
+			r = min(r, KVM_MAX_VCPU_IDS_NESTEDv2);
 		break;
 	case KVM_CAP_MAX_VCPUS:
 		r = KVM_MAX_VCPUS;
+		if (kvmhv_is_nestedv2())
+			r = min(r, KVM_MAX_VCPU_IDS_NESTEDv2);
 		break;
 	case KVM_CAP_MAX_VCPU_ID:
 		r = KVM_MAX_VCPU_IDS;
+		if (kvmhv_is_nestedv2())
+			r = min(r, KVM_MAX_VCPU_IDS_NESTEDv2);
 		break;
 #ifdef CONFIG_PPC_BOOK3S_64
 	case KVM_CAP_PPC_GET_SMMU_INFO:
-- 
2.39.5

