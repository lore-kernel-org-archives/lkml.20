Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 634F44FD269
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791896421; cv=none; b=D+U+NqeNm3cWFAkIv1a3nkrugTHVfiNIq16nFmKROYgSUJ5vABkaqMzLVT/3rVuyxXnFEpgMiQEK7Dp70OpGhbPf2Yhvxr3+ZLIUHTx/WctxT/7wHG/zuHD/SCqz+BHFZ4wYh1rcHUAt2se6ocN79vmaiLVbPYkVbU+fCjs3DPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791896421; c=relaxed/simple;
	bh=a1lPUx7YoLnWIcITo7CrGZIQIbKO0UFk/H/zKHK4q4U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mouCbrQnsbwJ1sfhCItw4+N3J1yU3/F5X2tUf7DWToOzcX5kPHH2t512Lsh8gdiIOr0JmqzI5h7Qsy8dnU7qYL7zQQqvi+7U3Icwp0tLh/IOH/Pbg2jbPplihfdjgTlxDzJkaicfYtr+T8diY3qWQky+bpMCa6hPbxA+xGSu0NM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aLIiIwS2; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aLIiIwS2"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2e83d2cc8a2so6084115ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 06:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791896420; x=1792501220; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BPjCWxUSfRvlJUtSVwuDIbCnah44rNQ2fIrGmDlzw+k=;
        b=aLIiIwS27qUE16gpgFTyBouwBeNMBf5VQcrZbVsdjiq/cHMuelft+8yVl3iMbPhPdN
         RFguWal1CdErndElKT82F5GSN+W7Dk/g6hdqegVgsSh7I8uL/C9PyM9HnQcecfzrfEW0
         aMrJe+AscQk96gDoQ3WypEssTg/OtFrfU6p8SMuvhoH4ybs6u2SZVlDeW6+nUAkv8cEo
         InLlrkhhxJfAERHMTQAr62JnAatKDLUr731jK07xUHFInL7m9fknPRFCnZCwnoIEX2+6
         7FvnkuXSWw3CAgVUfwyGr4shWF9P/iglYc5zN3PIPTu5x/FtKdAQLueATPu4vhrJhwKv
         6huQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791896420; x=1792501220;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BPjCWxUSfRvlJUtSVwuDIbCnah44rNQ2fIrGmDlzw+k=;
        b=m6dAT7/98rhEKidB8hn4aWkj84KASOepQgCjT89Hsso+kawG20S6DDxBWXVw4qPfDb
         YlSZ2ARwbw+W8a1mgyIxB7nvlvwuyp7kclhewjA6oXm6S/qQzB0jDAndql5AN6QxAYKN
         q4l3HNSBszG2O7PjkGO5k8xFxNF4W8AE8EIQQcZtI5zIGzeCV9zixGP9d47YPEfjb/PD
         rgjqL/eUAYTSd7X7RkbWGOiZsHj+mylQ52EMkEQlTjdtvD1EsOJ6Y9ivEGTfa14Il8FZ
         ZEepUX89ObldMLlTaPdB6PVSLdY6z5Iaoxm2JdI1WVOHik0XW0OSlly2cSl5v+zsjodf
         uJVQ==
X-Forwarded-Encrypted: i=1; AKwUvBwFGijbWiy5pOk9QryTFVGzxfuBZiDoFV29AxivNA6fHQnFiPMSOhRDLKn/h1etHQ5unrEmwjOWw8BzddY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJoSYpuMBHGH5BVDjIkAzcfBDagY5/NutentdkrPDujz3fgw6Yk
	lGt5OoJ5MPSiNo9h0NJUYJQcGr+gRwl6yRJE60+KMDv79uIpjBStYPT4sr8S7ZL/E/LqAA==
X-Gm-Gg: AYBFou2j0bKyr6AtujBGs3X/YpYHmX3gOqLW9/+tq61cX4xOPRHmDJPFxsGDu1naUda
	i5gnVOkCK/NBKutWh/W+cmYF6PTaId2iOu2Cq4gCBCq+AztgeH9vZ1iJMQ/GoUikKNG+pmIMBap
	6iAfqk+c+e2CrPpVBI0iGNhMpOcum5ZnTRo00dXn1ypRc943h48Vt6Wrr5QheuJGY34XiWDjTrK
	nLlVHCNnjZhOkdkQcABy71Tb207kSaNH8TW0PbFgXxytCsHr7C9xHgjDwPaENfuTpu3oqVGCUlh
	vk6L9QS7sXnXY7GR9c6Lc812py4acApK0Vh8PtIpZXTmuRX8AXMTrxTufnrAb0zpNyGbOXwpvNd
	6BfcVpeZ3ciWUk6ljIGFO2D52dP7YKGOM93bpXlzO9Wcy4Z+i0g1PZgaqOSaeIq0CMLh6NiBUw9
	jLoxjttfEQQBrEVICxSm7/p/MMQXn9tZzUSvRb6wohivnaZI3qc7jKt+BUFiOkhR+TRkxZfg==
X-Received: by 2002:a17:903:2f8c:b0:2e5:c78a:5309 with SMTP id d9443c01a7336-2e842ab6bb0mr178440135ad.4.1791896419592;
        Tue, 13 Oct 2026 06:00:19 -0700 (PDT)
Received: from marchy ([2405:3800:834:ced2:ee8e:77ff:fed4:d18b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422e4cf3sm53869375ad.72.2026.10.13.06.00.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 06:00:18 -0700 (PDT)
Date: Tue, 13 Oct 2026 21:00:15 +0800
From: Adam Azuddin <azuddinadam@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, jesszhan0024@gmail.com,
	airlied@gmail.com, simona@ffwll.ch, andersson@kernel.org,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: display: panel: Add RAiO RA8875
 display controller
Message-ID: <as4rX-xVWUPcczNp@marchy>
References: <20261012064518.3497285-1-azuddinadam@gmail.com>
 <20261012064518.3497285-2-azuddinadam@gmail.com>
 <20261013-artificial-splendid-goat-d078dc@quoll>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261013-artificial-splendid-goat-d078dc@quoll>

Hi Krzysztof,

On Tue, Oct 13, 2026 at 09:33:38AM +0200, Krzysztof Kozlowski wrote:
> On Mon, Oct 12, 2026 at 02:45:04PM +0800, Adam Azuddin wrote:
> > The RA8875 is an SPI-connected TFT display controller by RAiO
> > Technology Inc. It supports display resolutions of up to 800x480.
> > 
> > Add YAML binding schema for the RA8875 controller, along with
> 
> So you ignored my feedback.

My mistake, I misunderstood your feedback regarding the redundant
binding text in the commit description.

I will fix the commit message and send v5.

Best regards,
Adam
