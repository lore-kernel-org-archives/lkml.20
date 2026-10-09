Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A9F4E8DF6;
	Fri,  9 Oct 2026 15:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791560512; cv=none; b=mhq77ng66v62dlfRwiXhX7GNTl8Bag4ud8R9gDYZVcMcZGQlvexI2Gqy8gsI3SqaQ69pOpJBrzEESBTV3P3KDxXDCNO7isuhXdfXi8qDEQ0A8mNiyU7uflwdBiXGGGejDdhNFkymuz8QYfuuX6LRX43CAoZv8ydgOxp7RDEqP98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791560512; c=relaxed/simple;
	bh=3PqI61lXSFj7U42aErp7pEoVX2a08D1j7KVAxV8kBkE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=qNDoPhNMqGmrWWWcjL2TjsRs7GQ5mFYhI2+f11Sb4BTbEp7UdO2jegtqffLH4AZJSVn1NF9jjz52/Z4hGMO+c+j6EpVmTZqPU4WQxMnSYZqtgx+jH0dtdI8/RW7yLitor5FxbspM3zR/lInh4QnFH9ZmAAYVDNDJ/vueu3ezPuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D8uJrmHo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D8uJrmHo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 975A41F00893;
	Fri,  9 Oct 2026 15:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791560510;
	bh=JTxW/7DmtMbmzkDS0tj1F+fvllgDR7ZhOFWZejm8N8c=;
	h=Date:From:To:Cc:Subject;
	b=D8uJrmHo9iGi9qH4Qe8SIb2DsE6v/+JL+s+CPbExcgHNuPJhlnd3ude7MvUakO+Lc
	 Bz1XIzG5N6vuxoiuhJBHqyidGFjadGkyc2Tgiz13uEcMK7l9IUplhTZJ/3Hu6rn8Kv
	 TzqARTC+/rzBaWJ617Bka7aHvOT6cnHIW3V9wcbYK06ZIauIg18M6+zhdqp3aX/zwK
	 UKve1ojukO8wcK8Dv5LvVyM3jWS/5+UeI8JucXmCUDy7EmDa4T/dtWasi0xk/TMTZT
	 1ylyStIPYkd/ibHQ9fe2nFPoKSjpMVec9f/0W/lPA6vl+JdSDSVjylLVKtOqe772w3
	 b+SXIBIKkHIeg==
Date: Fri, 9 Oct 2026 17:41:46 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton
 <akpm@linux-foundation.org>, Linux Media Mailing List
 <linux-media@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>
Subject: [GIT PULL for v7.3-rc7] media fixes
Message-ID: <20261009174146.0d324c14@foz.lan>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi Linus,

Please pull from:

	git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media.git media/v7.3-3

For:

a fix at em28xx unregister code affecting devices with FM radio support.

Regards,
Mauro

---

The following changes since commit 37bef2170d4c88fc3d708eecf3ef0f4032bc1372:

  media: mediatek: vcodec: bound AV1 tile-start copy to the array capacity (2026-09-07 09:01:05 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media.git tags/media/v7.3-3

for you to fetch changes up to 2579cbe68005f46fc7f8f95364f6b101b07b9d1c:

  media: em28xx: use video_unregister_device for radio_dev (2026-09-23 14:13:47 +0200)

----------------------------------------------------------------
[GIT PULL for v7.3-rc7] media fixes

----------------------------------------------------------------
Rohinthan P (1):
      media: em28xx: use video_unregister_device for radio_dev

 drivers/media/usb/em28xx/em28xx-video.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
