Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792852273;
	b=RHDKRTriTQq3R0k0RGNpp298YKFE+xftog2CxH+Zxyy2SFsiJ4uUVBU3cHYhNiEE+t0r
	 aPqw7pYkVa/VblcMc889FsNxB6QZoEqYuia5kMfRdDFVx1XCrndE0pNwz76lNZ6Zaksft
	 kUB0bqDGBmjJNIOy++lOLbiSbdXCWN17TX0F52Ka/UJ4AJvntRTnxtomlOrLlY8ECT+uc
	 lhNidZsC87p7CbVQRyKaHWCA6XrDLnuvsKyMNzKnt5O/cEALZ6SL/OZ6rP+ALVOzdJyk5
	 I9DlJXCqZesikrlX101z37cM4Ya20L5ei+0E5PTh+Fs/VOEMZISk0a+gFAnZblPfdvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792852273;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=7zPquDCtZyzOA5PY0kmGl8Aq5WV/QI7GoaYVVezsWQc=;
	b=n4ARreXxcdayW2Gm/SWLmM0/IBcjBHeZfLFb7A66tpYOZt3N3dwBl2xRYZDXN0vQfWKU
	 99i2PShzXmUqgBZoxsSIod1HB+TtBHnMxp13H7/3fAJGxiC/QwGSVX05hdIAZaNGOcscT
	 B4RqT+N/CD2aHtkL6SdUCisZ4+C7tTG6MOXAUjoQyQauQ39eRfG4tpjtXcQxLNBA+iKY/
	 aHtt5S7L+DfAZY5RYDAlEFGtwzk7BahUSe9RXi5FbJOoD31ZEH+Up/hAT3of9kXl8wDob
	 T34Cz+WqSOfV1+/GSa8Um1+10dLS89xMc7uh0wQa+KIGFBpy68/T5wpIjugKLvZ93kA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XfUjjjhg;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D322C606A31D
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 14:31:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D322C606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XfUjjjhg
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so2404705e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 07:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792852271; x=1793457071; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7zPquDCtZyzOA5PY0kmGl8Aq5WV/QI7GoaYVVezsWQc=;
        b=XfUjjjhgRU3xKHOnn3z8d46bbr73JjAC8ug7xqkXxnNxWiyIHSbEfMKKkXKSXHBBTu
         aRh8PW0+GS4VIeLumDDnmmdR23GxI6OYLl01+SOZlj8bCUzG92sqfdTGJ5pWUbYaJ/zY
         y2mOBofxl26k90BbgSlGM6l5RU0cXFFDAU5685pIDuam9ny0mG10H8yO29Yj5hvvewIb
         K94fwYOTZyiI7Qbnik8/rRtXkV/TDCRVYkLrNyY+jmbiUt3GWQ0nPKeujWv9WwM9EKJu
         sOqpl0HVfT9qrjAJYg6k+jqIJ/H5L//nEcYrXn6YR5oGdKjsUKD7r5WWkU2jYczQoY/f
         s/8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792852271; x=1793457071;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7zPquDCtZyzOA5PY0kmGl8Aq5WV/QI7GoaYVVezsWQc=;
        b=xbWsvnYoFAKKtUASm93gr/DQniWV+f5qrqPib9U1A19iCaKX3s+WRRIWZqQuVXjy8W
         UO/foM+Vp50ZItIC7zTTxE9RS8lLx40IkXcSS6CAlOW52dzzBONOZfPyW7rXJodEokYh
         0N9B0JXMqLLrPTsm/x8XtSNWJko3Wtz2XA2RinlpOKEo5uBqX5d/mjwFota6yKceZmL3
         4cY4rpVYPRbV5aBVMhIq+dJxVZ6CAHgiRFzbcEIi54BkuPZiWD1YWHdJ8msCF+jLXl/v
         NvzNVH03sqIegFweatcYEOcCZ8yWo5OZdld4pjnwk5AqIqc/9C92Ln7Wx9cmvKjMSX50
         yn8Q==
X-Forwarded-Encrypted: i=1; AKwUvBwr4UL/w6Uewevxw5fExljx98SbgV8Ead/rLInABFP/kxi8EZwiBfz29pSnBvr+jnsL4lWDli+g6Qj5t2Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYL70xHFuKjK66wmoC+ScX6SRHjLIVICXQ3Pf+K2S4A1JYQCqyd5
	JiQ78i2FBXpKtUzZcAnxhFrcuCCjyQrpLQG/s/QVQbraeHHuzur5SzpCRlUUOA==
X-Gm-Gg: AYBFou0vm14xKNn1KDOdzf7kUXbO3wUMRUfktCKl5ZaznfhmNtU5zkmUXo3W6DcNbIv
	tqMsqXeniciIJjx1uPOZgjlkFYSDJ6enRuM7FHEdzU9LL8s6kVstLcOH5VBShVSNP2yqhVSzRHq
	42Cps70QqicOcBRfaZVfTN2WbQEO/K/mHPR2hCMbgBHCX+zPDEM9ANWIu+FLVetDbm9cM5hR0+Q
	l53dZYY8IMc4g6tKNmn1LCjRN+W7AmuQDw2K4LEz4afahASxmajtLJWRAKABhFtXLqMsAYCy/9d
	m2yFmj3uq4oRaq8ETuVK9QjsSLOmaIRDQY+5Guo3NyiQY6cM3pIrOgADs/cxpLJK4ajknsNN6XK
	dzEF3SZOWMj7u2l/QDJJ4vFyDDWP4KkJa33dRLuEO14EEzFi33FdO9jYt+3D16aI1bv+l1SF1QD
	/KFTiVY+zQcVqn3whyidR8USAdjjGGAJbO4qImTOU5nreqol8EHqcRAuI5o86BtK0Molcs+4tSs
	SykBp9/v8kWjCBBpVk/tVyISmCzEs1WDmh1hk+aZgktHixFYmogu+LFoWHGDh5HNo/kMlHspaoH
	jHlBRLUQvONh0owXisSKSvj77C4wBw==
X-Received: by 2002:a05:600c:4f4f:b0:4a3:5a42:b29c with SMTP id 5b1f17b1804b1-4a35acbc00bmr34586575e9.26.1792852270605;
        Sat, 24 Oct 2026 07:31:10 -0700 (PDT)
Received: from [192.168.1.2] ([31.176.165.29])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a2d6f6fsm56502995e9.12.2026.10.24.07.31.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Oct 2026 07:31:10 -0700 (PDT)
Message-ID: <b441d4fc-e0a8-4952-bb7e-c3416a040daf@gmail.com>
Date: Sat, 24 Oct 2026 16:31:09 +0200
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] mac80211: hide tracepoint definition
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261017155509.128114-1-omer.e.idrissi@gmail.com>
Content-Language: en-US
From: Omer El Idrissi <omer.e.idrissi@gmail.com>
In-Reply-To: <20261017155509.128114-1-omer.e.idrissi@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

ping
