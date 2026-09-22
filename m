Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 480A84399D0
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 11:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790078399; cv=none; b=MxlD/zEyePNhNGrFjn4rYxRxsNe3CNIScA6X+7RjSRNueqfQn1IpjPLKEg3vUZ3P+pF1769w59qWMkYennpjqPcCIsihj6SPMY7Bmx9k9sICsr9tmsvO2WUPOXpHTaNZGf7Y8fXHuwLeK/VnZ5f20kq2bwYvGL2+uxRtOhh4aUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790078399; c=relaxed/simple;
	bh=A3cfgSSjM7zT5+N6SC7mBOZftfLAvGW04DIU1iyvdUY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=BCGePvpiRe1ceUhffTkvKcpBi/AmZ/s4hRMMw6l1dWGqgF2hWRJTv3GMnbWg/1zyNeBJjEeq0FM9bw010HQgZeZfq3fztBgrqAUbl0VSi2qXnzIoRw4DKFOqAx62GEcG/DViRrbGNgXPAFAKYDkVM3Nyz/1O88BEAliKgJxNc30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CWvJ/yq3; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CWvJ/yq3"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc1ceb47d53so811079a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 04:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790078398; x=1790683198; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=A3cfgSSjM7zT5+N6SC7mBOZftfLAvGW04DIU1iyvdUY=;
        b=CWvJ/yq3JP269/AApB6OIfLaCMBeiGrMGK1Y58VcJdJFdNQ+SVxgAIas0NbjFR2For
         2ZPJodbtUPBpxiCchYwos4RiVJ0BKnr7dx7sYcCmg0HXziWJwKpo2Wq6ua5/GaW7v66c
         lGVWZEXugGSEnSkpGz4MkzY8CYNTygvSNRgNJ2vJ5s+t/k5avmCgw08XghB7QvOw9C6h
         GvpzWkt66oLiDiSCvqjEAcMOGvOh5RBe5qp5UHqIE92J2aB75fo/19K6VFAy7bkcA0l3
         vXEP3IEbMB5WEmcXTyMAwfGJRasddDOJ8aK3J3FIaol+M85gEcEht+xRRZ44cOU9LDNa
         5kow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790078398; x=1790683198;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A3cfgSSjM7zT5+N6SC7mBOZftfLAvGW04DIU1iyvdUY=;
        b=pOXXryGt+mkRoEe8H+53wo5U4QkUc40ZAcQqa4LQaQIS3NNrfdMVPToKJO3jmnjKZ0
         g4oWWz+CN5LvyocKLdfJFGh02hopDKW8uZpOa5l9a91jYasp+gd0hOjOFNgg6hr2g0r/
         2x7KrG/z4HGlRI9qjEQILsGMplBFmtz6d1GzJIg5+piSDnkFADpwU5ayQTljzmbaJiV3
         JhM09U5yzTkPkqEAZb+Gec4Qaq+TSeXSSBbWDq8xUhI7LwTORJMfVKWgbMZPsnIpGaHp
         YqB7Q/JhMmiKYMU47ov2M7KTqF7MQU4J2syELiDZ7sPxVkyuLWfpUcfwMamSc6uLA56e
         NgBg==
X-Forwarded-Encrypted: i=1; AKwUvByyq0qatNulnXVU05IgLNAD/OsLw4nMr8VmlNymW6Yk/Iw/e6F1jtKuOQ7WNoG6XVUmCs/Ea1FLJiYY3Ws=@vger.kernel.org
X-Gm-Message-State: AFuF++kSyoR3jBL47D+IbPqT2liCmcoF3j7G35xByvhieGAd13+1Qn79
	QRIaEgH2uNgI6YsKw14BK8KD/QdzT9QiVX3IJuuV+f34rbP38CWvPtPE
X-Gm-Gg: AYBFou0uRA2DATQ3+T9VB0Eli98JsmAGhDb4fKPsU5cvzKzfDSmSKRf0ZCBfDKFnBqQ
	HlZnxQG5t1vhY+8X4I1fwoDz+OihVV1eEekypLHieGfYLFdZzX9bJ69xCIMnqxUqQTexBmwo+UR
	A/1n0kXmoDngWMxkrgRmQRUwgwYB8h2VMw39RDGBa+EwCVnr/jOswsVP6Oo4jLaVUBZeGI5iK4r
	567fmMsvOBA1mDiiPh34Ru0OeDIecUstt4Ol9Q0/EotqyB9C9Xj83JffyATQ7pP+qaMe8FtiE32
	CgqxkdrfQ7/gxrmb5TTwLVkx+3OrfnuxBj6geR3KaSRx+eCJ/mtltlip0VPXiW9qwFxZeFgzR2y
	G6EJJi8B2i1KwMoaNmo7Kvy2einlDDdg/FJkl9Mj3CIy/ZX9g7j/jhgTHk8UP/DTVPj9XD0sM1h
	aJ/PxGklVuHOveIlT9zWqxbUQo5ijI0ocl0rXHmT6lsXtycv/I3iaPtx1MfrJ08+fs5I/KZQ==
X-Received: by 2002:a17:90a:d008:b0:3a0:797b:443e with SMTP id 98e67ed59e1d1-3a0797b4639mr38937a91.3.1790078397173;
        Tue, 22 Sep 2026 04:59:57 -0700 (PDT)
Received: from [127.0.1.1] ([240e:b8f:977f:f400:ec2a:b15e:fef8:70a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a06e5cdb48sm3050144a91.17.2026.09.22.04.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 04:59:56 -0700 (PDT)
From: Liang Haowen <nbg2974@gmail.com>
To: Ilpo =?utf-8?q?J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Armin Wolf <W_Armin@gmx.de>, Denis Benato <denis.benato@linux.dev>,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 Hans de Goede <hansg@kernel.org>, Derek J. Clark <derekjohn.clark@gmail.com>
Subject: Re: Placement of ASUS Aura and platform/x86 ASUS files relocation
Date: Tue, 22 Sep 2026 11:59:51 -0000
Message-Id: <202609221855.ReplyIlpo.lhw@gmail.com>
In-Reply-To: <7b4c6859-aed8-6117-5d80-1ad1f1470260@linux.intel.com>
References: <0ca263c3-7885-4a5c-bfe5-0e8e4d189666@linux.dev>
 <e0882d84-f5ea-44a8-881f-4095129e4d2d@gmx.de>
 <c26da468-9a5a-46c1-8dbd-1784b69b3c73@linux.dev>
 <8e8168cd-4f6b-41e0-81c5-5d7b07b1df13@gmx.de>
 <7b4c6859-aed8-6117-5d80-1ad1f1470260@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Good to have this settled, thanks.

For completeness from the Arion side: the ROG STRIX Arion enclosure
driver is unaffected by this. It is a USB mass-storage device with no
WMI and no ACPI platform device, and the LED part is going through
drivers/leds per Armin's earlier suggestion (an RFC is on linux-leds
now). The piece of Denis' shared Aura interface work that matters
here is the SCSI transport helper our driver would consume, which
stays under drivers/scsi; only a WMI-based shared interface layer
would land under drivers/platform/wmi/asus/ per your mail. So
nothing Arion-related should end up under platform/asus/.
