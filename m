Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792502637;
	b=Ey1TAisJ5OeWNHeZz22rxuocFoNZV0zHIfj5Jld5V1nF5GnubgyVkg695+9Z9gSqy4lc
	 5+543jvymCPUkXlxku/rBO261mUJEWb9rQMcukITrTaVuE2GIr/nIwfWThhRGLWJ1UAU8
	 9FtUytBVF/9tIxMexYD1PQTAAUYSXxNuq3cr074QPJZkJxHzDdvPtnb2pg/zvH9OuQB8q
	 Xjl4trN07CWm+kQQdgOfVfsagz6wHfbtusrG4glqYs/JIT6MF3uhT5LyOjAKbsiXFvZcN
	 pS1IiLkMthzLBvDiixUKj9sb8t2kC7kGM7MpQowwGwaWQKMfdYs2+2B7/AhHBxZMf6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792502637;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vOwJdBkJQT2ZZgsV9Tvx4zTJRIWa7XIIOUhJ8h1ztTI=;
	b=ZLj09lsbmD3u+cRyLVUnNhUZN/YDjBoxOW6PeuW6Yn3GG/QtyzBcyJnBKMM5JfnURQig
	 qXj8xzhfJIzz2/8cKOUgtxepnF315YM8hrMX5YMJZpoThDu1bwXPFFsS2BgGuSdNuFgTS
	 /qjDVwqKQVIHhWLBN/IKVnUeKWMyLw7N4s7XIJiR1cJl0DiEnCLiQXAFQHFYwgHlXkWmC
	 clJgiupZ+5lLExJyaMQjIeoelhxhiQjd/ltpqtkD6lthxJxvGPU96F9cNMvSDgG5jbNTQ
	 FnvkwP9qH0cuqjyrMW14+uSwwQy80n7qnK49xhNonydU9GE8Ox5Y2YMaAT0rL3EHg4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hOqFBXvw;
	arc=none smtp.remote-ip=209.85.210.171
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 682BB606A325
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:23:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 682BB606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hOqFBXvw
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8a07078200fso795872b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792502637; x=1793107437; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vOwJdBkJQT2ZZgsV9Tvx4zTJRIWa7XIIOUhJ8h1ztTI=;
        b=hOqFBXvwIqfLxs4G+ZTGW17EGdDcEoatHHgJDFqPnmSt9WtAeYWXTUUwWWl2pcT37u
         NpnQT/lwgz37PVRADHzRQd/qQ91udzQuNswOUANj0LLj/TMwrE/v6Bs++I4N7brqkjpl
         0FBNI1KmNNmgtPLPF57K+IyXhaJFw/SS7ropGRa2lGHjofqxX7ypaOHAdT4SFm72XKNB
         Vn4DpgwHsY9SWKIY4SMaijoNIEmPrDBbFrunchSl/DsuYKVV1DHfbzk1eovQHXLKXqxE
         L/9Ry+U3/pd0bdJqDVfPTdKgpT08ARfWFHooTTv1psuIp1c8io/aJyABc9vp4MRJwfF8
         HGxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792502637; x=1793107437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vOwJdBkJQT2ZZgsV9Tvx4zTJRIWa7XIIOUhJ8h1ztTI=;
        b=jUHkJ+e/KIv3G3vB8B63iOdMsAFJ9dr8MFMpal7BlrXIF3KNLwHPn4sYYus3gAZi8Y
         Xy9j0SzYWF9+SJBQUOKb7flVM/AzN9rnUqlJl7rNM4yjuzwnAgs0DvAQ5HR7f6VOlDEn
         MeA7fmTEhNjq5qp8jGBza5Bs6jVXhHM5CLiPHCsiNdTW9bRr7EPMuFfkIUm4N0P4LZhH
         QWRuJE3Ur+7eJYu6LfYw0VPMbFIYQl4YzsiVzXO2Agx01MjphEQpSICoW8r6JCP4kue4
         QY32t3+OVrUVr8nM9gkawDgpILHbW6IpW29dT3Aun/euo3ll8byES/GzGa4Q3jltDt/e
         J9Qw==
X-Forwarded-Encrypted: i=1; AKwUvBx08vjuz893PHCmFwC6mRFIn5LLyesrML63JbtT8a6ASbrR4U1cHYvPtW9VM9sMwAG13+9AtX3OFbi786w=@vger.kernel.org
X-Gm-Message-State: AFq9FYLZ8FEwtkC0uBVuPSdjjwraZgJw206AiqFdJJcFy3AQKojGGl+S
	QEHzcsfCveylUwYBJSWONyi0ckZcMzoVAW0nAynOjIrDcmJQUZZGe/6T
X-Gm-Gg: AYBFou3YBLPmoQTf/5Upjuin1h7uQTIb4581Tyk2c9ssmP0QZ1dfT8yMDpFUnWQwuoG
	ZdGKw5cR3mhk9UHAJmdqnKMTSSFfj87cVdmZxSQoUj3bLs4uVhS63IRfGqIaG5u3i/S/wheCy7z
	FtKzp22XUyzJGEAv5+FHCWu/WF57TG0k6A0CvF30s5WStjh7ZrjgpkMdFFF/enWa5zwAQyFz0H0
	71Y5umcDi5Qaf2ZNFkgFsh2eNGxfwtKlGlXc6/Var64sJM/zhKEEKsqjdPfoQcw1oHrxDOBtZS2
	+U4apFwAuhqDW751uITres0xKA7+QvrroAHM3hkw+H4RtTyUoPyE2/eFk1GkgyllhirK8AYYqsa
	DUvPJP+czRXAZp/AllvdjOkxe7k0YZCgDJjYr+LGOJcXwrdXJj6jQ8lmakCXfkI1qU4fjcC3e1h
	LquiJd1jgnxqoGxKoShnp+MuuD2hQDsFiJl4ACtxfamPbH3egbcDUiAL4uLAufx4RhCn/IEN5Rx
	NSTh/yfPmcHZw==
X-Received: by 2002:a05:6a00:2794:b0:89f:c156:d211 with SMTP id d2e1a72fcca58-8a04caf9590mr8276728b3a.31.1792502636753;
        Tue, 20 Oct 2026 06:23:56 -0700 (PDT)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f58208cc3sm4831503b3a.52.2026.10.20.06.23.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 06:23:56 -0700 (PDT)
From: joonhoekim <26rote@gmail.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Joonhoe Kim <26rote@gmail.com>,
	sre@kernel.org,
	kamal.wadhwa@oss.qualcomm.com,
	anjelique.melendez@oss.qualcomm.com,
	dhruvin.rajpura@oss.qualcomm.com,
	andersson@kernel.org,
	dmitry.baryshkov@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] power: supply: qcom_battmgr: expose the charge current limit
Date: Tue, 20 Oct 2026 22:23:48 +0900
Message-ID: <20261020132350.953-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <4ec618a6-052b-47de-8418-e0e319af10ce@oss.qualcomm.com>
References: <20261016124806.1789-1-26rote@gmail.com> <20261016124806.1789-2-26rote@gmail.com> <4ec618a6-052b-47de-8418-e0e319af10ce@oss.qualcomm.com>
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

From: Joonhoe Kim <26rote@gmail.com>

On 10/20/26 11:55 AM, Konrad Dybcio wrote:
>> +	mutex_lock(&battmgr->lock);
>
> guard(mutex)(&battmgr->lock)

Will do.

>> +	if (!ret) {
>
> LLM suggests to add:
>
> -	if (!ret) {
> +	if (!ret && !battmgr->info.charge_ctrl_limit_max)
> +		ret = -ENODATA;
> +	if (!ret) {
>
> to prevent a possible zero-maximum value coming from the FW
> from messing with us here

Agreed. This firmware reports a maximum of 12.4 A, but a zero maximum
would clamp every write to 0, and a limit of 0 stops charging here until
the end threshold is moved below the capacity and back. Returning
-ENODATA is better than that.

Both in v2. I'll wait until Jingyi has had a chance to check the sign
in 1/2, then resend the two together.

Thanks,
Joonhoe Kim
