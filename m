Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC4C360EF4;
	Fri,  2 Oct 2026 15:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790955397; cv=none; b=UiAW4gEfd6APcMiCVwRp9qXnMIWi0vL0APc0emvkMAjBfVG9j/iCaOBZiNKaJLivULDght6w3oq3n7RbgsJ7puXgGkRJHI9Wx0VwK8d64fWZxSL2gYe4X91WhunhGruy8mbTMFJOQSrKQNDyW8y18gL0HxeIYjePXSOgQxS8VLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790955397; c=relaxed/simple;
	bh=8s7rrg3yONdcHtmcH7OGOW2PwRv8XilceivIWnAV6hI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OZ1m2sFgPj0XFZex8Z+ozJvljM3K81q89Gf0qWGNQcEvqX34opXAVT9aZHh0x4rzrcgYvua/ACb5V8wJjIXd7bIPgtPa/hWAVb2X6JDzHLveUev4l4NSiLC1DkVPKtMgRC9eRAgytxgrIVHbCQJes4vJ0uF5HjbvgXzhaqINGvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j8z/+1uS; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j8z/+1uS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790955396; x=1822491396;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8s7rrg3yONdcHtmcH7OGOW2PwRv8XilceivIWnAV6hI=;
  b=j8z/+1uSYTDuEdVEmNw9zcBiGV1pUYgURxA5rrP3umTX3OV5+0r08b51
   7o7rCFVkDG0NvMYgN1w5aPo29uysDlvSEvuLPAHYPYBXTRatvzMeL6pzE
   wDvnaGgoPRJAM00hYih9nV6GYUxVOcfzqVArOkPhSZ5Hd9AiRRkZRMDTO
   PlKhOcOJbZ0qGY2lNGyG43GeLOCDDDIg07St+IarKfACOzw9EHIFxLvot
   SvKwud6e5h1suzdKFOdmhAq6g6ma3td6p+MX0pSRHzG6Tjg0zn702UpGw
   9WehFkgdnxic0KNwdVIPKPnYziyXDMl946KSVjZMr7ot0CCVSZTnAliQK
   Q==;
X-CSE-ConnectionGUID: v508g0orQAqKbGbf3xb7bw==
X-CSE-MsgGUID: mk1rgz8cTqan6dHEJS5WTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11923"; a="117247708"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="117247708"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 08:36:35 -0700
X-CSE-ConnectionGUID: J9GU+psBRte3AN8ClYb7rA==
X-CSE-MsgGUID: PCPhXXncS9OdjY4ZZFdGuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="279522387"
Received: from gklab-103a-129.igk.intel.com ([10.91.103.129])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 08:36:32 -0700
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
Subject: [PATCH 1/4] dt-bindings: arm: aspeed: Add Intel AVCRP board
Date: Fri,  2 Oct 2026 18:32:42 +0200
Message-ID: <63367a27ef8c7f27a9d273b65b02b02009d149c6.1790344811.git.dawid.glazik@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1790344811.git.dawid.glazik@linux.intel.com>
References: <cover.1790344811.git.dawid.glazik@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
Content-Transfer-Encoding: 8bit

Add a compatible string for Intel AVCRP BMC board.

Signed-off-by: Dawid Glazik <dawid.glazik@linux.intel.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 8ec7a3e74a21..2c8180e49b2f 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -106,6 +106,7 @@ properties:
               - ibm,rainier-bmc
               - ibm,sbp1-bmc
               - ibm,system1-bmc
+              - intel,avcrp-bmc
               - ibm,tacoma-bmc
               - inventec,starscream-bmc
               - inventec,transformer-bmc
-- 
2.43.0

