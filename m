Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE2B48167D
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 16:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788280700; cv=pass; b=qZ4dldZEwguPrwcAuNpCSVKGfBubbrJoO/9aPDykiqaM4/r4I5xU3nca187QqywJA8KWPMbyOKVd1R5goYXkrIiwz2zgrAGeQjrghgVG6kzYyG71vNQGqWOXxiva2aVsV01v4RkHe+OqyWQ1Y4nOGYmMcWsT9rHDNhHO+RdXIek=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788280700; c=relaxed/simple;
	bh=XPl1laDiwoLbLwVrs7S3ts6eE0/WilYt9l17xn2NE1A=;
	h=From:MIME-Version:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UX6sW6NBq9g5OOUsM0MjRWiH1OUrcv+75L8rFvyM2d5BWCDQOrUoXCepWyiOWA90k3mR2LV7ffm3twgFYKWJfuDYAxAcB7tHUvrGqGFbhwuhXR0fdomS/lugViJiMzJBGpWluPMnkdVdQ0NX4RxMWiD/tVTVFx+eg3nsO7cmTsY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EkiLoCei; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EkiLoCei"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6a6143cca69so4459a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 09:38:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788280697; cv=none;
        d=google.com; s=arc-20260327;
        b=PPURsBWnlHnOKksc/0zc2n/NFOfXpcTf79eTQ2Qt/nxFrnHwcgaBYnXRntMe6ogcU6
         XOS3kvkzDlmKqWeW3m0Jk4VmzfU14XN/DU/4bdspcgyeYab7HIN9M/v5fQDV5vhN15hq
         gXjQBLp39BKZw53FdgA+sgSK9wMwTsMua/M7MXSYsMxaf+t3XuIaYVeFAOBEppaRLy+5
         lwS4ceiUP6LbKVM0U/sItKOBpORZPPHP2pBgOvsgKB5L7H/RIkSOvF2lUPRJZQEokT7N
         dlOZ8xjwuRoCTgqcm5slivO0qHu1+LbX0LYZkqrUiOEQYnNE16fmymDr0duxZLwHSOCT
         HsWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:mime-version
         :from:dkim-signature;
        bh=XPl1laDiwoLbLwVrs7S3ts6eE0/WilYt9l17xn2NE1A=;
        fh=JSy2Yq2iqmYcoLLBbB4wG64y0r418F0RCbMwEgMqPaQ=;
        b=GGTJpM97q2dKZ6QSc6/cWozsUHy0GRt04QqIKCDw+y0sLMsCt9pBK94pNPlD39qF1g
         9ske6D+Q8k4ZOC/eCjJQTACc0ixEjw/HTpHf+I+DgKe2ZtTe5hf6ZZ09FVN64nrRFzje
         DdjD0hdr8Z4L4XHYoz3q5D4rWaPnsL5u0pfwh63oMzsMhNOp///Trn7vXCTw7yVABtmc
         Ug/jF/Ph0ek59b7BdxpcIoyq6hC3o7RB0cHntxXblgq9MHpSyIr3U1j/hmO9ZvT8CQ9U
         PREZz/W5wMdpguTf0xlpwB6iYniDs8nW4yxc/VdpojYT7RhUL6jEQFQn3p2pC2UtEcxb
         A6Aw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788280697; x=1788885497; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :mime-version:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XPl1laDiwoLbLwVrs7S3ts6eE0/WilYt9l17xn2NE1A=;
        b=EkiLoCeiU9zNUYILSBF6C8BhuHv5YTKMhz9WQd7uOqTiMlfW3Q2sn5+bbRke+Rkesl
         3Fj40IobV25iRDT/eJjlqv0RagOdPTpm444ZG3+05vdSX62jp29zi/yOzkW1hQ2/K0ev
         dDxwMeMueOZnf5SCgUAq3UZEPLTwj9KS2B4JsxpR5dbTVRsMQ0Z1/OBIqRUFIpBwqNuW
         AMxe3Mf24U6B9WnxtCvcmkGKSYNuKjyD+Pe7OLc1UMKlYqR+BVwBcF/pwyprRF7btbNX
         uMr/ygyp11AFbqrk4HLUCNr2d9mqRnvd/bhLf64iTX+ju3mObc2inupsAe+czpr7l571
         4xag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788280697; x=1788885497;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :mime-version:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XPl1laDiwoLbLwVrs7S3ts6eE0/WilYt9l17xn2NE1A=;
        b=SNwOgDdgtcvmhldvNFIHmVgoinKUmyb+3Q+VC1sz4fzx8oSqDZtU8W2c/yVS+7/WKH
         V4TylpACQj1EQt8j6m2pmdUHViF/j82mbAcWtfOIlCx43Z3b+LI2PyZAJlYaZzjp5d06
         5M+T0Icy5X6J18MaLXJux1bykoxUNULGZkhMYRmDZ7TDDgKKMmPDSbQ/Xud6p9ywWJbB
         aGi8uZllX0hoQTtTkjkb504WCVJczXN92nTqGRPxWgQ3MW+h/cTKRZNlLFCoEwbelZUh
         qlqJLfWM9pQk1yAQxe+MS4MiOijWTuD0CNVI6hBTEoMWTgEoFewgKyrfMqwmNzhSdVOr
         Hk3Q==
X-Forwarded-Encrypted: i=1; AKwUvBxaWpNmWPjmF3e8ZgHg6YLgmcuOEGknICohJjnNIkhBxb5Z1nKcN5tcJrVjQpuDlqEbZ8jNOBz+xIOqWO8=@vger.kernel.org
X-Gm-Message-State: AFuF++k/TKHXCv0JQrjzcvsNSOh9fXKZYBuO8JyZq6ITp6TYKyHpQaRy
	NtGfZR8VAwfNEm7TCbmbA6xEO/J+CIyL6nRyR5QWykRqFGm1MFrR7vmS/0CUFV/ZMj5TIXBS2BS
	T2eFHaYcpw7u4XBhJj4NYMFb2wvm90gbk70RPi0w=
X-Gm-Gg: AYBFou2NgbVCXHzT0sPh3a0yi786rFTvYz+B1hfn8jJpnpjYJtcCdWnPFGQM3Bze6I4
	mIyDR/nsQHRETc2oKGtZyaOlyhihLONFun1SPYRGSCHIo/aYm6VzLuBIDHraZTRWyf/10N9SACA
	8P/ImDtP/Cyi271tilT1pRINRDIROE6GOqqbXdlk46pJA5wGMVj4FoogqEO4w2/lXcEv+LV9zem
	G9uS9hPGhOyNiYpHfBOuq12hYVYYKbmzPKSDUiuHYraPqcFzon/itRSJTGc+yBZ2iOXtq3p2rpD
	jFxhihpdzJit1+qAyOCGk8RM4oWRxKljlwoPlxhK7MaBwUSXrov/JTpNNY1IToRpIfbZid7/4/5
	o0A==
X-Received: by 2002:a05:6402:2742:b0:6a5:d8f0:dc10 with SMTP id
 4fb4d7f45d1cf-6a60d3c288fmr15898642a12.13.1788280697049; Tue, 01 Sep 2026
 09:38:17 -0700 (PDT)
Received: from 637551599889 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 1 Sep 2026 09:38:16 -0700
Received: from 637551599889 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 1 Sep 2026 09:38:16 -0700
From: Xinping Zhang <zhangxp1998@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CACOAw_ymXA1ytnL0W91B-L2OuuBzz2PRj2tVgZw332kTvO2nZw@mail.gmail.com>
References: <cover.1788213716.git.zhangxp1998@gmail.com> <65b4a84c4504019ea6b208f424917f9df4eed2dd.1788213716.git.zhangxp1998@gmail.com>
 <CACOAw_ymXA1ytnL0W91B-L2OuuBzz2PRj2tVgZw332kTvO2nZw@mail.gmail.com>
Date: Tue, 1 Sep 2026 09:38:16 -0700
X-Gm-Features: AcwNN1VnMbzO8_bOjpejEQ4zyWY9jNOcKW2EwdC4fvT5AGKXdobXzx3nUqPIQi4
Message-ID: <CAH=xXfG-Xayv+vhFuyBsdaNXhnDLk4mOCY87vn_NrTWLq99Jkg@mail.gmail.com>
Subject: Re: [f2fs-dev] [PATCH v7 07/11] f2fs: describe xattr block layout dynamically
To: Daeho Jeong <daeho43@gmail.com>
Cc: linux-f2fs-devel@lists.sourceforge.net, jaegeuk@kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Thanks. I have consolidated the two macros into
MAX_INLINE_XATTR_SIZE(blocksize).

For f2fs_parse_param(), I kept F2FS_MAX_BLKSIZE rather than
F2FS_MIN_BLKSIZE because the on-disk block size is not known at that
stage. Using the minimum would incorrectly reject an inline xattr size
that is valid for a 16K-block filesystem. f2fs_check_opt_consistency()
later applies the limit for the actual sbi->blocksize.

Thanks,
Kelvin
