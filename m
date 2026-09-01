Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A978386C20
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 12:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788266389; cv=none; b=pUZ0JaD08wifNLPI8fMcXsFm1RzLOAIfvnJ1z//NYpqXbyNS9sxwq5bi5SvyYQ+vTMVvODuRfRgSyWaGtPhxuonPh9PQNd1ZSOLvO+CBu+O64UzZnS4WJI5Dtf2Cf+K43LtjL3TbxO7ge3jfXzZ6h67aRkgWOOEQeJ1ow8o0Fls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788266389; c=relaxed/simple;
	bh=R6OTu3ZLedqJvq4H6JK1yo9FBxwZF+raP0p8sBoRneM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l1gpBQC8NpsZlyVNFU3O/Rbf4dlrmmoyOmiWXQsWzAeXjx1lknOBlPQCYMXA4nNgaPYVXvHR5HP6U+rOmvi7kT2F0pX+hDnOpVagPjr9uW3U4X3fv76oopCxfNJvr9EcdZOtM3D47KE4U7mFhHhOdimT4BNCywNJuYcxC6pn1gY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=S3E2e7Ry; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="S3E2e7Ry"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-499ac87c92bso9114685e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 05:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1788266386; x=1788871186; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=U7Q7YynkXMl4i7Q6YSpnO6DndhGuxWYKw0DWUs4lEJo=;
        b=S3E2e7RyTZy/1VUayaRy2ZjaFnk9wcL6oMz6gSI35YQHblI8j9HWX3ABRCA9H0mtsJ
         l4FHZTW1SMQJzv4EIhWx2ciWSNnWwgN2yN00GxSd9uoA0jErPN91sTt+dM+Ox711ilrL
         v/wSjFIV3L4Jn0mnIBLe2LpWtGX/MIFzL9+pzJFD//h3NV0ECJvY81m1ZpVstVaRU9Wk
         iVjowRJmrnIGaaUrQil0WWSoHQEi/seTzw0qNcerhq94avmXW7+No8bRPGQ98xrDWIla
         tF1TTiK5xyiwwGXXNTRQZ5JWcOJ1TqVLmnqIK2LT509imHpoOTahDXuEY/pYZjy69IdD
         JWTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788266386; x=1788871186;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U7Q7YynkXMl4i7Q6YSpnO6DndhGuxWYKw0DWUs4lEJo=;
        b=BXnEGUXtgs5K1mO55Ol+1043VmmRib2oqX3oiSp+1wHVcAhD5t7aww9auiTQJtaj0N
         FQL+S4rXqN9ygiO6zlRXGhrjjBMSZ4oBIqpEZbdVtZY3ViluzQRqo2Wx8hzern+D4lfu
         76vmkfBb2cowsmkeppZpfXhmRADA2RRSryvh6DFOFoyQj0cnObTN5qDHK1fE0WhVZQtR
         7lN9iIHuG9pYt+NihBzwGdsR+kmVoER+kjXBCQ+lOeodDIT6Krjs0ViGFlht2L9/nc/M
         x/yjg5oZHtzQvKoYJ4RVNfrBPIFv8MBEHu71raa29bY/Ab5G/07Sk8+EMciWvoPMeamc
         5I7Q==
X-Forwarded-Encrypted: i=1; AHgh+Rp6WdFp9AWRq8E4H2BBEL7NDTz6LUHNwT0EAYpDMNWMirGDV74wS7lEgFU6a9Ak8sxuobKlqbEMXrGK9tA=@vger.kernel.org
X-Gm-Message-State: AFuF++mMOo3zILN3Jrcsn1iP5PsT8boZkzWxlVoRFbRqTeJ9QRkNVWG0
	LgU+OYP+tC1rD+Ft7c+7SPrDOBtghISjlNzxQPaTlB358KeIJc/RrDU=
X-Gm-Gg: AR+sD12MRxDiaO5frGkhtD8ILI3CzNGmvyBmp8tWc5qCMSLP5/1bkydKDoIEli74i+l
	fgTH46DN5ucBc+KvLMTizjx5BaSnIHwdqWSg3uc7uymWMizQ0uS6Gdqagxzp+DBboUZw+s17Bzl
	I0aiCFaRxEF22EMhvtZ8yE0EuvGDGv2thjno6tbQkrkANktCxVIlndO88Go6vEZrJ1bgSTHRJ6N
	PeDvu2t5cS+gWCDO/6F6hfLAs5Fwu+GszUBVG3fVKlm4qO3yQaY3wR76UzMoUqqiBepSD8jNYIU
	nX54mXHvYiNI57RyWjwN7EFEWMc5RE0wV0rYX9ASyPaUab7vB1/HPLkeyqiNyK4ggjEDSmV3TEI
	U5odBqpGmX8x4Q+gG8U4F3kTj7KkWuWQtCwBN7rP3XNLhanRgzfo6geP0C4h4lE+km/0pCMm40c
	o9ubNecyexOvJR+bdwjJV9VnKEQFPxWPE7ISeya+77wkqxiPkKAbvEbnNdJWg7jNdDR6DTeQwV8
	SWMHJ/6NLKJTA/XS+eDi+tFBIu9+qpGOIdnIBTVf2vstyQ3pKk=
X-Received: by 2002:a05:600c:4fcb:b0:499:db27:7b1 with SMTP id 5b1f17b1804b1-49b91c62d9bmr508038395e9.15.1788266385542;
        Tue, 01 Sep 2026 05:39:45 -0700 (PDT)
Received: from [192.168.1.3] (p5b2ac7f5.dip0.t-ipconnect.de. [91.42.199.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442d3b86dsm4584243f8f.11.2026.09.01.05.39.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 05:39:45 -0700 (PDT)
Message-ID: <e2926b70-c2cb-4a7b-a02e-b027f731b968@googlemail.com>
Date: Tue, 1 Sep 2026 14:39:44 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH 7.2 00/71] 7.2.3-rc1 review
Content-Language: de-DE
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com
References: <20260831133359.055927882@linuxfoundation.org>
From: Peter Schneider <pschneider1968@googlemail.com>
In-Reply-To: <20260831133359.055927882@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 31.08.2026 um 15:33 schrieb Greg Kroah-Hartman:
> This is the start of the stable review cycle for the 7.2.3 release.
> There are 71 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.

Builds, boots and works on my 2-socket Ivy Bridge Xeon E5-2697 v2 server. No dmesg oddities or regressions found.

Tested-by: Peter Schneider <pschneider1968@googlemail.com>


Beste Grüße,
Peter Schneider

-- 
Climb the mountain not to plant your flag, but to embrace the challenge,
enjoy the air and behold the view. Climb it so you can see the world,
not so the world can see you.                    -- David McCullough Jr.

OpenPGP:  0xA3828BD796CCE11A8CADE8866E3A92C92C3FF244
Download: https://www.peters-netzplatz.de/download/pschneider1968_pub.asc
https://keys.mailvelope.com/pks/lookup?op=get&search=pschneider1968@googlemail.com
https://keys.mailvelope.com/pks/lookup?op=get&search=pschneider1968@gmail.com
