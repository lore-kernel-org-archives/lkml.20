Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793703692;
	b=OBmRIY8FyWoe/OYTOXEkdJK50sJMMixmjvb0PZWolTEXv/ZwbaAzImiQGzNeSrA1tVRD
	 A1mQCgaRG2h+8Q88EItrcKD3LBY7O6K81sjCOvRcUNVoF/PSBILG2zWJJ+k6kp7pgE6BI
	 zLvxy4wXjZiZaV4K1PL08aVJmVCM1yVD5/2tyPTV4XFmDv7bNRqXvdUgIjmgcJ2WWw8V1
	 +YE9qhCkiZOAkITko0PcZndZKOrKmJYRxsbmPjT+gz1esdv1GoqMeJFYFKP3fzWrdCV5H
	 NXdrG3h9M6gqvfRHE722s1oQaYiR6EdyIoky3E+SXueaaLAAGJN9Yce17nxqi2iXP0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793703692;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=8a26RZ//Qtg7PWOhT+gYNdz+nzXL3hIE2ryE6muV1To=;
	b=iKIgzP65eRh5mwtfTrilANAy1V2QVY0/BYxmO2kITI0BcjQw32CiMobYZsGAE2MkNhQ1
	 HC9aKGL6QWSnhhPExQedUDffFyFlmF3D/+6q1drYGVJk9toSvMqdiV5cdlks0smLBYYrN
	 Ul+CX/n2YkHmct04WqLnMy6OQZ/C0DHKv2tbwgOWmd9JM6tPaLWtsctI1s8bLnPTzI5t8
	 2WYtTpF7YHFkVCTBPfIX/sVHexFN102IaYucb914dABsuzH1mETxR9akG6UH3UU5nYuAJ
	 p29gajaSDwm7XMMyYE+nBqCX/nUDHsmOHVPi+OKh0eu792OnQ09RSzhdmXpWmXdf64w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Jz5uDUgG;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A25A2606A806;
	Tue,  3 Nov 2026 11:01:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A25A2606A806
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Jz5uDUgG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793703692; x=1825239692;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=isPyd43z5OJvaqRmypRcgJb/3JEcg26FGP9GNU8Jnxg=;
  b=Jz5uDUgGDHIzX9TQrFvoLaebBVS82yikNne56wDNoWQnd/Na88JViFoh
   Gc70svTFs1z/RyNEN9ya/JXPyYteKsNaAzZUiubz9WAzldkgrnJsbmYFp
   i56MfnPVCZ+82+oZf6uQy1zwPEX0f6NaNBmiPS3rCMWfwsvOm8WZzT0Xh
   y9albzXQ4zD8bXchacEwgCbPeMwGmswdWgxS3oV0H2v0XlNFbbhiwXoCt
   CNLKYEJNCgV+chJR9P5+YQmTDm7Ji34zIrPZM3UA9BWtqSeScJdSeRnul
   6gC8uuMbPuHQsCO0fH5BSCunwL8Ra1WkUsFLzd/mWOJ45l/LTq/bZXfEd
   g==;
X-CSE-ConnectionGUID: CT+6oFjbQGKdN4WB8LbxMw==
X-CSE-MsgGUID: oXTR7PGlRXuWb4Ubx2u2hw==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2435497"
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="2435497"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 03:01:31 -0800
X-CSE-ConnectionGUID: /lpbiyi9SyyhftS+tJ0+Pg==
X-CSE-MsgGUID: DTOZTd/bRieydkAcc32OPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="6720677"
Received: from slindbla-desk.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.245.174])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 03:01:28 -0800
Date: Tue, 3 Nov 2026 12:01:19 +0100
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Quentin Schulz <foss+kernel@0leil.net>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Michael Riesch <michael.riesch@collabora.com>, Heiko Stuebner <heiko@sntech.de>, 
	Bryan O'Donoghue <bod@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [PATCH v2 3/3] media: synopsys: csi2rx: add support for Y8 and
 Y10 bus formats
Message-ID: <aum-yLwvGgNiTmP5@mdjait-mobl>
References: <20261102-v4l-y8-y10-csi-vicap-v2-0-0a4149d96dae@cherry.de>
 <20261102-v4l-y8-y10-csi-vicap-v2-3-0a4149d96dae@cherry.de>
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
In-Reply-To: <20261102-v4l-y8-y10-csi-vicap-v2-3-0a4149d96dae@cherry.de>

Hello Quentin,

Thank you for the patch!

On Mon, Nov 02, 2026 at 09:22:44PM +0100, Quentin Schulz wrote:
> From: Quentin Schulz <quentin.schulz@cherry.de>
> 
> The OV9282 camera sensor driver can output in those two formats, but the
> CSI2 RX controller driver didn't advertise support for them yet.
> 
> Suggested-by: Michael Riesch <michael.riesch@collabora.com>
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>

Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>

--
Kind Regards,
Mehdi Djait 
