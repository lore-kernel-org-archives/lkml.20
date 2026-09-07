Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29BD0296BC8
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 08:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788769065; cv=none; b=L4AfxDDthii7O7FNLMYpGBRm9p1P131lcEFKXhbHJ38RFZ5QZLNOvE4cXczUEhezMK4xyGyo56imJIlLvyTIKpeCRMEGrEBuO6YSJFrpIYBGqpoYfam/0DMQ/URKu1hyXhRtcOVg9nRkPjKY1agCIBxEQaU7Nf0N1YeGypHsEtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788769065; c=relaxed/simple;
	bh=jFAWYKmVqe0Mh/SD/Y7hlGGG4XNWYE1a0HpQTiZyN3I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p5mGVa1fQvsbSJnUiNaHHrvIPPs89ODN5zWmlKLPzD3V5hl7GK3Ersq7FrMqA2kD+p0Pn8cBRpqfS+lJ033NKMviORQ+3L34FTLxllriaNmB3WlCxIyy4dwULy8Qec2BXB7BfNk7eeHbkR4mJ3a8aurwOhvYcLE/7jewkyoSPEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=DgxSzYmq; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="DgxSzYmq"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4843e9c5960so3252878f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 01:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788769062; x=1789373862; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SpoPZ0fcd3JuJClRUUCxQoIFsxpcrKHbj5/qQhfrnoA=;
        b=DgxSzYmq0osm/iHYnNMP1f9/uMVLPaPVWPb20EKfEk/mgFlLBpygD2bf9fTrQOHMkF
         cwXgQWNX0YO47UbEBKy/xvUvPnM3ZUbi3aiD8pAl5xqRaz1wzoKEUminXhP++VTIfiW1
         Ybe+QP0vn/NsvIKYUW1rpw+Y3pFw8OLrh7XWMzKx6+rb2TqR4MWttKTtehZ2P+ftE4cz
         Pd+EAnATvNyd1tTo/GHpwPF1MlodOSYMMxz6X94oZfNwbOvQljXjv/Syfm3lVU/6RgdA
         xXuKD6RgSPnrzypU20PzPQpMh2ZzAh/ETB9ocPeNtiaXvppGgzSzLhdVebhyIiouDcLT
         8VkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788769062; x=1789373862;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SpoPZ0fcd3JuJClRUUCxQoIFsxpcrKHbj5/qQhfrnoA=;
        b=qXfPTaSSu1s8BbgrX6ItDygIiEaFEhAmb70rPyknQdZKv7MslGabJbfCKR495EJdKl
         nJQWijISpozsqfLd1X40kvjCNRrox60yC08h6HwbGPLQaYz3G+0VdYTGpCsA8o+Upbuw
         JWkbU/YDPz14+K4GdWbkuYm58iXvDRAA/WUehYK8/TicWfkZAZ3br+fi4hGrWeTuOtAj
         LDRuksJd7GIE6xBincDw3nVrQP392EjwL1TvouT3IqfppxdP6lrdstqfGAgxK1Pa3qsh
         X9vDDgvP2II7vs+4V03dIptxVQ4XfqQVmIp3rTBoBEDTyAUTH7QII5cbrIvBcSnSZRFJ
         kOuA==
X-Forwarded-Encrypted: i=1; AKwUvBwX32HDCJCHsiivUPdEdlX4PuR8z8+wLb6mSJUC0VNzcWWKPOH5QMEqGwH9O3MSnNLu+HpDmEYfGmIl+Pw=@vger.kernel.org
X-Gm-Message-State: AFuF++nfqIs3uWVlwBHKDKyiDDMYUid8qazf7Ci8czR3aD5aHXE7tDOD
	2jM4Ky2boevJFHpQsLXkMmo16cnB1heT54icrpXCQKKKKwzvsDUcZiXSSp3h73nkji8=
X-Gm-Gg: AYBFou0wQs5WZkSDnrEeEzF91aBL5j2xJ6+pwBMjy25BItVUVsXFmyjFAj/9Ds29EOh
	FFwAhkAMCbdN8s3XeF8oQM2r8tN9B/OY4cKafoS3bRfVmANF/VqDAa22gnMtcK0ZCSW/o4uCsfw
	K1QQ2h1ttuGDcFIkZK6laGaG3LLnUb98FUU0UWGEP4ca8izodx83D/9LX89bv3mdzUwdPbMM4Ku
	DxDPXv6DSIlEdzama5ETcjnpxPhKp2S5KZRSUt6JNMc8IstZiwiv0t6A7lT8jC2TKfR9G0xr/SK
	Mze3dbddvgNcyZxMwfM1stQaYkuwXX7dw5zNyoJYb+YqXwIgKvNGHrFn9W2GSj+eGWAdQ1I2z++
	B3+V6eIyh2G45VGWN27LAEJ5ddcsYdc3I8papvckFZMFyCMgxYR3VZ94c8atXn6BGxb76hcezri
	G/qbOgII+lNbTAFUF9xxDBjesQQeGHaszxT+ZhT9ZiTgVToADuvuHStHVN5FZkWzRK0rLLirHh6
	K2OUyA8dsmlrlQTu4TWpJngF7np+rgq
X-Received: by 2002:a05:600c:34c2:b0:49d:10d6:fd55 with SMTP id 5b1f17b1804b1-49d10d6fdeemr36875255e9.1.1788769062392;
        Mon, 07 Sep 2026 01:17:42 -0700 (PDT)
Received: from ?IPV6:2a02:3033:28e:551d:9975:219f:1622:8b8d? ([2a02:3033:28e:551d:9975:219f:1622:8b8d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce58da3acsm802674335e9.0.2026.09.07.01.17.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 01:17:42 -0700 (PDT)
Message-ID: <e231a7e9-7aa9-40ea-8ac6-57855b4ac811@suse.com>
Date: Mon, 7 Sep 2026 10:17:38 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] USB: cdc-acm: fix racy TIOCMIWAIT implementation
To: Johan Hovold <johan@kernel.org>, Oliver Neukum <oneukum@suse.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20260907065501.101013-1-johan@kernel.org>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20260907065501.101013-1-johan@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07.09.26 08:55, Johan Hovold wrote:
> The wakeup condition needs to be checked after adding the task to the
> waitqueue and updating the task state to avoid missing a racing modem
> status update or disconnect.

I am sorry, but in this case I have to ask:
Isn't TIOCMIWAIT inherently racy against the hardware?

	Regards
		Oliver

