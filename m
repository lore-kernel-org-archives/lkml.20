Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D2B2F260C
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 00:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788308757; cv=none; b=aBgAuB/pL8rVhQIJBl4VmyR1jj2+ClGbQNVjNrgfr8Yw9/efl5VYUeZFHRnqBxuLYrU4Ohhnsxhr3oEZ29xduStP3VorKZmVACpwvgFhgepr3tbuV+XsQxP1O0g0yDN7JMBDNWJoImKzTmO39hTx8ripoXBEiDsXCNohBDO4epY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788308757; c=relaxed/simple;
	bh=L2s3gtWMgWKmyKQrcI1dLj/nlR025dNN3Ec95PJVKCI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X5X/TVA3Oio9gV+FgFaN4AOBjoxnTcQDY8mYauacDArLDC3WDXgJf4ldlYHhVCccwBJxRfBSsMMKO4epwJZFTAfUyBWt49r4bpMko1lx0CNly7OSmoIhroo8Vs+wAbyP0nD9kDFUBGEAHT7fDKdItRUqUOMS0OEPjc8ZUzyVRKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fp3LoM1Q; arc=none smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fp3LoM1Q"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-66bd7857841so734638d50.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 17:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788308755; x=1788913555; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0DHJtPlP+gA8L211/yxRDmzQVMs96KUMsp6cHQ0WbFo=;
        b=fp3LoM1QUXcrO8vctyUt6Yan2KD1OzuGJQ5JBIOYEQhxo/PELxtqO00jXRygL/r5q0
         lbqTQ8sb4Ph0O1kjN0uZtR8TQj7jf9xdvbSZvYVXdA0teOwXv5+e0hU7FlU7J3eSBSWz
         95DZFi1y948D1aq85hU+YQDPpKUdiG+3OC2s671NH9upFryT74DHOLvGRD23ahNKK8R0
         lMnflQgXaz3EWurv0jOiTQeCCD47N6IR/yc/ABUYpoSPMp1tzQ3IVFRFY17Quz+wAGrl
         ZsXrbJSxoZZzuUbw5wcI4Q5ubMzKZ2NhczdHjoeST1Bl1bz6SmZpgpwXdu/4GSiDaBJ8
         4eHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788308755; x=1788913555;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0DHJtPlP+gA8L211/yxRDmzQVMs96KUMsp6cHQ0WbFo=;
        b=lzAqWuHmjBJB7xYSUiM33PuKjeOagtHWvtlDsLT8NKkdj+sdXrnN0W6Z5HQbNTTr4m
         m11VRsqD9dSpgezYd1rkgQvytQtoyYwtt3Uj1TfQTeDPjBPIXzPy6WJBQQXxo2304e+R
         lGPnNDVXAnxOsU/8opCJP8nsXAkCHwK1NbgnfJGuE1Y4MwFVI/NJbCayopRnQ0Nt5PfE
         ycWqaG5ylJh9/OKUIBI3xnzV9LUB1bEjj6F2mjW9+uf6lf9tjx6V3ay2gm3FaagSJc1O
         An4aLB4jdYcFsWKwcosv43/RgAwF9InsyaBFZRN+XvJ4PnjOXBxbj74rvpFIoYAi61iQ
         Lpag==
X-Forwarded-Encrypted: i=1; AKwUvBzPpZKzE/BpM3JLZgLVT0BY9kCp4Q60yoTIPTuCVyw4b5+LdfKEaIb6BeCzHvQRxI4WwSOeWaTvtojasfE=@vger.kernel.org
X-Gm-Message-State: AFuF++mNWvPrNhldVwGA4Yfm55RDfiYPrypqhpfy5kuXhqnQLYJ0VHqe
	OVbocpC/ctu0E3FwdRNV6WIHeGPO8/lVXtf6xLabNLqnWFfXVm2cS4GE
X-Gm-Gg: AYBFou0vkPjuqxTFLZ4B24c5/xmGntkUZ7OY3ljpQD8My6U8n/bSEcfoswtDXN8Pzto
	Y0HkPDOOrlNKBWvK/8hmufIoo9ZrabiCvhehSslz1V3aMwJ7DD6IDJHM8Bk2DJgJ12Ynq7HLgsV
	UJYGbUJpeB5wA740pm8/kDPE0oDU7yn90JvhvC6c2SKZCoKIpAJ751KuDzDCg6SZr9iAs1fAd2S
	R0AMuDmkUIJt/FIl3aIPaKnTfVcnuikfEo+3WAxbFKvwmnHUqUPcTKAt79KxaBb1DDAIDgh/gqA
	TXvY3b0gkS/p6c2PDVQiy8za16b53mLaguYKV73HHGQUdJ0gigz8DczBCCESJ2YJe6P7PpjAH9p
	mMciIenj75lDahXt7QAPnbmm/6/RFEUu5rcZUhyKSdI2RxzXO2WsNGiA95wIp9bAANSk/zWSQFX
	/bx50u1a7LwqEiOOl+JpvGvDPSfcNRqNsZikEKiqrUeRTsFJzm6i6VUQ5lWvRMqbU2rorFcJD70
	4uQo3PdnuIO6tC1+5YO9oCbfeOh/QwxgJrubH7qo8I=
X-Received: by 2002:a53:e884:0:b0:66e:5fdb:98d with SMTP id 956f58d0204a3-66f9bf82ac2mr208560d50.50.1788308755057;
        Tue, 01 Sep 2026 17:25:55 -0700 (PDT)
Received: from llmbox.. ([38.81.85.65])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66f98656c1esm755344d50.11.2026.09.01.17.25.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 17:25:54 -0700 (PDT)
From: Michael Jordan <jordan.mymail@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Ricardo Ribalda <ribalda@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Jordan <jordan.mymail@gmail.com>
Subject: [PATCH v2 0/3] media: uvcvideo: live pan/tilt/zoom readback on the OBSBOT Tiny 2
Date: Tue,  1 Sep 2026 20:25:50 -0400
Message-ID: <20260902002553.34839-1-jordan.mymail@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The OBSBOT Tiny 2's GET_INFO strips the AUTOUPDATE bit from its pan,
tilt and zoom controls, so uvcvideo caches them and userspace can never
observe the actuator's live state. This series reports AUTO_UPDATE
controls as volatile to userspace, generalises the existing XU flags
fixup table to all controls, and adds entries for the three affected
controls on this camera.

Changes in v2 (following Ricardo's review of v1 [1]):

- Patch 1: unchanged; picked up Ricardo's Reviewed-by.
- Patch 2: uvc_ctrl_fixup_flags() now returns bool and runs at the
  start of uvc_ctrl_get_flags(), before the allocation, skipping the
  GET_INFO query entirely for controls the table covers (Ricardo).
- Patch 3: as asked, I checked whether the camera's other
  AUTO_UPDATE-flagged controls suffer the same bug. Two more do:
  CT_PANTILT_RELATIVE and CT_ZOOM_ABSOLUTE, both verified on hardware
  to change autonomously and report live values on GET_CUR; entries
  added for both. Exposure, white balance and focus turned out to be
  write-only on this firmware (their autos work, but GET_CUR echoes the
  last SET_CUR), so they gain nothing from AUTO_UPDATE and were left
  alone; details in the commit message. The commit message also no
  longer claims the capability byte is the same for every control --
  probing every control showed it is computed per control, just wrong
  for the PTZ ones. Dropped Ricardo's Reviewed-by since the patch
  changed materially.

The full lsusb -v output was posted in reply to v1's patch 3, in the
thread at [1].

[1] https://lore.kernel.org/linux-media/20260828152557.653475-1-jordan.mymail@gmail.com/

Michael Jordan (3):
  media: uvcvideo: report AUTO_UPDATE controls as volatile
  media: uvcvideo: generalise the XU flags fixup to all controls
  media: uvcvideo: fix up missing AUTO_UPDATE on the OBSBOT Tiny 2

 drivers/media/usb/uvc/uvc_ctrl.c | 122 ++++++++++++++++++++-----------
 1 file changed, 81 insertions(+), 41 deletions(-)

-- 
2.43.0

