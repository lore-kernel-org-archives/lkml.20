Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793813596;
	b=xi+6CgOuJcigi5G05aT9Uis/kNKNQjyoyhovkg/4L3nz8Tvrkt5BJEaALwtGVczorZ7v
	 2V4ac0E8O84fjT5+rKHTbRagP+CC+MRmh2NQOs19iGBaRiPP8EDwzuJi0IOAQ3jr/x4rH
	 KKvD+xdwXwgyJgYhLEtUfzSKfQIvLO+QdkHJIdMXmxwhO4i4Q7an7kjTBehyO1laC+UBT
	 WqGe7bl3cwg05hZcL6KMWPEB0YaXBmkyQ1h/VAYU+UJ1SruMUwBVV//PRFC7GVHGZbl+t
	 IprC3/ZzQV6UYe4D+LnodivMB/kXLM7D0kQFs2yMtQCwEAY2/OE7mql1p7uEb1iayEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793813596;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-MBO-RS-ID:X-MBO-RS-META;
	bh=gnhT14pGuY7+Q85NvUB4EwpTqtsL/nIK1hYQceAmQ6E=;
	b=FI3KVl5CA0JFuEMAaxjxFULM7vcsIDB0SnnOZX1CBqdoXZMWDWLUS5CGq9SxxoTWSHea
	 jHOqRdA1WVm9u7igcbWNIISvqnaLHkYtH3rBjroxTP3I6bas/FQ+jfm4apOq5D3C4Ao8j
	 8RaWyV/RmgphOW8Z9EgdrKKpYz90+jwrWUiocDkLY1ByyTqXu8NK8IR/+ZtDD0ZhnyIe/
	 VlrbcYxaWHfaKRcfr5axYdgAjC1xw/xLv9xBm4wLgMWTMhjP/vC63Qk5Im4GVN+5gPHKb
	 7MSR+zuALT0NVz9glw2PdBias64s1QVqeVdqISR2m6Lfl67AbVHg6c32MRoZx0d1aTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mailbox.org;
	spf=pass smtp.mailfrom=mailbox.org;
	dkim=pass header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=kpvFanhs;
	arc=none smtp.remote-ip=80.241.56.171
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FEDE606A33A;
	Wed,  4 Nov 2026 17:33:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FEDE606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=kpvFanhs
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4jKXbC3lF5zMlZK;
	Wed, 04 Nov 2026 18:33:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1793813591;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gnhT14pGuY7+Q85NvUB4EwpTqtsL/nIK1hYQceAmQ6E=;
	b=kpvFanhsq/QMSmhppRuZGwuvVJPe0Cv9BiaXGITx9b2PgJbgPW0TENTrJsGFQe8qf7pn5z
	LF/dn3UBy5dJ8jz1toMQCUOhbyiUeMk0zw/UHDnqeuU/S59xdtd5Ccu/eZ4f5HkNGOSGRO
	csYwokl+v4vNJC8NH/aIlwad5KFWu3U67f5nH9oc/FwR/AB+1LSxObjaJpeYD0KxCAwIjB
	Er4zw28F+Dw0zQ+GAdXOlhi0bTlDanPpN4SGdJ5i5N9/ONMGgFBH3K8VP4SgpAf+bfrm2/
	mRtz9W6/5C3sOATtFszqyHzWkZRpr3rX8szZtgKqr4Hp7xH6/DypKOj4BkimPw==
From: Gabriele Gamba <gabriele.gamba@mailbox.org>
To: Lukas Larson <lukaslarson@gmail.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Gabriele Gamba <gabriele.gamba@mailbox.org>
Subject: Re: [PATCH] media: ipu-bridge: Add upside-down sensor quirk for Dell 16 Premium DA16250
Date: Wed,  4 Nov 2026 18:32:51 +0100
Message-ID: <20261104173251.61910-1-gabriele.gamba@mailbox.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20260331190145.11592-1-lukaslarson@gmail.com>
References: <20260331190145.11592-1-lukaslarson@gmail.com>
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
X-MBO-RS-ID: 3dbb15a1879ac26e7a5
X-MBO-RS-META: i9e6jtdbj46jrrc48kkhuzxdfu1pm8jt

Hi,

I can confirm this on a second unit. My Dell 16 Premium reports
"Dell 16 Premium DA16250" as DMI product name; without this entry the
OV02C10 image is upside down, with it the orientation is correct
(tested on 7.2.11).

Mainline currently handles only the "XPS 16 (Dell 16 Premium) DA16250"
spelling. The 14" model is already listed under both names
("XPS 14 (Dell 14 Premium) DA14250" and "Dell 14 Premium DA14250"),
so this patch completes the pair for the 16".

Tested-by: Gabriele Gamba <gabriele.gamba@mailbox.org>

I sent the same change independently on 26 October
(<20261026095326.21615-1-gabriele.gamba@mailbox.org>); please disregard
mine in favour of this one.

Thanks,
Gabriele
