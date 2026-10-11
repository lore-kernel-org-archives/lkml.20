Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 691031C84CB
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 07:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791704979; cv=none; b=L9NLR56GqObYUUFnFKeIhrrzNdlegybgCBoQuo+8/Dz4lcEnCUOCUdBc8CRg0j+grC8gAkQakVf+Vu9tZ1EI+kiBtFb+F53WpHoydu8nm8pLK7b+H8m4A5EKYaHyVpKPSjO1pZ+ctGhyX/Ssx2xhvqqtm25h8X9AXLc1QMiaBwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791704979; c=relaxed/simple;
	bh=O33tGh5hqvAA1/0BIQxCng5wAU7PH15eILlQ+R/9A+A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XGyoKeunB9+T/oPGGNq+lyiKPsCrTvXJ6ecvS3R5BQaObbvgTKGfCzsTdlPpAD2YWA7zNGxdTkyBL5tleTc0QMWkD7HzU7kf0IqCnmGF2c5Wc0022bhfIurry5rF8xS63qguEgByHwLQDMY0drbgLNBOmsjM0ZinMpwGV/22Zog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KDoKtmvc; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KDoKtmvc"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a1688d7769so7784365e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 00:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791704976; x=1792309776; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=O33tGh5hqvAA1/0BIQxCng5wAU7PH15eILlQ+R/9A+A=;
        b=KDoKtmvcu2dNX87BGHExwDrIbfMMm44UMGBCf3vsdZWx772k79g6HpCzEg/99CZ+VB
         YSdFBtcJyOSjLIR7NYMedEnnnZbGi10g+nrPxVMdIwMIui4XwLLRJXoUqEawUTGRyc3h
         lDouK8/rfr5OpWcjytVPXZmCXFJMQIjSSSwPHmgmlje8697VLjCQs5eROoO+aETtE44w
         k+EsZHlLWztdomLznngN+LVOOuoXjcHO0RHXn5DNMs1YsLpdcG2yeBWWsoO1cRlD33gI
         tAfSxq1Zj0z7kG8fGcwnJhh98oCCfAz2ouMJNLUUQA/HpahWDMU7HmKQDLkVnHL/YXUK
         1K9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791704976; x=1792309776;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O33tGh5hqvAA1/0BIQxCng5wAU7PH15eILlQ+R/9A+A=;
        b=vSNvccAbmD4YlGLe/lvGptHQCL20EA3FEW1qA8IFQocpDYROHI8/fkkbGCIetq4zaW
         HTmdViAbDtK5Hr9fxHCEx5xlxHSaIzePr3mmCbPNHPmd3Cv8KH7M58F+ygYjryUtFp4P
         Dc/coh5zC9KGnHgol4ZS/IdMKW5oA0yrI75skdP7Ptlq17cn9nZCYLIAGt/yLlJ3R4Oz
         T0B0zGp9T+e74qEnaiYxdCkYJlsszHDzuPJJsgGnBdh5kXFcSQP4/yS2Wq2QcRHWEoIM
         irYQdHhCQV/nzR42gGfF7yrg8mlSlFTVdghrVPfGS9+Z8JyHx9vzUAR3mqaCxC+5ZVx6
         qAYQ==
X-Forwarded-Encrypted: i=1; AKwUvBy6IhBqR/CYllLkZ2ECo+hiKrf6GRhfXCKw1SSeEdny65DXWCt3lWcVgX/tZWdOKHBfl5IAVDG9w837UFQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJeWTwwWQrDtDDPrRsfESt8MrQ7sArJEX3XCuuXC8vp0sc47hrx
	7QB8vTuTUWGf8iLchMBs5AKWMCF2T0pvnRGzQ4bNIoVRlk3fgWeIVpg4CyvaJtfFzlc=
X-Gm-Gg: AYBFou3XLViRCJtNh7QxDyAN/azYNOZFLEkgIeaJWhV4N+ME/9WAk3Ei0U5w0f7ug+B
	kx3UqeZqIOiYuBcRIS2eIku2NSn3MmZl2ljPMhQl1+S37RDW+OF7u2pWH95mQL/sJblMoi/ehnj
	Fr42QXdJ6l8+8chXuht9HQsFGUWzip+p2dY5qn04AA+adOz9a6FxtMgOJeMFxc9yAfkEjULzZu/
	Sua9j6YE2gGqJvq1iaaApYi/NsDr/CTdkGWkZvpDY4K/bNqYcqadEyPs1DXXXb5gwrZAGeqVR4+
	1P/MA4q+GodwhMyDbLiQ4sKLcbpzTsGqoCmv8TT0XmV2RVUlRK0hX8keJ2rc7Lt7DoR5MqZw02t
	FRsfizoXkZO80eAR7cvHaknPH9sg9UG8Ldaj8EVpb4bUj7sdiSaFaGjgyduCndeIYC2aDm6YhEP
	F8ZJbtGblRIwPVmsMsDNI5vfge/UC8zPG+NVcG7jXOLxcVSIMOhHcP/8kaOEn1+CWxInR4JFHwx
	xvj4XqASYdIwDCLukABrw==
X-Received: by 2002:a05:600c:4e43:b0:4a0:1f90:594b with SMTP id 5b1f17b1804b1-4a18e4b67e1mr100020975e9.22.1791704976374;
        Sun, 11 Oct 2026 00:49:36 -0700 (PDT)
Received: from FranzSP11.tail2d6612.ts.net ([31.31.60.25])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a19c8244edsm24355765e9.2.2026.10.11.00.49.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 00:49:35 -0700 (PDT)
From: =?UTF-8?q?Fran=C3=A7ois=20Roux?= <franzelfranzel@gmail.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Diederik de Haas <diederik@cknow-tech.com>,
	Emmanuel Grumbach <emmanuel.grumbach@intel.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] wifi: nl80211: don't WARN on a missing self-managed regdom
Date: Sun, 11 Oct 2026 09:49:28 +0200
Message-ID: <20261011074928.9381-1-franzelfranzel@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <16aa99921c4e92e8d4da3c84aacbec2e673666aa.camel@sipsolutions.net>
References: <16aa99921c4e92e8d4da3c84aacbec2e673666aa.camel@sipsolutions.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Wed, 2026-10-07 at 16:55 +0200, Johannes Berg wrote:
> I'm not a fan of this, I think the drivers should have the regdom ready.
[...]
> Anyway I think we need to fix the bugs, not paper over them.

Fair enough, please drop this patch.

I've sent an ath12k fix that applies the boot-time regdomain before
ieee80211_register_hw():

https://lore.kernel.org/all/20261011074433.9187-1-franzelfranzel@gmail.com/

wiphy_register() holds the RTNL until wiphy_regulatory_register() has
applied it, and nl80211_get_reg_do() takes the RTNL too, so the window
is gone. On the Surface Pro 11 the warning no longer shows up over boots
and repeated driver unbind/bind, where it used to on every rebind.

Diederik, thanks a lot for testing. As Johannes said, your BE200 needs
the iwlwifi side fixed instead.

François
