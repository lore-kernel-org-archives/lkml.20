Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEE4C30CD81
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 01:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791336959; cv=none; b=OwjQL3hhVTOm/10j2HETnBCJNRFeHZFmZ2WNO5FfMTtDCfdtJa2/VpDwDZTVWYTdRNY1zGDzjy/3XOJoWbk30J4Cp9nGP04DZMLZ+J2CZQl8zSp/DL8rQ0cFVMitRyRCCqgsuhn5Hzz6kIWFJhnnPhUR5IMpIbVJIaRoOeZsSEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791336959; c=relaxed/simple;
	bh=Q4YqXzmI+9oOgBh2DPw5n0DcgX3aRz5kn5SKwSjH6p0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type; b=FrxM2JDoMKhXx6gR4QpXLXwnx5DT4A4+v0qcKnWXpXISL65/GW07RqMaoCG+8bxTJbElq7Z7vRNUmtb2NgUsqJc/nixIx/JceAM4oYu9s82CmfY5sUzKvFa0IEaGbEq/DMuvXcYhyXKNPafNNybZK666LzIAEL+Lz3cz4Cy9s7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cgEjoFgA; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cgEjoFgA"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-93e706a6ba9so128440685a.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 18:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791336958; x=1791941758; darn=vger.kernel.org;
        h=content-type:content-transfer-encoding:mime-version:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q4YqXzmI+9oOgBh2DPw5n0DcgX3aRz5kn5SKwSjH6p0=;
        b=cgEjoFgA5kDVdN8GkgKVWnvwk5Yrok9MBVJphnYa1UGqemfFBzJVVrFeTlEjosXg3E
         PdtZGH37k8p3giDuhKO6O2KyzEGxGCYGqA7QzYDNd3LfUIp2CbbpV2EpDTBpRevG6/Jb
         1+90yBuhOn90xI9iRRWxA6hWSxjlFYyDa/hUiji2gt6M548aF3IZP6fXyO08OOgy0/sD
         xcevFsCEzO+5jhPGYZUKHqrB4VfxpHII23iJIMshvZSjUYennRr0dorH919QXHcRZ3VN
         pRGwDe/G3eGXnKcvP2e+Z9OwT173aJK7Lvj9DYNA/yw1TPm/i2nz2mdaWJHP3BRM0+IW
         hA8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791336958; x=1791941758;
        h=content-type:content-transfer-encoding:mime-version:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q4YqXzmI+9oOgBh2DPw5n0DcgX3aRz5kn5SKwSjH6p0=;
        b=hMsEgmVpMIWJ5iAWS7wBSWvXXi4NuLnhRZzMjb2W/d79EHc/KSgdYznNdOp+0G311o
         bWkZRJy9IiD+ZDl5O5bchGtMBPE0ribEEfSRWQUfciXZxWEXQ/Btc2Aj8zarqVLZ4I98
         HOInYasKU4s8cwxLquwm7ucBWnnFDNviWmqJBX5p54DVKJrfWkZUWlSPNUdzjXyyICtT
         GD95/d8wO7xaCUKkECHizDWl/nQk24ss8mezoreF+3ycQJ51BZFNHexz6bz5fRjVSom+
         hUNPMYOKkMayund2gQI/6Iow7tVcq7G5FAsrEQkF1+fo5T50QlW61QAhPe5xBht/aHao
         +ZKA==
X-Forwarded-Encrypted: i=1; AKwUvBxJa7f8pTrjAcTMmYYYSTNI986FX2Kk/muFbLhoyGSlBvHHwomoZDjX68nq32xcMZEukfZ41gt9uqPpTsk=@vger.kernel.org
X-Gm-Message-State: AFuF++kyk5YPDGrUdmzqLu2IfSCw7jKXqcSzhSWI5nHpTqiAdEuNa0Q/
	3O9Y+xiru6cex339PTJ0r0HjBUki62BXkPP+nHawVlU8l2BxAsmcrpqt
X-Gm-Gg: AYBFou0yJ7kaDf4OXWtdmUbSkczeD7t7VZaiq+4mmkaoJh+XDOrx54hpj3V+sIn3Yeb
	0ZAaw+pQD63Q7xJuvkFLlTfjCxg7CaBH5rLZkb4f+IaHfXcru4iH4LE3VufsI5dG1KbCbIOoSr/
	NK8O0CbMvKIEVawDLSkPuyJdUoKc3ei9Xzk7jeplkIjhMjMZJSN/q+jTtA6OdKH/0RDxxMlRgpo
	LUAClHLjsnd7DFDyLIZjKmwzynL0v0vvFHEw82IdNuDd2MNQFRDYj8M6/bkgAjTZrpj3z1mdrYz
	NHeLpSDjYIzhPZZ/FEFTDxmSywVhNx3Z49xSDEuQZjvxjCMS98Xpn2JHusB4Z3MbCvTaMHRqfBB
	ttuh84dU3NMWRg1EgH6Vftzc4lHgSMeKgSWNCTQNG+wPcvsdRfrbIzgCYvxPwGNsUFS7PQ12fWv
	AYb0BjUpJOYCh5fgoXr41aBIBy0e5w4xu7D4S8V3/3vPvMVPZA2trcUZ+sR+BsLSMAiOmt6hF7J
	uPDA8L7bkcbzql2NQbY8Y9BuQ==
X-Received: by 2002:a05:620a:a18a:10b0:93e:9807:9790 with SMTP id af79cd13be357-93e9b8581c6mr104499085a.81.1791336957720;
        Tue, 06 Oct 2026 18:35:57 -0700 (PDT)
Received: from daniel-desktop3.localnet ([204.48.77.8])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93e98f6f8desm101574785a.3.2026.10.06.18.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 18:35:57 -0700 (PDT)
From: Daniel Tang <danielzgtg.opensource@gmail.com>
To: rafael@kernel.org, linux-rtc@vger.kernel.org
Cc: alexandre.belloni@bootlin.com, linux-acpi@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, bart@gpxbv.nl
Subject: Re: [PATCH v1 2/7] ACPI: TAD: Support RTC without wakeup
Date: Tue, 06 Oct 2026 21:35:55 -0400
Message-ID: <5383347.31r3eYUQgx@daniel-desktop3>
In-Reply-To: <1959268.tdWV9SEqCh@rafael.j.wysocki>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Someone's previous patch hid some sysfs attrs when without ACPI_TAD_AC_WAKE
support. Should you add something similar?

Link: https://github.com/linux-surface/linux-surface/blob/bf1921fc63f33d03a007fb38c4f88ff7e7bc1a55/patches/6.19/0015-rtc.patch


