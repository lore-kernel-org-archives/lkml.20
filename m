Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794821878;
	b=UaFrbNqRbqQ+CJ1hhjSxx/ew220n9MR9PnhxlMzFXWC6RkO2zULSL3r4WsvAZj4NoLHg
	 y7pSlHvRfpY04OqMP12RtJJt+kYHYNEgobMQyWeQp01Nj81VTVMjjOID/kxpvTKdXMAlu
	 d83K0Nq/ej+1SNhcTbQLKzVN3xvgH1IkeAoOCRsxmmgpytk7kOmYBQeCQv26pGd+yJcgO
	 KtIe/vdBNHDERxfGigypeOvyV+D6ptFJrrUPxmtTipif7b2h7mHBgBdxmFAifKTzjsxvr
	 OL9nVKlyZ+Qjpm2PT5zbZOTAhwNzW0dvsTaO5pgZrSMyaegdZld2stM+W55dqbSpirA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794821878;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:
	 Organization:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=poN85rMe5QId4iMdcTQDfelt0obOkpK/+0hyaRvyRto=;
	b=ZkVQHtEhTxsrf85DgN0mJfArrKdGCEw3aeupvR0SQgJPgF5Sx9tkqm/f/DYV4rimEcGX
	 sngIx/oabPmMyjgL9jWCSHogHtaqrHynsBRZ0x0nDAcsVpefG0hNNylEKrUCwxx1RMlir
	 KgekVd4X/b4qvLdvuOD332KaYgWzTdfIbDqpAaMIf8lAUniGjI9UwyzCDD9PV/7Y6OZWC
	 83kI2adueih6bksVduc1rFTSuAwuAZuvagVyH5SdHL+t3NSAWPFdQpWbBC2z9MsXZz/KP
	 txPvNhRI0707EwLu53sPJzWiaIgmujykQQPoYADRvVkGn4LJNB9n5SGaGY8xIGHEovQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bcXXJX7X;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E61606A332;
	Mon, 16 Nov 2026 09:37:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0E61606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bcXXJX7X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794821878; x=1826357878;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=l7k1anJIvefmLqrhsIOUwvRFYKe0gu0pxDR2v70O7cQ=;
  b=bcXXJX7Xt9kTF/WrIylI046koXRjWbqEQTJn/2li8IQNzWhEFvdBMXcj
   xBv6t1xSG7olqp2iBgZwh8ExVOLkYm4ckx7d2Ow2Dl0gKQQdQTo9SuCls
   CSlKoOGMRj2Gs/UQ7hre2bROa1/7GYWwqUU4hDXRBJiLv4SvgtbYtHW8o
   QrVz2dbHPsMBMFL9BemdO/MU7PAqFbj9Bt8EhRlTeJxQtkbO7BPISTmJX
   vNB3XFPG6R2bPZHxa7bIEJVeZPzVD8PbVbQg2Jb0hEQY2An8x1PdLvxYp
   vvMINSDOtbi2gP7ftfQEcJGsIQVhFZqK07JJwiY3FXRwV7edLoAdkWGZQ
   g==;
X-CSE-ConnectionGUID: xi5qtQ2vRXuFqSgPLxm6qg==
X-CSE-MsgGUID: V3vSlVxyTd20pNi/q/EySA==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3588862"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3588862"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 01:37:57 -0800
X-CSE-ConnectionGUID: 3lJaHCfBTMGuwWe4rRCjhw==
X-CSE-MsgGUID: Sy2sEo+0RRCKyEIAbghp+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="9663769"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.87])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 01:37:55 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 83E4C121B5D;
	Mon, 16 Nov 2026 11:37:59 +0200 (EET)
Date: Mon, 16 Nov 2026 11:37:59 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: BRETSCHNEIDER Max <max.bretschneider@leica-geosystems.com>
Cc: Jimmy Su <jimmy.su@intel.com>, Matthias Fend <matthias.fend@emfend.at>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] media: i2c: ov08d10: add get_selection support
Message-ID: <avrO9yQ0-xu91gAO@kekkonen.localdomain>
References: <20261011-ov08d10-get-selection-v1-1-5debe6436765@leica-geosystems.com>
 <asywCh3X0yJVcxRd@kekkonen.localdomain>
 <GV1PR06MB83698BCD22508BA5DF19A0A1D3642@GV1PR06MB8369.eurprd06.prod.outlook.com>
 <GV2PR06MB9469356C7B3523BDEAFE11E453D37E2@GV2PR06MB946935.eurprd06.prod.outlook.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <GV2PR06MB9469356C7B3523BDEAFE11E453D37E2@GV2PR06MB946935.eurprd06.prod.outlook.com>

Hi Max,

On Sat, Nov 14, 2026 at 06:40:15PM +0000, BRETSCHNEIDER Max wrote:
> Hi Sakari,
> 
> > Can you test on a newer kernel? That being said, there are unlikely to be
> > issues without that, but it's better to be sure.
> 
> I have now tested this on media/next (7.4.0-rc1, bf6c63ecc, from 13.11.2026) 
> on the same hardware. The series applies cleanly, and get_selection, the 
> per-mode crop, the flip-dependent media bus code and v4l2-compliance all 
> behave the same as on 6.16.12. v4l2-compliance reports 52/52 on the sensor 
> subdev with no failures, and dmesg is clean.

Thanks for testing. I've picked the patches to my tree and I'll push them
to Media CI for merging soonish.

-- 
Regards,

Sakari Ailus
