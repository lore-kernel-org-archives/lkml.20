Received: from wxsgout04.xfusion.com (wxsgout04.xfusion.com [36.139.87.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DBE14F68D7
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 13:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=36.139.87.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789739237; cv=none; b=FlHQgiTN3YNkGUIgfA1ZIQFUcNwrPLPfcedMqESLHwtpa7RGHqjGx4GmHt1jjhye3qaaXF6tiew3WD5JyyR+d2ZnflriFsLzLQugUzOWBgG9hFv5INg7kh2gIDayPaiL5PV/miteAOQB2tAlGt8CHvUOal2QYOrDtSa5iXm0iZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789739237; c=relaxed/simple;
	bh=NwjxY3PhjOqyLwGHB1K/Bng0lGQKaF9p3OLp7I1BHFo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kmHwg9zsEkzRLkO5eFQkJwsiGu1xsixKuw0xTdcAWZMYOrUKgkfKGnX90WXjarl+034HQDL3cNdvASvOW1lFBOB190vubLJVIMwB0XrzfmgKFQ27T8zEGqpV0CMu/oOTEbzN4/pWtLas1gNCEVgmEfEjmolTKY7RO4XLEHhl9FQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=xfusion.com; spf=pass smtp.mailfrom=xfusion.com; arc=none smtp.client-ip=36.139.87.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=xfusion.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xfusion.com
Received: from wuxpheds03048.xfusion.com (unknown [10.32.143.30])
	by wxsgout04.xfusion.com (SkyGuard) with ESMTPS id 4hmYng3dYBzBDcl1;
	Fri, 18 Sep 2026 21:46:47 +0800 (CST)
Received: from DESKTOP-Q8I2N5U.xfusion.com (10.82.130.100) by
 wuxpheds03048.xfusion.com (10.32.143.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_RSA_WITH_AES_128_CBC_SHA256) id 15.2.2562.46;
 Fri, 18 Sep 2026 21:46:56 +0800
From: shechenglong <shechenglong@xfusion.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
	<mripard@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter
	<simona@ffwll.ch>, Sam Ravnborg <sam@ravnborg.org>,
	<dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
	<stone.xulei@xfusion.com>, <chenjialong@xfusion.com>
Subject: Re: [RESEND PATCH] drm: Fix NULL pointer dereference in drm_minor_alloc() on error path
Date: Fri, 18 Sep 2026 21:46:49 +0800
Message-ID: <20260918134650.1654-1-shechenglong@xfusion.com>
X-Mailer: git-send-email 2.37.1.windows.1
In-Reply-To: <85292368-03d6-49ce-b6df-3bf659347c0f@suse.de>
References: <85292368-03d6-49ce-b6df-3bf659347c0f@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: wuxpheds03045.xfusion.com (10.32.131.99) To
 wuxpheds03048.xfusion.com (10.32.143.30)

Hi Thomas,=0D
=0D
Thanks again for the review.=0D
=0D
I noticed that this patch has not yet appeared in the drm-misc branches.=0D
Is there anything else needed from my side for it to be merged?=0D
=0D
Best regards,=0D
chenglong She=
