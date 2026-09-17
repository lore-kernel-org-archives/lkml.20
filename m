Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B034AAC7E
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 09:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789637905; cv=none; b=prALKsKEo9A0uaUAjOuU/baAV0jMc8qpuIYqsT3pMaFl5qExlxLACkbfkOEIX7fqRtRZ6pbmSHOROI+OAkg0Exryw4DgmghTZV0zAq2+RRGTQGrM6gkYR5Ttz2lZtjM3wovL3IwJD7aEvtM9fMaNXeeIGCXe1XbVLGiPZvqj89g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789637905; c=relaxed/simple;
	bh=9BoQp32VbL34HyAkXTK0D8OJoPnHLTKddV+GK399Tes=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=P5JzVdyMwgcXDmyN65kn3pFKyQ+yN5WxAi5BgN+/LIp4Db5h3c9TCuTeBMhQaZkVL2+e606t9tKlv8eEHqRPU94WlTB3vE2rh4R2qfUHz4n0tXVXk6S9DbA4RksTYWgK+xligCROxv5Kp9JPmAS+mxjLGWUKqstX7lV/lUh3ADY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=lWc/V9YL; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="lWc/V9YL"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B2A67C5CD70
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 09:38:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 600165FAA3;
	Thu, 17 Sep 2026 09:38:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DCA4E11C7B06C;
	Thu, 17 Sep 2026 11:37:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789637881; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=9BoQp32VbL34HyAkXTK0D8OJoPnHLTKddV+GK399Tes=;
	b=lWc/V9YL0jaLL0SCRUX02HUb+kIVcyWPnrvt7wjbMK/XJL1PB0OpTJItE7qzs6tLZR+pA5
	LPIEt9SlHpjGCZkUBgW5i2sz8idZY8aadPgrsfUtaZyxli3SuwExejGpNjY3RxfXgvvQZq
	LMZfoFowPEzfGwjXnjTtfmSWA/PxZL+w4EszJzgnUaOy+dTBdf/xJcSueXi5aqh4RFcsCL
	mjywjOzxFoj+Tygp7bI1GEj2LOhDu+tRD5EMfeJRIVWApxX5T/MPvBAjISVOKWEdSlNK+w
	TUb0DvpWqBfrbcm5g+2NoKVqHDqSqUhdCW34CVcuy7sByERfF+mbSpJlS4y+eQ==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 17 Sep 2026 11:37:58 +0200
Message-Id: <DLHHOJDRLN10.1EE7MLXHW9A22@bootlin.com>
To: "Vineeth Karumanchi" <vineeth.karumanchi@amd.com>,
 <conor.dooley@microchip.com>, <andrew+netdev@lunn.ch>,
 <davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
 <pabeni@redhat.com>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Subject: Re: [PATCH net-next v2 1/4] net: macb: Rename MACB_CAPS_QBV to
 MACB_CAPS_TC
Cc: <git@amd.com>, <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260909142056.1433875-1-vineeth.karumanchi@amd.com>
 <20260909142056.1433875-2-vineeth.karumanchi@amd.com>
In-Reply-To: <20260909142056.1433875-2-vineeth.karumanchi@amd.com>
X-Last-TLS-Session-Version: TLSv1.3

Hello Vineeth,

On Wed Sep 9, 2026 at 4:20 PM CEST, Vineeth Karumanchi wrote:
> The MACB_CAPS_QBV capability flag was originally introduced to
> gate TAPRIO/QBV support. However, GEM IP versions that support
> QBV also implement multiple TSN clauses.
>
> Replace this with a generic capability flag that can be reused
> by other TSN features. Rename MACB_CAPS_QBV to MACB_CAPS_TC to
> better reflect its role as a general traffic-class offload capability.
>
> The supported TSN clauses are handled through macb_setup_tc().
>
> Signed-off-by: Vineeth Karumanchi <vineeth.karumanchi@amd.com>

As you pointed out in the past we cannot runtime detect because DCFG1
changes its bitfield layout across IPs... That could be useful info in
the commit message.

Reviewed-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>

Thanks,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

