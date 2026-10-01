Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E9B6478E20
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 14:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790865807; cv=none; b=b0F50GMnsCwBqGYnNP15rXjp6JphH2eYnNgjYOypNc8ifXjIQgHmfk9NyGh7AEhkE7O8U+9+BRZpD+TnruSlx44VaiejtrCVBVQC6/8PsDnnMiYojEVfDszQRuQXyQRj5nA/H7WeAKioFNXl1gI3/9T2HGE22vIgfyHzNHAUgjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790865807; c=relaxed/simple;
	bh=Xa5jcdcqx67e3jNNM5ymHB/EDczYtA+SY20lfLqj4/U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=qWuoyI2c+zgaD88zSB8WmKpVjAiNyCeS5uKUkigX2IG11zp9D+wpIe8ghE+qZrT+1vMy5uBKu74E3x1WgqKRWERCt3USpx+Na/H81jnotUsObTkISjsSYTp0bjOl7R8RHzckuwjcPSZuqikoES+xbDiXMk9ZjQmCReUinFrtmUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=BVEGMhAH; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="BVEGMhAH"
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-46556b9e02cso562540fac.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 07:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1790865802; x=1791470602; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O/hNnkyBrVzy7QYaX7Aa9ulQWtOZJ0SM2Heb8j07gr8=;
        b=BVEGMhAHhet/nsxLTh8rdlTTbXWPvT89W9mE2T4ZAH6Dk4njtwjSbpSMfupYTX9Gi4
         psGRPWS2iC/zzuLHoi3uw553F61O//qpNg0Mc7Zf/edjT3WHSUTDvtncp8Dj51Hg/i56
         2j2udl5TRf0Ml187PqqaD6qvleBxt591Qov8gWxN+ZFFmpVJJMj9fJi2jYlxVnKw/X5i
         bECYxK5CaoDY6Jv94TaVrTsG4dQ4LL7zI5t5QEFjWGjitq2b3OlvrJap1KNASCXXHPdK
         yHi9UmJEL9hWBH0lmnneaJk/uepC0lCbLWCB4mN9+uvWNHsZpfNAvRn/T04rZHv7hPS7
         PXlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790865802; x=1791470602;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O/hNnkyBrVzy7QYaX7Aa9ulQWtOZJ0SM2Heb8j07gr8=;
        b=Z8l9yA3T5+5a36taaeMXjPvSKGMCXAe0pX/H4l+izJHDtLa7+5bkT1yIdvNG/q00PE
         og22gKsqr6b1uvbWMVGpFBPwjXbWsnpz75158Nh7cQaBJ+Nkabd7yr+0G3Av2JDmQWh6
         qlaVzBVfLK9AX55ZsW7Jd7+dm2b1ti/xJpP7V+WBIxXhA1+9UdfPVwQMwFBERJHxJN6d
         lvluzM1DE31m12meQT09tShpQDIAlLyRjpeh7QhhtF92bDZ2lRhMox3jQpvytA6CC0CZ
         bgblKkFwb5tkEJHlxjF+fw9NzS1rlsDYD5j364PZRq2Z+vccbe+KhvPwGJe/7C5hJTn6
         Jk4g==
X-Forwarded-Encrypted: i=1; AKwUvBz1pqhSQZxSmckZ3Z+t4UBwA2ayKSYpWjw4VJJ7LFPErzEAt3LBSDmKITwmivcLeBLsUmRrCK/TBeSwKk4=@vger.kernel.org
X-Gm-Message-State: AFuF++kGuDQNzRpH68nSWSIcV65+Zxq3FjQbQJ08PqMhgcJXx2be5c+0
	795xA90YaTzmP+K5EDfuEyTIrd0GEnl/mSA4bDfi7CoujZCiKKS9WL7EwUnNofAgDLc=
X-Gm-Gg: AYBFou3zN+SKrwWr/qiq+8DuntgLCaLL4RBf/XxfhAMaOmgqRWqynhv60gH4pebV2K9
	4Cm4j5yMlDMI+g2flxE68xVHosgJACMqIR+JNats3HlEZEXDbafGmZ7K7Yl5mwSR6VPXCeaH5ed
	fuhxul2UlL4dEHaBM290LVYHkDuMbjoj/PWiC6g0PtdlP3mNOwho58hwdfH2Tmak7+wfnsJ3TAM
	Rq3zSFPziG5MOfi17PJXtTCpEArq29M5mLpzJF5HHPzE27Z6cPdu7XZ5Uqb02rLXZMsCfZGd+Uy
	/AOtnx7aqiYRBXqgvbuIpU0iYnQ0R5e4ScV0C/3e8e1+qNbz/YkNGjM4sxq4lj6C9+B5MeZxa+B
	n6C7XJcQTC4xYFIxG+D68aw32lOCl8kM/iLj9tVR0tewlF3ijwQFsvzm9W3dOSrirzBi55Zn6/K
	+9bKrZdcfuSL5EHrtB5tOz8gqaRZX1kyXd3oNjl1WODAtluQBZUyxzNMTq/lScbVtZiIGlHWzyT
	rhd8ZECXYC6AJNs2ZRkJiNeFw2K1ErnAtq4Rp3I+n2r8cl+3p6U3Uw=
X-Received: by 2002:a05:6871:3313:b0:493:5dc4:e591 with SMTP id 586e51a60fabf-49defe01b8amr2509657fac.1.1790865802044;
        Thu, 01 Oct 2026 07:43:22 -0700 (PDT)
Received: from [192.168.2.38] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-49ded14d8a0sm2638009fac.5.2026.10.01.07.43.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 07:43:21 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Johannes Thumshirn <johannes.thumshirn@wdc.com>, 
 Vasileios Almpanis <vasileios.almpanis@virtuozzo.com>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
In-Reply-To: <20260930-blk-plug-ts-flush-v1-1-bf8ca7bc5cd6@virtuozzo.com>
References: <20260930-blk-plug-ts-flush-v1-1-bf8ca7bc5cd6@virtuozzo.com>
Subject: Re: [PATCH] block: drop the cached plug time when
 blk_add_rq_to_plug() flushes
Message-Id: <179086580097.1687323.5913036071644387074.b4-ty@b4>
Date: Thu, 01 Oct 2026 08:43:20 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Wed, 30 Sep 2026 14:32:26 +0000, Vasileios Almpanis wrote:
> blk_time_get_ns() caches the current time in the task's plug. The idea
> is that the cache lives for one plug and is dropped when the plug is
> flushed. __blk_flush_plug() and finish_task_switch() do that.
> 
> blk_add_rq_to_plug() also flushes, when the plug has too many requests
> or the last request is at least BLK_PLUG_FLUSH_SIZE. But it calls
> blk_mq_flush_plug_list() directly and never drops the cached time. So
> a task that keeps submitting without sleeping stamps every request
> after that with the time first cached in the plug. start_time_ns and
> io_start_time_ns are stale and the disk stats charge each request for
> the whole time since the plug began.
> 
> [...]

Applied, thanks!

[1/1] block: drop the cached plug time when blk_add_rq_to_plug() flushes
      commit: e0f2224433b15a57125d6ac5d46182f99c6c9d08

Best regards,
-- 
Jens Axboe



