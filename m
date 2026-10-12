Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CC2E3033EC
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 18:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791831080; cv=none; b=M9VHnqZEo2lB8xQIv2wwAOOza9jyk84TEzg7PP9dFgl8P3U9xmqrjfVtJkrv/PeQsE2eynVaZwxrdgFtiydUm7NG0glkiNTQ3uxnzErJ3tXOf/m1BsoET2l+dvg6H+3SfTc0QcTtOV2XLTtL0OHwqM4p1P0Kc5aflq+jaZjasQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791831080; c=relaxed/simple;
	bh=8mK/2QEUVVgC/6SIjsn5gSOcjpiYDhr0wY9DKzdO1Z4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=LCnA5IVuDhjao9TUV8nKb6vJ2XknNBiRPE4x3Xso+BiXGo+oMOHIGuWllgDGPvtc0jnfmb8qauxtu6sjD/dV/X/mWgvf6CpY/1uBi00yfLQRRA3jqgx8S1a4DULpbaT9klGkli30aeolWSdwxExBdN+7ig4qNGXFl38doPmR/HU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=J2uA/vPZ; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="J2uA/vPZ"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-35b647aac23so654830eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 11:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1791831077; x=1792435877; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AWMMWMvOn9l0Ln0vvnUcFHP4wKSdIdXYASt3zibxoLw=;
        b=J2uA/vPZBASdR/HSe/mHu1uf9Rnmw59p8wQYIB9lla2V+XpqBn1Skd4aWc6RfHv9gy
         BvxOV0Ad8OlSercDFS6TlxXsP/CD9BTWwRlx6ujgpvpMgSGveDBu/r/HUHyCbVruSkbo
         yG22h1SV+09JbrTw9rjzozLt1dZDtUAtBeswV4kN6tsdmJJuOKaWRwtoJkFYiWoxohoC
         QP8JGk8COs8dX+9ELs0xIBsvkQwFCGxwl6x84HR1T8klRRxPQX/Wl+4GRqdFJiYHDyDz
         60I7aFZot5ZrtHB7AKfXWwudnVocv1sAMFDgSfI9v65xsMdTlyRC5mrdSs+wdlDdb/gh
         BUZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791831077; x=1792435877;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AWMMWMvOn9l0Ln0vvnUcFHP4wKSdIdXYASt3zibxoLw=;
        b=vEmJVFGa8u6oEPJmcQxxZ0nLmsM1xQHvFXuZxrV9o/4YfrOWPVEiC6PXQaDbP5uP/d
         aMpXa2tL8/tMI3jPfpSmc5X+zXlEodTH8jFFeJnA/YR3Bp+Eo0/CKyVJRTUHp4nezjnY
         +K5obwEtWsq47L0mcCDbPhjh7bV0JnKNVP0JqrryeXj28MK+6PF6bPm+E3NXwHb15rDh
         Y+aH8HwxPIsXtax0EHCQKwx6jtLryxMMx0f/bXcWXIc0auq+AO/G51f5R9lKhZ/SXWc7
         B2q8nM9cuzySboj9Pmn3iTkEQZyX1eoiE7lPU0btV26pDVbHDvrMe/cqqxQ1jg6OSm9h
         CMwg==
X-Forwarded-Encrypted: i=1; AKwUvBxnf7lntx9Mst46zoOz5Q+HY3zH+x7dDIrMe0KKxFI6+HiluiCGBHAou8ftxC2ZXM/Fcox1fuoYzXJ1+kM=@vger.kernel.org
X-Gm-Message-State: AFq9FYK7H9ZF5QNrEh09xCta3QtvA5ABLMnXdb7XkHfxp3vxHB5Nxkvc
	Le+FL61087SNRfnowBB5rtJvT6IPM5cmqyjmXY5kfw8WM9Jtpft290kS2IfMCEpjSF0=
X-Gm-Gg: AYBFou3RvpODV9LjF43XW1E1S6zhtMJzfjNpjJhJV9XsRmbOeWBgVRUfxq0dz1vQZDk
	MdxnBwzrxInSquzS6iQxzNTXtKAY5vkwZ06vAqFE7sWDRjOLXRistg5rixP8E+HDnMaFQAsDlrI
	u+UZCGPTOuz/8pFENdlgl2akzyrKuJuvHh1got+1ncxvUyRo5AeCstxYhXoyk+uka9IP56JNLOi
	0OJ1fsvQGpCkMBbIxsuJ13D6B6CWIcIApjtBF10KJq/nrIpzSlcadvKBnbCr7B0obc6Pg3OlbUi
	axGBTI4SoC1GiEdN/riKO8mj9NG9JxSwIcn5P4ri8kaMjRNwNy9NAtYFjeIpfDLMh8pcMGJxNfF
	AyKgMHNE8wIDCQD+YFXDOolKYzyqXSaMKV4nQlWrUhJHWfBWwwECesegeXPJJFzf7+9PuOIkpXB
	LMch/7F6s/q9Ur6o3a9+qKi8xvSp9/cEu5rw7oZoB3crHTTJHNFtD01wmWoY61J2y48bISV9E7u
	H/Xz+UK8WVio50hTkXXcjxsk6kJA0FQbsLjVbQcw1/eg5KhHvaYs9k4DQ==
X-Received: by 2002:a05:701b:205b:20b0:148:ece:8cc3 with SMTP id a92af1059eb24-16a1555cfb3mr13553259c88.24.1791831076829;
        Mon, 12 Oct 2026 11:51:16 -0700 (PDT)
Received: from [192.168.1.106] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a2f17feasm41738221c88.9.2026.10.12.11.51.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 11:51:16 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Oleg Nesterov <oleg@redhat.com>
Cc: Christian Brauner <brauner@kernel.org>, 
 Pavel Begunkov <asml.silence@gmail.com>, io-uring@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <asunjCm5Ovj_YDSp@redhat.com>
References: <asunjCm5Ovj_YDSp@redhat.com>
Subject: Re: [PATCH] io_uring/io-wq: don't call try_to_wake_up() twice in
 io_wq_worker_wake()
Message-Id: <179183107606.215281.10642628466917425900.b4-ty@b4>
Date: Mon, 12 Oct 2026 12:51:16 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Sun, 11 Oct 2026 17:13:16 +0200, Oleg Nesterov wrote:
> io_wq_worker_wake() does an unconditional wake_up_process(). This means
> that __set_notify_signal() makes no real sense. Change it to use
> set_tsk_thread_flag(TIF_NOTIFY_SIGNAL) instead to avoid test_and_set_bit()
> and another wake_up_state(TASK_INTERRUPTIBLE) if NOTIFY_SIGNAL was not set.
> 
> Perhaps io_wq_worker_wake() can rely on __set_notify_signal() solely, but I
> don't understand this code enough and this patch doesn't change the current
> behaviour.
> 
> [...]

Applied, thanks!

[1/1] io_uring/io-wq: don't call try_to_wake_up() twice in io_wq_worker_wake()
      commit: e889b0e4cafddb3d68c3595dc01b7128fd35fbef

Best regards,
-- 
Jens Axboe



