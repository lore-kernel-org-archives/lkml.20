Received: from mail-oo2-f43.google.com (mail-oo2-f43.google.com [74.125.231.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 672FE390200
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 14:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790865804; cv=none; b=agrsFggnzwTJPF1+JekuEGZQWMKmW0YLkRsnuJLkQkZy21MV6x24/yJeEmVOCPRNoUv+F15HD/88+DGNQK3xYaaukdkXfPMLUIv88kzJZP4OGnm5IDwI5xqJy1MFszoQKzbi8JXIf8nJ2qXwZTx6/TeDoae4YZMQ1Xc1JbVn6zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790865804; c=relaxed/simple;
	bh=imrVUawR1eKtd8GNE/AxSxjOpRarsJnPM0QXhNPZMvE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=BWep497V8FwxFfwE09Jor/sGEjfSRdm3CKlt6YYoc1EW1YU0zhpaGJogDjvokW2NJdz6Jgbs20fXr4w+KUcXtvoMePwjEEdPKxBZr+sY8utDWG0Inm28VvSBTph+hhf0h7sahDtDxdaLO4OoU3VqP/sbXgTK1CqEEJmkQIcJjnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=pVhsNiZ6; arc=none smtp.client-ip=74.125.231.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="pVhsNiZ6"
Received: by mail-oo2-f43.google.com with SMTP id 006d021491bc7-6de79721a68so291355eaf.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 07:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1790865800; x=1791470600; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+sbPL55wTIqO8bNPiIrPwwY9E0RZDu93hDz3n1r/ZQE=;
        b=pVhsNiZ6lKbo/vOJF7rZKHqa5huYuprJ4SMya0U2WZbJkqFWmLCP5Z4PJ4zLP0nxlN
         m1Fq56HYHKTP75RewElbBQbd8Sl1kHfRDUzIxltcsoEyGFS4DZ4WIpzoY+wVWiVMn0qx
         Jg0vUQ4jvbUV6NQBW6Dq48haGGdrhhMrd0U3bwrkQuhY7Ap37gHkoR2Qs/JGxnosCUox
         OrJNwqMM8o7B/mHTBHQdi4D5Iwk4CQRvYYux7RKDrsUWu7LE4VMuabsdZXzVf3KcVPXf
         N3+LGulJSeE5pU5FsLHSMP3lC4PiwztO7ztkvwRs5Phhn8wHbGddIZ6nqqCydMZC469Y
         KybA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790865800; x=1791470600;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+sbPL55wTIqO8bNPiIrPwwY9E0RZDu93hDz3n1r/ZQE=;
        b=PM1OYQzQNwiFqe0QZpaJH5CqfHsRFC1IgeJRd/gyyGn+RLWjQRzttiACcqyPYo9NlM
         sTqU/E9Ji0IHXI7e94E37rK0qn9OO+cOGdEJaPFogOz1RMyg0DCXfFCr+ffh2UeTpXv3
         cfTHK926rF497pXnigRV0OxQ5oEQLtMc89VwZuVbUaCCdEv6zHy6mf2izngexrNfvOW0
         i3+RDRhTomrmlmmTy30JK5DCTW5OlcWogdIs1GmFM2MByl/E42kESPyY4fmnAjo1+/PA
         u12qLP+neHxP+zItU4kJoy+IRoCioDcb49vCqfsItmhvNY6Uclw2shxeetnT+kS7NOaF
         fiaw==
X-Forwarded-Encrypted: i=1; AKwUvBwdRtdox1wmQ8LZ91czu8plwEK0yyVz/y5efzem6D+9+XbmI2FLzsl0f3iNZag0Ap7DClzKhOLwyjVxRCs=@vger.kernel.org
X-Gm-Message-State: AFuF++koqDjH/421AgRKy9nDh9jeikZ07unyebNoRhlKkygbfZOJq60N
	3E1G4Eo6u2EVtxIQt0pRnpjE3z6yFdRgLY5ybFKTj45NS6FJR/KFQuR8HVGFcsTVN/c=
X-Gm-Gg: AYBFou3Q4/+8YZsCk0KTlqZIZY3ROjttnyFBsGe2X3Bl0qSaN6R89jFf1EbQcYZRlyU
	nWtE2RLKV6OFimmMatwUWbOugrbxh2JYtOM8KgfknooQUOQEgCVXrHrrv90iCvBD2589+KvMdaF
	JRh++9bBkhATfZMx+mX2tWtnSAVIm71qkFNZ5Fk4RqtAhYKLWQI7UezbiBxdor322WNuJMlwWZS
	MoNxtGlCxHlKlWdMA2mWcSFC/6oG2gLKFhT9se6J/hrOlgwrMtUfwIIYfzvM7IKVnl31H7tsXzk
	0KQUFDol0BGUnXvEiBvBlSMxkMk3xc7n28gggKaDXLpi7FVokCtdxQOdg/PU3s/3b411IjcgCVJ
	vHcLr5uuJG0pF8Xq/zV1AluXeOkWN99gJxpPXejqc4W1weJ9QzxV7ixJJWJlDAS22RJu/FRP6AP
	x1MGbW2YIdGZdTWbFPnUCbEK3nM6HQZqNDE/rjQaCLSSx24e98jTzbF3WxTp9vL6rYhP5yvcWRU
	6ct5gstPuQfH/y+mN09sb26tVBHDNPpu2XGvpnje+IamsOg/7bIP6j+
X-Received: by 2002:a05:6820:160b:b0:6cd:3fbd:1d6f with SMTP id 006d021491bc7-6dcf6a1e65amr5051551eaf.89.1790865799651;
        Thu, 01 Oct 2026 07:43:19 -0700 (PDT)
Received: from [192.168.2.38] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-49ded14d8a0sm2638009fac.5.2026.10.01.07.43.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 07:43:19 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Ming Lei <tom.leiming@gmail.com>, Qiliang Yuan <odys.yuan@gmail.com>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261001-bug-ublk-no-sched-by-default-v1-1-0bc91b6f075e@gmail.com>
References: <20261001-bug-ublk-no-sched-by-default-v1-1-0bc91b6f075e@gmail.com>
Subject: Re: [PATCH] ublk: don't use an I/O scheduler by default
Message-Id: <179086579879.1687323.14512869819818088081.b4-ty@b4>
Date: Thu, 01 Oct 2026 08:43:18 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Thu, 01 Oct 2026 11:10:40 +0800, Qiliang Yuan wrote:
> Requests of a ublk device are handed to the ublk server through
> io_uring, and the server does its own queueing and ordering, so an I/O
> scheduler in front of the device only adds overhead. A single-queue
> ublk device still gets mq-deadline by default, which costs throughput
> on every I/O and an elevator setup on every START_DEV.
> 
> Set BLK_MQ_F_NO_SCHED_BY_DEFAULT so that add_disk() selects "none", as
> loop does since commit 2112f5c1330a ("loop: Select I/O scheduler 'none'
> from inside add_disk()"). Doing it in the kernel also avoids switching
> the scheduler from user space after the device has been added, which
> waits for RCU grace periods. A scheduler can still be selected through
> sysfs. Zoned ublk devices don't need mq-deadline either, zone write
> plugging serializes writes per zone in the block layer since
> commit fde02699c242 ("block: mq-deadline: Remove support for zone write
> locking").
> 
> [...]

Applied, thanks!

[1/1] ublk: don't use an I/O scheduler by default
      commit: 2b8ee88f18d410cfcda0380ad45a0b67b11dec03

Best regards,
-- 
Jens Axboe



