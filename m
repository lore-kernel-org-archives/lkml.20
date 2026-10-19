Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E51A640099C
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792407119; cv=none; b=XADx3tTcqtN8GlJTdXXaD5L7CKi9oYFUZ1/xAcKNW7Ig8Gs7Hlm86XGEepb7rOhJZ+xRe1Q22mpWsWVAify+44zkz1oLodidtgcCeYfm3jLZ3YzK+kHGLfYhcC7LAT+jeB4wSeJsxFdWXvQT+p0QnsLSmEjBMMUaHMFxOsGrj1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792407119; c=relaxed/simple;
	bh=DYETpg2ch3RE6Zgv4/hYXxN4Wo2kZmgkDZJdYz89Evk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=La0mveeu+UsgFIilvxw+Pw9rkCNyYctFII/cIEtY2rFIbA0rdfBVQkMu7r83GXCRcPL13Rp+XbkllKFNmmJm9sALhZJoFSvuzR+hUCp9f3zUexaSPpzlFdc06lCsW2919TYETbMcquxfCzAGK2tnRPy0eKHhIXyLwiNyiql+ouk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=mihnb2lN; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="mihnb2lN"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48af4d4e61fso1149013f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 03:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1792407116; x=1793011916; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DYETpg2ch3RE6Zgv4/hYXxN4Wo2kZmgkDZJdYz89Evk=;
        b=mihnb2lNs0zq84B4egRQGOF7XNQjSy4XS7+axCL8ohb4ZufbZE/XPSK//tOwjI0Iss
         tZB1MjbHTh1WjwPqo4/Wbh9I9Z3519yPIbieIXnUzmVKGuVX30bnJ+qy69c2jwktGbsY
         +aF4+AYoiNofdREcuASsGN1UHlJulqZ0QJlsDnSs6Z3ta3rs/gazBKg7lI7oB7J0r+j2
         JdDuzLZUglB4nLIMvm3boevXEFKYLfzQtd1krffrx4Pk6/or4vl4Bk1SJjzYYRyKJ4c1
         HEQ03NgADEXDldMr8Qx4yyOeDalMHo6RKUW2VIn31ioByHF+tUZ8eFYPsRGxazYzjBcS
         XWyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792407116; x=1793011916;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DYETpg2ch3RE6Zgv4/hYXxN4Wo2kZmgkDZJdYz89Evk=;
        b=1uG6LcA/JLaRoib1fWrUmb0Zmb0cq3876UC8LIsoeCkc6oDik34XeljPOwioR9hqfy
         QHSdf1RoVb02UD/OyLyPodDWHC1mAz52RZuiYaXJsHn+UFN7jGIm933EQYBaz5NdvHss
         H0iGJxkf3sIIvpbadxKFBfCmKix/AHgzqSDOxkZlx66clwbTn6qoDnSIU4vMtG/nmQm6
         AiTF2CmTpECGiwmh9hFU0QCEzGjBgXxOe9d87+NU77sKba2Ct5xW0bdbsGLWhVFOq6Lg
         YNYRB/ATJeQbtTFbdVRe1dXYVhluhPG6f4AbSMBmFN8NRXuJ+LueIOyzS8WEv6rGvd0k
         9Zdg==
X-Forwarded-Encrypted: i=1; AKwUvByz3/HbsDVmsNRSxYCqdgIp0Gcor0WWFXDslcVpCCwMqw/qZBz7zQZwaUWnysUnyzcWHyfaGofziZm+f0M=@vger.kernel.org
X-Gm-Message-State: AFq9FYKMKQZX4wtEJzJxkjrxPouCkC7vO6e/GlHUhjQSajAfI5L7xX2W
	Ew9LkNP/VIQyB8mxhZQabME0aKZS6lR9J4l8/dAUSsFT5YIqrdgJr8hsWtE3eBGykgI=
X-Gm-Gg: AYBFou2IzTsEriexkZtHCPEbR40LbR9P8ypf7h26X+Yj7P9i25ulTopALQYQ2TjDzgm
	KK1xRDQPnGRasCGI4xYbdJPDXSYd2H1AeRYJ4+ogFOMe4QPvrSWMSdwuv6c8bKcvVoskSikIcG6
	xx7cQy7+6bxZ6oNZFkUu/S50OpgPRqeU+ktC3ou9isCMZNBjoFeVol+utILicFZXYYkcKm7b2wb
	hLdXfS17Cmj5pjUwOiLBsqC6sM2yDW4ULyaWWgkQonSocBdX4tk2Ce9R91pOFF6/7AabEMSTqgU
	2IdpXA45oThToLB1QJE6Cb87dtQPDvOD/WxznikSiS0YhCgsqyROUu7SpYKcgcuW2hjsnbdP/YS
	68wzxEaktGZoHB4shA7L9LOJ/bzTrMnJYIODRvRu91CxzFDAsF8X1RSfhOXuYZDcbrhUF1mRhZi
	TaFt0Cs9iCD+hAAY/IWDyPc5OkCFGMfsNiLMIAso3bFZzBqG7RURSJZQyoBaaPAFXqVkIBZU4EO
	TgGFCv3kMTCfAMsDhH5vsIgsjlzQ88/65Pj2rbvCawTN+Xxu4b9q88BA2bZpa503IK2+EG5jRSG
	aIrDX4YNQXzS6oc+Zhs9rBdyVoHznBrHt2nHihW9IAO2sapovtqthOTcM89NtXvk6EOC8w==
X-Received: by 2002:a05:600c:1da1:b0:49f:ce78:3562 with SMTP id 5b1f17b1804b1-4a1d76011ffmr159510145e9.19.1792407115972;
        Mon, 19 Oct 2026 03:51:55 -0700 (PDT)
Received: from aspen.lan (aztw-33-b2-v4wan-169864-cust3247.vm26.cable.virginm.net. [92.239.204.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd9b303csm349369535e9.8.2026.10.19.03.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 03:51:55 -0700 (PDT)
Date: Mon, 19 Oct 2026 11:51:53 +0100
From: Daniel Thompson <daniel@riscstar.com>
To: Luka Panio <lukapanio@gmail.com>
Cc: lee@kernel.org, danielt@kernel.org, jingoohan1@gmail.com,
	pavel@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, deller@gmx.de, dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] backlight: Add Awinic AW99703 backlight driver
Message-ID: <atX2Sf4GJNFYq2ZY@aspen.lan>
References: <20261016162912.64581-1-lukapanio@gmail.com>
 <20261016162912.64581-3-lukapanio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261016162912.64581-3-lukapanio@gmail.com>

On Fri, Oct 16, 2026 at 06:29:12PM +0200, Luka Panio wrote:
> Add a driver for the Awinic AW99703 3-string WLED backlight controller.
>
> Register values follow the AW99703 datasheet (V1.6), the structure
> follows the aw99706 driver.

Given how much the structure follows the aw99706 driver I'd expect there
to be more code sharing between the drivers.

Cold AW99703 support be implemented by extending the existing aw99706
driver?


Daniel.
