Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3251D3E63AE
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 06:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790232278; cv=none; b=I5NdNgJXRVo30PkrcmEz48zKKIvX+gG0whq7IBTRfahBqf99HWiAUspAgcYcEWD5sELFAPfvbEMolAC+5GMN0Nj3NvpNKV9OAJ0mmK4JPMXDlTsDC6dw4LHSrC6kLugNns15LnlKyiT8fDw6RBGfTSEGIA1/SCfBSdx+UemMJc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790232278; c=relaxed/simple;
	bh=s/Ov7YdUtyGGpDC5dvxjO1Xxzq1AynaHx2c5NLwCh6w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D0Fk0IsHwmxZXmIzsDS9qe629axqcG1L6ThRlj6RFgJt3hkPv8kGqyUJVajBtc4Z7wWFwxj/T4MdZVvWdMnwt6BC1vje1jn8hgAjaJTIr8VvlfMfc3nkNNKkggh3ZwB6sTF3/iqjbFHWAXypOv5VcImRcluiiBSQhJe/qF07zfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ks3SLLu2; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ks3SLLu2"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cea50db3so808389a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 23:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790232276; x=1790837076; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=plhhkjlOjAprzRnn7KgX9Cl61oB+FHlc7TB72lMWDUo=;
        b=ks3SLLu2uNLV6R3eIPGsF/WKNqpeaK5SmpXpmvFhjrYM1FcMdFhh97XjqqQKst6+v5
         48Rhy4okLvzX1rUDSf4IpKImW4mUifCg+imh3LhNKWnimumofx4yRWx8HCt0P99eb+Ie
         nq0nVoWy5SL9MUppX1O6vzzcqgDg7XVP2afy/Mu0bC2vywF9BMTJUWP/JGukPwrMiiJT
         ybLMmFXdNrPUnqEJyP7qCnf5Rf5x+Q0dm0pNOyCWGDtYqvDMCfVHt53wdDepOGXdx+we
         1OL3v6AzFhXTPFQn7zd5uNfku08zClZc96KihIri7CMjKzefQOoRtau8imyCMBEk6zvV
         /INA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790232276; x=1790837076;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=plhhkjlOjAprzRnn7KgX9Cl61oB+FHlc7TB72lMWDUo=;
        b=PiI/yAFcor6DeLg4LkyNdgLbkXfKn5nNk2J7Ar5KJDsu2ipZQ6W2P63A4nKTYtNcpV
         rHLzSppJoWHQSICR4JnqgHSpyqjswU2aFA6KcyRhrnqHbpwqTxQgzzhpPTHKJ4OW8ca8
         AppdVcfuTd1AaFZN56HftLHTb/BgCcmBn8KMPyZErnZqNFUO+GnArzPdNnlLvhXPMJ0o
         WbolC1yw+edk+xpvjoD0j5JFXY6EEdZ0Ir5eaR3KDiVkYtd17QhDyfhH7S+xhnZvl/bf
         SEJAb0I5+x87AS1ulHkhf8Q6wnt2XuNE/VhEDtvNXg5njw4QwEb8nKAyZHdtA90ngKH/
         xYBA==
X-Forwarded-Encrypted: i=1; AKwUvBzyZkPE9Urx+549FWc9SDOxzuWkh4/EmcbvLil+bYZCuVR6HJL6Z08BY5gaLM3d/3sLxSCNevgk0K05vOY=@vger.kernel.org
X-Gm-Message-State: AFuF++lb9ufBBkeCP20qfR3j2PTVEYF3KPuNRRne2peACQa+piYLugej
	YmoFV+NhYadtAxiyJBuwpD5JRT1RvQMLdlLaJxEL0xA0z6dN6I7hpsGR
X-Gm-Gg: AYBFou1ffM10sXk1IsRSs1KORNoQL1SiPM0uHtXkK2muzlstQ9ylIcVLgVCPfjxv3vF
	xfya9/DYtDNYau87XMPvAiceaKTnwXBSN4ad05hKNg3nVkXau04YOsxZ/TjkMRUQrOW/ixDB7Z4
	JhWocgSTKQYxUZOZvKoMjy+HPbF62T03Br9Y4c2Tjg170lO0p7KExGP2PFlXuAzwNc4KaCu3cpG
	OSHVyDO5D959h0hJ5zdcRSPdLw/WtKHlYEc7Swh8kNfQlIPJbJC/cHwCvs/NnLdg4q9V+R/c2uS
	dQsIODSl2lMTZoprsAPGttOSOFcWrmVyK06lbGjIDIB1pnKK3S2dHIYmm9+tMEpMyHjKqg+cQVa
	1cS64mWAEgVZCL7u8ALCXgDLSiOq8mcOtmqmyQzA2e1XQxlvjvH/nMKh6QFG+u38uEaCEgj/NSh
	YUNIURoVJnhm+wGQoY11uhikH9qebMPx8xLKTyfYV19CmO3mnwM8yZkgFL1hgGdWhr/Q8KoeJsr
	7M7ipTE18nru+l46NCkVDfpC7zgHpuwFcAk2FZA+tWKazY5efmxWlap8Bo4aCJ7avtZMf7g68Hi
	QbyQjPyQQus=
X-Received: by 2002:a17:90b:1b03:b0:39e:6c6a:4b67 with SMTP id 98e67ed59e1d1-3a098dfb096mr1248459a91.49.1790232276347;
        Wed, 23 Sep 2026 23:44:36 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (67.51.127.34.bc.googleusercontent.com. [34.127.51.67])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0972efa0bsm2960830a91.8.2026.09.23.23.44.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 23:44:36 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: jani.nikula@linux.intel.com,
	tzimmermann@suse.de,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	airlied@gmail.com,
	simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hui Peng <benquike@gmail.com>
Subject: [PATCH v2 0/2] drm/udl: fix EDID short transfer check and probe USB cleanup
Date: Thu, 24 Sep 2026 06:44:32 +0000
Message-ID: <20260924064434.2541959-1-benquike@gmail.com>
X-Mailer: git-send-email 2.56.0.rc1.310.g51773c2048-goog
In-Reply-To: <20260919223511.3889061-1-benquike@gmail.com>
References: <20260919223511.3889061-1-benquike@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes two error-handling issues in the udl DRM driver:

1. Reject short USB control transfers (ret != 2) in udl_read_edid_block()
   with -EIO so uninitialized or stale bytes from read_buff[1] are not
   copied into the EDID buffer.
2. Call udl_drop_usb(udl) when drm_dev_register() fails in udl_usb_probe()
   so the allocated URB list and DMA buffers are released.

Changes in v2:
- Split into two separate patches, as requested by Jani Nikula.

Hui Peng (2):
  drm/udl: reject short USB control transfers in udl_read_edid_block()
  drm/udl: clean up USB resources if drm_dev_register() fails

 drivers/gpu/drm/udl/udl_drv.c  | 4 +++-
 drivers/gpu/drm/udl/udl_edid.c | 2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

-- 
2.55.0.1082.g2b9226bbc0-goog

