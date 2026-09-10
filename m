Received: from mail-oo2-f43.google.com (mail-oo2-f43.google.com [74.125.231.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 398F63C37B3
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 20:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789073731; cv=none; b=dEo0A8ofaK571rzbH6O/k6/nhiC4qFB+NVa47N64XAqqEq14y3z37RgWNCCexKK7EkYij5zK33u4i1MStDtAtp13EQ+o+iYrwjWEpuU76gOiHQFPnG5qMO7lO2VILTn2HpvRQtSKZfqodS79HIIRiKSfwX7vm8Cmwiv/dUgueTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789073731; c=relaxed/simple;
	bh=Fv3RXwZqn495cmiP5raleJQljDMbicO0SAG8ncGK+vE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=juoBEEes9BWYpORiZfhKsvYC5f9VBW11ndW4KDEzvEgdpA7ZZeCJmm0ssT3wjPvd+chdCuwGs/qwwFb/ysh86+SlFn4zCJH8TD+OgeSbs84xCbowsCPaUHRy68P2Bvcg4h4QDjSyRPc1awj4yQKNPk/pOsRwTdIYhFcPrvOUheU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=A8NUqVSN; arc=none smtp.client-ip=74.125.231.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="A8NUqVSN"
Received: by mail-oo2-f43.google.com with SMTP id 46e09a7af769-7f65ebea805so143716a34.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1789073727; x=1789678527; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ByTA2lPgAWA1USbCn0cljtTYE5VkX9SiQfJb08kxXuo=;
        b=A8NUqVSNyCFkg1me5LtwdgVXWPC4Vi+Bj5Q7ilEHrvaL+3qa/Q3m4l3DQ+pWbQgYq5
         C++tCPxe2VgSxnRA+A7FfBH/fkOGZLqq0v0X7T+X+KB198mdoAdiQKZaMslOAEqIDGLy
         DyfnGhvQ0ndVxJGXhSIunSMNrNjF1n7zUoi8bgRuDaMn+sBrCnMy8f9+c12ZcVxfYRJW
         k29zF8x4TxpVqKFw3JOyNVaUO/N8UzaQKOrzcaK2TuT62WXU6j+geFd3K+G85GreBIt/
         bVxhfudPgDXC5IE7QMUomMyJcYa8qhjl98LFp5wjbLVq6QzIap8cT0kcIJHRazZPRpSb
         Qe5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789073727; x=1789678527;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ByTA2lPgAWA1USbCn0cljtTYE5VkX9SiQfJb08kxXuo=;
        b=rS/3Y9OVV4zHKDMYKNhqblX5xpjfA3CjwJgute7Ov+BhKXKbgFIm59LPSJr3pPgdIy
         NBh+3Qct3qAIuIXuFxfvjSxUncTHK/9Z4ue+objWAEl/J1w+mFAgOoXBCCuLv3CX6vsk
         2yaZoYUpzUxAQKuIM+r2pvJ6kotN2Ci9wjkT4Q6YfFs9YmGTijYKWwBrWkEmVMIfzB+6
         0eNRfDGpQLeGaRmEHq6ujUQvchOspa3wXl90lSLoOLBA7skrfPBtYnEEQw7/Z975L/Im
         qZpkGsDi04R296H/fQ3a391HoKguulNu4hmyAbDrRdzSoaHewvrtCgkD42N8SLA5EuRz
         YjMQ==
X-Forwarded-Encrypted: i=1; AKwUvBy/Kmhb34om+93U0rjCKxZSgWtLaGRy66iH6P+kE/m0MSzCAW9BFYBT5oyjfT23LLaPDzkYNsUhNqoPM18=@vger.kernel.org
X-Gm-Message-State: AFuF++m/xgwcgPQXwSDBzhtIQPOk2c7h9BXn/hFK8Ij0h7hi/L7n2cHv
	0vtXpZTeZKMHcGUYEDru/4iExArsg/+BpkDyC3maSedNbNiPkXVZJCK+P/wo7H3mpdY=
X-Gm-Gg: AYBFou227P04QZ3F4p6qJrvzEh05phrzEIlkxpqVYXRSAxsJxc+Pkj7nTB9ZaL7kQCd
	RRrZsxLzrO79TpkTi7UnzvBD8dCA15s99dFVjrCoUcWICuVg/39FXCOOTfdfis5ib1Ibroy568h
	3b13abAKIqg3v3VbfaVfCDUHy8/q/smd6bxYhn4vRRzQa7NGJRVH11AkYe+jQOQiqnGCyJMYiM2
	BNC89im/GkpHtCcG66HZxtLCbaRysJfWss/RU8pR7arXYbz/MaWoKHcuEjETCDL/I14AGwy67Cb
	A9U3bbGZ0Aufy3+hpRzuDut7Gau46u0vGLZedMAa6bD8039vSiDDpUO4FeJ8HRHhWRrwN9D2BRz
	Qo9mxvktYzynoaxYivzjGNnDsDAaYBKMSi1JRmGtAtQ4mPJA1L2DYl3xrC7CJ+HVSeO1+5y0C4O
	ZPgRNEu+m57Xh8R1zURm36/RY4c/VJXczF+G+xL0KjkfZjEVrry0vioBRw8gIlFfWJnkIHwDtpD
	kOYPDb3W7brhLcoAhAevNFfT4POWhYKhKDak9pEt2L3PqYSY0E=
X-Received: by 2002:a05:6830:3746:b0:7f4:d16e:45f9 with SMTP id 46e09a7af769-803fd138783mr996256a34.7.1789073726792;
        Thu, 10 Sep 2026 13:55:26 -0700 (PDT)
Received: from [127.0.0.1] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-803f60fe54asm635779a34.15.2026.09.10.13.55.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 13:55:26 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: linux-kselftest@vger.kernel.org, Mahmoud Nagy Adam <mngyadam@amazon.de>
Cc: Ming Lei <tom.leiming@gmail.com>, Shuah Khan <shuah@kernel.org>, 
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260909132602.68852-2-mngyadam@amazon.de>
References: <20260909132602.68852-2-mngyadam@amazon.de>
Subject: Re: [PATCH] selftests: ublk: install test_common.sh and trace/
 scripts
Message-Id: <178907372584.484803.15302806925021302928.b4-ty@b4>
Date: Thu, 10 Sep 2026 14:55:25 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Wed, 09 Sep 2026 15:26:03 +0200, Mahmoud Nagy Adam wrote:
> Every ublk test script sources test_common.sh from its own directory:
> 
>     . "$(cd "$(dirname "$0")" && pwd)"/test_common.sh
> 
> and test_generic_02/12 additionally run bpftrace against the scripts in
> trace/. Neither test_common.sh nor trace/ is listed in TEST_FILES, so
> "make install" does not copy them into the install directory and every
> ublk test fails when run from there:
> 
> [...]

Applied, thanks!

[1/1] selftests: ublk: install test_common.sh and trace/ scripts
      commit: c4fa55f85c47cd5d54d717fb8170746edb10292e

Best regards,
-- 
Jens Axboe



