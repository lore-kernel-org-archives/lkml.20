Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792899868;
	b=vIAT0sd2Sz+3cYrtLVANdYLuCvtv6liHoTGsbu5CD7G80F4gUiax8nbhKPT2mlMuHLr7
	 MSfi6CeaPPJTnHSVoq+10zRAzJ53bUvvnEri7AEOD4a8tt+W4kJq1oBio6A/oRHmKC57S
	 xY0eOv/XvNeGB1uC7pNCJMtjbnA6QsQiRGXJQDzLBFfBPVvKE3hJgfos2CRqqqLdzbuXI
	 IUnPt8UD1T38afnBNpu7dVeR2r5LsoqOKlb8w1xNZl22meCiI1icCbZ+woKXq6aISbkRu
	 1XcRJzFcTjSfR3A3hSVaiDFp0t4vtVT0V18mH9OMJX8WITUI9HR7rIRngc1QvYVoTMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792899868;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=mzxcYUCwTt0YqgjKp0GiJp4QFX6CqOyEppZJrIxJY7A=;
	b=fvix7OJF0TKuyNkunmSLLha20RsKmLBd18v5aUhrEdh3k/7V0bmmDfOx8zSUQifpBnzo
	 qjcN+u1Aya5yIn17Ct20ZzXQjsfv90xwA5RoJVno/gIO10LL7GtNkOKx7SW9s2AJJLsSY
	 KJFg7Mcq6YdNFINbWmHLorGu5bOWN/Y4MCDGfo6kkG/AzRfuurVGjvzxy9eJBiqqTG1Kx
	 mf6SQVRNdR1C6d2pYcOGz7Q6a7cXV+sav3+yOUvw6Nji3BkjbCdPES0Dda2DL9P6vbvIB
	 xohjcKzMnzWHovVI4O7A9pXrZxPI9SrmsrMv1tI/DYhb/d7BJu2zioXQ/Br6jgIHAQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=0x0f.com;
	spf=pass smtp.mailfrom=0x0f.com;
	dkim=pass header.d=0x0f.com header.i=@0x0f.com header.a=rsa-sha256 header.s=google header.b=inpmsh23;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7DBC606A31B
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 03:44:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7DBC606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=0x0f.com header.i=@0x0f.com header.a=rsa-sha256 header.s=google header.b=inpmsh23
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3acb11973c3so1374072a91.3
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 20:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1792899867; x=1793504667; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mzxcYUCwTt0YqgjKp0GiJp4QFX6CqOyEppZJrIxJY7A=;
        b=inpmsh23JZihZWIdxCXdcljqgx0ZfDMt/YGILuWXDgk8+0JzAgMh0ettSpv+Tv+NSY
         mQw7yi3bz6cK+qKRZrcd7gvHgnrcWDWdhG6JnkS0V0/Qo5LGOgTw7Qt4yqCuTrEO1lrS
         RIHQDLJdnMNWv5RGy6z3OJ7kBzFvi37Eb6vLo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792899867; x=1793504667;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mzxcYUCwTt0YqgjKp0GiJp4QFX6CqOyEppZJrIxJY7A=;
        b=VaDuQFt6yx9dVXT8O/Ec+QpakJan7TZAVuOI9CpljPaGUqTC3T6OlDrYf1W0FQjVha
         wQWbKiVlGjl6lytwF627fLqrHcynNpdfKmiyfm3ms5B/gdIdkodAMWCTCquEICfVMcT7
         wl9lP8Xm8x0jvthtWsZkiFUjg/VGHm6hfOlKJguA42Po3Fhe7/PklDuMJn60uCHsTw7s
         arkc3yKpTrxisNC87zna0lqWSoqM9Tx5goQkMDUOm3Pv25IPld/R7CwFY0faa4pAvkJk
         trMOypSDh8C4Ol9+tCzzP8Zero6m4UEgzb9BJosNLUfws+aNeNhgHab8QReKywLAYXAR
         SeAg==
X-Gm-Message-State: AFq9FYJHAa1gWzOExkz2tFBeu7vQHumpOOjuh5tSaInxpnNOZY8s5+d4
	+p/TgLmL+1BhUGKa/GaAyfOTE2sCYqKLuMvkq6+/ih96+Tnk32JaKeFgr1zjCjHMHsI=
X-Gm-Gg: AYBFou2OxokJz8WRX9+pcY9focjhtNVwWlfJF7iR31oP9xOPvdz3kwW4yBPeHoACV/z
	FXq9SqmWh/kd2pwd7iWVcHmucJdlap0exG2wGvIdks+3kTmTm0JDuKI+peyJ8Y44CSuQ5Nfj/gT
	tHRnbhtlgGheB+JYhVHCOKn/WVvloVw5O244rFlBd5RgslmIYinTbIYzsCHCT1FZak3j+LRdxEy
	uq127Y3WsFMRArbPn2zipEzBnXrvharbzFxMghbAAZakt4mTeWeE9De9lOgHhWvpP0fs8wdsRuM
	9Zcs8+LQ9WLfQyC3KFTtavoeSefsVEt82Wa/anPa8Kssy6x1s/1FvIuR3OJbI7Df33G93gn2w8X
	VAus0XzD9arZ6F59KYTa1Q6r50P/360eC0CG3EspD19mG6w05eEbYu9RJ38hW6HVDWW2L2VceG1
	41C+I+MhqeXe9R/X9OywhWO5MIJHvC/D8sBdN06Fjpy6MPmSLdsixWYpeIqb3Umt4P2yCQpif0f
	fQCd80h9GqYo+B/hO+a4tlcuBAoNOYqSXrmDqyltbItoocFN1JhMvIAUt36B2YZCNKdk3DvxgM3
	n1A/ijBZB1nrl//6FCkR
X-Received: by 2002:a17:90b:4c8b:b0:3a4:f8da:2478 with SMTP id 98e67ed59e1d1-3adeae9c560mr3198326a91.29.1792899867044;
        Sat, 24 Oct 2026 20:44:27 -0700 (PDT)
Received: from shiro (p1469046-ipxg00b01sizuokaden.shizuoka.ocn.ne.jp. [153.223.97.46])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-3adebe8f0b2sm4181927a91.8.2026.10.24.20.44.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 20:44:25 -0700 (PDT)
From: Daniel Palmer <daniel@0x0f.com>
To: ysato@users.sourceforge.jp,
	dalias@libc.org,
	glaubitz@physik.fu-berlin.de,
	dlemoal@kernel.org,
	cassel@kernel.org,
	linux-sh@vger.kernel.org,
	linux-ide@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Daniel Palmer <daniel@0x0f.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Florian Fuchs <fuchsfl@gmail.com>,
	Colton Pawielski <colton.pawielski@gmail.com>
Subject: [PATCH v2 0/2] sh: Fix IDE on landisk (HDD models)
Date: Sun, 25 Oct 2026 12:44:08 +0900
Message-ID: <20261025034410.808796-1-daniel@0x0f.com>
X-Mailer: git-send-email 2.55.0
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

I dug out my landisk to look at kexec for Geert. Since I'm lazy and
LLMs are good at fixing bitrot I let my LLM work out how to get
it to boot again.

There are some other issues (perf is apparently borken, there are
some issues with the decompresor and big kernels..) but this
seems to be the only thing stopping it booting with the defconfig.

Disclaimer since we don't need to give LLM tags anymore:
- LLM debugged the issue.
- It has been checked on real hardware.
- I have checked the IDE driver patch, cleaned it up and
  cleaned out massive walls of text that LLMs seem to like
  to add but I have left its summary of the issue in the commit
  message.

Changelog:

v2:
- Fixed up the patch to pata_artop.c so it looks a bit nicer.
- Updated the text in places to reflect that this covers the
  models of landisk that use a PCI IDE controller.
- Florian said that the pata_artop.c patch might change the behaviour
  if the pci_iomap() fails. I think this is ok, if pci_iomap() fails
  there is no point continuing into the core driver where it'll just
  fail again.
- I'll address the remaining style issues in pata_artop.c later.
- Somehow I have now ended up with the CF based model (USL-5P) too
  and I have tested these changes don't break it. As Geert mentioned
  the CF models need their own patch to fix IDE in the defconfig.
  I have a few other fixes for the USL-5P that I'll put together into
  a series and send later.


cc: Geert Uytterhoeven <geert@linux-m68k.org>
cc: Florian Fuchs <fuchsfl@gmail.com>
cc: Colton Pawielski <colton.pawielski@gmail.com>

Daniel Palmer (2):
  ata: pata_artop: read the ATP865 mode register through pci_iomap
  sh: landisk_defconfig: enable PATA_ARTOP for the ATP865

 arch/sh/configs/landisk_defconfig |  2 +-
 drivers/ata/pata_artop.c          | 11 ++++++++++-
 2 files changed, 11 insertions(+), 2 deletions(-)

-- 
2.55.0

