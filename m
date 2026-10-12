Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB9563CAA53
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791798750; cv=none; b=CfRlzCXR4v9TIIfVIh3MbYCkH0QE82z1ZxjmYHIU2Ld+MzwqScNG0pEVef1YhCS0A3BSQw/Nqr3GLVlJCy4CBZcqF1gB6uxKYppWOWOG9fxmmRdoCIDJRR3F7BLOGlEgC9rviw3P8bByrK9FrIT7E4mhxxQ+H9VtFSGScP+7UtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791798750; c=relaxed/simple;
	bh=Vi1ALl7kg2UrCvpyRmaj8txmtK4YxEiunv813XtuRmM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lpn2/aQIcpsgR4S/iMeFLqq/K5gIMqheCjxqkQtipKHSrQpK6LADdilOkZ/iElQYaK332YRnKa18OhjvFnjp9vDWAReYM9W2Bma3/BXQSaKH2Esu/MHrImyOnEix/FmNcY3ViwBOOfScWuCyegBq84f3GnBUQEqw3tglb3t/6gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ihzoDHUi; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ihzoDHUi"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2e8662d5e95so8969545ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 02:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791798748; x=1792403548; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vi1ALl7kg2UrCvpyRmaj8txmtK4YxEiunv813XtuRmM=;
        b=ihzoDHUihaQ8Uw09id/gGCVWjav4AOTwLwfeWyh6DrFJGBHaOyecyA+kVk653hN5ry
         b5Duho3sf8eMig/cPHLyCWBtssYqpJ934LvthVbAyInkHb/4RTsh1RyteKvtQ3vzF+mT
         F++es+xnU/mE77mfT7ihPWVFvbxKO85xJpleD+PxWx1p0Q/6yxVARg11wO1icrzBNrsh
         2beVp8TaK4Yd5sBC+k4BGU9YxqqXamQUhfVh452F9pEHX1P8mR/rijQ+IBpW5F1gHg9s
         YQdFTFmW+pXOcJsAcaU+OUgiOSjdnHT8cffIqBPC7ID2M7keVpw7FfI6SHdCfuR7gxtD
         Tm7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791798748; x=1792403548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vi1ALl7kg2UrCvpyRmaj8txmtK4YxEiunv813XtuRmM=;
        b=rlFMbni6MovgM2tqHuwFd3p73H8VR8dxUOPMmbFuJyJizVmGYGxBmrVu2icJ5OSblO
         X1UYRGQngCqAFdNmA+SliE8bgRK/1KxMZi1TKCsO8Tf+xNx4j/WGZF/o3Te1MPr2+fjZ
         BnWZ0U+SvRKjryItKXlB4Fj5y0OQMUl8+Kn9vHh9JALejnyWT+rKNZP0nYpDKFRSboxK
         2Zw4qX/TNmYJm9qTX5mrT5q7yQylZApoGmfkhqkza3Pv2wYwZhgsBs/hcQedToz8GTJD
         m766Sg49ZyrwIOKe47y+7pVK5aJml7FtNg/aDJhl1lCuDjCsFUDLWRqhDKvFs8FV1Al5
         kFRQ==
X-Forwarded-Encrypted: i=1; AKwUvBxM/7JBVLBisD8+8KTGDWNi7gm1SqGw/pEuJyZzdeZrhn0VwVNh0QLNbMl+Tua9bkqC39xPYimo8Ty6/Rg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKSolCEd5vl05eTCEtoMOT/AhUdZBXTU6snsjcH/B/TJNW14wbF
	fpWv8kOcMm5WG0YPOIc7wpcpAtIZl16QtNPNJdXe7VHZgi0AuPrNW3r+
X-Gm-Gg: AYBFou0TfFumGHVe9LNkdHvecuaXAvMYfjTVdBeJay3wkATXjh2saNbte/y1xArmCp0
	n+BQwuHGcXM+AnsnbXYYMNTIau+4iMCO339kREhkCPnmto0GWSGtwoVM2H22rW/XObyonZBBSAb
	UL1yQd6ggKlrFHy6uswdDJIWg4y2PMR6ortXydc7LLpgWkrwfzQjvWAWHYPTyx1tavClaNDTYKm
	ZcoP2Ei5t0IB/BrZpY8rQhZIWBCvzYTIf/UzRus5NB3oNegbnMrCF3OcIVgijfHmMS4x3+nrY0L
	tWb5xNgRDjKrW6iblcdrxQ4r8QMqPa6SFfSB3asrERBMDF52nfRaMZ8WosacJhhzYYehxGldcMG
	ntkRTbT/V2ctLis+zeHDv/Gz1Uy2SZg4/mULigReqcPsqqs5Um+ljhJA7Qjq9JNWV4McltYcWEa
	6XT5Pv9yve9D5jcx+Gwa1gQ3Sy2oOdJvKxYfwmQgcQv3WSq0o7subLUJM5Pka1iqLO7LdtPfDpW
	vU9vAbAKXtq0F3GKgUxodOP8d3CDATmSUWOdCzA11N42w==
X-Received: by 2002:a17:902:e849:b0:2e8:4ef1:6fd8 with SMTP id d9443c01a7336-2e84ef177e6mr69032995ad.60.1791798747897;
        Mon, 12 Oct 2026 02:52:27 -0700 (PDT)
Received: from qiwenjie-ThinkCentre-M760t.mioffice.cn ([43.224.245.241])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8419ff572sm41045275ad.2.2026.10.12.02.52.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 02:52:26 -0700 (PDT)
From: Wenjie Qi <qwjhust@gmail.com>
X-Google-Original-From: Wenjie Qi <qiwenjie@xiaomi.com>
To: Chao Yu <chao@kernel.org>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	qiwenjie@xiaomi.com,
	qwjhust@gmail.com
Subject: Re: [PATCH v3 3/5] f2fs: cache: wake up f2fs_writeback when exceeding threshold
Date: Mon, 12 Oct 2026 17:52:17 +0800
Message-ID: <20261012095217.1744886-1-qiwenjie@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012091737.308136-1-chao@kernel.org>
References: <20261012091737.308136-1-chao@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Chao,

> f2fs_writeback won't be woken up unless there are enough dirty caches for
> f2fs_write_{meta,node}_caches() to gather.

The collectable-cache check and no-progress throttling address my concerns.

Reviewed-by: Wenjie Qi <qiwenjie@xiaomi.com>

Best regards,
Wenjie
