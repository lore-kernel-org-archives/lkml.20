Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F32412CDBE
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789346813; cv=none; b=FhR/jM1YOsOIFu1EHyzi3ZkJh+B2oaonvcUjeL96lwDipOJh3NVpFe+3u4qFHylCLH4w8jVeJL159i3CDh/vXqG5O72/b4olOtSShEzPhefF7v1nXedQpIKNsCyVh/Sj9bfZl6B6gzLa/BCJbGoEtgZ67CnaAKB4S81zKep9GG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789346813; c=relaxed/simple;
	bh=x0TsDHabCMtZ9igaz0a5B3tTczhQbKE8uCsAr74hSjc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T7byLbTP7hZKUi9iuONYtVrHo31pkdB9cqtZrE5kgwMD1cKIH+GSWWD4q5CVXFIipGuK8t1LDrdSE7ct42gh7h9q2si2fDqWN55WgvOBbhOQ1qmnyKmfVinkAOSrtuYyoU3+2y8ZIA9W5FNy52OTKzCRa4f9Y6wsNGOCEPEX0WM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dhb2LyJW; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dhb2LyJW"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cbe6295f05bso2215434a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 17:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789346811; x=1789951611; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vCjNeKfnoxaTyPgyiq7slS86hupYC9VNv/2ojC6zOHc=;
        b=dhb2LyJW1BKLGjdfAxzJuJjnLus4G/MpCzVG/KkhPhpWJreO2ThZGrPErRG6tX5XPO
         3GBXCe1lPUz/a+kOWCo4tmlKSafPq3WZk7cnxYVOZ4Q2mrVTjcGCeiuCwt4lZxTJ9O5s
         0MrTF1iyBRS9jRwVZA1lin5yZUrRUs5tEu0SqSg4qxvL03bIDagH1DewjlpXXR8CrXhQ
         i8HUZCOF6+Ugqruc2jnir0vBPup2iHozvsNE3uWi9CWlZ3JzjlyWPPGTbbTAiV8eKN0G
         gsZI+apoNXbXZpzqNWZ143Qx8zhTrv7oA8/PKJO/jTZSBcHySh9XBt+DGGYsE+miRbiK
         ES6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789346811; x=1789951611;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vCjNeKfnoxaTyPgyiq7slS86hupYC9VNv/2ojC6zOHc=;
        b=lEIUiY/ZvGlEhyxXfF2EvlUCtrrWNASabn859kxynl1rrM97sGq9sOOEEKrKZ8lrqI
         t3WuBQY7ilk4clnVwn0i3VZ7aLwvFBbrhu+1c8opzzEjQsbD5V32+Lp7qpwGL70cvBzi
         rxncj87huvNt4kaZWfk2YepraelYJilso81ASjdwU3A3rOi5aXaDCGqL47HUfTAa91ng
         V4mpyVSvsAqVixMzr8hK8ZNzo/rm5JtR0ghHWsOHO0v2kY66Bbw7GG6gf05HS21+ah1L
         i4bm0ACbksDM9QmQ4cXOU6hWKOJwaNk50odi/KE8WTBNsJxJ26lzSUVO39N5K9h+bkng
         K2gg==
X-Forwarded-Encrypted: i=1; AKwUvBwlPP94q1ZYJ+fqCH+cg2OoVQfl04uLhWBG4+DcB5CQcETYfDnujVCn+mtvmK7OpjCgNYU8BFa+kQQqBxo=@vger.kernel.org
X-Gm-Message-State: AFuF++lnmQJ1UwIhBL84HlFPUeRdT7dARFb85N0KD02nT1qV6SZKHI/K
	dIGfH9SsM1giWKYU7WahoyY1Sqgfwhvd5gpmz1HT2GhCNlZgdB9VpBau
X-Gm-Gg: AYBFou1sqnlHnw17cZp6AwIChUd7itksz8k2Bl0dikJbovWwI0mczxkaJLd1lVKsUxg
	4DJ7iNALKJZvEff+Quprd37UKMB50a1ZWkZWrJBeDYW2RTwZOdp+R6b5KRdmrqREPbNJpDRX2qE
	+2jHT/j2cD+DrTla8rSRw/YPYbmgDqLoXdY+Ts25SEIgd6dX1r/jGPWir8noczhsfvtPx6AZoe4
	w97ZHQU9lrmndH52vwFUp8ewRgyeKTqCL+8J1e0iOdx1NOOwEJWpBmOAHwGRarIAktTFe5qyhDb
	4Jmxyi53tqvilhfbfwhJA10QbNAPAQoICh/PPrUgBXkCWGh3ORnZOR7xXQs2yhtpxHMji6EfNo2
	bnxf/9TKE403MRYpWP43FJk8NS8qL55AkRt055CBMwdKHUetvgWe1Ml8FChtuBVePfwHQ8j622G
	YLYP54mlv97yqZcTvDE1ekBwQQ9XH4XbFUUgaOBkh6byL2g+vSEqpwBz97ho+ypJPEnCBnfNwhF
	CvyDkNPGcpZOiFPQe1ba9A5PmUJXtYJFvYACdK6
X-Received: by 2002:a17:90a:e7c4:b0:36b:b903:994 with SMTP id 98e67ed59e1d1-39dd54772f3mr5425760a91.4.1789346811263;
        Sun, 13 Sep 2026 17:46:51 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:a739:376c:7eb4:ea2d])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365a59b18sm20962670c88.2.2026.09.13.17.46.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 17:46:50 -0700 (PDT)
Date: Sun, 13 Sep 2026 17:46:47 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Jeremy Nyberg <slickstretch3.0@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: xpad - fix PDP Marvel Xbox 360 controller
Message-ID: <aqdD9DbgUn2VFj2w@google.com>
References: <20260910071627.236014-1-SlickStretch3.0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910071627.236014-1-SlickStretch3.0@gmail.com>

On Thu, Sep 10, 2026 at 12:16:27AM -0700, Jeremy Nyberg wrote:
> The PDP Marvel Xbox 360 controller with USB ID 0e6f:0147 is
> incorrectly classified as an Xbox One controller.
> 
> With the current XTYPE_XBOXONE classification, the controller is
> detected but produces no input, while its four player LEDs continue
> blinking indefinitely.
> 
> Classify USB ID 0e6f:0147 as an Xbox 360 controller instead.
> 
> Tested on a PDP Marvel Xbox 360 controller with USB ID 0e6f:0147.
> All inputs register correctly and the player LED indicates the
> current player.
> 
> Signed-off-by: Jeremy Nyberg <SlickStretch3.0@gmail.com>

Applied, thank you.

-- 
Dmitry
