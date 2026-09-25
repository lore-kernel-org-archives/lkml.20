Received: from mail-pz2-f17.google.com (mail-pz2-f17.google.com [74.125.228.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB76841836E
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 13:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790343620; cv=none; b=YbH5/ODC5aiKmKkBWyZweBs0f7FVWbmiC9dHIfiJ8MW86acZ5JBO1Zg8crqZrBjZ/eX8H0rCB+xGbSnRQBG6hCJlLNmpeARiHeUaYfExu6XNSjLjiEhAhLullZp6OorqcW5h1lPyo5qvOKNqmlRE/SlIh5bbsAe7/WjfGiPgZT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790343620; c=relaxed/simple;
	bh=ykf8iMJpAcatbima4Jd11GNPsy9PpqpBQ9DAP19u9qc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ess0jX4OZHieMchAjNbGe5mmmqf1y5R4Dz69qNCIKmrTzB6vTEL4sL4aHJZbEpYafm8P696pQHHXB1N89+0wJLti8v6umtQ4B74ebNZGxVNzwfN005Djy1baZCoFyy8FwYzkuAzvgJE5c91KLQH4hTyzj7TolJ16NjcUom/QvGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e8gmGdSj; arc=none smtp.client-ip=74.125.228.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e8gmGdSj"
Received: by mail-pz2-f17.google.com with SMTP id 41be03b00d2f7-cc4c3304784so339748a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 06:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790343618; x=1790948418; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=a47bZYCTvp0bK7riN+3+5iqiQ4xgjbaSVoQw1BXJcB8=;
        b=e8gmGdSjw9fDaZMOlVWjxG9jjzssUyKZ1AJcSmsQHqEM8s0BkkfkYcEua3NvEG/E+8
         up8xe4m3skuN7b8JYbLX3iROJMp6Tt4OjWX6OZTGeUzUcOpHYV6Q/kczms652QlXCz6A
         ZkeuCi6S+3tsgM2ipIm0KpaFy42DnWG/7csQD9EhmJSxHo6Q0vi2IXQy7BLuLHjjUmxC
         2KT1jEqKz1wjcJk50Se3bd+TaTc69t/DLuP7E/dwnxG5TUR/g1lWPEJDMbYnxE5kN46d
         jNrEgksxxTK5SZTKC0TVCfysl8Mk7b2bAlfOlqLh0Ui6gALWb2/3bm9PfxVdtZhnX6rw
         2maw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790343618; x=1790948418;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a47bZYCTvp0bK7riN+3+5iqiQ4xgjbaSVoQw1BXJcB8=;
        b=z7p9Rmm2appM4K/0o/j4tJFVhWUqLEJplomFEyy2uzTudxyeOc/5izWGXTwmYThBa0
         oD7Dd+urpL0yMbP41uK5+02my4DN2EB1pcUUXf6Bs812fp9sd42fMyql71LtEfdza+RY
         B8q2v9RaOecr428et1PHNNakOLxLIOQbBUg+21jeDrBsUjv6r0jcHU3/nRaA7VmYNvhM
         V8j2CB/1mFvqy08HRvpSwBLAcWzOnIYBz9LHYdKBt/GqlDeTAPoxt3CjTCWlr2K5mYUP
         aVdwP5BvAi8E74b+8OjfmLIUTkZVxlPdyF/ylaGlY/u9yTOxDPztJcbE3lx1bPYMz6N6
         6GXw==
X-Forwarded-Encrypted: i=1; AKwUvByoj2onmWOL+/4lRHG/t50fCLGNwkKiBp1s89kLuH5pecPgue1tswkW0iZCRrEaEFz4FOYyrTZ/yA9rICE=@vger.kernel.org
X-Gm-Message-State: AFuF++nh04R22IpEDSFwhmwY0Ts3ok0msCWDSTXMDhUOrNdLwz9dtZPv
	pgbHLsqYBdEh+M1XiQiXnhvnOn6qC2i7RoRKi2i+Rvjhp03lwqobM7aC
X-Gm-Gg: AYBFou16dA6T9yljhfp6Mb0AKu6k5f5erOtxJiS3f8i5h6ByecuJahy5qr/XXTXqA1p
	C6KkLDKCS+YGHjUpJjES5gx/XSO+FOwiRmGViVPEN+ufkYRpunmyX+Mb6WV9CLYHH9nJpc4hpzn
	FlI2RbcbNhF2IIU+YOZy/y4r7L/1pb0ljL9UN2coooIGhrJvT49XzquegNV0TuQwm2zbpcDrheg
	mvwIl7yT0u/C9Kli8RfeqGX8r663KAezkZg8oDmZzkkPCYVfhyWiV8x9wylyu2smZz1bQAI+6WM
	6Si/a00sOp8B76d8UeLtpxn+UWhuTXtucJXyI/m6ljVoTixnbM7N88Owhh0Osna8g9bbKJnUg8C
	c0QK6kbsK0ghqpS6fE307WBNh1mCClGtVWAXX+dPUomBSmmOOmzYQylykcYtVcXF4+0ReyrY2Oa
	FotFZNR+Tgf/HoBeFhHwKCKox7oQKodthGyRudf/6Ja7TrUz2xJu28hF9q0Wm/RZozGdxRPzXkh
	ZS00w==
X-Received: by 2002:a05:6a21:2c01:b0:3dd:85a8:4c64 with SMTP id adf61e73a8af0-3de0e894361mr4873068637.43.1790343617712;
        Fri, 25 Sep 2026 06:40:17 -0700 (PDT)
Received: from ROGZephyrusG16Air ([240e:b8f:977f:f400:ec2a:b15e:fef8:70a])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc787943cc9sm1269673a12.21.2026.09.25.06.40.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 06:40:17 -0700 (PDT)
From: Liang Haowen <nbg2974@gmail.com>
To: linux-leds@vger.kernel.org
Cc: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	"Martin K . Petersen" <mkp@kernel.org>,
	linux-scsi@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Denis Benato <denis.benato@linux.dev>,
	Armin Wolf <W_Armin@gmx.de>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>,
	Marco Scardovi <scardracs@disroot.org>
Subject: [RFC v9 0/1] leds: asus-aura-scsi: Add ASUS Aura RGB LED driver for ROG NVMe enclosures
Date: Fri, 25 Sep 2026 21:40:09 +0800
Message-ID: <20260925134010.2815025-1-nbg2974@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

v9, as its own thread, addressing Ilpo's line review of v8 and the
one real sashiko item. This time the full pass over the code was
done.

Changes since v8:

- The DMA staging buffer is cacheline-aligned now, so an
  invalidation on non-coherent architectures cannot clobber the
  rest of struct asus_aura (the sashiko High).

- One pass over the code for includes, per Ilpo's comment: the
  explicit set is array_size.h, blk-mq.h, blk_types.h, blkdev.h,
  build_bug.h, byteorder/generic.h, cache.h, compiler.h,
  compiler_attributes.h, container_of.h, dev_printk.h, err.h,
  jiffies.h, the led headers, module.h, slab.h, sprintf.h,
  spinlock.h, string.h, workqueue.h and the scsi ones; unused ones
  (bits.h, kernel.h) dropped.

- ENE_OPCODE and ENE_TIMEOUT are defines again, the timeout value
  stays 5 s (Ilpo).

- The container_of() declarations are single lines (Lee's v6
  comment, Ilpo's reminder), and every loop over the LED array
  uses ARRAY_SIZE() (Ilpo).

- The MODE/APPLY writes pass named locals with sizeof() instead of
  compound literals (Ilpo).

- The driver now applies without saving. The controller flash only
  changes on an explicit save command, which this driver never
  sends: the LED class interface is runtime state and does not
  promise persistence across power cycles, and a save on every
  update would wear the flash. This drops the flash-wear caveat
  from the previous versions.

Everything else is unchanged from v8: the multicolor LED
interface, the SCSI device handler attachment, the protocol
handling and the remaining caveats. On the interface direction:
the LED side will move onto Marco's Dynamic Lighting class
(OpenGamingCollective/linux-unstable#17) once that settles; he has
removed his draft SCSI driver from the series and says the SCSI
part will be added by its maintainer, so the two efforts are
aligned on the same split.

v9 was verified on hardware again, including a visual check of the
per-LED colours: the four LEDs, sequential updates, unplug under
load (zero splats, zero leaked nodes, clean rmmod).

Liang Haowen (1):
  leds: asus-aura-scsi: Add ASUS Aura RGB LED driver for ROG NVMe
    enclosures

-- 
2.55.0


Liang Haowen (1):
  leds: asus-aura-scsi: Add ASUS Aura RGB LED driver for ROG NVMe
    enclosures

-- 
2.55.0

