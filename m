Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E2333938D
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 19:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791486363; cv=none; b=eID7D6bCFfYWoJ2CrtJhSqeOk0SkWwdYqFF2ULbW2Cu1wraB5kTHZGfomL8dfUunRoB6x20Ou4jQJiX6+bzto5txgQ6ADors8sBOqMVmdCtOxYFk3YBG6AJ9hwEd7CRh3j1jeNiv3+AMdm+E2wt155dpO1wf5n0DZOvNzSuOruE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791486363; c=relaxed/simple;
	bh=tyv3y/X6gZyHtZLCwv/VkiekX+VHfa3+YOkHkcCluE0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=VkZF0G0mOIVHRJ7HFVLILS208qFskLFy4yC9aXk4UFDdP5c3/vSrY21VTu5kFdViiIKfRXJggE78+chb6t5Ge4lcesF9kz0YtIV+tqGQAgbSztLLpKsGhuaB4s1jpVI4cVbOhXnAScEXfU8D9yZciIjOk/fTdnEIcTtpkvcsgs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from fc87d0ffb700.home.arpa (unknown [36.110.52.2])
	by APP-03 (Coremail) with SMTP id rQCowADHk0GL6cdqPDARCg--.13716S2;
	Fri, 09 Oct 2026 03:05:47 +0800 (CST)
From: Haotian Zhang <vulab@iscas.ac.cn>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Hari Bathini <hbathini@linux.vnet.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] powerpc/opalcore: fix device node leak on incompatible dump node
Date: Fri,  9 Oct 2026 03:05:49 +0800
Message-Id: <20261008190549.2800467-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowADHk0GL6cdqPDARCg--.13716S2
X-Coremail-Antispam: 1UD129KBjvdXoWrKFWrKw4kWw43tw1xCw43GFg_yoWkKFc_Kw
	n2v3srCr4kJr4v9w4qka1rGrnFkasrWrW5tr4Iq3W2yayaq3W3GwnrtrW5G3WUGrZ2yrW5
	GF4DGa9xWa4S9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbcAYjsxI4VWkKwAYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I
	6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
	8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0
	cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I
	8E87Iv6xkF7I0E14v26r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
	F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r4j6F
	4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY1x0262kKe7AKxVWUAVWU
	twCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r
	1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij
	64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr
	0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF
	0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjxUg3l8UUUUU
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBwMOA2rHpl2XiwAAsD

opalcore_config_init() gets a reference on the "/ibm,opal/dump" device
node with of_find_node_by_path(), but when the node is not compatible
with "ibm,opal-dump" it warns and returns without dropping that
reference, leaking the node. Every other exit path, including the
adjacent of_get_property() failure, releases it.

Release the device node reference before returning from that error path.

Fixes: 6f713d18144c ("powerpc/opalcore: export /sys/firmware/opal/core for analysing opal crashes")
Assisted-by: DeepSeek-V4.1-Flash
Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
---
 arch/powerpc/platforms/powernv/opal-core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/platforms/powernv/opal-core.c b/arch/powerpc/platforms/powernv/opal-core.c
index 32662d30d70f..fbf4677e811d 100644
--- a/arch/powerpc/platforms/powernv/opal-core.c
+++ b/arch/powerpc/platforms/powernv/opal-core.c
@@ -455,6 +455,7 @@ static void __init opalcore_config_init(void)
 
 	if (!of_device_is_compatible(np, "ibm,opal-dump")) {
 		pr_warn("Support missing for this f/w version!\n");
+		of_node_put(np);
 		return;
 	}
 
-- 
2.25.1

