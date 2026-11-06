Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793964781;
	b=fJxV+bN6/PIJkI+jXjHsMdkGwMIa2KcwYN5CiBZ6cpMsIWg1iQdoUyGU1Wxst9f+2yeb
	 N/Xr+GhHGwKkgm6iaRSZT+mGnGPnaB47QFfOXd2IkB1Ag3TzCzJugZPgOIg3SiizcUgNq
	 omC5OSPJcQ1x+Kpblz0X9MWZydOmpgnz03BR9/71U+jR+84yNeXcZkrpTWAsTNzXz/m4M
	 R9U3UetyRqdtYU46DKaLI1wwNI5DNCCVbq+wxMf0Jo1MhMMNV7QD2OTHbHKsJSwLBGt78
	 R655dgRVjyfmB4IQh+9c3klhvF/9TPoWqcdKcO6MY3tdjPm2TTGXgMCYPj4wIfISy/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793964781;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Nzh7sCzVLU1Vb7ZGY6Ft72lyczAGmFqvjOfkg3Fwk8k=;
	b=4MGqk9JWacXQJ/dc84e+CQdZTR4QIU/9Wk11nU0/ivhMM62x0/+MXuzVzNDd7Xsf52eE
	 SMWP5znu2BN+/cIfVyxntSINXOrsgSZhYpVmefSya0gKAN8Wr1M/sf2yTK5i0JpZpjotq
	 1PZ0J4XQzdujiWIWX2oKjIjEIt+8Vl6vlvV5qtTWSKBftb/EYtlm6OUArYwFQ0CbkAVA9
	 qAG+etBVYSHAlVY+XpSeeETdagU027Hf3SjPm663k3nmyXf6ehpCxa4lwuwDgt/fhd1Z6
	 wnviyoay0jCVih+AMtxZcrc/bcmy+6JIKKjuNzzafMeOnaiBcwG/YKrih/UBw7SEvgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oGw8bPug;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F9F9606D802
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 11:33:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F9F9606D802
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oGw8bPug
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so4390745e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 03:33:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793964779; x=1794569579; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nzh7sCzVLU1Vb7ZGY6Ft72lyczAGmFqvjOfkg3Fwk8k=;
        b=oGw8bPugmHcN6mPqHq+3d9Rsb9MiQM+ozHzT9oATnAygZWmszkg/mWNy7tTKqjgQpe
         Z90Efh6jtFUl/LAMuvCsWHB+CltQB3R6JRQ1cYD3it7URk6DraxQ3xnglzLnakg+fVip
         oHJ7evIRXtHRKSO+mn4xyvmHoVce7xN8BncEqxHFZtDZL93sWsUXLJ0FUizGeDjG4yZ7
         oG0TckvSYVUxBJZsygecbrNU96ujNWTcot24IrNErdc//dLTHPSVewvDv4f4cYrGGji3
         4oA7qjTUtkslo5j37SJJvxQRJY99VKjDzD66ku6VeEQFYBYwsBp7tdZQ7zbiAFtCnKBo
         6vMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793964779; x=1794569579;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Nzh7sCzVLU1Vb7ZGY6Ft72lyczAGmFqvjOfkg3Fwk8k=;
        b=m/KAZ010HFcAsL/Lx2sfMEtlBGENf4fP1uce7NzSX/13bp/9iEE3RNh76zM+y/mqJi
         zcqsjMQUmPiju6FHN4pqY5Jq/k2dgnU2bARsm5ZUAQvpR04+GFDO+FPhletTkxCeMQyS
         BUBMKqQC6JtRbYw6qc5pxtOY+qgjQst1D/4zcwpSICje84qfN1v5MWQ4Wc4UVJY2D6FI
         W1fNh7+2h4e+vnNlLARmCW3T933MiBLmx39pRfbcrX2pLq0F+4l4imtcuTCaAi4oKMF4
         AO6OKeEufWbxqKC5UbDSfYNCOduN0AsceEUzZGaxtdcjkgO4hYaneVeYJ9RoAnFzB01F
         WCxQ==
X-Forwarded-Encrypted: i=1; AKwUvBxdQiT87XoAQdsZ6VaSnqIhdd498OT9DFzrGX6vAFA8penTNnoWUg1MZB3I7J2JnDorpyyM1TEYnnHxNdQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9U/S9ia7I6eR0YFQF3kcM+ArPHdJ+bI4TOknpqz9oql+VrvnQc
	e4bpgKUzceSJQCAssGBh0qRf88LDaQZPKiKUhq7XsZn8xOkKai2zU502
X-Gm-Gg: AYBFou3PqLjZZK2sqiuhTFa3yMHFyKY1/qiFkSQlGJP0LjVCKpCKJC2CKASL7KlsRA9
	8YsfEwHOh/A/FyK2IdkOSxafLakXZXjNrRH5HWHKNNGvWo5LIglYpvfSMgM0G7uPXJJYQI4Z5Qq
	QSR9uZdK9aqCUfavMMlFSk4Z4VwfF2OKK4uAen+7I6M0na73t9JixTwQan7B+pMvup7gaPs6VgA
	3DPXZikK/XW3ZQwAxrbMzEsPYOVRxFVzlxnacu/YMqLLwPaTg8Qy1L0cdyb8OjQqlR6fv6nnWX6
	G7Bzwx0CL0p4r3aHyafWvch21yacS58smTZaN+fyn1p6KswhPOsdgyECdKJOPuFRtXPaX888Acq
	i87dZZA850VrU+yhc6J+yCRD0aIk0Amy0j+SNhvPr2auYOB3G628fXB9YrYon6NC9MA76+A6Qgr
	K3DVT9vg3zKhAO2t8AAVzeqdSidZ5hb1adrLgjG1JJFs1zktqtNg+2ty3OqZ5E7y73Vufb4sHfU
	92gY00GCXViIgYZ8BjAvvC9E1LPpbLlPBBowoo3qQX19jGUmD/HGD0bx7CyfQhGdY4ljWNGOL/M
	fRuA5HzBZnruGgXu8ZRrzU1+BHcJ1O4sxnEeF2XG8ar98LQVsciDxLStqTYU+18zdWxQKysSL3+
	o1ZmGgsa7LoKLwaUUAfjPxdG6ZQNb
X-Received: by 2002:a05:600c:1d05:b0:4a0:1b14:e283 with SMTP id 5b1f17b1804b1-4b6dc6deb82mr34411495e9.1.1793964779207;
        Fri, 06 Nov 2026 03:32:59 -0800 (PST)
Received: from andreayoga.localdomain ([151.37.255.194])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b76b5d5511sm3825805e9.4.2026.11.06.03.32.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 03:32:58 -0800 (PST)
From: Andrea Parri <parri.andrea@gmail.com>
To: Kees Cook <kees@kernel.org>
Cc: Tycho Andersen <tycho@kernel.org>,
	Cong Wang <cwang@multikernel.io>,
	Andy Lutomirski <luto@amacapital.net>,
	Will Drewry <wad@chromium.org>,
	Shuah Khan <shuah@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Sargun Dhillon <sargun@sargun.me>,
	Hui Peng <benquike@gmail.com>,
	Bradley Morgan <brads@mainlining.org>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	bpf@vger.kernel.org
Subject: Re: [PATCH 0/4] seccomp: fix user-notification state transitions
Date: Fri,  6 Nov 2026 12:32:49 +0100
Message-ID: <20261106113253.78866-1-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261104103736.71956-1-parri.andrea@gmail.com>
References: <20261104103736.71956-1-parri.andrea@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I've reconsidered my earlier plan to send patch 4 on its own, and I'm
dropping this series.  Patches 1-3 go as discussed with Tycho.  For
patch 4, it looks possible for a signal during a RECV whose copy then
fails to make the target return EINTR even with RESTART_BEFORE_RECV
alone.  I don't plan to pursue this further.  If anyone wants to pick it
up, the fix could be limited to RESTART_BEFORE_RECV filters, leaving the
others unchanged.

Thanks,
  Andrea
