Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793038400;
	b=ktLYs/fV4a0BSIlyPSL6pYzwAkHKYfcJn01nSSPqaJuMsZluwotaFr/lcef1bPSDBZP1
	 CFbq6Pj5PxBFMHEr6Yb+Cmo/f8FvKdpIkpFdAEMEp9NuwGiwJWZsQUL/tOpif3cnqsV5l
	 NnKlcoSpZfwEQzYFC51/6Qj+G0a+aLnaM4ys2umekDvDLj86VT2c1mbdNdgAYtsNhdTEL
	 A246Tlg58jf0e3gU1GsBDn8jG3AnSyn8gcl2UzdwNXPmXsp5ute0KMsTI14oO/tSJF5im
	 dkC5WZusbHc3QWKUBC63QCJ1LtrIDvLxVhZL1l9+/eTxIy1lrpSdvUFjRBracJNt/0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793038400;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:In-Reply-To:
	 References:Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=5chOq6U6GTtF4NKx2As2omT6eU7uon7QFz+o6vw3QJ0=;
	b=Dbs/15sCC1PxPy7vcxoSfAW3fpg9OBbNY9kDpHxr5QdlOEGItW4NguOUL15eKwZQQF98
	 gAPVhlJTkCwE1xpLAqQ/6oXtwpGen3UzP8+v9JnZp/DDpTA+qF5BYz10pVaiQGQ2AD8Sj
	 G4fzQ4w1d+hGZdzTscHx0vjS8v8C6OYTmss+jfA7xDpYZQ+/Zr2VqGGBgwNXVGoG0Cp+9
	 hVLMrpXzkhC5nyDKeSqQsV6AqevMbmTuTMvGV/fYQMerAJONVJJCQWW3hvbsrhPu9kvNR
	 GL/zzlDGx310i/nfDQr7p4QMSNGxK6lanPRHS4eVu8dLwAZPqr39JqHrOGipoFhwvbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=mlVKKmkk;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97364606A328
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 18:13:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97364606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=mlVKKmkk
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1931ff67a29so1465421c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1793038399; x=1793643199; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5chOq6U6GTtF4NKx2As2omT6eU7uon7QFz+o6vw3QJ0=;
        b=mlVKKmkk19RI0K3j73BG4MWLjg1vVMDB8Od3VPnrZUUyIwKJUQnUTL6pNA4sdn4onX
         ZMVDPT0s2FRij0qyjgkgEyYFQ7g5IpHXbdmlDhsJD6g5D4pXv7pmQ6X591+FdmTM2Mnq
         uHZ3SYxoV9L2QG+pysopFAi7/0jjaMB+RKDzThBzLFRwCmvPl2L8wL9V9x4TDMOoXO92
         iFO2i984iq3pj/dwC4vQ5y06DU5j2vgcm2ECWhgv9VqNZhsVcl/U0T/psSLrDsrOvtyC
         4Bm5PFSGHE/3eaKvPCi+XFsaFEVTjw9ngSpDxW7q8c8nQaVBn7qW5gLfqvyZUIcNnodP
         Eg4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793038399; x=1793643199;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5chOq6U6GTtF4NKx2As2omT6eU7uon7QFz+o6vw3QJ0=;
        b=uqrA7HxbS6DN0DKdooNfh/QuQTFfvWSaexMv8fW33R+ygXuuqcaD61AIF6aIEVeePG
         rMwnxS0ibyB8R3RnRidBQHwrIiLnVA1P9vVy/R13jlMu2xgu/G3dQqVMa+rTcLDgV3y2
         WhSW6Gah0pnYW8BCGgfIe3+XQj38BOsiRV7lwsIiMYxBHNicSRYTVtIc/j3caYCfTfb3
         V/wq26NlTYw45RbjrR9Uo7GbC3UiQQdLVkNa5Dvg5GC5GCsqD6BhJ1+TcZtOc+zOdFOn
         ZyHRvt2O0ezai9lQ7ERgh9jV9naUxQI2pBg/tuAS/tE7scLFTeSU6mORN5m8WhclqUKD
         S4Sg==
X-Gm-Message-State: AFq9FYLiFRvSUMWjkE9jHTWoCJmwuIg4snQ/iusUtvfpVqh9+SPwIIf1
	gF96BaGO0y1gjFZrhxW9cxZi2Tx6/ChEE41tcWNeWLFAR0J0wz67ZNQRo37/bcwHaKw=
X-Gm-Gg: AYBFou2rSI1hL2pmMXxeqyDXLRIXIOySsJ5XJvaUL3uEq/gMglcL8EgKcNx0jRgbbjq
	DQlFYexaRXPU4mBV67J8wfv6PscfdAaCNZ0ebCIoe8Dg4xBpJbwZnLa/1Ap9KIsPmH7OGxsOmRK
	N1QZ3DAV+fQj4zNF3aqbJaP9c2gacYlKMuRjcMwGVNVE3P40m8KrDgIVXTw/ToOmpJgT8hpXH8Q
	gMXWYGv+7zywUyw72hop9UDEmR1V28oGX1tuPv59zpKTmt726OZbrqlp+pDZ9QU9ptmAhIu8Kde
	7FSmZ/yRwNQK38pGzEvUtETR/FHu9ikJIaIb4VLMZlJ1r+WSP09toG8w2RTdlu/L2FHtfx/wZwI
	k391BhCFD1dJ8gHJ+ISwzE/vWcZyxZqW/6nLckqUKzXaUJfvJG4SI/LQ1mJ7cu66PeRBg7S6er1
	HRpzReYgjBnEKsD+/kPKyHGvGBZElGW0ebdha+/wXhn25wF/DjPzu1KN9WYAFJGKKUNdTO6IBYt
	5aF3+VhBe5YJp8IcIKubpaAfnfFFTt6Q0ZaSc1K8s9h9oVsbynxOnK2GKFDnVCzNlqf0KVcS+gb
	ocSwErhnO+ynuvCF6bQ4fUzS8HFoe8R6+HlVj1FhJbgjIYNZ8GEXzfRQKcco
X-Received: by 2002:a05:7022:7f12:b0:180:15be:1f9c with SMTP id a92af1059eb24-199361b4ecbmr10447007c88.30.1793038398534;
        Mon, 26 Oct 2026 11:13:18 -0700 (PDT)
Received: from [192.168.1.106] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1989ff2ee5asm23576455c88.8.2026.10.26.11.13.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 11:13:17 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: io-uring@vger.kernel.org, Yichong Chen <chenyichong@uniontech.com>
Cc: linux-kernel@vger.kernel.org, Stefan Metzmacher <metze@samba.org>
In-Reply-To: <20261023112209.87979-1-chenyichong@uniontech.com>
References: <20261023112209.87979-1-chenyichong@uniontech.com>
Subject: Re: [PATCH] io_uring/net: keep recvmsg buffer select length within
 MAX_RW_COUNT
Message-Id: <179303839763.792754.8466602423442934526.b4-ty@b4>
Date: Mon, 26 Oct 2026 12:13:17 -0600
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


On Fri, 23 Oct 2026 19:22:09 +0800, Yichong Chen wrote:
> io_recvmsg() takes the transfer length from the ring provided buffer when
> sqe->len is 0, and such a buffer can be up to 4G. min_ret is an int, so 2G
> or more makes it negative and the (ret < min_ret) block is skipped, and the
> oversized length reaches the socket layer unchanged: an empty socket then
> completes with 0 instead of arming poll, and a short read is reported as
> complete. Clamp the length to MAX_RW_COUNT, as io_recv() does.
> 
> [...]

Applied, thanks!

[1/1] io_uring/net: keep recvmsg buffer select length within MAX_RW_COUNT
      commit: 18d3f56eb6e6500a65d81cf265f0fe74fd9ecab6

Best regards,
-- 
Jens Axboe



