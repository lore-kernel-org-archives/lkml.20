Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 334CE38CFE1;
	Wed,  9 Sep 2026 08:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788941525; cv=none; b=W/GEO8A3u82gErWauMQnCMFb8gEFsSH3L9iC0O7PIqihV7aW0pi/mgs2xvrcyoEKNej4cKv1RiBm7yKlJuJYIKMCb/fZX+vFx0Y/iWXY1riyxpt4wbT/nRvejKB9JcESChiJywtAUt7yUYKoTnDW/mlSMnCvF/Z2mrdNwEw8KEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788941525; c=relaxed/simple;
	bh=GaY6f8fhEOXebtecp+sLG5gXB/EVaGxFcy+c3bl2LB0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ogEIRfu9UHtViBHWuudhAAf2qgxj7OOx8hxvaKCi7oxe/K5mYbbWKzKouz0oi3EmlvfXBmQ+RQxTgaReryZwMUbYTUuL8ocJq1K9Vmw3XU6EAZj/mjJqtkkeeBKbgipwUwELLJFjR0ebauwNWn1Y6L/15LJDQK7iOBsBWKP5os8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T1Vei0Zc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T1Vei0Zc"
Received: by smtp.kernel.org (Postfix) with ESMTPS id CA5AAC2BCFC;
	Wed,  9 Sep 2026 08:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788941524;
	bh=GaY6f8fhEOXebtecp+sLG5gXB/EVaGxFcy+c3bl2LB0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=T1Vei0ZcZr0GRHMAX8SpopiHwa7ViqI1F+bu3D1v5Ocnd6lh40XZsM9rS+fzHvLb5
	 D5fcf/IqUh2babwqiukvvnCHtzkuY2l2mdE88Jn0mbmnm7uGPjE9OJE/u2jP/pFZis
	 seR91NwFEFJFB+OXWowkfqysmpVpvbadMhkzb1qIXRVJEZQGA4tgS+jO7cq8RTKK0v
	 vcWW9IvPwC0lxEAKyOEGm0mDjI9plFe75oJNa55gesomDKT9GqshITwq44XQ+J3w/7
	 qrCsRT6IKz/K2nLVpXkOU+p3rxOJiLplSVmdnkVwtc+rDv03RSkiG5Ei11Umb5Oh7h
	 sikBk8SaSBYFQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9BF5C79FB8;
	Wed,  9 Sep 2026 08:12:04 +0000 (UTC)
From: Joel Selvaraj via B4 Relay <devnull+foss.joelselvaraj.com@kernel.org>
Date: Wed, 09 Sep 2026 01:11:59 -0700
Subject: [PATCH 1/4] mailmap: update Joel Selvaraj's email address
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-update-email-address-v1-1-94a240f9469e@joelselvaraj.com>
References: <20260909-update-email-address-v1-0-94a240f9469e@joelselvaraj.com>
In-Reply-To: <20260909-update-email-address-v1-0-94a240f9469e@joelselvaraj.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Joel Selvaraj <foss@joelselvaraj.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788941524; l=809;
 i=foss@joelselvaraj.com; s=20260909; h=from:subject:message-id;
 bh=KfWlaqHF//2UprpPY6mCM27F9EEMcI/pUqHOiV1Fdas=;
 b=p/SvXrdgooOYa5zsVaumVxUoo5aRmok8IdVXXUmW4AzD8RpeKo+2oYqKgOXpGua/UBK/qz/3D
 8pnvjlJv3DpDaNRL4axKfjXKDt9atpvpWgoETCUh9H8hODxlzsCZZPy
X-Developer-Key: i=foss@joelselvaraj.com; a=ed25519;
 pk=UUJ1v4UQJ/nljqj3NjsWt5H4mphWQ7etpQ4Z7JiR2yo=
X-Endpoint-Received: by B4 Relay for foss@joelselvaraj.com/20260909 with
 auth_id=1018
X-Original-From: Joel Selvaraj <foss@joelselvaraj.com>
Reply-To: foss@joelselvaraj.com

From: Joel Selvaraj <foss@joelselvaraj.com>

Map my old, no longer active, jsfamily.in address to my current one.

Signed-off-by: Joel Selvaraj <foss@joelselvaraj.com>
---
 .mailmap | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.mailmap b/.mailmap
index 742244a422c32..516c877ef9cf3 100644
--- a/.mailmap
+++ b/.mailmap
@@ -458,6 +458,7 @@ Jisheng Zhang <jszhang@kernel.org> <Jisheng.Zhang@synaptics.com>
 Jishnu Prakash <quic_jprakash@quicinc.com> <jprakash@codeaurora.org>
 Joe Damato <joe@dama.to> <jdamato@fastly.com>
 Joel Granados <joel.granados@kernel.org> <j.granados@samsung.com>
+Joel Selvaraj <foss@joelselvaraj.com> <jo@jsfamily.in>
 Johan Hovold <johan@kernel.org> <jhovold@gmail.com>
 Johan Hovold <johan@kernel.org> <johan@hovoldconsulting.com>
 John Crispin <john@phrozen.org> <blogic@openwrt.org>

-- 
2.55.0


