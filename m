Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC8C83ECBF5
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 10:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791110653; cv=none; b=g82W1Lys87dDOSLaCw6CVILh7DtA1DtpieTYb3dXR3vlIajeenV5aumPMI/6v/DY5JODWQ39sU9WOfyKoLO2qwtj9IlWZPGVmIEJWIKalpVro7/3E9mEA2cQXFHBUSq1/taqJn0roQuFH21FA/x+QmN0iws0mMwh83rIXQ+SqtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791110653; c=relaxed/simple;
	bh=kGjnWXyZ9NQf4aKnHYHj9cq+0Gg79KBWpte5IIsGB/s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=olsCyQpdmUU32LRep9tPPlb2v3sVj/lRdQMGI9AvHy3e806veEEsgW3Jx20AhwPDy5maUKCKDiLGv78lD8beOhdkOyTOTeSlFZ6Jp2AajGOn19FHQst+ur3p5y+AP1VvvmoNEzCTyqnR4Ha7PHLO7qBXX2C2QsiPggvEapf9Dvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=swwGWgIl; arc=none smtp.client-ip=74.125.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="swwGWgIl"
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-351297d9de8so206848eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 03:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791110651; x=1791715451; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kGjnWXyZ9NQf4aKnHYHj9cq+0Gg79KBWpte5IIsGB/s=;
        b=swwGWgIlosq2wuRvbVHoue6Yhz3qOIncO31bvjNYoHabvnFq4E8+GJNkKWLYdT7Qrs
         bXweSb5f0WkwtVrStIIKXBXi77l+Pfag6whD8e4uk6bJMeX5TGCF+K1yjkcUTLmClSla
         pmu2H/qxq5wOGN1pDARrwfa7R/kV71Z/9Prl0Fz9nBM3kcgYEE62U6zFI81afaYITnCj
         vMYbCE7pZ8jV84Y3fehvjR60ACAe3CZoxZsPQuxf0ttQfHQctFt6xwZ4Un3KcFhMCPbS
         BVjNPsmAalEtue2Mo6Mn2/1ak86JWlDSpfhPIKh8Lha71wnC3XCIYWCQRmA/PqUyGRDA
         sxJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791110651; x=1791715451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kGjnWXyZ9NQf4aKnHYHj9cq+0Gg79KBWpte5IIsGB/s=;
        b=sSNvDppsqDKoLVIzqYaCW/ThI/tL1l9H3mn7AFhq5ZpvDWx8fClBhRTqPXdG2zMLLs
         T3RlEb7onxSD9Zx8LAeaRN1WfzN6rYL/6/AH9Wo0jgVKEHr7GNJZB7xVftfAg6IHM5df
         d1uIiR7cRmKUHSR8ZRqok+Gg+AKMYr/sCy/ugeBwB/xRrGqYEYuwBIT8FWBgbsiMYmQb
         cGPhSM2qT9ibWfpESIAitbUY8U+8sxaZGhGXhDPLuxmKm1/W9EQp5BwU4tHZDkv6sHMb
         fT3Wl/RV9lXpm0G5ci0uo3CMi+QOqkRBJUoIahN/quDZKShswi46pybRBuMwEy1xiSom
         jqiQ==
X-Forwarded-Encrypted: i=1; AKwUvBwrnMFPas/o1vnjNB18nzub79wtQg3VYtp6x03GTiIWzRgvqoi7+7bRbtSZUejiWThxvEeGJEmbRwwaJCc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJKSwPF39qXGKinAW8A/yufrkn35uMQ8JA84GPReGbkMqwWlBNz
	lfz8EZHOv0QGS2OqYjMXR3kU0w/D2+n1MwX8i+SPgdGEIGinHCF9GwXs
X-Gm-Gg: AYBFou3j48HqlH6e1ljOuPoSDqgRHj562l9TubYt0ufbOHXLyWxuib3f6xsbo9FV5nj
	4KLL5fPGUTwRRztT1q/bpGflQnw2ROCONa4tLyIokT6EmPn5sh8VpgDwD/tnv7OD8VkASCLCwSo
	+5uGYlg8b3beKGrf5QUx8WCf/VQhNgz+8J5IF51eUDyROlxqlw2qsQOu1AV7vpAarhxbzidtNn6
	CXnZgMdrpUUFNZNsfu93+OZCHxAQm4XVZxD23akR5Zir4nRFhGVMYT/iPFk0jgRqDyKQ8XgtyI/
	HF92IPc2ltXEI3dxZnlG579WtyUTtCerTEtyzz1Ub458qj2ClK0MbbHmWRJchFBi8HYbpmlZUMT
	I7UNrr1x+L7WIK7YEQK4vNe72R9OpvlGNqxCF7HLpwxONFD9M8/7os1zTWTROxzGmaEUqG8v0Vk
	wTfX6Q/kG4i4OCzWJFnuQIXw2iItmIzfh8TJQ8mnFaCqtrq8h83eDdqsO3oMXfLppoS+yCKEWyg
	a9We8pe05fnOtQvkzhld1EFOINgcGu6UbV/sW9rjLsXklRS7q0oYFEyveQM8HO1XgEoj+Ny12YD
	FI+OervxY4PQMMzh
X-Received: by 2002:a05:7300:e9c4:20b0:351:1e72:7470 with SMTP id 5a478bee46e88-3511e727a9cmr3932747eec.13.1791110650783;
        Sun, 04 Oct 2026 03:44:10 -0700 (PDT)
Received: from kapoor ([117.235.129.249])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-351277a2fb4sm4159012eec.26.2026.10.04.03.44.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 03:44:10 -0700 (PDT)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: andriy.shevchenko@intel.com
Cc: jean-baptiste.maneyrol@tdk.com,
	jic23@kernel.org,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	sean@geanix.com,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iio: imu: inv_icm42600: drop stale vdd_supply kernel-doc
Date: Sun,  4 Oct 2026 16:13:46 +0530
Message-ID: <20261004104402.83215-1-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <asFV3JlT-YNYa9vw@ashevche-desk.local>
References: <asFV3JlT-YNYa9vw@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, Oct 03, 2026, Andy Shevchenko wrote:
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

Thanks!

> > ---
> > Comment-only change, checked with scripts/kernel-doc -Wall.
>
> Is this the only issue with kernel-doc in the entire driver?

No, I only checked the header I changed. On the whole driver,
kernel-doc -Wall also warns about three functions that describe their
return value with "Returns ..." instead of a "Return:" section:
inv_icm42600_buffer_update_watermark(), inv_icm42600_setup() and
inv_icm42600_irq_init().

I'll send a v2 series with a second patch fixing those, so the driver
has no kernel-doc warnings left.

Arnav
