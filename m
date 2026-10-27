Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793144902;
	b=koli89rjgD+jE/i6jFZn0858D5hyoXDGCqW0y/OgSeVgbRZKbgFY9iN7buJA3wd2jkW1
	 MK1Q+PLEm9EPPQJwUD7fyxpxYCOX7X+eTVvqMwRaGRrewT15rIPvw5hJYfic/Y/376Hx/
	 ImBSvttDBhk2paoKMvtXwEo06u/auwKWv0w7xEJiS5kPwIXsx7N9eBBhu9KWR4shWv8xS
	 l6HDIexoN613ZGRrUYSGEeUjjMUnpOz3FNx0qDTJT58qlXmDwFkovaBZkWJyd+eFOdKnn
	 VWMP9errefS5WuxO7T/xVyqejLeZIPUaNnZRi1kHEE3KSn4kINH9IWUzNa9ZbtafGdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793144902;
	h=DMARC-Filter:X-Pm-Submission-Id:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=7+8vhhsXQyVJjSz/sbHoh6YEddpDB8KKnVbfcWobf+o=;
	b=pqOvYrsZDtbXdYuiooXIczk9siWI929bhJxpfvACe6j+2ZkAA4alqEUW2/MX3S0CViNj
	 3XG13m054SSnwHryjSWBH7KLn59e2pgYdjq3ZnQlPV1aF8AaW8ijVwHGhamqj7UoQOW0+
	 U3wlZYOF5uTmlLBmjBCxRPVmLGzcpEh3xh1aDgKbPoRii0m8wF5bDDoGgQAWKWk9b8YPP
	 JSlZwPLXsErvTT0+d6rBJcOwaatRjT1edko96WKO9fwTSBnhe3TMnWZ3umSpofDOA26II
	 tjs24gElOHMXDGq7B/RLVc0c90VhmESSXq7dZ5YyRaB3FWzEIeIPjUoUl519ENS3kfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=loafecho.com;
	spf=pass smtp.mailfrom=loafecho.com;
	arc=none smtp.remote-ip=109.224.244.108
Received: from mail-244108.protonmail.ch (mail-244108.protonmail.ch [109.224.244.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF89606A31A;
	Tue, 27 Oct 2026 23:48:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AF89606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=loafecho.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loafecho.com
X-Pm-Submission-Id: 4jDnHg1Wqkz1DDLJ
From: Tony Garcia <tony@loafecho.com>
To: Marco Ziliani <rylos78@gmail.com>
Cc: Daniel Scally <dan.scally@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	Chris Simpson <chris@nilk.net>,
	Simon Kruse <simon0x+git@proton.me>,
	"D. Manresa" <dmanresa@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] media: i2c: ov5693: Fix mode changes, flips and autosuspend
Date: Tue, 27 Oct 2026 23:48:06 +0000
Message-ID: <20261027234806.4068845-1-tony@loafecho.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261027-ov5693-fixes-v1-0-3c8ab1ae104d@gmail.com>
References: <20261027-ov5693-fixes-v1-0-3c8ab1ae104d@gmail.com>
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

Tested on a Surface Pro 7 (Ice Lake). Its front OV5693 sits behind an
IPU4P, which I run with ruslanbay's IPU4P-on-IPU6 RFC series on
linux-surface 7.3.0-rc7. The three patches were applied to the 7.3
ov5693.c (they apply cleanly). Raw capture from the ISYS video node with
v4l2-ctl, frames saved and checked buffer by buffer (bytesused and pixel
data), no libcamera.

The patches tested were the ones posted in the linux-surface/kernel#181
thread. The code in this v1 is identical: applying each patch here and
each tested one to the same ov5693.c gives the same tree after every
patch.

Patch 1 (mode registers on stream start): with the sensor held powered
(power/control=on), 8 full->binned and 8 binned->full switches:
OUTPUT_SIZE_X (0x3808) read back over I2C during each stream matched the
requested width 16 of 16 times, and all 16 streams delivered frames. Out
of window (sensor runtime-suspended before each stream), 5 + 5 switches:
10 of 10. The unpatched driver, same in-window test: 0x3808 stayed at
2592 after each switch to 1296x972, and none of the 6 streams after the
first switch produced a frame.

Patch 2 (Bayer order with flips): 2592x1944 at all four hflip/vflip
settings, the sensor reported SBGGR10 and the 2x2 sub-plane test found
the green pair on the BGGR/RGGB diagonal in all four, with the same
blue/red plane order each time. Comparing image profiles against
hflip=0/vflip=0 confirmed each setting really mirrored the image. 45 of
45 buffers at each setting had full bytesused and non-constant data.

Patch 3 (autosuspend at stream stop): after a 60-frame stream, the
sensor stayed active for 1.2 s and was suspended at the 1.3 s sample
(100 ms sampling, 3 of 3 runs, 1 s autosuspend delay). With the old
pm_runtime_put() (my installed 7.3 driver, whose stop path is stock) it
was already suspended at the first sample (3 of 3).

Also 1296x972 binned: 10 module loads x 2 captures, 900 of 900 buffers
with full bytesused and real image data, no CSI-2 errors.

The tests were scripted and run on my Surface Pro 7 by an AI coding
assistant (Claude) at my direction, and it drafted this summary.

Tested-by: Tony Garcia <tony@loafecho.com>
