Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793089775;
	b=RwkaErPXmCP9dpOK8nwrOJ9yqrpAqTz7Va/idlV/v3EuWykghyHOkwhD6tKiYp+rIb+R
	 90D0Ke3N7kt6mrrCTiLjaLXW6MkILrHlueq5Rs+M3L940NIa0BZhWfuF6hw4KwmMg00Vt
	 9UtSqvzaJtgPUcj8E4fEa+5YjDIdlEW/UfvWQ4sHeJd8wlDsG/vzOU3E+704U8akqAswK
	 YUS/f+7xj40wXmp34vfnQtWq/DiOYeHYwlkU6JmY9E4O2SGZIwnzdc/ycMsKtrWaNlhNS
	 dVdmKmGDxsMRygG+2E5yEK6ZqZf0Z6qglAaqEGbm4h+kr0KMpe/xIHABFAvxAghvAaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793089775;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MGzHH13ZWFaAze8jomr5kn6NEKQkF5IKK+VbX0oc3KM=;
	b=uRIlsa5DOQbxw74X85670uJOUOQyHFp9htkW/OP+Tt8TfTpvrNgd7SM1MduO6ueK1Akg
	 9GMeIQo06FxFOMbK9ewyca1C5BQp0QBn+5mHb005oH94zmPVyVHCbKKFsF+wGuOaEEWR5
	 q7i9+VDch/GNotceIuwpbHUgvjo31tQc6oiaBD9AyyL8VJSZlT8vnD5P31hOw5uJCJ9vw
	 zFRtdoUeW9Y861AYiUIB7WCbmePO5FBrWW6e9X90cNBqNp2KrPp6Nq1OYTjdcXYszxHIb
	 rXxmFnpq4t7iq02UV3Qdr4QG7yLwxYUOJhzVSiiDVLbyxRIAvpYEotdic0K/VzJSl1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UfpuVEy5;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C00B9606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 08:29:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C00B9606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UfpuVEy5
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-181516de561so537805c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 01:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793089774; x=1793694574; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MGzHH13ZWFaAze8jomr5kn6NEKQkF5IKK+VbX0oc3KM=;
        b=UfpuVEy5veyu7vgwxb5ILNxC7fDxcHBEy9NAS0QZtpUfc9NKoNx9N92KGbm8ljPN5p
         6B4ZWPtqtXoCo4As62q9vysEjY1yGXImUkkdvr0rrv649HBeJLo5zIj/BQoDNws3rYwV
         kWGL6ZVM/cJN5Eyywyvsy2jQAwMqHdw4yV6r+xsST+4TLBkZTgU3GfFkJKgxumU3P8yQ
         2pdteBDfSYWRmIyfHkgdGY5MX+fKQ4/LvsGuN5l9iYg7iy9N9jcf4iRqT/iyx7WVoroJ
         ZRdJpYpMGgHIR7+pt8EMnM4UpfnFgcgwrJeHS7hUJaISQmYniNvrK4MZpzG6EYiiZxJ5
         Ce+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793089774; x=1793694574;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MGzHH13ZWFaAze8jomr5kn6NEKQkF5IKK+VbX0oc3KM=;
        b=srSOsxQHr2U1IKsEXhUS5arOBY6oJ874Yw9qqgWKYMtbnRDTCRZzPGKdtcxLhXGzAY
         rUnPQ/DZoZWLo446zmfr3kKCbQNAnjaHq2Fo27XeamddMY7bbyM4qy7yn5jivUh0UfOv
         DjUM1huFGaaUUMLefar2lJandydDKypm7eO+0WnkgylQprjyk6k1HJjB1ZyXrMC6UL41
         NV4RXj/HOuzB+UCs4CcHYZGMTrjMyeaEGlIt/m4tk4IWNC67pWpptJRh27ywD7ZJVQIn
         VDWIHnGhBlcjTMAczkFGYpH/ZTyKk60U50cD6r7DOl5mDuj1KUupxeHfgr45Mu2EYBXD
         ixww==
X-Forwarded-Encrypted: i=1; AKwUvBxYO/dRYEJncloP6lgX0cKg7QaUKtBQXYnFeSeKxuGsk08RXlMwOvCxMhQCQTX2L9HuQm7u7+sl77IgayQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKJddJOjVXqOSXgo7CQ7ejDh7f21Vo2qOHo2AkDMuIkb9sXwL09
	VTNox9rxVD9xGcnAFjeuQbXEkL+PhhrcxjsU+UOWJ+4nJW16tAm90AA=
X-Gm-Gg: AYBFou3HwgyJ0NOJrVd17C7i32uYVQ585q2WLZ0V7f5+ikDEfz5izcg74eGRa0xFjIj
	WWi8gDBmPv4CXAWL/drkreFAWdrgcqzjzqHlhTl+3vrMbwrwfwsDj3snYuKjamiKLzq/sGfZxtK
	3YUoZ6cGL0GV435gOFKjgFYZXCqR10qzMrXFK88Sxabh3g1ieArS0Qyo91dGaA7yjFS6noz3j2j
	sb5VzIogiO3QMiLnpL636EZ1RSwcz83cbpElC4jM87rlL19C1Pfa5qe0EdsH9FybQSI8ESFYdmr
	tfZqxSba29kHfw9iZ8+KqBh5Jcc+2+oAvO/SVpvepiTnyjkCMyrpV0TG8+LD69MRKRtpQhWoqj9
	Bhdk1wGd+Sj2hMUzWhOWOmK2bDkst8V/+ENiA7lmwcaD6GP1EXYO/xcpizpywpObqDYnPvQCx9+
	rp0YYQ6byQkJfC7j+uD3K2J5LXCGw0W8iLk9rFJa9wnlywsVzpsa60Aro13ooirS64Xt/js+cnq
	mgrFMDl7IU4jHhVPWcRmZjxH4mhS4u5MXHx+80PCc9LMdMbMeNYZ3W+GosOxP9I7qI2sV+5N6KV
	SvSqd9yr6Vqd
X-Received: by 2002:a05:7022:eb51:10b0:144:eb3f:563a with SMTP id a92af1059eb24-1a3c84c3867mr2805885c88.15.1793089773456;
        Tue, 27 Oct 2026 01:29:33 -0700 (PDT)
Received: from at-Standard-PC-Q35-ICH9-2009 ([27.60.26.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8db7b23sm43895151eec.19.2026.10.27.01.29.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 01:29:32 -0700 (PDT)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: alexdeucher@gmail.com
Cc: airlied@gmail.com,
	alexander.deucher@amd.com,
	amd-gfx@lists.freedesktop.org,
	atharvatiwarilinuxdev@gmail.com,
	bhelgaas@google.com,
	bp@alien8.de,
	christian.koenig@amd.com,
	dave.hansen@linux.intel.com,
	dev@deq.rocks,
	dri-devel@lists.freedesktop.org,
	hansg@kernel.org,
	harry.wentland@amd.com,
	hpa@zytor.com,
	ilpo.jarvinen@linux.intel.com,
	kenneth.feng@amd.com,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	mingo@redhat.com,
	platform-driver-x86@vger.kernel.org,
	simona@ffwll.ch,
	siqueira@igalia.com,
	sunpeng.li@amd.com,
	tglx@kernel.org,
	x86@kernel.org
Subject: Re: [PATCH 10/13] drm/amdgpu: Catch register access while GMUX keeps the GPU off
Date: Tue, 27 Oct 2026 04:29:13 -0400
Message-ID: <20261027082913.8002-1-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <CADnq5_O2tEUHOcbiKL8c4UHpy3AmOWtmM7A8o3jP2qLwkx2jUQ@mail.gmail.com>
References: <CADnq5_O2tEUHOcbiKL8c4UHpy3AmOWtmM7A8o3jP2qLwkx2jUQ@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> You can drop this.  Nothing about this is GMUX specific.

I agree, but there needs to be another variable. Using pm_runtime_suspended
or using any other pm function will not work, as amdgpu_pmops_runtime_resume
also requires hardware access and even though hardware is accessable by then
pm core will show that its runtime suspended.

