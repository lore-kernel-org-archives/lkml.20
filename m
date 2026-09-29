Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C681630FC27
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 09:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790672749; cv=none; b=XShfNRG2QDk3ptHRW5g5DGnYrgwUnb35Y5WTJfhBXRxWyggqR4oPVwI4BnUm5izC3fpjm/KxSqcr3y90qg2uXDB6nxN0JXd1SP+KN8NaXFR7smjXMQAXIreXEStm2Lfk8Qp/KDTbVzbnEytUQjeS05v+5/I/nutOnAlCtL5XrqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790672749; c=relaxed/simple;
	bh=dOxCFITIjjfNlVXHpkNOWJqmhuzYBxwX52SfV4FFHZI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BPD9zibArpvoe1Zht3V607U11V4/E5aKKRQcQQ0rbV2dWQ1lMSP3ze/hmUiA0rRQKX8hE9j63c9LbCtKJvX5NkFbq9usRqwXp2adgl9HIAWCrLWwtHTDyFRE/epP3Mt+1NXVJr7YuJRc6Iv+hyn1NHq7vOf84Q/Z109SfNZnK3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dd4nSPTV; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dd4nSPTV"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-8694801b07dso187444b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 02:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790672732; x=1791277532; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bevleajp85eun+yxjdnuf48AUFIAcQWpSDeUosrkt8g=;
        b=dd4nSPTVjvV+YRWujSwHY6fCrK4dEmOXvgnXKZYa/KSejTHo/Y97ptN/FSNKUzz9ta
         pl2XTalgy9+bC6A1JmdgBZAxn15pyhhww3w/9PHPzQfzNaRHaNTm4Van0H20bq5zJYdo
         SzIpReHrOi/93lRUw5NnRwWRITf+G0yPJ9VIGeIfgFM0CxUAGDyYn6rG1IlDaouG7Skt
         vFde2kg7l1nXjbe373GhA9mFaA5yhuTtpJc+0rPd9SNalha4FB8IylvDw5YvP8GiJjR6
         enZLewsgXWW2eHSHcb0xITjYE2kZDnLS6qORjD1eqxKoxrhHmCXHoF7v0j4HA9p+DugG
         XSIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790672732; x=1791277532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bevleajp85eun+yxjdnuf48AUFIAcQWpSDeUosrkt8g=;
        b=isGyI2V3DDk2psXm8BuuuhEEMDwkIF7GjSVQoFCLIpqOI9ermYQtEZuckpgqHfAGGM
         4t1wJUEKWnzSs6BZD4kyab24DFlV2EnMZVNbO2bQP2vdio5MfL2glPa1PqscmLWGEFmW
         xLBvSmUjAtBHzGrQrIhgp1hYlV2LC5NNXxIPkDDNtOqZLI260KRHPosrn0s25NdzyxiO
         Crl2l5Qv7bAyYDWTbtUEkQ/kahs/4PIKl71JlCL8Y3fTTftOuMPIlL7yLQV2/Lj/iwZ3
         vC/TmL9EWxqE/OJYmECcLWMhVEQaOQYeXRzmIu1ReaKuSo960tMD/NnbY6RqM6GpW8zH
         jY+g==
X-Forwarded-Encrypted: i=1; AKwUvByPXYnyc3XpBM2eF6Oi9rcVR+TPaDPCvYoV4eh9msTmpvlyCD1UQQoy92Swkfomw5TQyeNsdPXFLmWoG1k=@vger.kernel.org
X-Gm-Message-State: AFuF++lyrtxqmD92iXMS76tFBK8Mdz4kUwmzGFQKSJkbIcGFPb8a/28v
	zkXM4EvZBrvO4tJBeS21+J/4TFz1ZtpfQ8fFxrNuZypy59y7zoBf1qQM
X-Gm-Gg: AYBFou0gFqKRJIzGYecE+xdbJsJbeclOjsZVADoPzacPikBbKWbPuUG0RLGKiZlG862
	723CRDEiwo+Axy+BBYUnqXkq2m3B/gUz5LqLBjpTGW6VDpueXM+xFerb5nA/lsoP/KaXlF0wlmw
	vKNhCb7/rgkrbm1N5FsggdsjmcEZLySiJvNcmHkBvQzI/UL61gZ9L7j8pGSrBHmqRFABi6ziOz+
	sLBiG4bgpODOsSbFWo2viJ8x0iKkJbO9SsVvuO4CVkGhucAzsZo+xX/UiRo3noCYwS9CD8n4PBu
	M0UzlatnPZmdWI3j0Ami7rv6ASxeLRqTHHUeHoSMskxp4BkQuHn9up9TH/MXQjMkZlV8bBOG2Il
	OYvzd1Jx8VzUEGIw9hpNVkp/9XglY1JsUtlw/j3yWilIWd14wicm6w4led5z205lWvWkTNFAeKI
	4mDVyctkerL0LeZIxIysUvxYh2mQUmK92WKWo+wRvZ6yQLJsnuY5cpEm0+QuZLGxTH6p8VPyrzr
	pKu173+ydRVaX8=
X-Received: by 2002:a05:6a00:4a12:b0:884:18fb:edcf with SMTP id d2e1a72fcca58-88418fc0398mr4492868b3a.0.1790672732392;
        Tue, 29 Sep 2026 02:05:32 -0700 (PDT)
Received: from jfliu-sfa1411.. ([129.227.183.200])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-885e163dd4dsm464701b3a.25.2026.09.29.02.05.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 02:05:31 -0700 (PDT)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: krzk@kernel.org
Cc: abelvesa@kernel.org,
	andersson@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	liujianfeng1994@gmail.com,
	robh@kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: arm: qcom: Add Acer Swift SFA14-11
Date: Tue, 29 Sep 2026 17:05:27 +0800
Message-ID: <20260929090527.105522-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260929-inventive-hidden-sawfly-03de2b@quoll>
References: <20260929-inventive-hidden-sawfly-03de2b@quoll>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 29 Sep 2026 10:56:43 +0200, Krzysztof Kozlowski wrote:
>> ---
>> 
>> (no changes since v1)
>
>You changed the compatible, no?

Ohh, I'm really sorry about this. This should be from the v2 commit msg but
I forgot to check it when doing v3. I will update v4 to fix this.

Best regards,
Jianfeng
