Received: from out28-145.mail.aliyun.com (out28-145.mail.aliyun.com [115.124.28.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C4843AC0D3
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 03:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788492404; cv=none; b=ZY54COeOF+yBB2LsCztiV1eqIk/KCX/eonnECRBDi2wNMB8WnCot2rbBY6w6GbxHTsbX3TTQRRWhROrp/SzXftiy3rbUqD2TERtjRoqz25nk2N9f73oeSUtVifbY6jVgtGShpA8uRPcdsI7prMKRLT8yYCxO4aaDROB0f0+rhzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788492404; c=relaxed/simple;
	bh=sb1O+9+IjENpDmkhqgDYScQLJV4P1UBv/1Wg/PHtc1o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XwZrwU1/+RiXyrtL0Q4EQ/MsXjw0+dAdm354zPG30n9tuDhSsvgGnZYs1LQJ/a/TEnUzqXrAUhTZ8Nvgm/8s8OxG5QW14DIJwBXc5l2oi0wMcUKgs4SE4U4fNhsPsW+dJK46brGp4V2VRoX4DYZblciATXrhreAEVeDnWeULEzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net; spf=pass smtp.mailfrom=open-hieco.net; arc=none smtp.client-ip=115.124.28.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=open-hieco.net
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.176391|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0191211-0.000379474-0.980499;FP=6296111688724483326|1|1|1|0|-1|-1|-1;HT=maildocker-contentspam033037006180;MF=fuhao@open-hieco.net;NM=1;PH=DS;RN=9;RT=9;SR=0;TI=SMTPD_---.j52FmRD_1788491453;
Received: from higon..(mailfrom:fuhao@open-hieco.net fp:SMTPD_---.j52FmRD_1788491453 cluster:ay29)
          by smtp.aliyun-inc.com;
          Fri, 04 Sep 2026 11:10:58 +0800
From: Fu Hao <fuhao@open-hieco.net>
To: tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com
Cc: linux-kernel@vger.kernel.org,
	tingyin.duan@gmail.com,
	Fu Hao <fuhao@open-hieco.net>
Subject: [PATCH v5 2/5] x86/cpu: Get LLC ID for Hygon processor models 0x6 through 0x8
Date: Fri,  4 Sep 2026 11:10:34 +0800
Message-Id: <941337751e95765a33d0d1daf4042831bb429133.1788404433.git.fuhao@open-hieco.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1788404433.git.fuhao@open-hieco.net>
References: <cover.1788404433.git.fuhao@open-hieco.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

For Hygon processors, the LLC ID comes from fixed bit of APIC ID
regardless of whether SMT is enabled or not. Add support for
Hygon processor models 0x6–0x8.

Signed-off-by: Fu Hao <fuhao@open-hieco.net>
---
 arch/x86/kernel/cpu/cacheinfo.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kernel/cpu/cacheinfo.c b/arch/x86/kernel/cpu/cacheinfo.c
index 51a95b078..e563e327b 100644
--- a/arch/x86/kernel/cpu/cacheinfo.c
+++ b/arch/x86/kernel/cpu/cacheinfo.c
@@ -342,10 +342,25 @@ void cacheinfo_hygon_init_llc_id(struct cpuinfo_x86 *c)
 		return;
 
 	/*
-	 * Hygons are similar to AMD Family 17h up to 1F models: LLC is
-	 * at the core complex level.  Core complex ID is ApicId[3].
+	 * LLC is at the core complex level. For Hygon processor
+	 * models 0x0–0x5, core complex ID is similar to AMD Family
+	 * 17h up to 1F models, which is ApicId[3]. For Hygon
+	 * processor models 0x6 and 0x7/0x8, core complex ID is
+	 * derived from APIC ID bit 4 and bit 5, respectively.
 	 */
-	c->topo.llc_id = c->topo.apicid >> 3;
+
+	switch (c->x86_model) {
+	case 0x6:
+		c->topo.llc_id = c->topo.apicid >> 4;
+		break;
+	case 0x7:
+	case 0x8:
+		c->topo.llc_id = c->topo.apicid >> 5;
+		break;
+	default:
+		c->topo.llc_id = c->topo.apicid >> 3;
+		break;
+	}
 }
 
 void init_amd_cacheinfo(struct cpuinfo_x86 *c)
-- 
2.34.1

