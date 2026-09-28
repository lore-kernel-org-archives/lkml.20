Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch [109.224.244.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C014B3451A9
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 13:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790602367; cv=none; b=ORf9YFtyVE2IAeJlbDTphdEVJ9eW8jxy+l2IZocAjQcNNrIUahNEwtIMQm7va9VtK4pFv+iy8z8enu42TDuZQWtn/sXfAP51qxPkK2Nx3dilwGThp6NYHpSV9YgDx0/6XweMQwMuPm29PCnPikQusddRkiuS95AHXGpBdhvK1wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790602367; c=relaxed/simple;
	bh=CGAMVRg3tP7B9OlUUkR7Ei0uSMQJSzb4c+/3aNPSo7I=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nmckvg/YF9qiCLrNSnERMZEOzHVxfJVd6KL/4f0BUkoK0PMyV0gmGv6YYpRAA98cgenDw1pWjNeOAeu84UqwaWfbKm2xc2D54+ZFeP4tG0AbukgbrPdtJ4bYOwwqjkRnQzsqCzA73cZ+YajPZlRA9upmcDDHT4y+JnhPmXITllY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=Ivz++9x/; arc=none smtp.client-ip=109.224.244.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="Ivz++9x/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1790602358; x=1790861558;
	bh=CGAMVRg3tP7B9OlUUkR7Ei0uSMQJSzb4c+/3aNPSo7I=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Ivz++9x/wCvvkJvTFiwNbGlYJV7LxU1wPzLvdWp00raByIHBMcmZuFZttSYXTepH/
	 YVS52oPZ30OsIyTMFPJmc/WabJ8FIF+UymJm3Ud9eLKfDLhS06v+C+e2ZdNS7TYNbb
	 i3bmwegvTeBBrAP3SrakPOisZMXibWpuOnZcF/OurPWbvCKjhczUkA8GZbrIycqybD
	 5kEw2inBw0BxiiJDsE0QbGH0s2CZ/nStslsgs4cMYRvifMQ5EJG+bnnhAg9hvQm5fx
	 /NiRJjT7TCPx9wQeUzcEBHo+dyoWJVDSFgC5k+pqy5taUmQe7WE9w97vjG6hQNnXtp
	 kviRCVtGSUJ1w==
Date: Mon, 28 Sep 2026 13:32:30 +0000
To: Guenter Roeck <linux@roeck-us.net>
From: Alexei Solcanu <alexei.solcanu@pm.me>
Cc: Cryolitia PukNgae <cryolitia@uniontech.com>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, Antheas Kapenekakis <lkml@antheas.dev>
Subject: Re: [PATCH v2 2/2] hwmon: (gpd-fan) Register both fans on the GPD Win 5
Message-ID: <ae5b3345-37a4-4f5b-8885-9510718b592e@pm.me>
In-Reply-To: <72ea804b-6d62-4f31-985d-4f3f0359b5be@roeck-us.net>
References: <20260926-gpd-fan-duo-auto-v2-0-0a2ea41ee3b5@pm.me> <20260926-gpd-fan-duo-auto-v2-2-0a2ea41ee3b5@pm.me> <72ea804b-6d62-4f31-985d-4f3f0359b5be@roeck-us.net>
Feedback-ID: 211386292:user:proton
X-Pm-Message-ID: b166999f631e7acdc721e3569b07018e18b75708
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 11:05 UTC, Guenter Roeck wrote:
 > Another patch new revision sent as reply of a previous one.

I sent v2 as a new thread with b4, it's not in reply to v1.
v2 includes the original commit from v1 as patch 1/2.
This is my first patch so maybe I'm just reading this wrong.

v1:=20
https://lore.kernel.org/linux-hwmon/20260925-gpd-fan-duo-auto-v1-1-29bb670b=
3331@pm.me/T/
v2:=20
https://lore.kernel.org/linux-hwmon/20260926-gpd-fan-duo-auto-v2-0-0a2ea41e=
e3b5@pm.me/T/

Alexei

