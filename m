Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8751416853
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 09:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791106496; cv=none; b=ZqdQP7WYtlf4c7JWuWfs7veWuy9wiacnEWXNpFy6jlv0oQ/ndERvFkpIebOQmCoNGI/uqjmOBfDPxofIP+ELEXllILgp8mi9qJZbBPgZrrGpy5NbeK6K45omUL1FZbzWlJ0aZnnLVEvCHxR75vMO21cvw33VeawhQhmfn9J8vrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791106496; c=relaxed/simple;
	bh=WGiqPu03Hx9bYtodW4R+dJT8EyhvwKq/2ya9h1+2Mt4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=vAqrllpyo/HHjBe6b+lnUpAiidXRLBa5GImhWXOQl8o7eHnfuQ+unbX9zIcGvTOJS2o/0CoTE2ocNwXZWoXG9b2oC0ywaE8YcHNGXl/jb6n6kgCSPRkEX2/y+POUF/gHdReHcK11GY1DHHznZEepU5bZIS4Q8MrjfCTnPGg/iWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nd3XCK01; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nd3XCK01"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-86aecf49833so101504b3a.0
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 02:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791106492; x=1791711292; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xMFsAlTkgLQleDkb6BgHggPAQsd5lT/CEjafnTCRCdw=;
        b=nd3XCK01dCMPey50rbwtI+hfsRKQWrAmJLFbL+YCGlh9J4LvT1xLjAefoNbN81Yhjs
         5kyxhh+GS8gOijFjCa1/HyAtWT+fnf6lb7VveTGyTT1CkAsHzmX6fCowEuK1a89BPoaX
         aTA9o3yFwdWTlIttPZZ2XM/IOsSrvYRlVRbO+vcxjXH2rHqhZ2q1sL25f5U+iRyfLtoe
         ZLsyQ/PSy/MS0deM2orWCsuNhJTa1yMDhkzCzOIIpiJoSdcsAzbR2zhj6FABW5XOKmd9
         Mr/gFTSKPMMDd11rHm3V/K37qBZBy0i3xD6BKVuEvUYwwg9/NJUHMrk99sjI/pXdLdI8
         7uVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791106492; x=1791711292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xMFsAlTkgLQleDkb6BgHggPAQsd5lT/CEjafnTCRCdw=;
        b=oQ1PkGadjqWMZ8Hl0RGOIVRFthit2ObPf5PRDwWCsTVo7nr2YYuhwFSWuv9AWJ9dNU
         k7gO0zpTvK+Iza0zcZzus4owGPP0Z9jyic7VSVEkeJO7lSuoG4gqBLMGoltZ2xyZZ3bG
         XON2vHGKwnKGQ6MiwvJxZfbbAAaF2fmHuCIjOtR0WSbzRw5kvqQdZSFgdqV1XV8yqCTH
         3ghXc/R2P//WZmFDiLmQUrKj5GQ0+RzXYZq1rZ3Ty94ZHj5EhSN5uRYbHoCmsYlbdAfR
         NcsTmEFiu/r/pp3hSIHxnjbMA8XNX8L5ysbd9usQeTfjfQv/rp8wfp4wzHu71g96f589
         uReQ==
X-Forwarded-Encrypted: i=1; AKwUvBxGPrg/StqEHyNr4PfwebcnOKRDbG0SjE4hCfsHmGadEOWWaR5pSNXAJQALyKBBWa5MP5exWLHrXPuwwVg=@vger.kernel.org
X-Gm-Message-State: AFuF++ndH/NWhTl6BryUGzHM0LIlOqCAdcT+gyAX+jVJJN+yNR/xHzrc
	2FOQ9DrUiHFR4SjZ/8S+xKjSntA2Thvp1hATUZoUlIeSg3ph/hcGj745V8MjMiqA3Eo=
X-Gm-Gg: AYBFou3PQv9mthl4oiSWKJNAulsgbyzvR1il88RUxadsRt/EUSpI6ZWMa84/keEZHEY
	rIL0uHQn7taKgKhBjeNuFmJQ+lGSkF/ueQanlSU5trM083Xxki1S9FrdeHJrG9YtZTb7Ac8mFt3
	dxD89fizYiI5H2P+q53ISkM3WJoTwBFIV39VWeaFdxHsyqVuN3ifpqH/pp1xW30gYS2xtu+TmVw
	3OlyuD0yFDKDiGkT2rclur52j6V9bzxVDudtTx+BCqk9sEEnRV9EJ2je+5t4HPufuaSKgZtZbyi
	vmq7//BaniJl2sXww9uSNXJYYYSzdQeVCreVYb8meePCbyLy2n3ZT+1o1xvXjqU9z70lM+yskh5
	x1Im9+Qt6k59F+IWqy8bp29eK/tBO3G0buXZIrWj123T8UtBTxtvc16C+5PNSaCbgvbxcH+ryrP
	qb4Hr59WsSZToE5gRS/JlYPAotsrQ1CJk2qQq0CgJtdknbcFmZEDEfW451RV8g8dW4LhSHgBL/8
	WGHHXWS9SPDjg==
X-Received: by 2002:a05:6a00:2d92:b0:882:4cdd:140e with SMTP id d2e1a72fcca58-887fd634a7fmr6960101b3a.15.1791106491984;
        Sun, 04 Oct 2026 02:34:51 -0700 (PDT)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88d62aaf2f8sm620337b3a.10.2026.10.04.02.34.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 02:34:51 -0700 (PDT)
From: Joonhoe Kim <26rote@gmail.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Joonhoe Kim <26rote@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v8 0/5] Modify interrupt handling for eUSB2 Phy targets
Date: Sun,  4 Oct 2026 18:34:49 +0900
Message-ID: <20261004093449.74244-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20260913-eusb2-interrupt-v8-v8-0-0f505b9c394b@oss.qualcomm.com>
References: <20260913-eusb2-interrupt-v8-v8-0-0f505b9c394b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, Sep 13, 2026 at 08:10:43PM +0530, Krishna Kurapati wrote:
> Changes pushed on top of usb-next branch. And v8 is only compile tested.

I ran v8 on a Lenovo Legion Tab Y700 Gen 5 (Kaanapali, M31 eUSB2 PHY),
v7.3-rc4 plus board patches. Host mode, wakeup enabled, s2idle:

 - hub with a FS keyboard behind it: no early wakeup in 10 RTC-timed
   cycles, and a key press wakes the system (dm_hs_phy_irq). Without
   the series it woke up right after entering suspend (dp_hs_phy_irq).
 - FS keyboard directly on the port: a key press wakes the system.
 - unplugging the hub during suspend wakes the system.
 - wakeup disabled: no change from before.
 - low speed: not tested, I have no LS device.

Only the m31 and dwc3-qcom parts were exercised; the snps-eusb2 change
was only built.

Tested-by: Joonhoe Kim <26rote@gmail.com> # Lenovo Legion Tab Y700 Gen 5 (Kaanapali, M31 eUSB2 PHY)
