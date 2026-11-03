Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793716295;
	b=vSeblJ/zc1hhqsdX1dqgbE0yEZjKydsHZcldpYyaEaP/A0FrTql2SuDav2sGZPSYHbyI
	 xuU7rIK6oUopHGiafWtz+KRCeCUDqjpisRg4QYepYQOYmCn5xvKUrZkNWPa3LSCxb+qIq
	 EyYekkXctokywkWPEPWuSNl5bxsGu7kDPwGddSoiI/4f5rENCUWMQtsAJAmZvtTEmFAhM
	 lD68qokRHwY5ETR9xAHVd2DFDUk68qBgUARJZAOdfENiNxdh56itSDSiQLOXsZUAL3LFL
	 +UD/2Tj6Pm9GrXKuzHj4XewKGAd9+OqxlsNJ+NDGn0Q8YZP8O+M2pnTgmr0LS7CJM9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793716295;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=KXzabl41ZeEnGrVAYqexhOU2oRggUUYi90hmQPge7Yw=;
	b=Utzq/1XwftgwQQ7hJ4ee0xchXVWLyai0lGtkrFduNDrCVnBiAGDWrbFyRFMOXdACSmwl
	 OOB7Tv/aMq48ywn6kUhjIgrz152w4VW3CJdXW6bztFu9apVGL+oGb1xNJLf8WllEIbAMA
	 /uGNAoVdD5O5bd0H53QZmep6jvXqJtoEXxkQdnzBa/ncYLBNiC9qj+TyFuvVU0SHN0kkW
	 JUc4x1IaJXtHkmTS9Bvq1x1pqdpEIu6DQZq0/6qXxHDw0NxHZJINBeAb+zB18TtgyTD8S
	 QPs2lETX2nb2PHvOt4Y0wgqTXCUKWy/Ls4BAYltcrcLIlfDI1IsfpzC1/Es1CpUEffQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=gCUl3iG4;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17A6F60850A9
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 14:31:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17A6F60850A9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=gCUl3iG4
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1a8cc11ac42so4165690c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 06:31:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1793716294; x=1794321094; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KXzabl41ZeEnGrVAYqexhOU2oRggUUYi90hmQPge7Yw=;
        b=gCUl3iG4R2jpywA1QQ9kJt+qOfE9h0zR8pM3mDaJcggKmtXx55bVra4P/CXDOGGj+/
         imZ08kKIS3RRKi4i1kr6kpejvmVS50Y3yR7/XTpaS5JuhBBEOCyp9/9i1kYWs6MdYrQl
         yLtTf3MHm9JQIo5zKXozqctrL9NL0pQ0pByG+gszIzL96BPuMiiHKfpG4l1yVo3qHknC
         ivAQ90QDSnWP+Xtrq1eQL0PFOdlXaogQ4drK57lZtwum7/hFDE05T7pd4xyEf/U46DKW
         LFl6oY2hd54Rfff9+G6Poc53Z5yB7GGzRMUmBl8axg/ufh8NqvuvLVva++p1tJA/A3o0
         obPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793716294; x=1794321094;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KXzabl41ZeEnGrVAYqexhOU2oRggUUYi90hmQPge7Yw=;
        b=NEPnGSOQNtjEYT8Gfg1u3IkhWGMhBp4PbUdTyecerawne5kcC58M2wY30yWw/YFNVG
         +I9sxGSU1nKi4L/7NWKzof+/rB4L3CRg9TcL6yRLkBLc0EKpU0ULDcrBYdN3lJ+eGyEv
         vJlI+b+GCEyvL6Zz7LmflH3jlFS70zKdxCn1OcxLVkkA8wqp3bkMdLOszJ9gplUBvGqx
         P7eJYwncoGIFnEZU78yCjiuiFN/vWKUhq25HKJI3yiijfgniy+TQXALKF4YaVBoEyoh/
         KZoPtjGXQyxBjbSQYDvIPL4uTI/ntEp/n9n/0sxzzwsxrei5JKGTI4xatGop+VCZHAu3
         LnVg==
X-Forwarded-Encrypted: i=1; AKwUvBxQadny/eb55PN5zWozisETLrPaxEEsH9321bdU1kPsXH/txhE7+A7c1hdcjd/TOjQBphQjClaltA7R0mQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+gqO+ho2WYTfccfe7spIvvXge1an5B9ef5ce8Zg/4Q803cGaTz
	uAzyyuUCwIxht6dgOV5szyj9G1HUCPkiuUG2wr/mKeXI1dHECRxtB1KlI7nF/c9C57s+p+QAuPa
	IimRhiuw=
X-Gm-Gg: AYBFou1dqTwqWYAvKBy5oa/fcxuEPi4lw055W6MskKTN5D387zeKNdYo1vPcIvVSohh
	YkWdBKvLS3Mi5eJAH/5a4984TdgvzN5cJXd82U9+icv7xN5EIjFPbhVTFk9P6+MnAf/OmIaqWa0
	OifI0FrAqSdZlJJPdv/nthEnU2i8a2yANpR84s75eWQiHEXUMC+L5EofDy5KxpMWH1fndCNK5O5
	u5YEwJCMmkRQGYe4Qod5AbDvd/2DJzKjRNsWJPKS46C/DjpiHrxQOEzmNwmwUcJrU5C5KJ3co89
	d83hHBBymB0uIuSAuV/9vrRk0oT17y4542cF6hY7veJSdBkmi5/XsSArjHp8fqrB8zrDcyjGj2k
	Ksb4xPvb2qy430KecJ3ctXd0+9wLcMLvX6cZBwgxnHF+eLWjiLlyv1kZEeoFyN2ox03+4pURR51
	2dHMB226NU2eRx7SK2zGuxXOSsfMj40x0kNYoUSejAAwKBR+6XW6NqQA/rX9iW3y6Xt8YikCiT0
	t9pCjAChMF2MqsXb6qPcK7P5mMCZB5ua4HqDb7cGoY4qLYJ8Kq6n4AWok/tt/rqpgkiL1mfIU8/
	21khFmNAgFmyPs838H2RD7XthrpHYci6Ba9RvPyUC0kK6hOW8P9yPKED/ZL3Imq29SY0rg3R88G
	J6vf7qiAAHl6w
X-Received: by 2002:a05:7022:eb44:10b0:186:5b49:90d8 with SMTP id a92af1059eb24-1ac5782fd31mr21082249c88.4.1793716294128;
        Tue, 03 Nov 2026 06:31:34 -0800 (PST)
Received: from [192.168.1.106] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b23b847348sm9534779c88.4.2026.11.03.06.31.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 06:31:33 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: tj@kernel.org, josef@toxicpanda.com, Zhe Liu <liuzhe1@kylinos.cn>
Cc: cgroups@vger.kernel.org, linux-block@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
In-Reply-To: <20261102061802.408173-1-liuzhe1@kylinos.cn>
References: <20261102061802.408173-1-liuzhe1@kylinos.cn>
Subject: Re: [PATCH v2] blk-iocost: account flush sequence latency only
 once
Message-Id: <179371629271.3691261.11171025306527479565.b4-ty@b4>
Date: Tue, 03 Nov 2026 07:31:32 -0700
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


On Mon, 02 Nov 2026 14:18:02 +0800, Zhe Liu wrote:
> A flush sequence with a DATA phase can complete its original request
> twice. Both completions invoke ioc_rqos_done(), causing the request to
> contribute two latency samples and adding the same queue wait time
> twice. This gives such requests disproportionate weight compared to
> ordinary writes, distorting the device-wide latency and queue wait
> feedback used to adjust iocost's virtual time rate.
> 
> [...]

Applied, thanks!

[1/1] blk-iocost: account flush sequence latency only once
      commit: e9804489e27dd6e33aec5511fe3780ff3009f57f

Best regards,
-- 
Jens Axboe



