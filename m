Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794316904;
	b=s9NpdSY7VWRi0/ju0Q5Q1sCRMm2xj4Lfehcm2AIzCatodtyC0IOt9d/i+UVSokGd414c
	 Jz6Mas4A5p76CaDkDNyJdL7SSI5+lWbfT7Rm2HzyQLsvJxMlFI4Nnh55BrUnxkhipuDFQ
	 IUlobbR99W0eb6tPJnpLwHTsGfiL3rlutR8ki3WVyPaMCdTyvnZm85xlY6TUMgBaPddOf
	 8FvGL393iuiuFjol3BecBXI2yowlYF+3F3QBZXFEDfVWsBrgvA3+Geo0uBKizjXgT/m8P
	 SavsJ8Vvhtu4ggjwu+esBju4/NMQ+CZhQh2T7iSER8SmQpAc/AJkbTYdPXyzhKko8mw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794316904;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=fTSRhI7N/2ri6MBbUf6jFRoiVt7qnFhqogVJCSQOksE=;
	b=TJ3bVjLbdeun+DsqYztiXKL6GrVWXiEXuK9sSAhj0utgMTqsBP+v1jok+Ojypa43BANE
	 b+NdExNHvNkq1RosjrJzwJyaCN5MnLbXx+DUaVmLga7GBZ/ctmrecW3lKIOwzBn1NAE69
	 +11f6rQitp7RJ+Jim/sp49A6SUZO4z54ZJqWl7bXnb20dlHWq4UBI0ZzPBDYzCzkThMEL
	 7dxuQrXsMOqaPJPByVhVhTslMrUjRouFyVJv7w9BypTEPH6NgTd/VzTNGsiWy2KoLuxGb
	 hOAHlA2qmdXDHSCq4qoqUW/Vxx8CiZ4jDsegItFNaoVuk7Bs2la9Jztj9Kb800HJSGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TOgc8TTB;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A124F606A7F3
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:21:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A124F606A7F3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TOgc8TTB
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2ed39646f04so7473735ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:21:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794316903; x=1794921703; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fTSRhI7N/2ri6MBbUf6jFRoiVt7qnFhqogVJCSQOksE=;
        b=TOgc8TTBbYwLKHXj2O3+O52J33Z9/3RAoFLECWtyIZGDeK+ms9i9bN08wh2Mb6r7Av
         zKrucXRLvvnqoiIJEJLkZF+Q4M953WTnNzGFqmu1dVO2pXPpRTXCAj861CsjGD0Aw1XD
         MDg70rgyikifjE0XAIC68l6oboLzUi3wckm45r9ZTfRj6xMyGI33umBmZhNlcZQvLImH
         ZpjJo9q3oU3u37Ss4Ge3mFxqunX1V6wso9BIMPfMRaYGwYafWd7SKfc1qj2bqL0UO2rq
         O/rby1hi9/0pK5hiOTY7+aVatLehKcQv7S84omhmrMdfU56/v71i0sMMave0jhM0v4t9
         Mzbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794316903; x=1794921703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fTSRhI7N/2ri6MBbUf6jFRoiVt7qnFhqogVJCSQOksE=;
        b=QSzS4psbu0/a7fK3J6ePgT5SBUVdFUNuAlxne1l5/n+PqAeEcuCMV48aEhlwKbqzvP
         RSNKn+h2/aa896XhZNYGuDidkIMl+sACDvcBH6+9mIBV21EIX6gOBCuXVD89zTHDY+8c
         qXQl7+K9xAgaMRQbvbosHsFaSbx8L9ZRpFCbT0LYcO3uUbl2hPN9B6FgyPPz7L9fPn2H
         xm8zACpI0PPXzirmdTm/Lj+UnkEuCZSZBIJCjRC7eCSOSERWyTtTWHC+121VzrDPPBVu
         cNMJ75BWcbID1ekoiEOv+pYwbA3+9MtYU9/B1Hzq3ujS6qEZQtMitA/nDl589MD2r/6Z
         tcag==
X-Forwarded-Encrypted: i=1; AL+hErF06AXi/9XBsRPQatVUFzvk8Uk6JzTjvM/zWIc4aAL3xDTeBdTIyDZ79vY+QuEVfPA5VwB0aavVLC5Csjo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8sCtN1fkwZxk4eMpSeQNmdI7JI5OYKU06bWPwYKv0Qxe0Zd8jV
	sGTkOZ/KQTzeCo5yIg1UQDBWJ+6GKUG8TtmakaC4YlAMQAYDCMcZqJ3H
X-Gm-Gg: AYBFou2kHuxDz4XO4/8mVOI8mTYF7j0gfn1tYgBNwAImFxss4L5kjBi4oBksqfioNDH
	d99k/e3qYxmuzebC8jxdUU50Bjo28x8mQCorembdLaIfd9Welg/cKl36jnZyTCaPaX0r7E2D2u2
	rND4lTwECArdBSAWugEOKV00FZ1sUNX9leU3AgzYxMHg75gsjcCqXz4sAbu2jn5pv4hopeyAkcC
	7RG54ziCtLRHSzY8XKONqIYjomI0FmAsJHFH1EMT3j2FTxmI5jfJKpT244DKXOJgMFk+cQaap+p
	Yhee2tBzpnA1NT8enRIfAt/mrfY2GSFJDUBGyWIAH/OOd1QAVHTwq5CwBtkNaIyn8hCQFLD0Njt
	COvg6jqV/ebkMJIr9VhOafYcFzoLRheVNnoN1qLdhxdci4xJI1M7ZFxj2psSCbPzIZd849parcv
	Phl/BpV0LtI10nW591V+yG3omkV3r4mlHWkzjklghPkZAsPfqkLWTA4cHXeBPO+5SA9p0OxRBGV
	22P5Nsc/Zii1rvqVfRlApoWjUOUG4sF5cq3P2IEH1pYs3K9UZf24t+wMVpV7wXh6C7+NJ1JjtX5
	nqdzexArIhaCFGEr3R0/RdXqZl8GSojP7bwCLs/DtU0zikl8y+ug+oseS5Scjrs=
X-Received: by 2002:a17:902:f70f:b0:2ed:21fb:e75f with SMTP id d9443c01a7336-2edb91acef3mr23181235ad.48.1794316902956;
        Tue, 10 Nov 2026 05:21:42 -0800 (PST)
Received: from r00799764-ThinkCentre-M920t-N000.. ([139.159.170.67])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6d4a31esm8861065ad.22.2026.11.10.05.21.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:21:41 -0800 (PST)
From: Jinjie Ruan <ruanjinjie01@gmail.com>
To: babu.moger@amd.com,
	ben.horgan@arm.com,
	bp@alien8.de,
	corbet@lwn.net,
	dave.hansen@linux.intel.com,
	Dave.Martin@arm.com,
	fenghuay@nvidia.com,
	gshan@redhat.com,
	hpa@zytor.com,
	james.morse@arm.com,
	jic23@kernel.org,
	mingo@redhat.com,
	rdunlap@infradead.org,
	reinette.chatre@intel.com,
	skhan@linuxfoundation.org,
	tan.shaopeng@fujitsu.com,
	tglx@kernel.org,
	tony.luck@intel.com,
	zengheng4@huawei.com,
	x86@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: ruanjinjie@huawei.com
Subject: [PATCH v5 3/7] fs/resctrl: Clear the CDP state after the cleanup
Date: Tue, 10 Nov 2026 21:20:50 +0800
Message-ID: <20261110132054.3702-4-ruanjinjie01@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110132054.3702-1-ruanjinjie01@gmail.com>
References: <20261110132054.3702-1-ruanjinjie01@gmail.com>
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

From: Jinjie Ruan <ruanjinjie@huawei.com>

On MPAM a CLOSID is translated into the PARTIDs that the hardware
configuration uses. Without CDP, CLOSID c is PARTID c; with CDP it is
PARTIDs 2c and 2c+1. resctrl_unmount() clears the CDP state with
rdt_disable_ctx() before resctrl_fs_teardown() removes the groups, so
the teardown translates the CLOSIDs differently from when the groups
were set up.

For example, rdtgroup_unassign_cntrs() unassigns and resets the MBM
counters of each group through resctrl_arch_config_cntr(). On MPAM that
helper maps a counter to a monitor with the index
resctrl_get_config_index() returns for the CDP state. A counter assigned
while CDP was enabled is mapped to the monitor for PARTIDs 2c and 2c+1.
With CDP cleared, MPAM removes the mapping of PARTID c and resets the
monitor for PARTID c instead, so the mappings of PARTIDs 2c and 2c+1 are
left behind. The helper had an empty body on MPAM until the ABMC support
implemented it, which is when the teardown started to program the
mapping with the cleared state.

Clear the CDP state after resctrl_fs_teardown(), so the teardown runs
with the CDP state the configuration was created under.

x86 is not affected as its RMIDs and counters do not depend on the
CLOSID.

Fixes: 6e0e538a75ce ("arm_mpam: resctrl: Add resctrl_arch_config_cntr() for ABMC use")
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: <stable@vger.kernel.org> # 7.3+
---
 fs/resctrl/rdtgroup.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 5d0351453c2f..3312637fb514 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -3150,13 +3150,19 @@ static void resctrl_unmount(void)
 	cpus_read_lock();
 	mutex_lock(&rdtgroup_mutex);
 
-	rdt_disable_ctx();
-
 	/* Put everything back to default values. */
 	for_each_alloc_capable_rdt_resource(r)
 		resctrl_arch_reset_all_ctrls(r);
 
 	resctrl_fs_teardown();
+
+	/*
+	 * Clear the CDP state after the cleanup. The CDP state decides
+	 * which hardware configuration a CLOSID refers to, so the teardown
+	 * must run with the state the configuration was created under.
+	 */
+	rdt_disable_ctx();
+
 	if (resctrl_arch_alloc_capable())
 		resctrl_arch_disable_alloc();
 	if (resctrl_arch_mon_capable())
-- 
2.43.0

