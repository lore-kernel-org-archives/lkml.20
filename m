Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794909959;
	b=49VZC5RsMITVVA3S4nGFiXj8ID4SUu+/eSJZkDQl2h9nDUMXOlWbOK8125vLMlfCoN+k
	 5sduPxA38pvu7YbQ4pDBX1TyndBYBBp4GLsl+ovGYy7D0fyytY99YSaOmdcXLVCP2vpKZ
	 UvtozZD0QtmdhIgKshjkiYcBBHrp8jIreWWcvuMgATHfCvOAqaOt63K8M2F7CtI1h8l+f
	 efxMtmuRJakTpe2ozQ5UUqA+OhYpimw9Je9jeHYx2AE1lY1n1mav60aDYnl1VJV/Ba3LT
	 SiVDTDHCGAd40XPR56RoT0wFSNDAbKEgOVru1q1pTtz7GIcV5oDq4EZJAXI3N+l+nYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794909959;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=8O1zkaZWzhtKSzJk1fSuQhfVjzskekn4l1522NhIvNg=;
	b=zbpIzXWEmJZfGeJ8I8pgLstj624/poljyf9jWdxayUpgMdWHXVxfQpIBP6NKp4sM4dFs
	 Gb/QQnZvytRTxHXc/anFEKnqCiKvgXAr8a4WhpvLVc2N/mEE9/nXThmpNESoaDGUJZWj5
	 sJv+rDD+0Ndgk0pE4+mcYaFOdOSh+iS8dGFgf5+MEbyLVF23LjEb4AXuG9/BB3vPyHtrE
	 SqgbE2kfA9yL0RHy7hyk9ybFYpjTlsiTfSwENVPL7orrGkQ63LWC+ZS3vaTb/4stQfBCo
	 8/EXiRuST3Ah9ejZ/O5o/u39Vg6qijN0b/DlKBWAC6+mvNJ4O+/AUHJdOoSNIRkS5aQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=O1Bq5lUh;
	arc=none smtp.remote-ip=111.22.67.151
Received: from cmccmta8.chinamobile.com (cmccmta8.chinamobile.com [111.22.67.151])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 763EB606A31C;
	Tue, 17 Nov 2026 10:05:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 763EB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=O1Bq5lUh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=O1Bq5lUhuB06uxT5kdD81D68EJTUjPHd860+paIHX+Tqq7Hv0W8F4b2p7ag5/cKHYPnld3+LGjlcY
	 JCHMVskpW/MLn+cr1Ve2or03Qs8GaR+GGwxmeHG9OiAXMLRHSXCStO0BEr11fpL5DxSO7DOGLwtOAx
	 YG2R+kW3UO0lX1Pk=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app06-12006 (RichMail) with SMTP id 2ee66afc270556a-d6628;
	Tue, 17 Nov 2026 18:05:57 +0800 (CST)
X-RM-TRANSID:2ee66afc270556a-d6628
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from DESKTOP-3K8GUTQ (unknown[223.108.79.97])
	by rmsmtp-syy-appsvr09-12009 (RichMail) with SMTP id 2ee96afc2703c3e-ad44f;
	Tue, 17 Nov 2026 18:05:56 +0800 (CST)
X-RM-TRANSID:2ee96afc2703c3e-ad44f
From: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: r8a66597-hcd: Fix clock leak and unchecked clk_prepare_enable()
Date: Tue, 17 Nov 2026 18:05:54 +0800
Message-ID: <20261117100555.71-1-laixiangwu@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
In-Reply-To: <2026111752-planner-uproot-4a2d@gregkh>
References: <2026111752-planner-uproot-4a2d@gregkh>
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

Hi Greg,

sorry, my previous reply was missing the quoted context.  Let me
try again.

On Mon, Nov 16, 2026 at 10:34:15AM +0100, Greg Kroah-Hartman wrote:
> And are you hitting this in a real system, or is this just a theoretical
> issue?

That was about this patch of mine:

  usb: r8a66597-hcd: Fix clock leak and unchecked clk_prepare_enable()
  https://lore.kernel.org/all/20261102100455.600-1-laixiangwu@cmss.chinamobile.com/

No, I'm not hitting this on a real system.  It was found by code
inspection while auditing error paths in USB host drivers, and I
don't have hardware with this controller.

The affected path does have in-tree users: several arch/sh SoC and
board setups (sh7723/sh7366/sh7264/sh7269 and the ecovec24,
ms7724se, kfr2r09 boards) register this driver with on_chip = 1,
and the clock handling only runs for those.  It is old SuperH
platform code, so the practical population is small.

The failure it fixes is the driver's own hardware init failure
handling: when the register access poll times out because the
device does not respond, r8a66597_clock_enable() returns -ENXIO
with the clock still prepared and enabled, and the probe cleanup
only does clk_put(), so nothing disables it for the remaining
uptime.  The same helper also runs from the resume path, whose
return value is ignored there as well.  Not checking
clk_prepare_enable() separately turns a failed clock enable into
a bogus -ENXIO from the unclocked register poll.

I have not seen this reported anywhere, so it is fair to call it
a robustness fix rather than a fix for an observed failure.  If
you would like to keep it, I'm happy to note the "found by code
inspection, not observed on hardware" context in the commit
message and/or drop the Fixes tag so it does not go to stable.
If you consider it too theoretical for the tree, dropping the
patch is fine by me.

Best regards,
Xiangwu Lai


