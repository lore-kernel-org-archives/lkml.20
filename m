Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794607365;
	b=JGPPNR0JL3D4PzTuR3ighqRXPExJhKpBoIwkP93cE7q/Y5AbAZut9bgZeCfGSS0id+OO
	 f8fU7sGQBMzFBqCcaj6Dy5Led4+h7ZBuFKP+ILQ3yKLPFVXmHcx7s9nA4AquNDxCpv6r8
	 969Kbd2BrrpzsdlebOIcpsBrVsnZ3szMfxkowXsqEFI+PRV13rENguxjNI+TL3QVBAQ50
	 ew9a3iJheL7OycNLepcnw2UzLxZtAIvJjqOv55bNkAidHjgJDED7ZHOYJT7z2dKEESd64
	 iVNc7Xqlm5SEhb/j6pxiSTC9GB+Ho4tjSQuokSTrUwSLa9em8/0vcWgyBD0noZNPFuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794607365;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=hLTZgrPRMvXWTx2mlzS40LX99kos2rQ4Fybij+QpVFY=;
	b=Cxv6bV+rObanrSVogiwlkL2c9F1ilBIX0Q/7VI0V9UXTX8kehcNl4di7xBYkn4V48wE+
	 jaOc26JapSS7CCb2JOopj8O9JmhxNmSzO1UFfYf7+ASBRDqq7tYZWlBW0/4u9rjV5tHDP
	 edcl2+lCz3RpsxRHhXRcaO+G3ngVK3U0U57+fOs/iCfcez4YoKfL/aLvsM1B/56gFRStG
	 xHFzFTTw2Aldt+E7X+GKnO78ulwZFRkvkxo5nq3ZEOun22CZTuBJ13ToY23lcLHMXTOvu
	 bBy1X7mVbaHTxqOZ7f5+msVsIygH7nYpNbwJpTjmgMXtPtl8jSQNQeH3nf6vVP4yc8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=MxhT712Z;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC43606A323
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 22:02:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDC43606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=MxhT712Z
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso2478837eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 14:02:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1794607363; x=1795212163; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hLTZgrPRMvXWTx2mlzS40LX99kos2rQ4Fybij+QpVFY=;
        b=MxhT712ZOs+9JNd48QhgsCPVX4B2Me3T9nNcqh3+3RQIFoeMHmW6Wl+WlG2eszHG7G
         W4bGVTq7kOwx0uGrHE749/Tzt6Y9ubwt7FDE57ZwQZaq+3mRm8NYBnSD32+sxDnpYi1J
         dgcSCrMRfotrVHqI5i3Kbi+QCZDRMIolbVs9aA+B1iC+BwuNhGViHLF3pMd8wHVK40kr
         JLrUUdyWvqq0c1RzBf2T6Dv00FUD++njrC800eHkQB4c5nh437/q9qqnhrvfqYN5tBqG
         O8kvLa0TcHNt6kJys2AnCLSbPPfn/+e8mL6WHWyTzfXZXIDcVL1HTOm9QCxHfoUZRXn9
         yLEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794607363; x=1795212163;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hLTZgrPRMvXWTx2mlzS40LX99kos2rQ4Fybij+QpVFY=;
        b=tS2PFW1hNpd+GGbqcMgIlY2MF4i5MVIWxChj1fFU2tymhTRs1HHnT/nDJLg4Zq8He0
         UinQqrf3r7MttCrfvbNgB5LOhm1LKhylwDq9ZwlrUo63udxR/BSXNfEa3POXjw/DKYzt
         WVJGWNqValJ/gDZPZj30VITJrGDLcmxaOdHnYQt2vRR01OWXt0YvGzJm7sROJ3BDcYGJ
         ODe7mvQWH1PPP+wGppaotLL8w3slkLYdFJMMP6gCartv74D1pCJ1nLayyeL15X4bfzV4
         m1GAg2bM8LscV2+ZFrbog98XuMuG//sghONidJ4ySlwgrlcTumlFhVv/qrh66BnIA1R+
         ETwQ==
X-Forwarded-Encrypted: i=1; AL+hErFFguCfS/rivtkdv988PbDOUcnRO37fi+ShAQjYJ/uQVn/swd7X+UT2qri7gY7LIhw8eKAlQ2jzph7FGk8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+xub5iEplZfufBnv16APqahIToZ1h0Qwx9FA3s+Y4buEspJndq
	AU8DhLXJUu1vh8jCFMRdcIWageAlE9qQTqIvshFxT0ws7Yx8Esm2bDSp8NOWDO/F92M=
X-Gm-Gg: AYBFou3ZSSbLnLlG0IrH7Ml4+kdDFQr6G8YsEorXjnIKXbU5vlSoF+AdrhYazuJTVdI
	Y6qABVBkVFHY7DZums1lzbfanW/iOb7Pcij/z8rsIKm4zbzx7mfSOauoobNdcKrLyVPYaAJR/Wj
	s4qHeWca9YEnNYZ7+J/fX3htqXBS6DNtFKQ9AzLh5OV6g2gI6G9jo19YK1U/Mn+lMXdU+PlPxHk
	+bUYKNuKzIqf5qYyXbakrqSywLHK0GM7Qzh/uzq+OmhCXsFC6Fh2w7sTCKFyggU2VB650i/ZTXP
	hrxzYWtrPrHnKUkXwIdH5pgNtZDFXx5en/rSkAcK0e71BdpgdT47E28b4VikhobKCqSlv5Onv+o
	uyi1R9kM3/OeVHxSvmGdFAog7jyHB/JSIpfo7qq+qfJI8+TzRQWUJa48eD1JsEyLNU9UYKpTMqd
	Y7MuFUjlU1iTjXvmpa2ExVdKnps7eY/ibxEKk2tePOvIWNtEvLjGjsmZ3TjM/cCmn7+DXnzLKTN
	+x/cuPNIkqh+XJBiMGx42V9waJksS3/ezJZBD9el5Yj9604WCFszHvxv95sR2BIHQL2u2eRbrYu
	zAFsQKDRK8tyaoF1b0Bs4kA6+OretchTEEaK53iFjd/dximVhWOX7apo5Nlyg2tuSmTuefoP9LN
	NU5tz3bP5t44leK+xxEZh+yyljoW+C/zE/w==
X-Received: by 2002:a05:7301:db11:b0:369:fe4c:b48f with SMTP id 5a478bee46e88-3796047be6bmr3147605eec.0.1794607362850;
        Fri, 13 Nov 2026 14:02:42 -0800 (PST)
Received: from [192.168.1.142] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563e6b6dsm16981662eec.21.2026.11.13.14.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 14:02:42 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: Tejun Heo <tj@kernel.org>, Alex Kazinsky <a.kazinsky@ideco.ru>
Cc: Josef Bacik <josef@toxicpanda.com>, cgroups@vger.kernel.org, 
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
 lvc-project@linuxtesting.org, stable@vger.kernel.org
In-Reply-To: <20261113110842.4189035-1-a.kazinsky@ideco.ru>
References: <20261113110842.4189035-1-a.kazinsky@ideco.ru>
Subject: Re: [PATCH] blk-iocost: Fix overflow in donation weight
 calculation
Message-Id: <179460736165.18529.16250644917025390352.b4-ty@b4>
Date: Fri, 13 Nov 2026 15:02:41 -0700
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


On Fri, 13 Nov 2026 15:08:40 +0400, Alex Kazinsky wrote:
> hweight_after_donation() receives usage as u32, clamped to the range
> [1, WEIGHT_ONE]. Since WEIGHT_ONE is 1 << 16, multiplying it by usage
> equal to WEIGHT_ONE wraps the 32-bit unsigned result to zero before
> it is passed to div64_s64().
> 
> This makes new_hwi zero, which is then clamped to 1, incorrectly
> reducing the cgroup's in-use weight to the minimum.
> 
> [...]

Applied, thanks!

[1/1] blk-iocost: Fix overflow in donation weight calculation
      commit: a56d5a485be4a9d52f0d7b3ed0dc3521367cb986

Best regards,
-- 
Jens Axboe



