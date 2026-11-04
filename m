Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793809135;
	b=u4sjApsvrlZyqelZywFvBUct+nKSYqXC1dtXbEwflr+jOZD8CpEjdgaFVPM7m4Ufycr3
	 yDSVzD/FAdslXk/Goy6NEmU6cuA1GfKWg7RQQYcf2xoF1h/2SqrZjTpPIHEj44csxNPMH
	 WYSdV+cdJev3/fJWDMvRAw0sxOekuZFNyASLZ8bnlQQ7Q/Go+1cF77ir2YvzcrxWnCTT7
	 zMfokfDn23tBgtWXh5ROB71m4ubmjcPqrWQ+5jbl6BHHhARpzBigS89V5bUg5cOWkxjaI
	 WHOvejjSwCPZUdyrhpt8tom5Ub4E5OZZOg21tOBFcE9Gk87pYr9Rk5nZMsxPSfCwUYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793809135;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=M1hCDG4NOD4S35LqwF3S+gJOTx2TfVlPQ8MZ6qz04uE=;
	b=t9Js1FR6nm18h17BT9+1Q4z+phZQ4qU+PFVhTtM6MPVd9+6NcQ7nQw/iHPNRFNkx7GBJ
	 dYFwENW+nK7aQRZdjL7lvSk83v0sAgkCqMJFz1V6aeg8S4NGOzNvROwF22IBENkXHmtyQ
	 bib/+wQyKBsEgLp4YJh8scJ56nyha6SDChIfS6Tc8DQrZ7DvqWPY8osRED+zPQEaIGY2u
	 Ry04nK8ECBaem+Y8uxapqRtdYMMy+8dny9jWnipb35GOBj9eubJ0naG/y871QNVl4WyO9
	 Pux4/Ss041NM1nZXom0vNA4SVDjbeu8F/RwwiscLM8xxYbaWZm1PU6Gm1hPjTQtW0Tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Lw4//mMz";
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC22E606AAC1
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 16:18:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC22E606AAC1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Lw4//mMz
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-36d6e342f98so793046eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 08:18:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793809134; x=1794413934; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=M1hCDG4NOD4S35LqwF3S+gJOTx2TfVlPQ8MZ6qz04uE=;
        b=Lw4//mMzA2iHDKkFiRtVFG40l+4Ln3n6dFL2WBMxWH3KmXyU836Uw80Ui8k43yKJb7
         eqKW0+lmwa6tPhIMxzT5g7ntFIJ8alwL7JrmweO6AabVtkpTu7tdWuHXCbUCHzY+cCch
         uHaGZdp/CbVgCpeBrrNWWgSC+GFceMwwZBQMfxE/rsApHitd2BHlKGAapTwuS3P4rV6k
         M/QLWm6b29k2fGjIQPZll8DHTseSzorKm3DzM8YjV2Mprs3KZTjU8W3F0KkWXe4bZ0cc
         aWQ2NDlQCa+yUGjpfCtBYWDHZtBmZQEjAhtbmej8szuzXQGJXUofgRKNz7PMP0Zvm88A
         pMxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793809134; x=1794413934;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M1hCDG4NOD4S35LqwF3S+gJOTx2TfVlPQ8MZ6qz04uE=;
        b=xiSeuZQBoU27vWb5Mr+fBjJ2xBJSOJ8Y8/1+9IJkebtIwUkA5y91T/sn/vywv4utYp
         mP3ga0Rz55pW3K1QkOvuHsNmXCxQKT0G8Fio4V88s14HB/K8gA+2pQfjNF0Muhn2GZxp
         d9qytzudIXhyxAEXxVoVxsblAHF55i0ipYI+xi5Z+W1gHOe7uZHpCN0gpa26vDFqDyZL
         LJ2iZNXIi239vEdmJmxfl4cfkGFKBhB9hg+UX3zlB+zbVJ+1KrnRV8a/UM29cLUWNtXO
         BQQGSW9LpfKdnZKUZEs0GiOyXxNVDkCF6fbOkQVIcjTP9RqTo6wVKqTNOyZMkVbFYGFo
         EMEA==
X-Forwarded-Encrypted: i=1; AKwUvBzwJupNulXUMc5mm8BJIub76KRWLNyY9cl/Pjjv6JhwyOB62GeEmsstXNZD7fMoxe+XRy2tEb93tJJpYEI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/5rbX7w/ZHCO3RUrj277AeEX1UcF4RCO5ioJfm4KQhNuChq0Y5
	dEbHs3yWnV48zxVccBVh08ZulhtFhMnzKmRbdU6avPFF6KuNluwLuATE
X-Gm-Gg: AYBFou0s6YXQ78EbJ0Q3etVA+MgZY1YtCilqDIJ+tLTOdbEpVFAVzDGVMFhuklfwfOZ
	XkeeJNAb2bQpbjNV5rDnfzzZWeGLOeLzPBRdQNmP1HLwnmuY1kxWjHSl4XL0/LRP7i0B6jC8UgT
	yOOk3mrH9rdNaea7U7QO3fKFFThVUMaBK7V4SGIV0jNOdbNYj9+txYuhKPx0WjHx11HPHQr2l9m
	O4xX6HUugt/SmukJmDkZ4akaaAceRGgFVSqSbRV/gRdw0XsYNO44Z7oxcCDCYAiKKKypRgoVeA7
	1cM1WLqZLS11Zs/9oUMgElvAjIstbuiB6lYP3aw88AzqFcgFYZ9pCJJrVPtbHaQi/C9v8DUW71H
	sEQeWMvjYAWjaldjMll32wpjTqXx7F7ZHzf7lzg892O8IYk63zvNXNAAkc0AKNWZ3twxS8rkbvc
	Sju+CD3E9RfTmmXwkNBVr9w9uFoKU+aAFIgLgtOLTtBFhr1EIqwicckOTGwqBLi3piktMVyFAJi
	mjhW3zyoHjsvJrRlpFCtcKQqbKmNn2HFuk8QJmFDyjPyesxQlbrlxxrMrgozsYKXx2CQhueO9UC
	P4+UOBaeOvCG4BWiLyILox8mvGgd
X-Received: by 2002:a05:7301:e101:b0:36a:1c46:2766 with SMTP id 5a478bee46e88-36a42217ec1mr21526302eec.3.1793809133629;
        Wed, 04 Nov 2026 08:18:53 -0800 (PST)
Received: from ubuntu.. ([2405:201:8026:213e:52c8:76f2:6711:5a40])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38f53a6sm7880710eec.15.2026.11.04.08.18.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:18:52 -0800 (PST)
From: mdshahid03@gmail.com
To: djbw@kernel.org,
	vishal.l.verma@intel.com,
	dave.jiang@intel.com,
	alison.schofield@intel.com
Cc: iweiny@kernel.org,
	nvdimm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Mohammad Shahid <mdshahid03@gmail.com>
Subject: [PATCH] nvdimm/pmem: Fix disk resource cleanup on initialization failure
Date: Wed,  4 Nov 2026 21:48:25 +0530
Message-ID: <20261104161825.314835-1-mdshahid03@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: Mohammad Shahid <mdshahid03@gmail.com>

pmem_attach_disk() allocates a disk using blk_alloc_disk()
before initializing badblocks.

If devm_init_badblocks() fails, the function return directly
without releasing the previously allocated disk.

Use the existing cleanup path to release the disk and preserve
the original error code returned by devm_init_badblocks().

Signed-off-by: Mohammad Shahid <mdshahid03@gmail.com>
---
 drivers/nvdimm/pmem.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/nvdimm/pmem.c b/drivers/nvdimm/pmem.c
index 5fb86595e8bd..76e80eccc8e7 100644
--- a/drivers/nvdimm/pmem.c
+++ b/drivers/nvdimm/pmem.c
@@ -563,8 +563,9 @@ static int pmem_attach_disk(struct device *dev,
 	nvdimm_namespace_disk_name(ndns, disk->disk_name);
 	set_capacity(disk, (pmem->size - pmem->pfn_pad - pmem->data_offset)
 			/ 512);
-	if (devm_init_badblocks(dev, &pmem->bb))
-		return -ENOMEM;
+	rc = devm_init_badblocks(dev, &pmem->bb);
+	if (rc)
+		goto out;
 	nvdimm_badblocks_populate(nd_region, &pmem->bb, &bb_range);
 	disk->bb = &pmem->bb;
 
-- 
2.43.0

