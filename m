Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3805312836
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 17:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791997534; cv=none; b=UTj+sPY1Ks344hfnmnAwUlMBa0yudEHxjyRzg8LD4P3JxtJcQaZYufklyAvfrRUT3IfGlwULv3k/1vCK91Dg9H6t9eLnmnvj0Soh8e2FWxPOjSWZjNXtRz0N3rulOeidb8C9J8zrWk+gYNeykvviUALpaNY48E2aoHSD6V8pbY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791997534; c=relaxed/simple;
	bh=+W1Y+BCj9c18kizcf8WLQBA90kA+0tB4dl0oI8EtLFw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HOCxwaJvNacb+lh5WyLgFIlA3o+sevpLCouqm41rGM5HctCDov72+URIk8NBwmHdBGSGnzY3MGW3eegRXXFmFUV+xfQR8ukCu1UGhS8vzMT+XseZjH5akmV1MYbhYZWYsHoMrI3vfgzi/B0Bco8LHQUCGRiq68jwTbMzj3mUkTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rEeeWVrq; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rEeeWVrq"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a1880e1bf1so11260475e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 10:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791997532; x=1792602332; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OVk1zQ/OEbMRFp/NCWXuyOatJombWw8MRS7/HS8mm9o=;
        b=rEeeWVrqjZNiFICgc1pRrJ3vFyLaFv117riu1L3oa6g60Cvrh6Ns5mhmUJxeRmeOaa
         SykTDxSb8QR4iFG/6/hllD5mXaFvfGpkWvCiNm1ZPv40LtSfxToLjrvjw1qIGc4KFGxU
         iil6itTTaRQk34fvwildRHRmAWFEi6FDV0FBs2G0Eiqe3SO31CHDtnUWAyhAAtdINTU9
         Ityz2xhPqPH2F44a461KjQU8XSKdvjsncQkJU8E+JVgjyHkONMBvizk5BZYRvSlVR6Rk
         sG4AzwzAGrZ+TnVXNiu6FP7eahn/Qbfk0+NCVFYipJ4KnRCeT1znpAzs0BQiFb4CMsM9
         a+pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791997532; x=1792602332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OVk1zQ/OEbMRFp/NCWXuyOatJombWw8MRS7/HS8mm9o=;
        b=q8LpIcjGQSL4nou7Q4gdxjtQSu4/AZJfVMzdt48f9kneE/UtrEEZGDUC9Tj3HJTNP1
         U1oIwkW6Obfj0F4kCm3IwzPevKHP1tJrkHyCf/HM9ZH/kxp7aPF6mYMkqK9cqgfDvtAb
         zJbR3cWdva6pB2l85eVQTOAtMFgTikp1UQF/2wVzj2eji97+W5lTdrQ4GwutlYztnxwu
         sLgE8RmScfqYUb4u2BBZT0dScSGyLHTDXQI6Qofh+KhCmqpnw/ZI3A9PdVsDsLpMyQN0
         DdO2LHuC5I6CvukqM/q8XQDGAR/bC1rZXe8EFkoDr05t8my+shTTPpfePeoJ2KmQehX5
         beyQ==
X-Forwarded-Encrypted: i=1; AKwUvBwBMWIreKxM/q/VWIT8IGm4AZZ1wKK7RvgigiSFI3zpTgC6dNK6WosP6pHb+3yfcYO7c1t9KSUAZyeaKX0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJnAQW6zotrtJSBkkIrAU3zFv/+a9z0xX8GSNnVKndXsAIyiaYi
	+j/RMG+gsZQSKRfJbtxiD/rOnknvgGQO8/AUdf8y9lNK2OS7L932emq+
X-Gm-Gg: AYBFou3d1J600bAyzOVXNf/A4ikFw2PnLnka5Ht2MnJ3TzfGIFNi4fbnsh0m92fS6s2
	CFq8XFLQrG9juoZJhGCzSMFrxemqKH/73WrJqCwrEtzDUAVodhiipeAPoJ6QITMWxNmS9/gncdr
	u5ZDvM58EWMutlNFkGXt0rR2PU1xEKxDdl9i2eO64Q+ZkGbedlvD/fYceQfeedDcp/oK91q8Q7i
	7ljPAX8oy+wfHJ14lhwr/HhIzGx0gfpssMiE89ZrPE2jOysRzb9MjxI82S3CeuLDK4FOG7+KHNg
	d23kA4m6aX9v4gP62S+ssCLgp5z2hoM4fr9s3RMp7OnwLfca7odpFFVDT3hN+EDJzrjTs0E7raB
	Ah4XLvmaHnfQbq2WepvBm6JZxY/f3d9X6WqB579eY+sehoGNUAHjx8UUaM+ZMjFw8TJ0/5P6+bK
	ghfOTkEFZlA70ugGJeBYxuHRgpu8m0KsmOJ+y4bRigAgrVPGEfbq4Q8OKAMuO0P/ACAYvikAj1V
	dFePnqnwqPMrPtOo8uBueCoDMpaUS4EJiCVc55SoCEMbtQ=
X-Received: by 2002:a05:600c:19c8:b0:4a1:777b:8a12 with SMTP id 5b1f17b1804b1-4a18e4adcdbmr328508655e9.14.1791997531763;
        Wed, 14 Oct 2026 10:05:31 -0700 (PDT)
Received: from andreayoga.wind3.hub ([31.189.109.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd98637asm4863305e9.8.2026.10.14.10.05.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 10:05:31 -0700 (PDT)
From: Andrea Parri <parri.andrea@gmail.com>
To: Christoph Hellwig <hch@lst.de>
Cc: Andrea Parri <parri.andrea@gmail.com>,
	Sagi Grimberg <sagi@grimberg.me>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Keith Busch <kbusch@kernel.org>,
	linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 2/5] nvmet: zns: don't leak stale memory in zone management receive
Date: Wed, 14 Oct 2026 19:05:23 +0200
Message-ID: <20261014170524.3151-1-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261014130431.GA15622@lst.de>
References: <20261012141239.156408-1-parri.andrea@gmail.com> <20261012141239.156408-3-parri.andrea@gmail.com> <20261013142554.GC14759@lst.de> <20261014110001.95212-1-parri.andrea@gmail.com> <20261014130431.GA15622@lst.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, Oct 14, 2026 at 03:04:31PM +0200, Christoph Hellwig wrote:
> Just to make it clear, that's not to say we don't want these fixed,
> but they are considered robustness fixes and not security issues.

Thanks for clarifying.  The tests are now posted:

  https://lore.kernel.org/r/20261014170046.2516-1-parri.andrea@gmail.com

Andrea
