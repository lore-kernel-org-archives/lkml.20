Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A34FE4C680B
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 15:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788448572; cv=none; b=cnKjDtxnKNSlpglbXPLmvh4tG8Hftj0TruXIQvL8pQIGEENOHII4XUJwbDI5dj8mNCij2zHdmTrG+SK1txjHOFhXKH/aawZOfrbWzRxfrQn6FPVazMj0LPT15QFte8dN3VM2MhTVQ83Du/8JisFxzZsGnSQcK/NEIra+1rwug/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788448572; c=relaxed/simple;
	bh=PzECq9Nkm6b3bxsxN6/LxBcAb33HZbdJHHOmu1wRy7I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bCuBseEkHVpa1viGT1wfGzzef3iUAVH7nABnjPS8NBJ6w5OHcWo3KZPsxepTfwCDkDjdwUWJMOuCknoewCdFv8AirL/kz+77N3FOIMKMP9Sg59Qp+Sm3nUW0YIKJ4cuoedWUfLKBFknfJFpztAGS8WNnd4ov5YBdGCrCdz5FNUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=REK6RZDA; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="REK6RZDA"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49cd77e0f95so25317405e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 08:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788448569; x=1789053369; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PzECq9Nkm6b3bxsxN6/LxBcAb33HZbdJHHOmu1wRy7I=;
        b=REK6RZDAVZkz6HYZjjPpi2FiqQpiwH+t5kb8P3hR3/rRD6i5ElX+jV0haZOe4PQsKU
         F+GuTCJsWlkRF+fAUOHDGMefeTLHE+hmdCHN8XgjH4DjLDU+xWA639wLMma345BHK/hM
         EPgNdPoALVMy9yEm2NafJ+Jj2k4/GevHIYwIXWgTLs6U1q6pJxJdjLk2AcC1I4KUHoGy
         lqWlPDMq2NQlQ3TafWGveizPtRJjCw9RY5dbsL8QFOKNLUhSt1535AsetKvvCVn2pI8i
         /mbngmXHnEd92dLPlV3ZC1Hk6fv91+jlfIQfpGsvBNmAFw4w9l/tnHxqmiU2rVsvgYoh
         HtIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788448569; x=1789053369;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PzECq9Nkm6b3bxsxN6/LxBcAb33HZbdJHHOmu1wRy7I=;
        b=KYO7ralhD7SGydZ6eWLHk4JURJ9imBZSuwj4q8eNTgBQm7M7pVbtOg/oihRJ8/NBJo
         +OFvp6gh3rsdinC17yy8iKkMIKMHZuihtc3qIw6de7ExC6By2N7xQ06QHV+lOd7MF45D
         AcmwaFi8kUrlzs1+ccHaLZbRRTiFI2qVClou/JUsDMTi7Y1hgs9aC2CXIWcH9R03ClWg
         t6PTApd2E/vC7OE5/mlKqja8QPqss8y/L0M4LorCX1g/djIKEjigFW79d9YWVGi/AzyQ
         1PnQ+btfO5uV6x53X1k5akXSlCwwyaMZVOqZSxLt5WfhR5zLUog46v0kfVFRBqMkGrP4
         XrLw==
X-Forwarded-Encrypted: i=1; AKwUvBxFVXoYXx2lyVRB4XAVXME92MU8QFW8iDpGUqvvMyuzHrLjKbXRAkFhl32tP/o46xDO3FV/Us1DauG6pdo=@vger.kernel.org
X-Gm-Message-State: AFuF++nk/jvigPARsmxlip4K5zkVs70/Ul02n6BaR//xIQiiL1OGpwrb
	yUqCW1EaxPprgku9zGtFP9/E8OP1YkXtT8Dt42opq04Ngad9RTwQyRvd
X-Gm-Gg: AYBFou27/m+Lbakl1ojvyXm48TBsgOg42rsN0hSwduhSZ0bA/dD2t9b7t+R42OOXxDW
	hp6odypVt4N7+nYD49mmd6NvmWByZsGJsVi5V69AztSXuv29yiE/uAGZjll2GrPENJSWow2DR/B
	rrS8vHKVydS5py+bIVJHo7P3Uj+/XNzcSb30SqcF0psBFWnXNoqXjLNMaIed/yJ0vm4wOMrQ15k
	qX6Qy1uaqS6khI4jMJMEafZ8e+s765C3YNsWzHp4XYWx+W2GqDi6BuFKUoKAz07aLlBJytE73g3
	5GAlspSHlPFA3lsxOW7sKan68FS+HZ4paWGgQt7zFr+dp9j/P7plYlYPojKrlgl6DCaWmR9TPpI
	jQymxBMr32lAAlLnUUqUS6UfBMxKluL4H5F9t0lL0CG4YedAu2sGGua+BTk4PcSNoTT1eoMjZZE
	EW97Kmxo4sWTTb0KUStIUjDnvdmeNX3BR/axdAxhvbnAHvhvSGEBErOQ1fJ5LmUDagT++k
X-Received: by 2002:a05:600c:6383:b0:49c:dc14:d681 with SMTP id 5b1f17b1804b1-49cf5bb8040mr16748105e9.3.1788448568466;
        Thu, 03 Sep 2026 08:16:08 -0700 (PDT)
Received: from metepc ([46.197.185.71])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee80eda4sm77097075e9.15.2026.09.03.08.16.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 08:16:08 -0700 (PDT)
From: =?UTF-8?q?=C3=96mer=20Mete=20Kaya?= <omermetekaya0@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: johannes@sipsolutions.net,
	kvalo@kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] wifi: cfg80211: avoid holding rtnl_mutex across all cfg80211_leave() calls 
Date: Thu,  3 Sep 2026 18:13:10 +0300
Message-ID: <20260903151542.486376-1-omermetekaya0@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260903111705.472491-1-omermetekaya0@gmail.com>
References: <20260903111705.472491-1-omermetekaya0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Apologies for the noise — I forgot to mark the previous send as v2.
This is v2 of the patch, extending the fix to cover two additional
hung task reports (tun_chr_close and switchdev_deferred_process_work)
that share the same root cause.

Changes in v2:
- Added Reported-by/Closes for tun_chr_close (b0ae8f1a)
- Added Reported-by/Closes for switchdev_deferred_process_work (d6bbe0f5)
- Added linux-kernel@vger.kernel.org to CC
- Updated "three separate" to "five separate" in commit message

In-Reply-To: <20260903111705.472491-1-omermetekaya0@gmail.com>

