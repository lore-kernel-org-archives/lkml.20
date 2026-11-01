Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793546921;
	b=ataquFeEeed66pahlJar0CoymWo47KpaW7I1npHWD0ERumEgLvP6QqOOP4bMOd38e6eg
	 xVAKbtD7VsljsgFjvRldb3V+4urwarjKxRG+wpjd8MjEmmiS3lbVjb6z3yEYdsWWYF5kj
	 ZAgWC8AChO3qaS+09OySgM3BGEcupmVItZmteMmR9lYi4lQAgitAZw2iGPg0kWf/Wye4u
	 horsPsE2mhB5UkdmrvAIQZRBI6lIsCM12VJTaZ3sBsUZ9cpFh/i3rjlgkJfJ44FqboMYy
	 OmA6YG+LCuiSVmBIJHR3Q60NqWlaBk32iX+UHJfzryPVnS0U+F7y0sIpf202Ci2RelQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793546921;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FazxrWHX2Tn7PurYTqREXzQh0pHc6RTMEU3g/b7/CQI=;
	b=aOOLIv1Qq2LvVmOp+PBACtHYs2GHViyBOynAobA51iwaFwn+U/gFiSkP5r5TW4zTC9Oz
	 hihmgTcWrkfzhacKUyT4cRQjx8DVtB+EwQZXJgD+mIsBjFZl3x7fEv/99imi0lSIS8tT5
	 PoPSSrDpxR32ma4qt2SBqDxJf1E2tuNa52hz0xZwaCyP9buPBYqyLb8/7UZ6epH4az5YE
	 4XYYxIoo5TVE0Q7jtCnbHE4N4ETWPuQdJxWUnclnSNPxIJ+kvSAI+8JUSNYp0w5YUt0Jw
	 ANsA09uD3VLJbNdSiNscn/0D4WQDXWc7DeISJq7Gir560SZYNFrEunc3tptuB2GonCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qBW9a+HM;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66936606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 15:28:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66936606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qBW9a+HM
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1adbf62dd31so2180279c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 07:28:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793546919; x=1794151719; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FazxrWHX2Tn7PurYTqREXzQh0pHc6RTMEU3g/b7/CQI=;
        b=qBW9a+HMHFBCEdcvlDdr5Fp9FTU9BjJvUFlJbdChqvsPgPQ7vrRWIdttW2upYiSR5Z
         584Q1D5LAo9+zzHLyUGji+hwgfw2pK9085tg60nHm9+QshPJ9/UdwetiuIjYS4GcQU6r
         6ddZy7FH17QRh0SvfSIj+Qe6XM7tKZJDAw/Zv3wpi6wRLeW9vVWwTFPMiYh8Sq5Vz3+z
         fK3nEKuICgkej4LfChbnMGdeCQkDt+GTTgy2mIc3MbTV3McW2Dzgfb53fMxR9m7nGuWD
         4nX7f0UO9EZ3e372UemI/xw1xgtA2TfyAYCd6omZPL1jhuseT3S/4lpwpQE1rojIAOWG
         +1eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793546919; x=1794151719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FazxrWHX2Tn7PurYTqREXzQh0pHc6RTMEU3g/b7/CQI=;
        b=guIjxAsjwPlKYFj49+CBh/qsKHFVC37SGGk4TrrNCEC3ZWwym7t5uyc3laJ67V5YyT
         qRdqIgcx/0tsSN4zeKRMg7qfSgEd4vRI7H3rWOzH++VskczyS9utLAflSFEFQ60ClZPT
         G+Z+lMhluLI45QZQMgrGL2ZtO+cJ5aAI2IXpF5k1aOJBClLS9sph2YNfjw4JoM4dsCs4
         DZrlDdz4EjNEU/FVysCK+u8hS2MmoKzgEVMLAGaDXYiXbf5A7It/FAFIw5JxIV4MeUak
         DoER6o+rLW4HyRDK/sMu+xbVzb9zu5qWxlfq+h+8/6rqHqRpgPQEAa64zASELwCwMleQ
         zfdA==
X-Forwarded-Encrypted: i=1; AKwUvBxmTvuNYuqnOkMUZSuZJ9r5ABH/ANv61+7AKIrh6G5wyf7Os88wTJMGEurPeuC+tS/aydXZeAyuv27J9FA=@vger.kernel.org
X-Gm-Message-State: AFq9FYL1RpqPUfru+rvwYhcPkbmPDVUyHmIDKpI9V8j+wU7GObxlre/P
	01LV0ytYHkjbDLxM+anIlyipO4duoAID+Bm5VpWftR//Ykc/D9IyngW7
X-Gm-Gg: AYBFou1dGTYXEf+D98sWViDKH1r3TmtbGVCV6sIbnyh0y3HQHvJASnbgRkkLvVyUlVz
	iSuvCs7YXPaWbIsok9qUZL1yFFe3fIRAQh8Cs5BcrEtJ+QYZXUSUALF/7FGUUjX7BIkZ5ZZNBb8
	mMf3u6drAj020HhPsd/cDrt1Yh/wUKO1OD/dJdhc5XYpewxbwVDTTue7FRtDmFq+yVMvJ/bVvD2
	a5P9JTaZy0jMIiQgLn+yJrZ3eX8cfJBqRv8h/utREQxz1Sdd98ceB7NhZoQlpmqm7qlH+0cl5Pz
	Hz1dk6nTU98vAt1ZeJheOtWrTTxo1mmL5ocCsmDFUZXyFHMxPAfakBPrltaEMkvBiFteMTwGbjf
	mHqLuBvhLJ/wuph63T+hZPageNjQWuG0AyEW58FcCzJKt70NPRZEQ7ys0zcoEqrhZ0jMex3j6yV
	hQRyzXhJkU/Th+dm2D1vQWfv49klibqyRhS/W1oLKR1cpdLaty8W9/T0dDIHNPWarKaXu4hxWyl
	XQ9MJAX4s2mzyzPZGVUpbOuz3QHhnu3sLfs1X966MAd/lcTPNJ1/t8FQzdWPYn5ORYnU4gKwuBa
	zguZANbU5E8fdNOdUcYHvcqZhK4xW29Onco=
X-Received: by 2002:a05:701b:4193:10b0:15a:4155:3d9d with SMTP id a92af1059eb24-1ac5da76f61mr11637801c88.31.1793546919481;
        Sun, 01 Nov 2026 07:28:39 -0800 (PST)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac18458e07sm24862665c88.8.2026.11.01.07.28.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 07:28:38 -0800 (PST)
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
Subject: [PATCHv3 4/7] KVM: PPC: Book3S HV nestedv2: cap max vcpus to PAPR limit
Date: Sun,  1 Nov 2026 20:58:09 +0530
Message-Id: <f9c26aefa325bb4b6a3222718d6d605aa4993dff.1793546707.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1793546707.git.ritesh.list@gmail.com>
References: <cover.1793546707.git.ritesh.list@gmail.com>
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

