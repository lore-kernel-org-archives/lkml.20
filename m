Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793029565;
	b=QtlFK8NThE9stTxkuYVW3YSI7n4HGflXKoH8oMW+9sB5Z4VTCo0RzFarxPbPUE0rz+h6
	 LiureLK56wpwdum6dKe73MlNgD7Xfm6mrSoFMKFB53dmQBFjoxAfe5nVVH1Fe8jvIedSf
	 zcSh5IW7TGkP6Qa/jI5kHDDTk+CSdBzjilBwvU14Ekpe2cHjXnfKi+aU41q2EU3iBCXB0
	 Lr6XYxOU40IJ1AeTKDN7F/CzPVgocFZdU+dTkfhITzga0R/92gWSijY9Q9kRw9zrD5eWk
	 PDKkW90pmYE57JjTUDKoCm2VJf1RqbxJ3jv4SY+/Rk2AzHchyjBrMWiMck0osiNhuoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793029565;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Organization:Content-Transfer-Encoding;
	bh=h0fx31x6gaF+8787Z73S/7lRDFQWwzYnD/urzHGXw/o=;
	b=5Kfd1FLi1LupCpgyzFsEyIuBii5F42o1e3nh4MFY2c9hLe0vHiDIlZbS5NLdIwhico+l
	 TinVAryRwxZpYcbvLgvo4NoklK7+ZD48Fhnwl6M4AEVsbo3bfTGdcE86Yp7q1pXxA4W1N
	 oddlwEpJuCuQyasM7ITx8Dg/TTmmagPKknrebGAwoS7NPireOl9+CwAfxrUdBRqBE+aYc
	 JcCDrm9K14vHANk/sI1PUZxxvwF9lgrK6eR+iI46hwwU4eYbN83AGYrk9tNzWcSQzgFT7
	 24x/6jixMjzQGfhAGO8QM2gEr/WLomYKha0QBLQu8kcQywxbxP1OTQYmn+sa2Q9U22w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aSaCizNg;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C590F606A32E;
	Mon, 26 Oct 2026 15:46:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C590F606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aSaCizNg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793029565; x=1824565565;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yR3pp0eTp1CaPWvhXx9uOIKYRXzm/jqa7VinEVixpYY=;
  b=aSaCizNgJHfRFwNEWx3pqT0AbVvFwJk0pnAtC6ssSVZwSidAHF3zC3GH
   uNDrL95gEeNTmGtUkOgx8o+JqkWoKcQBZcz89NQD8mjBC8Bsw7WvurxQ6
   RR+tfHHmE935HZ4ggVNYB3o2wjOQLtVwnWNbjDTXEG3anxZf02akwteNn
   a6TbIQg/uV3BEelvyiJ3qkWAYUwBnwADSdfFITZy4Sfg8D3DQpnUgQGds
   CLvnVvr9YHDFepGBXrIIdfkwmh4g+68GpE+hnmy9ssBLHTS737ZRf+/Hd
   yVb5jTcOaK/7KZ8ncwqmfKfg7qR35bJs5giqFxwgwHx1bTL+0/v7nSzUS
   Q==;
X-CSE-ConnectionGUID: wy2/eAo8SkaLuZ/TFmOl8g==
X-CSE-MsgGUID: 4u34bqBTRcaRHKzyOKtnAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1730856"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1730856"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 08:46:05 -0700
X-CSE-ConnectionGUID: pr2HmqE+RZCiRm7uo46Bmg==
X-CSE-MsgGUID: nLAGilQ5TdGJTIqLlLOOdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="4369360"
Received: from gklab-103a-129.igk.intel.com ([10.91.103.129])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 08:46:01 -0700
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
	maciej.lawniczak@intel.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 1/3] dt-bindings: arm: aspeed: Add Intel AVCRP and JNCRP boards
Date: Mon, 26 Oct 2026 17:40:28 +0100
Message-ID: <36281bba6f86d9e0ce22025487a0538bdcda921e.1792749922.git.dawid.glazik@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1792749922.git.dawid.glazik@linux.intel.com>
References: <cover.1792749922.git.dawid.glazik@linux.intel.com>
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

Add compatible strings for the Intel AVCRP and JNCRP BMC boards.

Signed-off-by: Dawid Glazik <dawid.glazik@linux.intel.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
v4:
 - Rebased onto aspeed/arm/dt of bmc/linux.git, no other changes
v2:
 - Squash the separate AVCRP and JNCRP commits from v1 into a single
   commit, since the changes are small and closely related
 - Fix compatible string ordering so the new entries stay in
   alphabetical order within the enum
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index b7e70868ebd8..61616a9754a4 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -110,6 +110,8 @@ properties:
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

