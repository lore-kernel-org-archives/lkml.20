Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793606617;
	b=pgFAYVEnsV6tMALEFnV04fqrRvMnRxu2kaIgTAl/NWWd9Z/O7C4PPyyzIIxDy5fA9Hyb
	 k0+ZtgsYbLzcfsKgnZRGJoRPln4RxXn8xCxeMIu5pV1aTZf/SUA1Mj56ke8aEZPiXiBeB
	 l3tqvHRsUACHjd3ET/7OlJL19VFLb2KC/HUlchQkUvB7GZ10T556CIpcm2zluPAIvZI9e
	 2LGD41mHsBNTizMlVaIa7wNFKlWxzpfBCGLtb/i7qkoVsbav+RFA/xRtHBfgp6ZWejEk3
	 2svItdj6jxzrywokuVRfLcKnxWBFkCQF7fTYA4HTgMy1V8LV6hcl+BsIYAXf32HglZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793606617;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ULB0fdcScE3pyVzoGp78pW1Fsjx9L22KYr7UY+zqZWE=;
	b=wNymsKAhDOSVDO83ixkkBkWwgyat16mR5p6BazomycgJLDPsQdPmrU7+d96acm5SpnKK
	 2TGDZr54tZq9ksxzHIyp8hHjuOEOUKxidQDas9I/8BcX30Pne6xbp1l6mwX8tVskQYbp+
	 87P6xpXIkquQOawhLqiI5IA7ZS7gGX/uydLWOCvQ4qCOxmhkFL24qMiAAXCTFrJ27WNAQ
	 ECq1bVO7Lm0CCjMB0gOlrJYdbh/JRoYEd2Dodl+rTvFhYYM2VkoxXsFVvJ4o2Sb66a3Yk
	 Q1djZTkh38WdkoSgKxxn2l3im8c+I3S7izw+zGG6AaGEGExqykLVg2VEpLGIVIkwyxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dPlz9UuL;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D575606A32C
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 08:03:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D575606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dPlz9UuL
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2e7e742a2c7so16991835ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 00:03:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793606616; x=1794211416; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ULB0fdcScE3pyVzoGp78pW1Fsjx9L22KYr7UY+zqZWE=;
        b=dPlz9UuLFBnRXCoaJOT/p8CDqPb4dVxfogMypNiEqVPBs2nTkogTAKio5chRJdk6A6
         0NDHsGAj0fJs4OocteVW3HgLmNW8cMzWXo2JUatd+i/n0lpif+rdEwhF74ZHNZ2wOCh0
         5XrEfqaGqqG3ORPjCesKW3Fo5cpEI4n4srZkMt3p6sxSooboizA5J5HXDBZcLbbw/wXM
         pWiTh2r4k9K+GZH784WKhOv8UrTsI/r+KJEXAjm9rqPMAsF8qpRJce6OiCl6D7FBbJ4L
         qvVOzmrK+rjyNVTPOrsruqfNjGkfZhkaZA2Ch4Vllq7Tw3G5B1m/PkPnZR+t1Lmf0VZj
         ZB0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793606616; x=1794211416;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ULB0fdcScE3pyVzoGp78pW1Fsjx9L22KYr7UY+zqZWE=;
        b=Mg0pNfTnv6NC7lnK1lfK5aADgP/qMbCrwTHRVlpv2ePkNU/4aFhIN67CsVHWTgxFIV
         Rz2S8iXAtuF5DgdfyoeuFHzzT8ZBCNoDib0iQOWAALyeBxFfRkLejUTr8VBUEHexiAyr
         qfrC6hvXPlIzW5Zci7iCkWPAVpjgNi6431NuF1ymOg+F0R7o29kfeM1vQoPxmRyDCW8D
         OQWmsC+D8xtRtBmyGW1yjYA0uG6dcFKhrQda8a8maQ7F9T0PTvNL1ECZH6AOrHDl+sbS
         EJXayOI50yIzvc4CdYhWMDO5e+GZ4kPbpHiUamkhpasFFesgPAD1/p5b8WCYypaIciG8
         s5gQ==
X-Forwarded-Encrypted: i=1; AKwUvBwod7+FLvtZbiXJq1xvDH8sYWsdZVmS0mNHACqquE/Bqc+Nb6wetep0NmSzXY6fSFN4BVfe43CDsSrewKI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9yzPlrWfYUDfuXTpB7ZVEZULVVB3QMMsi2h/OeFmX1LqTDy7bZ
	CtJEdJTa7LWRU4LgXenXnXTHoUETOzUMauKQN+Us02EzVFsF13onGt/o
X-Gm-Gg: AYBFou37+15FVmkwzCEujwAaych4+iKk8124btdzUAcLGm9tFUec/i/Mu9JhZXhAtCS
	snqRESXzMTj8U4gBLWHI1kjAoUij3TDgoJq83fqs49L48ukmxBkSMNY4FsuYljT9iyHnCp/qxj5
	yRFTuipJxVQnjM8i2WMy4eqkSyA7c+deVROLUPvwlbS10HUJshwgWX8nleopfikgsHRilDSZ585
	uuIXAhAvZXczRs3YssHZerWEaA4k1XBlXjrDPpQO3kCV2qdTC9hEGBgm7WYTk33BxVP39gp44Ml
	HIF1FFjON0AfffjTzLFrKPLepTFmcz7zFCgsTfXBun2xGsR0iTgT+x2XeQ6ckjIMQ4kWCp6eJhx
	pMfpY+C2sOlWJv+k97zm7XGPk3i5CRTmht+BgmKLi8c+K6dOxy9kZt9WZGNU3Ilhfx0Ky3PDWUn
	pxT397aNx3Yw0zQfBUYVq0WbO9ri4JMedSMaazFS6l0RY5X2IhQHgFs8XISveYYmWkMB5WlQRIl
	0ZlUFi2SLfzeszZCw6+emzVT+DXe+Q6rtbm+mcokjJaP6CpOzP8QXMFL3O+ZmPK+nIOdNlBx1JV
	tPAqDAR5ztp40OOmWZ/18jdtjQ7uvzVuSAZcxOpoBPFNhHlsAIks10khZNUQsZ10V0rZ4hotWSh
	DuZRfqnnGHmC7FDpMKA9gVbfxQ19SdzlJMfn9ztKTf9QdRyHzoOE1iOMUI0VQuMYQFDF5FnhRqv
	4uhrAkmp1i5HkMvA==
X-Received: by 2002:a17:903:984:b0:2e5:cd0f:518f with SMTP id d9443c01a7336-2eb1a57e22bmr78324565ad.0.1793606616223;
        Mon, 02 Nov 2026 00:03:36 -0800 (PST)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb392afa5asm23573655ad.72.2026.11.02.00.03.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 00:03:35 -0800 (PST)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] fbdev: pxafb: fix teardown and early-interrupt lifetimes
Date: Mon,  2 Nov 2026 16:03:29 +0800
Message-ID: <20261102080332.1466689-1-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Three lifetime fixes for problems Sashiko, the AI review bot, pointed
out while reviewing a pxafb cleanup [1].  Removal leaves the cpufreq
notifier registered on freed memory and the smart-panel thread running,
and the interrupt handler can signal completions before probe has
initialised them.

v2: v1 went out before it was ready, as separate patches without my
Signed-off-by or Fixes tags, and the completion patch depended on the
others without saying so; sorry about that.  This version adds the tags,
sends the patches as a series, and says in each commit message what goes
wrong and how it is reached.  The notifier fix is now a patch of its
own, and the smart-panel patch stops the thread after the controller is
disabled and no longer changes the thread's freezer loop.  Patch 3 is
unchanged.

I have dropped "fbdev: pxafb: preserve IRQ probe errors".  On the
in-tree PXA platforms the interrupt controller is registered from
init_IRQ(), before any driver probes, so I could not find a way for
platform_get_irq() to return -EPROBE_DEFER here, and the patch changed
nothing users would see.

[1] https://lore.kernel.org/all/20260722081427.413EF1F000E9@smtp.kernel.org/

v1 of patches 1 and 2 ("stop smart-panel thread and notifier"):
https://lore.kernel.org/all/20261031033248.2491098-1-matthias.goergens@gmail.com/
v1 of patch 3:
https://lore.kernel.org/all/20261031003424.1796478-1-matthias.goergens@gmail.com/
v1 of the dropped patch:
https://lore.kernel.org/all/20261031033236.2490968-1-matthias.goergens@gmail.com/

Thanks,
Matthias

Matthias Goergens (3):
  fbdev: pxafb: unregister cpufreq notifier on removal
  fbdev: pxafb: stop the smart-panel thread
  fbdev: pxafb: initialize IRQ completions before requesting IRQ

 drivers/video/fbdev/pxafb.c | 46 +++++++++++++++++++++++++++++--------
 1 file changed, 36 insertions(+), 10 deletions(-)


base-commit: d89e1d186ec9271bf78e62771779e9fc03bf0fc3
-- 
2.56.0

