Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F4254E80BC
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 15:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788449942; cv=none; b=FQaqfKyT4JC8VPIMWfG/Cl+zRij4ph1u89KRn9KMl0Tkdu/AjXJscwQ5aXXGmolHG6F0Ty0GkoiNpz+4gxUBro6YtUPVUmslfNFCEx3ywqyWlwcItCXj/PGtMoR+I/f8KpWATW9LPBzRbRB2h1wi8non9VoSJaYo1eIEJDZMgbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788449942; c=relaxed/simple;
	bh=lSxWeV6eQ9gsvtuEy29EEdGDoPwOWoRNvmRLfQt9SQY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=H17gqLA9HXI97+1AKbNx2s035Bq3R8ooU6vXqa7fC0hR4UgvZoOo4jSgBr22ESOgpU8kBOMOa1AdVAwzyxMqlVb/vIRq7SmxHCJ5bULIHjHe9UWgab/6+yMpEky4theialZOMjINGcflWcyv4VMfYwd/iGQUzMS4nijwV6tSL/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=F/NqFgGw; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="F/NqFgGw"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 3A9B84E414ED;
	Thu,  3 Sep 2026 15:38:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 05972602B8;
	Thu,  3 Sep 2026 15:38:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3495A11C79776;
	Thu,  3 Sep 2026 17:38:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788449934; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=2rykjN7hYhjqqGp35APiIYM2znSzNTqcio7WBnw8C7c=;
	b=F/NqFgGwc26SiygDFUBnXEqmAs+dILuLsA19YqkWX23Wzc2wgfJX9s/KcD+IVmXAzaY5V1
	/CeTfwY62/521oXbTb3ZrPLcrxuDDNIGTIl4XjngU5+ZB6AyB+1LIiFDu5YL/bXe9F2leD
	cJPSWYijl68B9CYSMC9DM4Tbv2OuxOyIPn1BwPHY8N19UAdStDcc7WXykzYu2IZgJ1ZjkY
	L5srqLofNjjMvjbo0TRzI5GypYT3buJS5Co0ce25Tdmk0/RNN+xc1XZv1RkbmYXUeBjU6n
	O1BsAefK1WQSrAm+Qa4RI3imE56h+f/+/ZklFO171iH+4k6iqp9c57uC1/5zOg==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 03 Sep 2026 17:38:41 +0200
Message-Id: <DL5SL3NE7UD4.266QMY5S9ZY3T@bootlin.com>
Cc: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Andrzej
 Hajda" <andrzej.hajda@intel.com>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman"
 <jonas@kwiboo.se>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Jessica
 Zhang" <jesszhan0024@gmail.com>, "Linus Walleij" <linusw@kernel.org>, "Inki
 Dae" <inki.dae@samsung.com>, "Jagan Teki" <jagan@amarulasolutions.com>,
 "Marek Szyprowski" <m.szyprowski@samsung.com>, "Anusha Srivatsa"
 <asrivats@redhat.com>, "Dmitry Baryshkov"
 <dmitry.baryshkov@oss.qualcomm.com>, "Hui Pu" <Hui.Pu@gehealthcare.com>,
 "Ian Ray" <ian.ray@gehealthcare.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
To: "Albert Esteve" <aesteve@redhat.com>, "Luca Ceresoli"
 <luca.ceresoli@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH RFC v2 04/19] drm/bridge: panel: rename
 drm_bridge_is_panel() -> drm_bridge_is_panel_bridge()
X-Mailer: aerc 0.22.0
References: <20260903-drm-bridge-every-panel-v2-0-2ab8ee24538e@bootlin.com>
 <20260903-drm-bridge-every-panel-v2-4-2ab8ee24538e@bootlin.com>
 <CADSE00+n4XQ+Xj-TG4KtbPq4asR6GH9=+fC0MdQUycM2_DXiNg@mail.gmail.com>
In-Reply-To: <CADSE00+n4XQ+Xj-TG4KtbPq4asR6GH9=+fC0MdQUycM2_DXiNg@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3

Hello Albert,

On Thu Sep 3, 2026 at 3:59 PM CEST, Albert Esteve wrote:
> On Thu, Sep 3, 2026 at 10:12=E2=80=AFAM Luca Ceresoli <luca.ceresoli@boot=
lin.com> wrote:
>>
>> Work is in progress for every drm_panel to embed a drm_bridge, and for t=
hat
>> a function will be needed in the drm_panel API to tell whether a bridge
>> represents a panel or something else. The ideal name for that will be
>> drm_bridge_is_panel(), which however is already in use by the panel_brid=
ge.
>>
>> Rename the current function in the panel_bridge API to
>> drm_bridge_is_panel_bridge(), which is more precise and frees up the
>> drm_bridge_is_panel() for future use in the drm_panel API.
>>
>> No functional changes, just renaming a function treewide.
>>
>> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>> ---
>>  drivers/gpu/drm/bridge/panel.c                 | 8 ++++----
>>  drivers/gpu/drm/display/drm_bridge_connector.c | 2 +-
>>  include/drm/drm_bridge.h                       | 4 ++--
>>  3 files changed, 7 insertions(+), 7 deletions(-)
>
> Reviewed-by: Albert Esteve <aesteve@redhat.com>
>
> Thanks for cc'ing me :)

You're welcome. Sorry for not having done it since v1.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
