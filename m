Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.219
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792503799;
	b=XXn+DKC0ZwtopXygz2N4Z/S3Pv2T0Lm96C0qDWXJEgBxo3xG68ELpMrueDFZ5QCYwjAj
	 bBtAYyFu8UJwD3G9a5Bj4/PkAMQTKv0mTWmtufw23RDgYgJdhCmsI69VXccnDwPJ6wFBf
	 z6yJqr++jE/HsMGK2PhsnONMFY6FAe8mF89G1pApQSGIwhrqWI6Zwd+s3BN2Po+Utn5bl
	 E/PEuJKU+YmJHEZ1XSwx0RENIEq2PfzXi+oo9FKA4EFbdL7hlZwlueaCvmAL6IHd0RhcW
	 bUNY8FJYBpJ+oVtBEW6P9kNSNTdiH4y5RlhHuABAqxxy1CC3/8ZwFbzQN/XT4zgh69Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792503799;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=YXDXBL7SFuHL5V0DHT5sHodyascRCzMkodYe0ccJZS4=;
	b=0+A9Xl/FWGHVr6IerHx1vJg/TdqZnk/1C6J4mTIatbzZVHPIp/rVKESw1BnDRXnrWYXO
	 sZUiXemJAHfIMn1IT38DdYQG3Natm1jjd2uHUN8pzFMyhXVFI6Dc1Y20GJaIRfF09PhSW
	 5cLqfkoQUdiQNPfF4cNF+cY2kBBqldjZOfv+tqfCoSxR22jXsbnYbjmw6vEh0eFKN5mB2
	 3OIQKa3m2NU2naZvv4vCN35TUW+vxMt3ZszjSLG3Yxc4M0blUR5l1Z7l/+p/kjTBtTD9i
	 Qq2gmaZsg72ToW7oQLqsVjNQPsNHY8OZIGZOe7S/AZYf6dZw325iJyHKvOK4eZzhi4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=sNQdQxOJ;
	arc=none smtp.remote-ip=113.46.200.219
Received: from canpmsgout04.his.huawei.com (canpmsgout04.his.huawei.com [113.46.200.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA10D606A31F
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:43:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA10D606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=sNQdQxOJ
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=YXDXBL7SFuHL5V0DHT5sHodyascRCzMkodYe0ccJZS4=;
	b=sNQdQxOJ75PrBAmJsYpY32SqK4QlxMni14d0GSGsfOZu0ZgvXlVrKV6VRgaYIR5nHxZnkvHwz
	9mmnSO1h+9ewGyDxG4OsGhjJ43uETwSB1S09V5CqCABAth36LNJkY/mKCYpZ+vqldsd7cbAjC38
	/+RjB0UNePq9cQzFjphnPGA=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4j8DBh4d8dz1prKf;
	Tue, 20 Oct 2026 21:43:08 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 180D840537;
	Tue, 20 Oct 2026 21:43:12 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 20 Oct
 2026 21:43:11 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <tony.luck@intel.com>, <reinette.chatre@intel.com>, <Dave.Martin@arm.com>,
	<james.morse@arm.com>, <babu.moger@amd.com>, <tglx@kernel.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <ben.horgan@arm.com>, <fenghuay@nvidia.com>,
	<ruanjinjie@huawei.com>, <tan.shaopeng@fujitsu.com>, <zengheng4@huawei.com>,
	<jic23@kernel.org>, <gshan@redhat.com>, <catalin.marinas@arm.com>,
	<x86@kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v10 RESEND 03/15] arm_mpam: Fix error return in resctrl_arch_mon_ctx_alloc()
Date: Tue, 20 Oct 2026 21:42:27 +0800
Message-ID: <20261020134239.3921377-4-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261020134239.3921377-1-ruanjinjie@huawei.com>
References: <20261020134239.3921377-1-ruanjinjie@huawei.com>
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
Content-Type: text/plain
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemk200008.china.huawei.com (7.202.194.74)

resctrl_arch_mon_ctx_alloc() stores the allocation result in a
heap-allocated int and returns the pointer unconditionally. When
allocation fails with anything other than a retryable -ENOSPC (e.g.
-EINVAL, -EOPNOTSUPP, or -ENOSPC with a pending signal), the caller
receives a valid heap pointer that IS_ERR() does not detect.

The caller then treats the error code as a monitor index: hardware
reads use an out-of-range index, and resctrl_arch_mon_ctx_free() hands
it to ida_free(), corrupting the allocator state.

Return ERR_PTR() when the allocation failed.

Fixes: 2a3c79c61539 ("arm_mpam: resctrl: Allow resctrl to allocate monitors")
Cc: James Morse <james.morse@arm.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/resctrl/mpam_resctrl.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index edd8da460fd7..23a8771ef148 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -413,6 +413,13 @@ void *resctrl_arch_mon_ctx_alloc(struct rdt_resource *r,
 	} while (*ret == -ENOSPC && !signal_pending(current));
 	finish_wait(&resctrl_mon_ctx_waiters, &wait);
 
+	if (*ret < 0) {
+		int err = *ret;
+
+		kfree(ret);
+		return ERR_PTR(err);
+	}
+
 	return ret;
 }
 
-- 
2.34.1

