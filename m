Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC7B4F402D
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 09:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790674063; cv=none; b=O860/ZgnRrHRVEvqquws+oUqmWQv/Ls5RjemEF3WMnpyzIri1i8CmnZcQakVZalJL2Gzco/j7bSM7xoZH+kxfjPnMKeF72MsOAk5FEfhKrjOpSSCYhBRtDgPVjHzOAMwVXR1ShhTFRBTSVTR5WX0tqsjUZRBn+aJ64M0UD7A0Dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790674063; c=relaxed/simple;
	bh=O8PhFpxI17oW/vbzW6HN/MPMmKUlMGYmDzM7IKeIbfk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BnXJj1oCz67mNGhcmOSQUlSN0G/tajIyZ6gamuS4Kv+n29cpW4ALIqxi4mprxSj1+J/hj2PskqMvw0va/zWckByIvYljtMYHD9OthxN1mfavt+rEsHe/INKjBTlBKOCMH/WBV8vZDFKOa+8gA5uvAydHgNhxMRW0trkw3qM0CL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qn8KNB2m; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qn8KNB2m"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b8eb3a9d9bso3413748e87.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 02:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790674056; x=1791278856; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ABjDV4UR8/eQ3hvNLqGbMylL6htZv7lqq13CDQYKfE8=;
        b=qn8KNB2mwVpAsk8t4oIXwDd06xCCcls3U2XQgFE1CsERDrAnvht5zLeqMkwXR0y2wi
         SIuuc0zV005J1XEhv6u0KMzEMjAhfI+AZ3uMJrq6dGm0W/a5upqINcxgAK4NWP/aQyvR
         thZDkmcMhZnybsEwhGjErdJttcgKNzBaqgT6o5ZZ3V2RqQhXU/uwzk6/Zk/6oO1qM5im
         n1v3gxDrtOkiGK0mwFPfmlqCGvHiggy+XsfrFrPGyThz+ukn5EikjSbNqeBF0wqb+AXW
         qnWrzyW63H+n52rII+MWbNTZuJITxUvoMSAQicfAtUuJVMJna620EVyIFVqSdIyoPZKM
         4UVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790674056; x=1791278856;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ABjDV4UR8/eQ3hvNLqGbMylL6htZv7lqq13CDQYKfE8=;
        b=HyAZ+xzzaPiwus0XBbwtEXaiSQc/w6AvRPXmlNvf4yl7wz756NI/au/aKRkEuoCs8c
         KMYLFdInzA1HlTcSuElVuH3fV1AU0oDb9m4HZMbtyGCBm8GcBA13lu2oPKdRZ/qJY2QI
         ID39hO8WVhfLwxPULu0UloTmt9fMAd9edpG9S0zcQFSPguN8bJReyq82NjsZWkMSLbKF
         bjDgbi2HUf7gfraT/BNavbWfRggPIdQVMcexd7xq0kXJVOWJPhzDakGHP101ey00pIO2
         kgoU9s4fQBY3hbW7ciC6qknBENt27Z3WMqUKA7XyfQlI5dxGNEEY6uqWM+GBKUpkYqAe
         L30A==
X-Forwarded-Encrypted: i=1; AKwUvBzuM4FluDVLEW0kqwCi8PuFE1kaSNxGiEN+ZH2Rhd7Q7saFoZgdm+UgbYVjtgXtEQkst9f7xRUL4IX6/p0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKmsZg5Y/Qx/Aezgf5n5A5qO5kFiqlbbhyDlAxDqU2gKix3yY8u
	HDf/bOmiywtwhygjIJ31T5jz4BzFkGKZVO8zS4+R543Slo7W7QkW4Kkl
X-Gm-Gg: AYBFou0+06VQ5RCyrg2OHxOvmE+L/9fw8FyD5f+Y/KDuBfZR1r0QL/SaVPSoKjB4Q5H
	tMbkh0SJyoVb4Xz0YjzkrVCaHNF1YmidljuedF5IjZxkcd1qT4Kj+o+JA1rUNxuMQkkLQM7QxEh
	96DhjzgMFUif6oDkrAbH4aSzl/Otn5/+9mEXTdgpCBy+lapMVlL33IS8asqPfSc5eBeVDWrZRpZ
	qd1SwM6ilAmAxj0OgkMKsGdjhfF0Z+GiWxno8xhns6UwvQD6Zzz3NfrJcxfA6LAy28yF8UQa/lD
	8/g9FPM0XYgrkFRJNYDh0IIZJfCg5r5rE663fISa3zu05XTkJzx9iZnQ+zIqx0t0ye8KaazDxcY
	HHdrsfD6/3ESIEvY5pciIknd6Cj1DU0R2eJv1a8I0YD1m4CoBCz3qDz+i7tQrAt1QO0Eobe251q
	ePhv2wWwVZBp3QdS+T4Wgomb9rpiV1cQwUeKPL1Cm8dXlZg1p068GN7KbIwGItyOJmeDRTLTxZN
	Ju7mU8jH/ovPf6+vNRNqQ==
X-Received: by 2002:a05:6512:2c9a:b0:5b8:f4f4:ef23 with SMTP id 2adb3069b0e04-5b8f4f4f06bmr2313674e87.3.1790674055569;
        Tue, 29 Sep 2026 02:27:35 -0700 (PDT)
Received: from quietus.tail91f8a6.ts.net ([169.40.47.10])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b9debb0bb2sm1216403e87.37.2026.09.29.02.27.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 02:27:35 -0700 (PDT)
From: Ruslan Koreev <koreev.r@gmail.com>
To: sakari.ailus@linux.intel.com,
	benjamin.mugnier@foss.st.com,
	sylvain.petinot@foss.st.com,
	dan.scally@ideasonboard.com
Cc: mchehab@kernel.org,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	linux-media@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Peter Marshall <pm@petermarshall.ca>,
	Ruslan Koreev <koreev.r@gmail.com>
Subject: [PATCH v2 0/4] Lenovo ThinkPad X1 Carbon Gen 14 IR camera: ST VD55G1 on Intel IPU7
Date: Tue, 29 Sep 2026 12:26:56 +0300
Message-ID: <20260929092700.1776966-1-koreev.r@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ThinkPad X1 Carbon Gen 14 (Panther Lake, Intel IPU7) has a second
MIPI camera for Windows Hello: an ST VD55G1 monochrome global-shutter
sensor, enumerated by ACPI as TBE20A1, with one CSI-2 lane. It is
powered through an INT3472 discrete device that provides a power enable
GPIO, a reset GPIO, a privacy LED and a 19.2 MHz clock. Only the analog
supply has a GPIO; vcore and vddio fall back to dummy regulators. The
RGB camera of the same laptop (Sony IMX471, TBE20A0) is already
supported.

Patch 1 maps the INT3472 power enable GPIO to the supply name the
vd55g1 driver expects, patch 2 adds the ipu-bridge entry, patch 3 lets
the vd55g1 driver defer its probe while the bridge has not attached the
CSI-2 endpoint yet, and patch 4 adds the ACPI match.

Tested on next-20260924 with the ipu6 driver handling the IPU7: the
sensor probes, ipu-bridge connects both cameras, libcamera streams Y8
804x704 at 58 fps, Y10 and Y10P stream with plain V4L2, and with the IR
illuminator on the frames are good enough for face authentication with
howdy.

About the privacy LED Benjamin mentioned on v1: the V4L2 core switches
it when streaming starts and stops, not when the sensor is powered, so
powering up at probe does not light it. vd55g1 does not hand the LED to
the core yet, as it registers with v4l2_async_register_subdev() rather
than v4l2_async_register_subdev_sensor(), so for now the LED also stays
off while streaming. I can send that change as a separate patch.

Peter Marshall's VD55G0 series (linux-media, September 2026) adds the
SMO55F0 HID to the same ipu-bridge and INT3472 tables, so whichever
series lands second needs a trivial rebase.

Changes in v2:
- Dropped the staging ipu7 patch: the ipu6 driver, which takes over
  IPU7, already has the monochrome formats (Sakari).
- Split the vd55g1 change in two and let vd55g1_check_csi_conf()
  return the endpoint parser's error code instead of checking the
  endpoint beforehand (Sakari).
- Trimmed the commit messages, moved the hardware description here and
  dropped the comment above the ACPI table (Sakari).
- Added Benjamin's Acked-by to patches 1 and 2.
- Rebased on media-committers next.

v1: https://lore.kernel.org/linux-media/20260924171820.1179823-1-koreev.r@gmail.com/

Ruslan Koreev (4):
  platform/x86: int3472: Map the VD55G1 power enable GPIO to "vana"
  media: ipu-bridge: Add the ST VD55G1 (TBE20A1)
  media: i2c: vd55g1: Return the endpoint parser's error code
  media: i2c: vd55g1: Add ACPI support

 drivers/media/i2c/vd55g1.c                    | 14 ++++++++------
 drivers/media/pci/intel/ipu-bridge.c          |  2 ++
 drivers/platform/x86/intel/int3472/discrete.c |  1 +
 3 files changed, 11 insertions(+), 6 deletions(-)


base-commit: 58348f64125e9a3e44d3abb275ca7f4e6c9641e5
-- 
2.55.0

