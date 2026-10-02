Received: from mail-wr2-f33.google.com (mail-wr2-f33.google.com [74.125.225.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E499476CF6
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 09:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790932590; cv=none; b=n0U7S6E3h6pTNp3cUOixn86oVkpbA8/maTt7Oq/Lm3wDZoTLW7RemAmdl+mynKJxSMWTmEB2TMxD972rfW+FhMruLDbtpFyquQmz5v6a6Q+zDLSTXfjMGLHkJjlT6rljo7Ve6lPp9LrAz5hjhNzmRhLnNM4nazdSyMekozT54W4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790932590; c=relaxed/simple;
	bh=ASIRIPQOZcDvhxr3ddvbKqL88EpOSIQJKUuTlyXbJsA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=TUokZYMtGo/eYyGuyL1JwCyzZDhbgKAMedIA3/bq+GMBflKMTD/0zL8BHPB2nzb9fB2ZePjt49mFDcG6KzitGbKXNt4x0GuDegasx6dXxx9cjK5UOfv6CyR1aG+qqmDXuDijpKBfDh67qvKKVuWiQFIGp3+2BdSDa1szGU8V4pE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=A/ygneT+; arc=none smtp.client-ip=74.125.225.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A/ygneT+"
Received: by mail-wr2-f33.google.com with SMTP id ffacd0b85a97d-48b9d8056d2so303855f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 02:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790932587; x=1791537387; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5i4f7F+jr4QCAb/6TnLantwlo7EASL44G0akbRfkeFE=;
        b=A/ygneT+JpGsofJfsb7XViC7gRNTiRrSSQVel0o4H7CN8mgGa19tDDHqRpHGZG2P4F
         C02RSLIM0n9F60/bFW4eIWSSO0IKALq2qb+yy8CuIZikwZAR7FAvJ5qPO+vGV30ojIeA
         CJNpzRUneR/0tgT+MvRLmDPmgcdKhCWEXLgKBQ6h280CKd2VH/XMBJIWYg9NOhHJ1ghG
         00vhVUQ3vhUUkn9LEs7Q4/28ZQqT/YHnqjc6EwzBGok2IfbQDh6ZH/o7M35iVNsdDzmB
         BkHAlc0RVGCCUi0/Dskah4+DEPhE01lwzSH6YoR6HdPpYVxncSJkB+a/+5x1+UPBWkeV
         khQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790932587; x=1791537387;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5i4f7F+jr4QCAb/6TnLantwlo7EASL44G0akbRfkeFE=;
        b=UtymKIoWK68b/PnMKGJHgl2g7nM+07RAVZPhIlUUx6Q3QcgzSHL+FvR6qfZnMcLIgj
         tG99ULU1d9hH/QTASZUbx987kGbC4XX2IVGxZmfpWCMQFKdUYid1xUqEEo0VuqjB3rC9
         tTv8jBFPALa/mTCWIJ1lGGclE7ak3jquwsvPKiiqmGhoir3n3FNBo5QlpmkISwHOJ+b1
         /MdTwlH57+L9U+KDrHEHufXxRmtp8isleyVUSK4/EratJGES54QskYvNmOhlLIOSqt2E
         auuwZPFB3zv7dGg+tFSZKPeYWE1BUKum5ZTWrZDjRPFJ5m1WWnk5kGCHu7312rO/ayf8
         1tKA==
X-Forwarded-Encrypted: i=1; AKwUvBxME4C+VdQrdPgF14rxdraH+u1A8+3WuFJGja59dOktmT9NGP8JWu9iMbOdxDFxqqH2pXO6DKRgc3ohVFk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLTR1xngNXdN4hwZyuTtPi5hFk4oVKz85QKtK7rmqvDNrtP/wRd
	bo3NdNSrobinQK0DJWNyHbbeLM9myU9OawIPsCKyB5mBfnET2td3SfAH2BsXDW30VVs=
X-Gm-Gg: AYBFou3weofaKixpVNG2hZUYJVonRJj+TKJsHZsK3EtkmVBIalLOfftpIgvXk0XOZiS
	hijgcgNugxNKgr5eWa/Yg8oMXMow0jeWSa71L6nWrtPJcmuFNintvdk9AbzWejz3q9vgdsku9R1
	LIndjafq/ZR2kNrfApIFFMIpNlzq8VpSOnZDaO2zGG6XUH9W9HS21KfngMo5WjA+kB8WwVo//Ut
	PamcsSM0/1QVJQ3viliItWItJa3KSaC2/N2zdc9UJRZTAvIaUeztinGUdoDMRnyb4s6Y42DApEu
	GLgS5jEFiViGiRhpOy2xZf1/JKWqch15vEtitMfwjSmp9at5gsmTaspn6zwqu1oZpi08/+rW5Z2
	m6NzQkghowCK64zyWKwKmqTEVzwxncdkqMuRqNn/a6pOwHZ+rTjjXFciFQ7xu1oYuHKkIPghE4H
	gw2osQUrVW/ot4nsIKV8gm0xPGS5J9bNQgGP+nYoVtOW5tnGwu4NQxyg8CxqMXWjUBPyuEr1LXq
	Sh1pR6Zqdlh0xWMzz8=
X-Received: by 2002:a5d:64ca:0:b0:488:83f7:6352 with SMTP id ffacd0b85a97d-48b126f542emr3954542f8f.4.1790932587146;
        Fri, 02 Oct 2026 02:16:27 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b382f9ad6sm4461292f8f.40.2026.10.02.02.16.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 02:16:26 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: jesszhan0024@gmail.com, dianders@chromium.org, 
 Hsieh Hung-En <hungen3108@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch
In-Reply-To: <20260929080143.559685-1-hungen3108@gmail.com>
References: <20260929080143.559685-1-hungen3108@gmail.com>
Subject: Re: [PATCH] drm/panel: ronbo-rb070d30: Use mipi_dsi_*_multi()
 functions
Message-Id: <179093258630.2282096.3657268335428090758.b4-ty@b4>
Date: Fri, 02 Oct 2026 11:16:26 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.1

Hi,

On Tue, 29 Sep 2026 16:01:43 +0800, Hsieh Hung-En wrote:
> Replace the deprecated mipi_dsi_dcs_exit_sleep_mode() and
> mipi_dsi_dcs_enter_sleep_mode() calls in the enable and disable callbacks
> with their _multi variants, as suggested in Documentation/gpu/todo.rst.
> 
> The callbacks retain the same return values. The new helpers additionally
> log an error if the command fails.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/1] drm/panel: ronbo-rb070d30: Use mipi_dsi_*_multi() functions
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/f5c3d702f4ccd1e953436c6a16e542e232a743ea

-- 
Neil

