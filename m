Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6431A3A1A35
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 13:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792243814; cv=none; b=J8YC1Ia4O6MTgPOpF4yVFqDwlrlAHLEP2OODrJkeiYKuHP+icxhDlKbX5kckgBKNhxOVD72oNYqWqCdIRvWGMZJWEVO6P0+rwH8pO93/KIgEmGJfgOUr2K4Lmdtito8RNkHypjLXR0ljBuC1B6tfPC0GTMfDjA3jSejJ5XFWBm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792243814; c=relaxed/simple;
	bh=OIYDgH/oLMWQ+/6uobMVOevRtT5CTDVDRzYtReZrWAQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oYBzqT3DDnt2F7SXOoHmsX8mCUeRbf/qM+ZNkLv2YEGsU1Bg8NY9ylkXpv8QcinNc8/UrPKiII1IZecqEznQho6OobBQi+LvjFzUrk4PhMRZQ2bXXEFVmwclzUcIu+tnr/UO5C0Aigf2ryI4bUQt8pqeH3dM8ZsNmE1oAErP3v4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YwsEW9TC; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YwsEW9TC"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c40aa03a96fso12728566b.1
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 06:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792243809; x=1792848609; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9kMbNYUDBAAe52Yd/PJbeX2owOzlb8r4BGU5mxFc8Qs=;
        b=YwsEW9TCoFah7WNqrIdngwzj+ptQAHNj392xjb8jC2tnvN/oMTP5gXqjbIlY+uoakM
         5XzTlJAj4VPwR7dmj2RVFspT19gIZke+zohuIXvhTn2ROs5T1KgQiRyPMRjYExIGK/6L
         FdIA1r46PIUTUAXOQxcKZz/WDGP844P6UyKKMpOcn0tRiRQZc2pjAto42rcgKjBR4yvr
         vU/+4JLuH8ypgVTy+dsnFMJmTVmk59r00FQFylN4WnypqEciqmJ8WHQ6Wlnt/rEiLkwZ
         sCHnNNYNIM5UJfH6lOu4vZDVQUji8YFGu+JhjAhggDTgfzXBimmusMjSYW1O/WGR17/M
         UKTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792243809; x=1792848609;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9kMbNYUDBAAe52Yd/PJbeX2owOzlb8r4BGU5mxFc8Qs=;
        b=csFADy1RnGC36Xq+kO7h4i8zs/8VighedUvQTGgv0e3k/Rs/91L0E6MVwKeIoygC7y
         TCLi6IKiS+1fjzyqdzt5wY29Mj9/haK5CIp8LIFEQZMfKDdRI7jY1c1CtrkgHFUgIQxv
         MgwX/NHpi5ZKdx2uFgw0iSfRxLS80qEUJn7hi2aqX85EQFVsEH/YbI7aga5TqRmRFJX4
         9BNIuPEbBxFBXKzPqxROfcX98CWWK8fXlJPQI1l5RfqIR7xw3TPv77tGnCal0GSpi+DK
         cRWV1xBHs/jWBHvm1lG3Mv8Sn2Z1fHSvYFn8W8DMMXfBg2kmCARhM751tyFzl4Rfz3Jm
         8bkg==
X-Forwarded-Encrypted: i=1; AKwUvBwjnllbMHPiuqcUJHb/FeMsEBzWwPrdHk+trB4TROAVmgfrDmzDTUSjWO5VYBalv0I01tN6byucFzwa3tM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLSHIhtmJ9u4ClMmdZOtx5LyQJ+SGVw6rtFDV9RuWzC0y8Rx2wE
	NLvp6PPLHthaoWxZhkGblLuf+WXla6taWeFTI5VPmdGbDhMUr/xHpyHF
X-Gm-Gg: AYBFou1AR272NZjYQeZ1jiHxF3XNeLaq2r0lOGo3LuoGAwZtpHhQhOh/rIk4uY/kp6q
	ArvaNGJQ9Co3/pz/2FbriE67jvzaac2c9guRN8qa8winmgl3iMjrJsUWqrJFYgrq3bOZlGHVc+K
	0P7eEMZyPzvnQZfWCOoUXriV5KOINf6WwvBnwWab3fafYPysfvgcsL9PX1vjs+uxkj0ESpDAJ9r
	edPMfi5DLZhrYQZmD04Uy4ANO/2piCqtcspqawVu+xakLulsDCyzCJwrYg+meyOUL/AsCoDVMaR
	L+lfJA0pSIjYSojTwvaaTI0o6H6UseCt+9NSe9fLyuQqXvF6lHtFQ9DZgQeN19cs+yPNeMo7sqt
	EqzKIf4Uq9DSedc93Gqw0KQBlUsledjWvJYk8jzw/nB4TLZEJGWZ3jKW6V9Pl0brElSKo/mS0t6
	YqQTKkXwynSE68REvUdPHTXd1v1Xt97QTr1JRxtz0vaYg2wkcWQUiaXQKKnqdqCsskYIFZexiNs
	NXNxCQhlKoV1LY6JF7wmzJxy9emgbWGwwZYKbU/bJVMJYixdqmhMJ8mTeNSGJyuyXs=
X-Received: by 2002:a17:907:3fa0:b0:c32:8cbb:fac with SMTP id a640c23a62f3a-c419da3d90bmr242802466b.3.1792243809111;
        Sat, 17 Oct 2026 06:30:09 -0700 (PDT)
Received: from edvinas-XPS-14-DA14260.lan ([88.118.178.135])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40913c6145sm178597766b.41.2026.10.17.06.30.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 06:30:08 -0700 (PDT)
From: =?UTF-8?q?Edvinas=20=C5=A0ulcas?= <edvinas.sulcas@gmail.com>
To: Pierre PINON <pierre@pinon1.fr>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jason Chen <jason.z.chen@intel.com>,
	Jimmy Su <jimmy.su@intel.com>,
	linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] media: i2c: ov08x40: Do not expose the broken 1928x1088 binned mode
Date: Sat, 17 Oct 2026 16:29:52 +0300
Message-ID: <20261017132953.45183-1-edvinas.sulcas@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <c09eb409-a7df-4d9e-8a18-944382a6cf0f@pinon1.fr>
References: <c09eb409-a7df-4d9e-8a18-944382a6cf0f@pinon1.fr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

I can confirm this on a second CVS machine, and I think the data
supports what Jimmy wrote about CVS and Sakari's suggestion to deal
with it on the CVS side.

Machine: Dell XPS 14 DA14260 (Panther Lake), OV08X40 (OVTI08F4) behind
the CVS chip (ACPI INTC10E1, USB 06cb:0701), 2 data lanes. Ubuntu
7.0.0-38-generic with the in-tree intel_ipu7 and ov08x40 (the latter
built out of tree from v7.0 for the tests), intel_cvs from
intel/vision-drivers at 845d6f8.

- 1928x1088 (2 lanes, 749 MHz link frequency): the kernel logs "error
  group 3 code 18 details [0 0]" about twice per frame, which is
  INSYS_MSG_ERR_CAPTURE_HW_ERR_BAD_FRAME_DIM as Pierre found. A raw
  dump with libcamera's raw stream (stride 3904 bytes) has data only in
  line 0 (samples 42-90); the other 1087 lines are entirely 0xffff.
  Pierre saw the first and the last line; my buffer has 1088 lines, so
  a 1089th line would not fit. In the 3856x2176 mode all 2176 lines
  carry data and there are no errors.

- It does not depend on the extra registers of the binned list. That
  list writes about 110 registers the 3856x2176 list never touches
  (0x3a1a-0x3b06, 0x4911-0x497f, 0x49e0-0x49f1) and differs in 0x4501,
  0x4542, 0x3894 and 0x5000/0x5001. With a debug parameter that drops
  each group alone, all of them, and with 0x4501/0x4542 forced to the
  full-mode values, 20 captured frames at 1280x720 gave the same number
  of errors (43 or 44) in every case. That fits Jimmy's description
  that CVS only handles 1928x1088 as sHDR while the driver programs it
  as linear: changing details of the linear programming does not help.

- It is not CPU frequency either (all CPUs at 4.3 GHz instead of
  400 MHz while capturing, the idea from libcamera issue #328): same
  errors.

- Pierre's patches 1/2 and 2/2 applied to ov08x40.c from v7.0 (2/2 with
  fuzz 1) work here: 640x480, 1280x720, 1920x1080 and 3840x2160 all run
  at 28.6 fps with zero ISYS errors, and libcamera no longer complains
  about the missing crop rectangles. I have been using it in video
  calls. For patch 2/2 as posted:

  Tested-by: Edvinas Šulcas <edvinas.sulcas@gmail.com>

Oleg's report that the mode streams fine on a Yoga Slim 7x without a
vision chip in between points the same way: the mode itself works, it
is the combination with CVS that does not. Hiding it unconditionally
would take a working mode away from boards without CVS. So I think the
better place is on the CVS side, as Sakari suggested: either only make
the mode unavailable when the sensor is behind CVS (for example the
CVS driver restricting the sizes a sensor may use), or program the
sHDR variant of 1928x1088 for that case, which I cannot do without
documentation of the sensor's sHDR setup. Until one of these exists,
2/2 is a fine workaround for the affected machines.

I can test patches or run experiments on this machine, for example
logging the ISYS CSI-2 frame/line counts with dyndbg, or trying a
larger minimum size from the CVS driver. I can also send the lsusb
output if useful.

Regards,
Edvinas Šulcas
