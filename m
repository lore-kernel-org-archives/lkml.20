Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945631A9F85
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 00:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790123255; cv=none; b=Fa9r9OljKMDkDml8z1zNZreI2urXlpfRhxS+Buq4WvwCHOGGLmypQ9wh3zkUNvKECYuC4R4nFrsqZnL/D744gkUrn1e4LnDThLgdmfpUZuk9R8wYI5wYFr+eHFiOL3Z7vJor0zjHy5ktJwLoUFMUOSPMcQ/TEQRYtRPvMHOWwRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790123255; c=relaxed/simple;
	bh=ZlzT9R5gLvZvToRh6lPUWRnpXLwFNypOuukyV1rpDPk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=P9VIBHGyzmSm9KUrDcGBcSv74je9v1WoIADfSen2Pf86YJxFLCjgm0xMD3lTY5ViPaw7p68hZN4qtbRFulQ1pWZvOr2fC56Tx7N+nPCwLwY/oFMJft+qJTyiw8FS+HJk5opwy9lMXbyvroufF8jQvYP7SIi6rjX8RvOGIa3lGYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dStZXdJ2; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dStZXdJ2"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49d1fb0cf5eso2054745e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 17:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790123251; x=1790728051; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Iu6ChcoYkeqQpso1SWT5boNmU53jolwND8JJxt/RDZI=;
        b=dStZXdJ2rUf31v84XxTHDgBL3u53tV0A7CyFxMYLMIW4quNFL9U6kGMJ7zVIyM4kcI
         L2En9EzBehIO1LQtT76HecJzRI56FPHF5vlkF+Oi3AtqTImNZ7xI6hnUH26Wy4fJ9BZD
         MAH1C2yODHVAF8fiN13sfY8atmw609XsA0eAvM+iFEyWoYAXBg03vtOEplKo/xUFOJpZ
         fAeuWxXho0kANqPwUe250q7oTPotxZP4RYzZ0US2HWVzCtJ/86VbcTI01RzRW2nmSx9N
         4gHP4s/Gdtj5cFO0kNKQ1tA04boLD8XN4BKw0yd8RFt9E3QYYgkJIIxWrCFQYPndFHp0
         l1qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790123251; x=1790728051;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Iu6ChcoYkeqQpso1SWT5boNmU53jolwND8JJxt/RDZI=;
        b=d7WTjG0vDtwDG37QFbKPRaPqCKhR2zsf7onrndB56+oDMdNaaIZXHWoPzgnDfKNHzr
         iQPUl0ZfzhbNHkSiF6ghLYXoPlMnSmLkHHq87Qq6Xh7olgcWkw0ABVWMxJAG2xVhjzwo
         DhpIv1JyVZ101wESVk8ORr2oK4OyPxDNBn3gOTdxb8EgFI4GyLLdd6SvZk080U8MMGid
         79Ysu0npSGI7Phn/cO/9o520WdinYbKlTp14Oc17hG3NfSLr4ocdgXtXdsIyv/eQSvTz
         RqkgXPHVrnOOOi8MzLTW7dU2Cc0T3nHEK+WRXnCLw/6S/fF//WjSYCefW0iWt7BmISyx
         mT8A==
X-Forwarded-Encrypted: i=1; AKwUvBxMKNO5C12mcLdjxaElRWjSJ9eP+hLUKNg/Wkv9FTZ7Vbx2bhMEg/WgyGRbeBQSbjAy4UpkswKt+q5/kpk=@vger.kernel.org
X-Gm-Message-State: AFuF++ndOJT/qb8uVWui2sTpakQTzwynassZ7O+Pia1tqQmsKTEc5cIw
	PUI28betOuDOwCBrkvwKneTpxSz2K4KpYrZXip3WSOtaMjWrVzqaBMJUyY4yRZCX
X-Gm-Gg: AYBFou03mOdyK6Gfz97bp2bgcVo1BvxHByJi0i5eHDTCN7PvqyZcH2YltoZtMoCazps
	vTZbqp/l0g5kJMNpXCdeTn0lBkN5KUD9nO+emnLN1qdd7XA2AFE4isbtV6eBev1nPhTl7AJvTOP
	cDTMtUMuwhfTBcxo1Zd+Cx8IMr++W+5KNHhylcd0e1U2C98ilUDq28ZzGte3JgyM3ON7UUKrNh8
	aecqG0OmbAK68x7XfT8fZOAwCcv2S87cMn3b9n1j3xg1oaOYrO7PoZF4JCPp23zpRQYx39VJf5B
	rcxBkgPgzA4MvcMTwufJ97PT3bswp21Gr5ZBsnA5WsCj/6gafo6bVLVS672oDfnmMbHRKM5Z8X1
	/QxG/pJKsMJR6/uqqA653/IRwbmlrRTIs9txo0I4Bpp0TnmYDArfp2PkZDBC0KzB75KnkpI0bx3
	a7rF5GSemXzgzNNft3up7TvmiRQQXbJZ16VLL7cGMJkgiuHhGoxXLraJ8pyc0toX/p/EphNxM=
X-Received: by 2002:a05:600c:19d2:b0:49c:cee0:e7c1 with SMTP id 5b1f17b1804b1-49fdf1370bcmr9734545e9.16.1790123251286;
        Tue, 22 Sep 2026 17:27:31 -0700 (PDT)
Received: from NBLK-WAX9X ([78.175.157.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48868889337sm2229702f8f.34.2026.09.22.17.27.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 17:27:30 -0700 (PDT)
From: =?UTF-8?q?Ata=20=C4=B0lhan=20K=C3=B6kt=C3=BCrk?= <atailhan2006@gmail.com>
To: amd-gfx@lists.freedesktop.org
Cc: Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>,
	Rodrigo Siqueira <siqueira@igalia.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [DRM] amdgpu: HDMI FreeSync not exposed on Samsung S22C31x despite AMD VSDB
Date: Wed, 23 Sep 2026 03:27:18 +0300
Message-ID: <20260923002718.5915-1-atailhan2006@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

I am investigating an issue where HDMI FreeSync
is not exposed for a Samsung S22C31x monitor on
an AMD Picasso/Raven 2 GPU, although the monitor
advertises an AMD FreeSync range in its EDID and
VRR works under Windows.

Hardware/software:

* GPU: 03:00.0 VGA compatible controller [0300]:
Advanced Micro Devices, Inc. [AMD/ATI] Picasso/Raven 2
[Radeon Vega Series / Radeon Vega Mobile Series]
[1002:15d8] (rev c2)
* Kernel: 7.2.5-200.fc44
* Compositor: Sway (Wayland)
* Monitor: Samsung S22C31x
* Connector: HDMI-A-1
* EDID serial: H9DX100210
* Kernel command line includes: amdgpu.freesync_video=1

Observed:

* swaymsg -t get_outputs reports "Adaptive sync: disabled" for HDMI-A-1.
* Adaptive sync remains disabled at both 1920x1080@60 Hz and 1920x1080@75 Hz.
* The same monitor exposes and enables FreeSync under Windows.

The EDID contains the following AMD Vendor-Specific Data Block:

Vendor-Specific Data Block (AMD), OUI 00-00-1A:
    Version: 1
    Feature Caps: 0x01
    Minimum Refresh Rate: 48 Hz
    Maximum Refresh Rate: 75 Hz
    Flags 1.x: 0x00

The HDMI VSDB therefore appears to advertise a 48-75 Hz FreeSync range.

There is also this message in dmesg:

amdgpu 0000:03:00.0: [drm] Failed to setup vendor infoframe on connector HDMI-A-1: -22

I believe this is the -EINVAL path from
drm_hdmi_vendor_infoframe_from_display_mode() for this timing and
is probably unrelated to the FreeSync issue.

The part I am currently investigating is amdgpu_dm_update_freesync_caps().

For HDMI, the driver calls parse_hdmi_amd_vsdb(), which
on this DCN configuration goes through the DMUB path:

parse_hdmi_amd_vsdb()
  -> parse_edid_cea()
     -> parse_edid_cea_dmub()
        -> dm_edid_parser_send_cea()
           -> output->amd_vsdb.freesync_supported

If the DMUB parser returns freesync_supported == 0,
the driver does not expose the connector as VRR capable.

What makes this interesting is that the DRM EDID parser also
contains the corresponding AMD VSDB information in
connector->display_info.amd_vsdb, while the DMUB result
does not result in FreeSync being exposed.

I am wondering about the following:

1. Is the AMD VSDB layout above expected to be accepted by
the DMUB EDID parser, particularly with
Feature Caps 0x01, Flags 1.x == 0x00, and no MCCS VCP code byte?

2. If the DMUB parser rejects this form of AMD VSDB, should amdgpu_dm
fall back to the software-parsed connector->display_info.amd_vsdb
when determining FreeSync capability?

I have a working kernel tree and can run diagnostic tests
or test a small patch. I can also provide drm.debug
output or DMUB-related traces if useful.

Thanks,
Ata İlhan Köktürk
