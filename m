Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 124242EA15C
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 13:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791467795; cv=none; b=e63tzT9guVbEThVJdhnsKZOp8M9JaWLy2O1zQ52kXqol66bu0T4+YUChkJub9EJnz9mD12jgxhNFlfX7/nJabfygthYeDiGsd9do1Ep/bN2Or/Ag5oqDNjw6zOGncpYJkKJaSp9ukJcvoyRtbyf4g3gX9op+aVp1RNkWAuC5Y5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791467795; c=relaxed/simple;
	bh=ul91BBdnztHPzdKRhvIGCGUQcgLmzyphkc+ExElWniQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VioQBim4w3KnzorSIZczvAmJmT7n7Z3+RvFAvHaqr0HxaV72LMy/5gi0PZs8QfKwg7lmLiRvgqpnCh4SMbmr2NJdfBzFMsQKxVXOPEK2uuNPAQHwt27o4+md5GTAjxTvCkD6hJZxbSYw5TMdaHNZCfgX1dY5iLgrV/T7TKSfAQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EHBkSpSR; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EHBkSpSR"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4998b5a63e2so51843845e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 06:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791467792; x=1792072592; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0B/njFyKNbJ8SiFPGIkXaOhaJvjsNPVFgerBqPRVczc=;
        b=EHBkSpSRqP1Rw3jY5T+5ELGDPXGrvkDA/khDxGUxazqk9OVjRuxGRTBoQyIuDMsPA8
         jQjnhWY4csFwM9068wqLpw5B5LRKvXxvACSDobSbvzsavCcmZPsVSwbW0LZXNDe+uVH1
         SPoYtr/qVvBGyL4CFLQ/Icqoo5CQG9S8V4+CgHFCi2ISWMl3+NzwQmvUmFpxPqfi8irt
         Frk/Q3nt93IHbsT1iILfPBhIonas1G9tmwu5JxJSyymxy8syYBwe9lvR9xyM8F5YQDpB
         vREyyUzv44JiClisPUMVBbzKfqL6DLH+m21OPHJiWTc/IxnSps0n7sKSTiA4HFJxlPx8
         sUCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791467792; x=1792072592;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0B/njFyKNbJ8SiFPGIkXaOhaJvjsNPVFgerBqPRVczc=;
        b=b5RHukMGaQ0gB/5hKxylcEkoOu57Ca0Sa41Ue0tw5ML7Mn/t8PNVnZ/BOTpaSt0Yu4
         ASlZzRgSPhfV/h73RhaOQev5SWmppnmPujwAsFIyEnus1cfdRJim71X+H9tfPzm6vg6A
         GF4YWJ+gulTCFZ2PX4NtbhnjyUyzSRCyNeoBibJftJHv6Msp45fyo9n0b6hGkm+CMoQc
         I5tB8DNLhVTseIxpl2oAFE/5oQZPO7SiQt6p7xzVhLAzhep8RRUYpjN9G0DE8pyqF9F2
         hZ67VElGWKH3/QCN+UPcROP2jyW2KZSfoIX4P4lCRUk/ru8U7sRV+uppva9LugOUAUjp
         FZ3Q==
X-Forwarded-Encrypted: i=1; AKwUvBwDunE2HTFTLgkJD/9JBeK1+9F96cWz0T0ip+IqXEn12AaJO+j7brBIzb8fYkhG0AaoCiQeRq3ngJsioeQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kmNXzwWkq43y8/HZHRfpzPIHBCxwS0yGIeR41xK2aC5Yfz+NS1
	xHubwAQCvSWmpS5jmQ9l/RathMz8o07jR6tsonLNlEyF5v3j6pShooQBpx3OSQ==
X-Gm-Gg: AYBFou2tU/1jUmssQ7KocnD2MpXEzmnYX9RsTrlIIGqt9morjtng4ymt3MQkFsuu/zX
	X/9DJYi3d/EcSIoIlKPCevco2vIUJW56RjAZTmW7kxmyIy/QXIyYJ43y2P+XvAXcdm5/gwqNVoC
	G+Y9Qp2+zG9mMmaO52we2RkL5PyAhGd+85sq0CbVkxH4lW30jfjgr82RWcio8cXmXQXnn+j82F6
	+5GM1VwDbXBHOmu5EwCDT8hafl23dZEJKE+jbXi51HlxMQLjNxqzcNT6SWopJT7/pBlhkIWDrYy
	gPDxOftX/brCOfyaArn1G0muBrWU/UYMTOau/Ifhv3GrlsLG9nflwARFB4GdNIPZNtl35sH3hzR
	xc/fDha0Z+xUZOgSxIbznBVOSW5vv67gwfsw4Qm9ifwdHYGa9UDU6haUh3WRWVvvHfbvkjLP4Nc
	0x2A26Ipoy+/wQy2VNJUJKZsdWjHdt6mLqcMr6ZZyeZu8vzS5w0isGFgjkro5j3EJxgSpvcbVW8
	6+0v9qxTQ==
X-Received: by 2002:a05:600c:8105:b0:4a0:236c:8601 with SMTP id 5b1f17b1804b1-4a180086860mr100759835e9.0.1791467792330;
        Thu, 08 Oct 2026 06:56:32 -0700 (PDT)
Received: from localhost.localdomain ([2a0a:ef40:1479:f801:b8e7:18fe:7039:e475])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a184260f9asm76512765e9.0.2026.10.08.06.56.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 06:56:32 -0700 (PDT)
From: Mohamed Jouini <amad3v@gmail.com>
To: Armin Wolf <W_Armin@gmx.de>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Werner Sembach <wse@tuxedocomputers.com>,
	Christoffer Sandberg <cs@tuxedo.de>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mohamed Jouini <amad3v@gmail.com>
Subject: [PATCH v3 0/2] platform/x86: uniwill-laptop: Support the PCSpecialist Recoil 16 AMD
Date: Thu,  8 Oct 2026 14:56:22 +0100
Message-ID: <20261008135624.3520849-1-amad3v@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PCSpecialist Recoil 16 AMD is a rebadged TUXEDO Stellaris 16 Gen7 AMD
(board X6FR57TY), which the driver does not match today because of the
different DMI vendor and board name.

Patch 1 adds it with the existing Stellaris 16 Gen7 AMD feature set.
Patch 2 maps the "Sc" key (WMI event 0xD0) to KEY_ROTATE_DISPLAY.

Tested on the Recoil 16 AMD (BIOS N.1.39PCS10) with the v2 driver built
against 7.2.7: the Sc key, the hwmon fan and temperature readings, and
all three charging profiles. v3 only follows the descriptor rename, so
the device gets the same feature set as in v2. Charging from below 70%,
with the charge counted from current_now:

  Profile    CV (4S)    per cell   stops at, of a Standard charge
  Standard   17.405 V   4.35 V     100%
  Long_Life  17.194 V   4.30 V     about 93%
  Trickle    16.818 V   4.20 V     about 90%

In every profile the EC then reports 100% / Full, as Armin said it
would.

Changes in v3:
- Rebased on for-next: the Stellaris 16 Gen7 AMD feature set is now
  gmxixxx_xxxx45xx_xxxx55xx_xxxx57xx_descriptor (Ilpo).
- Patch 2 unchanged. On v1, TUXEDO confirmed they know of no device
  using event 0xD0, which settles the question attached to Armin's
  Reviewed-by:
  https://lore.kernel.org/r/66a47248ecfa1704186274f2c245d3f5@tuxedo.de

Changes in v2:
- Patch 1 uses the existing Stellaris 16 Gen7 AMD feature set (charging
  profiles) instead of the percentage charge limit (Armin).
- Dropped the platform profile patch for now (Armin).
- Added Armin's Reviewed-by to the Sc key patch.

v2: https://lore.kernel.org/r/20260927014031.3465252-1-amad3v@gmail.com
v1: https://lore.kernel.org/r/20260925211635.1422516-1-amad3v@gmail.com

Mohamed Jouini (2):
  platform/x86: uniwill-laptop: Add PCSpecialist Recoil 16 AMD
  platform/x86: uniwill-laptop: Map the screen rotation key

 drivers/platform/x86/uniwill/uniwill-acpi.c | 11 +++++++++++
 drivers/platform/x86/uniwill/uniwill-wmi.h  |  3 +++
 2 files changed, 14 insertions(+)


base-commit: 98f039265e580291d5e76a11b2072541fbb1c393
-- 
2.56.0

