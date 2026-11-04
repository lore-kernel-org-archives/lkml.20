Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793808481;
	b=4+8WaIgvWUoQc0fUhq8h6kl3a+bI8H0avmcNsGkIN2hTebF9WhV61JSKlLazsKT6SA7U
	 iBSIfOx0Q1C9jGAdk9SouuEy0uU1333sEEEOizOIbbIuW8tDi+lpEE5gZlf4k4lyLtfH+
	 e6kAmYqrIAiIhp9KtTcuJYmksmT3Q42p0vPgkDpvkYDN1xDVmh0wlT0SPXll/jqWlHifF
	 BVMLMweiFhTYrjWMHEizOoSytMMt54egPh1SN+fZtzx9lZhz5Q644HOSXA6ATjroU1NZq
	 f3lxGSod2Etz257UtxyNV1EKyaUw4vAzlxmQHgp+qmT/RPlz9MmfWAOhicGIhcSo/KQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793808481;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Iv4RXwBNHOO2aggVuJYm+8Pj166cA39M0Lvmb9F3lJI=;
	b=wUxLSe15pgCyeLbycWCWp5hSxtV+SjpJTHupp8blMrleO+7vqk2zkBtWG7ilm+j1xcyd
	 Z0mANnCstEBpwPghrp6Q1+McKOH67Amz4XIZC9ybguG2BI8s5sc61rGmkmxbC1Yz+FA3M
	 8Ta6Df1olmLbqra91TuLdLdg3UirdV98lPDQj0aIfCn4qzV9W8wqpz7zI6l5YG1ovgFnV
	 k1Y/pNlHVwcw+QiEsxkUFTb+n4onIAq71+XXbs1Gy+vdnU4qX69NHOFFjqjb9R//WshH3
	 oBzsuZd+0L2Q8XLebkmnrxuSvaYRRHa+i+lZBufn1cJrmEmShSAQBm9sJEnnMfrkU6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Pxijlgns;
	arc=none smtp.remote-ip=95.215.58.100
Received: from mta1.migadu.com (out-100.mta1.migadu.com [95.215.58.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2FE9606A331
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 16:08:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2FE9606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Pxijlgns
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=SPSYp0yqavBrNqQ10V1mFie0J4jx+cxl1tKGwJPYS/8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793808478; v=1; x=1794413278;
 b=PxijlgnsdzuZ7F0s73KoYTZDQ/YUO2RwcxtpNH/Fdj+Bu//pvBviCM+dxN2XvRxZ4EhUIhrk
 Qhm2IAJpBhaCe1JrpxZErcrKSyHbWriAnIZN0hpyZQMOLgxf4WO00M4Jq+7uCEJsILC8452nqej
 pp7WKUbINI8e1FDjRemQXSmE=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 92d7f9eaf78d179f;
	Wed, 04 Nov 2026 16:07:58 +0000
X-Mizu-Trace-ID: 92d7f9eaf78d179f
X-Migadu-Flow: FLOW_OUT
From: Vineet Gupta <vineet.gupta@linux.dev>
To: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Matthew Brost <matthew.brost@intel.com>,
	=?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: Vineet Gupta <vineet.gupta@linux.dev>,
	Robin Murphy <robin.murphy@arm.com>,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] iommupt: Make PT_SUPPORTED_FEATURE() return 0 or 1
Date: Wed,  4 Nov 2026 08:07:20 -0800
Message-ID: <20261104160722.1637541-4-vineet.gupta@linux.dev>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104160722.1637541-1-vineet.gupta@linux.dev>
References: <20261104160722.1637541-1-vineet.gupta@linux.dev>
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

GCC 17 adds -Wconstant-logical-operand to -Wall. It warns when an operand
of && or || folds to a constant other than 0 or 1. PT_SUPPORTED_FEATURE()
returns the raw feature bit, and the fvalog2_*() helpers use it as an &&
operand. The build fails with CONFIG_WERROR=y:

  drivers/iommu/generic_pt/fmt/../pt_defs.h:255:51: error: use of logical '&&' with constant operand '2' [-Werror=constant-logical-operand]

clang has the same warning, but it checks only a constant right operand.

Compare the masked value against 0. All users test the result as a truth
value, so the behaviour does not change.

Signed-off-by: Vineet Gupta <vineet.gupta@linux.dev>
---
 drivers/iommu/generic_pt/pt_defs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/generic_pt/pt_defs.h b/drivers/iommu/generic_pt/pt_defs.h
index 707b3b0282fa..51a9c1c5fcc9 100644
--- a/drivers/iommu/generic_pt/pt_defs.h
+++ b/drivers/iommu/generic_pt/pt_defs.h
@@ -200,7 +200,7 @@ static inline bool pt_table_install32(struct pt_state *pts, u32 table_entry)
 	return ret;
 }
 
-#define PT_SUPPORTED_FEATURE(feature_nr) (PT_SUPPORTED_FEATURES & BIT(feature_nr))
+#define PT_SUPPORTED_FEATURE(feature_nr) ((PT_SUPPORTED_FEATURES & BIT(feature_nr)) != 0)
 
 static __always_inline bool pt_feature(const struct pt_common *common,
 			      unsigned int feature_nr)
-- 
2.53.0-Meta

