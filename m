Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794463734;
	b=EcthJXRSwi6mQD3oLKMe5NSk1BbSNmNaUUl7TnOLXIuYyvrBf+eT55Iu7eCyJGBc2zJo
	 DaAWxvNNkPHV95y1rZKaOavV2bpKDtGyKv6frwxh+lLiTxOklhE2b9y9NlnTGTUzWKDyk
	 qHeN0woYWKY/aOY7/WcLs0DGtOgUCbn580oNbVzGBQbNdrCfPxvlb5rp2HRKeH6Q4ICVV
	 OAKt9aPvE2LBhcpolFNw2/3KcDR/2d1xNPj/2ZHD64Log0Y21d2rvui6xXHmkwzVvoGf0
	 uFVSN4rCNMsxUicgGyM5ZBvCfH9mXiy2cZriRT9F1KlWhCK544vY/TTllMlwF7HVOHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794463734;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=d34XSrfuMx+vANo8jvzVnrlWSb6uHMB5+ZtwtuhDdLs=;
	b=MXSd6EmPHFcnsElAlCb0GS+GcXLlFYJtMIVpNapB5JNlo26vGLNkP9LUi/v0xzN1rAPU
	 1F2onykjvdt4pULsgF5gTKt/0inouicWuZmtqkMjfwqVzUbgAUvgKQq28QvEbIz/vbHkc
	 MBbxe10tkn0X8rDEMDJNNKa+H/aDy/C0Rzqg6V5R8WCQ/91f8xw9NnROW2GiCjgnziJiY
	 SJpYxU3GqJr//SYrt/2uEaHyVf2sBlOPOwjwewnxqHI9Kcx0Qkb7uxybxi5ldkyZIwaoJ
	 V45ny3e6VPAg+diA3FhbjgIvknfj7+NOhdDWplMAY5k/P3YZqPKwu2tbwNLUglrDqog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=tAewpM9D;
	arc=none smtp.remote-ip=111.22.67.135
Received: from cmccmta2.chinamobile.com (cmccmta2.chinamobile.com [111.22.67.135])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F66F606A31C;
	Thu, 12 Nov 2026 06:08:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F66F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=tAewpM9D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=tAewpM9D7SOhLkTmMhP3nlB3KiDT/XyHa5JzzTpKDcGXR0mtmjfSIrqSZ/OBk/n4s54JMkyPrbNBk
	 RC4VRjrP5tLP0wGwnn7qpSFeze9AFubAqnS1X3PkISVE7Ucs9LqnPeH0vDtWuYTCRQYtwbHWmu9YLa
	 iVZtkq8vKaj6Aa18=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app03-12003 (RichMail) with SMTP id 2ee36af557eecba-aa656;
	Thu, 12 Nov 2026 14:08:48 +0800 (CST)
X-RM-TRANSID:2ee36af557eecba-aa656
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from DESKTOP-3K8GUTQ (unknown[223.108.79.98])
	by rmsmtp-syy-appsvr10-12010 (RichMail) with SMTP id 2eea6af557ed187-f46a4;
	Thu, 12 Nov 2026 14:08:48 +0800 (CST)
X-RM-TRANSID:2eea6af557ed187-f46a4
From: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
To: linux-sound@vger.kernel.org
Cc: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>,
	Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soundwire: mipi_disco: Put fwnode on property array read errors
Date: Thu, 12 Nov 2026 14:08:44 +0800
Message-ID: <20261112060846.1898-1-laixiangwu@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
In-Reply-To: <sashiko-outbox-210194@kernel.org>
References: <sashiko-outbox-210194@kernel.org>
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

thanks for the review.

Both Fixes tag corrections are right: the subject uses "mipi-disco",
and the lane-list error paths (including the -ENOMEM one, which was
missing the put unlike its siblings) were introduced by 71b405b18444.
v2 carries both Fixes tags and mentions the -ENOMEM fix explicitly.

The clock sysfs buffer overflow is also real: prop->num_clk_freq and
prop->num_clk_gears are taken from firmware-supplied properties
without an upper bound, and the show callbacks use unbounded
sprintf().  It is already being addressed by an in-flight patch from
Weigang He, so I did not duplicate it:

  https://lore.kernel.org/all/20260926042935.2284011-1-geoffreyhe2@gmail.com/

v2 follows shortly.

Best regards,
Xiangwu Lai


