Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A9639E194
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 03:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791518095; cv=none; b=WPHV09+tpG5zlyXd0+nIx/3EuSYNSrLkTmKLDY0ADZsSkmJmiUaB/E1MKM0N7JMB7LwSzfHnSfSU3JvFs1A7fbBvNVIuGobDtDnrsgCA1vmK+4L3KWSDXgGr+TWncFEyT1KhLczEGTGaAabQNQy09afSDnb++Q7DevSGUiSure4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791518095; c=relaxed/simple;
	bh=KKrme1KbwAc9HgANB2bdaOlETURROw+EW3N8h3NTCVs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=YjK1gw25z/8Z8rbt3X/yZxw16cNlrt946z3iLh37Nojrgh31C2HPAj+T6Rm1VM+H40yoJL297WhU5/WuSmoibkTqaVVul6hY+6RYI13P35LyLzRNyhRVCBOH026YH0ItO8qGnUzdzJvQb0vYycswn36lmw1pd1Ga++tGMFtytgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from fc87d0ffb700.home.arpa (unknown [36.110.52.2])
	by APP-03 (Coremail) with SMTP id rQCowAD3AUCCZchqZDgbCg--.2182S2;
	Fri, 09 Oct 2026 11:54:42 +0800 (CST)
From: Haotian Zhang <vulab@iscas.ac.cn>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Michael Bringmann <mwb@linux.vnet.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] powerpc/pseries: fix device_node leak in drc-info lookup error paths
Date: Fri,  9 Oct 2026 11:54:45 +0800
Message-Id: <20261009035445.3079660-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowAD3AUCCZchqZDgbCg--.2182S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Zw18Cw43Jw15ArWDtr17Awb_yoW8Wr17pF
	4fGFZ7tF10kryIyryFyF1Uur429w43KrWFyw4jya4Skr45XryDXryqqr1Yqr18CrWfCas0
	qF4qga4vvanruaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUklb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4
	vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
	F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26F4j6r
	4UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc7CjxVAaw2AFwI0_JF0_
	Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxV
	WUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI
	7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r
	4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI
	42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7IU5VxRPUUUU
	U==
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBgQPA2rIYxAH6AAAsw

cpu_to_drc_index() and drc_index_to_cpu() acquire the /cpus device_node
with of_find_node_by_path() and then walk the ibm,drc-info property. When
an entry whose drc_type is not "CPU" is encountered, the code jumps to the
err label, which is *after* the err_of_node_put label, so of_node_put() is
skipped and the reference taken on the /cpus node is leaked on every such
exit.

Jump to err_of_node_put instead so the device_node reference is always
released.

Fixes: e83636ac3334 ("pseries/drc-info: Search DRC properties for CPU indexes")
Assisted-by: DeepSeek-V4.1-Flash
Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
---
 arch/powerpc/platforms/pseries/pseries_energy.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/pseries_energy.c b/arch/powerpc/platforms/pseries/pseries_energy.c
index fdaf85ecd39b..b3a1c34b3323 100644
--- a/arch/powerpc/platforms/pseries/pseries_energy.c
+++ b/arch/powerpc/platforms/pseries/pseries_energy.c
@@ -66,7 +66,7 @@ static u32 cpu_to_drc_index(int cpu)
 
 			of_read_drc_info_cell(&info, &value, &drc);
 			if (strncmp(drc.drc_type, "CPU", 3))
-				goto err;
+				goto err_of_node_put;
 
 			if (thread_index < drc.last_drc_index)
 				break;
@@ -135,7 +135,7 @@ static int drc_index_to_cpu(u32 drc_index)
 
 			of_read_drc_info_cell(&info, &value, &drc);
 			if (strncmp(drc.drc_type, "CPU", 3))
-				goto err;
+				goto err_of_node_put;
 
 			if (drc_index > drc.last_drc_index) {
 				cpu += drc.num_sequential_elems;
-- 
2.25.1

