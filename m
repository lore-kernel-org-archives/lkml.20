Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E899477287;
	Mon, 12 Oct 2026 16:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791823426; cv=none; b=jr6x7s0mAt7yuEV0tOAZCM1n08knBBcIyb04Qq+8XC8jtB1VfEq4fsGJa5u/dP+/pHUCbLrvMwK+oh5pdl7cfFFiA6zcRazM9xbG9anonbv6ReF4WZzok79AhSlFhaVUuYkLLeid37byr77VS4P0cL+KNimmMQRqA50tDZn597w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791823426; c=relaxed/simple;
	bh=Qp8ehQlKBEpYMpNpbGBobCp0JbCv+zToa4qq8WFMcAk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V+gCabZA+4ojxa79943UudvRcxVcXoHRy0loBnB4BICZuOZAYAqQ/LCF+mo50iziTIYBTFxIzjr43z4Fq3ME8vuHvhjzKcm5847y8xU65BIVO5q94YtyYaAyA/ODNnpEOHAyZjHZnBUZo10B+COL/CMdaDDmeMh+w+J5OqMesCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U3qhk5Oo; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U3qhk5Oo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791823424; x=1823359424;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Qp8ehQlKBEpYMpNpbGBobCp0JbCv+zToa4qq8WFMcAk=;
  b=U3qhk5OoiMGE4Ev4mAKeEAmgmIOogg/7DiJcrzp/kRIUvwVdiQnySdox
   5OKkHjtEop8qx48+ouUHohIkhaWXqXCSrgRQRG53L/TPkZUQMMjPJSQPO
   nXI3EMg8oVQxU5rMPmP+pgWDeb4nZxuxAx47T/ZKStGZ41Wpx2x3vc3sx
   aha6zXvRaeXLnfybCg7hVu6unT1K39PnVZKbPHP6IJfdSygZfR7W/+mib
   GNJgfWm2NIdEsfXfdr2LmCgQuOusr+RumtUqW+xhx5CHV/kAi5TIlMlnF
   RhW5hsw+5MosjbrmYhkNXPW3iYoIBKtFKY6ylavv/XH3zd/0JWW1x0v8/
   w==;
X-CSE-ConnectionGUID: co92f+UcTNuZQzB5G7d5vw==
X-CSE-MsgGUID: vijd59goSG2kQK6z1aSlMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="410086"
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="410086"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 09:43:43 -0700
X-CSE-ConnectionGUID: asXuhYDSTKqumKcmgKmFqQ==
X-CSE-MsgGUID: 35YRVcKoQ7yCpmP4X9cXyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="1004936"
Received: from gklab-103a-129.igk.intel.com ([10.91.103.129])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 09:43:42 -0700
From: Dawid Glazik <dawid.glazik@linux.intel.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	dawid.glazik@linux.intel.com,
	maciej.lawniczak@intel.com
Subject: [PATCH v2 1/3] dt-bindings: arm: aspeed: Add Intel AVCRP and JNCRP boards
Date: Mon, 12 Oct 2026 19:39:05 +0200
Message-ID: <0b8fbf07323894a48a777ea531713a0285e319d4.1791825961.git.dawid.glazik@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791825961.git.dawid.glazik@linux.intel.com>
References: <cover.1791825961.git.dawid.glazik@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
Content-Transfer-Encoding: 8bit

Add compatible strings for the Intel AVCRP and JNCRP BMC boards.

Signed-off-by: Dawid Glazik <dawid.glazik@linux.intel.com>
---
v2:
 - Squash the separate AVCRP and JNCRP commits from v1 into a single
   commit, since the changes are small and closely related
 - Fix compatible string ordering so the new entries stay in
   alphabetical order within the enum
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 8ec7a3e74a21..60e8e73da3f5 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -107,6 +107,8 @@ properties:
               - ibm,sbp1-bmc
               - ibm,system1-bmc
               - ibm,tacoma-bmc
+              - intel,avcrp-bmc
+              - intel,jncrp-bmc
               - inventec,starscream-bmc
               - inventec,transformer-bmc
               - jabil,rbp-bmc
-- 
2.43.0

