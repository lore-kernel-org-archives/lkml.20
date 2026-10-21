Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=216.150.161.24
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792588155;
	b=uCVco6NsB7lqZbvQ6lk9Sx3cHdKIycV5ictVcu+VzT14a7/UhKC3KmvSXmfbG16DDFdH
	 UvIzNMEcbf4Jmnpev+8pZTE3D28s8W3kZfd6aOKBshkX1aQDutlQj28unF7ALgsw/bkV4
	 /63hF/0izoBVTM5aAoNoS8u+ZLvbWmKSOc171cYcBzIAaR9CUzO+rx/hz2FuIIiSKEgva
	 +e8sX+dG3KRxMOr2PzJgxSesFewaDahQ66UwxvklYz6XWBuSZd62i6WqRre3y9A203w01
	 wJ3rl4alEPraDv33hbXXhoZgOs/vhi7vKlDuNhg+XGQ5ZJ6eBdFDKfB5orJWK0A5ftg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792588155;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-OriginalArrivalTime;
	bh=8kkSuKGZybMITxdUyrxJVnS/iDczXbL5N4Q9M2Ulz30=;
	b=eCW0ohdfeyjShDXMEO8XB8EladqGEbjKKPSKRODBKgyLXX/jRe7TGdBHz2b3/N3vRWQV
	 uQBlwYTByTTVm1z7TKejEAReLSBZBwd1OOWJC7iv+brduNHo0y8h+uXmqXd1fbU7DLKXd
	 fDULgfaiMLIgO0GQ5Mn5C+aAWtVGmsF+kFVF3gcuoxvptavS8FFCzJrLLic/TSvkPFXVf
	 7CWeS6nijr+enLcNwrkt82f55Yv0VlONJiCZvTP3HYSHo+auKofsOgovLqqYe1UhXBNz6
	 Zzo+RUmpxQkyb6OX7QReHD9DqchPG8awYKUp22jP6axIQc3SfXs8WiONy4KAYJEEziA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=einfochips.com;
	spf=pass smtp.mailfrom=einfochips.com;
	dkim=pass header.d=einfochips.com header.i=@einfochips.com header.a=rsa-sha256 header.s=NAESA-Selector1 header.b="D/qYtLpk";
	arc=none smtp.remote-ip=216.150.161.24
Received: from naesa04.arrow.com (naesa04.arrow.com [216.150.161.24])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF712606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 13:09:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF712606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=einfochips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=einfochips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=einfochips.com header.i=@einfochips.com header.a=rsa-sha256 header.s=NAESA-Selector1 header.b=D/qYtLpk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=einfochips.com; i=@einfochips.com; l=2223; q=dns/txt;
  s=NAESA-Selector1; t=1792588154; x=1824124154;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=8kkSuKGZybMITxdUyrxJVnS/iDczXbL5N4Q9M2Ulz30=;
  b=D/qYtLpk2boB5zThykfciJnEU0GtIF3A6PHYiSi4ScKCp0hQN3K71z5B
   bOYdFmONvKfs08/vESOsD24br9ZhTMIg2VHtylwDarPInSCYGQekDLGbD
   EBRnxY3WpMN/4tWGRn7aFZUw6lmTtHCnKkQxNN/hA8L80SlWvNHYMsfh0
   Z98M0XDIpfEvyTzenU1Pg4Trz+lsVEajRfFF68kWGbd7tzmTgcto+I/oY
   5plJIG/oor+qILWvO6hCATLWNg09cPbHJW2rkLV7L56j72EpUfy9F9L2+
   c+7Nuy55BndZVaRP8QCtXgSWZBgNWD1MH8hIldsIhdio8uRJh5+A7t4aK
   w==;
X-CSE-ConnectionGUID: AO74sigJQVqie7wKER47zA==
X-CSE-MsgGUID: MtVbcjn4TUW+FQun7j/ZSQ==
X-IronPort-AV: E=Sophos;i="6.27,170,1787032800"; 
   d="scan'208";a="125558543"
Received: from unknown (HELO eicahmirelay01.einfochips.com) ([10.100.49.50])
  by naesa04out.arrow.com with ESMTP; 21 Oct 2026 07:09:07 -0600
Received: from AHMCPU1888.localdomain ([172.25.5.100]) by eicahmirelay01.einfochips.com with Microsoft SMTPSVC(10.0.20348.1);
	 Wed, 21 Oct 2026 18:39:06 +0530
From: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
To: Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Darshan Prajapati <darshan.prajapati@einfochips.com>,
	Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
Subject: [PATCH] cache: sifive_ccache: Enable all ways when no LIM is reserved
Date: Wed, 21 Oct 2026 18:39:06 +0530
Message-Id: <20261021130906.2501060-1-pinkesh.vaghela@einfochips.com>
X-Mailer: git-send-email 2.25.1
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
X-OriginalArrivalTime: 21 Oct 2026 13:09:06.0684 (UTC) FILETIME=[5A5C63C0:01DD615D]

The composable cache resets with only way 0 enabled, while the remaining
ways are available as Loosely Integrated Memory (LIM). Systems that do
not reserve LIM therefore use only one cache way unless software
increases WayEnable.

When no memory-region property is present, DT describes no LIM
reservation for the cache controller. Validate the reported way count,
then enable all cache ways so Linux can use the full cache capacity.

When memory-region is present, leave WayEnable unchanged because enabled
ways cannot be returned to LIM until reset. This may leave more ways
assigned to LIM than required, but avoids consuming reserved LIM.

Apply this policy to all compatibles handled by the driver. Firmware or
DT configurations that require LIM must provide memory-region;
otherwise, Linux will convert all disabled ways to cache.

Signed-off-by: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
---
 drivers/cache/sifive_ccache.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/cache/sifive_ccache.c b/drivers/cache/sifive_ccache.c
index 2acb8bdf06d5..17b6ba8ab984 100644
--- a/drivers/cache/sifive_ccache.c
+++ b/drivers/cache/sifive_ccache.c
@@ -117,6 +117,22 @@ static void ccache_config_read(void)
 	pr_info("Index of the largest way enabled: %u\n", cfg);
 }
 
+static int ccache_enable_all_ways(void)
+{
+	u32 config, ways;
+
+	config = readl(ccache_base + SIFIVE_CCACHE_CONFIG);
+	ways = FIELD_GET(SIFIVE_CCACHE_CONFIG_WAYS_MASK, config);
+	if (!ways) {
+		pr_err("Invalid cache configuration: zero ways\n");
+		return -EINVAL;
+	}
+
+	writel(ways - 1, ccache_base + SIFIVE_CCACHE_WAYENABLE);
+
+	return 0;
+}
+
 static const struct of_device_id sifive_ccache_ids[] = {
 	{ .compatible = "eswin,eic7700-l3-cache",
 	  .data = (void *)(QUIRK_NONSTANDARD_CACHE_OPS) },
@@ -319,6 +335,12 @@ static int __init sifive_ccache_init(void)
 		goto err_unmap;
 	}
 
+	if (!of_property_present(np, "memory-region")) {
+		rc = ccache_enable_all_ways();
+		if (rc)
+			goto err_unmap;
+	}
+
 #ifdef CONFIG_RISCV_NONSTANDARD_CACHE_OPS
 	if (quirks & QUIRK_NONSTANDARD_CACHE_OPS) {
 		riscv_cbom_block_size = SIFIVE_CCACHE_LINE_SIZE;
-- 
2.34.1

