Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9397930F95C
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 19:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790451673; cv=none; b=dQz6sc+Kp7e1SFrXHteplWD4JXZZtUQXTdOp079Mbbm86P7Qeq576wlc9/fIhwfKT8Yt0L4QzsB5+AL5IZdE0Z+5Nq3hzn0wPGa2aZ9s9sEhsUpbFcwYVGHp8+s72RDANc34epSWpBnkEEIKYuWxmRbZo0qMK4L8t05UNKmsmMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790451673; c=relaxed/simple;
	bh=npEuW4n7TQQHCUOPnYZM7biNMGZ19hSLwSgxjFP+p/8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f7RQDAgkavy3dFmU9ExoMKQA9rTWx258LOYvBp7+aHfss40OXU8flq/8pEXVFtBsH7Xer3OS7D9SlfYVJuywby5qMo0FdE+tqNN476thVhGNhBNzpYQCOSdfE42HgQy1Zla10J6L9TuewyXlwBH99G4hU7ronK6h5scLzym9nYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=QeNsRfTG; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="QeNsRfTG"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ffa15f67fso3403525e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 12:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1790451670; x=1791056470; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e+beTysoBwhop9miz7Sgfjczw7HyI8kJXP0d2yfzAYI=;
        b=QeNsRfTG5Dd5b+IN/hQWiAoEmLoibW4brZZCBXmNalYwrY0t6AV4ny10kO2qdaDQBQ
         EWoqD+YNeVBOavjHxZwgDsbbXXdjVCYSvYfVzLcZZjLalqiOK9sBFD+awuS/DhSTExDk
         hqFVCO4lXEzTo6v/PxRbfesmKxplMkzdT5x3s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790451670; x=1791056470;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e+beTysoBwhop9miz7Sgfjczw7HyI8kJXP0d2yfzAYI=;
        b=bWUUcmP2u5prGkdip446xj6S1D5w+if1ObueG/jt3PAy2kycJQHjau+vuwBunJsHnk
         75MQwI1K+6bezP7ewctrdJzP/Z5F24s/XNl/FVmLeYg0f+z8xKEwORoq+ZTNwHPjIW9A
         hjpyNaobYbFvo4uN1WdgW1rUDhC/Ef+aPYxRGUjx51LCbGYL8ICyTBx2CY1mA3KFzmKE
         u5pV8UgdGgOmLaJaSUJwoeEAIIzmcgxdBLwudKN9h1uodiJBPShPYg1I2E3efAEifUEy
         cXOSYWdTE4JDaTL1RPZO8f1nKy7nTWqrYSXXO2M26zYlQTHYL0pgBBVP2HKSAbIf0KdQ
         rsUQ==
X-Forwarded-Encrypted: i=1; AKwUvBw6HQnDFHnr5Pvy/D4f7ZTxDSb7ctYkoOtm8JfQPdsvv1Cx+UyMa3tKlY2qHgA5DpZQMhGLWBJ/ijDWwOY=@vger.kernel.org
X-Gm-Message-State: AFuF++kY2kVpbXuVRVVteEjlhrV0MOkss/CSBD28rAtsGnKrCK9cz+cZ
	4zyABxfarZ5bTBa1ORGm0TIXtjz9AwwjQfpVtvKqUXdAKHluIxLenakXhYnAAS4Hcuk=
X-Gm-Gg: AYBFou3GrslbSmADekMVg7EDbf4ONY7KD9kbIDornrlG/t6Lb7q0xrDogh+xmQF6Kcq
	OHY5LCDad0PkFuYk5kHadFqI48gp1rnE6Wep6ompueBsukTeMnqimOBYRBrSgK5gF7Ogwj2CnBi
	gFVB8dN1xlKg96+mwR9fbUxhbqgKbV6Bw17F8pMnNJVtMbWida7LPHHMNGrNgaEaKVwzeazQcxP
	HfkUnGOZq/HEDkvK8zjLqW248L1TwGS1+hAIlQAfAQnsj36Jcj1ICD9BKxNUYc6CqeeX52a/NOh
	bEctS6QhNecicuqiyY0KDqNQrGg9XlNyz2VMWLQftiksaF2g4/RP4KPT0J2+m2TJm7ci7jgIpHo
	f24K5de3V0MVmBK5CRUiZtVc8kmC5Al02iHJm7W2QIZy8xWW+oFnv66OodYuvTAiDrzKcOt/C7U
	pVB0IPkPf6R2T7iOOq/NnrybJDTaVV7+H4KMGEUd6gbn2WoNgFoS3xvuYutro0rxVQOF+M5Jb8y
	DwCnpU1mFKLGoE61ZiJT1jFc7M9Ns+pyM/1k8kCFyFYCvQZLSdnoqxcvoYd8CrkW0vk
X-Received: by 2002:a05:600c:4685:b0:49f:fd2d:23c7 with SMTP id 5b1f17b1804b1-49ffd2d25bcmr36825035e9.27.1790451669577;
        Sat, 26 Sep 2026 12:41:09 -0700 (PDT)
Received: from [10.188.205.27] (cust-west-par-46-193-1-237.cust.wifirst.net. [46.193.1.237])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff06cbd2dsm150074965e9.12.2026.09.26.12.41.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Sep 2026 12:41:07 -0700 (PDT)
Message-ID: <3e4774b7-ef55-4288-864d-a5a9313a81c9@linuxfoundation.org>
Date: Sat, 26 Sep 2026 13:41:05 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] usbip: vudc: Prevent transfer timer rearm during
 teardown
To: Myeonghun Pak <mhun512@gmail.com>
Cc: Valentina Manea <valentina.manea.m@gmail.com>,
 Shuah Khan <shuah@kernel.org>, Hongren Zheng <i@zenithal.me>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Ijae Kim <ae878000@gmail.com>,
 Michael Bommarito <michael.bommarito@gmail.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20260923022033.957777-1-mhun512@gmail.com>
 <f1c55b79-4487-40db-b2fc-342b2dc33c1f@linuxfoundation.org>
 <CAGEsz8E7TT0SqSPxpJS7QbAvAwXF8n6_ra4VPvN=q0SHdavm0A@mail.gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <CAGEsz8E7TT0SqSPxpJS7QbAvAwXF8n6_ra4VPvN=q0SHdavm0A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/24/26 15:44, Myeonghun Pak wrote:
> Hi Shuah,
> 
> __must_hold records the existing locking requirement for
> v_start_timer() and v_kick_timer(). The old comment was inaccurate
> because v_stop_timer() runs without the lock. timer_shutdown_sync() is
> the actual fix.
> 
> The QEMU harness sends CMD_SUBMIT packets while repeatedly unbinding
> and rebinding vudc. It reproduced the bug before the fix and ran 4,000
> iterations without a report afterward. I’ll add this to the v3 commit
> message.
> 
> I have not tested with physical devices and a remote client.

Please don't top-post in responses to kernel email reviews.

If you haven't tested this physical devices and a remote client, how
do you know this change fixes the problem. Sorry I can't accept this
patch.

thanks,
-- Shuah
