Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92BE23A75B1
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 21:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788385144; cv=none; b=FGynp/rdDsLrZOQc+luIddWVonDCNLG4LfurfkUEfQNHpGzsGsZVQwUS1bK2sJlmsxZ2cxTjsZmCe+B1jHs2/TdCqllURDjGstsY4UezdC3cV7Sq9YPs6FH8Avi4MdaN1iCzOTodba1BS+WVx5bSHVsSV7Zoe/9ta/HjrVvqaM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788385144; c=relaxed/simple;
	bh=VCeTB6DA6xhpX0r0q0Xnripoc1RfKaEs1YtzFpOgihQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HpRvsK2jj3KMpBDtGd3EhSK4Ie6zNuZf6pe4TVqWuRtFrNRc0W7BNgjby4zjJlhFuCkIN4s1Ub5AJTr5BfxigdrfjXv03+PK08rvYWSB1EgjO1Epx2jPmsbnsjR1off7EUMFLxR0yym6WqY/WJ25di62bgjoooDa0mkXOpW2RLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E4KlZuEZ; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E4KlZuEZ"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3964e480f76so2181501a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 14:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788385134; x=1788989934; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=51ibZFOFagQ+E9ZIDyF6lkMloDUoQoVNjs4ypi5okac=;
        b=E4KlZuEZkT1KfbSLisjkwWi7JEyEk+K4nuog4aSXS81zzVZ0fDTb70pmhzTV16XguG
         u8gJQ3SK+eRAgtdnPUgsTRLSbfBFcASfF2WnZHNySEc+LXmhLsxEobCQnlraPc3a4Jkm
         pFl+bL+ET0fnD9U32EYde24Lc4HAu+YNaBzhpBJCcB+Z4TfeZYW1JV+GJYUhu76blfuX
         KFwzMhsczPUeXMy0OxpbreRsW3y9gjVbsaaRevYo41cjC5ypnWVBToEQA90PDKAcjsXX
         CcvNIaLG8RJ/de483JaYnQbEYPtiNDs2HMWPzKHQgXHbbDO8Xin16/4+4jjMRJhRXPsm
         4zcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788385134; x=1788989934;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=51ibZFOFagQ+E9ZIDyF6lkMloDUoQoVNjs4ypi5okac=;
        b=G3b2m2V0nXezg0Yu6OQ+1AXs+1mUaKwFm4XeK3uvLmmvS90EDfy0Ry+YSzvwlMnDXK
         0AJiiZd7sH848TQ/IID3udQluvyVGkRckr6oOoNHNN7TsMZsmu1blh4xZ59uf97uhKF0
         klVfpX85ZO74iGNkobw+YN3gSekaS2HWepP5eY7zzwmJB8e3Rk9jixOXfm6tCTlVcDVe
         5vJSdGBsoOYxmE2cdP820YPPZtpLtn7ND7q6zTuWXGzMjBju4e2Ol6aDvGuP3JfueWNs
         XfDnyFDDdOEe2StulhJSpEE2ned8+qfNn/sX49EALZzCyMWV/JCH6xX52vLJaHCAls63
         4wYA==
X-Forwarded-Encrypted: i=1; AKwUvBzGsAkj2wbMEP+utVYQU1W0CbdFXg0ohQoqLixnYF8TlW12dybbXXPNBPT6znYS1fINIMgdLCSnpAsVNcc=@vger.kernel.org
X-Gm-Message-State: AFuF++nrm3z7FlaJ2VORODOJek8bVCU9VBU86DXKd4MEgFAuyW6WXpF6
	D70TuZ9hkrPUIMRfe60ooggshnaqEh3KaNp2rejCGNoZkEmRJrqAMgBq
X-Gm-Gg: AYBFou1DyQJ6f9js7GcInMgkeAY56uHaLcKbSYxBc7D1qQXVa9VTcRTFTZ9ZrLQzMXS
	o3QugIt8d0pcvV8dAqk3RLIDIwFghprg5MRoLZp3f6R2rER+mr2b5u+r/0/WFs6t0v0JWTYIuqm
	/r1trcOH9kchXDbkgPr5H+M5djvfMtt8W66NMKn0eNUH26zbp03wS3PukGCqBl0czI+G+dw09cG
	OqBAkRE5vq//wXF+97im+0bTYtaPOn417xIP7Jg7fGEORS7HtqqhPI3T4RaxiVF5QwmXaFA6+QA
	BJbYTmzrbKgUAMUFSsjEaZQv6IbZymq/7ZT2Ax2Jqo7f+SvpXoCs2gn7VFHKsvs1DR97KBGE+F4
	MUdwjVxeTuGI2WhcpTn1JbxCGmeMDrp4mQDsbGpRY64Jpm8KFMVm29AY2OSItEPVNCEWdOhVWWH
	FJsO+luistfsDqTxpPuCKh9izqx4W3VGHS45OHr/ZgxkyAsSn5ZOKGEFUdVMP6QjepBSsYZGn+i
	g==
X-Received: by 2002:a17:90b:4fc5:b0:38e:49c0:75a7 with SMTP id 98e67ed59e1d1-39aedfe18c0mr12990696a91.8.1788385133676;
        Wed, 02 Sep 2026 14:38:53 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b0875e5e9sm1358930a91.14.2026.09.02.14.38.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 14:38:53 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 2 Sep 2026 14:38:52 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Sanman Pradhan <psanman@juniper.net>
Subject: Re: [PATCH 2/2] hwmon: (pmbus/tps53679) Add support for TPS53622 and
 TPS53659
Message-ID: <56544fb0-55af-4e1e-83a6-73107bc152ab@roeck-us.net>
References: <20260901211129.360792-1-sanman.pradhan@hpe.com>
 <20260901211129.360792-3-sanman.pradhan@hpe.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901211129.360792-3-sanman.pradhan@hpe.com>

On Tue, Sep 01, 2026 at 09:11:53PM +0000, Pradhan, Sanman wrote:
> From: Sanman Pradhan <psanman@juniper.net>
> 
> TPS53622 and TPS53659 are dual-channel D-CAP+ step-down controllers that
> use the VID VOUT format and VOUT_MODE identification like the existing
> TPS53679/TPS53688, so they reuse tps53679_identify().
> 
> Shorten the Kconfig prompt to the family name and list the supported
> chips in the help text instead; this also adds TPS53685, which is already
> supported by the driver but was missing from the list. Update the driver
> documentation, including the per-attribute lists, and fix an existing
> "TPS53588" typo (should be TPS53688) in those lists.
> 
> Signed-off-by: Sanman Pradhan <psanman@juniper.net>

Applied.

Thanks,
Guenter
