Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.223
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793883572;
	b=mL93WAaZNTc9/WRzLl9MgSF9AHWGBpF55zzAz8NguuatPIw+RNM+r+VwGd9Rd6qn1mox
	 5pySwPVRsKyYrKqBrTj+ibzmEs1Ge9Tc/yJiGGei2M6rvpqeLas+Za6RKtxAdJTO5Z+PP
	 CqCm4Z71aUwyVv9J9Qt2AN8QUjmzTXru4ghIDrSCC1KG3wEonSmWP0rIQlRRaAa6IKhDu
	 TWkzMEfQtv0SB3kXGPx1ETDrFgBPzMFQsXCAzx3BLE0Fg7Lb3FyRpJrP/PiKkO5P0z6Om
	 gkABPhYt0yihxE87OhnY/wela+sWocVmfD+fVIp6euLNknE0EUQkYf+cWJMAPNw05vA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793883572;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=+E22eGQ2MJjCILPPn9RP6s1QVwt1VQHo3HCnxy0O66A=;
	b=qOtu5/UCvZiJI8xZT+GauUD7INTPAmJOd12bvpVpFqqZO0rvvR0ef51BhmoCEWR9MhLl
	 D3fh+Gn8R6PWu0q5TyOIyRJMijqeid0Dy+99WZOZPRIAYswzaPWp4hgUpxfl3ZhJefH7R
	 eoUSYEkbDP5I85t3Q6llSv/XtOwUH6r9MUzi24Qjwk6dA1OyeFcRh4avu5S8O8vvwJE4W
	 +198qiLP1bxFtDfFZUlLb3psKhWoPHFzpkTXOcrekoVEcUU9Bech7knS9oP43Edd5NITV
	 NvBL7PcZCdxpogwaFHOhM5/EeHETFdF2Ie/bu8Rs0WHQwlbiJtP95pyNfQVrNIjsHJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=cS7ul+wi;
	arc=none smtp.remote-ip=113.46.200.223
Received: from canpmsgout08.his.huawei.com (canpmsgout08.his.huawei.com [113.46.200.223])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB9C606A329
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 12:59:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABB9C606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=cS7ul+wi
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=+E22eGQ2MJjCILPPn9RP6s1QVwt1VQHo3HCnxy0O66A=;
	b=cS7ul+wikj1KUf5rkKa9MyhHiH+s2IyoUyiP3zfHwGpPZvSjuxGmIlG1V83ZLRyMoquvSCW/Q
	EBHGUFzgMAtkI1p3cogsaEq9/V4qlMyLiBOzbqv9LOoKDbF9fWMFWLKnOjz+nybHE7ms9vpcoZb
	4mnnLjDnA+Tp+92Uc+YBlQ0=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4jL2Sb68VbzmVBV;
	Thu,  5 Nov 2026 20:59:11 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 4BCF44057A;
	Thu,  5 Nov 2026 20:59:23 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 5 Nov
 2026 20:59:22 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <chenhuacai@kernel.org>, <kernel@xen0n.name>, <rppt@kernel.org>,
	<tangyouling@kylinos.cn>, <baoquan.he@linux.dev>,
	<loongarch@lists.linux.dev>, <linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v8] LoongArch: kexec_file: Fix elf_headers memory leak in retry loop
Date: Thu, 5 Nov 2026 20:59:06 +0800
Message-ID: <20261105125906.2284169-1-ruanjinjie@huawei.com>
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

A retry allocates new elf headers and overwrites image->elf_headers,
leaking the previous buffer.

Free it before assigning.

Cc: Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>
Cc: Youling Tang <tangyouling@kylinos.cn>
Cc: Mike Rapoport (Microsoft) <rppt@kernel.org>
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>
Cc: Kees Cook <kees@kernel.org>
Cc: stable@vger.kernel.org
Link: https://sashiko.dev/#/patchset/20260729031235.2840255-1-ruanjinjie%40huawei.com
Fixes: 55d990f0084c ("LoongArch: Add EFI binary support for kexec_file")
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
v7 -> v8:
- Split out from the patch set as Mike suggested.
- Link to v7: https://lore.kernel.org/all/20261026075201.699550-1-ruanjinjie@huawei.com/
---
 arch/loongarch/kernel/machine_kexec_file.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/loongarch/kernel/machine_kexec_file.c b/arch/loongarch/kernel/machine_kexec_file.c
index 5412aa9f3568..0fe60907b97f 100644
--- a/arch/loongarch/kernel/machine_kexec_file.c
+++ b/arch/loongarch/kernel/machine_kexec_file.c
@@ -166,6 +166,10 @@ int load_other_segments(struct kimage *image,
 			vfree(headers);
 			goto out_err;
 		}
+
+		if (unlikely(image->elf_headers))
+			vfree(image->elf_headers);
+
 		image->elf_headers = headers;
 		image->elf_load_addr = kbuf.mem;
 		image->elf_headers_sz = headers_sz;
-- 
2.34.1

