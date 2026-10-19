Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0DEA3515CB
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 02:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792376250; cv=none; b=Z/SnfnHq8IPASG5WUAN82ebbH+y3fQZN1GHoP3mq0YYhNFNbr5od0HP9fbnYosZsgux8MqkTnmtePobEuNV1XB3ozn2PsiiZrrENZdT0WOLkY395l/H4nAc6cugSYOIGNLoSutgsYdxXxDsWsdnCOpM1L5+SWoSjdThQ8qgSse0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792376250; c=relaxed/simple;
	bh=NJJGDOvEDiGRbIgSFW8MSvLC/yadQm8VHB1EwfkMMck=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gb3DlTY9sHpEe+o9O75FtHkDeXJz6Ub77frmoZRSBjnI+HKueOkR3nITcWzPDfrLSXTIkWm/UbZspZQ0VIQGz+2E6QaSWLTIfHRjHJoUOBXubtmfm6tv0tYzM3XoxexcTNwFpA9F7gfPaCe2sR9b16PkpOKSex7H9WD+IQtLZf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gt.tech.gov.sg; spf=pass smtp.mailfrom=gt.tech.gov.sg; dkim=pass (1024-bit key) header.d=gt.tech.gov.sg header.i=@gt.tech.gov.sg header.b=Ji1gaZtJ; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gt.tech.gov.sg
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gt.tech.gov.sg
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=gt.tech.gov.sg header.i=@gt.tech.gov.sg header.b="Ji1gaZtJ"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3514b90bb89so4066648eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 19:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gt.tech.gov.sg; s=google; t=1792376248; x=1792981048; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NJJGDOvEDiGRbIgSFW8MSvLC/yadQm8VHB1EwfkMMck=;
        b=Ji1gaZtJEp/1uK1gCSaYzNSctLm3210xuTsvphqPvtrWYqsg84IMWG6Dei6f3R/VOc
         uxtHffmtH9WIX4yZ/tTW982pkisXW5Ab+dHdyYtC4eZgfO4Isq/1bEPICQxN67+NAPMo
         sA9/7f8GrIj/TNGP+52oDO/w974N5E5lkrhGU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792376248; x=1792981048;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NJJGDOvEDiGRbIgSFW8MSvLC/yadQm8VHB1EwfkMMck=;
        b=UQAhbM3sn8qincwBDLz3IeiOc0M/p37/C+zdYtjoHNcseHtiewx1alhFNX6dSnU/u/
         vEGPkefHhLa0VYLNNfZMY3GGVyoDTYhqut1Ug1mbHj9F3QwglvP63QjA6GkDwdpqOIA2
         6wO7g7JsNfc66dCzHB9KO9aj/vf98CFQVqZB8bHCrzogKsQYXe9kVHmf1kzwZO7bUpg6
         FybALd64FhxcRfE0/Y4wx3eVag2oqAhceOuMVadNweErcjhPdjgDSalw9HIoMRUKefT0
         XTTS9ajO73/WjNLuE3yGTR3k+tdwgc4m+4UEq/E+sPytfdy5bn90qzgyYxG136M4ckZ1
         IgoQ==
X-Forwarded-Encrypted: i=1; AKwUvBxAx7Lldsvs3jA8wuxiCf6PsEch/PPTUDJ7F/+P5ovJUCgiy12gVQU/GAD8pxMetWI4xshmYxe2wHui9MI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKRhzosooa/3QxcIx4Fv6OpshcUoiNuvfEuTJ7Yrdy4P0TcPFA3
	j5FOFLJfOpxSsWoEiAYimvhaSXgD2MejqvkFwbFPOahoHkZCyZx+odlZzVbPJq87G3U=
X-Gm-Gg: AYBFou2Qi7TteVW7iMde6GCS7XC28900wj4btULS66rWr64w7F0g/yKjz+jLK1Y+yTW
	y2KTORHBhqH1BldCaCOMZrFYEvmnSd6A4HkYQjigv1oBngLytpvI87HVTiTb9y0hrthEFTBevrn
	W/1QNRndODzI9JaZC2sprqsmwlwmlDRHE4t/oRVSwMw7fxkvMY1jEBJixk8w299RxhZnCx7A0Ww
	BaqU82hIMWdSrW/RmIHd899lyLYQhqd6wHcyTh0Jtbcw+RXqqwSnnHxGkqrH/VAYgdsMPKPdsiZ
	6gHdMw0xM/fXpvRo0OeKgoGZZXXG4q/uzuknxwOrb3VX08oO2/SF/USM+lg5Wy0l5EWvW7ww6BB
	3tR9aRX0J+QOPqPGOieW+XFi/AzSJAvfYAjSEs0+8e6+f9x48LTPK1BsHfOqObQFolnXmFMxYuy
	KJ7QjB9rS5RMO/lFRFblOrGR1UI3vw73ENVh0sY95mS//bTyUROUtrkZu5cMO+eyZifvdGNbl0W
	u4XcmOCsiZSbayLPPoJYUn4wt1Xu60WYTlMwtCtBs/TfO199Xb0Z18=
X-Received: by 2002:a05:701b:2207:b0:136:c443:80e5 with SMTP id a92af1059eb24-1876658f6c4mr5983797c88.6.1792376247926;
        Sun, 18 Oct 2026 19:17:27 -0700 (PDT)
Received: from LAPTOP-UUUVNN1I.localdomain (bb119-74-6-224.singnet.com.sg. [119.74.6.224])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-18314b1722asm25766382c88.1.2026.10.18.19.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 19:17:27 -0700 (PDT)
From: Wei Jie Law <law.wei.jie@gt.tech.gov.sg>
To: andrew@lunn.ch
Cc: 98lawweijie@gmail.com,
	Thangaraj.S@microchip.com,
	UNGLinuxDriver@microchip.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	law.wei.jie@gt.tech.gov.sg,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	stable@vger.kernel.org,
	woojung.huh@microchip.com
Subject: Re: [PATCH net v2 2/2] net: usb: lan78xx: reject short register and statistics reads
Date: Mon, 19 Oct 2026 10:17:13 +0800
Message-ID: <20261019021713.150059-1-law.wei.jie@gt.tech.gov.sg>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <ce3a8add-3bf2-4507-b778-a0f8a10370c7@lunn.ch>
References: <ce3a8add-3bf2-4507-b778-a0f8a10370c7@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> You are assuming reading registers can fail with sort reads. To be
> symmetric, don't you have to assume writes can also fail in the same
> way? Should lan78xx_write_reg() have a similar test?

Thanks for pointing out, and I agree. This will be added in a v4 patch
request after the 24h cooldown expires.

> If short reads can happen, bad things are expected to happen. No need
> for examples.

Will drop from the commit message in v4.

> This belongs below the --- so that is it not part of the commit
> message.

Will be moved below the --- line in v4.
