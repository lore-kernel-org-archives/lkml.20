Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5624CC61A
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 08:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790066468; cv=none; b=DvT7vOdo7UEKuEpY8nTsbC+7ggvoOe1HewAMZBtW/7bWZXKHmL3/9j/+X4MOMMC19nglm5hhsjHs6vzi9t3jZwiroxc8WNemyo+dW8Z8XSEjLUHxQ6u6eVERcNp6BFA/wCIn5f3wK435fhkCByENFGu3iQaEGph5n9AwEKHn/LQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790066468; c=relaxed/simple;
	bh=5xs6sF9jBD61IiQEI4YWD8PwkIS/+lGXZUZqovlSmuU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cpY5QY4RbeySGoh4SfHZEmWyQPKWLOhYBWQXwS0yVzFdSESJOcaenGCkCU0LFjBgYpSM7AdRSZvLDL6xuPcJQb7TnXeGaidP2rzk+fiaD21bWU5SsoJHq6B8l55yZ+8PgzLAGeWYpDtuuw6G66P5qQT3v86+DB/BxVDg5uRSw88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jUl2G1vr; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jUl2G1vr"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747f05ffdso27371475ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 01:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790066467; x=1790671267; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5S8QifYjw9f9mPH34m2yhxskNbv7W3w5nVN3WfjvwaU=;
        b=jUl2G1vrsW5dvUElI30QhkDPSo6hG3rsufI0IOSGEwcBa1naxSLaco9SpU//xxALyt
         rrlTLEOm20cVcdn1ltVStoUEJKBvq9ntBK0VyBj//MtwjxdLqRdArj/EEz1I0FOJklu1
         KOErvKaQVuAFBvcP35yDDdv+Xg9LYNkb7XcqcOXFYPiyCaUy+BgdX+guAUSIGG5axwSP
         xmH48Lncvsk+7ofqqduxX9SaBoo/z0z1Ax3fIxHpQ08h12YlUljj1RiffU9pckL3svxF
         fgnpmy2vnbKcWSN8ulfMws78RbNlOxrnm9unU8CGtjPKEug0sS76e4aNnWiMdLbs3EPf
         R46Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790066467; x=1790671267;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5S8QifYjw9f9mPH34m2yhxskNbv7W3w5nVN3WfjvwaU=;
        b=FROueY3Fponh1cGMmoUdzwyXx3HGTMSZhe+kUBBKiLEfEIiXvIB0jycZskxFaj5KaS
         uHbRyXrKn0+jPQKo11w1apR2PiBwbzAdAW/ZxA5O9s7p0crJGGM+7DjRPu3PQDTadcAu
         w0q/ceJm/0M5c8WgaGv5izH8/kxX6gEgkrvEDv9+uYsnnRZuYUNsHPhn947giRr/+iep
         /ddCii7DgO347RMnfysfgFXtxA7AnEwBXQ5y7/1HtC5cdoUx3zpM4C0+5fHZ/+v9YWm4
         l6IW+aXzNU8mThjwqaPZOjVan9EWmauACHpWgeSV2784HiwR8qf7TfKVm8zvwK+X7Mgg
         LRfg==
X-Forwarded-Encrypted: i=1; AKwUvByhZxnlDtR57uo68zlaxl0nSxdCyw4X+yU5DR/v0xngD8s25vBsxlce4jqmxx0w4rgoOOBK0rOvtptEmh4=@vger.kernel.org
X-Gm-Message-State: AFuF++mV8OCl6hxK5f7uYQBoWeH4k/5vp/ug38y5nBIPNXLeUvXyb3hQ
	SuR2CPZJRs/IVoDePjXcAKF/FNnWd8uqaxpwKy4z3HC5CRAhf/yTqySn
X-Gm-Gg: AYBFou3qqyEPLDpCkLpKo4MJQQxFwikGiBXMRDdzpHUUOoFHeX/kZ1yBPDplr1tlHT2
	dOLUC9fKEIQbKvTDZlEob9JBQdPnw7Zpby0VGnXjdn5Ro1uxl/vKF+FCaoe1QAECt2oFXeLjXMI
	qzx/IVafEm+7k3SZxoVj6S9Br1ajpTav6SCVRek2iVQHa89kd+HkDLT8DkcbPyHhEVOHgXCk8Ko
	LOsq7tqLmwTz9AlEwOwr5THPqggj7RXhEghpYAas0z1sY1lNblvv47pBEMrcKjk+uZtZAr9s4mR
	dojYKljtB09HxoCyRPLzCOVOwLBb5M2g7sWPAFScM5dm2/ggAYM1q26yM+12pT2Z1YZ/1UDcCH2
	rbNrbfesUX4eJBRELYwiLx4PrbBGDfIcdDVlvrKjyM9onmhKNxIQINCGJsqdJui6xvy8fIhJPUb
	v8EP1qjAZ50o6jPS39tgBXKjWRTDsIOGxZxLY9pxadx2+16ifcGEuvzefS0uWToahg4Ybegw==
X-Received: by 2002:a17:903:3846:b0:2dd:3ddf:b895 with SMTP id d9443c01a7336-2df609b1ca2mr4568265ad.3.1790066466503;
        Tue, 22 Sep 2026 01:41:06 -0700 (PDT)
Received: from fedora ([111.223.30.23])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df5d0308f5sm6089835ad.43.2026.09.22.01.41.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 01:41:06 -0700 (PDT)
From: Sajal Gupta <sajal2005gupta@gmail.com>
To: rubenru09@aol.com
Cc: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	noralf@tronnes.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Sajal Gupta <sajal2005gupta@gmail.com>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH] drm/gud: don't keep a connector without a CRTC as connector_state
Date: Tue, 22 Sep 2026 14:10:08 +0530
Message-ID: <20260922084026.15481-1-sajal2005gupta@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If the 'for_each_new_connector_in_state()' loop finishes without
hitting the break, connector_state is left pointing at the last
connector visited, which has no CRTC, instead of
staying NULL.

That skips the "if (!connector_state)" fallback below the loop, which
looks up the active connector when the state contains none. The
function then carries on with a connector that is not driven.

Fix by resetting connector_state to NULL for each connector visited that
has no CRTC, so that it is NULL when none was found and the fallback runs.

Fixes: 40e1a70b4aed ("drm: Add GUD USB Display driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://sashiko.dev/#/patchset/20260902123254.36987-1-sajal2005gupta@gmail.com?part=1
Signed-off-by: Sajal Gupta <sajal2005gupta@gmail.com>
---
 drivers/gpu/drm/gud/gud_pipe.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/gud/gud_pipe.c b/drivers/gpu/drm/gud/gud_pipe.c
index aa7792966287..5aa5ac2f3727 100644
--- a/drivers/gpu/drm/gud/gud_pipe.c
+++ b/drivers/gpu/drm/gud/gud_pipe.c
@@ -507,6 +507,7 @@ int gud_plane_atomic_check(struct drm_plane *plane,
 	for_each_new_connector_in_state(state, connector, connector_state, i) {
 		if (connector_state->crtc)
 			break;
+		connector_state = NULL;
 	}

 	/*
--
2.55.0

