Received: from esa.hc5016-32.iphmx.com (esa.hc5016-32.iphmx.com [207.54.81.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3167651AFC8;
	Thu, 17 Sep 2026 16:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=207.54.81.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789663395; cv=none; b=Eh/UilmCtaTbdwzaiZHVyhQartQc6ixJNZ2oTbYoL0qk4Q2eOuwgx6CxfSAkLb9gdKPuY+PLxMfgzSvV7SM51sbUa0Uj/15u9otTfua/tjLqXBRzcrgfSeXLvv85lbifz8AkbWhSW9ifb7Jvy5PmVFWetffwMOSSQd1XYjQvJ/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789663395; c=relaxed/simple;
	bh=xiQpSRTxxYg4rz3+vPV5z2yPbpfKd0ziGmyWDbunMYU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=M/CB0tVr+0+xGDjWc5bS7Elcva7g28igD5ReFMgMMyb2vKrt6MSSTvuY6MvzMoR8nfW97S+tkVpIoAjJKepY4yTLgUpHWIEap3fJnfEeF65/w/vOqGL2P3npfqVfjhV6gFotlfZTpCx1w2lLl+xksn+8DqjxypFqLi5Hk/Q2tnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=harman.com; spf=pass smtp.mailfrom=harman.com; dkim=pass (2048-bit key) header.d=harman.com header.i=@harman.com header.b=XGq+sDsj; arc=none smtp.client-ip=207.54.81.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=harman.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=harman.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=harman.com header.i=@harman.com header.b="XGq+sDsj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=harman.com; i=@harman.com; q=dns/txt; s=CES-HARMAN1;
  t=1789663393; x=1821199393;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GkiTyptilbJfCS2MwEdpWRze9xAaFquHOTTMlhaWQsY=;
  b=XGq+sDsjnjtfCq0ReuaQytD2aI8ypZMGo61MODVb+zbZyskN9nOPrC6O
   hrCtaceVpnsBW1TBtV0E/7rmkt6AM+XDWBSUG3uPWsbTWtRDAG26q4NXs
   gCnyzBee0s9ocIybWG5GYvBPW1U+wAJO9uFvC4dXcL52GFZivckeF4CgP
   lsBte4GTHLHuE048Xo0nqLKv6UH9v++z7Owul9NQ8gjcYQ4Tgf/RzGu5Z
   Y0LobMcEEb/8sBfSJSo1qhoBUdSQwCj7fsUZ7LqBjFDwCF/o+X82xPpuz
   YUXKgX3SgK2p5ZCG7qHVze+MpxIPwY27cQtKdlA5/giVTvUYAPtc7W+sY
   Q==;
X-CSE-ConnectionGUID: TEa2H403QCyYSQ45FxSRhA==
X-CSE-MsgGUID: X+d/esInRW2Z/k1bCobbPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="120531231"
X-IronPort-AV: E=Sophos;i="6.27,103,1787025600"; 
   d="scan'208";a="120531231"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO INMDWSHYB10.ad.harman.com) ([199.27.113.4])
  by esa5.hc5016-32.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 12:42:02 -0400
Received: from INMDWSHYB10.ad.harman.com (10.92.6.249) by
 INMDWSHYB10.ad.harman.com (10.92.6.249) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 17 Sep 2026 22:12:00 +0530
Received: from awsmblx423bs002.localdomain (10.63.34.68) by
 INMDWSHYB10.ad.harman.com (10.92.6.254) with Microsoft SMTP Server id
 15.2.2562.46 via Frontend Transport; Thu, 17 Sep 2026 22:12:00 +0530
Received: by awsmblx423bs002.localdomain (Postfix, from userid 530975)
	id 0E13A7D7ED; Thu, 17 Sep 2026 16:42:00 +0000 (UTC)
From: Akshay Gujar <Akshay.Gujar@harman.com>
To: <gregkh@linuxfoundation.org>
CC: <Akshay.Gujar@harman.com>, <linux-kernel@vger.kernel.org>,
	<linux-usb@vger.kernel.org>, <naveen.v@harman.com>, <oneukum@suse.com>,
	<stern@rowland.harvard.edu>
Subject: Re: [PATCH v6 0/3] driver core: add enumeration failure uevent helper
Date: Thu, 17 Sep 2026 16:42:00 +0000
Message-ID: <20260917164200.7560-1-Akshay.Gujar@harman.com>
X-Mailer: git-send-email 2.19.0
In-Reply-To: <2026081843-overlook-spokesman-0c68@gregkh>
References: <2026081843-overlook-spokesman-0c68@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Hi Greg, 

Following up on this patch series.

Link to v6 series:
https://lore.kernel.org/all/20260802233108.70950-1-Akshay.Gujar@harman.com/

Please let me know if any further changes are needed.

Thanks,
Akshay
