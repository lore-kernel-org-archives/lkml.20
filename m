Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794789078;
	b=Iwb3m6CVM8ds/f3lom5dMCrYO23W79muLxdPmFZ0EP+5UfSAk0jdFwRT3f2JPYj++EW9
	 MAuU/40XchkpksoA9Snl6HvEgEjwzWk8phH3WRddHV0A7TbytscY237yiVdeVsPmV7lRu
	 jT308Tdz5iYPP5TSjrfUA5muWCS1UJtqxt0rTkvXJUJOHjVvEBa7+7dho7XIIuJk+kIIi
	 B4P8E2BupbdXtGPQW+sn3EVyGus7KRhCVWEIeqiWSxBQKXVyMC9ShzK+h+f7WSBk6N0JV
	 GyEVbCUEybv5DsAXxxGa4BuGLijfJc/d7GRWA02ANHT2Xfg2d7W0DL++K69KpNLPeKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794789078;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=UVNf9XVGQ9iwewOtqIQdfWKo+D0otSzQYSZuL2dIs84=;
	b=HJxxY0OP7Mm6GXw5kS3XaRgJNa6RlTa1KG1MkUk+LhtmiwbIxaPrmvpldKKd5Non0tMD
	 NXPQbAExUv0WuDZZXaA6gP7+waoeApSrOQvPtdgNEUGlL/VXpUspSMEXRhuJQWWx9Njlg
	 m5fuJuU49BLiYGt1V2agrPyyzF2XbdaxK7QhbBvBHs86aeQM/Yrxh3P7uYCBPLsmgHSNd
	 iQNF/RZ1SBztqRbLyjPyJCTYvx4OHQ7UfngufN1kltDvcwZRdIZ+iekj0Y8vel8LkA/sa
	 2DPraOyS9BFC/tzHxRY0oJFKr27FwFqOl5whYYS800i/A6dj3nEyJLX3OKeyL3zwz0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=zLA69L6Z;
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 485A6606A31F;
	Mon, 16 Nov 2026 00:31:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 485A6606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=zLA69L6Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=zLA69L6ZzZaB3TYuhyeP/FA1bh+2ncGoDblW3Zwx+iXImMpqmpkchnN3lLkLXEWJY139AScc/mxwi
	 G/P1e9HKSLRN9jgo93EXac870y3v449fIgiaoBHmL9j828kqL3Lf38/G5UnRTAL2xL9KFUJU1Rpotr
	 yn6MIUlbjFKgaQHI=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app01-12001 (RichMail) with SMTP id 2ee16afa4ecede5-d45df;
	Mon, 16 Nov 2026 08:31:12 +0800 (CST)
X-RM-TRANSID:2ee16afa4ecede5-d45df
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from [198.18.0.90] (unknown[112.23.105.246])
	by rmsmtp-syy-appsvr07-12007 (RichMail) with SMTP id 2ee76afa4ecfaa2-74987;
	Mon, 16 Nov 2026 08:31:12 +0800 (CST)
X-RM-TRANSID:2ee76afa4ecfaa2-74987
From: Xia Yan <yanxia@cmss.chinamobile.com>
To: netdev-bot+sinfo@kernel.org
Cc: netdev@vger.kernel.org,
    oe-linux-nfc@lists.linux.dev,
    David Heidelberg <david@ixit.cz>,
    "David S. Miller" <davem@davemloft.net>,
    Eric Dumazet <edumazet@kernel.org>,
    Jakub Kicinski <kuba@kernel.org>,
    Paolo Abeni <pabeni@redhat.com>,
    Simon Horman <horms@kernel.org>,
    Thierry Escande <thierry.escande@linux.intel.com>,
    Samuel Ortiz <sameo@linux.intel.com>,
    Samuel Ortiz <sameo@rivosinc.com>,
    linux-kernel@vger.kernel.org,
    yana06070@163.com
Subject: Re: [PATCH net-next v2] NFC: digital: fix target leak after Type 1 Tag discovery
Date: Mon, 16 Nov 2026 00:30:39 +0000
Message-ID: <1794789039616.26008.19482872296866344445.nfc-t1t-v2-sinfo@cmss.chinamobile.com>
In-Reply-To: <179477330961.3291.17907063104926717829@kernel.org>
References: <1794705795184.22628.49502335540847234602.nfc-t1t-v2@cmss.chinamobile.com> <179477330961.3291.17907063104926717829@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hi,

This was found by code inspection. I haven't triggered it at runtime.
nfc_targets_found() copies the target, but the T1T success path returns
without freeing the original allocation.

Thanks,
Xia Yan


