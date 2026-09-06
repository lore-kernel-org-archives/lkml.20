Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A14635DA41
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 10:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788689430; cv=none; b=FhAetk52iBko05j1nAJ2uYmkjt76llOeIHbGDpnK7sVaMz7wiueXxthmyZtAF3U7PVY/4ZMruL4oNZangl50biUyBF8mJ+RqCilSUWzcDL+bQA/haQjFrRJg1dx0qI79fghMZYTSjRsGDegfGnDhh42dxml+c9CJpKuZesl2WnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788689430; c=relaxed/simple;
	bh=2gmavWPxJ0YZ4NW0ZmD41A7HMFxKRQWKCsJu9tg1FJk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UzflGSBigs7jKScuk00n3OydRrt17oPUdj7uIM2Wg/hOaxGpUJ4uqnVvGePqeslauLifgMu2LFPM33fdA16o9eHp92sH7wfhw8M6KA1iIvvdP0GuEr88rGVU/83mFagnmcAS6TdVrYF7hTouQ/WYjPVwCKhl5KrGx+plOCt+Xk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=ADN0Hpb0; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=tK5hpGrs; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="ADN0Hpb0";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="tK5hpGrs"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4hd5YZ0qKqzKn0p;
	Sun, 06 Sep 2026 12:10:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788689426;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2gmavWPxJ0YZ4NW0ZmD41A7HMFxKRQWKCsJu9tg1FJk=;
	b=ADN0Hpb0kQnSS+XudT97KWXdxFi/YQTSIZCpwgr9UEq63kcHGgMpqXd4ZgQpnar+8tqVut
	SIZ8Ca7Jw3hhdXDU4CkGlHZlgW8NpM2VKvlRSZGr5VrMOATfhlHeF69Vts2ZnKk0vPxoHM
	pwjL4t86kyD4I4oEzTyYEqSLlt1tt9mL2Wm7TSuRz8sYVAqe/ZrAG08lJlUFCwFgJn5204
	TAJZsSAs7EVy6Wa29m46PiHaOnizyeGrD11DrRE5yZXBh0m+aIm/uZJQykbeYOqI/13cHj
	Ms9K0RyNME7QzME1/kaJrLdtfwCsUKvtJzJNe97vGDeRfARl9ynQoReUoiVm8g==
From: Manuel Ebner <manuelebnerli@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788689425;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2gmavWPxJ0YZ4NW0ZmD41A7HMFxKRQWKCsJu9tg1FJk=;
	b=tK5hpGrsytlfnLcuqxdSkO3fHJyr700MaMjmLzAe+LE0eLhzoxdpT+lFpK0lUHFEOeXZhN
	T639tZlmzW9McAC32oboBD7XWU3bgYYIshbBzh17gdzcJNMbSVNbhHNvaE4BDIGXE1FgVv
	zR3XVSRkorgnqNYcR2wvRZ2o8+L4na1CpnNzO3qAyQR/JuA3PF1jAUTm8ses42OniirnaR
	KxnHhrEuzW8yBDZxo2ZFcDFfnCj0MXu70t9TmH0DyYpXOiYk1/hpnTtzGzKy8ktqq3Ttka
	JUDlg68UdRT+DKBa9vXoKZr53RqrtkcIUK7tRXIK7n++HOPtM2p+0dlqd8kE5w==
To: torvalds@linux-foundation.org
Cc: dri-devel@lists.freedesktop.org,
	kees+treewide@kernel.org,
	kees@kernel.org,
	linux-kernel@vger.kernel.org,
	manuelebnerli@mailbox.org
Subject: Re: [GIT PULL] kmalloc_obj() conversions for v7.3-rc2 
Date: Sun,  6 Sep 2026 12:09:29 +0200
Message-ID: <20260906100929.1118270-2-manuelebnerli@mailbox.org>
In-Reply-To: <CAHk-=wg2B4maExxSmm6eO1aw9VGyK=Twswwb63Fdm6=KiOZbTw@mail.gmail.com>
References: <CAHk-=wg2B4maExxSmm6eO1aw9VGyK=Twswwb63Fdm6=KiOZbTw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: d6081351a96b2003a74
X-MBO-RS-META: efx8ntf6394bra1ffes5tndets53qesn

Could I please get a Reported-by Manuel Ebner <manuelebnerli@mailbox.org> tag?

Thanks
 Manuel
