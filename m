Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794333972;
	b=eQXIONBUTTb+45Jz1Pen3qtQvqQ514BBMDpgpz/cGy3jCm4XDcEBz4+MzsWP8RVKhF40
	 ZY7+Ztjzyiqj8QvvRHmXprIJRCBSsaKzI+vOwQ+OOKHZpslppOzI1mXocL7+k6VgT2Yx3
	 RpZ+xO/DoSjb9ZzlcsvSyt8EMCNlFfs2455uet9Yvc4ZaPlS+6XQr8JLF6wU4UUpGE6LI
	 M1Xg3SZiowTfzUqt31c9ONv8e2TL5/jgw8P1DmcidsPaJnyZjr6O+jttBzjTKFOgEDwum
	 79XFKUei3Cq+bTbI0ia0EMbwi9fdkbLQLbY7pgx5Dpqll1mGYmdzEt5iGNVJ1PH//1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794333972;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=W/ljMR4xePjF+MmRD+P76X/dGy8g1SjPxGW0noQ2CqQ=;
	b=2jv7K/N9wsU0nsdhQ6MwftPUcnfuYHuWQDxixTS8+JvAcwu5BVAwFOIGU09/PqZALGWl
	 3rCEX1ONI8Rao+beh5hwDljk/muapdlCylvKQyECGrYtuN+5XcoppXEcQj1Liv9iOpgCS
	 LN8jHdtjWcGTgPqlQpJP9K9pUVwWyHOyC0REiXRCydBdfera2l02aH52xLZuEK7Ost41Y
	 8sTBUW5k4h4vljLvIsoSa78TP0rt4QGGSHP4d1ehPwFRr3BeHNDTnoBJKsSgtrYMLrw90
	 i6kem43PnbkMVvBtWMy4YxLhOH/fez2RMpgg5CmhNFY3w+557M4QxSqhvyu3jZ3+NWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TLldxySr;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B91606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 18:06:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5B91606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TLldxySr
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so23737295e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:06:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794333970; x=1794938770; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=W/ljMR4xePjF+MmRD+P76X/dGy8g1SjPxGW0noQ2CqQ=;
        b=TLldxySr1OjK3JsgfFfim9ttHsN7YfVYNshcRm145+NJRGMRNa6iX4WH/LFxP0kdVo
         gdAjdi/AtB9VKrdPwGvKo/biHsE4wHbHIbW5e6WD5DRBU/sFAM+oEwolt6DjyUCSUYPL
         x4v/ZnSoMmWxt5KCdvyOpqeroeOqrDgxUt6qs76MtANO5lBxM3f3kRRPM//pnWJk1kSz
         7XYk12pGubCWLfTz9JCnF8B+thjKlGR9byzqWPnY+59pJO5aVb3bN6lDOgRkCz5FoANB
         Z0sEskv2vmMhJ7qWMfBU4wPrCFxreqxREu7E9QIc/v6P0CplkYom7XlkSar4xc0OIGW4
         +unQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794333970; x=1794938770;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W/ljMR4xePjF+MmRD+P76X/dGy8g1SjPxGW0noQ2CqQ=;
        b=UJt3+mgDlN0IX1XkQTcvPYolYBSidLWQsl2KJX4FGz8eLgZw/Utc9syKqRzWNhCHHI
         B+JDLuawFPOgE6CsnT/JZEkqy7uCnnwp0x59TmWLDNM9gkCIUdlI9C06zSQxIxYbDQcP
         9D/yvp9FE7iFLh7iDaDXBC9oJLYAoEvjqKkqaItW/5qRdOywL4fvlQkY6uQ99r77G/9E
         p0sCotaRE+F28wQQa+rmS4XVv1twMRhizHfT1M0+3wp7LQDV1bP5adiAqc+auIBHL+vs
         8WRyVi5i3B2QX7jBGyB4f2MgZLUv/Tzqog1zfOAd4tMXm7kC2qdiseD3bPE0/Owt1io2
         LTaQ==
X-Forwarded-Encrypted: i=1; AL+hErG8buqzune75yhoZqBpgXKKioFfS1SUtM1r+qf8Y8zpPScV83hxySw1mkM/EBID0S+NDIu1/IvgvdTfdfU=@vger.kernel.org
X-Gm-Message-State: APuU4Z99yuhcB0CLRie+n77z41defal2vGq5DXCq9VI+4EpANDHZQ6WO
	n9Cn1w03QeebQePTi8SytGtZj7ZC7M0tjiO5zfTLEloTFlWOg8Y0ADAyjtaFxWr3wBtRrQ==
X-Gm-Gg: AYBFou2nSo8ztP3Ru92gahZf8aXSk1pkpjlQ42iCBkRyL6uwP7cCio7crH3ZRz5vAiv
	rkncZsbwtRm9Fce3e6CFVb+/e7PC2kNstJu7pYHm8jjmiu2AFoTqIscYCI+k8WdvrVKDomn6R+y
	eLf8sSBapozfT9vK9pr24AaK0Up3SbtDDmKhecJsLheCKA0IK3G14PZ9dkYhedmi1ugSH5smUrm
	kL8DQJGl/rS68p6MGoHIAnS4BlDzwwvtaXQ4eude9WFyY26zNiD+UhMkBJLaF6hgrkFHFlorwbm
	VnIFZcMMWOgMaiu3d8nBVAgaF5SQai5pT2LZCgL/NSXae4mx8xuAVs6ScMwWKMDWszHan3Kz5JL
	mW4rTe8I9e9aT4WS6ABB/kIAmbdx0HWon7ZupUb28EFTiz+NxZqI+qTSGEsgEWBnJG3jEMwn5gZ
	z5y30xrkY0uDkn0CM4tulvMushN9utU8Ddl62csa/jaM62A8lXUHZCvLH6uEebfCsH79IKaNJaT
	yqNjsERjriObCE+yQlfEPZEwzoqT4swf1QIuFzpb/8qUMMfjou0n8GHrV/+fzzoU4GiIGDe8uut
	AwAnSW0qUFzKncKV9bIyHpWHt46J5eVZuQXIVvERyOJEEsI4Nf3o86cZ124mFxNEwzRedTFTCqo
	wU00TLupiwhXcuVcEOqKp6tptXeHJ+M0FjWTlOixHJv0Ti+Oa/qHfMvgHcePB3g7QzQZ5qL8Hi9
	KmHnZvLW8355W527nIWIRlWRng8JV8l2hBgH1UF2848w84dqQtKtOWyCyhR5R0/73+ivWo2vx4k
	r7TiscsZFZaKkxp6Q==
X-Received: by 2002:a05:600c:a013:b0:4a3:18ca:806 with SMTP id 5b1f17b1804b1-4ba0234a0b2mr57198205e9.20.1794333970060;
        Tue, 10 Nov 2026 10:06:10 -0800 (PST)
Received: from longitude (2a02-8434-fda5-4201-64a2-5e9b-f89e-f448.rev.sfr.net. [2a02:8434:fda5:4201:64a2:5e9b:f89e:f448])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498366c500asm6270450f8f.48.2026.11.10.10.06.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 10:06:09 -0800 (PST)
From: Eduardo Mucelli Rezende Oliveira <edumucelli@gmail.com>
To: mhiramat@kernel.org
Cc: akpm@linux-foundation.org,
	rostedt@goodmis.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] bootconfig: Preserve values and key paths during parsing and output
Date: Tue, 10 Nov 2026 19:05:58 +0100
Message-ID: <cover.1794333957.git.edumucelli@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Hi Masami,

Thanks again for reviewing and picking up the earlier script fixes.
Here are three fixes for the bootconfig parser and command-line tool,
based on bootconfig/for-next.

The first fixes compact output closing a brace too early when a key has
both a value and a subkey. Reading the output back can turn a.z into z.

The second trims unquoted trailing whitespace at EOF, so adding a final
newline does not change the parsed value. The third keeps accepted values
containing both quote types readable when the tool prints them again.

Each fix has regression coverage. I tested them independently and
together on my Ubuntu machine, building the tool with -Werror and
checking the parser results, compact and list output, command-line
rendering, and test initrd images. The full bootconfig test suite passes
after each patch as well as for the complete series.

The three fixes are independent and can be applied separately.
Feedback is welcome.

Thanks,
Eduardo

Eduardo Mucelli Rezende Oliveira (3):
  tools/bootconfig: Close only opened braces in compact output
  bootconfig: Trim unquoted values at end of file
  tools/bootconfig: Preserve values containing both types of quotes

 lib/bootconfig.c                              |  5 ++--
 tools/bootconfig/main.c                       | 29 ++++++++++---------
 .../samples/exp-good-mixed-kv1.bconf          |  5 ++++
 tools/bootconfig/samples/good-mixed-kv1.bconf |  5 ++++
 tools/bootconfig/test-bootconfig.sh           | 29 +++++++++++++++++++
 5 files changed, 57 insertions(+), 16 deletions(-)


base-commit: 677f83795fdfc25ddc51b665a9111f5ff199f7ca
-- 
2.53.0

