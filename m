Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E76CF5803A6
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 14:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788963501; cv=none; b=ZlKzNQ/shm6QSUZ9jNDGadX14SBzx1+Q5TdFmFUpsDX5sHIAIRptjVD4CNZ+BxrNH2gnI57UVs11xrFyOl4gNyPXhvQWM+sUYQ2PVG41iWtYKuI+vBo7+9J4vnq+9/VJbcLvAMAwQ2suemXuVRWj9Ydux5J6YQ86URcXXOmGJMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788963501; c=relaxed/simple;
	bh=Meo9Rp3zohQIqB1vXn367Ag9vMSfnn8cKn1zoX4hLW4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k+dNi2tYYeXH0nNycJ2GDSAX4HRpQ/3t9tyLZyVHIBzAdmEhH2QsxILVpJDssfh+eCk1fTDRE9bNmbQugBhnfvmSrVk7Kt2d8VzKGuSbiHbKIoeMo8EEA4TIuPNMbgS1XY2r0WqeneMuEtNJkL3OjRfRFRXw4b5v2kN66FK/Nl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jOnBo9Bk; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jOnBo9Bk"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c2637dd37c1so539164666b.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 07:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788963498; x=1789568298; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Meo9Rp3zohQIqB1vXn367Ag9vMSfnn8cKn1zoX4hLW4=;
        b=jOnBo9BkPUFs4cN8QKKcLeiXwUv0r0gFRRQGfjD06sF5lAvoEWtnLYJXNu+bVCzP9F
         zKioutOekmhhaHMab/9+Jf0jtVSif6N40gyQfmY7eiwXLqvpSmVvqs/VeXIxshZj2UQY
         xBDp5pQ4WysqoNnvrIFtF9+QsfAd9QhEjVXwDlRQG2kQMhldoupJvPpPC962lJNzB8gx
         vkxz7r1KNj9+j4wz9rlZHNNDZkWFY5Nw8qH7mB8UHSJffTsrQEQq420XdNBlxxIv2gg+
         dxsR5+O4P/Q/nFAch7hMEpTJ9b/cPHM+3Y3CEqqwGYZBifkLAwhPWgsBQXSMS8M30aKh
         7Wkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788963498; x=1789568298;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:mime-version:date
         :message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Meo9Rp3zohQIqB1vXn367Ag9vMSfnn8cKn1zoX4hLW4=;
        b=D4MUjvhQtsF98oHMTNhOxSHb7QSFEilfy9cBWnpUxjBD5KJuiu59JPKVxgBSnPR9Wv
         8ovCnHriXaF1gZkdjcNUFLAxuhce5W8RS22cn2zvGBg6/2Adkqu6XMEkJVY6SoUfsCQN
         AHbJgAgA+TXabcM9GzFnDS1N9/byBNhYV5yHsYtc+gTO9crk3/jAJoCRv6FuKfq8aaI4
         v+bxf5JIjDEsbvcLGynbFHCj51vmj/ax+5496QnBhIZOQ/+Jn2cwkJeeJMdxCgsfRUDT
         Dkv0Wi1oBdulk3v/sB2I/GzCVuR655dcQ61v8AGHLwtO+T3BNXyvrB4aXYSNVm0Gh3A/
         YExg==
X-Gm-Message-State: AFuF++nPu/Mygz7EgQCI0XvkZ6eZGOszJwPI8/PWlEkDMVHqMzXM7kjm
	VBWKC2AJ/yMq2T7hjjA4pzSXSoNg9wO+XKbrm1Wo3bXfD9GMW50jiZDr
X-Gm-Gg: AYBFou0vf4K7C3X4ToHpNMZ/dTLP4gmkpJCCwZekCc5TE0+MkBWf2jl/bdzpzKfDhgu
	ITMhtJXEihCzRsHq8DFuYASE82muS65rbJNcyPDdaoJ1ypuz6frR+t7ocuy5mN8r68bK4aegzSr
	e2BkudQeUNdubcUl4H2Va3/Fh6glmuFYvo6ELtArUGinIg/1GSRmNQyPALyEK0LgN7gG5XhbgRz
	zdk3ucFzpZQ56Ye6cnFcnCd3mUeM9/hD5qINKkNm2zXX451G6sF/bbTt2f0QQg/02amRmBRWAZI
	RVkUAuiADYBwIWGLIrywQfmCizWtXtwM1hEpRDTbaOB1Ke3UCPdGII3eYKtKYJhnM34yd5XYvwM
	78+3xxxYAgVysruo4Rp95lMxq7yGJpyHN1RZBac4wuts/M1Gry0vny9ttAbAmW+2PylXQw7aMC1
	WYbUcSeMCM4ZL9OxDJ4Puf3h6Wi/YqT39YtwZAx5V3aFNSg8tHIuBEidLcMR6uQ0zHil2/ohRAR
	ZuLZ9QBwL7lAlRs0dU=
X-Received: by 2002:a17:907:7281:b0:c25:cb7a:12d6 with SMTP id a640c23a62f3a-c260c9972aemr1402237466b.14.1788963497888;
        Wed, 09 Sep 2026 07:18:17 -0700 (PDT)
Received: from 127.0.0.1 ([94.41.86.134])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d5497cbsm791502666b.34.2026.09.09.07.18.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 07:18:17 -0700 (PDT)
Sender: <irecca.kun@gmail.com>
Message-ID: <7c331e23-d0ea-4611-9bed-d7099dcb41ab@gmail.com>
Date: Wed, 9 Sep 2026 14:18:16 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: commit 108cc873398932af589c295f78c348513b8d70d9 breaks
 update-grub on btrfs root filesystem
To: dsterba@suse.cz, quwenruo.btrfs@gmx.com
Cc: linux-kernel@vger.kernel.org, linux-btrfs <linux-btrfs@vger.kernel.org>
References: <CAKLYgeL7nrA4nXcewdv9Fqg_s=3GS=vmoypnEiZBKQ7rySZFuQ@mail.gmail.com>
 <20260909002506.GF9053@twin.jikos.cz>
Content-Language: en-US
From: Hanabishi <i.r.e.c.c.a.k.u.n+kernel.org@gmail.com>
In-Reply-To: <20260909002506.GF9053@twin.jikos.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello.

May I ask why you guys keep ignoring me completely?
This is clearly a regression for userspace (see my previous reports).
If your answer is "won't fix", state it explicitly please.

