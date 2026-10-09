Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9950348A8C1
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 10:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791540830; cv=none; b=jfq0wLo0tp4xnKaTmP+QCV+nNilmB4CRcFazyWS7m/A/aeianolkNs4CZuoxluMsaGDB+UJyWLid95iI2mSO/eHYgLAVkH7XHkjcojA9ljp8md1Wo0ANKbKDHZE7ycZhvIBzj6xaDt+G72QS/dnkIHrLqVHkVRuJoTolkZ8AQEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791540830; c=relaxed/simple;
	bh=0U4xIOg20BKcARrBmZvGznsOfRn9b7AZafGK+kezRBo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jH4+uBH5B4zTeAn9mRu+xej/hMsYxc+HMBhqcPr2SS8q8Phbs/GPZjlilLx+wPmzRlK6LJSv1hvN4wuRPrgI/a4cHrWM3v4bWwvHBRadnk+127nmXWgLuMWu7gewfyJfC99aUa6edwAvyAIHqVTDlLyRZ8N4dyyPJaZ/jJsjl9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g3SHfbU9; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g3SHfbU9"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-88b8f0a1bcdso3124793b3a.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 03:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791540828; x=1792145628; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vYXNKmY4LQUdBMbioRIMCa/Hf9fKGkwJzJMs+UpAab8=;
        b=g3SHfbU9lk0LrjqoHD5FTenUEi9XHThlw+ag+eBxkXXJSl+zRTd9eWExniDdf2CkLb
         xEiMj0tNHCv9Zr3j7kPztSp+HoedKukwET4fuxKFL1bI7ueBmFcRtH/Kn+fGoGSNmgvW
         KK/0i/Tt9aEr3IiprCBsCeWg0xuv5bYjvcVlU5yiaNrjTCJwsKd3bCHISgsgqDdiYfFc
         1qwRIm3a5R1ThlnISLKjAojMrcWQnsgBgyJRgaLJDP5KYZcz/BzlOwxUYJi94Z09PB0A
         LS9Nasnr6JKe4Bu6VmpuqsFFlqcY6Rz/JZSedVRg0WExukIhMFw/DNGXFGwqZ7yxc2A5
         yAAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791540828; x=1792145628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vYXNKmY4LQUdBMbioRIMCa/Hf9fKGkwJzJMs+UpAab8=;
        b=k6WdJkUgq9zm1PnVQUadO6lJ6EDb4vTcNSwYAkDJMPtxFPod2knBCffIJHPxSF5Vur
         Yflo5wI2O6B86o16PGlQBudNZCmet77mtNHIx2kY5jvAaAF/MmVtNfAimazrbWNrw1ls
         ENil1QGv7A9YyKNQU2DG2PyfP++H+9O02onqa8IkcV+hNKUGxtV0fYFHkIoZNQJp3ILd
         t3QL7zXK+7Whf4bTmBdw0F/kKA2GrZKb554RNhsRPI1IidPd0QrmYJ3SY1QI+oj/A5uC
         7+ZemarAXklgd9K7bNBmQGtE1aaawSI4PxEPBstgecCZT59hN9jocBW0aUCM2J1JrOQz
         jg1g==
X-Forwarded-Encrypted: i=1; AKwUvByKqlAETHLE+ox87Euht93KYblzxKq5PMXWPLEJlVZrUb6z1hJPIaAMmmJTmEaK33yyM3tqvUHxEYZ4bmQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYI34D4Hauc4FvtQOPnd/WpqvnMQMHgCzddkg3hYF0AjC0fXfvZD
	LsMLAXJI0gs0O46JqJz/gbsQlJq2EGe/zzLgPgQNOquourVE3DNN5bR3Y8PqcVojhGw=
X-Gm-Gg: AYBFou0UM6umqqF3vvlNJW5bkp0INvyMj5y0gmikwdvZu8yMDtv6A1Lvv7qkuIb6k9F
	rWKv4hHuSM8XvigPgH9OwbimQVYw6gXWdbKPLkSKNKHG5Xy3LCiA6g/7tcbn8I6BvQB66A19Fwp
	qz7nu2WqGrxZfJWgvSXEeO640VUurTCIBZbtdlJ8dwHFgvlLDRSS+YrXU2rGrnJyoaZWtTpJP1B
	6rGimbrtMmHZtWeO0UCBC9VG3GxPlbi5vOQGx28BaxA2T3IJI2I5BfMEvzrWetAT/CpY/M1kVuK
	FSs21Z8heU6glpIm/OhxTpoJNoMbF/yF7hR/dmOshN6E2D+xRNbRLX12AYGo28wTpvNpciv1wZS
	J1xV/DZKzClxKFuKLc1qCvUcF/Ad7tIfjouC9zctis5Z5+MpRkXaqEw3neEDMKqTXojTZYyRxDu
	fVkfRMe3vQyoKMRV2xEcUbM/V/RTQqfuKXTC9zYTh42ctnsSTtH3Gw6kHXPQb5259iEDvrsW8EY
	kSgq+cbToHeGp8eLmFqHcvxCjJaTF4VA6o=
X-Received: by 2002:a05:6a00:4295:b0:874:706d:856a with SMTP id d2e1a72fcca58-897c79daa3bmr1137358b3a.27.1791540827847;
        Fri, 09 Oct 2026 03:13:47 -0700 (PDT)
Received: from qiwenjie-ThinkCentre-M760t.mioffice.cn ([43.224.245.241])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c37e2238sm683707b3a.22.2026.10.09.03.13.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 03:13:47 -0700 (PDT)
From: Wenjie Qi <qwjhust@gmail.com>
X-Google-Original-From: Wenjie Qi <qiwenjie@xiaomi.com>
To: chao@kernel.org
Cc: jaegeuk@kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	qiwenjie@xiaomi.com,
	qwjhust@gmail.com
Subject: Re: [PATCH v2 3/5] f2fs: cache: wake up f2fs_writeback when exceeding threshold
Date: Fri,  9 Oct 2026 18:13:40 +0800
Message-ID: <20261009101340.3525944-1-qiwenjie@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261009091857.1326197-1-chao@kernel.org>
References: <20261009091857.1326197-1-chao@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Chao,

> +	if (dirty_threshold && nr_dirty < dirty_threshold)
> +		return false;
> +
> +	/* don't wake up f2fs_writeback if both thresholds are zero */
> +	return total_threshold || dirty_threshold;

There is a related case with only the total threshold enabled. With
cache_wb_dirty_threshold=0 and cache_wb_total_threshold=1, clean cached
entries keep the predicate true even when there are no dirty meta/node
caches. Writeback does not necessarily evict those entries, so the
thread can keep looping without sleeping.

I checked this in QEMU using dev-test plus my both-zero fix, which has
the same predicate for these fixed threshold values. In a three-second
idle interval, the writeback thread used about three CPU seconds;
the total cache count was 22 and the dirty count was zero at both
sample points.

Should the thread wait when no dirty caches remain, even if the total
threshold is still met, or is different behavior intended for this mode?

Best regards,
Wenjie
