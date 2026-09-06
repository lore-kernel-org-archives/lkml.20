Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A95943E0C7B
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 06:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788677697; cv=none; b=o5QJExSXTXkdMTMzWGAVDzX4mOGqfNImawriA0bcUpj6YjGgYYlhkhLaJD/DmlPwkb9q9jLbbAp+PKhpOB9A8xZNizSdqTEgdTiJLVjUGRXMJNwneH67/DtQVq1MtPwgMtIqBtYObrUxHhucHyS25ciqwC0nhFFtWX5Gt0zv1D4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788677697; c=relaxed/simple;
	bh=ihV5OQaoP6INSs81OrTckxcfcEXn8Vp2Yb3BUC0Q+Ao=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=IjXT9uk8FlkkuZVTsInS3Bka3jNRUNx1Qh2Vcqp32K1TT2Sz4/YSMJfyh/puKPsNcv2qgrjyokQ5jjxQArGhr4mCwsLuBfIbx2az+Sc4Y3ddSWnWaxrVJK40fU+TAptoSmIEWOdiwFX5gmm9D9N1exhrpUiv75h/hG0VPKk6ZoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KHK5b4vX; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KHK5b4vX"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-38dfe7eb825so1988498a91.0
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 23:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788677694; x=1789282494; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:references:cc:to
         :subject:from:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=C3R8tPe9lOjKH7p6qWRmtf7FvkJ+tCfMXgIaxL2nfTQ=;
        b=KHK5b4vXZPLdKdm82/aABRkIgKSIsefrvhCfViOHR2LuWjQ3KLV9b7HjMK1v9PqL5D
         VIriafVMFI0+XTo/xdhSbqYjY+0m0jK1bA33aLCIc0RgzNlCtbAenOkFDldj/5XGXimZ
         d2RSEotZsuK6/dNkMwe7UYcFTrSyHt48vOPy+cPojKIniCBqzDhJQAbsyr5PjIuWughH
         j9Oq4N1ZNAejzResRWo/2B9prPZ9N6Uui/6j6LeqqNiUBeRHG7DUkOOV0qtFlofFw33a
         bdCxWWnRqXs0Kf7kwK0ywbFOuwnDvxU/tGbLW7mCA7sNsEJONjwtJkBRfdzL/Iinw4lG
         yfkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788677694; x=1789282494;
        h=content-transfer-encoding:content-type:in-reply-to:references:cc:to
         :subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C3R8tPe9lOjKH7p6qWRmtf7FvkJ+tCfMXgIaxL2nfTQ=;
        b=dRtFsQn584pMgrUQhPMzp9lZrDLz9jvsvgtLqm2Vtgmq3EDUhgUNRomiP8PwFdc9d1
         rESYUX2RpyKZA1Hba4l537C8lzcdX9lgIZp2S6Tlgf3FMCXr/YamUNt06PVPhiAd0wMI
         M+/CLRWS70Uc5w3SoAmMnUm3zClHAg8qb0NqYEfYWieA65eyDWkdR11fRY1JMGN+znt7
         Te5WBzfji0kRE8nvSHLBxlOi0gqLRu1TDxH6kW90myAXITJ6GF4JSAn3CRZ/eADnGzg6
         xZwGZjiNIHY9jiugf8jfCwZr3qY9XbZwh3RWA9K0VXPOk/+qp3qEIE8z5ZmnxUs59+NB
         4NiQ==
X-Forwarded-Encrypted: i=1; AKwUvBxt0sr00wSeVvH4TJMEHH1M5ALoc5PC848bkqK8P0UYLoBZd00+yXz8HVz1ZzWKpIMKI6m7GOPL5S6DD40=@vger.kernel.org
X-Gm-Message-State: AFuF++mveynwTKKxPo7IBFbxBLADg0I0Dwcp6VO/LK5oMgzvMW1WBkBD
	euzhh9sBg3tb9S4vdqkHkH3yg6FHYsxHx/LVDwFu3PyaH27PT2GXQ6pe
X-Gm-Gg: AYBFou1x69FSe98tZ56BsF6Flb5jtt55sG92bje4ti5YAY2X9zwhmHd0WwNgr9Hy5j/
	Cp5ZWiNJY/XSRTsimokhUb47uvsIPqAMvMEQJf8uuOtyvU67yW5mUjfJah1unOfh1L7cTwOSkMQ
	LC4a/X8qDkCY0IrfNQPXGJoZEDiSj1vyBjqxHL3KEZCCeHXAnaoecY9iQ+HlNnhL86pfqPdaAag
	fUM89UIYWV4eKQa3PBcVRkf/pOpv96Gydq+J8EZzwpCnf1rtho5dgGpDf+m3GBqnXbYLR3r1JLu
	Bfjzj/FunBaqFtB0lFByv2qi41AcaIOjII2MWU1J0yyj14PONxo8slRUZ9p85nlPX0fNSN34ZtW
	UjwLCfCWUk0ZZIeRPMvWweH+DhaAqC+bfBhO8P25lSF1YwIcNj2+EQAzjzu4+0Cgvt+bKbZ8K8T
	Xn3ZRu1EI6Y3OJseH8skyFts9CC5LOa3PzgNp1qAurjIhNQYnxtrWdhU4tsLeFKi0Q+1QGbftSt
	cUTYQmGvlD5vw==
X-Received: by 2002:a17:90b:4984:b0:381:25ce:bcc2 with SMTP id 98e67ed59e1d1-39b26104798mr22897521a91.6.1788677694175;
        Sat, 05 Sep 2026 23:54:54 -0700 (PDT)
Received: from [172.29.66.128] ([120.236.174.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08bcc060sm22686761a91.3.2026.09.05.23.54.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Sep 2026 23:54:53 -0700 (PDT)
Message-ID: <4d101d62-9ccb-4e3c-a7a7-8d0c273f0d69@gmail.com>
Date: Sun, 6 Sep 2026 14:54:52 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Zhian Liang <liangzhan5dev@gmail.com>
Subject: Re: [PATCH 1/2] Input: tca8418_keypad - Add devm cleanup to disable
 interrupts on unload
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20260903192942.21906-1-liangzhan5dev@gmail.com>
 <apvip-xz2GFH96uU@google.com>
In-Reply-To: <apvip-xz2GFH96uU@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Dmitry,

The INT output is "active-low interrupt output, open drain structure" (Datasheet §5, pin
table). With the handler gone but hardware still enabled, a key press pulls INT low with nobody to service it.
And the driver requests the IRQ with IRQF_SHARED,

	error = devm_request_threaded_irq(dev, client->irq,
					  NULL, tca8418_irq_handler,
					  IRQF_SHARED | IRQF_ONESHOT,
					  client->name, keypad_data);
	if (error) {
		dev_err(dev, "Unable to claim irq %d; error %d\n",
			client->irq, error);
		return error;
	}

this stuck interrupt is seen by every other device sharing the line, and may trigger "nobody cared" IRQ storms or, in the worst case, cause the kernel to disable the shared IRQ line entirely, breaking unrelated devices.

The same leak happens on driver unbind (I think it's a rare case though).

-- 
Zhian
