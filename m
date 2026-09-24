Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E15113BBA1A
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 18:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790275562; cv=none; b=ErAv+EBrxEf9nfk/UT5/gJp7eBbnmfM5hmjfVbD1fkQ+DZ8A3OKcfOPjLa+Eg4TaFSvPas6o+0gIzDHFbMnp9WGniVM/BD1rxqheU4pZVlcQrSqQ9TZ45BomJWBhBc62Ae37BFrUkOiyA1geUv+jBkkWYth2XLJhdxvn3xquvIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790275562; c=relaxed/simple;
	bh=dmvalwRzgd31HZbVS0ohNNLBmDO5DXkzoU3ybtLzdU4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=quGZFq1xPIjILxPZIvP0zWVS9ju7oovjXNcSG/Hp9dCrmo4Qll3zGQzr11tQyoak2/npgpvfVv1tgiJpMBh4iuE77qtT4KLE7RisKzQNFVNcVtEalLcpI37uzwlNixA/tyffhwMc9NGPr2v9V/rIWlokt4NPXIXpVLU6SeppKhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d+XDhMiK; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d+XDhMiK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790275554; x=1821811554;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=dmvalwRzgd31HZbVS0ohNNLBmDO5DXkzoU3ybtLzdU4=;
  b=d+XDhMiKHRgbjIrz0PVb2ozmLG00qHBtuvsJSlm7f2VTORBPA3CTKQ2X
   r8r2QP5Kx6E237IX3YwVmnrVaI7U3J/Jz1K/6Dw1/9RWULdkkO0dPilZt
   0GRJM0wzowEBazpEuEUQaQqiQ3O/aRPioelPvnzCyokQ5V7FXz97sCzvx
   ZwvZAA/aNOoHXjeB0Ib0hiwcBPfXU2SbbwQWmCWVoG3tR5Xh5NCn4eCfh
   K0uoO//WIkoPeSxNiueEtpJk2H012fPgD8CLxR14d/3ThD+/wugw9BO11
   KwueiVBIQ2DVosK4ZuKr5Bsngkdtda6YpsxrE9nDe44nArAa8J5P4q8tJ
   Q==;
X-CSE-ConnectionGUID: w7mVTLuiSLqJWrMRX4xXqQ==
X-CSE-MsgGUID: gZ2HJHaFRZSYvRkSQCUZAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="91078248"
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="91078248"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 11:45:44 -0700
X-CSE-ConnectionGUID: bIySOvI4R8a6OE9QNtinDA==
X-CSE-MsgGUID: ugA9mTRDSz6u/tqyW4VW8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="273610081"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa007.fm.intel.com with ESMTP; 24 Sep 2026 11:45:42 -0700
Received: from black.igk.intel.com (localhost [IPv6:::1])
	by black.igk.intel.com (Postfix) with ESMTP id 76F4B98;
	Thu, 24 Sep 2026 20:45:41 +0200 (CEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Willy Tarreau <willy@haproxy.com>, 
 Ksenija Stanojevic <ksenija.stanojevic@gmail.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, Kees Cook <kees@kernel.org>, 
 Peng Fan <peng.fan@nxp.com>, Miles Krause <mileskrause5200@gmail.com>, 
 "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: linux-kernel@vger.kernel.org
In-Reply-To: <20260918141557.3022820-1-peng.fan@oss.nxp.com>
References: <20260918141557.3022820-1-peng.fan@oss.nxp.com>
Subject: Re: [PATCH] auxdisplay: panel: use assign_bit() where applicable
Message-Id: <179027554147.857045.3111226948470767362.b4-ty@b4>
Date: Thu, 24 Sep 2026 20:45:41 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0


On Fri, 18 Sep 2026 22:15:53 +0800, Peng Fan (OSS) wrote:
> Convert open-coded if/else with set_bit/clear_bit to the assign_bit API.

Applied, thanks!

[1/1] auxdisplay: panel: use assign_bit() where applicable
      commit: ce7b04fb41e7dc1ab83732cbfde1cac860add7a8

Best regards,
-- 
With Best Regards,
Andy Shevchenko




