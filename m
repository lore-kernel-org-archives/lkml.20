Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794834514;
	b=eUgb+371hJzzYO9DVRelbk184hj924JMlkCgUbzAoN13x99mkdjTgMbeovQ+M8aYRrCE
	 wjZi+W+bGWjBNvTSvXm16EBZxNxZyRagyVCGe8/IHMtLsYHcncuP2hU5FET4IpE/CsN/W
	 2PiZAOvxyfsoqv7LkebEkslMRiLuEwNATFbvE4F+NGfxnTBqo5eFUFwblQVjZKpq7M3+z
	 lyPord7DlmWW13Cej1+sVxBwaUH7RLvG9wR3s2aSDf2/IeEIcJL6sUZt3Ieam7Mmjyf9X
	 SSqlB9xGwZuZy44+LeIhfLeWuPvjcXGovXiC2aBJuQ7PnwAS4At6JOjFp9wrwyVoovw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794834514;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=SJJ2qpANvyTR8K9yLqvEvSV/pVuGUPXCU9gwVqvlEl8=;
	b=uEUmlEMp4XHD6Qod5dHPgCVq2wUOMniZKT3R1PwtVUdbnNURe6bLKyu1xUG5v3MfeNcV
	 1rLc8SCBwUtGewOqNm87RFbNcV69Y5DvAjGNM0PNCQ7LXdN70tt5csukq2llXjkbtic14
	 Tp1ldwvtB6B4d+iy4TLFGy0DOP99ey2y5sA8WplyoNZc9qMSYlvclqPNnVZubv5prheki
	 2rqDsSV0dz2/rqhkrtoJDmWgI/lxgiLgpcZOX3Xnw9xDDRGSeNNGJsx8w9mgmP4KF5hbO
	 yA2Dvfk7cIHf1IrOdIxZAHgVy+E8qJdQq6D2kmwokR9DwAeCiwSnpM9QVr4x/J8EGWg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=PnAQWxel;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.51
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF131606A335
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:08:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF131606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=PnAQWxel
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-705cb6ceebaso3748959eaf.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 05:08:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794834513; cv=none;
        d=google.com; s=arc-20260327;
        b=bybyh1jFzsZu9tWpJxrJj1CsJSkarMITT9eCfu4Kp2qmZhgKzn/EZ3LyQsQWw16zS0
         8sJV0rOA5z84aqP0NAZMr7Jiw3dKHiSHFI7xeB8j2H9CO9mBpAMmuryNBxIi0XpM3Ba1
         YR6MZxA3MOTKL949ysGIPCpVtbb9OYd1CUYBT8Z5PMiUNxKH/z0hLKKxh5GyTGEZf45c
         wFjxE7zQbW6ed00Co2VMQH6SiQsUnSn+zskQyM1aII6S8pZziszODG31UB+Uno9J/x4B
         wH8xcSj5nR/L+/GwPByScT8WC34oHkMhCYs8jIj2QNuRIvmTLUL6G/ONu0RsOvY2mVjP
         4m0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=SJJ2qpANvyTR8K9yLqvEvSV/pVuGUPXCU9gwVqvlEl8=;
        fh=8vTWrr+ABW6lx8zwY/58X8e7Yvy665Fw3dO98h1tWrs=;
        b=BATvWYg46O/BBw7K42hj3ziUF+RDvhKyxcHh0mNIopaXKlBQNUeAwXQ9aW8bbG33Z/
         GsZCTeM7dreONadakEpVzc91lWwbycEPMuLuljEagS6NLxE58vPUihskMhUSEY7zh+F7
         kL3KAPCngiLziWelGFApDRRkQE6YpuJnvCdhOLmc1gWIqfDSHyziiyNNWhFIKLcgZvqL
         ryJhWtvu23VOlKqYUF79TqZPPmhc8YG6H9SS9oB4aHTzyg0sFMbOgz+gbMxmZDD91aiE
         H9+3uVpWuqicUcNAlwwAPF/2SDcvwDbmf8tNEmQQa6LWoL9vtL5R3/zvKqYGR/M8TxFt
         QkEw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1794834513; x=1795439313; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SJJ2qpANvyTR8K9yLqvEvSV/pVuGUPXCU9gwVqvlEl8=;
        b=PnAQWxelMKwpd/v8tbVyyOErhLwWUPNbTk2/4gueCFwPgYw6eHD6HmaM3cU08ZM+j6
         oa5z84SDbXbMpZF+YkdoogskH90WSyO2Rh4Sw54JrWdnYU2ENifHszT2VKQRClf/mV4k
         M6fLcrjpThvrZs59s+qKwl9uT9gWAo09lPVxe3keTMIesHftOhFOnMXBoTQoKklyIwpu
         8xcVN2djQ6sruVDJvP0WoKsKGqpL+A1PFZ6/qAdLf+9fyy2wE07uL2z2G2z+kbl/pSDX
         wohfgUgE3Wu4jCDfFixk85aNjSVvUrsuIr58jeTwo715+6AV7uFFgbcRxPM1CXiTWWqn
         AUYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794834513; x=1795439313;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SJJ2qpANvyTR8K9yLqvEvSV/pVuGUPXCU9gwVqvlEl8=;
        b=CqOHWNermo3dz3equ5pH1E+dSnyTBmj/6rgP4ly+8HPaBL0r5Gp8760LbdM6cFAwnj
         3UUR79PcLuHhyjRS51WJ0EwfFW2hdwZo5lGkohU91sUB1W6u7tulh1O2V0Q+CJ/JymcW
         IUfzzB8O0JYvT2oOpVhQmHUD3anMuFRZ6pfpohp9VuXiORy3k3IJTezkZ204lCrDq0pB
         goIO09boobjqqnlT15txmRkIte5M++W/aIwjUsSqaijWmj958gu8apSWuR3AYB9+iBwa
         UDCIOn35/BW1HEuSkldaGego6QR+aCz3aM8sAmXOgzAd3uJ6dSJ//WLfDAQg2BuosQiX
         gOqQ==
X-Forwarded-Encrypted: i=1; AL+hErGG1cx9S92dQ2oZjy8ohy8MBk5fVJ8kSR4KoJjBx/wSWoP2KBQHBW1RpnC9ODIqyKdZGFtzt/zCaOOVj6A=@vger.kernel.org
X-Gm-Message-State: APuU4Z9BXu5hlvFNV9Ue1hnE3GWIhT63hwPAF/9rEPbPoVBObFLMm3Tu
	keq/S6+UyHoTzbPnLrqXvSqfiBH8sbeqhiiVZhwu4BkerpH8tuF3UPvO6ruGS6AFAk6dPVGF0IP
	VPXxdlgm4egeQ11fGRdQybXfKd5FmFN/RdY2RquKbBQ==
X-Gm-Gg: AYBFou0ufP2qI7UP27yf0JRVDK6GMjSXMyDRYE9ep0wY94L7g/KiftPVYCKFQb2F6dK
	vqldWQs878fjihEuGBGJBHr5xpDFLlRhh3p+Un3pWMDteZ9lBcBcJOLxjx/4LLFCBJO1kjIZREy
	VOW6OjOxJJsBpiqX9HlMH6XlxHL7qBK3JP1ZTqgEHFHGM4MCzO9mXgLKdsQj7AGZJoI/RlkPXLN
	7FFjq5sHnnt7Nj2X/MRzKXFEAHOQfNtVZdhwigGU94dy1n7rifZBZQTd18eP5e0C+KKRg4E/J/J
	8eg19nu6L3xHwARiDH2QTqnNB9Rt9SpELJV4vV+lhMBtFEeCCTOHupjnMVbmwxFlCwj7Cc0VQsH
	JyMBgwRXuaK7KM47nORBIxfTPXnYwGK8Ys5KUOzOA1Xr/JksKD2lkBFZ7jBCb75+UyxyfptWbmC
	SVCocGexzjCg==
X-Received: by 2002:a05:6820:761a:b0:70e:78ba:1193 with SMTP id
 006d021491bc7-71ab4f10ec2mr6796326eaf.27.1794834512803; Mon, 16 Nov 2026
 05:08:32 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAG4wq-cd01i7YrcFPmma=BXUcwn_PK=wneKW=vyEBYzQ3Bn7QA@mail.gmail.com>
 <20261116084107.6675-1-emmaonana18@gmail.com>
In-Reply-To: <20261116084107.6675-1-emmaonana18@gmail.com>
From: Tianyi Gao <tianyi@cloudflare.com>
Date: Mon, 16 Nov 2026 13:08:20 +0000
X-Gm-Features: AclHuK8ATNHdUFf-g1l7OKHnDpIsGdknxqvgkzdQ5Cs4Ojj7SzQBhCC284Pvha0
Message-ID: <CAG4wq-fhK3Mav3vLFUVYZhiXy9oF4CdazxkbOK2NNy7-KoLyXQ@mail.gmail.com>
Subject: Re: [PATCH net v3 0/2] selftests: net: veth: propagate check failures
 to exit status
To: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
Cc: Hangbin Liu <hangbin.liu@linux.dev>, netdev@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	bpf@vger.kernel.org, kuba@kernel.org, davem@davemloft.net, 
	edumazet@kernel.org, pabeni@redhat.com, horms@kernel.org, shuah@kernel.org, 
	ast@kernel.org, daniel@iogearbox.net, hawk@kernel.org, 
	john.fastabend@gmail.com, sdf@fomichev.me, skhan@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 16 Nov 2026 09:41:05 +0100 Omokefe Emmanuel Onanaroghene wrote:
> Changes v2 -> v3:
> - Add Tianyi Gao's Tested-by to patch 1 (thanks!).
> - Add patch 2 fixing the remaining three checks.

Thanks for fixing all four checks.

Please be aware that it is recommended to wait at least 24 hours
between postings [1].

[1] https://docs.kernel.org/process/maintainer-netdev.html#resending-after-review

Cheers,
Tianyi
