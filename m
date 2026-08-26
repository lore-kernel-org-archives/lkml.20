Received: from mx.prosyst.ru (m2.prosoftsystems.ru [46.48.77.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6187378D64
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 12:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.48.77.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787745925; cv=none; b=kJ6DyJsY2onqJPGJ4PWbb6q9Rg9Zm7ilOK+okd/+dWZiV18ZfykyZgFP92YUKAVa753zPW9mqXSOioMFHh6Q/6i/BYEBglDCb6N5XV3B+a9p+gbB1LcahjPoK47zeBVE6JyDRsEjGY4fA787suhzn3N3Gaayp3LKblMKdWw5DEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787745925; c=relaxed/simple;
	bh=yLeGfv0wu2VlNwsANP/WJQiFYqeSwjZz8iL6l8p0s8w=;
	h=Content-Type:From:To:CC:Subject:Date:Message-ID:MIME-Version; b=vCUKjl6Wf68h3ongnow08+rTihDHPeYnjm3BQV6l4fQwhZf/A+d9OQqSO7jQxvexRzoobUxccaJgJ3lqt+ivZo8hwm7JrfeSvqOxZRWyNXb1SgDtMutBzK7QobH9soIUqu/VpuwMKcCbRwCSwQJnTs+NtAOcGsYCkGZBAKrfkw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=prosoftsystems.ru; spf=pass smtp.mailfrom=prosoftsystems.ru; dkim=pass (2048-bit key) header.d=prosoftsystems.ru header.i=@prosoftsystems.ru header.b=g+ScnngL; arc=none smtp.client-ip=46.48.77.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=prosoftsystems.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=prosoftsystems.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=prosoftsystems.ru header.i=@prosoftsystems.ru header.b="g+ScnngL"
Content-Language: ru-RU
Content-Type: text/plain; charset="koi8-r"
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; d=prosoftsystems.ru; s=ps;
	c=relaxed/relaxed; t=1787745909; h=from:to:date:message-id:subject;
	bh=aL1S/oO3egT35wuO0PK/N4Ble76Et9HPt7+fW86EzdM=;
	b=g+ScnngLb2DinA7EHy4q8+7pK6q7iolWE8hhwZSC4y/LBs3nVWhrxSWCkT++emhy+n5bIWC/oT2
	4ExgvhTwrfupGwc75e9YBb7HoRhoD9YJPd0at1qfP9uOuSlwNXoYSyRwi5ZdA6dwuU9RRe55l6Wt0
	bMgHKHJsEPTcTl17Z4WY68pxKo6Xw7GUN0rSF7w+SyNkBnEAW8Xrdd9JHxC+LFVdmxUx6frRAZaqY
	L/sRtfLkfhxpIk1DwcNv4KQOF2YmpquJ0WenoPV5d/tNHdJ3u/Z/XFfWzdt9TCHo1XEq4aTTa34Cd
	YaFqtRvsYuOO9gXuTStRZgmH+83iuftF5t+g==
Received: from echo-2.prosoft.ural.ru (172.21.245.22) by mx.prosoftsystems.ru
 (172.21.240.33) with Microsoft SMTP Server (TLS) id 15.1.396.30; Wed, 26 Aug
 2026 17:05:09 +0500
Received: from echo-2.prosoft.ural.ru (172.21.245.22) by
 echo-2.prosoft.ural.ru (172.21.245.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.39; Wed, 26 Aug 2026 17:05:11 +0500
Received: from echo-2.prosoft.ural.ru ([fe80::8f12:4f85:56d8:13ed]) by
 echo-2.prosoft.ural.ru ([fe80::8f12:4f85:56d8:13ed%17]) with mapi id
 15.02.1748.039; Wed, 26 Aug 2026 17:05:11 +0500
From: =?koi8-r?B?9sHNwsHLycXXIPLBxMnKIPLJy8HSxMnOz9fJ3g==?=
	<r.zhambakiev@prosoftsystems.ru>
To: Andrzej Hajda <andrzej.hajda@intel.com>
CC: =?koi8-r?B?9sHNwsHLycXXIPLBxMnKIPLJy8HSxMnOz9fJ3g==?=
	<r.zhambakiev@prosoftsystems.ru>, Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart
	<Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, Luca Ceresoli
	<luca.ceresoli@bootlin.com>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, Harikrishna Shenoy <h-shenoy@ti.com>, "Tomi
 Valkeinen" <tomi.valkeinen@ideasonboard.com>, Jayesh Choudhary
	<j-choudhary@ti.com>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Kees Cook <kees@kernel.org>, Qi Xi <xiqi2@huawei.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"lvc-project@linuxtesting.org" <lvc-project@linuxtesting.org>
Subject: [PATCH v2] drm: bridge: cdns-mhdp8546: drop redundant NULL check
Thread-Topic: [PATCH v2] drm: bridge: cdns-mhdp8546: drop redundant NULL check
Thread-Index: AQHdNVMlQIQLUZ3MmEedP2wxUV9CLg==
Date: Wed, 26 Aug 2026 12:05:11 +0000
Message-ID: <20260826120351.88650-1-r.zhambakiev@prosoftsystems.ru>
Accept-Language: ru-RU, en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

From: Radiy Zhambakiev <r.zhambakiev@prosoftsystems.ru>

to_cdns_mhdp_bridge_state() is a container_of() on the first member
of struct cdns_mhdp_bridge_state, so it cannot return NULL as long
as its input is non-NULL. The bridge state is already NULL-checked
right before the conversion, making the check on the converted
pointer dead code.

Remove it.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Signed-off-by: Radiy Zhambakiev <r.zhambakiev@prosoftsystems.ru>
---
Changes since v1:
- Fixed text encoding of the patch itself, so git am applies
correctly
- Added explicit `From: ...` to the top of the patch body, to
prevent checkpatch.pl email name mismatch error
=20

 drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/=
gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
index 36c07b71fe04..424183db6f76 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
@@ -2145,11 +2145,6 @@ static int cdns_mhdp_update_link_status(struct cdns_=
mhdp_device *mhdp)
 		}
=20
 		cdns_bridge_state =3D to_cdns_mhdp_bridge_state(state);
-		if (!cdns_bridge_state) {
-			ret =3D -EINVAL;
-			goto out;
-		}
-
 		current_mode =3D cdns_bridge_state->current_mode;
 		if (!current_mode) {
 			ret =3D -EINVAL;
--=20
2.53.0
