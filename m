Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.128
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794115336;
	b=EBWqBpqow0uhCGUKLPBVTxEz0DxdSpqyC0R/lfOdmV1bY7LhX9nqyPdACSDZGAleuPHS
	 q2HFyNW4T5lwo0t5ol0g1K/3+8rZT3cpBvbSAtkYDAbinDiMnUR4g+WbhT7QXgxEAOvMZ
	 /yJ6rE58KZqOgaxp435JlWMGxSn23E6hALxUqImPHgccnP0k+3yicnh+9XN33ECcUbMw+
	 gfdXLkQmLwfC0TyzAzVE7Jj8veFje47ESuuxHnc7gjbHh/nwFAqzSZOw6sKDHqQN5npTO
	 bpn0rIboPiaXiwnyFLv8xA49lhSsD5QoWI6xSwkZbPRZkciwRQxjXQNGGSI6tnVk6xQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794115336;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=eohJ0DCIaSvFxowjPTLeEGZzQ8vwQ/i8uAHLdRHVZ2Q=;
	b=MbdKkE9/33f7qeqsNoMxzDGQLfiYh9Q7nDpoxLprvpeE5ZLGnQKwk0c/+ZPA6UCfQrAf
	 ZbZDpAr4A2LTurpsWG1/uT5f4lU+YHkg61e41jt/AaXcG2I+vSe228q9dWW1stmXIhRWH
	 6RY3KRpzcWgoYp1eVqQ6sGo6l1wPpV/1DO3OvLTurgHB9bwKQjtBbBcAKRVPJIKWSU1tR
	 iBbky8npAWuok5qp4GWmbHN7pAbcXqo7lwulMD/KbgCJ/C/V1ed5pj4g+jzbMdCtjacHZ
	 1UZbgMCbujgls+P18UCTYkdDRSrPdH+Ar+f4XtlceBKet7DZkdnMRlWz2JpHRFMQegQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IzK0WzZY;
	arc=none smtp.remote-ip=74.125.227.128
Received: from mail-pj2-f0.google.com (mail-pj2-f0.google.com [74.125.227.128])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32925606A31A
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 05:22:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32925606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IzK0WzZY
Received: by mail-pj2-f0.google.com with SMTP id 98e67ed59e1d1-3b094d5f1b4so59985a91.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 21:22:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794115335; x=1794720135; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=eohJ0DCIaSvFxowjPTLeEGZzQ8vwQ/i8uAHLdRHVZ2Q=;
        b=IzK0WzZYLOoCbFktNRWPHqUO0zKBz6tj+YNYbzXv/QeevzHLY8v7KcG/EmcDLmrJcB
         H58Hxn6WCvaHjvhId5NxlzeNfB31OIzNCDb86YAp+4nQpIie+bcChfYvZE3Yi6lNhlM9
         Sn/C5RgwrUXV2kREUZDnQbqdVF4adYWPT86i2SIMMZi0tExxTzw75QDXI4v6QWu7whig
         puaamGU1z9P8eJm86e0YaayAbZI0YQnShIrNGHQVlTZYv1YErsl6RSrMYVCkh5NOlkkd
         um/lubBCvQWuU7uVT5XrVSacekPO41Ri1EhRxNA3OwhxHbO5pnMNMhXOefR/0skphbYo
         26rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794115335; x=1794720135;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=eohJ0DCIaSvFxowjPTLeEGZzQ8vwQ/i8uAHLdRHVZ2Q=;
        b=sy7qoL5QULlyuvcHy73b7oeZkL25lGNvZTHXIv6+bnPQbipCPV+g3DyAHNq60Fppgd
         W969JdVd1+5qiVKLBtTcxNPKX8f/lnmTfiH7+MewdGu4cGrjme3zk8S9aDW9MACulBxa
         0ozcE+TDsv0VU5YTkIVipalOe3bWS2fYQBwBFV8GLpJGfDOm2bEUxMXatvEi4huBZYF5
         FcTrdxQ5DOvXGavLAg15pZvH/zfux+75Fl0iIIn/GZKf/KY2Xtx2foWkbBP2p7944GmH
         hYLPxf6WPoDCsMtHqYAdIU2moTi3Qz7LjnT9EPObmftq92jLCAOASWbm96JwOoN8jMqJ
         OQPg==
X-Forwarded-Encrypted: i=1; AL+hErEnk0+glCktlk+rn+nxtfmAnSFLf+xI5FI2zi+r8A6ZjELnwRQTfQpIZ905MLQzUa5sADwEZzXIiOfRp8Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z9nuJRi4/Dy5wzsiwpoTTZEYzgeiHkhdf1bgCnVHgxFBC/6/kKg
	UZu2kiar9yd0rRroXf1Fz1tNIMKm4LCSCoo+goKrTR7HBqmwP2Vionz3
X-Gm-Gg: AYBFou3WPdXgvXK71mqM7YhgjcowrIGJ6M2FWRXFA57gjEM+mK3LSTHeATEQE6Qcd7B
	zpAwL8zAPN2EWOF7IU7bne8etAup7dYy8yzqCtiH6V4AsgDW739pmvT5CCslLWsqKIr/E8+NEqf
	bPLnuO7GX/w2r4IknY/U7y384SQHmywsrVUwXihddozOByBm3z+co0EpaJP+tXA9qyOvVWmRbzF
	JkaqFT9bSlvH5p5B/ezfOxUwudcHH5XgkeqtoZNsGGmPdxbEdpU114LKOepraKb0HUzBXTkjGLl
	UYzcIRxjAA/cw3ZX2Vg6CKctpq6zpnfZEJ0jqstqeBnXpBScQ4nXY8d66PF5E9iafxvVuZnC3mU
	FTUc4oOGhKnfVS3qsVVqmhxoqgEGPgNHhydRKu+F+zGDYeGljYbWn4yeXf/ngidJVjtbz6uAx31
	vftUu92as0+tv20kjO9x7GoPkDItxjghevdVUIq+jBV0uLFEvyLaCpgthjHWyvtbs0Z8tvuaHjO
	JRCdpIcUSg9978WiFtRfWj+5RIV8uWv1ubQb41Lrh1H9Hrz+C0mSqpW54/O7Kg5lk9jgtMsb7pJ
	GSc8VKcVjOJPWqlazDaFbZwijLM9oBTulPh5wk7WuKBsxHW7bozPn25WVzzf89W1VCGswJOe/wE
	Yid8FBxXzgxoKsPr8bfOVwHPe5Q==
X-Received: by 2002:a17:90b:5903:b0:3b0:9bfa:72b1 with SMTP id 98e67ed59e1d1-3b12d4dafb6mr493467a91.49.1794115335433;
        Sat, 07 Nov 2026 21:22:15 -0800 (PST)
Received: from [192.168.50.20] (42-98-155-143.static.netvigator.com. [42.98.155.143])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1058a7b29sm5647629a91.10.2026.11.07.21.22.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 21:22:15 -0800 (PST)
From: Aveline Noir <jm5905938@gmail.com>
Subject: [PATCH 0/2] drm/amdkfd: fix SVM error handling
Date: Sun, 08 Nov 2026 16:13:32 +1100
Message-Id: <20261108-kfd-svm-baseline-errors-20261107-v1-0-9ef4008019ab@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/zWNyw6CMBBFf4XM2kl4iKi/YlyUdoBRac2MEhPCv
 9uiLM/NzTkzKAmTwjmbQWhi5eAjFLsM7GB8T8guMpR5eSiK/Ij3zqFOI7ZG6cGekESCKP4PDVZ
 1bSqX231zKiFqnkIdf9bE5fpjfbc3sq/kTY+kwlaMt0OatkIXhLj3OIkZN321dmFZvi4pfai5A
 AAA
X-Change-ID: 20261108-kfd-svm-baseline-errors-20261107-355a3d0c4792
To: Felix Kuehling <Felix.Kuehling@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Philip Yang <Philip.Yang@amd.com>, Sunil Khatri <sunil.khatri@amd.com>, 
 honghuan@amd.com, honglei1.huang@amd.com, psirt@amd.com, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0

These patches fix two error paths found while reviewing KFD SVM range
handling. A failed interval notifier registration can leave a published
range without a notifier, and an HMM allocation failure can lead to a
NULL notifier dereference during validation.

The fixes were tested with targeted KUnit tests under KVM with KASAN and
lockdep. The error paths use injected failures or equivalent failure
states; no AMD GPU was tested.

---
Aveline Noir (2):
      drm/amdkfd: handle SVM interval notifier registration failures
      drm/amdkfd: check HMM errors before testing range validity

 drivers/gpu/drm/amd/amdkfd/kfd_svm.c | 58 +++++++++++++++++++++++++++---------
 1 file changed, 44 insertions(+), 14 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261108-kfd-svm-baseline-errors-20261107-355a3d0c4792

Best regards,
--  
Aveline Noir <jm5905938@gmail.com>

