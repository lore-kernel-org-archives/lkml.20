Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3912A4AA3F0
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 16:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788367363; cv=none; b=EeydtcNWd5DtT7MDp7X1nIJafz3kp6NKHdpoavXRzCNKKOcLCKneOPhgufeaDYDZvd35W5gk4Lxx7G+YUzDwa/lv7rIjZIVbf/KL6CGzgRwHZGDrc9WXwLVLYfvNopobrPaCsz+2OJ1hv0tR2U92v4AHZwuAPpMqiJzxddqHVsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788367363; c=relaxed/simple;
	bh=offL+WnCraq8X/wpMpT6y7M9oZM53+zPB76FurEo0Zg=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=kOYAam5RCYw+oBuY7THiAOFOh+y48z3zlCZlTesamOiMbf1P4j8zcCsZ3VXzllaFrjGrMw9ZINqbdOie9S9INYRFwL9eqxq9Sapcm95MmL3ZRGu4dblGcdjugXyfsIjA5BuR7zOfihUQ/RRH1jRkpgI7n5aF2OBYAqJyWj3uiBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=1Rs45NW2; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="1Rs45NW2"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A29104E414E8;
	Wed,  2 Sep 2026 16:42:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6E0BE6053C;
	Wed,  2 Sep 2026 16:42:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0CEBA11C79C04;
	Wed,  2 Sep 2026 18:42:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788367348; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=rDUBEK3MGggx0/ed+dJrd4a8xpH6EkMgFmnA5of609g=;
	b=1Rs45NW23JLM5afFIEG1uUtnBxW6NIf58AOOl86G2ryJzasMoAI15d6gqcbOqMgfCkYE9v
	xKZJ7f4O/hCA4nseIVlktmNvbg+sz+TT13a9TwMiNHL+IBkHh/CEFQJNSVyN5rknJo315+
	uyXxukiZBfXg6amOGIm9f+zUG3+MLccKslD8MebYPAqlhb8B5Cgm4pyOVf7+1jIfiu0Auo
	lEKno+kpHQlUHqOobbZI7RbuBrO7UfDYEQfOXW/q3mT+aV9NhRYrmRCabMkHooYx4JTtRb
	wpys26+UohsfNaJeG0w8M/EdThqrOhvDM358KOgG27uzMBQ9ntTR9hqIG76kmw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Osama Abdelkader <osama.abdelkader@gmail.com>
In-Reply-To: <20260812152535.82238-1-osama.abdelkader@gmail.com>
References: <20260812152535.82238-1-osama.abdelkader@gmail.com>
Subject: Re: [PATCH v4 5/6] drm/panel: Use managed helpers in display
 vendor panels
Message-Id: <178836734466.906849.11891939856337750875.b4-ty@b4>
Date: Wed, 02 Sep 2026 18:42:24 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3


On Wed, 12 Aug 2026 17:25:33 +0200, Osama Abdelkader wrote:
> Use the managed MIPI DSI attach and panel add helpers in display vendor
> panel drivers and drop the corresponding manual detach and panel remove
> calls from remove paths.

Applied, thanks!

[5/6] drm/panel: Use managed helpers in display vendor panels
      commit: a2419a3e63274fcd34c83c94d3730f1b3aa8d2ad

Best regards,
-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


