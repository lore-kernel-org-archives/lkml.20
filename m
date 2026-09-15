Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78242442374
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 10:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789468798; cv=none; b=bLqU7Fabshy0JtcDLiVPnTiS0x3ELTXFvPbpn9kXjiTI0yAlceb0Ko1kwufE+Vq9lIq8USmr28iWlAbDMtwJ3dKGeo9Qj3NqLGXwuHfWjb6D64O0bDxZQzRs0j/9dolffFg/wbEqu5eivMWiJB60wy05bnWeQ7kbMQYftUIgORo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789468798; c=relaxed/simple;
	bh=tcI931i4u8P1ZSsYrMD8we1x90i3T/XXK/hoYTAcaIw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=s5ecLCudl8gM5Z7HDWH15CwoktJDQ8uGB3XzbARxtQBrgLb41fC7BAuxWxypMGysfHuIlFGPORZo/SycJyNYEJb/nbzupPMDVf9pG2f+7o+qT923iFAkWovylR4QlCRMM9UuceFhhK0oFIVJFfSU0bRYvAKCWloeJUOVGdcH1vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lpRjl+LS; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lpRjl+LS"
Received: by mail-pz2-f43.google.com with SMTP id 41be03b00d2f7-cc4c08393dfso2151441a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 03:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789468796; x=1790073596; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Dq59aTjp4HFxyWvEqbSyMP71FWosCOm3vRvqmE7kBIk=;
        b=lpRjl+LSw9SaFhIabK5+7xPhJIRPBRhNhcgD1IE8+GrqQQEsZt0TQhDPvm2tvm3Ext
         crE0CutV0BfxGzqPpnPlCmW5WnluCz6txvyCOWKyim/dk+mtTdt8gxwZgZ/cFLOagXiw
         L+4yWKZ4Yw2LT1tnMRREJ1pZo7BmXfrphLj1oL+fAKAu9EZLAzRJDsIlpstQB/JH+myN
         LC0duOS1hUlpbG4cMiCITf8UW4d0v6NtrOFmXIlpk5binqSohMWsh8vbSnJTGCFUQQPA
         PIvruf79icAM17ncCvCLKrd86F/k+dxu2rtmOg7ez4DSVIQUkCkP0vTfYvz9Rzp2W0df
         0kMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789468796; x=1790073596;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dq59aTjp4HFxyWvEqbSyMP71FWosCOm3vRvqmE7kBIk=;
        b=KF20DjyTAWINmX2djn2jZZS++tTue+ETGh1sL1zSz6l+N8j1Z5xuhfHGYQFKmhuoW/
         KNP7bJB2tprBr/IfHx2NtSQ9sscgFAu+QeYxfKrMnuxVDQi21YFYkYiQ2Ev6E9sLR7Av
         i6sLybApUXrt2oWgIcgmFmo6EmrUXpyqilHaXmDSec9UZWfMRhrva7aNCILxnHWJwDi9
         S0nrrIBP5kcr+sOFqYWVMZaZ0QQYh+rsog881/Cfo47giNGIdrOfkcua0VeEHt5vnE6N
         nvsJ/A6jOL2OkhhWDr5KsUFYuP8fIrkFDrgvckDvuFf3UhWxl2Y8D7b4G86hfvLhEyl+
         4OUA==
X-Forwarded-Encrypted: i=1; AKwUvBwAS6Pg5v6KHvEKLrGqjBQE6BC138hkL4c1T4XsbflG7d4EDgDu2GpWXsfW3fJ/mR0mDP7dBSwgtsUMTy0=@vger.kernel.org
X-Gm-Message-State: AFuF++mYQOfY2ctqrUzhpaIkwTCQW4M+YTLF1UWm/T51m+UYCpKeUDPv
	D+gNDEC0Kycp7D0KDvG+2aHir2LM5JhKG6LiD63xuFpwrmq/1n9MWyak
X-Gm-Gg: AYBFou2P8bgqBkxBBGjf8UC8QilVo/MoOg1dg4fGFy2BxOqvF5iP0+x3S6VAGuh0tF9
	0iiv7aJjjwwJQJDtn5hZo4fhBscpAwYKymarG72k5x7gpiQdrKc4B0u0+xqVDvNoypV59OsXLXF
	wzt/hLfYk8AxNfG8yfDmbIE6IwsJ8o9g/nXOxAxkOmxJeFPajUBpt0/fj52vRZrbLyM+Olexs5T
	4HKnRFDVRxt44p1iqjlsbXhF1VUxgD3VcJGJaY1AQeG4t3RmvihWGv/eahqBS3QCYbfT9DbL4y8
	Lq5bdCY+d1tx/KS5a2mXgQbWR4vT6ANtHdO/CFbAykhmcz98VOa1iYc/1wSO+m2gS6HIP80H0ea
	8k5kJThMzkJyZSCXJCFEqL3q+EA1fTk6E+irQB70Pnc2c27QtGAPuW7MVpjesT1VR29HVKdnlIm
	sUyVXVOewZ6Z538R1trmm3cHCDSECvmGQC8m+7s9Mio1F/FCkIloACNQ==
X-Received: by 2002:a17:90b:134e:b0:396:4cbf:45bc with SMTP id 98e67ed59e1d1-39dec04fa58mr13238735a91.16.1789468795714;
        Tue, 15 Sep 2026 03:39:55 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfb8b7561sm1924883a91.1.2026.09.15.03.39.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 03:39:55 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Zhaoyang Yu <2426767509@qq.com>,
	Sean Young <sean@mess.org>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	"Igor M. Liplianin" <liplianin@me.by>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH] media: dm1105: unregister GPIO I2C adapter on remove
Date: Tue, 15 Sep 2026 18:39:45 +0800
Message-ID: <20260915103945.2364107-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dm1105_probe() registers two I2C adapters, the regular adapter and a
GPIO bit-banged adapter. The probe failure paths unregister both
adapters, but dm1105_remove() only unregisters the regular adapter.

As a result, removing the device leaves the GPIO I2C adapter registered
after the dm1105 device structure containing it is freed. This can
leave the I2C core with references to an adapter whose backing memory
has already been released.

Unregister the GPIO I2C adapter during remove, matching the cleanup
performed by the probe failure paths.

This issue was found by manual code inspection.

Fixes: 0017505de0d28 ("[media] dm1105: GPIO handling added, I2C on GPIO added, LNB control through GPIO reworked")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/media/pci/dm1105/dm1105.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/pci/dm1105/dm1105.c b/drivers/media/pci/dm1105/dm1105.c
index ae4544042a74..ae7954cced0c 100644
--- a/drivers/media/pci/dm1105/dm1105.c
+++ b/drivers/media/pci/dm1105/dm1105.c
@@ -1195,6 +1195,7 @@ static void dm1105_remove(struct pci_dev *pdev)
 	dvb_dmxdev_release(&dev->dmxdev);
 	dvb_dmx_release(dvbdemux);
 	dvb_unregister_adapter(dvb_adapter);
+	i2c_del_adapter(&dev->i2c_bb_adap);
 	i2c_del_adapter(&dev->i2c_adap);
 
 	dm1105_hw_exit(dev);
-- 
2.43.0

