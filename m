Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794851901;
	b=TFXjuFIcihXp4CotMwlIsQWd2CjPPb9xcGYMcfCoZznDfG/LiuTC4laoNwBsFjg1VxJj
	 cZNqD+j74rMI9w7DpVwpHLLBG8lDPMQaSVJvDThv79gzwbirFSsIlqUMlFRjQrVEc0rZu
	 MD1XDHw/NSDiuB6exaMZXzdwGklQVkxx9BpEoASQy1RiKbiE4bm10mrORSFDnf477+JKZ
	 IIsVYqcEIPljmLcDKSXwdMdvISUh4Uw70p9v77gEDOXJPvGcrux8++06SMd1Q7Alochoj
	 BMpgvEuVvXN2mt3lN0K01dKoBtm9BfGQBJr47hqUQtChuTYMPAq+GIRosvlr0usirUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794851901;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=h6XJvo2X2g2Z+K/pencoU7yNqa5NvpNeSb8E6WHAlWc=;
	b=XmMJa61jGVk9dzAobrYdO/ZCi1ZE6DYj8wsv2M3/7gTxfktH0Ki9EtYmgXkqffPLrl6Y
	 Qiw+UyA8WA8VdcvEIouO4vMyYtxafGCieTu5brphFCBFwWFWcyIgur+AZPTbgyDCjc6aC
	 bKExIGEAKMeF4fPJR6O+F/nbenBXXQ1vPSV+Cw+D7KbwcxD/Gv+YC4XdVNw5U4FTwJAY0
	 yDV/ZK/SiW/uFcWqTm561xl5bKR1lZG8h+q0dTRdsZko1NXRLwWrZGeit/8kPVKTa19YF
	 1h2b4Db92ts8uFgMAc5vGA2j/iQCLO0er+0bOGlK+uBmvUbo5yPDsfMZB7at0V4v23Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hvH8r4c6;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F179606A895
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 17:58:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F179606A895
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hvH8r4c6
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-498f5fa4f70so4013961f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:58:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851897; x=1795456697; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=h6XJvo2X2g2Z+K/pencoU7yNqa5NvpNeSb8E6WHAlWc=;
        b=hvH8r4c6NMHxVz1ieBiNUUrP4OYAIvuG2ggpimF4zv3FD10FOzaH8VZaV23E3K5UHP
         cQdj4jk8oaGOLzdWUgtPxoa2wZ+7+/7dOrLjZQ7lNHA/lhwolBgOAR9lK49EY2RhYJfL
         ek62qLdqb++2HCO/q/8HcX9scgUF0eJ8L9GSICb+UmTJOUCsX3kLoygqZ0vOKFUMT/Lp
         jp/PTtqm90eQIiwSeYoOXNmrrAK86CZlvHMNEuGnw4ZD18/ssQDXKq4axT9EJ0ebfBiA
         MpIEcDmRTZw42xQRbS/cSHLY4rVhwZGQa6sE9iro3SaxP7vKXoZ1ymQe58GazwRF15bZ
         bL6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851897; x=1795456697;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h6XJvo2X2g2Z+K/pencoU7yNqa5NvpNeSb8E6WHAlWc=;
        b=dgkOjW90iDLsP5O4iPRrG1ndELaLWIR56tIRcjrceHL1+IYsYUABq7LOYLxK2jOFcx
         nYRtbqWk9J3SZfB5fL4/9buvtX2YvxKZ9fUXxdjdJe+PoUly0TMTp0IS9gw7WZy+wFa3
         ulhhiyMeTE7E80Rq3ScT50hXoBvYTZHeKi58SjevKK+D1qzkrXkNBfywB1bAF34bPHzu
         d9Fgpf5nHSYnHPYgvuM6fjF/+AmPf2BXAVMnGglCWXQq0KVmOfC4rrQjfQCRkRUwP73k
         74s2C3uM/NCGvq/xZq+lzDBLiFNF0RDnhcHiGWZVi+oblSF2VscChbBtQ5vkE8CuDyDd
         W3KQ==
X-Forwarded-Encrypted: i=1; AL+hErE346J6z5pCxYPjznemkqOSFLuceTRN8WMbaxgp79pkMg0RTPJ5ztHoqM6m9srLnM4dwl8nEgfPWOOxCBg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ihrEm1SUz0h3A2BzlgOEE68cJrFKhCrrpjQkyqhEtsUNryhy0
	StVIiTqcktuEf3DV3+oDDlQF7ny/TZEpU9Hvy9odn5r24ouZCLAm/uhx
X-Gm-Gg: AZFdTZdAot2RjvLoWFPZ+VL5Th84igCzTJdKSu33KZfNTfR92FaSeNcubMgZnQ3ykJ7
	wPBvRJ+zMwCLgtR973iCJ9p13/n2r4cKP2M5Mp+cqU2WwZa8cRCPfm7F9vwhrbMiEPMpOuxhHIn
	XOt5RsM0VwP4LULcKrWSWrCJqEGXCuv9NtyxTKqRzN4VggH+BF6yvBJwb+l9jV3ZpOTacvJrTKv
	0KpGpsPQ8lpd9dUoZ1WVErRX412j4Rc1q+9lREx/Rpn3dHkdlVfTVmBp8BNRhfxyPeHjrUsxCyq
	YDaPMk203bh5BwkqO6Re78gqN1u+z6AD+ujyWcOCShVh1TdLBVRqUEH0Wk48XBdTT+xQAYgBSS+
	F2924smZxOL+jCo+qtqk6O1tGWqrb2Klf/4nux5XfP3iAlGDcjfoBnNPWv6ZQ7dcXEblFF6IyEO
	Rgs64E1YStI4P/jRDic3g4n4ePPZ6c6YbeHoenqpC1rjc0YNfc5r1nFsOWb8cE8KMZP7TYrU4Uo
	tsh5xw12mYAD3Y5kc/iIwqw18WOfn6JZdaXDS1HUn82iUQmqAs5R5JjJx96Rc4IBnjdHQcE0OTW
	28Fkz3pGClAs7DivuhEszLyu2cWW0/R+SfP/anQlUk0VXg==
X-Received: by 2002:a05:6000:4541:b0:48f:bb86:cc03 with SMTP id ffacd0b85a97d-49c70ed7ff4mr17130136f8f.11.1794851896560;
        Mon, 16 Nov 2026 09:58:16 -0800 (PST)
Received: from Kyiv.home.arpa ([2a0e:1d47:4093:b600:498f:88ac:2ca1:60d5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d22394esm24171374f8f.3.2026.11.16.09.58.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:58:16 -0800 (PST)
From: Volodymyr Chapman <volodymyrchapman@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Volodymyr Chapman <volodymyrchapman@gmail.com>
Subject: [PATCH 0/2] media: atomisp: Fix PipeWire/Firefox streaming for sensors without crop or frame interval support
Date: Mon, 16 Nov 2026 17:57:48 +0000
Message-ID: <20261116175750.21905-1-volodymyrchapman@gmail.com>
X-Mailer: git-send-email 2.43.0
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

With PipeWire as the camera path, Firefox could not stream from the two
cameras of a Lenovo ThinkPad 10 (20C3) on atomisp:

- Patch 1: for sensors without crop support, VIDIOC_ENUM_FRAMESIZES lists
  sizes which the preview pipeline cannot output, so format negotiation
  fails when userspace picks the largest one (IMX175 3264x2448).
- Patch 2: VIDIOC_ENUM_FRAMEINTERVALS fails for sensors without
  enum_frame_interval, so PipeWire advertises a 1-120 fps range, which
  Firefox turns into 1 fps. atomisp now reports the sensor's current
  frame interval from get_frame_interval or the pixel rate and blanking
  controls.

Patch 2 has no Fixes tag: ENUM_FRAMEINTERVALS never worked for these
sensors, so this is more an improvement than a regression fix.

Tested on the ThinkPad 10 with the OV2722 front sensor and the IMX175 rear
sensor (the IMX175 driver is pending in a separate series [1]), with both
patches built out of tree against a 7.2.15 kernel: Firefox 160 streams from
both sensors at about 30 fps through PipeWire. Build-tested on media.git
next.

[1] https://lore.kernel.org/linux-media/20261116175151.20150-1-volodymyrchapman@gmail.com/

The problems were investigated and the patches drafted with the help of an
AI coding assistant (Claude); the testing was done on the hardware by the
submitter.

Volodymyr Chapman (2):
  media: atomisp: Don't enumerate frame sizes the preview pipe can't
    output
  media: atomisp: Report frame interval for sensors without
    enum_frame_interval

 .../staging/media/atomisp/pci/atomisp_ioctl.c | 86 ++++++++++++++++++-
 1 file changed, 83 insertions(+), 3 deletions(-)


base-commit: 3fc9303dba01676c2090768126e5327e341b7761
-- 
2.43.0

