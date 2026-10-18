Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C50044CF49B
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 12:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792326674; cv=none; b=W8O+GeiMj0sf1cbQetRVaF7EZBCVLpW5c1wf3cbAaBNyeE2tzL23Ldoo1VswQSy/6hMGVa2MPyyOnd9F9tgB/3WMJ04yarGM1rIgyB08pUO2P8H71VotJicDFmyQ7BfvpR90eQnGtKEHRu4q62o31nNtHPth+mYHmvE34wohL1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792326674; c=relaxed/simple;
	bh=HiTtcdQ3+Ds0m4DX1z6pWYfQBN5jbny1N8mHXunV++8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Xpw/S6IjudkPNpkBDPQToXSXmb0e9v/m5UR8d8EyJFHCZGBGYDQh+L1aa6zLZig0t91HdJ5p87d55idFfUavq9Lzt+rtaHv0V+/W0ieHNuI4yEHTg4pgyaZB0ffCG3TsdUMwS+aN4ztVGcMNs5Rl6dFzdfvUme+Pkd3f6KCoD3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=jan.claussen10@web.de header.b=XeUuEIkr; arc=none smtp.client-ip=212.227.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=jan.claussen10@web.de header.b="XeUuEIkr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1792326664; x=1792931464; i=jan.claussen10@web.de;
	bh=+YwrntOyRknbggwrQKU1gw4YodNY/Moq08w7g8XJTR0=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=XeUuEIkrK3J09oED3OdlukAbpLXbX1F/q/P4W+viNiw9V4ED9khTZeWCaOinrLxK
	 R/YyoDMFAl3p9SHokoi1tJyUw3aQnvaZX4M+LxwCJDLOuIt0HfIMpJ+M5wuNknaWE
	 wNTAIRf0ygrz8ttxUzlgSqj7qWXz6TsnXFYAlrDp71zCPXu0g1nVPCR/S15LdbAB5
	 zo+3YkKC4ObqCTypH4bv4fBie4ofIZEy6++UyYWodeU3ylHefz+dcEPApgXIbMAeq
	 /dUkosB+qHW9z7obJkqa+Vm0CKbPnTyxDF18nHvO4xs6QpYlBqKUEUlfV+szEqcLk
	 6cL69CV7BIpDoXkrVQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N3Gki-1was700pfe-010PPu; Sun, 18
 Oct 2026 14:31:04 +0200
From: =?UTF-8?q?Jan=20Clau=C3=9Fen?= <jan.claussen10@web.de>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: =?UTF-8?q?Jan=20Clau=C3=9Fen?= <jan.claussen10@web.de>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/6] drm/connector: Fix typo in colorspace error messages
Date: Sun, 18 Oct 2026 14:30:11 +0200
Message-ID: <20261018123037.19560-2-jan.claussen10@web.de>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261018123037.19560-1-jan.claussen10@web.de>
References: <20261018123037.19560-1-jan.claussen10@web.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ed78oEEJd3UFj/RlSQj8Op6VAN5EEHdsU3JxKPcvqcZYx5RKsfQ
 iWZxmAv37UtKFiJSYyaVBdJ+COw9rBvgr0L8QI1b3GqYXjMHgdgKGmiKhFIP5oVBvRg0FtL
 quGeZsYsBYYcf/oXV2kb2wij7siOHOQ7FI3aw5Z9sHXa4wIvUBaggyQ0trdxBfi3VeM8E9I
 zSL1A/NE96jcvRMMGnmpQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:gKKg4N5TUMA=;sfjSfEvkidkeTcireDfk4nqrKtg
 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

Change provded to provided.

Signed-off-by: Jan Clau=C3=9Fen <jan.claussen10@web.de>
=2D--
 drivers/gpu/drm/drm_connector.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connect=
or.c
index 893716a9e489..66f53e155342 100644
=2D-- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -2768,14 +2768,14 @@ static int drm_mode_create_colorspace_property(str=
uct drm_connector *connector,
 		return 0;
=20
 	if (!supported_colorspaces) {
-		drm_err(dev, "No supported colorspaces provded on [CONNECTOR:%d:%s]\n",
-			    connector->base.id, connector->name);
+		drm_err(dev, "No supported colorspaces provided on [CONNECTOR:%d:%s]\n"=
,
+			connector->base.id, connector->name);
 		return -EINVAL;
 	}
=20
 	if ((supported_colorspaces & -BIT(DRM_MODE_COLORIMETRY_COUNT)) !=3D 0) {
-		drm_err(dev, "Unknown colorspace provded on [CONNECTOR:%d:%s]\n",
-			    connector->base.id, connector->name);
+		drm_err(dev, "Unknown colorspace provided on [CONNECTOR:%d:%s]\n",
+			connector->base.id, connector->name);
 		return -EINVAL;
 	}
=20
=2D-=20
2.56.0

