Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17CCD3DCDBC
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 18:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787854464; cv=none; b=NYnbubELXGi0bl7P18/GEjke8L7ysS8KvFUJLO2nK4nEm/tRPSWdsk4VhK0wze6NlZrBweo7+CtXyZHAR0IDIYx6x7eguv/RKn6vEx3D7hkc30SDZPu9ZvQVCJDi+DSsm1cqdQX0+RfnLq4hIwObOC8DjOymXeV0Jlidw473XNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787854464; c=relaxed/simple;
	bh=W8X308jt+bvXYniV4DB7dpJR/uUmKnkQU1ppJ0MVFu0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N6UfzT7hoL3OxhjssSw2aDXdiz+2bGzH9CnYnVupJ5RPzbAWEkJfZAzql67yPJt+1zrd8/UZFu+NSWcLKO95wCcgh7xAT6EfpXHYXrqWs39HBbqkLT5fXlwX8nFr44gB/VSsOqT0+JAODS6AuTdBkjIR2kGH5RH+xcp+i5oWo24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ramWr+xO; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ramWr+xO"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-47f633e6058so104073f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 11:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787854461; x=1788459261; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W8X308jt+bvXYniV4DB7dpJR/uUmKnkQU1ppJ0MVFu0=;
        b=ramWr+xOYrjQE/9kj6ldXyQ9Cgu+Vm+7EDCbMij0HuYBpzFp3/rtyFwLbu6cQJTEGu
         Cdk4nJJ3J+JDaX5+b7VFTWnoLkXMTkmSquR69c5W22nnUM9q45j3JYRo2VuZ8Vl5JzCU
         wRnffMtceqb3ahgL11GSPSjH5zVd6CYlh6rc0ToeAYGCOmxkDLDhDL1FTka3PgYncXr7
         lQAUXwqNC2nLjbVRhdsJysPLuc6VIddqXKY5/qHf/eapP5Pzf65660fWbcnxmS0YDZM4
         NiOdPWQ2IYqA9eAnF1jOom4BGowpOSz71ToIOPqBNqhX/KFo7HeZsmr/XcV4ZdjvIOEE
         zZvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787854461; x=1788459261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W8X308jt+bvXYniV4DB7dpJR/uUmKnkQU1ppJ0MVFu0=;
        b=ll/X+lnGI9hmE4ILd3xDrPXOqudM9+uW99WMgVkZ6NA6URpPkJUF8iS+FPKUXSbxVv
         dxBGrqws5gMpU11IK6GTgM1tKM0MTQA4uoMiQGj41ajDV7AhtGUn+ezpYvzF57k9tqPv
         C1hEOPK3+SPtOozByUmoc7ed791RpZZj7EFKkRekr+dE1U7ni8gjDbWHDsLpyLRPydqI
         LEusc1cMFKm9ztKxHpYHjGYNQ4A3UqRy+i0ypSWFozs3wChTtWM2jOIeq46zBbDv2uRW
         9/aMDdgeo5UPHHcFvi1CebQ+NWL0ol2QLB9DezzMnI781wVsAy8yntZ4XE+7JQ24HBEt
         DkxQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro6d0gJ7yNOLtg/7+MMtSZyioQEfXJarSVEczlMRQ/OYB4OdaEUJ64m+kRA9nXW4eBiJb8ou8oOEjniwho=@vger.kernel.org
X-Gm-Message-State: AFuF++lRfy8O3E0tpRht8VSsc/LFGvCQumpSzxmTB5S4bnJKEcOeIcEf
	3ty6sb1ycrtqvWk4XCTNzjUePmuraMnIT9iyvQPFu8dn6V2dfbNKnL5/
X-Gm-Gg: AR+sD13BLN7VYMoyIRAlcdF1vp/gxQg6yXg/Ohss7mJ74QZKvdTTc+dRmVhlWR9Bbbz
	VCqIbFN37ZFu54Iv7OLkjJzZpwezIl1m0UtV7pc8iuejvW0RHKishFZ4pPfYlotpWduU0z3w2xY
	Tz5TsCrN3PKyh7c7EtjDfupqgPWgg4EWMWUpZiw1aa0PuBCDuVLnOW9iH6NhlHRsGmyPhwiDXsr
	15+4wzK33duWlRSkTIcCAr7oHb8v3SERQ5K27FCWG+L+kkZb2P6mpljnObq4+ng7j3lurfprOqH
	3/zSWl1COC2gci4G3dci/QUG5iz7p+/y810w3QMDD/JorwmCcfi0cmKnHkeMv4EhdmYq+zobCJm
	+EVlETT1astB0hVA/5GihUPyH8KVrd/lWSoGQmgPIB/vdM3fOACGonJqHGp4+195VE+WjNl8DY/
	f1ncU9RrJbI8PY5wG+6TN+fO/pEJDrsU+82JQIrNwbABV/hGK8iQJGIx6dj6ummcfyKRM9Udrok
	m7iE3y61VUdG1cE1GVckC74WPvHe+8edj31c0FXmF+t/DqQEDmrCO0=
X-Received: by 2002:a05:6000:4a0f:b0:482:e451:680c with SMTP id ffacd0b85a97d-482f79a7553mr1165103f8f.8.1787854461242;
        Thu, 27 Aug 2026 11:14:21 -0700 (PDT)
Received: from 1Z10 ([78.213.170.242])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e28f5e2fsm9643283f8f.33.2026.08.27.11.14.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 11:14:20 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: Yauhen Kharuzhy <jekhor@gmail.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: Re: [PATCH v4 0/2] ASoC: Intel: Add Lenovo Yoga Book RT5677 support
Date: Thu, 27 Aug 2026 20:14:17 +0200
Message-ID: <20260827181417.2424376-1-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <CAKWEGV667AyGDpz-mJn3phTOjKZeVTC+of0Zx_OUZr4H3+_jxA@mail.gmail.com>
References: <CAKWEGV667AyGDpz-mJn3phTOjKZeVTC+of0Zx_OUZr4H3+_jxA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

You are right, and I am sorry for dropping your ownership trailers in v4.

Both v5 patches now retain your Co-developed-by immediately followed by your
Signed-off-by, in addition to your copyright and the links to your original
implementation and v3 posting. You are also CC'd on the complete v5 series.

Thank you for continuing to help with this work.

Maurizio
