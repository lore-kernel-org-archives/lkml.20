Received: from mail-pz2-f40.google.com (mail-pz2-f40.google.com [74.125.228.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14BB84A64C9
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 06:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790057521; cv=none; b=kWKEqmrglHLy0lpIddzaC5JESBaMaLukYTcBzMoL0iRaU4CFcSIOVKnoBl78mMZIwFv/mvph/3/1f1+LTSVNccsJ3XllilnxLUDG6gcV0ObP9wEL7x5/UAilw1k+WGhZkZr+7b/zGjKTMP/2xL/oiznCf3AENqhq86WsSAcoJsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790057521; c=relaxed/simple;
	bh=E8YVM0lkb/F4gw1PQaH0+hECNdTEEr2VOF55Jy5TLIU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a9+3/5Dj2jNN2CwhRSL0ndHJKd2+jak1cZlKWrtWW6o4fdv0dzyhchDWXhAeGlc0UiHguwt9zXlz2TAGpvfcaIUV2oBb+4wstrGT0ycjyfSCY1g4IGRk25QuEQkqxvPb1+IFOIffWb4C+qvhGeD5GnMp0/TK1AGMrpuHNBEFs5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XwDCT5uh; arc=none smtp.client-ip=74.125.228.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XwDCT5uh"
Received: by mail-pz2-f40.google.com with SMTP id d2e1a72fcca58-87ac7657a24so786269b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 23:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790057519; x=1790662319; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KARpXPYlM2wZhUyrKSogeHTLUD5EXLXuvN4rvW+uIK8=;
        b=XwDCT5uhRQ7K14nuhlXtK+CQ2AqUDac+8WMSbMqe+SkXu1wBNlvnAHjU88ECcE5PKO
         6Wd+5lYk61vWgybtcS8FBCg4AxLq0by7j86V99XCCmQw6ctrdtmr2nSrkdcluSZoVYT8
         Bzqv/RjNZ34vgCXJUKcAbSrTT7mU7tKsb+YFpjOPhH7m2f/qczDzNiFgG4DWIzjGrry6
         30NAntTrCbHMh4XXNGTyXyUUA3eyu6qbGNLJusFpFn1KxcLvWJ6W9VMy2KBihfmE4Dsb
         xHx0BNljnBeYWiIfvFWthcyaXArCAp0DSu5bWZkjrfUpJZV3mjNvBqtXnsZhOFsPSmRa
         f7GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790057519; x=1790662319;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KARpXPYlM2wZhUyrKSogeHTLUD5EXLXuvN4rvW+uIK8=;
        b=yJi53ufr579hBdIrT1NF12xGDTzjTPO8yEkwxJ+LTIl+1BSKXusA7Z5Ob/DCOV0B/e
         mb6ua11gUi63eI06s70PR2chhMGEmiFKmRFLX0Tcxu84wmHu3IBXi02rctoJwO3rcAGe
         udgvYGJ/JRIDdZ+4C46mUWIVu/QfMiq7ux94XLBZR2/Yk4gnRbnzHHYVmDoOXU8UhY4A
         39EwpP/xQYW/58Nzlm4cyodP6nvGCCLW2u7GhHj24AK3+9VZJ2ZiRnUOfpmIc2TEIUOs
         7xvELJ6uYJEMOnsSioldFofMuMd3qxpKOzBtciGIloKCAAEChwY1ZZJrim1izJLIt7+L
         mrNA==
X-Forwarded-Encrypted: i=1; AKwUvBxvvDJ1P/4vj9WVP1YF4avr6ARw2qBbLnk1cHNMt5eVOmYpn+35Osh0rbjXnaShxyJPqSYM4QbMJuowvKE=@vger.kernel.org
X-Gm-Message-State: AFuF++m8ZtEiXgQiXTCqRBMNSpoC+k2pG9MykCBbqlqtU1MaiLch/DL/
	vcm/FvLUYNe5JbWg10kGh3EPczmT57u/6PA7OVwV8nmXjcpo0k6jCd0e
X-Gm-Gg: AYBFou27gCgx/Uf25HZsmPFuFa6yDVWNPCjuG7XFPa++brxa4v9Ahh+wzjA/g008VWZ
	ipW0zzQiAfwMZxnuBmIIvVBIMt3lnP3il2xsSaniTh44NiQmdTp9EEjpph6CwvD+zRY2BfWLrDo
	2bSxXkXq2BQ21hmjYXYKABJaAvgW/Pe0+w0igxaIrAOCtij8v1gjJ7fxoHJCtsbV+QlFtvBSVHc
	VbIC2eLSmHqkh+WLs5b3fkAtNFduPI2BBMAf+FXdzxdtRRj4RxSL8VjwD3U4uQAd2FyViU1AgTj
	JcIiJXUTtY1UBc5XGZzrooaZJz04V7DqvPTilf8x2xSH9/IZRSKJ6pUl8SKFbVPynHd/BwPzcuc
	nCxFjm7fI9Gsr4fygqYWqWkl0oW6VajtQFbZX7f6lV5Mi3mEyw1HlVi3BVSCRoVT1YsXtu+5v/W
	kljKp7xRP+AVk2J8ryItOmdzbgfTqjTG2FjejD4E1jSA7aU/7ChKxAa80U0R2GZq7ZFPs0
X-Received: by 2002:a05:6a00:844:b0:879:1046:f4a2 with SMTP id d2e1a72fcca58-87c83c49a03mr112992b3a.33.1790057519137;
        Mon, 21 Sep 2026 23:11:59 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87c31ee8a96sm317135b3a.20.2026.09.21.23.11.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 23:11:58 -0700 (PDT)
Date: Tue, 22 Sep 2026 14:11:06 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>, Damien Le Moal <dlemoal@kernel.org>, 
	Niklas Cassel <cassel@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Minas Harutyunyan <hminas@synopsys.com>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Vinod Koul <vkoul@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Damon Ding <damon.ding@rock-chips.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Heiko Stuebner <heiko@sntech.de>, linux-ide@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org, 
	linux-phy@lists.infradead.org, Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [RFC PATCH 4/5] usb: dwc3: core: Adapt the return value changed
 for disabled blob
Message-ID: <arIb22v8tjUBpGEn@inochi.infowork>
References: <20260922024724.191412-1-inochiama@gmail.com>
 <20260922024724.191412-5-inochiama@gmail.com>
 <2026092202-armband-avatar-0dd7@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026092202-armband-avatar-0dd7@gregkh>

On Tue, Sep 22, 2026 at 07:34:31AM +0200, Greg Kroah-Hartman wrote:
> On Tue, Sep 22, 2026 at 10:47:19AM +0800, Inochi Amaoto wrote:
> > Check EOPNOTSUPP for disabled helper function as the change in phy core.
> 
> That says what, but not why.  And what "as the change" specifically?  Be
> verbose please.
> 
> thanks,
> 
> greg k-h

Thanks for this reminder, I will express this verbosely in the
next version.

Regards,
Inochi
