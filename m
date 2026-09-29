Received: from mail-lr2-f34.google.com (mail-lr2-f34.google.com [74.125.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 492F24EC666
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 09:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790673788; cv=none; b=lasWrd7hmkn+eLzMj2o+iDM8Tm8xuIIkMvxj2q9TE8JFtswEHVe8y1zcFyiGapPsclJKbZzgxa22SMk7YYYfnSU4Cs/KijWoZEnu9kuH5aLuYJO4KBd/iM8xOXCN6zoN75zbxQSB0WzTAnuUMJys9EgZMGmpr1BGRRdknEsfSyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790673788; c=relaxed/simple;
	bh=Yvv4offk/A3nngbeY4OC0TNI33ABSFCQo9LNH+QTLbc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SbG6ZYOtOt3sZ/OIKmdsmbCAFSKxQ+RVgXMJQZDejipBJPrO5P9Az9QRjpy5FV8WcL6LyLJHHcovocPxKA9kLTB8sTMi6gzeFN5mrNNGSvyWI7Xve6qHNk+UNrp386b0p6IYgixrUNVOpAPPWWfLRY8AoI1WfXWRHeROJ41tinY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Srj2A525; arc=none smtp.client-ip=74.125.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Srj2A525"
Received: by mail-lr2-f34.google.com with SMTP id 38308e7fff4ca-3a66f8bc23bso20033871fa.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 02:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790673779; x=1791278579; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yvv4offk/A3nngbeY4OC0TNI33ABSFCQo9LNH+QTLbc=;
        b=Srj2A525OvevwTMHidJmtVDgHePcc17wpKwTu3gLwrb0ogJezUQQllSydx7z9+OkLK
         qlNt7iHCr6Jgbbx5wxUppI9iDnF2fskOU1exXyqmQg3P/y7EtA4+VTudflh1HqzmaPTl
         4YbWc08UwAFSWExy2EQzjv+79EDGG2MBWX8KAFseIK3QHT4/bwmxsLa4bQsxBZEj2Ez+
         Be3i9IOJN5f1LGWkqByA7lWOhRxh6waKXf1tMC2aiNBs2wOv0t4BUqq2dumdGP2ajxEB
         eoPN5DXT9nuKoGHrHlpGuelrA8b7nv/I2oV2s27eyMq4zGGhkuTYYsHirG8ws8Fx1/1b
         0gFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790673779; x=1791278579;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Yvv4offk/A3nngbeY4OC0TNI33ABSFCQo9LNH+QTLbc=;
        b=pFLTOHfNMaBgaT4sDKc7JfEyVQ176wchrGSr69Sh6b7z1zwd31c1IsEym+nRTmi0s0
         HLOb3IIJUOJ/jtjIyFM+IYYUQHBzmN3mApEGRo5/oVH+AhmEWxZLIFm8ACTolbrEnVEG
         MRL89LTh7tgpAVdwZyL8LXOyFufd+FBDosa9mBorNhE6xF7EbtruR6nw/WFm/2OpQC53
         BR67mbssXz/1bjUq8qhY9+K14rYga0vJqfd2SVZNRUajT5lfR8vCCD/eOUBNiMJRO94e
         BEzppxxMF1E0FvUbV8svCQZRC8M9I1A0f5DOTEWj5ieXv/YinB0l+J2s1DkY8ILxw1j9
         D3Sg==
X-Forwarded-Encrypted: i=1; AKwUvByzRNETptHRcxhyMlXI+JwNnYb/B7xInHOCQAPHhIsXBzjieoKDl4gFEiqLfPC6c5D15SctsakVgJ/97EI=@vger.kernel.org
X-Gm-Message-State: AFq9FYInhApjr5W19Yeac3vkixTE8/W52PjgXRHl8f800YBBAFD9qKgb
	5a7oR6u5IJctRFbOphA+fPGpp88MOzqogYr9xW81w6J+YJ4r6wXEKnTl
X-Gm-Gg: AYBFou0PxTZBOuGLXI82asQN5U73deH9tq7wlQdf9CM/f8a5PiB5oMRh+3dhxLDdig1
	l1LBer4L0No2uZzeoBvsxoGLxbB/yoYq/V/ZYD55dodN8fsAsOH5949kYc7JbYsu1gY+fIR36ff
	bwBcx94C3j78Ds1kWzkM4wXioG4cd+N1y7UWcmU4EyKIVN/d1oTxkNB/KL+s/Aoc9M2M4q8mk47
	4G3o0SLQf4I5ibh3QFpTb0C7LvIT9P/52zV4zROg8R5GPn3ZUEGRwXSfiot+iUhm19Gb7MHyRYU
	Z+4DhJrEl2DS6AzEC98jeZtQ6WlMhHRyKvIxKG8oWBP/G1M9xXxbv0Ud/8focZfTRnlYX6wqJHe
	dZNx4ahl7EFC7Urc82gZJBRky9ZgC2XFs1+ZZziidEc2oEySXk8QDNnDT1Pj0shCe/itEJONmkg
	GEQYP14RY/Ubflqisu4qr2D3YdGqEQAv8yqZemdtmnj4KcaI9gopgI7QIzPB7n3K3PiLahR0vaR
	3dkqApMgVo=
X-Received: by 2002:a05:6512:3096:b0:5b8:ef88:d56b with SMTP id 2adb3069b0e04-5b8ef88d614mr3358193e87.18.1790673778535;
        Tue, 29 Sep 2026 02:22:58 -0700 (PDT)
Received: from quietus.tail91f8a6.ts.net ([169.40.47.10])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b9d826f9fbsm1262160e87.12.2026.09.29.02.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 02:22:58 -0700 (PDT)
From: Ruslan Koreev <koreev.r@gmail.com>
To: sakari.ailus@linux.intel.com
Cc: benjamin.mugnier@foss.st.com,
	sylvain.petinot@foss.st.com,
	dan.scally@ideasonboard.com,
	mchehab@kernel.org,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	pm@petermarshall.ca,
	Ruslan Koreev <koreev.r@gmail.com>
Subject: Re: [PATCH 4/4] media: staging/ipu7: Add monochrome pixel formats
Date: Tue, 29 Sep 2026 12:22:38 +0300
Message-ID: <20260929092238.1765758-1-koreev.r@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <arY2CULvwXGyVvH_@kekkonen.localdomain>
References: <arY2CULvwXGyVvH_@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Sakari,

On Fri, Sep 25, 2026 at 11:51:21AM +0300, Sakari Ailus wrote:
> Can you try doing this with the ipu6 driver instead? We're about to drop
> the ipu7 staging driver after some smallish number of kernel releases.

I wasn't aware the ipu6 driver had grown IPU7 support, my base was
7.3-rc5. Tested now on next-20260924 with the ipu6 driver and patches
1-3, the vd55g1 one reworked as you suggested: the sensor probes,
ipu-bridge connects both cameras, libcamera streams Y8 804x704 at 58 fps
from the VD55G1, and Y10 and Y10P stream with plain V4L2. So this patch
is not needed there; I'll drop it in v2.

Ruslan
