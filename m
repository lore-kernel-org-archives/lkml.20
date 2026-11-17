Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794888795;
	b=ec5NU6NTB07fElmsWY5PfExoSdQ/5wyZ2w6SWcUbll1k4zs0mJLQh2RbQh0p5X4Vhlcg
	 +IfW5MpmDj7RTQqhqsWgTEVkV5drvLxktcoB3qk3fOhQjC/nWwh3kvwuyFT8ufyqAhr/N
	 THCZg5MJZ0fUnHub79RKoUwEgu6mdCV3aAkplhIX2PFEe0id0qDCE1c+H3NyPuOOYlII8
	 Bz2mmE1g/r1rByY2+h+xFOZBCp9ULEI8aj/eI0GCH8SB3/mHxw+q0Y/HThC1YS5KbTCEs
	 D3bEmCWZDvYffrSb7dhvP7oLV4aMCpkvxh+2RYpmWuFWAoqVAOg15c143M0pqIQ07/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794888795;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=AK+gHSxZdcAvKZ7cQ385RlBq7MDtihQM1tWGeZNK/Ig=;
	b=cjiY0Vfb7YxQz0QkPcPwxLxGsPTGg0iCF5P01ckc3F/kg2CB6tjCnhu72wDcdjPVu758
	 Z1tlPzHmW1KP2t4DfX916jso2mCeppZ4Lyq96B7I7GLycco+V72RMmUwIH6klyrwbdph5
	 4jB9rUBE8Mytva8IJZmqkrmLwaYqFqmDomAkxlv/oG/Gpr6eEFNfPHXaFdDCqjgnvtI3T
	 0AcjcZvmt98ylDrPc+jItG5SpEGTu47PlY1YjYpHSk/8h0yl8gnd3013f+KtUULtRGw9R
	 yD06ti11/fDhZTRBwPn4VwuFPkTSsJf6QzummNISZKQRMEXio8tQ09SEpyjpdWuRpYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lG5AZuII;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F5CC606A329
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 04:13:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F5CC606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lG5AZuII
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1a2761c69fbso425010c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 20:13:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794888794; x=1795493594; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AK+gHSxZdcAvKZ7cQ385RlBq7MDtihQM1tWGeZNK/Ig=;
        b=lG5AZuIIJascP0svvooQZmTYuY69JAc+MnpbSEymeWQf5XhceIUDTTHQGiU/todZQZ
         itCV+tHmyjyEcTXcpWByzYtRaYH39ygujEIov8l7JKhqzr8SitKV9AHZyADR0VB9ksWR
         XdEp5b5D6hnkxeMMWOosLyTUmJXJGMo1TzwvI8SzzNxli3izP19JBn0yEsk09wwY1lSf
         F56vqXeQP/MN5qPHW6Hn1ogyjGUVvo0EqJcftZs0M69WMVP8BwjxvdrC6sbEKWONOdKL
         FwHior7IgMA9ZbJPehFyDB+MjrqvvIs4mbl7kqn0zQ9iA3/zVMfLe5khvXmGzm0XcmYV
         wKng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794888794; x=1795493594;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AK+gHSxZdcAvKZ7cQ385RlBq7MDtihQM1tWGeZNK/Ig=;
        b=KL/0pcUb9KZk1eSiSk3rFusPKpNsKul+WqATrGLSSuf1z2SM+mtXQaMD829dRa/DPI
         PuCaUcx9lbF3iHH4Vu5SDDWSqJmT2IxZ4piHnUbMSedXqe46mudPDTWl4okMJ32qep4h
         p9hTSyUB9G60F3cNi97fL47TZEzIsLNi3m8kz2kzW3Hfk09P1qsutnUmqFODMvTpQe3z
         w15z4+/lt2+ukFu+3L8Zeq48Z5EzF7552jm7/ubq7nA7QVBBtJ9CpyOEZN8d0ktKDsqj
         4eHFvpr/toDTnB7VNCx6Gjn7V/HL2dCganVmI/dXJiHFm+UEopYzbAYFu1jYCDtO24NP
         v3kg==
X-Forwarded-Encrypted: i=1; AL+hErHSiLoHlMDKtuWz/RJH2TFKfSj0e+/lzmYVlsJbckesy8zQXrlqoX3g/Ek0opUb5SHRczI45r1GKzSUAvM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+MSQZXSlMdUwLqS2mnLJTTCJobQdNcamF3QGTG8O+k+dDggHtx
	Ugqz0SzAnKNqRRZM2hBpc7uekGVUymdUQug9emsMlXJUUBCDFJAQr0t/
X-Gm-Gg: AYBFou293jOSmUKEFuiTRB9vH4Vd+vgBJblt2rBUfx0tZPNoqkwDMdQxt3bhQ5lJCln
	63zlEbMVTfMyaFf+4JV5vNJgmxTq6IJXgFxbhOYqv7Ja4z2hJkN4+FTUIXYdgDhTyPvPcq6D3Vn
	rgQeNJVQ672xEf9uuvzXbcIanYqktjC1mVmIzpF+zNkmwWVgyMdULSW2kKeI/jUcEdvT08qtU2c
	TLi90RClpH2l1CjD3nvpugqDNQuoEktBH/IbetC6j02BeJBvCEH/BvjAHTzUzIB235wB4anF0zl
	E9LaSA8SlQcXvrb53HdYObKjMnyqIPuCk23ZWOHzIUtViRvjnLJYofOGuqzX0xLCZ/Guc4r92Np
	bxge5hwXbGbx9zU/SlLe/fd07vMOVro4cMYf6VdzSTIol7E79HK7oTRehqwgvWUuL+knexYA9iR
	YCHM+G4F9xzXQeM9jFuTtK67gm6hiXHH59q4BS8/Xtc8leMzyqhk04urNHXywOYO4t6Jy+VBZKC
	9XIPcm7zjyhpSsM1Yzw62ccKClPJ5Ci/JxHjnza/9lRu2pZX8wcZ1jgvTyLyQfAZSkxC+ZfJARN
	L0OJR+kX2XEkMw+3Sa4oAqMnjs1iM/cInuz9kpTB4ZUFfEEk1XJ12Ik=
X-Received: by 2002:a05:7022:2529:b0:1b4:fa58:9d8 with SMTP id a92af1059eb24-1b5031759b2mr18176689c88.20.1794888793525;
        Mon, 16 Nov 2026 20:13:13 -0800 (PST)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031b98e5sm40433851c88.14.2026.11.16.20.13.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 20:13:12 -0800 (PST)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	linux-kernel@vger.kernel.org,
	chleroy@kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Mukesh Kumar Chaurasiya <mkchauras@gmail.com>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 2/3] powerpc/kvm-hv-pmu: Don't allocate gsm/gsb GFP_KERNEL allocations under spinlock
Date: Tue, 17 Nov 2026 09:42:52 +0530
Message-Id: <871eecaace022e3d49e5afbbeadf0b26d16f10dd.1794887659.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1794887659.git.ritesh.list@gmail.com>
References: <cover.1794887659.git.ritesh.list@gmail.com>
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

kvmppc_init_hostwide() takes lock_l0_stats with spin_lock_irqsave() and
then allocates the guest state message and buffer with GFP_KERNEL. On
a nested API v2 host with DEBUG_ATOMIC_SLEEP this warns at boot:

  BUG: sleeping function called from invalid context at include/linux/sched/mm.h:322
  in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid: 1, name: swapper/0
  preempt_count: 1, expected: 0
  RCU nest depth: 0, expected: 0
  locks held by swapper/0/1: 1, on CPU#0:
   #0: c000000004ad95b8 (lock_l0_stats){....}-{3:3}, at: kvmppc_register_pmu+0x50/0x270
  CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 7.4.0-rc2-00028-ge5a8bf3a3ee9-dirty #124 PREEMPT
  Call Trace:
   dump_stack_lvl+0xe8/0x150 (unreliable)
   __might_resched+0x190/0x30c
   __kmalloc_cache_noprof+0x4dc/0x760
   kvmppc_gsm_new+0x68/0xcc
   kvmppc_register_pmu+0xd4/0x270
   do_one_initcall+0xac/0x48c
   kernel_init_freeable+0x3cc/0x7f0
   kernel_init+0x3c/0x274
   ret_from_kernel_user_thread+0x14/0x1c

The lock is not needed for the allocation of gsm and gsb buffers.
Allocate and fill the message and buffer without the lock and only take
it to publish the two global pointers.

Fixes: f0c9c49c5067 ("powerpc/kvm-hv-pmu: Implement GSB message-ops for hostwide counters")
Cc: stable@vger.kernel.org
Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/perf/kvm-hv-pmu.c | 65 ++++++++++++++++------------------
 1 file changed, 30 insertions(+), 35 deletions(-)

diff --git a/arch/powerpc/perf/kvm-hv-pmu.c b/arch/powerpc/perf/kvm-hv-pmu.c
index aa72b96b5a8c..a58634f656e9 100644
--- a/arch/powerpc/perf/kvm-hv-pmu.c
+++ b/arch/powerpc/perf/kvm-hv-pmu.c
@@ -314,53 +314,48 @@ static struct kvmppc_gs_msg_ops gsb_ops_l0_stats = {

 static int kvmppc_init_hostwide(void)
 {
-	int rc = 0;
+	struct kvmppc_gs_msg *gsm;
+	struct kvmppc_gs_buff *gsb;
 	unsigned long flags;
+	int rc;

-	spin_lock_irqsave(&lock_l0_stats, flags);
-
-	/* already registered ? */
-	if (gsm_l0_stats) {
-		rc = 0;
-		goto out;
-	}
-
-	/* setup the Guest state message/buffer to talk to L0 */
-	gsm_l0_stats = kvmppc_gsm_new(&gsb_ops_l0_stats, &l0_stats,
-				      GSM_SEND, GFP_KERNEL);
-	if (!gsm_l0_stats) {
-		rc = -ENOMEM;
-		goto out;
-	}
+	/* allocate the Guest state message/buffer to talk to L0 */
+	gsm = kvmppc_gsm_new(&gsb_ops_l0_stats, &l0_stats, GSM_SEND,
+			     GFP_KERNEL);
+	if (!gsm)
+		return -ENOMEM;

 	/* Populate the Idents */
-	kvmppc_gsm_include(gsm_l0_stats, KVMPPC_GSID_L0_GUEST_HEAP);
-	kvmppc_gsm_include(gsm_l0_stats, KVMPPC_GSID_L0_GUEST_HEAP_MAX);
-	kvmppc_gsm_include(gsm_l0_stats, KVMPPC_GSID_L0_GUEST_PGTABLE_SIZE);
-	kvmppc_gsm_include(gsm_l0_stats, KVMPPC_GSID_L0_GUEST_PGTABLE_SIZE_MAX);
-	kvmppc_gsm_include(gsm_l0_stats, KVMPPC_GSID_L0_GUEST_PGTABLE_RECLAIM);
+	kvmppc_gsm_include(gsm, KVMPPC_GSID_L0_GUEST_HEAP);
+	kvmppc_gsm_include(gsm, KVMPPC_GSID_L0_GUEST_HEAP_MAX);
+	kvmppc_gsm_include(gsm, KVMPPC_GSID_L0_GUEST_PGTABLE_SIZE);
+	kvmppc_gsm_include(gsm, KVMPPC_GSID_L0_GUEST_PGTABLE_SIZE_MAX);
+	kvmppc_gsm_include(gsm, KVMPPC_GSID_L0_GUEST_PGTABLE_RECLAIM);

 	/* allocate GSB. Guest/Vcpu Id is ignored */
-	gsb_l0_stats = kvmppc_gsb_new(kvmppc_gsm_size(gsm_l0_stats), 0, 0,
-				      GFP_KERNEL);
-	if (!gsb_l0_stats) {
+	gsb = kvmppc_gsb_new(kvmppc_gsm_size(gsm), 0, 0, GFP_KERNEL);
+	if (!gsb) {
 		rc = -ENOMEM;
-		goto out;
+		goto free_gsm;
 	}

 	/* ask the ops to fill in the info */
-	rc = kvmppc_gsm_fill_info(gsm_l0_stats, gsb_l0_stats);
+	rc = kvmppc_gsm_fill_info(gsm, gsb);
+	if (rc)
+		goto free_gsb;

-out:
-	if (rc) {
-		if (gsm_l0_stats)
-			kvmppc_gsm_free(gsm_l0_stats);
-		if (gsb_l0_stats)
-			kvmppc_gsb_free(gsb_l0_stats);
-		gsm_l0_stats = NULL;
-		gsb_l0_stats = NULL;
-	}
+	/* setup the Guest state message/buffer to talk to L0 */
+	spin_lock_irqsave(&lock_l0_stats, flags);
+	gsm_l0_stats = gsm;
+	gsb_l0_stats = gsb;
 	spin_unlock_irqrestore(&lock_l0_stats, flags);
+
+	return 0;
+
+free_gsb:
+	kvmppc_gsb_free(gsb);
+free_gsm:
+	kvmppc_gsm_free(gsm);
 	return rc;
 }

--
2.39.5

