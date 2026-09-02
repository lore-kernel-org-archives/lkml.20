Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2EBC3DFC80;
	Wed,  2 Sep 2026 20:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.75
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788379516; cv=none; b=QErgsuVn+RPtQUG3XUD3tJYcjU22f7zDq41sruykibpVE2qayLr617Y2CxtctGWsdMyPJxK5rSe+xNEiTwFzik3jDMl0xSNSHyuyLZhTJ4wdbUxX2RRBGlRVED4ahZCGdyiAVbQQGyDTC1WZxpgH3UW/Wf9wwum+JMpNxu2DYQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788379516; c=relaxed/simple;
	bh=y167VXCve5MBLfg0d7ITpbQX+Xb6zt5SoQaSkv1x0MU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pSdfPgFkVk2h14kUaSVzMOPVwKhLLRx2B5kon48wbQuXflRPTnUsXpP8wFsCfOq9J5TsWeuLlSJ+yJY1IwdgTO8b3K+ihXNkXUt9UKedy8mDwKk/Q2uwabVUZi5BIy6TPpFi6caTYHFt2wIfzTii6kDzc3LEwtdflBsJ5bcuNcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=themurphys.eu; spf=pass smtp.mailfrom=themurphys.eu; dkim=pass (2048-bit key) header.d=themurphys.eu header.i=christian@themurphys.eu header.b=T1fa72Xl; arc=none smtp.client-ip=217.72.192.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=themurphys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=themurphys.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=themurphys.eu header.i=christian@themurphys.eu header.b="T1fa72Xl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themurphys.eu;
	s=s1-ionos; t=1788379505; x=1788984305; i=christian@themurphys.eu;
	bh=y167VXCve5MBLfg0d7ITpbQX+Xb6zt5SoQaSkv1x0MU=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=T1fa72XloMrxd1MfsgvYUgiBme+P502aPRl5QYsfuEyJ/+z5hwOGleSwrHi6ivNa
	 r4qtSROajKn4JfWddmC4ogrhFVF4dzBcYNoCcYZXNBpe9zcL2JhmhySKzHN3BUso/
	 pqmbj3snIpb+WpQisEchgyeOzqghqsOs67vVE+G6GkAZqbDL2OAw4Le5EncZB8bJQ
	 RvNwPRuApIBkr50paIaZBljHHWiSRogLykuGcgh7FF7oYbBtKg8zm4BXarzwNys3y
	 8rH81GZqVfmzWWkXZI7Y3FnQiHZ9LrpGFzcvzKJeHPWPBsupLbiSNOEPE7zZNcSjL
	 RY8rRwQeYu0Eq8layg==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from client.hidden.invalid by mrelayeu.kundenserver.de (mreue106
 [213.165.67.119]) with ESMTPSA (Nemesis) id 1MBmDy-1x9VQ40cyC-007DMR; Wed, 02
 Sep 2026 21:51:20 +0200
From: Christian Murphy <christian@themurphys.eu>
To: sakari.ailus@linux.intel.com
Cc: linux-media@vger.kernel.org,
	hpa@redhat.com,
	mchehab@kernel.org,
	tarang.raval@siliconsignals.io,
	jai.luthra@ideasonboard.com,
	linux-kernel@vger.kernel.org,
	antti.laakso@linux.intel.com
Subject: Re: [PATCH] media: i2c: imx471: Fix pixel rate and line length
Date: Wed,  2 Sep 2026 20:51:14 +0100
Message-ID: <20260902195114.9983-1-christian@themurphys.eu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <apVBljHkHhjcodTX@kekkonen.localdomain>
References: <20260830173345.15886-1-christian@themurphys.eu> <apVBljHkHhjcodTX@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:RiXqcF5MhGCMLtYj4h1r3A7n3tS3JGJyYF7a3/nzgkOzQJ32L+C
 7hFnXS9Bbu1f/XR80h/tCWTx6pPX5XYbGmufRe2wx7jeQHDawy3rWeOMtIlqJK/NWrSxbLp
 xuFbhOJg6G4ETZmHqh6TBe3BKV7bMXETmFwy/CH6D6mKF44bZCmom8F8R3gBsdJm8y0kWdB
 wbO1KlFzvyQ/YqYeMCqjg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:inx8IODHVxQ=;BuHpiqm4OCEQJ3NEyFMwDHlMtB4
 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

Hi Sakari,

Thanks for the review.

On Mon, Aug 31, 2026 at 11:55:50AM +0300, Sakari Ailus wrote:
> Interestingly, 2328 would appear to be a seemigly valid value.
>
> Cc Antti.

I believe it was inherited from Intel's out-of-tree imx471 driver, which
has the same .llp = 2328 but writes LINE_LENGTH_PCK 2560 in its register
list; the mainline list dropped that write. I didn't try writing 2328,
as it would make the line 6.01 us, below the 12.05 us a 1928-pixel RAW10
line takes on four lanes at 200 MHz. Happy to probe it if that's useful.

> Can you calculate the value instead, please?

Done in v2:
https://lore.kernel.org/linux-media/ede568ada4304d2dc92cd43986fc07aa68628154.1788377269.git.christian@themurphys.eu/

Kind regards,

Christian
