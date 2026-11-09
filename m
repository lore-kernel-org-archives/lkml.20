Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794260469;
	b=bEkogDYiWDTCEV5zmgxlsT+vJZqvQ+Z66B8U7SJYgYj255HYcC/qZY/OCd0UASfe/thA
	 7/NxSoqxgjTX7nKzUGE+8VzD5E6wUn24sMe7ChWqN1PSTpTDboyO1Pd/wFtvk5AyPf6jg
	 Mt6hrHklaI26vYBGecqU8AYcK158wP/PoAae/BJWDLzWy5D79w6plX0QesLAXvZPvt5MM
	 tuH38KrCMlfw1oKBsM273aYnA1QtQFY2J96MdBL0NL+XVCc0PoilMEwnK1smHB0rJrpDG
	 5Zzz3uh+fFZs+CS4d4ozHXXWtOhlzyela0bkeSGIYdIzwYNnCsxrD75rYGi69uVZBNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794260469;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=cQ9ZUrfagDvFzetYmGWZJ2gxXOJb5fLn+QoANv/Ytps=;
	b=oyR9ysAsFwtgRugwB8E5V9iuTVUlApHV+S8g7Pt2cCD07nscEJDq3PRGXQoqOV6HeZ3J
	 acauruafJskWF+N+ZOIQqLHqdmxMeSfzdkG/EZIvQLIb72UMuix/jExL9wQv7xN66awzn
	 uZgSUJEqWj0/WYYKbIqkNi79sJWYsfy3S2aYt+3+0yl8evMp5SiCpwl4SVg3sq2mFNxjv
	 FRUOp/iHnsmGklB+qzZ5MP5BdXBgDGTmRuHqvdQRcBiph99YXWk6CwN3kkXjllQkaT0E1
	 4/+IdjkU5cF/sMsOKnE4F0L01ynFXFEoyPgEYiBTRWmVvZrdbN/eC6MU3mtCqe0PsKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=jDHvccOQ;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B111606A326
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 21:41:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B111606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=jDHvccOQ
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3b0b3754f57so811496a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 13:41:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1794260468; x=1794865268; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cQ9ZUrfagDvFzetYmGWZJ2gxXOJb5fLn+QoANv/Ytps=;
        b=jDHvccOQJIQsCBpokaBPbumYKIu6HLyCFaxaJy/V9K/E0dRxsDmiDcTm9sIP514+FR
         TYbZJpaV36J1qjpm1Z3x6ku2i8HaNkmqbgbfDIdiTcF1voVk5PvEyZjfPN/1Vw1ioakV
         UB1hJjmBdQd6YBkdCwq7neGOc2Jvnj/dFGWkzTt7P/Lqayo8JuiOEGGECSj527TBlrj2
         Pwxrs7cwSwQD833dAytc3K2YnscwUFpEw2Or8Nc7JV4KeIS9eCcwXYpClDuxVqOBJcno
         t2DSqXQOfiJuHDBTXyOCbcJ/iM40cQAbym/LDGAIH4GcRvcki4k9tbZpjS92WKrE/hjO
         hilQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794260468; x=1794865268;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cQ9ZUrfagDvFzetYmGWZJ2gxXOJb5fLn+QoANv/Ytps=;
        b=Lx7N1k9rqeX0XyTvhceXAPv+Tsdy5a3zrqV8SWicLexlD7TuRS5U5tPW/PPTUAjuVO
         hhU+L0715j38kEUm7c4jPSN6qft7PUjLGifomDhp6b/5JxuR/irj2Rj1YtfpH4VdXAqA
         mDE8Ti4ZzKctgXx/2XwIyoth/dvSJPvpzB1dK9okMiG2/2m1x3GMbirM3aE8YsisPElZ
         hEVrIxuFGarNlww0MXORE8Jr4D/cA0KOESv0gcqP37dv0sve6yA7v5ohKqYB4T5/4SQn
         ZIJj/XXLfWv2lcdHHK9nrSRr/R/xB1/TUF7u6rkM5TNjKEEL91nghzO+9CNolVnqPtyP
         9wDw==
X-Forwarded-Encrypted: i=1; AL+hErHUSfko8OtnWSBx7ZMq4Xppc6t0hbu1jE3xjxecNp96rbwNfSRgBV7+4HmNeAz1FaJlp53rBMhQr8KIUjQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+L1PohHPtjhV3aRp27AmViniWHrT+xKHzEi7IPyLGL1zEhKhiQ
	CuhGPwOelrjg3pvGJjJYXwansJxDYa9TSpTehS/eghYDwvuZPEsQjXvAHjiMx39fPpY=
X-Gm-Gg: AYBFou1kX7lJgZ44rpy/QpAOukyGrGuIXbegdoXbQtZgtYaOQCdAtI8D2IBoI4ngDHG
	4/oI0F7spfqjv4E3U6d08eSfo8ZcR5x0dBKKvFj74Aqx4gxs28MPjogS4EoaXRiT7QspPdrGhe5
	7vp2QHC0Pfgc8OG9NV+IqJt4WcgUuotRKMd5CrVPmrs++9nLrds/+ulgztzmrcBO6sl/7acMff0
	f6nvhNgeA/fMtQSnNSp8mQkSpKyVqbnlnWe4JBj2aZpCJqysH/9eSoEyrSx9FI4h7HLkeFcBP+i
	9Mpc0l/lvuloYfRX7M89TC+p5lfhAdi8Wt/cUpzmNdKOsC3Scx44BNZEluIU9DCrIrA/OJPvByp
	6OlrU2mZExyYTfzghTx+9sPBAlE39qpyA8XFexYqSozaLOeXs544Ged6QqlJLIecwSGD+8IVXxA
	cyAQ/6ExElmdMg6TLWHzO1+ncu1Glmed5mB5q6BDc3qsFSRuYeenXvOSrJdYTTj7JQXqBzwu5cR
	ggY6+U29Ktg8uDLeQyUz6293OMALs9lIH1N11W4oxytvYlEKVgYSfYBmeA+Q1FrvP8I5KCFoH0m
	WMoqHaijpx4AW+nG6FZM+ugFW4m2i+MCnWv/aIK8TeaHjLuPmHzcCq++t3SteUab9fOJHwFrBzo
	yF0GdHpMS2Czl
X-Received: by 2002:a17:90a:ec8c:b0:3ac:6e91:3f22 with SMTP id 98e67ed59e1d1-3b166d273ddmr680652a91.52.1794260468210;
        Mon, 09 Nov 2026 13:41:08 -0800 (PST)
Received: from [192.168.1.106] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16903a7fasm366974a91.3.2026.11.09.13.41.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 13:41:06 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: Ming Lei <tom.leiming@gmail.com>, Mark Korenberg <socketpair@gmail.com>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ming Lei <ming.lei@redhat.com>
In-Reply-To: <20261105-ublk-del-gendisk-hang-v1-0-913a91a4314d@gmail.com>
References: <20261105-ublk-del-gendisk-hang-v1-0-913a91a4314d@gmail.com>
Subject: Re: [PATCH 0/2] ublk: don't let one stuck device block control of
 all ublk devices
Message-Id: <179426046567.144457.17637297692373243844.b4-ty@b4>
Date: Mon, 09 Nov 2026 14:41:05 -0700
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


On Thu, 05 Nov 2026 00:25:04 +0500, Mark Korenberg wrote:
> If the filesystem on a ublk device is stuck, removing that device
> blocks in del_gendisk(), which syncs the filesystem. DEL_DEV holds the
> global ublk_ctl_mutex across the removal, so ADD_DEV and DEL_DEV of
> every other ublk device hang too, until reboot. It doesn't matter
> whether the server is alive: when it dies, the release work does the
> same syncing del_gendisk() under ub->mutex, and DEL_DEV waits for
> ub->mutex holding ublk_ctl_mutex.
> 
> [...]

Applied, thanks!

[1/2] ublk: publish a new device by its id only once it is set up
      commit: e5c463e5074a940c644d54d8fc29aba06709aab0
[2/2] ublk: don't take ublk_ctl_mutex in DEL_DEV
      commit: 8067050e7226844fb32062b5cea947e5897d3d7e

Best regards,
-- 
Jens Axboe



