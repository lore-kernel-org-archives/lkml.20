Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D9874D5998
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 16:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792340788; cv=none; b=d/xdMTWA9xYr1tHlb3FFwUhMcarWxRUojnXSPLt18L+cKoMlWiZ0lW/iMTCYjavVEbXhGoM5VXcDhjlX5WcckwtvVWWhV2UVetoSWhxWnRVoQqYLT4CtLF2ttfnxnW3OgbaodneZFlSCSJXsUKnYw+G0rbZI1q4fYR0prEQPOZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792340788; c=relaxed/simple;
	bh=G4S1n3I+vN415jixgniNKq1lBfK4ap4+2xCFZJvljTc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MLCRhSa2i+Zpg4Z3nUb4iEg/TxmF8QRlSsMwqYBvE2+vvZbUD2QCGexTr2yeQ92qvyTFi4CnTwKwvQsrP42i5wIwq6kdr2qIkAWS/zm2xHQ02x6iRot0a3NP4dG13r3qaQx9QCxPdgqP8IvVlBANaHeURYvvwZCfuLR4ofWbaOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s3ipWvTP; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s3ipWvTP"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cc751eddf25so721737a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 09:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792340786; x=1792945586; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=r4CcxdQ2oJybJSNbjjXimwSvVRvmuOa37brscnwQTP4=;
        b=s3ipWvTPS7U8hkOE5XRzFbEkyhGh1zx0IZDL6mKYeUaw8yLilO/+a35SVpvc1gs6Qo
         RIWx8aAHYJYa3B29rWipZXYB1t3377vMWgqsF8yTITz4Pmbp+jNryGBWrMQdvpGlyFng
         1n3rWPhu/M3wDFS0LgyxrfAmhMQm8XpPIH4jCQKvCuGqO3JoaxNK09dP4wiKyk4ixRxX
         tak7IQ/0lT996uyqIP0CIPrs9kDkbgXkoUSjFx6tdRSvcgUaHxFmp5YxMy5AM0akA0+u
         3TwkQZukKd5AM0ZijSDub40bEaAFMpwsfhzmi8Xgjwq7VKXES1NyQrNxTKMuRxAuI9uQ
         QDMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792340786; x=1792945586;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r4CcxdQ2oJybJSNbjjXimwSvVRvmuOa37brscnwQTP4=;
        b=e/AM7X5RsUCs754iEIs7sc6Pt2pA1BMk7x1RA0a5elW/Y8HdlYTVsDmqQoVPL38X2A
         E+VB4XaCgWLnTx04/92G/PMqUfY04fukr8+RzgkDPrBQAtD1RZgiRbAW/xO7pSCQFeOt
         tD3J0+2EhArEyuOe8GWsinosEgkNS65bheT/Yy6zipMu+cwz1/eeo8GH6W3Mc10VmiaY
         9U0abZzRRoLNuXR1RdOYfFfcYuvdMOZsD9znOH/y7AmG3mrb5/PluuR0p6FnroIp+IAr
         x2e4UT1kOlIPcVTbVWmUlRPWftYkI5RfpGAgNXL4Ydm/8j/47kemXc22AbzT4CCzai0P
         7HjQ==
X-Forwarded-Encrypted: i=1; AKwUvBzCnL0N4ATfj7Ea+LPgDtj1RDpnSxSjrt4gP5P8a80GbYZQi60ZXH2EqVtLdWn6EZly6iRDuC3GRY+El80=@vger.kernel.org
X-Gm-Message-State: AFq9FYLJJFr4JWKfBz55tu5yyuLCRcNzymsTN2KY/ciQi2RQBDMXEZ0Q
	TFG54Mf2mKj1Opaj7GGcf4kextrUWvqhEZ2EUgooPR8XO+NfsT3TPCZV
X-Gm-Gg: AYBFou3PpicsOzhYmNJm3qlPMvrWHYTE1+0swQWkHpmrW9TlrbwBPAgloud+xSkCrX6
	oBE21sUWe3nTQVCdEoNZDktMgpFSkYYAEOemjWf9a3/s9hSXamhr4o6zu73r0L/EZVCgdBJjFuf
	Ycb7y+JnYaXQfKv7yPGLDLQ/S8oKZYvYX24tjoTpGVKeexMaxurb6M9XulszQHTrRg1Mx8WmXR4
	RprKtceC9AfQ5omB8akvbdVlCtqL3+TYTttMCSusq2UgsI2Zz7UrYIVgRbegO4iHFCPtO9VOS3w
	wTQRJh2pG2R49w53LDI4H08JTrD8jRBONCCSRRFa9GfM8xORSTFahqikItmZDzN+SOBz6DVPb+9
	ixxSDTIfH03IR6Zv81cB3QjYMD3z+5+pxK2vlwr/7RgHeh770gso96PBu+7ZmD/1yKF0koP2Jl1
	z6mUOiCeDyqAp0p5GDkk7+NKEVYjFQApf3abbbr7cBwD5AH36HJekJYR7aAngpXjV5GNzJee1xS
	TtaZLDrWF+n
X-Received: by 2002:a17:90a:da87:b0:3ab:36c4:b502 with SMTP id 98e67ed59e1d1-3acef19656fmr4952624a91.30.1792340785847;
        Sun, 18 Oct 2026 09:26:25 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acc43a1981sm12210945a91.2.2026.10.18.09.26.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 09:26:25 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 18 Oct 2026 09:26:22 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Ian Abbott <abbotti@mev.co.uk>,
	H Hartley Sweeten <hsweeten@visionengravers.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rudolf Marek <r.marek@assembler.cz>,
	Andi Shyti <andi.shyti@kernel.org>,
	Chris Snook <chris.snook@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Duncan Sands <duncan.sands@free.fr>,
	Chas Williams <3chas3@gmail.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Aaron Tomlin <atomlin@atomlin.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-watchdog@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-hwmon@vger.kernel.org, linux-i2c@vger.kernel.org,
	netdev@vger.kernel.org, intel-wired-lan@lists.osuosl.org,
	linux-rtc@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-atm-general@lists.sourceforge.net,
	linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] hwmon: Replace __MODULE_STRING() with
 __stringify()
Message-ID: <49d1de69-ffce-490f-bbee-80513cfd0cba@roeck-us.net>
References: <20261002-module-string-v2-0-fc7438acaf4d@suse.com>
 <20261002-module-string-v2-1-fc7438acaf4d@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002-module-string-v2-1-fc7438acaf4d@suse.com>

On Fri, Oct 02, 2026 at 10:31:01AM +0200, Petr Pavlu wrote:
> __MODULE_STRING() has been an alias for __stringify() since "[PATCH]
> MODULE_PARM support for older modules" [1] in 2002-12. That change also
> moved it to the graveyard section at the end of linux/module.h
> 
> Replace the remaining uses of __MODULE_STRING() with __stringify() in
> preparation for its removal.
> 
> Link: https://git.kernel.org/tglx/history/c/136839a1b4 [1]
> Signed-off-by: Petr Pavlu <petr.pavlu@suse.com>
> Reviewed-by: Aleksandr Loktionov <aleksandr.loktionov@intel.com>

Applied.

Thanks,
Guenter
