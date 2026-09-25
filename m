Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 047AB470440
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 07:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790322712; cv=none; b=ErKvHZ8pw6ruhLZRJ1ORATL0DlW/5eKwEVDR2W6qGdBvo5Z8DbKOxsl8+uVM65mvprDRO+MdzXGk9rD8gkwHz5ENQYJbW+GsWvnJmP/UphnsapXBzBzqnK1slikNK6jmMNYOvgqM6/GDMyFdxrBn4884c7H8sQOxzkVDn/ui6hE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790322712; c=relaxed/simple;
	bh=GjpeIY/pG0iyYr5NWnH1XKSCrH0YfSl/S1f/surn4EU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MUXTC/EPrgHTfM4LIrTNZjPOSnJgAIH+3cjWihs590TJK9fkbvVgFCgbOekNdPuejrJSzfuRjY0K/j1WzZy8VZdzoNOdXXM8OToaW94+t4hvfWNDLzmf3QBNHum1G/P4rDSeooOqReypw35Abs9ueu0qqEo1H3gc9kJYCenPQZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=vZCG5JLk; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="vZCG5JLk"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4hrjZn74kzzMlM9;
	Fri, 25 Sep 2026 09:51:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1790322706; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GjpeIY/pG0iyYr5NWnH1XKSCrH0YfSl/S1f/surn4EU=;
	b=vZCG5JLkHEX1PNzOIaK9ft628SrijD+0AzYbRyqzLc7b3Mf+xCGIAGZ1yrtNgDoOmO1ZT5
	7eu0qA8UbgNYLqqVgVRV6Ph5BAhxKsaoWZBESI1G9y0jYfxKRKB1+Dsg23Vr8HxVcjCkFm
	/Zh3LEv2POQdRb/EiaC8Y22gLoj6OhzDIky6TljqWe5UMU0Azuf32KT40mP2SijPqPvY5W
	OY988CYe4+ZfnM8HostD7qPD0KivcSjHLPZI9bWtSa+aOoujej6oWmy1aQd6/bWXvQ0cwM
	26xcj37OcwWb8/iHoKeUxAJxyqvsm3kD4t6lIs29NeRBVSF3eRhyeVT7q+KH9Q==
Message-ID: <c74e694483833b6eb1fa56228e67a9fdf9f1ab6c.camel@mailbox.org>
Subject: Re: [PATCH] drm/sched: Remove forgotten header
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Marco Pagani <marco.pagani@linux.dev>, Philipp Stanner
 <phasta@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Matthew
 Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard	
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
	 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Date: Fri, 25 Sep 2026 09:51:42 +0200
In-Reply-To: <50b4b64d-7948-418b-9f3e-9d841fc426a3@linux.dev>
References: <20260625104903.1713213-2-phasta@kernel.org>
	 <50b4b64d-7948-418b-9f3e-9d841fc426a3@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-ID: a77a23f4c045a7a67a9
X-MBO-RS-META: cnzc14fysmehxmxbtp16dpdx4p7htn9t

On Thu, 2026-09-24 at 12:08 +0200, Marco Pagani wrote:
>=20
>=20
> On 25/06/2026 12:49, Philipp Stanner wrote:
> > sched_main.c still contains the spsc queue header, which is not needed
> > anymore in that file.
> >=20
> > Remove the surplus header import.
> >=20
> > Signed-off-by: Philipp Stanner <phasta@kernel.org>
>=20
> Reviewed-by: Marco Pagani <marco.pagani@linux.dev>

Thx Marco. Pushed it now

P.
