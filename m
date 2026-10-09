Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D6193D5C0B
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 19:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791573375; cv=none; b=UHK5rwv21kNCpOOCN+ACrlzsqtQRjbIv9Hu5jFyHzS2W6RS+rHFb6sHYwlWQ7LPUIgjdZtssmldzmsx97HOX2KZofajTgX/lSP8QrMhSSa1CVHGomxwxlwWPItZ3YEgQ17Tv6un9URK3ej7h9T/2voFbpt4KvVEDw2fSXeD9vdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791573375; c=relaxed/simple;
	bh=sLOAPCgamWe5dUzceRoWlkyLurqi25tTAPBLcoKdD0w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QTtX6ZVZz08dQnOfFhJZWHLX4LCrzUzuRd2oUaGFSXVZYStnil8iK0Zs20H3dRp6Vvpo7PT34qTR+SGDzNAWEr9vcEzBwGwxJ4C2mjuvKR4n3CdgfxEprCOjEAbVFRR28pZRHZCsQc1LRBHEcGF99W8NiHq03BZgas5Tej9ppnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TJH2a/bz; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TJH2a/bz"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-33e6279a1d7so45128eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 12:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791573373; x=1792178173; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0bY4AgXSvP8hqipveJnkvyGML0b46h1xg59dJBanoB8=;
        b=TJH2a/bzgHrxYXnqA9Ues5WjFn+ctabp5gbJ0OurVR1HTZ4htP0fSsFD7mDPBniel2
         xhjsLHZvM4DFPrA5J4CtkeXl0F526CO1b4BZU2ziC7ymzhqXR7Fc+Vb+76NliwWWwWSX
         bAU2GKBEISYCPWCEBo5qVTa1pZ1cS+66VZxgGVGo9Y7ljfTqkcFYK5gVc2uhwiPY+PoT
         x+PMSogRBjxjvaIbs11EF71Qo16RPXYaqR9/nTWBlAoxPcqkEsCY9CHeMO01b+1YvBOU
         kv/3w9lAPlskNOk9W5K+8IaVjoY8pZipb/lr9c/nLQsnlVPEXR2bTi4IrzgW45fWH13X
         QCVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791573373; x=1792178173;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0bY4AgXSvP8hqipveJnkvyGML0b46h1xg59dJBanoB8=;
        b=KkXvUeVo2SNIP0nyX9xYBW9nsK4+M2T+1hrJPdSX3YAIGtwr1MLAxFNk+CrSVDaT7w
         Cyh3p0VNhFP2vdmi0LV3sb1uQvT9jJXQ2B+M+CBvFiAtOv1r4GQGv8bQw7zCwDGYjBp8
         /IzJPZMfgdVm8uM9aHfPo+6teiySKcgLN6uLoO+aalLL9XhHCwWhfhCgj0YUt1rZl52f
         jKVrCC8XEsaZbXUpVrH7BQD9r+H8JDwIF9suQi+0AiCnx9nWOUINnwGtt6GFYMm60O0+
         V3ToakMW+N+wm50CZw/kzyyO5vEVBn2CJ/QhapnkcWP67UQLOef0eVSUnPOILN6Iwf1D
         mGTQ==
X-Forwarded-Encrypted: i=1; AKwUvByEgrPXOcr9n4xqk/VGjWORZK36x1PXNFfUAw377XddwmUbVLDxqGJquJnh8OhBlBcWQ3wY28Ip1BrMAnM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJXb1yaIIM2sy3Kq2WUfv1QjjUbJyAwmn7sIAh5j7oER2aDkdx4
	RSQBUl06GtrfjJUpzJTXUmLkxogQ9PW2kRNSLngZb67Y2xin3e4dd3ds
X-Gm-Gg: AYBFou09G0zQHzlHlxQB97rXVCS+0ylRs372zyw8+Zl/Naz8Osd6uCVQ6tCN/0ih7ai
	RR6abtxGS9MdeyykQcHaipKK+wl3THHo9QHAlGTzf3SeCgc8Cx1Qs9hhrUGpnvTn7Myml3G3BJG
	jsEeal/w4XiSWljigSYt9EMyaJbTRWahy9w3v41/3P7BPzxaricC1FiX0Z26lF4CloX9GiUv4LO
	e00Lto1E45fcP5pPn9AywJFkRG2giVX/XMY6jMdcOumPWK6L7LA78AT33HaSVIxnjsvZr56SU6f
	n8Dg+shoxVwGzKR+ed3qSpczf41NiCXTqJ+Zi6RFgzq5tXHbUMrh+tbGSgQ9af9uiNzqzujiTul
	6CALus4BwzkevDacZOBIkg4HL15R3aTQkRSTIqC9T3DelEFpR/NKvPL1IGHg4qa4MA7Dc5wRloF
	3IemF4/sdx5t90PCxwvRfURU5TZnyKMp537+8bK4JS8YTLufiq40HTRTFbXtDD9sWzE8Ngau+7I
	eoiJRgQVnmD44AGwa69bXF4obw3SpPKjyEykgs7oBSZ6PBF3g==
X-Received: by 2002:a05:7301:490e:b0:354:e37d:abb2 with SMTP id 5a478bee46e88-354e37daceemr2237247eec.36.1791573373344;
        Fri, 09 Oct 2026 12:16:13 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:8725:99de:769c:1fe])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cacb61asm8116206eec.21.2026.10.09.12.16.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 12:16:12 -0700 (PDT)
Date: Fri, 9 Oct 2026 12:16:09 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: krisfur@proton.me
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: xpad - add support for Corsair Novablade Pro
Message-ID: <ask9bQQVgLhPSSRu@google.com>
References: <20261009-xpad-corsair-novablade-v1-1-e58746bef99f@proton.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009-xpad-corsair-novablade-v1-1-e58746bef99f@proton.me>

On Fri, Oct 09, 2026 at 03:47:10PM +0100, Krzysztof Furman via B4 Relay wrote:
> From: Krzysztof Furman <krisfur@proton.me>
> 
> Add device IDs for the Corsair Novablade Pro leverless fight controller
> in both wired (0x2b1f) and 2.4 GHz receiver (0x2b2b) modes, and add
> Corsair's vendor ID to the Xbox 360 vendor match list.
> 
> Outside of its PS4/PS5 modes the controller uses the Xbox 360 protocol
> (vendor-specific class, subclass 93, protocol 1) on interface 0, which
> xpad does not currently bind, so no gamepad device is created. The
> PS4/PS5 modes present a standard HID gamepad and already work with
> hid-generic.
> 
> Tested on 7.2.5 with the 2.4 GHz receiver and wired.
> 
> Assisted-by: Claude Opus 5.5
> Signed-off-by: Krzysztof Furman <krisfur@proton.me>

Applied, thank you.

-- 
Dmitry
