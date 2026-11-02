Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793634914;
	b=l9K4dMLqYiFm/Vocsb86ABSsntRFqQ9pfcphFGV/hdNkAT2Xzfb6SM7xMSHUYpMvwDIN
	 a8vo5XlgbEPl7umB8Na+vrIMkGsWI8NVXGC3RG7OxXM5plLCR5YBhHKdNoW5GTGKu/x6N
	 tCg0AXBZRrox2L52u9pYp6u5i3dA07108Z4X+eShmKmNdS98u8ck1x+nMCY76noEaQG1l
	 hyC9GWYnriN1lY1QgDxZFjCz2tOVn/WJifsAe5hGwaGO2AliuWNV9C1jzxxJF06lfGCOX
	 HzR70VHuojtar4m5idkishd+A2FaMCoe2laCX0INyGH1JQQQnkrVNa2JhdbGhnABshw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793634914;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=tj0iben9H416MMLvw91Gh4yeUNuYB2Ru4j1c93SqEWs=;
	b=i59mHvU6sdwC5mFrF1yGAdWVHj79XEQKJAryoNQRS5ZhXFjhMtueZrktog9BOlVfmxUT
	 I997xCQLy5Po/jSSCVVQpqwjsdU8TSQC/pC8zZVtn8SIMCQ64Izh/ckJyP10+OSDo5wVM
	 TikOhzG9wYOV9uvwpV/8f7lYzcubhQIO/5Mb281NmFO2IeHo9kXDwsgh4bR54dZ5rDai/
	 0olQHzZckNfGAGVOzKIfAKkk7vmipZjF2hhGwdDQ9U5uvt/z84lImRusoVF0elSR44lbH
	 uEvGjbHDo9l4aBclQUvWGqxywAMORQO/dn89f9stMrIlJDLHRUTqmV9BrXU5r8UIGeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=sWtwP4GX;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82761607B46A
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 15:55:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82761607B46A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=sWtwP4GX
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so26734695e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 07:55:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793634913; x=1794239713; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tj0iben9H416MMLvw91Gh4yeUNuYB2Ru4j1c93SqEWs=;
        b=sWtwP4GXKcc2Ozz0E2dWGFsv9rAtaX5GwXibv7HKepT7gosyKMFZSfc79jRgSpaz1T
         q2VVB8bKk+kB9i+NCbx9Lz4P2zO6zqTVK6XTzKOv6lmTAfhph0pfD0FJPS9mNIdqkdg8
         lX1xW1UUt2D6UH04WmZQK5uvitFNuCM6XMbJUcpbiu13uJ1NIn+rV3zMRwbwvGkb8PpX
         az6QSoLD+x0/PT4OX9paEPH/xv11i7/SgqcfwSAK0xql7NEdf88RP/BcHql7oECQ/RzY
         hicO5p6iZbMI0+Lb03dGGl8J9F88kKN0NIxEt0XsJq3aexaha8AY/NEqt+nKDlFSMIdG
         JTcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793634913; x=1794239713;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tj0iben9H416MMLvw91Gh4yeUNuYB2Ru4j1c93SqEWs=;
        b=OochCX0EgbLPX14tDOAPn2mUt2W9jiVw+6JwkO+2Bcunbdpc488gJD3sPA3YMs48Kj
         FmM0cRE8lwZ9woEpCj/Z2skd4b3jjx/ZmaqpwGKpOOO4XfSEla1w4NcIfpYX1bWeTpje
         L9N5/IAy5BiBKcdZJYDbJpNGIKHbqJhRhsoRehPhrklZsjr8+fbq+bnKn5c+TDk3zmTW
         AwcZzdL3wSdzvrFNjwJKCPLfwJoGYPlGDH+Bhtw4+ZGtps41LFaS+vo8G5yA9Jet034d
         JPzPPLLaCvQb03HFXbeQX1hdVdW3tDmVhE0cvmsTslQbGePKSs1zy+MHUOpDEU6wHr+Y
         kwlg==
X-Forwarded-Encrypted: i=1; AKwUvByPykFIlS7iHBNjdmwlFO4UlKsU5qwprkuttVMWhYlGr04e33rYFDw7UrTGeB9xLZQjG1uMmbwCpciHk+U=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ4k4+inIkNe774mhLKBg1gbGe678IQ7ndyW8wG20idrDw2NG5c
	LEe5z3frpRdVhko6Gl4BUCENTBNuXqCGdfw0169gXvbwYKgK0ur3R572tluSzIAa/a0=
X-Gm-Gg: AYBFou39/bYe7W+y3/ewIeu5L1hxbhGzjI0f9DlKsMnxDa2yTPqiTNoIgxH0JniVtW9
	+xohZ4CW2hVMUXbez6L/DSOpHrdcxGwKG9fnJF8xhAWR8UP5Zm5yjpZii/FDzmoi5/XxyjMNlUU
	7bBu9T7WTpOWqoIvtaVqzLg9Lo7cXRw2dRvbvaF0BvgTG9dkeKHTTE0qTAa9rYyd3sqqtZhduYR
	PKOMwNszAE8IyTXHCQhTuI/kQonKFRqYQaLR1NebjFct2pIEhQnqdFCUnF/Og9WItGcJfYpGnIk
	KpQIHOpkENs3RIc/Yw/Y90svUCt3Vjd4ASTTRWctpfizitEHmNLP6UzRGYmedBbAW3F6PHYjadh
	ZhdzH8qelsQYoe2Hi1CSZxnGW8z2nH4M8TXLrOxpLQXG+egvcqzcb2eR/CKnEcDRjpaJWeaku97
	Y35DXLw9NPBjZMh/6RD5Ij4soItk7OC77gr7TDnXgmMqVcvkgLsVXJrX0skFX7wdHbVbFCKU0nv
	YX9GXc9l26SsYfrj7R2etBsjR2IuS5/Mn89LOMhXggUvHPaHidd6gdVjPSqo0cwrIzYei4JP9Ht
	9kydrv+t0kKB5LAdIb0KLKoWD+QGLxm15m/Rx/WF52NCDUCmegwH1muokik=
X-Received: by 2002:a05:600c:524c:b0:4a1:e6c5:e44c with SMTP id 5b1f17b1804b1-4ac17470f97mr247111705e9.10.1793634912918;
        Mon, 02 Nov 2026 07:55:12 -0800 (PST)
Received: from [192.168.0.167] ([64.43.42.35])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d511sm20300783f8f.8.2026.11.02.07.55.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 07:55:12 -0800 (PST)
Message-ID: <31115f24-054f-417f-8822-c39f3384097f@linaro.org>
Date: Mon, 2 Nov 2026 15:55:10 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/9] media: qcom: camss: Switch on frame_sync_en for
 x1e/x2e
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
References: <20261102-v4l2-frame-sync-v2-0-25cbed7a772f@kernel.org>
 <20261102-v4l2-frame-sync-v2-8-25cbed7a772f@kernel.org>
 <c69d072b-ae69-4f87-aa82-d3cb4b1af82b@oss.qualcomm.com>
 <0785069a-eea5-440a-a12b-3c01a02b579e@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <0785069a-eea5-440a-a12b-3c01a02b579e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/11/2026 15:54, Bryan O'Donoghue wrote:
> 
> To be in-spece

*In spec
