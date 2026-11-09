Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.194
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794230800;
	b=BfaELweQGIiaNYkOxnDm/DaRR/qRPnmr7qi9gZbZI9p+D7koYXi/C8dZP1gKf+bw20z2
	 UHbKLxkY97xeb3RXkQ6QBMsL6WUVo+KuyYDBcc0u2S+g0qm/vREtadX3l1/0aMrJD/XHx
	 dNRu1ZarCcU2pq6bJ9hmV2KawD3PJKw/2MT1GWA+YCPrPElCBAD92qouwOPHBUQLlrXyW
	 mgNv+N89fD1LdBCgA0136DoTflBLeVRqNI8W36/OaA/V7i+PcsBgilxi5Exp2Z6fSDAc7
	 znVILVEW0YiQpi4m4Ucejrydmu0TNpIxVJG+Hombs8F6RVnS6TKW9lES/2KxkP32rIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794230800;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zQWBm2KzcjyJTbZ4vsbbDLZy5idG2ggu74AoJJxfV0I=;
	b=OA2/7TGpsFth5t/iCGeMk3cHVSWHorNZecwOcwfKhmbQUTvLqbhMGP1WLwYdFCc+w/EK
	 bVbJpxnBDhtvN9Uf8+bpI8NrcdVeeR1OVMzviCnnxISVNLEY1XBwSeF3uWkJoEOgS0BPk
	 tPqzd/mBqlgaIXN2kUuRS6lmJcxis/M6cmdYoAGxpdOnefoOyiKITzNfDLEZVb3Bs/cOL
	 BRfW3NUK0gbgtXESlAQPxjpQSxkWbDJu17xZR0ks1B65Vjppl8tUEwB0X01J/9khlGRFz
	 DVzKhtMQXFjVdvtJD+nMHRnqwTlUKEBjnivaGz3Q/7DLt4bFC7MysHtypesPEhc9Gaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vko2xca7;
	arc=none smtp.remote-ip=74.125.227.194
Received: from mail-pi2-f2.google.com (mail-pi2-f2.google.com [74.125.227.194])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4294C606A338
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 13:26:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4294C606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vko2xca7
Received: by mail-pi2-f2.google.com with SMTP id 41be03b00d2f7-cdac05f11bcso263959a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 05:26:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794230799; x=1794835599; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zQWBm2KzcjyJTbZ4vsbbDLZy5idG2ggu74AoJJxfV0I=;
        b=vko2xca7Rrv4Ura/+Rn744rwlmIpt9E0fqDRA49hHo3KgKWjGw8vhMNlhg3xq4NeAB
         tOAgvrbPx3VlkNd/Ec8I0bxLuEhm76gW6xlKj1vVAFIGAOfDwe65vun0NTHnjI1+usUj
         35rGBAMwwTxjUzBO0JjDHdvDArEOE96q82Yp3bdBaNuwGjvVaCgme0EHFDz+6KfjTsB+
         uKBxkUzjjMauqKMxn+Aiop7AN+JZn+meKkARBr3B42YlICuhFMqn4LC7SKx9L8P3h1la
         r0lHMkbxHigZJAfny1/LvyQzg8f+C31hPAk2tUV09fqLkGxlZ4SgVlX1fzCPkIOiQz+E
         hwSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794230799; x=1794835599;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zQWBm2KzcjyJTbZ4vsbbDLZy5idG2ggu74AoJJxfV0I=;
        b=psnpQcSk20l8prALtbDv8JhRmmySyaoouy/F/SO1fQW5+u1OL91kv+O7ZLF2gA3cdd
         9DjCg0xAnfcKDVx1Mz0Rs5iqNkIr2eHig8hTNG85mvC4FiVwI4gmWgvdsLLuEiQqtswm
         PbedFbUr1uUR7BXjJuxjgd+pHJVByAkFbLzzT8Ykmf69QlwZPGpQx1IH6mtv7g8uRVH3
         kar+eBmuKQJYDiSuk+cKBNTtWMqvI1E0hw5DYDVwpoFKHlcZdgg0q0W6eT8KVniueTL3
         F1NAGBdjvNQX81A8WeyAREmqrqosW2pmHoMHvBlRp2psA+wCSuMruKe9VUanxoWY0EQc
         2ffw==
X-Forwarded-Encrypted: i=1; AL+hErEt8iCJFS2pRRWsc9aOjV7duVgHHVUsGZoxfBq05fynN/S0Q75JrKPqyJRfXJp4ZpsGnXA7V8YxclaAvo0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/n9DH86Fk/yxZFiG1b0gT0l0JlzvxpzxGMFN5VAxRqCColF+wW
	R12vnbjfuLYT8SWdeDqvHE+EFx4pxNUePx6Dqvcx7/DZ6ZgoZ0tAt5NI
X-Gm-Gg: AYBFou07xIABr+k4RhnBqOgKhvi9yHJWcfgJnhU90Io9Whia9OVj6UYqlD5j8U+zg4n
	JlBhCIrjG7WtvzL7GV10BlIsfEz+do8xNXWSKdNnQwH24ts+jWxDJxgu/wCfaHCmJb01r2GuMIk
	oug9pXAmXtUcqtw+SzAJZtkOCPVdJSWB5PsZBtGd3sHVfW1MWwFJx4wafrVYWg92njsDe6ofCmI
	0p8KTJCd1nbQV5PWSdXtk/TrOCs4DJoi8OSfJ6UvHjCfFGZupGRaoB0496IkHNW+YBmwrJuuFYV
	xtHGt6DttM63Dvzf8Z281djyqJdyJoo7mt0P62f9wSnT9+hefPl08iSqjlG+MvcyNxfYBBKUoGi
	iukGpyVEHYG3M0R4cicpHu3dxJ3xgI+x3RlRS2JbdABwYrUFtQCx4ilZIrUy2TeCgjA9QUidvnl
	Veld4RyeJudyzWzv8HpfIG4TEEpGd1RYdytdnxfD0uza07WGuX5iDo97BY7y9MGjMzRQ8A5UyBX
	MVJ5y3EGT7/bvSmI4E6dXyfdE4a4F33/6mJ8+sc9+qiu5uoP8R7LhoyN4WTSfNIZL2iG4DIbW8G
	2uP7wxYU8YQjk/yjc1Ps9+tIp79htneWxhLrdtdHMk5ln+/FwAnomFYvciTw/BdBSQZboAPw3QV
	9GdNqMGP2
X-Received: by 2002:a05:6a21:488b:b0:3e0:eae8:7525 with SMTP id adf61e73a8af0-3eed3956cc4mr3311188637.64.1794230799422;
        Mon, 09 Nov 2026 05:26:39 -0800 (PST)
Received: from r00799764-ThinkCentre-M920t-N000.. ([139.159.170.67])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb969331f0sm1661701a12.18.2026.11.09.05.26.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 05:26:39 -0800 (PST)
From: Jinjie Ruan <ruanjinjie01@gmail.com>
To: babu.moger@amd.com,
	ben.horgan@arm.com,
	bp@alien8.de,
	corbet@lwn.net,
	Dave.Martin@arm.com,
	fenghuay@nvidia.com,
	james.morse@arm.com,
	rdunlap@infradead.org,
	reinette.chatre@intel.com,
	skhan@linuxfoundation.org,
	tony.luck@intel.com,
	x86@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: ruanjinjie@huawei.com
Subject: [RFC PATCH 1/6] fs/resctrl: Avoid division by zero in the MBA software controller
Date: Mon,  9 Nov 2026 21:26:16 +0800
Message-ID: <20261109132621.3862497-2-ruanjinjie01@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109132621.3862497-1-ruanjinjie01@gmail.com>
References: <20261109132621.3862497-1-ruanjinjie01@gmail.com>
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

The software controller estimates the bandwidth after the next step as
cur_bw * (control + min_bw) / control and raises the control while the
target stays above that estimate.

MPAM allows the control to reach zero: its bandwidth control is a
16-bit fraction, so 0% is valid, and its step is non-zero. The
estimate then divides by zero in the MBM overflow worker. On x86 the
minimum equals the step, so the control never leaves zero and the
division is not reached.

Take the step up without evaluating the estimate when the control is
zero. Check first that the target is above the measured bandwidth so a
zero target does not oscillate.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 fs/resctrl/monitor.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index 04e4ea612b7c..dbc6770508e6 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -749,11 +749,15 @@ static void update_mba_bw(struct rdtgroup *rgrp, struct rdt_l3_mon_domain *dom_m
 	 * on a system with 10% granularity steps, check whether moving to
 	 * 40% would go past the limit by multiplying current bandwidth by
 	 * "(30 + 10) / 30".
+	 *
+	 * A zero min_bw lets the control reach zero, where the ratio is
+	 * undefined. Take the step up without evaluating it.
 	 */
 	if (cur_msr_val > r_mba->membw.min_bw && user_bw < cur_bw) {
 		new_msr_val = cur_msr_val - r_mba->membw.bw_gran;
-	} else if (cur_msr_val < MAX_MBA_BW &&
-		   (user_bw > (cur_bw * (cur_msr_val + r_mba->membw.min_bw) / cur_msr_val))) {
+	} else if (cur_msr_val < MAX_MBA_BW && user_bw > cur_bw &&
+		   (cur_msr_val == 0 ||
+		    user_bw > (cur_bw * (cur_msr_val + r_mba->membw.min_bw) / cur_msr_val))) {
 		new_msr_val = cur_msr_val + r_mba->membw.bw_gran;
 	} else {
 		return;
-- 
2.43.0

