Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794925551;
	b=3/yRkPMOw8YEt6eKQXLTr7q7MDVhsXPXwdUP3cyZ4LRvt++kq55eAljVWYCNOfhHzJvi
	 7pwGAmqyAB9FvbXODBwW/B3/YksIOTGiNGTowu1UZSFd6Qx0o3vgE4gfLTg3iTGzsyleT
	 Iyiv2uesiHd8EyjWvmQlj66Q+kXO3Vl2Ij4hk/fWJt388+h2wvm2TO/gcJEAGC6fbmcgP
	 L7n735LrqhwiNfyn0SRSzyByhIvxFOmfJ1nJ+NDFdwLd3v/e9Mb5FUMeGI4GPJX8U2YHu
	 i95nOu76RRiuWT0rMFGVSjINpx7ttuNe9IQytVlpjHQJlmTaY/jJw0F4tbx2vH9/p2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794925551;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=AK+gHSxZdcAvKZ7cQ385RlBq7MDtihQM1tWGeZNK/Ig=;
	b=oLixMBpLLZlwfd3TGQqfiTiquK/d8edym5cs5Ib9Nd/BpS6ivxgB5XdRylOV1XMnJRxQ
	 rhYQ3oSy1IhF2v259RTU8/ZX8F3raFf7438bAnySORfXskx5LH271sEKzMFuUrJxRzAyZ
	 8Z94OioZJCJ2bRKXvdeNmeSJdIYcVj9FNogbhRprjf/TyMzsClDMeBeblOZlTktvezXDM
	 ata8Gi91OkYh//vzVWiw/kpCixJ/xcLHJixP4X9u1nJY+v+5okp4U2B/fWcYCVl14Hi6n
	 Pcamhr73BUqYeMAtWIo7Q0vqykibC31rTdNBAC5pYKPTXNnf5TiMDZxRfN6Aje7Edbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f34hIFPx;
	arc=none smtp.remote-ip=209.85.161.42
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95AA3606A32F
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:25:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95AA3606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f34hIFPx
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-71ac9e15640so2423069eaf.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:25:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794925549; x=1795530349; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AK+gHSxZdcAvKZ7cQ385RlBq7MDtihQM1tWGeZNK/Ig=;
        b=f34hIFPxBpV4kXVxhr38KIhjXIBlnyKMpw4eYk9AZXIaaS75lQCG5xHvOTqlqOf72r
         DsRCS9MDKuhImz+2AUSj9K7JiuFXBU5/UsZYlBYLP3NsjzUy/G0sbdLV9x7QYLrY2E+f
         sH+tvgYXEyrPwN5v3SAj02S0TmTxrWxu8CwGd4V4etXld0HnoLYY31FNkbxsUNtJ23/D
         bHsyT5mrgw/xJt133gORKoqZRYUXP8dqnsmVr9XJ36TKUS/WLS+Bb30i7zPwj61AgD38
         yYWWAoZ4BCsljc+uBh5TRAWJmNX4tTuQfNHICNi0dbE6M/ySvDqb9e2todGULn5ol/ft
         tpnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794925549; x=1795530349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AK+gHSxZdcAvKZ7cQ385RlBq7MDtihQM1tWGeZNK/Ig=;
        b=SZwp0BsloONQ5J2u7V8UM7td8JjXWfKp1jRJgJvjEqCD3Xnwo6ZhR4YgGAKG/S4ahU
         sXSktBnxImAiMfjvijw0JcjNJvPOAtX8hSUHjpNnJLnzniSJqSqIvqn2tK3m/QzLKm9B
         43LzMjQah3PS3nNI7xRdxY+FmybX1N95tyYvdK1meXekDAbHVN/IuoiFkfVf0hRGljlH
         LwMLF8aRKLG7VXg/JnTXFJdu7a+sWPoFMr3jLpJrFRRy+3UKrtNdb4ujm8Sqw4BEBLqq
         SvWsxV6w33Mh/c5my3u65BBcojQtG+kMlqu6pKgDvppi5rQ++iWumL+vjA9MoIk/xIbY
         Oj0Q==
X-Forwarded-Encrypted: i=1; AL+hErFu9v3FMfvad9+3gvOT7cMHEUDyy5+CDoPJdBfYjkkP4HuJBydQOpK+dsYcm6n3Zq71HHOP0iZ7BbzuTIk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/3cYWl2xnhg1D9snZ+VYa5dTWsRCI6i4ZiCRRcUeVrCkBnVplM
	hBKReJDxjtuOJ8PtYBRje+Q8480kb/yPWD95SPcSxb9hWo7e7AD0D9t2
X-Gm-Gg: AYBFou3ssw7H6ftE9PWcTy+BkrXEkC3PPuO7bpvBr16kcuJIBiC03wpbq3KykdwCJj+
	wDyIafiOfE2/Js9mEdHIn01pxA6cQZNHg795HPZS0DvH51TZiV21SOWNWNoo7jRv9xszTUYH+ed
	n1FjWrzTjmgIgLzE0xNUMDXjpRiscCGE/pN6O2S3n74BnIY4SRWYhZgm01wmGJ9+jiSYi6BZC6m
	3Zuwm6/mpl1waPT2wL2TOdUsg8FAMhy7pmGHvyADtQh/pFEfHxFJVnyM7k4L5uHsAGuyVw30Ufj
	y9L0g448ca3OXWDSi7tiw1wfz7YdgUF5axGk53kLdQvdddJ0tzdnr9OwXim9mCbrMFIvKmZYQjo
	ICexilyACsXSKyK/HxcTEK9E36h0K/qz/gTx+uzvLFLswakGsf7/ofUcO9+KLTmBH2tVeA+wb1B
	f4giVZjBSlaLy8oTbNfXvYNiB/X6ZxyLlQCFqBUOmVAlqra1NzZA5hog7XKeA7lM8aSiQbaiuhv
	nrQ7JSjpur8rWI19z2R+hqSC1W1AsdUHLWRZ3vmwYcmcHQCSeO7WSyR7Z7FzN7iUg170301tkHw
	KXj3iSIT8tXFpUUiLPf50RkB2xqSJkTDuw==
X-Received: by 2002:a05:6820:2207:b0:716:bf6e:a4a5 with SMTP id 006d021491bc7-71ab52173d6mr7833605eaf.81.1794925549512;
        Tue, 17 Nov 2026 06:25:49 -0800 (PST)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71af0a8a18csm5313709eaf.4.2026.11.17.06.25.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 06:25:48 -0800 (PST)
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
Subject: [PATCHv2 3/4] powerpc/kvm-hv-pmu: Don't allocate gsm/gsb GFP_KERNEL allocations under spinlock
Date: Tue, 17 Nov 2026 19:55:19 +0530
Message-Id: <f52c0f92dacb6d9102a92aa9c6059b3edfb694da.1794924821.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1794924821.git.ritesh.list@gmail.com>
References: <cover.1794924821.git.ritesh.list@gmail.com>
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

