Received: from mta1.migadu.com (out-65.mta1.migadu.com [95.215.58.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D86E8374185
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 18:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788459789; cv=none; b=SSpya50LndZisxbMzHf0I6gtVCPlHrPQllultwkNCJFbKCSDtb9s//dgFbnOO7+rwhTdpMiV2U/6tirGTXVVO8G8pf/N6g7c/KOCuwjoHgQ4wdoYj8V2I07hPpgeS0haFqi+XOm/1NY6s2X5+c9wJO9kbmtN8+u28QDanBqJL7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788459789; c=relaxed/simple;
	bh=kyPFuMqpkLBCl8wSQRqkTpk9Ppsff9U2AM1Rfn2ZkhY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Up9YOx3PhpxQQLTqGRbGyALbFhJd2ic5zP4D9tM1HGDNciA/5z1Sc49lEyznP5KAo2JefPB1cXnEa3WEWieR6kDiAc2Qu6JavyPl9mKeNGfOOj5Bu2wKo88yvKg/b336fHsXj4hj0dHOeosXniJaK7vs/3oHraEYssJvFUZ1234=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=xEqnBVgK; arc=none smtp.client-ip=95.215.58.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="xEqnBVgK"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=kyPFuMqpkLBCl8wSQRqkTpk9Ppsff9U2AM1Rfn2ZkhY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788459784; v=1; x=1789064584;
 b=xEqnBVgKYIx44fnoM9TfG1xZKSxhmoCoBYNQ7UZppJIH3L3Zrv0vIJHJMmxutCEztxCxUPy+
 4gNIrZKUogzXLuLr1TTb3d/z2BcY+4tA1wsNTtyKE7Ggov8rMjIXTSpJ+DK1QLY+zubk/Zcighn
 cmiD8/fLnYGuPDvFpY4R4c8g=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id f37a0a2f39b893cb;
	Thu, 03 Sep 2026 18:23:04 +0000
X-Mizu-Trace-ID: f37a0a2f39b893cb
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: James Morse <james.morse@arm.com>,
	Ben Horgan <ben.horgan@arm.com>
Cc: Reinette Chatre <reinette.chatre@intel.com>,
	Fenghua Yu <fenghuay@nvidia.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Fuad Tabba <tabba@google.com>
Subject: [PATCH] MAINTAINERS: Add mpam.rst to the MPAM DRIVER entry
Date: Thu,  3 Sep 2026 19:23:00 +0100
Message-Id: <20260903182300.2706684-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Documentation/arch/arm64/mpam.rst is not listed under MPAM DRIVER, so
get_maintainer.pl names neither MPAM maintainer on a patch to it.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---

Notes:
    Found this while putting together the recipient list for [1]:
    get_maintainer.pl names neither MPAM maintainer on a patch to mpam.rst.
    
    arch/arm64/kernel/mpam.c, arch/arm64/include/asm/mpam.h and
    drivers/acpi/arm64/mpam.c aren't in this entry either, but that
    didn't look as clear cut, so I've left them out. Happy to respin
    with them added.
    
    [1] https://lore.kernel.org/all/20260903084809.2027326-1-fuad.tabba@linux.dev/

 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index fc320b373656f..20a6e70df83c8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18438,6 +18438,7 @@ M:	Ben Horgan <ben.horgan@arm.com>
 R:	Reinette Chatre <reinette.chatre@intel.com>
 R:	Fenghua Yu <fenghuay@nvidia.com>
 S:	Maintained
+F:	Documentation/arch/arm64/mpam.rst
 F:	drivers/resctrl/mpam_*
 F:	drivers/resctrl/test_mpam_*
 F:	include/linux/arm_mpam.h
-- 
2.39.5

