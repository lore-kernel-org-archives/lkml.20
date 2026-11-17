Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794936577;
	b=T+CkgE9LfKfNOKKVZRWp0niANo1iMGATAepwdsYWCKUsRY0bY3/BscjhIJIrZ1lIivoG
	 NxDk+7vQxyC1cGm7daBTLxNDARVMvnMAIwotizXyCnWUqN5nD/FcSqNCNgALM/36Gn5tG
	 8kjcIWSAq4CtgwP35X0bHXgfk277fsTN+tCoG9upLq+Pu7+xHd772/TQws5/ORoc7H44k
	 gqeyoGCop5pnDX5uJ/vkXL9qr5Vyq2uLCGU3AW+aoOKpkPKUwButuYF+MX+pOkxUkXa3L
	 wYKSRE+ldyIMSERPJKz/Xbhaa6PuyMY33bGm3FUKIGdBoJdBY6z5jCYKU1MVzxiTc0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794936577;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=JHWpGOTp8ITv5cctf6TSThxhxXqYa8XzuutCrYWNpkQ=;
	b=W20DJaWKwXALAtqifUAIu9tp9UVtIxGALgalkEDzOXNspkoaMJ9NeMxxaLo9sEM20w5H
	 A/ZeyWAGijoumnIMKXpoXcNXhXTT7wGXC7fOmSI81Ut0gVpVZomeKih5I4Gsy5Q8ffd8G
	 FsXYicxIPzJHtMPDYLME/H6449NJ1gwIJ93YzfKbfWjhBuDo+TN3wmLJSpSBLr2ApDdO8
	 EW/LoSfDM/yzYZ/Lu6OpruLyPM6hukmBFTyNexzRMvPEVD9skIRHFK1Lh/x3ijvv1mle3
	 T/LdLFFbSnlbbf0BDFH6fomY/CrsDZ5LNq20Z70jntfXp3vfPnV+eSJMQDcmYIspfWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QFAlhZaf;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 064C0606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 17:29:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 064C0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QFAlhZaf
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3282db206d3so211758eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:29:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794936576; x=1795541376; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JHWpGOTp8ITv5cctf6TSThxhxXqYa8XzuutCrYWNpkQ=;
        b=QFAlhZaf6mH704TXlWZwc+wJGhbOYi3lFSuYjnaYSHXTWKToweJxWHp30TN9w8AeyP
         UyfCGfZF5sqzRXYHprcaxgpOKn6Whq8uSMgLz8hBchchgIBKoMgIVr0/yISUg0vZMj5X
         uWtA04TGPGhkylR1HxZmQGEn0Vb5tm7wKFEQkCmH8kaPQ1hRs+b4yj9sQnX2HftYGG79
         CSl7d4LctBXOdtxKePJRzN9vKaUvDAy2d+B0ROcDfzYJAeG1IwXLw9+QdiIlDgDqv8D6
         AbRfr9fhsDQRM4/HHGD88Sn5UjVIMW9yhbQzKXubit2YjbXU2dX/wmSk6TBGO+8P6HvY
         K2Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794936576; x=1795541376;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JHWpGOTp8ITv5cctf6TSThxhxXqYa8XzuutCrYWNpkQ=;
        b=gVC4kGajBP29O+3nGWITuDJsqg3J6srNsLCpZOrfE8TaHMD3bTbdvW10u9cnASQiUo
         rhvCg+iv7N734Tq/ASCA+ycU/3UOqhJLtBrgBBdz73aqH8mcD+JbATXnddwUfY337k3Z
         JfUzfHvlJw9743YyjxKGgYkrcSH+/dh9YxAVcjXr9LI3NX6VQQOXkGPAku0F32KNFwM5
         ngbIMQZSAIk2y1lKQZzE3lbmxHYCS3C3hgZjxMbdnbAfo6qrNmJZnfS5FMlgU1uzxHlm
         LetZrRCKyfFA2tCUfEa71F/EncdG+oS7GM2gevpXqlsZFwtcJhsmiVRSpKaMJc0LLL3V
         5Wvg==
X-Gm-Message-State: APuU4Z/YQ3u2TjL0R7IJ3EKYKlExuiBm9A6VSfsv1JVo5CripXvQHl64
	a+6y+pESq6sPEfPNRttCEDgsUL4LUy4INunslveNO1ik7qBiKoZkpsUl
X-Gm-Gg: AYBFou1TRL62FiReRRr9JXYNXELWllIFHJIcoZIzAZbBF+XNsZ7WsQCddBCin3qnKAi
	HSxNP20RwW0UG2eciVtsSIshl9KhXOM2kpbEsa19Ov7I1BOeBRMDcswG1i0vapnKAcl8OWLVS8e
	CtE32ynbEOEDGDvr8WHSaNfLBW0ia+7mhxeJ+RpF8Z3gs/ywWS8PCt/4Ib3UKICSdXwA549MRsS
	A1Ioh2dZp74rp7Xo6tteZ89AnNpqCiUTPzIfEVW3ADpOfw4t8VQ7wLKQf3AueMfESNOfc5I3poz
	p1XdaPA22PwoJlvJzvZz4/Fp49u2DkyBHBDhpBnTcrajKiaINQ+S6thzoI5io9gUCib7/2PzbTH
	gqH12160Ixz9gISr0A4b6wFlECV3CcPA06BDe7oukzPMy6qLkcqAAqj3zeMM5E10KW4sDQcvF0O
	ju6kkqWoDZ8emVNERA0XmPfdGhdUwmQ2Z+eUMPRbfApZgKp6vVTENjPLAH+5yzrxIdiwGDdzAal
	gJxX0NooLmMopp+kJvR8+bKg87pTDtZpvRQhxlwbiRQcQWb3YUiGKFYejTNtceQOGc6i/sbHe+6
	mrEPJOcux7pl81Rgae0ff4+hI5OpnpQrFVgRaMzUR4PMlaeJ0uyKBDG5FcBDhibp9kVpsar4dg=
	=
X-Received: by 2002:a05:7301:4d07:b0:369:21a:dcca with SMTP id 5a478bee46e88-3827f5972d9mr113314eec.10.1794936575989;
        Tue, 17 Nov 2026 09:29:35 -0800 (PST)
Received: from ubuntu ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955f02ff0sm44163997eec.16.2026.11.17.09.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 09:29:34 -0800 (PST)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	WANG Xuerui <kernel@xen0n.name>,
	stable@vger.kernel.org
Subject: [PATCH] LoongArch: Online memory-only NUMA nodes
Date: Wed, 18 Nov 2026 02:29:23 +0900
Message-ID: <20261117172924.3768845-1-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.53.0
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

init_numa_memory() does not online a memory-only node, because it
onlines a node only if it has CPUs.

So online a node if it has any memory or CPUs.

Fixes: 87c6d144bc7b ("LoongArch: Don't init & online empty nodes")
Cc: stable@vger.kernel.org
Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
---
 arch/loongarch/kernel/numa.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/arch/loongarch/kernel/numa.c b/arch/loongarch/kernel/numa.c
index 7dedc134ddfe..595cc15203a3 100644
--- a/arch/loongarch/kernel/numa.c
+++ b/arch/loongarch/kernel/numa.c
@@ -140,20 +140,25 @@ void numa_remove_cpu(unsigned int cpu)
 	cpumask_clear_cpu(cpu, &cpus_on_node[nid]);
 }
 
-static void __init node_mem_init(unsigned int node)
+static bool __init node_mem_init(unsigned int node)
 {
 	unsigned long start_pfn, end_pfn;
 	unsigned long node_addrspace_offset;
 
+	get_pfn_range_for_nid(node, &start_pfn, &end_pfn);
+	if (start_pfn == end_pfn)
+		return false;
+
 	node_addrspace_offset = nid_to_addrbase(node);
 	pr_info("Node%d's addrspace_offset is 0x%lx\n",
 			node, node_addrspace_offset);
 
-	get_pfn_range_for_nid(node, &start_pfn, &end_pfn);
 	pr_info("Node%d: start_pfn=0x%lx, end_pfn=0x%lx\n",
 		node, start_pfn, end_pfn);
 
 	alloc_node_data(node);
+
+	return true;
 }
 
 #ifdef CONFIG_ACPI_NUMA
@@ -246,10 +251,8 @@ int __init init_numa_memory(void)
 		return -EINVAL;
 
 	for_each_node_mask(node, node_possible_map) {
-		if (!cpumask_empty(&cpus_on_node[node])) {
-			node_mem_init(node);
+		if (node_mem_init(node) || !cpumask_empty(&cpus_on_node[node]))
 			node_set_online(node);
-		}
 	}
 	max_pfn = PFN_DOWN(memblock_end_of_DRAM());
 	max_low_pfn = min(PFN_DOWN(HIGHMEM_START), max_pfn);

base-commit: 422e532809572ba1043192bf6a0c653bc68b3140
-- 
2.53.0

