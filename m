Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C8142E8F8
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 07:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790235016; cv=none; b=tvzKoNvlPaDBADEGmKTnyvz1AORefddZ9fe6Z5B8M64SQrDT2dvDm72eDhxqcdYzknmgJOOztPJCUK/pmAwoqIowU9cE69eG+p56C6i3+scO9QjCU9cJDeMXibOTpQA2ItaWTMX3PBj2sC+N52mIV4TQLe+RXMdCzHOIkh6rkrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790235016; c=relaxed/simple;
	bh=khuHVzocWsqQdCp4xd38UXxEEbCRvbCsdj0A3wtdC/A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZBYiJf2EtnR/bn0D1HEJhulZU/wLgk1hWonwuzj1+KylcOGkXVpfNS8euiRat3XBOnL4TVwn3hEmFBT14vvEgxu1BooJIfueabd+RTKOI36qbEGCEaa38/qDatLwZSxcbq2OKsb6iqBLjyLYkBxIVipNXFo4PkeoMulWfx17zbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oCcbPWC6; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oCcbPWC6"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-398c066106cso1051371a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 00:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790235014; x=1790839814; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kgip3jFcH5aQqUb4V/BMgffhYqMwWeXQnhdcCBzw/vY=;
        b=oCcbPWC62e/S26kI/VsGwkRwfhy4mn8Txgr3kRdE2W0t466obIipCtgVSDDtEmbOcH
         yvmtzj9NHkrv0JJMo9NPhknBmutPAS29VKpmPNV7nDQyzRxhVYGd21F2vR8mjBqKAD9K
         aS0vlHNQ6Ghww7+qT2ZAsik9mZgdUG537shXgyKCIIyT32p0ju880u4KEzUHKQ6+9/7W
         dMu377pW7oLC1IQ0FOOXi8u4h0jGylGUkTbQw3rXt6d0fv4dvBxeOnKO/+YFeUc7Fis9
         J6t4sndk+malzMe/dvqT0bZ57C4WjwTk066kHkuqGooUSGJEW7Mz4Rp3UNtsB9/+TfTn
         2NOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790235014; x=1790839814;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Kgip3jFcH5aQqUb4V/BMgffhYqMwWeXQnhdcCBzw/vY=;
        b=My+qTLM1Qt0fDU1E32rGN/2k8eZ1WZ5U4CAxlikI9HUxWHMGxln4/wiCPfCRnXXtls
         ZXg54dQCfVVcZMvkR1vvTixv4mZ1ykNNxcuIGVq6ReleZbwoLJkKfhDtI7lUugvQBmT1
         P8pUAYQmrYL2KvcE/lwF2PJJSGgoeLP+3Ht7abI1FNwBj0jp6VzYx5p30lL+rgHui+S9
         tMwK9S1jl/Kgw0Y3h9SgA5p6EAzkXARJtTue2vUMt+HLHH7B9YrvCyeVeWoXRFwAAbT2
         pshBCJkTI7/sSWjCJAMRKEnxt5XRkqtJ7PwHz+b0/BFS3A5ktydM01oo8qppT6LiZYgl
         mtyg==
X-Forwarded-Encrypted: i=1; AKwUvBwj3NznQmemzL6ZH1jcBCrp7a/QbrFx5RKRq8EMZgsfdJJ15rcQWNjETq6azD8a3DlpWkjiekXrU2Tkh0c=@vger.kernel.org
X-Gm-Message-State: AFuF++mtE2+zZWd6PUgSxt9MRQZz2VpV2p4B99JAuP5OFl0jcBxksybh
	urzz2eEVVCP6xb4Ud3S1F5jS5JvYYko6Sr/hPRfxj7Iv/nOPeQ+q5jWn
X-Gm-Gg: AYBFou1LPJRcWUUNjlobsTmBKK+jpKm1caNOBfYyXVMh5afxerhg66ncF/hQnuiE6RE
	TGveTJF2C5CQdJGu1h0RIySLIYskHz9uKWLqLDI+M8I+hrov83ULtQDpYwm2/jgtK5Qw9UQxK0z
	+1EZc5HXBegifxO7yeTEBnNTYDCsGmXIR8EFbIrdbUdMcq+18FZ3rctWU6Scut+YD4iFC8Q09q0
	1UlZT/RABYTtPV7BJqndnchdgJtryYk1kXdX2Yh9E8orCtQy2Ak+rxl8R9kgHQolA6zovpoL0Aq
	zl2jxV+bVRBto46nkY9SJvEXqzYF+C4QwCJ75HYeXNTCL1X5eKUnCIMIm9x2/smmY7pK9hW5jHd
	lEh/bTScQo2/mvGbu3f5ga/r4yXCNYsQaus1sXq5P58KOCvVqwFW13Zxw8HZ+SPRsFnfPEsPZqu
	kz/kX0DsAdrIvKvtjIN81UZixXOZ5bW/pz/b2UtrFvlHLI8OHNKEwGtx92tf394renq9VjQWbz2
	Jn2z1yr7BG8e20JpwVJjf3As1Bemr0eujql2MviETpbQ7UyrTtEtkqD4SEPNxaJJJOvJZ3VvBbs
	zNnQtpgxDro/YQBZCTQs
X-Received: by 2002:a17:90b:388d:b0:3a0:9640:803d with SMTP id 98e67ed59e1d1-3a09857005dmr1361485a91.4.1790235013787;
        Thu, 24 Sep 2026 00:30:13 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (67.51.127.34.bc.googleusercontent.com. [34.127.51.67])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0972efa0bsm3184726a91.8.2026.09.24.00.30.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 00:30:13 -0700 (PDT)
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
Subject: [PATCH v3 0/2] drm/udl: fix EDID short transfer check and probe USB cleanup
Date: Thu, 24 Sep 2026 07:30:09 +0000
Message-ID: <20260924073012.2742968-1-benquike@gmail.com>
X-Mailer: git-send-email 2.56.0.rc1.310.g51773c2048-goog
In-Reply-To: <20260924064434.2541959-1-benquike@gmail.com>
References: <20260919223511.3889061-1-benquike@gmail.com> <20260924064434.2541959-1-benquike@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes two error-handling issues in the udl DRM driver:

1. Reject short USB control transfers (ret < 2) in udl_read_edid_block()
   with -EIO so uninitialized or stale bytes from read_buff[1] are not
   copied into the EDID buffer.
2. Call udl_drop_usb(udl) when drm_dev_register() fails in udl_usb_probe()
   so the allocated URB list and DMA buffers are released.

Changes in v3:
- Change (ret != 2) to (ret < 2) in udl_read_edid_block(), as requested
  by Thomas Zimmermann.
- Add Reviewed-by tag from Thomas Zimmermann to both patches.

Changes in v2:
- Split into two separate patches, as requested by Jani Nikula.

Hui Peng (2):
  drm/udl: reject short USB control transfers in udl_read_edid_block()
  drm/udl: clean up USB resources if drm_dev_register() fails

 drivers/gpu/drm/udl/udl_drv.c  | 4 +++-
 drivers/gpu/drm/udl/udl_edid.c | 2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

