Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 568F943498B
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 16:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790008369; cv=none; b=O+nur6+0duOBlUjnBTYDsINhytw4f0SHuA26ZKI9rpcnlM7yvWIIyXythy5pSdlNWYOeylbLBPTH8O7DZZt4Uk9NYdv7Xf6YJ5/NdIkfP/6+K1KHmLe7515AQpu+4yPTXjd8HXUc/CpwMjjLcLo6AAHms29t+jx8EtbK5vmFJuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790008369; c=relaxed/simple;
	bh=N9Nz05Be5ukSvo8DN5d10l8stTAeb9nFpPYkm8hLyIc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=aWlVOVo1xGyCnAFuQGtaPHHZpPTOKXnHpms8Tnk2TmmH4Cf266Q7UFh4EIIVbWPX6Y/VIAZLDQl+z3UjtIPkTI/Uc9fEZy81IhkWP24gJECtLrsDWQU9D78Xa5s41tQnkcNFUs6QYhaGoeLB9pEIKa7u+enSIJEdU5AUn8JiVX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=fX7QOJqE; arc=none smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="fX7QOJqE"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-466ccbd4773so1165689fac.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1790008366; x=1790613166; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rvp+JFs7UGjn1/fZUHqD5pglAyJFEHKXVcUO8JhHKd8=;
        b=fX7QOJqEz9e7QVh9ZHKlZcnJlk3AeNnZP8NYZ4oL6FAJ4Ntgq19yo/fDGBKbMt1c3+
         N1GNvKPtE+JLRN1SzPOJmCvMbuBTeYW/AH5xB+uETSS3x7zOepRDwftvcfHpCilaN/FN
         A6tdf8TnCdVb0rckfQKXm8v6vk/uzQ7Lm2vOLQvPI0rWkxLO+YSzr/dXQuGozSVC7fr6
         nM69HC13Jr411L6LosawzE+YhcftLlDOnsY2ZsW8ClR3vSdwKB/Of6G2HulKpbk+1liB
         wzqyzfaavBbYdFlXkjlZOIJDw6UpU9Z56CymXfaxkVe2/cSZrOc+VRmEszk3bAhezGG/
         1q5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790008366; x=1790613166;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rvp+JFs7UGjn1/fZUHqD5pglAyJFEHKXVcUO8JhHKd8=;
        b=Yc60Gl4fmdg8tj+E0TdElkVjRpKRj1V90suxw7l6C5yK238tEBs4Fw/xGNHRkLgLmd
         VjcQlNmaB14zAR4EhYGLxKWbL3WwGd0JTj2XI0whncwkSlOMk1E2m6he7CLMkILfoQLX
         4Xs1XuL1HQ0ktdZCM1lL+4iS3DxyYSY/adDTob5pd6ne4qf0lGJ8W8IyaHUR/LEJvdvd
         2Mn7NZmiggHw/KyMEPo5A7QkqggadpYFykKwI6G7vrSHmjbLOrwI8/TEJVvh7WqqUnbI
         +6PLSTyIP4xAVo4j2zVN2032Z9aMSMNk7lbcTfS8WUHu/fgmrFrFNT+wmbqScoPXZmes
         K+0w==
X-Forwarded-Encrypted: i=1; AKwUvBzBaKulKEE/zPch1uAdoyqCy93S2J2VSDR8/PQDmEhtQkiF/ZIQf8hq2xHQGQqllIlNU4RhDLQf+IHGFPU=@vger.kernel.org
X-Gm-Message-State: AFuF++ntWynkCqJbR38+v8PVpzKwVxsE99gyYE09BdgKS+sU3/kiKQwy
	RXDBEvs/kJOvGa/Srtftfg5Aw1WRPnFDdGJ4i5WrefURh0P4egmbltpemaQVlUiQc5s=
X-Gm-Gg: AYBFou327p5tlZBwkac5KBaaM9sFzPJZ6lt7KUVILGWewQuDos1p7cO9WyzMqVQLzb1
	+guS/IEN4IIZsbX4haG+PdmpRGiK/Qh5c7gcxrvPnwivWXyNet3V4U1T2rqSUWcLpKSPdOqhoZl
	qoj56cwvwq1a1WP8GV6eJn2l1wVIFRidWai/f+GeoxhSIpmOaXupl4vlrXjFy+WKwfRz06xkj+S
	kaUavSXLFLMmcyS46ARzEszOl9jCDVPrK7ktNqMGtZB8BmNtVZ9mSt25NPuc+4XeK9cYrjTL4s6
	Mip+xvr0kOrFP29i1hwHtt7Oe9adARkze+ECsvqN4agTzm19hv4PsdczXe97RFi8ebwtjU7N/s1
	0XmcDQIIES+vCa/0sfc5dyHNEw6qagwAzSosYEweRF0ti+2baxkh1LuVShn3t5Q6njufdJZ74zi
	fEDL9gRpWQgKTMeqpoO6CC2Usprb8IteF1Z3IEwTZst/ohC6w7vEOMCBV40yTJ/82CQ+E6/lO8H
	IFHdJLUGfMGJv2+NUpCwJc=
X-Received: by 2002:a05:6820:f010:b0:6c2:21ab:ec92 with SMTP id 006d021491bc7-6ca9ae3eb40mr10131077eaf.30.1790008366114;
        Mon, 21 Sep 2026 09:32:46 -0700 (PDT)
Received: from [127.0.0.1] ([99.196.129.128])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6d142be4e98sm445928eaf.2.2026.09.21.09.32.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 09:32:45 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Shuah Khan <shuah@kernel.org>, Dirk Gouders <dirk@gouders.net>
Cc: Ming Lei <ming.lei@redhat.com>, 
 Linux Kernel <linux-kernel@vger.kernel.org>, 
 linux-kselftest@vger.kernel.org, linux-block@vger.kernel.org
In-Reply-To: <20260914110145.41627-2-dirk@gouders.net>
References: <20260914110145.41627-2-dirk@gouders.net>
Subject: Re: [PATCH] selftests: ublk: fix unused_result error
Message-Id: <179000835839.1960768.1435257617416448183.b4-ty@b4>
Date: Mon, 21 Sep 2026 10:32:38 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Mon, 14 Sep 2026 13:01:09 +0200, Dirk Gouders wrote:
> Commit 166b476b8dee (selftests/ublk: add shared memory zero-copy
> support in kublk, 2026-03-31) introduced a write(2), ignoring its
> return value and thus causing an error, when building.
> 
> Fix this by using the common workaround "(void)!" to trick the
> compiler the result is being used.
> 
> [...]

Applied, thanks!

[1/1] selftests: ublk: fix unused_result error
      commit: 687cb38c4330d52d58dbf426a3eb523850052d10

Best regards,
-- 
Jens Axboe



