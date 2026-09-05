Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5545372ECD
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 09:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788601053; cv=none; b=pP2YINcCCTMD4kGErCPLiZ2E3tP3/oho+sCIDFbaXxgVI0F16oqw43mIP7zAWZMQamoRdJcrW4PLFmIIGc9A2xzFroOJVueDnHNEP8zitPptlQvY5YgMaF3D+OJrWbXDohQPMvVvXApHKx8CN4Quu+S1Cze4bG3w16jvFnyNIIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788601053; c=relaxed/simple;
	bh=ezr4BNZLWb6MT7EgMXHLkLvSrE/gd0KLEILyGK6/znQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aV3UAFd5QjlBqYj2hITCAvYDe2ovLNQDXPjY/bi8trXFyfjJn5CnzLWvfSoyD1IpSF0HO9WlOa8o48OHMP+y7V54FnrFvycvbRyPkcTFHN3EE39m16HnKOSRfwOymKixauraLrxuGRZBqbEZbGfILLNFCHD47y6BN/w+aKZL5kE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hjxdkRk1; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hjxdkRk1"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cc1bcdb3c4cso1364272a12.2
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 02:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788601051; x=1789205851; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qIk+EbZ1mbotjHlbU5KOJAFSs4jlrNY2j9DG/30vshg=;
        b=hjxdkRk1rYsDF2Z2Xz7i+HMiA6qcpVdLGu4qy3MAVYnrTuTsaqy47IvcF1HJIo2pKx
         Qc9WRhZMRVRf7P6emHQ1FIqnb5iGq8gUCgk8pZfJWCoxkPoaqYEDzEGacs3+906zyTir
         tglM3DUVSgrqdYRKPMEYwztinxZPcepwRwxnEOxuKPQ+SLTWxB2GC0RzKWGdxV/gln5z
         oO1Ou6Lzem+3x0vK7i/nGiOwj07V1becodaPaomEaHd6KN74kwf7M/znWr9WkLHj+xT6
         jvve+Of2eSu8eoWy5gd1bhbEOXMtv5QxxGGHbRqnPTHk19n9IH6pQ7D7zw1DZ2UFrHGY
         43Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788601051; x=1789205851;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qIk+EbZ1mbotjHlbU5KOJAFSs4jlrNY2j9DG/30vshg=;
        b=Yx+0UWB6hAP66FMekldk6Wn0HZ/+bdiTGDTjKhEXBM2ThYzGXngh8oy4X7U9FCMiGD
         mdGID7lkqIZR99lO5/tx17R2JUqm5OtwioXqW0qGuwo0nbNEDYILb+kisVKl9eg0KX+C
         7+MeD0+CAWafBmt0Kl3XN3Wnp5KrzE25zV29/PaQZIh4f6Pvw2fQ7uRL5QOR1qFv+xzd
         rJnNbGnL3VNE0DtXRk240yMN/OlXZSMDc9c+Rk9zCxHc6GdUvIVWpM/CBi+thRXcK/WD
         BVv0ubx6891xcg7ioQ9ocsVnV2LTbIyNRADfWkmZw1DX6ERXPuVCvYseaJX1uAwC1BhL
         6a+w==
X-Forwarded-Encrypted: i=1; AKwUvByL+ooV/1er+rQOzBK1J5CzFwDPqKU8kjwSPC7STfZUdX21INhzPvqHf9dV3cdRogEAAA3bWAP9ubYAEP0=@vger.kernel.org
X-Gm-Message-State: AFuF++mtuX1Xno6A1ZzUn84fiTScSEuAJHsXPkD8mqxbdLVQD4TP8ksR
	XHcKL0BS2flhf25vZZiXB+5piYh2sHFTpba+3+7RzPKsfOaiWsBn7fXydm2a+CBAGvA=
X-Gm-Gg: AYBFou2CKbl2DnK20fm000s9DRWOwlFT38yulplqm9mvufsxjYSfOWJYBDNoccO2H32
	CuwnvRmYq7Pfe8ICN64i5ekt3n2pDgGXx4QQWzqJRdCnmf0wTNKWNzEVTNW+o3YonljinO6UMRD
	IBT/D/lncPaASuHXQ2fe1Kd6uuFiNKRAxnFUM5/d5WyXMpTn/0KUNzB+mVikUsS8hb3Xbzc6JFr
	YMB5Xwa2Dlbx8lK3z0t3O/EOUTyoVDKchl9+34JILhMO0dCGbz3osvuOOmnOJKHsmdEROvIk8BK
	NEha44CceOQhAqGGZ9qIBjU9Zi5PQqMt1fB93OG1VZuIltKn/eG3xwgsIq/IW+yYQg0Or0/618W
	yAvC0jWMBAH0RzmbyYXGWqUYeQZpP8IDbXAmjt2JSXUFM2D3UXl3ocrsCfgweZrWvH8mO3/X8UC
	wvQhI967GwXJme4qlI48vFMD+KhO5Amzh1HOkDTrlsFakBEw5skm3sZ1Y5/l3MLU5ZBnKZ49Dpq
	+QoQduKBt3S85GYdRW3hNZP9nhanw==
X-Received: by 2002:a05:6a21:3397:b0:3bf:63af:855 with SMTP id adf61e73a8af0-3da39d18db4mr19264229637.1.1788601050951;
        Sat, 05 Sep 2026 02:37:30 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:ff40:39da:76d2:2e7d])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14324356931sm18718525c88.4.2026.09.05.02.37.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 02:37:29 -0700 (PDT)
Date: Sat, 5 Sep 2026 02:37:27 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Zhian Liang <liangzhan5dev@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Subject: Re: [PATCH 1/2] Input: tca8418_keypad -  Add devm cleanup to disable
 interrupts on unload
Message-ID: <apvip-xz2GFH96uU@google.com>
References: <20260903192942.21906-1-liangzhan5dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903192942.21906-1-liangzhan5dev@gmail.com>

Hi Zhian,

On Fri, Sep 04, 2026 at 03:29:41AM +0800, Zhian Liang wrote:
> tca8418_configure() enables TCA8418 interrupts by writing the CFG
> register.  If input_register_device() fails afterwards, probe returns
> an error and devres releases the IRQ handler, but the hardware is
> left with interrupts still enabled.

What kind of issues does it cause?

Thanks.

-- 
Dmitry
