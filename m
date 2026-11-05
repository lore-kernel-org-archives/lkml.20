Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.221
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793883694;
	b=q59+Qze5GtmbsY53Hcws1qVNMy/PIFF7tYkJwE0CwFlalUSbvBPvvRosdf4jqT29mhOR
	 Ruy8KfLyn1feoPP/ME+2pLN9xyLZekNFqyhEoH/iVJsxQno6xOd/TDYfml+vT5jVbTl90
	 +BJ/hpcetSAC0jnXXJaxUdTGFmNbmyBkxCar8uqBwEBSnIqXDFdtFBsrCowpZBvYPalEQ
	 +VHXDzKsMy/vw24pFwwG6os+IoclZMaeqEdSfhviTDJ69zRJMInz2tktlTr7HHGWuKJDi
	 VmHvP4TglgD7TF7jQltsEkm6g+cUIs8l67UkCU205MwEO8ip2/UISPTkpQwySvd3spQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793883694;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=PU/FIz15JXZpFNfzPT/NKA0ktSqGeC0/uUKobt6aQcs=;
	b=WXlPeugIcic58ZRY/h1YiyS99a6dZD5rzshDUfLQPhePiaQbRXU9KWmpiLovu6OwY3SN
	 hpAZp+HktKLa5maBDa/+98H5mjCG3qR5oKhg0Ie2F4Sbi+dEoZv3V1cgQ2OYYBvQ5Vhf9
	 xdj8Ze2pNO5xV8ETqFLJLaxHsCIdl2RWZ6vH25nbT5kERNWIrh20s66ebFFOxgJ6lmtYT
	 FlzO4b3jDsf2EFvWlSpvdO21qL0gySrA6hLrmyHl6xZuQ3IVpLNiVnuU/cwSeJvi/csPG
	 BTFXEvraF3Ifc9RC8BZWK4CevG9eIY76mFba781r8rwBKeIrgk2p5ky9PiPkZnednWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=nrYvSKWQ;
	arc=none smtp.remote-ip=113.46.200.221
Received: from canpmsgout06.his.huawei.com (canpmsgout06.his.huawei.com [113.46.200.221])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C816B606A32C
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 13:01:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C816B606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=nrYvSKWQ
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=PU/FIz15JXZpFNfzPT/NKA0ktSqGeC0/uUKobt6aQcs=;
	b=nrYvSKWQoD72jLY8eqX20KRZScdaXrfd6JXFGHw8ECltbPTnMwErLIst3YwaDyTrwZn3oPQDM
	18JUNVpZkAxU834BA7snNuOY9SFfcOubyrCutUB0fPWS03DcqSMW64f2UWbgoqoc5gvkyqBYcFq
	xqMMFKaMbuo2toYbnZTIczw=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4jL2W76XpnzRhRx;
	Thu,  5 Nov 2026 21:01:23 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id D29874058F;
	Thu,  5 Nov 2026 21:01:30 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 5 Nov
 2026 21:01:30 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <chenhuacai@kernel.org>, <kernel@xen0n.name>, <guodongtai@kylinos.cn>,
	<liukexin@kylinos.cn>, <zhangtianyang@loongson.cn>, <maqianga@uniontech.com>,
	<tangyouling@kylinos.cn>, <loongarch@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v8] LoongArch: kexec_file: Fix a modified_cmdline leak
Date: Thu, 5 Nov 2026 21:01:13 +0800
Message-ID: <20261105130113.2284690-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
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
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemk200008.china.huawei.com (7.202.194.74)

machine_kexec_prepare() copies it to KEXEC_CMDLINE_ADDR
and overwrites the pointer.

Free the heap buffer after the copy.

Cc: Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>
Cc: Kexin Liu <liukexin@kylinos.cn>
Cc: Youling Tang <tangyouling@kylinos.cn>
Cc: Qiang Ma <maqianga@uniontech.com>
Cc: Tianyang Zhang <zhangtianyang@loongson.cn>
Cc: George Guo <guodongtai@kylinos.cn>
Cc: stable@vger.kernel.org
Fixes: d162feec6b6e ("LoongArch: Add preparatory infrastructure for kexec_file")
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
v7 -> v8:
- Split out from the patch set as Mike suggested.
- Link to v7: https://lore.kernel.org/all/20261026075201.699550-1-ruanjinjie@huawei.com/
---
 arch/loongarch/kernel/machine_kexec.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/loongarch/kernel/machine_kexec.c b/arch/loongarch/kernel/machine_kexec.c
index 1883cae93bc3..19ccc91b6f2a 100644
--- a/arch/loongarch/kernel/machine_kexec.c
+++ b/arch/loongarch/kernel/machine_kexec.c
@@ -14,6 +14,7 @@
 #include <linux/mm.h>
 #include <linux/of_fdt.h>
 #include <linux/reboot.h>
+#include <linux/slab.h>
 #include <linux/sched.h>
 #include <linux/sched/task_stack.h>
 
@@ -56,6 +57,7 @@ int machine_kexec_prepare(struct kimage *kimage)
 		 */
 		memcpy((void *)KEXEC_CMDLINE_ADDR, (void *)kimage->arch.cmdline_ptr,
 					strlen((char *)kimage->arch.cmdline_ptr) + 1);
+		kfree((void *)kimage->arch.cmdline_ptr);
 		kimage->arch.cmdline_ptr = (unsigned long)KEXEC_CMDLINE_ADDR;
 	} else {
 		/* Find the command line */
-- 
2.34.1

