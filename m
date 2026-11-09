Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794242063;
	b=y4Kby6qm+sow8FUjfYcp4mxpOaGnoaiLDqVgwo8IgrJASL4XEe1RWjRb66KHV8ogN9Ak
	 VM5MPWTqibQTZM+/jjmXJKRPkP9wuNyxKabLRsfEp/k7rc5GcOM2iTG95Xx+jjOoc3I4r
	 ZtoMtShPdf8+iFbthAJIkjrpdDMQ0GZDdITmRu9tvBhBnxbnnf3zKj8YJVMn+K+XGd5AN
	 qJPHXVyQuUerk4tRGWvVHoHgBaDczEmOHXzlAynFZ1haYmBK0Jrv+wLErecBkfz/SPuUM
	 Vvc3oL/iKP0toKGH3Ij6KelDemTUxKS4Se8tTVGefJGPjd3avR6vYzSjQfrF/VIDJ8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794242063;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=RbYLKZJReBRYNMnQD9Gq9gm7nUierN4cjniygw/hBYA=;
	b=tebmye3u0r4qaQ7pFropsQfzW3xA++b6e0rtqNNuBdofaeRfIwg6pd4owWNrPC47sXff
	 ObWq39UXLdtuFuRsDYO+BgCp2Zk5sWYczBgJ8e9s9bPnmAMuExZ66CqNqwoh0rr5+pDNy
	 qWHiId2DYOCjIyxyqC4hOy64cjGwimNH+kfmQLX2J5RMv0g4oFmprAz+1faMzd08arhtt
	 JWQ2q4quchoouBRrUWFZQY+4HKF/kUc5eBMZ4a0PIeStFsPAGU1Yx4WPwNXbVJ/qtfb7E
	 dyd0hekEazy6T+4JRXKMmG6W5VcXBUd0gRROi0gEsORlXFeG0u4xgPASgvmnPfnZ5qQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x4mCWU8m;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C810606A332
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 16:34:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C810606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x4mCWU8m
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-490c1d337d8so785106f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 08:34:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794242062; x=1794846862; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RbYLKZJReBRYNMnQD9Gq9gm7nUierN4cjniygw/hBYA=;
        b=x4mCWU8mmXnl3LLBdoTqcB3RuNv0n1+H3dzghvwZ0PithQOwP0JtmZN+sbHTAnmwbD
         VNYyoNrNGokWVcEyttMwdtkMtrX7u3iPcCgK7xcPcDe5lJm0tykkpv3PointI7HRyGUz
         X+lkA2GtiOc06G6dmKzFhqU63q3Nffl0rI/BNOiZI+0XdvdfwOVhJUP0vZOpNWvsrkM/
         o8UxpS1K39JqluaEulbWKOl0srp2GQltBXBr2TxujujhzFP4+VupVDG2DZ1Gi9w1XeNv
         0xPMkhgxitKIVipgbBAWEHs3Lwuz5ukWryGSlklJZhk3DxXEB+rpAnEtp+PSV91+UBaY
         lFUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794242062; x=1794846862;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RbYLKZJReBRYNMnQD9Gq9gm7nUierN4cjniygw/hBYA=;
        b=WtrU4Rk4viFWx1ucpW3ieNGAml6tuIyHyKXFQKrAnJwc5IJpflUWts/zV4r/3B8Won
         cgQau6BSF98RxbYEw66AIBRnByTG1ztvaehl5/yYcXM8PdGlZOcp4HiM/DkkVr4VZqJg
         W76akl42vpXndf8bLkeydsfmU8wn+K3qZW28R3OJVdlcRHAFnN9qqHZFQVGR12Jjvfdk
         hY3n24r64ziP+OJUvpEGRfRZcFP07ul0+3ksSWnKcjVj9VErxHHfbWJdSEtI44vKHgMF
         JtRYHf2Z4XK9oXQSxLNxnTQH1osjNqx9hbam2G+ibWDz0y9dL3lotZVp9EmjTxV6LBrn
         Nr+Q==
X-Forwarded-Encrypted: i=1; AL+hErHBQ8LQka5P+V3YCJu176EuTQ5m0/AbbEn7EXfxK0LHE5Seeh0TLylPEDif2/3yaWjAtXQcEgPIhgMVb5o=@vger.kernel.org
X-Gm-Message-State: APuU4Z+jnDnVCs+9FFGs+4bxGARkrFQ5H2LPnIi51NVHLjhzCu/UT/m0
	CuDnD95uLl8wjZAnA6FD1r+nHgUhNzFRj64qkC+Lj1kohOhu86pdZi8=
X-Gm-Gg: AYBFou26Iwun+Om9HufH00IOn+8dr/9+tCa5ojvGuh8MaOgM61ojuMoOrGBLf32DVbL
	V/XKMEEQ3jlGZoRzNRFZv+JcSERv7UJbRblHVB6vD3e/xN2qgMDwSuZwaY7LWzZhzWO9lMBb1X/
	Ww58/rX+CXJEZptgM9wA+Agk6rQPFTjw3Q5y/o3qD5pOWI1xaCEg2Vgq5993aFmgWj9Ue2Woz6t
	iWgzAl6d8AR3NBEycf0wZ+j3T13Xs76lsgzQ4/xEonF1+EKBxeFwWbXU9F14/UWSD2B7noxz/Rr
	ypXJVx8423GFf+7mchPbOcfOk4hNb29k+y9BkgpTJgiYWdzidfozI4o6KjwVKrrslC2l8Q6Huwr
	6RXwh8o6ernzXSoKvQ/y5pc1ophS7ziY06+/2tV6h999zbaP2uNYdLOgHO+EmLIihCqZ2ukld5v
	iiwgqLfZRdiqTbdVq7wjbTSQfAWqNoQ3C2LjMqWF6FtcaMvMcEaGoM8cUBL18L/kU7efPL0mvCu
	GoS1fz3CgDhDo5Rp0KZp7nniqB9jjY6AA4kkmXrmVRtZ/U8jozUjFhoKOK0VCWFJFU3wGCpidw4
	hose8Y5ogzEHgDum4LO3/85k//XkLWpvdpj/8tZrm8fIO0G05XjEmLNjRFoYse5q8kO6/PAhFNn
	iNO00vZpzy9q6obTphVbfdxqhdl50rjFLBBmsqLoP8OzLzG3N7m02rksrCPhl0PQzBRR5wB9ung
	==
X-Received: by 2002:a05:6000:288d:b0:48e:25e1:5eb8 with SMTP id ffacd0b85a97d-4982b28aa42mr46827f8f.3.1794242061567;
        Mon, 09 Nov 2026 08:34:21 -0800 (PST)
Received: from chateau ([194.65.85.67])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49597ef6db0sm11269050f8f.59.2026.11.09.08.34.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 08:34:21 -0800 (PST)
From: Sergey Zagursky <gvozdoder@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Sergey Zagursky <gvozdoder@gmail.com>,
	Jake Steinman <j@metarealtyinc.ca>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Lixu Zhang <lixu.zhang@intel.com>,
	Antti Laakso <antti.laakso@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev
Subject: [REGRESSION] ipu-bridge: HM1092 entry hides IVSC-attached OV02C10 on Dell XPS 16 9640
Date: Mon,  9 Nov 2026 16:30:02 +0000
Message-ID: <20261109142140.ov02c10-hm1092-regression.e938253b8516@gmail.com>
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

Hi,

Since v7.3 the built-in camera of my Dell XPS 16 9640 (Meteor Lake
IPU6, OV02C10 behind the Intel IVSC, plus a Himax HM1092 IR sensor in
ACPI as HIMX1092:00) is no longer found by libcamera. It works with
v7.2.8.

The cause is commit 4fdb0342f05e ("media: ipu-bridge: Add Himax HM1092
IR sensor"). ipu-bridge now adds an async connection for the HM1092,
which has no driver in the kernel, so the IPU6 ISYS notifier never
completes. The OV02C10 binds to the IVSC CSI sub-notifier, and its
sub-device node is only created from the ISYS .complete() callback, so
it never appears. The sensor driver probes and the entity is in the
media graph without a device node, and libcamera skips it:

  ERROR V4L2 v4l2_device.cpp:92 'ov02c10 20-0036': Failed to open V4L2 device '': No such file or directory
  ERROR SimplePipeline simple.cpp:1930 No valid pipeline for sensor 'ov02c10 20-0036', skipping

This is the same problem that commit 7456b40bc992 ("media: i2c: cvs:
Add sensor node in bound callback") fixed for CVS in v7.4-rc1. The
IVSC path still has it.

I can see two possible fixes, and I'm not sure which you would prefer:

- Revert 4fdb0342f05e. The comment above the ipu-bridge sensor table
  says not to add sensors that are not supported, and I found no
  HM1092 driver in mainline or linux-next.
- Do for IVSC what 7456b40bc992 did for CVS. I'll reply to this mail
  with that patch.

The second one only covers sensor nodes. As far as I can tell from
the code (not tested, my sensor has no VCM), a VCM instantiated by
ipu-bridge still gets its node only from .complete(), so with an
HM1092 in the tree a camera with a lens would lose focus control
regardless of IVSC.

Testing, all on CachyOS kernels. Their ipu-bridge and ivsc-csi
modules have the same srcversion as modules built from kernel.org
v7.2.8, and the test modules were built from kernel.org v7.2.8 sources
with clang 23.1.4 (the kernel itself was built with clang 22.1.8) and
loaded unsigned, so the kernel was tainted (E):

- 7.3.1: camera missing as described.
- 7.2.8: camera works.
- 7.2.8 with only the HM1092 entry from 4fdb0342f05e added to
  ipu-bridge: camera missing, same libcamera errors.
- Same, plus the patch applied to ivsc-csi: the sensor gets its
  sub-device node, libcamera lists the camera, PipeWire exposes it,
  and "cam -c1 --capture=10" streams at 30 fps. No kernel warnings.
- 7.2.8 with only the patch applied (no HM1092 entry, so .complete()
  runs after .bound() has already created the node): the sensor has
  exactly one sub-device node and streams at 30 fps. No kernel
  warnings.

I have not booted v7.4-rc2 itself. The patch is against v7.4-rc2 and
builds without warnings with W=1 under GCC and clang.

Hardware: Dell XPS 16 9640, BIOS 1.4.1. libcamera 0.7.2.

#regzbot introduced: 4fdb0342f05e

This report and the patch were prepared with the help of an AI
assistant (Claude); I reviewed them and ran the tests above on my
machine.

Thanks,
Sergey
