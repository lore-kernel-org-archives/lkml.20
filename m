Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794529139;
	b=IBY4Ty45wvUoS+nPU4wzPiQI6RB3HtLBLxXrlpa02KU7HzLU7TUc+pu9tKINZ2Gq4Ed4
	 Lrqu8SKxBMQYOW6ngwujyOrRqXrt5SzsQI2rxIJLyNaM4PqRpBEDS6Hyr5R511jL7/I0u
	 84HmQ1I4gCPUTOuo/eKQeIF1c9SXNAZcBpWyj9RQQOViZHTbc5RHizN3ad3pkkNgRPf/p
	 KVhwKZ/GpYk9pKjSJraLAw9T+Kyaa88trRrIgWg6cAOy8FHUsnOgeM89qnsNa51A5Q3xJ
	 Zg0wlt9MO4Se8xNUIzfnxXMiEIV54BKjTmyVhu+HsA2LhsZVnubfhyocTF6Pp4IMtAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794529139;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=fPaLK6QLsjM9GhI4n26+oRseR6mkB/Pf0pWe+JhwF8o=;
	b=ZU8I+owbiOH9/faYYmML5sodFQu8pqZM0IzI1M64YbkTvdkaW2Qspow3okxMMHbpDMJK
	 LiNRJ4fv7j4szURrRAZWErBpqWWqK97ifbuv3s4UThFu176q0kxjp45dGkGUC/Ik4rSzL
	 pfgUN+9mPU0MnnjyzvFYU5EGGDH1CgjDRV2duMvr9x+A3/jZ1GxU/UqbSRXuoUhU/KcOI
	 pYygDildzfpXo2q7ummcDewkulvldzYKl1FvW2KIeOXqY3V7ndi6LHA1DTeAiFc14pkvj
	 rHhqATMOG1fI6Wm49lZkaNbdw1U46F0Ju3rJRDt+jgV5jAAdOXcPsg9AhlC/P+ehYjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k1fNOd3N;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D16D0606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:18:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D16D0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k1fNOd3N
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-36fc0a3fe93so833831eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:18:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794529138; x=1795133938; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fPaLK6QLsjM9GhI4n26+oRseR6mkB/Pf0pWe+JhwF8o=;
        b=k1fNOd3NlRdTXxhWhXAaRHir0ovRiSeCx1OvumfTcWjNOPDP/i6HeFq3bPHZLrAZv7
         jV1U7pHYbXPgP55Xhm+YRUK1cG0WZtnHovk50aTgGF9BiUNQ8QoY6jG61TiPP5ki9B+c
         IDODvPwJkwGx++b3gihIQgbix0rI7fd/3OYRbZSqHoRcJTd9i9fE0XN+2x9YO+e6Ou7I
         VCVB6c9uKVIpmfbpjxCwAxGcQ/82O3aE3Hwu8e1EHZlWphIpzi7fEtqzzhWCfK7EKb9a
         YMWwK43aC/eiEqB1yqxaJGae+dWLnrcCGPe8ETVsEN69XNkk81nInU57v1iWY47WkzPB
         0azw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794529138; x=1795133938;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fPaLK6QLsjM9GhI4n26+oRseR6mkB/Pf0pWe+JhwF8o=;
        b=mQB8iZH5qRCDmZeuFJI2V99rlbng9q4n+dKCm45FYbF/IWsc52cueBec9ej+X/B9hp
         LzXS4YI7+EPcmPcKu87YtdF1X9c2amMGzZ/eX693pMibtU8A+M9ZrskZuBQSYFtlhBs6
         Qog+aXYH4rZooChXRDXfoTJpcUq2hqOFoix1PUDfpEBUz/4a0lPx1NiWW9vo46TQBa1t
         gpbmDd7Wp5rXo36A1RXZoLQriu9eBeQ6QTeUJg3xnPF7K1hvNCOW/1dli8t5mmMDRYQc
         Q00R39w/RWSIjdLSk5NocbpqvszoC+iAlp0AZjmAIJG11E1mPHH1ET/4n0ghzqAmpJqf
         KESQ==
X-Forwarded-Encrypted: i=1; AL+hErFoh12V5bE6WpUzEqXvh22sRro51lbkCqVhhFfWo8IPg/alB5kyAaH5q5ttKcfPZv4CJN2mXFVYaniuZCo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/2W3wQlpdg1fEWHZP9kwxEa8vjRwRJb9k90Dw9nRPnz1HNRBMX
	eH0uQIPmHqLeLi3vkP1xSpGVOjw4VHgNG4njsrOWRurvQnb1VMBp62oG
X-Gm-Gg: AYBFou1SoqrtawCa0O3tjFf5RxCa2hZlC71DCza5fVEQzF4Aswl8ffTBe6ZSt0qLmyD
	wUMBFzeAJJSWdzVb6lyvQYuIN/FPfGdo1RnVkiQzRn3sDHaZkAfo2aYQKFUGcbJi+kFBtK7FLc9
	ThhtCDz00KfNpbkDciDW3EkVzTj2DsACOCsCy+O5dW+9WyoBKK90ACkKOV+H0p4Pa/2wq9g/iJ9
	+QML8RusddH8aE/c9QL6zvAU5FaL6LqutkhoYc56sOapFSqKlgciaCGpJLUBCPtuuQy0lbsWf5l
	nVo0cYG2hxGD8wPoJippRNwSvkLu9umSGcBoLTQcyPIb2iCRdUB8klCkZ4Wz808Wo4Lcf5pEMGq
	BIJMSt85uqJaOXceOblyufYswqy67aC8cyEeqeLPm5NvDRZmPMmj6855y2k+cCmD+P/hJRBAe5F
	GprVqZxsi/XekFpigLGK6XmaaRvAerDFoa0OtJEEjJaW9pouUv3LyUfORnNA2KlMxx38XmKrDaX
	o+xhx8ZoPS/I3uYtOTo+2wuD3HZUFkYjGpiqUyOXAK16P9phc+CaVK4X4lnpjxdSH584G101gO+
	IK3LrEj1bjaSIgz9Fo8P0QQnkNXBFckApkxBfjAfs4XM0XHBIZHaPdCgA41LMPfLqSFwMPRaJCd
	+3sH2wmPn/OpZ/mbD6d/ue8MlTnR2
X-Received: by 2002:a05:693c:83c3:20b0:377:678:231b with SMTP id 5a478bee46e88-37966a591dfmr776107eec.25.1794529137923;
        Thu, 12 Nov 2026 16:18:57 -0800 (PST)
Received: from ?IPV6:2600:8800:1aa1:b100:fdba:2418:657a:1a53? ([2600:8800:1aa1:b100:fdba:2418:657a:1a53])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bad6casm1675676eec.26.2026.11.12.16.18.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 16:18:57 -0800 (PST)
Message-ID: <f3707b72-07f2-41ae-aefa-c46ef84de3e3@gmail.com>
Date: Thu, 12 Nov 2026 17:18:56 -0700
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
Subject: Re: [PATCH 0/5] drm/vkms: support more formats and fix RGB565
 regression
To: Matheus Alves de Almeida <matheus.aalmeida@inf.ufrgs.br>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Melissa Wen <melissa.srw@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20260928005301.367977-1-matheus.aalmeida@inf.ufrgs.br>
Content-Language: en-US
From: Sidharth Saha <ssaha2000@gmail.com>
In-Reply-To: <20260928005301.367977-1-matheus.aalmeida@inf.ufrgs.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Matheus,

Following up on my earlier report: I've now written KUnit tests for
the conversions in this series - argb_u16_to_RGB565(),
argb_u16_to_BGR565(), the RGB565/BGR565 read paths, and both the read
and write paths for RGB332 and BGR233 - against hand-computed values:
zero, max, single channels, the midpoint, values either side of each
rounding step, distinct per-channel values, and a read/write round
trip.

All pass with the series applied. Without it, the RGB565 writeback
midpoint and rounding-step cases fail (truncated instead of rounded),
and the RGB565/BGR565 read tests give identical results with and
without the series, so the helper conversion in 3/5 doesn't change
behavior.

For the series:

Tested-by: Sidharth Saha ssaha2000@gmail.com

I'm happy to send the tests as a follow-up series once this lands, or
you're welcome to fold them into a v2.

Thanks,
Sidharth

On 9/27/2026 5:52 PM, Matheus Alves de Almeida wrote:
> Hi,
> 
> This series adds support for RGB332, BGR233 and BGR565 writeback. This
> is done with new helpers added to make conversion easier. It also fixes
> a regression in the RGB565 write conversion.

