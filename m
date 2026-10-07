Received: from mta0.migadu.com (out-117.mta0.migadu.com [91.218.175.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53F114734F3
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 09:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.117
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363980; cv=none; b=WBw9alj2esi3isSAq52EqdhfOW+7yKa3LEZri11HyxSpEWK3ho1UxKpRZLgo+34x2NhDWji+UlHS4Amw5dPYuaEnq3Y/57DODBxJZcSnqyK7R7uQHVjfXWfVckSBhkVHFd8Z0Tu3obCvx04ff7C+q6c48Iua9MQPfYl3k/Us22Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363980; c=relaxed/simple;
	bh=KMH1zkny9ilMhYC1I0oOOb4b2JHCQIp99oDaje7LMqY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=e6eWDJBYNGcPpSLyuYFPc/TlmyBhL1+raJ/mMVA/TOhQiAGgIjBXMRxBEo/7kW7h7TrBDLoiUkapOPw5TcQ3x2hmyit8b+gFRg9dGCatQJdD4/b4o8dXkTU2EyJKJ86UUm18nhVjhjkr4BicUPPdIJQgrIZtN2HljUwdfuUl8Zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com; spf=pass smtp.mailfrom=cknow-tech.com; dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b=FB5QDV34; arc=none smtp.client-ip=91.218.175.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b="FB5QDV34"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=KMH1zkny9ilMhYC1I0oOOb4b2JHCQIp99oDaje7LMqY=;
 c=simple/simple; d=cknow-tech.com;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791363943; v=1; x=1791968743;
 b=FB5QDV34VdfLNUokk+LGm0ntL3HTSy7/jxtEhdDrIPtzgsQfsQgBhPVhwWWxaJKvcOblMG6U
 CEXep69VRW0ANvXlw8wiZd1q+v1Jv+OeNo3AIawShuJKfJqr6IarrRYQBbdYhSvwKpx1M2bLbAM
 k7L+r7kMZtqYcUmUgumiuJfVawRy1yblMAW8E3pdwALjQXQINEB4pWaDhdM0+IddZ739ol53eAW
 UaR6+gIMDCILSjAWtM2gVRdFA6WjEe4XXNMNS9e4Df3lkSsl5ZBQEk/qPAFNpKu5l74rM5cu1qK
 0xoyYfzkEl8veP28VNxLlw0XfhkMG5ii5ZqS74QAED1pA==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 15939383617e4296;
	Wed, 07 Oct 2026 09:05:18 +0000
X-Mizu-Trace-ID: 15939383617e4296
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 07 Oct 2026 11:05:13 +0200
Message-Id: <DLYHID2E4YBE.2HBQU3ZC3SAYZ@cknow-tech.com>
Cc: <kernel@collabora.com>, <dri-devel@lists.freedesktop.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, "Diederik de Haas"
 <diederik@cknow-tech.com>
Subject: Re: [PATCH v12 01/16] drm/bridge: dw-hdmi-qp: Demote i2c bus error
 messages to debug level
From: "Diederik de Haas" <diederik@cknow-tech.com>
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>, "Sandy Huang"
 <hjc@rock-chips.com>, =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 "Andy Yan" <andy.yan@rock-chips.com>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Luca Ceresoli"
 <luca.ceresoli@bootlin.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Algea Cao"
 <algea.cao@rock-chips.com>, "Daniel Stone" <daniels@collabora.com>
X-Mailer: aerc 0.22.0-31-g5c1c510d2b65
References: <20261005-dw-hdmi-qp-scramb-v12-0-195157ba0b40@collabora.com>
 <20261005-dw-hdmi-qp-scramb-v12-1-195157ba0b40@collabora.com>
In-Reply-To: <20261005-dw-hdmi-qp-scramb-v12-1-195157ba0b40@collabora.com>

Hi Cristian,

On Mon Oct 5, 2026 at 2:38 AM CEST, Cristian Ciocaltea wrote:
> A NACK or timeout on the DDC bus is a normal condition when the sink is
> absent or unpowered.  Some displays keep HPD asserted and the EDID
> EEPROM readable while in standby, but leave the SCDC slave unpowered.
> This results in i2c-related error messages on every boot during
> scrambling setup, even though the condition is handled gracefully and
> the SCDC configuration is restored on the next hotplug event.
>
> Log the i2c bus level failures with dev_dbg_ratelimited() instead,
> matching the silent behaviour of the non-QP dw-hdmi i2c bus algorithm.

I can confirm that with this patch I no longer see warnings like this:

  dwhdmiqp-rockchip fde80000.hdmi: i2c read error
  dwhdmiqp-rockchip fde80000.hdmi: i2c write nack!

When I add ``dw_hdmi_qp.dyndbg`` to the kernel command line, I do see
them at debug level.
This is when I boot up my NanoPC-T6 LTS connected to my 4K TV while it
is turned OFF.

When I boot up my NanoPC-T6 LTS connected to my 4K TV while it is
turned ON, dmesg is rather clean wrt dw_hdmi_qp both with and without
``dw_hdmi_qp.dyndbg`` in my kernel command line.

So it acts exactly as intended :-) Thus feel free to include my:

Tested-by: Diederik de Haas <diederik@cknow-tech.com>  # NanoPC-T6 LTS

Thanks!

Cheers,
  Diederik

> The DDC users already report failures at the appropriate level, e.g. the
> SCDC helpers via drm_scdc_dbg().  This also makes the no-hpd special
> casing of the read path messages redundant, so drop it.
>
> Reported-by: Diederik de Haas <diederik@cknow-tech.com>
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c | 16 ++++------------
>  1 file changed, 4 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/d=
rm/bridge/synopsys/dw-hdmi-qp.c
> index c9568aea98dc..9abcea92b720 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
> @@ -350,22 +350,14 @@ static int dw_hdmi_qp_i2c_read(struct dw_hdmi_qp *h=
dmi,
> =20
>  		stat =3D wait_for_completion_timeout(&i2c->cmp, HZ / 10);
>  		if (!stat) {
> -			if (hdmi->no_hpd)
> -				dev_dbg_ratelimited(hdmi->dev,
> -						    "i2c read timed out\n");
> -			else
> -				dev_err(hdmi->dev, "i2c read timed out\n");
> +			dev_dbg_ratelimited(hdmi->dev, "i2c read timed out\n");
>  			dw_hdmi_qp_write(hdmi, 0x01, I2CM_CONTROL0);
>  			return -EAGAIN;
>  		}
> =20
>  		/* Check for error condition on the bus */
>  		if (i2c->stat & I2CM_NACK_RCVD_IRQ) {
> -			if (hdmi->no_hpd)
> -				dev_dbg_ratelimited(hdmi->dev,
> -						    "i2c read error\n");
> -			else
> -				dev_err(hdmi->dev, "i2c read error\n");
> +			dev_dbg_ratelimited(hdmi->dev, "i2c read error\n");
>  			dw_hdmi_qp_write(hdmi, 0x01, I2CM_CONTROL0);
>  			return -EIO;
>  		}
> @@ -404,14 +396,14 @@ static int dw_hdmi_qp_i2c_write(struct dw_hdmi_qp *=
hdmi,
> =20
>  		stat =3D wait_for_completion_timeout(&i2c->cmp, HZ / 10);
>  		if (!stat) {
> -			dev_err(hdmi->dev, "i2c write time out!\n");
> +			dev_dbg_ratelimited(hdmi->dev, "i2c write time out!\n");
>  			dw_hdmi_qp_write(hdmi, 0x01, I2CM_CONTROL0);
>  			return -EAGAIN;
>  		}
> =20
>  		/* Check for error condition on the bus */
>  		if (i2c->stat & I2CM_NACK_RCVD_IRQ) {
> -			dev_err(hdmi->dev, "i2c write nack!\n");
> +			dev_dbg_ratelimited(hdmi->dev, "i2c write nack!\n");
>  			dw_hdmi_qp_write(hdmi, 0x01, I2CM_CONTROL0);
>  			return -EIO;
>  		}


