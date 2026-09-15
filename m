Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A6F395AD1;
	Tue, 15 Sep 2026 13:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789477305; cv=none; b=SDHO+u1wR/urk8TgXT69+/y0WAMYXw5GlmkNqZ9gM8AZDVCAnfr1vdqY7h6o+o7N/bbOZEiEa2Gu+7OoYU8ycUzNNAcgkZ6zhBZEfjLZV6c6dr4sGjTjgUL8rvgKhcRotPDRlnClGmbdwc1XFYtq7MjPd+ADZ0hP55KY3JWfisQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789477305; c=relaxed/simple;
	bh=Gm/3e9UjKl5QyiWjyjBfCYBN5w2b9wu+1Jhq9Oqdu/E=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=jlAdZBR13icsOzFGl/6OR6RKT9iiSDHewJ82JsNKFpYDo/g5JHf6D74uuTC+3RWv593tjeMu8uNVrbibdF+waSnAkoaXBSkJFIzzU8D2aYvkKY6CgGMVG6KAvdpGfxxD89UWF/9Ui5ZPR9g1GjW224HnTGxtesD/d3odQgZTgPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=1xhRbVli; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="1xhRbVli"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id D2AA6C5CD4F;
	Tue, 15 Sep 2026 13:02:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4ECB860498;
	Tue, 15 Sep 2026 13:01:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B79B311C7AFE9;
	Tue, 15 Sep 2026 15:01:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789477291; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Gm/3e9UjKl5QyiWjyjBfCYBN5w2b9wu+1Jhq9Oqdu/E=;
	b=1xhRbVli6u57wYGElEqFmqQA0BT75q9nwKXJCrIHMRefXtLuM9lOUVccY188+rjNpRfhHd
	Vc9tGeaAi8/hKFaOi7OCdVSpD9rTEEYTd1LFtv7BoRUEt+910XZrWB3WJa0+Xnv4YP4k0N
	HujSkX7BU2dckCG0utovqqYwKxIyFEyvJt1z8mwUhJA5C6DFY57dBdf4MFhEsXn0sBWB1U
	2bXaL0ilZSKUiAvJXs3BEXGGZ2nmSXntB9I6QmjghE9hoNVzDdLzpoMueAw7EJlNO3xo5J
	+ojV/u26omB1EEjBFYroMJxpxRiYaWDahR+gaPyFxTc2T5YMHk4TKU6eqUhZvQ==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 15 Sep 2026 15:01:14 +0200
Message-Id: <DLFWR377PSNH.3253TRHVTTGMQ@bootlin.com>
Subject: Re: [PATCH v15 2/2] drm/bridge: Add Lontium LT9611C(EX/UXD) MIPI
 DSI to HDMI driver
Cc: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Dmitry Baryshkov"
 <dmitry.baryshkov@oss.qualcomm.com>
To: <mohit.dsor@oss.qualcomm.com>, "Sunyun Yang" <syyang@lontium.com>,
 "Andrzej Hajda" <andrzej.hajda@intel.com>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman"
 <jonas@kwiboo.se>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Luca
 Ceresoli" <luca.ceresoli@bootlin.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Vinod Koul" <vkoul@kernel.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.22.0
References: <20260915-lt9611c-v7-v15-0-88f9e9387eab@oss.qualcomm.com>
 <20260915-lt9611c-v7-v15-2-88f9e9387eab@oss.qualcomm.com>
In-Reply-To: <20260915-lt9611c-v7-v15-2-88f9e9387eab@oss.qualcomm.com>
X-Last-TLS-Session-Version: TLSv1.3

Hello Mohit,

On Tue Sep 15, 2026 at 2:33 PM CEST, mohit.dsor wrote:
> From: Sunyun Yang <syyang@lontium.com>
>
> LT9611C(EX/UXD) is an I2C-controlled chip that Receiver signal/dual port
> mipi dsi and output hdmi, differences in hardware features:
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

You are carrying this Reviewed-by Dmitry since v11, but the patch has
changed a lot since then. You should drop that R-by line, unless you got an
explicit consent to keeping it for specific agreed changes.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
