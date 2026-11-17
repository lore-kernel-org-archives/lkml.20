Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794878045;
	b=bwR79zwdWkRLeqZmrrieIZWWY0JDr5UQwN/xBSpPrWWhTzt5VbNSzTli8QTCfyZKZIpe
	 66SDXQeZ2mrJ/wLCXbHhgSs/KVWCwsHLRKOn0atl9db3Sz0I5SCPpMjfVN2fhm8IMy8+Z
	 v7VR1/lNj1a8XolyVEs3FBwuBKwVYhvTUhJukv7UbY+A5NDly77eHUsw5nHE1TP1ZY8jE
	 w/ZTZ86gYbWrcTSt2Ra23S+IcUp6d8BsXiKl+yIVzTxbNjufvV7jdwnL5w3AOvPO1FeE6
	 T/8ewSNBE5xbmMiP7QI8CDpbP9GlZUMyDwFFnT7U0HhIicSou+E+auMVmOUDgCMBkyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794878045;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Qn1Mn2wvUs6jh7b5e1647BY73QvCG7/CY3jYxJ0UOIc=;
	b=i2XMWDSNhg5HIC7SuiNcWZ3495vvz0z/JqioWnUy7D9+bVoz58IqgEaahdsMxeTxbo6B
	 h+i4Ww/LYuAc/ojPfU2AY5ULa2xt90F154RZ+8HHJ0p0sQNHtWC9FtanOUDf6mfjl2rZt
	 F1QP+VLWExfOZG4eVht0zGh4j8N1PAWes0I1H5f+rICkLF/cA9HJKbYQiyKX3EyLV4B1p
	 o7PY+uKkwTjQchJD4spOJ/Knja7iQW/PcXuunnREpXHGSYk9a0TzunZQJRAeSUlWYOTRs
	 Qk4lFoDMnSca9jxGy7Moe3I7w6uf3UCxQbHAtujtKw5qRAFcBEujetsuAmlcwRsqN6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=MNVdxccA;
	arc=none smtp.remote-ip=111.22.67.135
Received: from cmccmta2.chinamobile.com (cmccmta2.chinamobile.com [111.22.67.135])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4157606A31C;
	Tue, 17 Nov 2026 01:14:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4157606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=MNVdxccA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=MNVdxccA7dZPweP95G0pKpNi1UgtlNU16oeVLzBDV3MStjHmTBtDAtgTfh6wytOo4wwCb68s7tybV
	 xkjZL54veHH5KoOhNhcuLeHk7sD0xFcAd8Szo72Q/GXkj8HWuAzsn/jcyfSrvQOdbEXBnXIdXGVHMB
	 C9lVLCuknIoLOyQs=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app03-12003 (RichMail) with SMTP id 2ee36afbaa5a69a-cf3b0;
	Tue, 17 Nov 2026 09:14:02 +0800 (CST)
X-RM-TRANSID:2ee36afbaa5a69a-cf3b0
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from DESKTOP-3K8GUTQ (unknown[223.108.79.97])
	by rmsmtp-syy-appsvr03-12003 (RichMail) with SMTP id 2ee36afbaa58558-9b856;
	Tue, 17 Nov 2026 09:14:01 +0800 (CST)
X-RM-TRANSID:2ee36afbaa58558-9b856
From: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
To: Kevin Cernekee <cernekee@gmail.com>,
	Neill Kapron <nkapron@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: udc: bcm63xx: Propagate iudma_init() error code
Date: Tue, 17 Nov 2026 09:14:00 +0800
Message-ID: <20261117011400.1676-1-laixiangwu@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
In-Reply-To: <20261103014457.1255-1-laixiangwu@cmss.chinamobile.com>
References: <20261103014457.1255-1-laixiangwu@cmss.chinamobile.com>
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

gentle ping for:

  usb: gadget: udc: bcm63xx: Propagate iudma_init() error code
  https://lore.kernel.org/all/20261103014457.1255-1-laixiangwu@cmss.chinamobile.com/

bcm63xx_init_udc_hw() calls iudma_init() and stores the return code,
but then returns 0 unconditionally.  When iudma_init() fails the
hardware has already been torn down, yet the probe believes the
initialization succeeded and registers a gadget controller with
non-functional IUDMA channels.  The patch propagates the error.

Is there anything blocking this patch, or does it just need more
time?

Best regards,
Xiangwu Lai


