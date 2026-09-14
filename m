Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4CBB1F4176
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 22:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789426391; cv=none; b=fSAIIcVIVfXk7c5quCBtQS4XAQakNyqblRYb0kRPg8AJ8cVLmTn5XuKGX0Tvfym9gg4fsaVdp9ncjfIh6f7VpkdU3gAmpmr0FVY80c4WFEOEqKYw+zN8hihTSgNN5SBotnUYY+rbo/vl6noyesRuVghRDh/nmR6WbwohEDATtZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789426391; c=relaxed/simple;
	bh=KlxV2Pj0K5nL5vnXASHLfOrdYtgNJknFNJmAfAcO8Ws=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=smD/D05b3mxre6G2UibO8OBdBrC/wkZmGPb/VG5iHcKBsNzhgvsIIROpcuF3D5IJZBi8T19s6XytSTJl3fq9Ua9aE2iiRMpNi7o4A7/e0lcUauq5gbAZVsw3/ubPxdEkWqjbdqeUYJIYPamEiojHnd355ULgm5NbYNHf01nLXgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mu/LWdBk; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mu/LWdBk"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccb652d7so1943940a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 15:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789426389; x=1790031189; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jhhKoo70grDYRK8Pz7Zy3Z2uy/lwES5xu5hc5Ox6dio=;
        b=Mu/LWdBkrqSdDnYbgqMxcUDYuXO0B9969fWjTLrUu2VPS7Ex/eWo8SilBeWRpYe9Ta
         6zjWtzZWKuJY5e4gZLg0zu2H/Ox1TqRwMIW+CArybIyEkCMgE36pBi2NTBYHLz785mFs
         w+7zxZUyofXt4muDlsrZvvxr/DO63OIJRfOZj67NJQPBo4EXas6p3rg22KlPzj0CI7gq
         lQM26g+9P1QuU1TFztDTYdvGLupaYO+MK4tCZsm/GI95drYM303BxMApEofpXtqV/pP8
         Jj1fT35SD63YSbrciabGneWgaf3laZpP7bkwUVEoUvcfHTB2Jr06Voa8b8tPrLL2Cndo
         lPHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789426389; x=1790031189;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jhhKoo70grDYRK8Pz7Zy3Z2uy/lwES5xu5hc5Ox6dio=;
        b=YEh4bKB2MKUh5r0okznbqyavbJwOoQMhGMWvkEWg+EfbU1xypIdY1YMiDYKyxbVPeC
         Lu+Q11uNdE4W6gLdDo3ETSLQ9a15vZdhtbrUs2CA8ooSnhsXbDuSsqql2Q/PRA8gDMwR
         EH3xDDBtyPYddY5yz9p4eTQhv5VcCXhwAu661zNRXvAdPcJtQ4urS0XnZTeLLVGFi4i6
         F+ir55nA626GbTuUE4X7+WVigs0WGwYqat5+PKI/Ik3VSFdH9H7Az3g3RebNcaS8iXht
         Et3m17qDiOR+lwqQt95VLyFLUCrA1ob9PQDFa1AUIjOOhH74OF+VqiFXMIcpnP4PeB+3
         BvZg==
X-Forwarded-Encrypted: i=1; AKwUvBw+fhfzYwqkXhNmls5iORjv40cHtUuYKRD2lHo6NbZQ02DtXS0V1dEXHgEtdK10JwcgHOHMZfq95SjQOZ0=@vger.kernel.org
X-Gm-Message-State: AFuF++kHW+hU/WHkBn8j2H5wCUH8f2V6c3A9zs27S/NXJkVzrYWNMu3J
	SrAuY58Vr5+2BqLKrTMq42U2G7jLiKp1JBkXebKBGbdSqTVSLc8cfoJB
X-Gm-Gg: AYBFou0tOyz/nQT66T+o8rGmq01n4bizfKxPqlpmrNxiz6on78VLHzLKZI3wLm3nZXv
	n5LyMELJUVoQrpFeckhy+udYNyzSpLGSza/Hw0kKmB01K6GWmxtjhmNbeoWME2oH0YxrqA713Kl
	yA2cNtJsUwfm24FT4vCCACuyjPm4/jgN2kfEDoD7GfJ7xL0g7CbmDKLzc816ZYtCloVfWhc2T2o
	xOLhCx0fn0M+pNhTfkF1fDPKXaB0UvBDiPlKNJ32OaL4puv90P7KJVqsbVuPBR6GtZOisXRp6xR
	WqN37jD5oMZ1AIBXyL7vnaT9S0t/mlhWaELfrl+oisrLtpqJG0gQUJuTbjK/HW1XOk6EgbUPh70
	+7djpW2myAx6UKJhNd3iXvY/e1CtqD2wPVWdqZvbc5Re2Wmw2x9Kn75vtsTcJb3H73yc0FgfK3G
	G85hkf/k0Hx4tieoL0InJxhvkW6YHCp+qgj+EZRyZjXblptMcmdo+G9Ad4gWVDTVKGTpqBDOsXO
	3HVcpTI/PdVV4JJkIDhMzoYby5d7DbFfYDMqWFi5JNeZFAt6rs2
X-Received: by 2002:a17:90b:35ca:b0:39d:fb87:569f with SMTP id 98e67ed59e1d1-39dfb8757a9mr4035491a91.12.1789426389288;
        Mon, 14 Sep 2026 15:53:09 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bbeb053a5sm14924296eec.27.2026.09.14.15.53.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 15:53:08 -0700 (PDT)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel@lists.opengamingcollective.org
Subject: [PATCH 00/10] HID: hid-lenovo-go-s: Fix various bugs
Date: Mon, 14 Sep 2026 15:52:53 -0700
Message-ID: <20260914225303.868569-1-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes various bugs in the hid-lenovo-go-s driver

Patch 1 fixes a dropped error on return from mcu_property_out()

Patch 2 creates a mechanism to ignore stale responses if they timed out
in the previous command.

Patch 3 fixes a deadlock if the device is removed while cfg_setup() is
running.

Patch 4 adds missing pm_ptr to the reset_resume function pointer.

Patch 5 adds a kobject_uevent notify during reset-resume to ensure the
os_mode return is caught by udev.

Patch 6 adds a suspend callback to cancel delayed work and re-queue the
cfg_setup if the device was suspended prior to or during the work.

Patch 7 moves attribute init to the end of cfg_setup, ensuring the
attributes can only be used once the MCU is ready.

Patch 8 reorganizes hid_gos_cfg and renamed it to gos_cfg_drvdata in
preparation for later fixes.

Patch 9 moves the static led_classdev to become a member of the drvdata
struct.

Patch 10 moved drvdata from a static global to a device allocated
struct.

Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>

Derek J. Clark (10):
  HID: hid-lenovo-go-s: Return ret instead of 0 in mcu_property_out()
  HID: hid-lenovo-go-s: Bound stale reply window before reusing
    send_cmd_complete
  HID: hid-lenovo-go-s: Prevent deadlock if device removed during setup
  HID: hid-lenovo-go-s: Use pm_ptr for reset_resume callback
  HID: hid-lenovo-go-s: Add kobject_uevent notify during reset-resume
  HID: hid-lenovo-go-s: Add suspend function and gate access under bool.
  HID: hid-lenovo-go-s: Move attribute init to after device query
  HID: hid-lenovo-go-s: Reorganize and rename hid_gos_cfg
  HID: hid-lenovo-go-s: Move static led_classdev_mc to drvdata struct
  HID: hid-lenovo-go-s: Use devm_kzalloc for drvdata

 drivers/hid/hid-lenovo-go-s.c | 655 ++++++++++++++++++++++++----------
 1 file changed, 473 insertions(+), 182 deletions(-)

-- 
2.55.0

