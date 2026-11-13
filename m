Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.246.68.102
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794568247;
	b=QLWxwd5Xh7M7hCVk350LPleOP6AXMvA+hb3VHjYpjU0SEBFhGIZFwtqgXlEluQsLx2AB
	 RpshgALI94Q/3OPJtmFhs/C2vXJtNix1UT0t6Nxh5jXnKY36nZOYl60PTwie/TuMeS39X
	 dy4V652twJLdJnuvjgJUW/5qtKsKRHHamhr6SCYb0sH4+mznMfeIaFIsg2GR6SdLJPrF7
	 4Fogrkn1V6WSBN3KMJ2i4b0FGMA/68bJ+2lf7zd/LbSpG4Z4Jtl0krWT2AT104wlGh04r
	 YqOpEwnaduPUOtrq573iT0lO/x2+Q2r7U5e5rxqrNyFpcoD19hs1Mj6fFjzc5oD8hEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794568247;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=Vz8zzO+pbP/JF+uMRgI6d/03y9BDYJeIS3sGQ4sLnXE=;
	b=3aCAvE1esnaohWYSNbB1u90BLytQnIePaKnp6Sm+J1b/0MvyMc/C8gBc2sHG6glkZPkL
	 8mTPQqMS3skgklFgX4dbPxX5hJGsyq+Iey5E+y73dWnncqjXdb/Vhi1j4SUIViKGw5J+d
	 8vqRGpUpL+fYKEvzOWrZdZMGjLbkTRMTaORrkOB0RWkwjmmB7QkCSCHDM8POBdpnP6jc/
	 xfjtzrzb7btKPlomJb/ugMLAjokrDsqwsp4qniDRmnVj+N9PaF3TpeI8IqQJYjuSbgc+x
	 /ssrRD5m/mZUJOxNBE8VSgCYQ8aKG/qNi3KU34vIFac+Wd8uP6cIH9E0wQYakImZakQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.com;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=LDtKvm6+;
	arc=none smtp.remote-ip=44.246.68.102
Received: from pdx-out-003.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-003.esa.us-west-2.outbound.mail-perimeter.amazon.com [44.246.68.102])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 934B5606A32D
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:10:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 934B5606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=LDtKvm6+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1794568247; x=1826104247;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Vz8zzO+pbP/JF+uMRgI6d/03y9BDYJeIS3sGQ4sLnXE=;
  b=LDtKvm6+nLQAxqMiEPHFC4V24s/7c3OtbSyDC2VWhxd4iczybPbHTItj
   aUfZBeM04UZJIUqY5VDo8gmxTwDrJsXwt7qji6HyYxkoC0EQrPuy6HdFg
   a+3fPC4wEkDqkR2BaFO2QICo+U6QAexSd6yH74JnvkOtnd3F18lZwUWvf
   n6uUquiRSfI2NREAbzzySd05PPpm6o2Lj9evNwoh3hygjiwC7PLDfeOux
   NBLfWZXqccVg0OeUa/jXkj/Sao9BF9jRXj2g6VhSCSFocim7Y2s4pYZtG
   ABmfNSwI3sj2n6BVhe8SxUjx10ELaEnlrZOEeBVhcxHUJZ9lcTfNHuqPA
   Q==;
X-CSE-ConnectionGUID: oqopAPSBRqeYfv1yJqUr0w==
X-CSE-MsgGUID: o1AV+pPjRYKOVIH9i6g3zQ==
X-IronPort-AV: E=Sophos;i="6.27,211,1787011200"; 
   d="scan'208";a="33792984"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-003.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 11:10:45 +0000
Received: from EX19MTAUWA001.ant.amazon.com [205.251.233.236:31504]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.31.142:2525] with esmtp (Farcaster)
 id 092c8ae4-432b-4bb3-a76b-b5941c747ab0; Fri, 13 Nov 2026 11:10:45 +0000 (UTC)
X-Farcaster-Flow-ID: 092c8ae4-432b-4bb3-a76b-b5941c747ab0
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.218) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Fri, 13 Nov 2026 11:10:44 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56; Fri, 13 Nov 2026
 11:10:43 +0000
From: Eliav Farber <farbere@amazon.com>
To: Andrew Morton <akpm@linux-foundation.org>
CC: Bradley Morgan <brads@mainlining.org>, <linux-kernel@vger.kernel.org>,
	Eliav Farber <farbere@amazon.com>
Subject: Re: [PATCH v6 6/7] reboot: use devm_blocking_notifier_chain_register()
Date: Fri, 13 Nov 2026 11:10:39 +0000
Message-ID: <20261113111039.35778-1-farbere@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261113104459.35839-2-farbere@amazon.com>
References: <20261113104459.35839-2-farbere@amazon.com>
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
Content-Type: text/plain
X-ClientProxiedBy: EX19D031UWA001.ant.amazon.com (10.13.139.88) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

This patch is not in the series thread. My mail server refused the second
half of the series with a submission rate limit, and the resend went out
unthreaded, so 5/7, 6/7 and 7/7 are rooted at 5/7 instead of under the cover
letter.

The cover letter and patches 1/7 to 4/7 are here:

  0/7 https://lore.kernel.org/all/20261113104218.32566-1-farbere@amazon.com/

All seven patches were delivered, so I am not resending them. Sorry for the
split thread.

--
Thanks, Eliav
