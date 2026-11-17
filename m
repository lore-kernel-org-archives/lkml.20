Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794877687;
	b=kABmpkMMWBGSY7EkbL+7+Iquyd/VEL0Lj9TXgebAN0cQ4KdlBVPXAkuj+Nox6UE4908R
	 Z0tL+JuA/sp+UwAIB8ugzBaYZcyZaxlX3D56UhHZ1j/1xOQKEmhNGFVLf503iOohZre9J
	 Qbd6+zH30tjW4yw5veatArBjDsyg9hnf/ZfSlnbmX3c6RmEVLl6+Ac1v52WoZkTNdanex
	 o8s4XwK4OhEWI6yWVYs1MejoFw1JyBpoFflYsG3pvP8m+YTtgZ1NW+g3Q6FOsY1Xx/dfD
	 1pRplWNuh+QwVMpoQ2h+8IyRi91CtC3qbS/KVt8MhTkRyTAp5I3ozs0ELJVaSpTF7Yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794877687;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=TiTlTxzpdKFYLhZabkxm+xb44Ti2rwnoKNND/BRw6k8=;
	b=USAIDCRsyt9W6ANovASIsILlFIcD0oTRx/6DPrpze3znBZNTDjWXZKHZvSeIU3WXSmgD
	 q/YSjNRG3TIhm7dUjOYudHYdnrR7iF3RZ4n9jBhLG0Qs2iBn3uRI9oI/C2iiE4Mdcd/sk
	 pgILHsANeLu66Bx3UAmFjrZ0dr2Jm4fI2lExuN/ahsldCLDMNNcXQDWb8+sYytUuVBhvs
	 m5NznV1lE9HtGBN0lel6fMHQUX6v1AkI5dKVl9Sq6+qjvChAaZecXUtzOvEcgl/QLM/07
	 zhoRP21Oe2Mt2lP4DiseyJ+RtoDdAZ0BNvJ6NFIykeaUhbOJ5AlDB+Z6NTCzQrKI82w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=wJOl+mlU;
	arc=none smtp.remote-ip=111.22.67.135
Received: from cmccmta2.chinamobile.com (cmccmta2.chinamobile.com [111.22.67.135])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C98DF606A31C;
	Tue, 17 Nov 2026 01:08:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C98DF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=wJOl+mlU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=wJOl+mlUBkWKuHZHxEOXhV2Jk5TCQo93Np2Hllv0++aa1h9wi8Y7xAlUM90Z+xf+t6ufFDq8sOvpC
	 tlcmVLYvM8YPjtWzNI3DcQF+Yq7nKzaL9oPtyhbb29ryasDVqZwbDguy9VwMXSjd8GyDjut22ulbN2
	 Ou38nJeLJf8956w8=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app03-12003 (RichMail) with SMTP id 2ee36afba8ea582-cf298;
	Tue, 17 Nov 2026 09:07:56 +0800 (CST)
X-RM-TRANSID:2ee36afba8ea582-cf298
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from DESKTOP-3K8GUTQ (unknown[223.108.79.97])
	by rmsmtp-syy-appsvr02-12002 (RichMail) with SMTP id 2ee26afba8ead44-9d1a7;
	Tue, 17 Nov 2026 09:07:56 +0800 (CST)
X-RM-TRANSID:2ee26afba8ead44-9d1a7
From: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: r8a66597-hcd: Fix clock leak and unchecked clk_prepare_enable()
Date: Tue, 17 Nov 2026 09:07:54 +0800
Message-ID: <20261117010754.1599-1-laixiangwu@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
In-Reply-To: <2026111648-landfill-skeleton-efe7@gregkh>
References: <2026111648-landfill-skeleton-efe7@gregkh>
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

thanks for taking a look.

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

I have not seen this reported anywhere, so it is fair to call it a
robustness fix rather than a fix for an observed failure.  If you
would like to keep it, I'm happy to note the "found by code
inspection, not observed on hardware" context in the commit message
and/or drop the Fixes tag so it does not go to stable.  If you
consider it too theoretical for the tree, dropping the patch is
fine by me.

Best regards,
Xiangwu Lai


