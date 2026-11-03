Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793716277;
	b=vb31xBbxliQmb5N9ecB+hjv3wa+8IBqt+RvXXnPAacTgjnitndf+thOjIcQygPRKBE20
	 WV7eY2+yv3y04oOaPdPA106YxkiYRQkxEyWnXNCjOKZdPXIIOQg0AYtWDLcP9Qdy9Rl66
	 7xulaaEUJvMbOeg5Kq8ehLPMS+5uNrdQY/I3JpNPV8mW9wRvS9wcbx/IH/44ve+In8PbV
	 xyEGaonWLT1b5UKhgdqQgLuiCQKYhUJ4Z59DFBaZ/PzkjSqL92O/2mfajY2jDc7f1LQ0b
	 WJmWUpQrTkPyIFT6d+bIYnrYXTT8Iw2p73XsSwCtVU0aV27fRANHjI+xvTIkCLadmNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793716277;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:In-Reply-To:
	 References:Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=u9ZaJd6aju36DuDO9RJNLklXVPiZP2FTMqXACefRn38=;
	b=1imbT7t2A3VyyCHrhuH+T2jm20Y434i7v4lXb14i8fFL7wRDuAKqiT3ut8zNFXtwgUuB
	 CKS/B08l7Gjy32uc6eU/uoyrbzbLNLR0CgGF9aLtwTfX4QQXxM8H1HjX4qr9aq/mABHkD
	 G8jz9hFm4OyJTvDApzBYREUm37mqhIlR7JELUzDXlRhJ3zu58eCcX8wixdjXE+dwAIIdt
	 uKoQqTk3aQm8vWIXWlPUo+Su38se+9SM+2LU1rBXtuOeM242ikkiq5L8lNpMPv0hVwGGJ
	 iIsatMdEhKWdc5SeulAZOAzGlHx8pkGjfygYcHANkalwfrg6Eiv/kybH2ItPIS20O3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=JT4Dgk3D;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 550A76082BCC
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 14:31:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 550A76082BCC
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=JT4Dgk3D
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1ae18eb9b69so3126949c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 06:31:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1793716276; x=1794321076; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u9ZaJd6aju36DuDO9RJNLklXVPiZP2FTMqXACefRn38=;
        b=JT4Dgk3D/jhsxfk4IrhfbXwkMOuRTkVIgKEXssrb4iJvOgCDN0aH73b+2eGWqnll+U
         WpXXntpnlnTazTxY5oldBR594LJpDvSFT2I2ZS0uBNFiMZyXkx3XAkivUO1rbp/du3wd
         lgRSIVa7Q+0AjehCQxfMczoGAUH42Wz3YYMHC6SyJ6GlYROvocU39RFrCIzeCb6nK9j/
         ncCrxKF2CaIEK3iv4ueec50dEqPtjLW5RE41XZ80/iGeoY4vMHLl9EeB9DYnWyo0c59m
         AXfN25Adnrk5KuTQpFQTp293D1gmxhvJsRcHHSCTkoGuMjGow6iZ9h/Jyl0Xp6v0UCrX
         EKFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793716276; x=1794321076;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u9ZaJd6aju36DuDO9RJNLklXVPiZP2FTMqXACefRn38=;
        b=wUTTllVWjxvtrM6+eeF6uj0CE+N1PtiPtA6we1Po9aWmX+r+teIOKdrXndZHSmOmRr
         24ndPRFujoC3AGY8MKe+JGp1xzGoCGbk2Me9b7wHSxtP0kwBly9u5zqrxijDMyPW/Olo
         18gejnSbXqVLoVcSVN+v32DwyfSgIcgOr+SjbWLkw/yT42ika1I8trMmwlYLGa7scSh9
         JJKQouekn/jvhQKAWWg+25Es0o3kSdhQpI5SaFYgUFL77ARs1U4pQObBJ9JBc6qASSw4
         qyK5SbNlEml2Dh8soAk9m0iHq6GoCQ+YXu0z5UeUPdvaXHJYn/oKGLEAqmT+BkWnVmd2
         jpOg==
X-Gm-Message-State: APuU4Z/ZgLa63DKe2L7CFWzZlt6dhfuAiApZNQHVe9H63I7kD2CGPrXr
	GJh/bL7WEPVjwTKilEackHnhU8FG5RWlUyRmmSsqwMBOrPloQi+iPGJM22LZHxrvwUw=
X-Gm-Gg: AYBFou3tUykRUwD+WKaCVN9SxXcjrRk6gj/Lcls+5qehzV46I/EEI1vgd94Zg8X9dbv
	RZalb4Hf7YcnTq3IL+3EEQQdtHm1NbG9XTzqPvwntIjNSBpeWwvp9gLAenfvkLlnDkgl42FpubM
	zcI0ymH4RieZfpX6DbJhllIp7cfm8fUfIGZVjI5+9esd469sjV9do9We+pP0Grk8ktAnslDF0xG
	S+vbz3SMEHI4Kd6ltpwnO+Mo7cueCx+yTB8FO96QyxXvVFGw4oiIoVgh17uMtiSaG1vhLpqcLC+
	P6vkye+nspsmDVBhBAb1wN5b0W+L6N2oajzjpg028Hk+u3BMODkLu2d1S+a+x0NhwF1woCI6Z++
	tLQ4HdR93wP+YTOE9sy0UhesUMgkyRggphR7u9hx+DasD8J6bjAC/jRBArWEGRCe9/lPzRM03zY
	CvRzqHpueZa2zle5uVedHDXcopioSCVAFHF43Z2pjpo64Hmdve8f8Z7y0f/FRg/j3QrGT73+i2H
	nJFQMBCEdKzjcih3HaZF8uez9f/kXlZUz1+AXDMcUM8k7wlFpCs0ibWVE5j899qyGIp6ndwtVyx
	1UOM+HveSGui7PYBHLgbskERvuKcNjST6DMVRvVELyECoC632tKHp5czEqxw613fnzQS/4NOUZ7
	g1DAWFHKCHwjH
X-Received: by 2002:a05:701b:4287:20b0:1a8:b566:80c2 with SMTP id a92af1059eb24-1ac5d889488mr19713490c88.17.1793716276188;
        Tue, 03 Nov 2026 06:31:16 -0800 (PST)
Received: from [192.168.1.106] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b23b847348sm9534779c88.4.2026.11.03.06.31.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 06:31:15 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: dlemoal@kernel.org, hch@lst.de, linux-block@vger.kernel.org, 
 shao.mingyin@zte.com.cn
Cc: linux-kernel@vger.kernel.org
In-Reply-To: <20261031221737569WQ3bg8y80Ht7JdTCWwlkL@zte.com.cn>
References: <20261031221737569WQ3bg8y80Ht7JdTCWwlkL@zte.com.cn>
Subject: Re: [PATCH] zloop: fix the error code in the blk_mq_alloc_disk
 message
Message-Id: <179371627516.3691261.2270107097490778251.b4-ty@b4>
Date: Tue, 03 Nov 2026 07:31:15 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Sat, 31 Oct 2026 22:17:37 +0800, shao.mingyin@zte.com.cn wrote:
> When blk_mq_alloc_disk() fails, "ret" still holds the zero returned by the
> preceding blk_mq_alloc_tag_set() call, so the error message always reports
> "err=0".  Save PTR_ERR(zlo->disk) in "ret" before printing it, like the
> blk_mq_alloc_tag_set() and add_disk() failure paths do.

Applied, thanks!

[1/1] zloop: fix the error code in the blk_mq_alloc_disk message
      commit: 703f6aee8d8d1cb6227af56169be6b1dc4d3c4d5

Best regards,
-- 
Jens Axboe



