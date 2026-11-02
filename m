Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.152
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793633844;
	b=eMUkgzfnAXpUUBAPJLaK/iDS55AY4ExhYUgSK9Gh69lR++t8R0x/ML/3drICAdJAAPP9
	 Hb0TPTUYugo9Z3P0SMcl8oGCaKlSPtaU+/y9/ajbqGpSL2Fb/hPN83a5Jx6V2dbB7qZJS
	 yihKOcEl8DZmdK4uPZhBBOc/TVehtPP4cvyGhgMJqOYr+SdD5UWlrz4ZvA61cdh/0+gJ6
	 g5ahZIvGCxtD0SBJQ7Mq4QS9Gqa1L7JpHqsy1lfwa4I760r5zC41w+60KxilojOuCCK2z
	 fe454UQypaXaN87AdcXZIGsR0Feo2ZUQ/1PFKAvgNuRCLX9NShBttLWvRSyhPQOKA5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793633844;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Message-ID:
	 In-Reply-To:References:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Priority:Importance:X-Mailer:
	 X-Originating-Client:X-Rspamd-Queue-Id;
	bh=dxh/pNlJFx+QNt+QDC+RWZfjDJwK2dniC7Lb6a13yYM=;
	b=RnhaCpa6NuwnfzDqCAiTcJvsP81HSgXtXK68YZfAXT5XqwY3oBvQS+WxDjXJ6zIkPWrW
	 ++qFb2RDPGM8Wd87O6C/+44isvmdX13QwK6JR9hv6DzGmYakaFfXHe5Cdc7D6UzI5IwTR
	 gXFiCaZEd6bWZOonNMeNtFG34id/Dw9yc5BL/MYSDn9hhuEBGFdJY4oDHXbBmIBLTEquZ
	 QVJexmerPj5B3wmnGIYPrgCqDXU80UOUjNsvRR9in0P1cV5U+ZmIuORJcJJg/RUGMC0qz
	 4qJIJNowy4MmQWXR3duVXjf4qyyOcFcKThuhiDCwRFMcF87pPhx8zdPNg3K+UZFNcAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hsal.es;
	spf=pass smtp.mailfrom=hsal.es;
	arc=none smtp.remote-ip=80.241.56.152
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD0A60E6E51
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 15:37:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CD0A60E6E51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hsal.es
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hsal.es
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4jJG6M3Gk6zKnFK;
	Mon, 02 Nov 2026 16:37:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hsal.es; s=MBO0001;
	t=1793633835;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dxh/pNlJFx+QNt+QDC+RWZfjDJwK2dniC7Lb6a13yYM=;
	b=kuwHeC99ehmDz1LMDtVKPRWpVxDT6gsFx4Py+fJ72RBFUxVj0O4K/8WvfBeckPwrOL3fkz
	YjZrjQPqC/J4G+heq8+pUeu8xS5ES/3G/fCfTL1ubA7YW1F8DB4gzhBrDg8Zs3FXXTIrUU
	sGC0IEU9qbGBxKvPG5GWJxn+Fjhjm5avOSwBb5bAMLcCMaincSz3JSgkoHHnFC2Ohkycdj
	lFWBDgpYka4p0izzf5fJUamCtlS1mX3AqCXBCVUb4Hv5igb/X63jQeUauDdma9PaSrx0vg
	3pZY3AUbTxFAPrmV1rEGfeBmi/jjWdMz4J4EfcfqU1nU+PmgyctVJ9B2AFbT9g==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of hugo@hsal.es designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=hugo@hsal.es
Date: Mon, 2 Nov 2026 15:37:14 +0000 (WET)
From: Hugo Sales <hugo@hsal.es>
To: Mario Limonciello <superm1@kernel.org>, alexander.deucher@amd.com,
	christian.koenig@amd.com, amd-gfx@lists.freedesktop.org
Cc: lijo.lazar@amd.com, harry.wentland@amd.com, alex.hung@amd.com,
	kees@kernel.org, airlied@gmail.com, simona@ffwll.ch,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Message-ID: <1267219663.279946.1793633834409@app.mailbox.org>
In-Reply-To: <991e63e4-4230-40c0-a18f-6c0103bd225f@kernel.org>
References: <20261031153948.127016-1-hugo@hsal.es>
 <991e63e4-4230-40c0-a18f-6c0103bd225f@kernel.org>
Subject: Re: [PATCH] drm/amdgpu: Clamp the ATIF backlight curve to its 99
 points
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v8.53.348
X-Originating-Client: open-xchange-appsuite
X-Rspamd-Queue-Id: 4jJG6M3Gk6zKnFK

On Mon, Nov 02, 2026, Mario Limonciello wrote:
> I would like to know though; did you see this in the wild?  If so I'd
> like to hear more about the system that had it and the system firmware
> on it.

No, I haven't seen firmware do this. I found it by reading the code while
working on a series that does the intermediate calculations for the
ATIF curve at full precision, which I'll send soon

Thanks for the review,
Hugo
