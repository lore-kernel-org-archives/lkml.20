Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E695D47886D
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 13:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789394296; cv=none; b=P3hH9tHkEznMpBbnjkdeMP3cS94eZ3g/qhkGkM47OeV0GlsCgHPQSN3qdlHfXCq66hy4jH+3ACDTpXrYsj2S8eapN5iZ2XGNUd7mhhstj5S/X6YqBc6a+C1OrRjK2fIJ8ItB+9DWKtE2gvnrM5Cu78NAcaAtbKMeubcgLb7t8NA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789394296; c=relaxed/simple;
	bh=c3jgo1bRS058EBMsmbRnIwL+70stlkPOtxZ/EtbSprc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jvNAYELR09zWYarVJ+7/xXtKYbNHDAFt1PZwbPalstdZV3wxMJkJ3QY/iPP6NyXcAsn6r0T/Kq8VX/Zxq7UZf7c8QtnF8ooWRxoqstDmUvwSN5s6h6utCjePWMZVmIeG7TGn3qIM7wg/9R6FkK5Stvc22bMuAmI7PyVFW8tr+Uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X8P3lYDS; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X8P3lYDS"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49d1fb0cf5eso17138055e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 06:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789394292; x=1789999092; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c3jgo1bRS058EBMsmbRnIwL+70stlkPOtxZ/EtbSprc=;
        b=X8P3lYDSSzaevm2qX1w22/Qj8llSLNGT0ciE28hFwo4Ea7X9NGFHZISElv1mddFQgP
         ht8Dv2/nn8tPIStjv852MBfOJthrmrmpTV0FdIakpLTJE64uC6pD3vzGVnMaNbqNpxiS
         cCnUropnrFqIXAlRHnzGbMp+JkIf1BfbbK7bKKNz0M/Y0eT9F2yLuO2ws/z2gDS9T36l
         Z4TIIVJgzHrX6ItmD4w+6KRDAol4BwrphEjLczAENcG8mdEbnqjszBgHDIrO9lJaNXCD
         SucXM6lqTy9nnVYAZI0qUk7SfsnJYXvGPYidTv9MeXDmR/GnaIApIgeHWEI8B8feJPjl
         TGsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789394292; x=1789999092;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c3jgo1bRS058EBMsmbRnIwL+70stlkPOtxZ/EtbSprc=;
        b=K+LiTi5OKMFh+msZ53ghW/sCU8RTm+Q33qNTD9CVPtyjyz+fTgOfFbGLw/FgbmMW3e
         1AO/MSnmjzbroSX1IVDSF+76xZYwv5zc1oN1+7tScOokcYE8boWPOZCtOUdYDMdaFRfz
         AwvsytcQHUfuOw84yolQZOo3KtgXDBuHa6ZZmcnEwLtpUeZxCZBWySTJpIho3wNZJ2I9
         IZa389Q1LL8r2GobDygxMw+5P2NV8abY02vxElahQMDz1dWkC/3efgfU9cTGa9/SDglg
         GHONfsynM1sTWXjMa7I063UE4lEGMF0cX/febBqCQpQJ/0LLmUfYTqJK3HWMRuusGEHI
         YAmg==
X-Forwarded-Encrypted: i=1; AKwUvBz4iCGC2uxmWBWG75KM2Yw/wHzaAFCof9tLauZ0Iyv4iz89D7Cd2pcq0eL2Pf/hk83yVMpPthaII023G0Q=@vger.kernel.org
X-Gm-Message-State: AFuF++lyIcQ57A37JSYKQPrd9zSNS9CgpGUr9rI/Fi0m7ekCOjulfFrI
	SIoU7NDFe8QbVAVqcIR1s4lRDeZVY26FN6UjPFVpz8aDCZtmvTybgQNH
X-Gm-Gg: AYBFou2xD5cbSl86n5CPj+rqjNuPYnOJg6zI4MD38Gl4cvhP7KdLh3Ez7tOaAREreAR
	qWel8w1GpIe6lcC0DZPPG9UOdbFMBe7/4t68L29gYPVKbVQ2h8EM3w8cG4mM/sAPdEny9bJEg6P
	FVXKxGYXZbbyfp+jL0ozAkCw2x2S9Scbf/x+NA6/5pDJ48B1Uxdg/U6dxUjuegXI6XI6uI9dVSr
	R9Nkbk0L1uiGDG8A10hAtHymKmSbW4kuZOPVroTA9sz1ZXGtQCfg+5xy7x8phKnfYuYVPzkBzmd
	rgRgG5D2rT78nV5caEfqi793PpAamZTohQlvstCQTcrspZnmPfGMU8t4q1CS1Jrzk+XQa3mxWVU
	TVgSKtiTcZs5KRsoK6gOzd2QeJ5BiHG+J4k0FBPd45A0YgtRRfZDW6750oEahLKu8UxH1f2lV1Q
	NG8Og9mzFDFsxSfZ9X2FQwCjIRrsRubX+7tVn+klsQbar+8HqEyi2rskuDA5wsjFyTaQ9O1Hpo1
	j5WZW0=
X-Received: by 2002:a05:600c:4e02:b0:49d:272d:74b4 with SMTP id 5b1f17b1804b1-49e7a6387bcmr83692415e9.2.1789394291560;
        Mon, 14 Sep 2026 06:58:11 -0700 (PDT)
Received: from localhost.localdomain ([94.252.75.25])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49e71e300f3sm225487395e9.7.2026.09.14.06.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 06:58:11 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jimmy Su <jimmy.su@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Pierre Pinon <pierre@pinon1.fr>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: ov08x40: implement get_selection
Date: Mon, 14 Sep 2026 15:58:02 +0200
Message-ID: <178939428219.2527.444869479328128548@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260908130803.2632-1-okerixx@gmail.com>
References: <20260908130803.2632-1-okerixx@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Tue, Sep 08, 2026 at 03:08:03PM +0200, Oleg Keri wrote:
> Report the full pixel array and the per-mode analogue crop.

Please drop this one. Pierre Pinon posted the same change four days
earlier [1], with identical rectangles, and I missed it before sending.
I will follow up there instead.

[1] https://lore.kernel.org/linux-media/20260904134524.595598-1-pierre@pinon1.fr/

Thanks,
Oleg
