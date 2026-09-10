Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 048DE46C833
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 15:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789053531; cv=none; b=E4joRRTU0sNuiyej5AyeMbBeY7F5Uutcc7PaGFDM+Cvq16Wv02e9jyrtccHryR6txpYEF087vkMouot2Etipea2DqTYZo+WEM/GIP5q85FeINt3ZWzWxLefgXv6ecbryPfceO+52i2/V/zRsbxONQNwCi1y3SWasUTypy2hSj9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789053531; c=relaxed/simple;
	bh=nmlVxuCmJvwgWzZmLtvEnd6MUk27wZGVvMDVW+s6btM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=urJWtCT574PyVA5WaM7HGL3KcqphaWu9Swv9N4QsuwdCeCLEds8bCmEX4wrabubpKrIQGpBmSiCFyUNmZNajcyjaGZ6TWAid9LfrjR8DWmfoHL1PmsEUWZfOqZDJcpDMljLQjdLviNED4NzA9mTxgxS19fofRamP3MY6sqkD2dQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=mriNDERv; arc=none smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="mriNDERv"
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4c0766cbe64so981859b6e.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 08:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1789053525; x=1789658325; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i5FCwCz8I5I3vnms5aLJ0rTuKe9JHgwTVrTlpHQrQos=;
        b=mriNDERvuhBpRVL+3ruZSUxk255Sh6HuqlsnslwAKAsFkNXfguA5YKtnQAqkk9yp0x
         +n4xsuwo+nMijfPvvlq2saMlJkXJaGWBa7pySsYEwslvOkfFKlcWETDmlFC2t/T1haUv
         ZEsX0jUYoPPTz+0NeVJwmBP+fWl2GzXLBRiZZtqJZOiQYto+SVBak8WVTOlysVwuubb0
         +xczuabAA/yv4P5zlt4kT4flBMJywK/3QPN5/McJb7Deyk4H9uAhrYjqka7BHiaiyBeq
         I5MKx/ZQm1E7X7zXM0z/qW4PRqNLtZ/9QV8AhPez5WrysU+hmY+vs7yw4mmKy3ij3ata
         NhLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789053525; x=1789658325;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i5FCwCz8I5I3vnms5aLJ0rTuKe9JHgwTVrTlpHQrQos=;
        b=sA6/zWIIbKN2QmeEeHdsvYDSAc/27IKsM3J0AZ3SczmcMGm5P/PPNsFEVvd+UTV+n3
         62CCb8aCqgus0VJ/4aRFcqbZjXSHSo8GNKnfc3nxiwHViBCjujqZxlE9cwckkQotUjtG
         wz7WYxVYz6tNrqDCyVPbmbosBw3LGUyXCPrKsOA/tLk4N0Vtm0394ZnK75V6cJ6YhOlx
         3AM6fhWV+8K5tF5XiH1DhzafFYDOIkbYqJV2bH//QeW2K6O6K64P+uKLU4XQt+Rpp9Qc
         SXCRz+PplPmMhhTnn+D4DQWyZHEuXIs1IlevtBs6qlsI9T49KRFMK9xa8EV5XvO/1DdI
         Y2Ew==
X-Forwarded-Encrypted: i=1; AKwUvByg/tw0Ah+EBKBrgeri02os2cy/uXkqJNoITThRBzh7ybMP8pQUwhEAQjAxmY/G9ZHWshHhUqTKylRaZPM=@vger.kernel.org
X-Gm-Message-State: AFuF++na8cw6o9XmXEU9+leDdBAYgde+KsNz1MLPCMyYr6RS5EgOkaHP
	fdF8/kI1t3NB4BhkMNDa75Ty7yXwXRZoHZJCzTbChXW/ye/nOe6XuUy+htrrJLtkjIfBtpZy5/c
	9Bl4FAdk=
X-Gm-Gg: AYBFou0uEDlE67d7Cl9FtCLBGvMTqiXCyfx86PFOZUy7ILthF/7g4D18174hcO/rlEZ
	YhCNSvZ+gd7OAjIlUdzanJvebUpQVKlSelPU0BmHhPjYKxVY5XOlFvPPV1eYmYZeQfFMdfMwiW/
	hCWeIDJaeYVflqrRpWOj/sc7cIgEH3r8U23psIh621Oj/voXO7UbC5oxNMw3V9rP8YTfe7wxv6H
	XZgRUyBypAdQcCBnlFB2eiXkNZzuMX6HEU0bU4ei5+lngEchzUl+FTtOcR4xQYZrZZHSIB9h4+1
	d0oYsJAObb8qWGx+Bp55+esk3xmtTcsMd8eJgQkUQJV736Zyot8CzNVZ+WOnoGJ6WRG640R70Ku
	t26/2HIEnlKkckcK5nkoljt/kY9B3pLAsB/58r2hvc66BwrcyN4/SrsiPTf2jslCBPyg7JCUHnC
	oUsvknHUkQG9xUNMBRqIsZAsnE7K0s4PIpA1c3ZLST+L4YwghrsJjBDGHG6Lzo+6XeSDBGU6JdP
	uvHzwRFkRN5NudkM+5q7p7KQWP2VYJNOwHwzcKMz3Rd5zh62tg=
X-Received: by 2002:a05:6808:30a4:b0:495:eb86:6e8f with SMTP id 5614622812f47-4c142e28f2dmr9206435b6e.14.1789053525074;
        Thu, 10 Sep 2026 08:18:45 -0700 (PDT)
Received: from [127.0.0.1] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b970d1cf26sm19089338b6e.4.2026.09.10.08.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 08:18:44 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Caleb Sander Mateos <csander@purestorage.com>
Cc: sashiko-bot@kernel.org, io-uring@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260902210200.2336720-1-csander@purestorage.com>
References: <20260902210200.2336720-1-csander@purestorage.com>
Subject: Re: [PATCH] io_uring/rw: keep CQE flags on iopoll requests when
 adding kbuf flags
Message-Id: <178905352403.347131.15633574006083255030.b4-ty@b4>
Date: Thu, 10 Sep 2026 09:18:44 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Wed, 02 Sep 2026 15:01:59 -0600, Caleb Sander Mateos wrote:
> io_do_iopoll() assigns the result of io_put_kbuf() to the request's CQE
> flags upon completion. This overwrites any CQE flags that may have been
> set by the opcode-specific layer. (For example, if __io_uring_cmd_done()
> had set IORING_CQE_F_32, it would be cleared.) Switch the = to an |= so
> the kbuf flags are added to the existing CQE flags rather than replacing
> them. io_req_rw_complete() does the same with the io_put_kbuf() result.
> 
> [...]

Applied, thanks!

[1/1] io_uring/rw: keep CQE flags on iopoll requests when adding kbuf flags
      (no commit info)

Best regards,
-- 
Jens Axboe



