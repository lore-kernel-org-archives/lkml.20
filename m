Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793788694;
	b=2gYUcVuftPZO9B+QxkNt9ASryfukCDhjPYE19/eugJ1gOFKRDYZOn+8W4Hz9nAywtNB2
	 T2HH67KDSLzhjhODWAbL8z+vrpsNewclIBnIuuRD+PyWidsjOkrykc2c1W0iHWGXJXDkl
	 bOKlgUJj+xLAjhoGmoH7BSbsY96NSKb6pNyiqDOvkVZnLAwL+7YR4gya5FzsbSbzV4UnF
	 pv3OBM/dvqNGBIBE54A0AWhEftsficIPQoIzPdq/BxQcWI/S9ewzjrpA/8DcnNrspfRT6
	 qwvjlMzMAh2RQMbYK0NXeDlCwCJWakfLz+69ip6Wgm5NwWM9vHdY5lG8cpASl2SyLsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793788694;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Organization:
	 Content-Transfer-Encoding;
	bh=Bky+z94GjBhGuHRVzoeUOOEZJsIpZL6CWBksx0pMhcI=;
	b=jq+aCxRyHgY0OELOyUw+fhOVeoFCrmdWc/DMC8/YVKuACyZVoA2jGbWrINKvo/BWgpfj
	 IAbFcILKMbf6a/wuMz2+Jx/FzUKvvlLU3Uai4agv90G4IZUpxDTjd9MDB25y5q4yb3av3
	 uOKA1tPbttEdin+c37RFA2SiS1haEOH7DGiVOH9cENWNWQwPwIlGh0JHAGliKvtgEtBEb
	 8plibKPZFln4NE8Lm0YKxcIXFjfUJpy9D0UCFZn1Np5e9EePEhOZ0CeoQXL64uSyvqlfo
	 W+1HKxq/PTwV22+nhERYcmHzaqcL2aIGyhugNaRIJ5NToRwk2Dt57LDHiWa/cP8Hb8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XbHSzHRz;
	arc=none smtp.remote-ip=192.198.163.9
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E64606A326;
	Wed,  4 Nov 2026 10:38:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4E64606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XbHSzHRz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793788694; x=1825324694;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=aOGzTuu2joxxtbxKzL4dHVBDbu15VwOAO4OF8srkPsM=;
  b=XbHSzHRzAm2rnwRHd7vB8V1Qc+88tBsUrSv2zvJOZaBqtc0GHJ71XFU0
   MFhAkmc2lQqrXMpsNSkYshzccff7Sd4ATzjNUOYye0AfI1yLriML2aYlU
   F1FZvjHo64/kmylSNmgWhiQ1x4TqFpFve4jOMghGc5/9XE8SkFAKKF3HA
   l6kBqHLWiowO6GecyGtJdmao9dG+yJgfSJYtXP5jSjQJ6/SpCJEuvdHGg
   udhDO+ugv1OSj4NTdbwcSnURx9K2U/I9plfhmaatqzQmhgecfHxXmhPgJ
   Ffxq1sv0XcQvp+E/0TCAouRR7eoP+bG/Uj9kC1+mjsrMruWGwALpIp3pM
   Q==;
X-CSE-ConnectionGUID: v8/Hb4mlQju6rvGc/nGxgA==
X-CSE-MsgGUID: w2GzyS0lR7+1rwhdhMjKbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2412950"
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="2412950"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 02:38:13 -0800
X-CSE-ConnectionGUID: +o7S5iu8SKeIiX9Wt7GSfA==
X-CSE-MsgGUID: 8J3dyKC6Q4eTbNPj8Cjt7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="6569104"
Received: from gklab-103a-129.igk.intel.com ([10.91.103.129])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 02:38:12 -0800
From: Dawid Glazik <dawid.glazik@linux.intel.com>
To: Lee Jones <lee@kernel.org>
Cc: mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org,
	dawid.glazik@linux.intel.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [RESEND] dt-bindings: mfd: syscon: add aspeed,ast2600-i3c-global compatible
Date: Wed,  4 Nov 2026 12:32:06 +0100
Message-ID: <20261104113206.3243865-1-dawid.glazik@linux.intel.com>
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
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
Content-Transfer-Encoding: 8bit

Add aspeed,ast2600-i3c-global to the syscon binding compatible list to
document the AST2600 I3C global register syscon node, which is already
used in aspeed-g6.dtsi.

Without it, dtbs_check reports this node as failing to match any schema
on every AST2600-based board.

Signed-off-by: Dawid Glazik <dawid.glazik@linux.intel.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
Resend of [1]. It was accepted on the list but is not in upstream.

[1] https://lore.kernel.org/all/41d66492e1a1d42f6888459288311094c8b7bc51.1777058942.git.dawid.glazik@linux.intel.com/
---
 Documentation/devicetree/bindings/mfd/syscon.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index 80ff0e1caca2..dae706ca7642 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -47,6 +47,7 @@ properties:
               - apm,xgene-mcb
               - apm,xgene-rb
               - apm,xgene-scu
+              - aspeed,ast2600-i3c-global
               - atmel,sama5d2-sfrbu
               - atmel,sama5d3-nfc-io
               - atmel,sama5d3-sfrbu

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.43.0

