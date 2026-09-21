Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD074B487D
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 16:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790008807; cv=none; b=naWFYmdCyQaITraT9ElVrzASmDPgMdGMfblqrpAD9v9eO+3Nb9ifm80ICRhflLWK3qXOxudbCXzQdTFW3PhwX5H0+9ygYTlLG/yMNWeERM1jZRuPkmihWP9Rlmhag0RCgnAbBSgYVXSdj3kP+XA7hPOwN2ds/mzHJgmcWeClY6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790008807; c=relaxed/simple;
	bh=XCwOJrMJoxxz4JVKyaDvRNRGwW7+lwqfH0ZgZljnW2M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T7AecGQ7dVVL1/+wwLRf0+AYmW2canD41ocdF74+KhOEHv/JTvKVbN4yL9nGbJmNNYwMo4reJyt1ALZLDehaL9/XTX687CFgDCBYHoB2Q6IJPGCn4UWWzfc/Bk9tGyQfqTrbPMzGnVfEwnEqNc3SSG4FEz/FL6riy4nuE+bneuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EMGHvcQX; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EMGHvcQX"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cea50db3so1936259a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790008805; x=1790613605; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0H4vlgkEZqik2DP4kSrSQqWycTFLemuL2Tj2cZSeHW4=;
        b=EMGHvcQXgOyUzw7okC+u+bwOw9n4YtdlBcxxDDP9KQJsiewEec4rT8JZEwhx/nbsyb
         dKBIRMA4FQcosgxyZF5ZoT30j5VXI2pyHR0v0hTPkoGlaC0c0BCEyz5IVWN4veaV/6BI
         slzGSslzKiyCQsv4ZHP3s2qUf1oYMb1D6049zsXlrHlNJul08V2KZLa4kQwIIIIIJHGS
         sTWZczqz7ehEwsX/+eLVwNJB4cNbS1lhfoidnBfPG0QmIIKWMibbEa1400olkca5+tB9
         iTTSCCxiVeFKi5Va+v4d4doPHoqOsd0MTCBdK0XOyHNpXny9r3c5gLjGEGvv2ywys5k6
         rPTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790008805; x=1790613605;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0H4vlgkEZqik2DP4kSrSQqWycTFLemuL2Tj2cZSeHW4=;
        b=dyJosYdRAjA1pkpVcJTAHKXQl2duSCSIxHXn8O8A2GoPnOX8m5ca7HAFtJ1pwjZW5Z
         5N8N5zw1e6CR+2af/A7KFCKO5h3tkkeAwcz18g9X1tjo4mdwcyQWbqfKy7nsHM0ACmzk
         q0FCqm2weNjBZmor+QaMP6qw2HECKudkp73LQAOBkGGp+ke2b4PUv7X1AZUMB//1pZ43
         Vp73OF1giFDycPcad6sz1kiInn1MgzqY/KzenxSFx2AFA7jfZu9EJAYxPaQRvvwjUpE/
         ySvkKx4r5YGZ3GI1/u6lBVREDLQH2hdOnVT2wa09QtIaokYWIQ8xgZLB9u97Z2BnGO0X
         Be/w==
X-Forwarded-Encrypted: i=1; AKwUvByveNBoloLWJB1m35phMhJV/Xu2YH5t4bXCGs9dZYHdfVmyPJIZ1thK9S0g0p8jjvK72F9blvXzX9eehro=@vger.kernel.org
X-Gm-Message-State: AFuF++nBQTLKDHg44GCzDkg+CojWGOBiuJPqJWtPb5UfhpF8Pl7bmpWv
	vF/EQVhryyjsPKmua4Swucny7+mCTf5CxnMkFjy0v+EnH86gvTw4u/LO
X-Gm-Gg: AYBFou1SCLqP5/UHzbbzHB9k9tbnOP903X325GFvXE1qn/B0YaLtolNimh34otq1aFs
	qeLtQ2I5e7N7lWwKmteXSq/I2oCllt34H0oS6w4GqwKzy0Uauvf0VCYSSYTIRtpTnqgn6+yQLOy
	pbjWMwOO6FMcEVPV42x4Q43n/vEfMKvN90PzirvpuOlAngepU2DV02dQVphbkSUUUvbYTOq/oOv
	dsR1HBBUhYAFzvtF8Hu+XS+VCIzmoXsc5VERbMm8e3Eg1pD21Pu798/7garnIP6loDzN3A02b8C
	/g/kBP5uPaw62FQvpxeigfNv594wUaeOTB2dPO2nZ4udK7yMusE0SSxlwl6ELVsuylAweZ6LyN3
	ky0TmBTkvAGdVuuYtZD8Cf/jMcXhmlDPqowP1KBcMG+mwg3RgeJGOoNYp93XNHlqDtpQskIy+cd
	eVvMBPLrOoCyM+5FFhqBRe0fxGFjLqJvGDfZ6eHgcX6l7eSvf2UmcqO3ZTJycwE1APSp59Hc1HL
	EAS5YgMe9PZ7moItWBYAvszS5FILlWdwPlaYwaF
X-Received: by 2002:a05:6a20:7f8a:b0:3d2:89db:1688 with SMTP id adf61e73a8af0-3dd8c3d3adcmr17913842637.2.1790008804824;
        Mon, 21 Sep 2026 09:40:04 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:e1a7:4f7b:11d4:34fa])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c331433besm32993952eec.16.2026.09.21.09.40.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 09:40:04 -0700 (PDT)
Date: Mon, 21 Sep 2026 09:40:00 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Zhang Heng <zhangheng@kylinos.cn>
Cc: cryolitia.pukngae@linux.dev, kees+treewide@kernel.org, 
	DongLin_Lyu@outlook.com, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: atkbd - rate-limit unknown key warnings
Message-ID: <arFZdtgmZXcK9k1V@google.com>
References: <20260921131934.677541-1-zhangheng@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921131934.677541-1-zhangheng@kylinos.cn>

Hi Zhang,

On Mon, Sep 21, 2026 at 09:19:34PM +0800, Zhang Heng wrote:
> Replace dev_warn() with dev_warn_ratelimited() for unmapped scancode
> warnings, matching the existing rate-limited handling of spurious
> ACK/NAK events in the same function. 

I do not think this is needed. Unlike spurious NAK/ACKs pressing keys
are initiated by a person and events are naturally rate-limited.

The solution is to indeed map the key to do nothing:

	KEYBOARD_KEY_xx=unknown

Userspace ignores KEY_UNKNOWN events and there are no dmesg logs either.

Thanks.

-- 
Dmitry
