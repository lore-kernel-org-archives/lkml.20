Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794081216;
	b=Xeqpu47OjTSRNWD5o5X9b/KcJ2B2OB57QIMEOF2nWlTE/sOXnANALT0SbU3AY8BQtJpH
	 ewLgNdVto5Fi6ZIcSYt1BpeU3j4HNiWn0+Tb55L4tONdqi9elGjrV8I0GStGG5EV6Pxcb
	 R7kKeANPTCm6T89P5OMehwv/apIBaCh8zRgusYqSMpvQH7JHOA8+rbZ3lpaRWvR1PPpTG
	 ahXbWfvX83mp7gkF7K/FevONyTtLgFLEcdD0ozUWP5pHyh6yHph0a6a4x2OQfrbJhxqSN
	 Lbbo6hGoo/K6ajyHIXMC5UkhUz1fUhZRzOQx3XDgXxB9WavEBgggprdWBB8/jtJequw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794081216;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=KuiadmeaNV79Rj+8DVzBFrgmzZdpeP3C5b3GRz6kOUM=;
	b=JNR0RhNP0Y1feZCq/fB9qd8liDk2zaz/akhZ8HQjaLA8lyp14h3r/4ySWHJ/SFjEJMaY
	 P2vtZty3s+7YF7KYL3UTOKqa0LQ5cEIA9IxFn9XYOrDIjZjBOd/qyez7BA55mRePnZLm/
	 OwkSh+Mg7M3dVm1L4ipMoUkof8tvQhAW9kq0zfgy28blMjjR5drHunqzd69eFFaSiA91a
	 dJOm3Su8NJzABaLSTUo0frNZmR4zMOelpnKpxP8iQIerWKs3qAjTfjtaRuO+5ZPRjdyQR
	 AF7qS3dgHl82Qn68bEZqqu19t7yyDc17bxiaaIlVDpfJJT5chgpQxM0cBip7d/CLPgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="R1rPImR/";
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B3F606A32D
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 19:53:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73B3F606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R1rPImR/
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a549cd7fd2so254955e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 11:53:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794081215; x=1794686015; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KuiadmeaNV79Rj+8DVzBFrgmzZdpeP3C5b3GRz6kOUM=;
        b=R1rPImR/+hJNamfFnngHdumA3tTY66dSSaQHLBP+lLHTmTRJDgaUI7oTYc298zR9UA
         +alXhOsc5puOG3VKJWdxan66/lCQXD7dHBNKDRmjAVSHvy7HsdSvl5vLdlYrYE1FG/qi
         BZUaAwIJ3awGgbAvvO+Q/Ii1l8fLX3g3Z2I4fbeknsUrjYlgDpSCA+e0BYkQqoCjBoIY
         7QZklZMK1H1yR/+jGU+7qb5PTnbBHl3ifn4PuZwKR9WzDkpBoazNal8llgS96yq55TfP
         +8ZYrsYfoe11uPvkRDpcY2divxh3dnCKE/j6jVvBigx6EjnaIsWJOB94BhhGgluui1nI
         UnGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794081215; x=1794686015;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KuiadmeaNV79Rj+8DVzBFrgmzZdpeP3C5b3GRz6kOUM=;
        b=EF+awWj2PmylGHdtn+AZwMuODvAlEwimdyYgEVtNx8JhmVCYy4rD8FIvq6/YW7fuPu
         4uzsRGGbAJ/Y3t4ZDASA/4ZeRmQYeerhfC29XQRfmDUsz25WYuk9381guWENmcRk6bw9
         K29RYkK3nF0e2dhIrbRYBKZgfmSVOXB4Yk7mhf4hMP6Tc/Dgz/jFNiNBqjTSonlpjn7U
         cR3igpHZLu+3eH9NJ8yrCdEpl2mJj+oQyYFNKrG4+zM0lyLdkE/uhARgwcsM9FRZDiAH
         A4deWdj/hMAz6h5sd37FQMlBH8xGBWWiEIJIIW3cY7RIkOksOHk/hOJhDR7YtbhGzY+X
         RGcg==
X-Forwarded-Encrypted: i=1; AKwUvByXsp/HHLSZ3CX8ikiEyT+M+L0dQibJh5p2vqJ6kPhqDdDupJvvvqErvHl9zGklhZtCoWcuDIUdJ0jzxOQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8n280flH4sEkMpYhbQCeq69xc7+HbVMXRdxxbiRf04R7obwijV
	m3ASFvmZdlVVdPSsjKBGqMcp/Qak7YAjB9Vq6EphDF9htkhvpW0QteYm
X-Gm-Gg: AYBFou24l+cyL6cj1tu3WBNnHE2a9cOuQ0aJR3yp/pTxKxM/LY4lpCdQWJ9jdGGJn2l
	TeaAHt2r4JXrdedHopLsjpgcWBfs1T1V8S1SeOVkvo1ZfupqsOoq9BtjhI9WkTB8bPIQRwIHiNi
	9QM2gN0O9yk6YGMKUaMjkcz28hxR3s4YKHfi+LaaX/593TkcGMLUc39EL4pe6WDQOETdaqpVSDO
	6BT6sBfbeRt8aSr+Z+SENZrtyoBWGBxhhTrQzkEW3CD4veqVOQtnDVP+B0QiNY0MNAuVCSJvvhd
	qaPHjY6CsMiMFa+AbCaYalGhqeWwlRVp424y26hXIxVX2sPkKNbcOE4fKZjSQg0ToMJviv2bjwG
	v1FITg+bkRFY8ayNONx7m+HZXX8Iqt3HFWCnjfxCo8ncgGNThXGrEnFgGhRjC0cDK2P7hA+7YwH
	s218dcux8f++/G+B/HtA0aOoyh59StZjBzQ+DP00xbqAvJnln2NqueVerI1hzxJ/MyuZJ/YRj4D
	eeUCGzhfbSns03LX92kotOf+/v3f0r/pxGYvqjS/C2aqnrNlArIZn+ErCEnW4gZZlIhZyXBwSsi
	ueZabxiJBY1YskYdvY8AnfRGUJPC4FgojNwnRGm+1R9N4x4vPF8/70F/t7WesrsfUdsqipaRDJq
	a/TgQJvSaMJfTLPpnZEUph82edsX6cS1nABVcY1ctv9gsH/wob4UrxVSAmrT7ANjn3KimqA8/3X
	w7eK3IqjoLT6/YbuoFbmnD7z02QVve/Cg=
X-Received: by 2002:a05:600c:8115:b0:4a2:10f9:37db with SMTP id 5b1f17b1804b1-4b8190f468amr51908545e9.7.1794081214606;
        Sat, 07 Nov 2026 11:53:34 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a02-3100-b149-1401-90c6-65b4-035d-1e3d.310.pool.telefonica.de. [2a02:3100:b149:1401:90c6:65b4:35d:1e3d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b90619bc91sm3536595e9.2.2026.11.07.11.53.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 07 Nov 2026 11:53:34 -0800 (PST)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jonas Bonn <jonas@southpole.se>,
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
	Stafford Horne <shorne@gmail.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Sahil Siddiq <sahilcdq0@gmail.com>,
	linux-openrisc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] openrisc: cacheinfo: Index cpuinfo_or1k by target cpu
Date: Sat,  7 Nov 2026 20:53:25 +0100
Message-Id: <20261107195325.70635-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
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

init_cache_level() and populate_cache_leaves() take a target cpu
parameter, pass it to get_cpu_cacheinfo(), and then index cpuinfo_or1k
with smp_processor_id(). On UP kernels with PREEMPT and DEBUG_PREEMPT
enabled, cacheinfo_sysfs_init() invokes init_cache_level() from the
preemptible swapper/0 thread via cpuhp_setup_state(), triggering a
debug_smp_processor_id() diagnostic.

Index cpuinfo_or1k with cpu in both functions.

Fixes: 4e6d24a309e6 ("openrisc: Add cacheinfo support")
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Assisted by an LLM.

Tested on v7.4-rc1 (d48723711bae) under QEMU or1k (or1k-sim) with
or1ksim_defconfig plus PREEMPT and DEBUG_PREEMPT. Without this patch,
two consecutive boots emit "BUG: using smp_processor_id() in
preemptible [00000000] code: swapper/0/1" at init_cache_level+0x28/0x1f4.
With this patch, two consecutive boots complete without the
debug_smp_processor_id() diagnostic.

 arch/openrisc/kernel/cacheinfo.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/openrisc/kernel/cacheinfo.c b/arch/openrisc/kernel/cacheinfo.c
index 61230545e4ff6..7c2c38beecd99 100644
--- a/arch/openrisc/kernel/cacheinfo.c
+++ b/arch/openrisc/kernel/cacheinfo.c
@@ -28,7 +28,7 @@ static inline void ci_leaf_init(struct cacheinfo *this_leaf, enum cache_type typ
 
 int init_cache_level(unsigned int cpu)
 {
-	struct cpuinfo_or1k *cpuinfo = &cpuinfo_or1k[smp_processor_id()];
+	struct cpuinfo_or1k *cpuinfo = &cpuinfo_or1k[cpu];
 	struct cpu_cacheinfo *this_cpu_ci = get_cpu_cacheinfo(cpu);
 	int leaves = 0, levels = 0;
 	unsigned long upr = mfspr(SPR_UPR);
@@ -83,7 +83,7 @@ int init_cache_level(unsigned int cpu)
 
 int populate_cache_leaves(unsigned int cpu)
 {
-	struct cpuinfo_or1k *cpuinfo = &cpuinfo_or1k[smp_processor_id()];
+	struct cpuinfo_or1k *cpuinfo = &cpuinfo_or1k[cpu];
 	struct cpu_cacheinfo *this_cpu_ci = get_cpu_cacheinfo(cpu);
 	struct cacheinfo *this_leaf = this_cpu_ci->info_list;
 	int level = 1;
base-commit: d48723711bae9b8cdc56719c448ba42fef28cbee

-- 
2.39.5 (Apple Git-154)

