Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 855C14B7A35
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 09:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789722700; cv=none; b=ipXq89gbIv1i2nj+fkfMZdzPUQ7KSmi1g7Kb+2ffknqmW6+fPn4lSuHsBwSwKNZu33m/01fI8OWanqEKkR731ZEPstBPW0xBpPHQZ+n0eoBFm8BKN7I3EwWJJYWOkNME+ClCuVyOBZRwOph8MNYxFP/DZ2AdFHnvhxr6LDYZO4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789722700; c=relaxed/simple;
	bh=wAiKM2GbjVAaJOG3T4th+tKZWnW5DbfM/sH35qLt13k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aUHAva5VvvUOZAeBMMhuDx8rer7HlAYJ5E8l+HuE3kiHReLJBa7gyS0u2fLJYSJSnw/TLhEasCsaoL5oWXLEf/Lvv9ZLCyn+WuAac4SPIFoevM/akmh5zDEc3y/v/ii+gD1lfgU/5MAlijblND3/wNTYAi6NgIdpbv1aTPXu3Wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VpCwDl9N; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VpCwDl9N"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b93204449so167295e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 02:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789722697; x=1790327497; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yZ/vqBSgFHqCJoAqatA3IE2jvlq836FlV9wvuCTBolI=;
        b=VpCwDl9NwhnCzL6tzt1DQO31T0MUc+u9/zaQqGPJuRlPCux2GqE9b1hLgtTRh/HLI+
         HlsPIUMSbVxc0Nf4MkFCVWY1hZWQfDu1soDTOGG3kvdn8/4TVNn49qRpMsNxKdrBd+UE
         0qnqu1bfvqnLYyS+sA1PRpPaNyGfoI9VcDBhwe5WIh6k8a3Oijv3IHAHYIQtaIGRAFva
         AaEy55vwoeCHWz47WWdwL697qNdtmf1WTnkdHBviQnqRHxzCCzbo7TXrYQsjzI/BlT6D
         3Tlk7wmRheoqqEmqsiA0Hr9GCgEswNEmJA6d5Wjp/aS9Eag7kfxRTiIYcvweOd+xtPdy
         9lYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789722697; x=1790327497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yZ/vqBSgFHqCJoAqatA3IE2jvlq836FlV9wvuCTBolI=;
        b=Vl52rPwAE6ZYV2mayqnPwEFT5gHFJl95vwQ79hTmOrXWFhPRy3NrKp10vx/NKP5BuO
         vD+PQQqJPE7RRx1nrP8Th2gNd6oc0DWI40gR04vC6LxOtHSYMJ6lZqMSopkiZdWLiVmQ
         /TapBwlsl5W7Y9e+z98ghjZFg+WeNteFXAmzbASlIFAL+XP2Ek9dve6oVty6bgR7wftf
         290kjQfz+nq0jJiGqHX1RbdoaFlY8HlCFz9bQ57ibvhq8dfzPv8cgiEGPLO6bl96eV2R
         EQHX8fUpa+xmYteWCb8r2yTDpNHaUk6f/MjFNGsrSwU1KTRiS3rJzgU9O+jAfcRUxIwj
         8XBQ==
X-Forwarded-Encrypted: i=1; AKwUvBwPpqacls2CuPoIs49OskoCGtPOUgXdaKcSSqRxlF4JpMwmdPgUvpLotK7SqmYDyG/iCJQkAprLyA0/yOM=@vger.kernel.org
X-Gm-Message-State: AFuF++mfk+NN+Pg1Syhs9PNThTrCV+GInN5JcX0+HxH3ukKBOw4MpFWX
	FW1ZWQv2SCtCGPxlXhh36e+hNpm8psAHbd30hZSyMhtQcsKbnicbwlzi
X-Gm-Gg: AYBFou24cKdVzh+tauCcXvkimJrDDYA2p96HQSCU1ORFuC/HRX0EguWVYo96ti+nGe2
	Czsc+89u05jOoKQRLxy0oChkiRolLy8X0vKFDuv3WksOAKKTx+PfDSggN2uoXyH8iwC2GbaHYgm
	sq8bhqMqhaI1huuCECX/Dcz81pFfj+xbW8wowTfW3PmBDhS4jwTDU4gEvyHgiL41RpZAE3R3QdJ
	uIrtprXiuDdFIbig8IZk/fETJcK+RoW89lMu6zXE9iYepSxHAKeBlouaTCNf64FRrvO+zXOJmLb
	WaTGhI65mnwJ50K4C7L6STLn4vxMjuPRpeSfaqto5vgWYy+Eubi55Qri7RqF64GM48ZxToXFmSM
	32i/l2PzgKmXMGf2fO+mNbc2+WK/aCck2rsoLdhLQ2LrjDZ2RC++aopju5kBRpIpAp0+WZyf0XH
	zlMFlBV4lmzRtUw/2CcM/OyOiIHxJfOsEKLUOIjHK7k7pepgGksFxe7KJYGn3Ntf3Yhvk5vwd2c
	k3HkIY7aqI+TFrK7Bi1Xw6EsZe2Jiet7QmZgX0k5pvznid3FvZYxWGB2GhmfIN+avRM0u3MZl8q
	Dvjs
X-Received: by 2002:a05:600c:609b:b0:49c:f9b8:bae0 with SMTP id 5b1f17b1804b1-49fc7f2bdc8mr18281725e9.2.1789722696430;
        Fri, 18 Sep 2026 02:11:36 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B829B006E521A2A508563A3.dsl.pool.telekom.hu. [2001:4c4e:1b82:9b00:6e52:1a2a:5085:63a3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc7cfd1dasm37167425e9.9.2026.09.18.02.11.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 02:11:35 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Igor Paunovic <royalnet026@gmail.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-phy@lists.infradead.org,
	kernel@collabora.com
Subject: Re: [PATCH 5/5] usb: dwc3: rockchip: fix USB-C reconnect in gadget mode
Date: Fri, 18 Sep 2026 11:10:32 +0200
Message-ID: <20260918091032.15593-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260915-b4-rockchip-dwc3-rockchip-glue-v1-5-763bb546824e@collabora.com>
References: <20260915-b4-rockchip-dwc3-rockchip-glue-v1-5-763bb546824e@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Sebastian,

With this patch applied, the series fails to build when dwc3 is
host-only and USB_GADGET is either disabled, or a module while the
glue is built in. I built it on top of v7.3-rc1 for arm64 (allnoconfig
plus a fragment, gcc 13.3) with USB=y, USB_DWC3=y, USB_DWC3_HOST=y,
USB_DWC3_ROCKCHIP=y and USB_GADGET unset:

  aarch64-linux-gnu-ld: drivers/usb/dwc3/dwc3-rockchip.o: in function `dwc3_rockchip_set_role':
  dwc3-rockchip.c:(.text+0x270): undefined reference to `usb_udc_vbus_handler'

With USB_DWC3=m and USB_DWC3_ROCKCHIP=m, modpost reports
usb_udc_vbus_handler as undefined. With USB_GADGET=m and the glue
built in, the link error is the same. With patches 1-4 only, all
three configs build.

dwc3_rockchip_vbus_handler() checks dwc->gadget only at runtime, so
the call to usb_udc_vbus_handler() is always compiled in. That
function is only built with USB_GADGET (drivers/usb/gadget/udc/core.c)
and has no stub in include/linux/usb/gadget.h, and USB_DWC3_ROCKCHIP
does not depend on the gadget side.

The same test run also shows that the two EXPORT_TRACEPOINT_SYMBOL_GPL
lines in 4/5 fix the modpost error I reported on v14. With them
dropped, dwc3=y/glue=m (the v14 case) and dwc3=m/glue=m, both with
tracing, fail with the same four undefined tracepoint symbols.

This was a build test only; I did not run anything on a board. An LLM
assistant wrote the build script and helped draft this mail.

Igor
