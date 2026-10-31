Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.208.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793476354;
	b=F8k7o/e6naYaPFNjkCRUUaj6FybCPekW+DSP4z3bib/Xf1DmpRSd01CIxfs+8Epnxwtk
	 a1D/lo230jGMlzUrX8/vI7uxZOjNnUSo9U0XY1uqxpChr9vJ0SgCrHh6iyBxymapcmD3l
	 hxW+OdnfvRiKOV5k2EBHPxdxeUf3fbTUfRt5otu0o0JR8tW2Xs7oMlxMRmDITC0IauqHg
	 TinvkTVT+gGBQMXjqRpIU+JMQ3pIEAyNoiOvgwTSxncMWec1i9DuJvS7hR+ppwziur9C+
	 2aw25VPDnzfngMbysO6jsdEjN42y68K7grGvX6iy3QcdVQRuCUNIP8/6PUJTuE4xZXQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793476354;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=ymL5qvPWIyrF5/LXgeDe0TiyyznlTEQO60Qfnl1OooM=;
	b=JrTM5KRrpZ7d9kjtOIaitMm0ahBU8Yz2oLL1BD0f02QNQdWyzgZBX/6ky9jJU0kB58KD
	 r1KPxXRwGIYptekx1AF/VUNC/WhEexiLSIwIBti2M/49PQ4yD8KJbWIXbuDWOkwosukPj
	 4yBkDu8Wzmx000gHLr3XfgB51khfqva4nNJ+Y3OjEaWJAC53wuBof/q+J4UpZR10lNe1e
	 QeK2C7vif0yIhoRcEmz9aF4ij+nxtX04SJztEcLHmCVQfjA1TIg30S0YfdjgzEBQ3pAq0
	 OQFAJrZkrbRVpE57Ml5Vs3Gnhb0dChZ7dq4NNJ34kuchKv2Ug0PEkb6Fp6twhpStxMg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="sJ/qWUYe";
	arc=fail smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5BD4606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 19:52:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5BD4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sJ/qWUYe
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b45f9ec1ceso2002235a12.2
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 12:52:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793476352; cv=none;
        d=google.com; s=arc-20260327;
        b=MRu5IIiddBFlNdjbTDYzrbfWAhL9jt1ut8Ohm63zw9sVZt/dTOoglBE9cIP6/Dfl+q
         JVMx4C49UEHQd3yKjwUhxk0e4H1ffNCpbwieR9VMiyWc8nhvA113RjH6Kb95Az08i+wH
         XSOdYoPVqm8zUtV4QbdgalMEA5jMUYmHszcvbOmMr2lkc/yJBcPEdUf1dKNN8wPmbeI0
         6/r25t6/GNNSr6o/4rh/daimCQvgT0LKxe1YMXtCD0rUMC5Vclm5hKzf79Gk18HB86Tm
         NWZyRIGpcZPvvhytQQWTc9r0mfGYE/lqdeLlZhrAZxf7jl+BDywgFgSJ9QM2oFVT/tcH
         ZwRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ymL5qvPWIyrF5/LXgeDe0TiyyznlTEQO60Qfnl1OooM=;
        fh=B2yX254/t+snzp1W4NpxsFWJLr0ZEVC1PR5qaXS9sbA=;
        b=PEKYxscRDJlUq3bIqZI9ugZuXviSF1bdHQzqcc6xDwct0LKRkZGR+ol6v0ukzen4yR
         XGlAkcg8ibNVUaF+f5xFlInDxHH1bD9g5O6pxjCh7NvczAHdKWxeje4L/FalzncE3gb/
         NG7jQ4WrU+FM25KDhLQbsMCG1cnJS5gnYprqv2MBb2gX1k20CP2orlnZlEuCEtYTjw0u
         eD+25dPwE4Cyc/i/s5pRdXGQjlcOuJQFsSiJF6VM+54zqvefNJ2q8QjoPGPVQIwsoy2+
         w0Cg0DmmUAbkfHH9g90ZsH7uk7a7TWht2JvntyOJVuaEh++g/HrDtz6L7hG8GGNVn+MC
         almQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793476352; x=1794081152; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ymL5qvPWIyrF5/LXgeDe0TiyyznlTEQO60Qfnl1OooM=;
        b=sJ/qWUYeZK3rLitin7DaQ9yR/pCebouLwaMLZeW0zFLKw3JOTi5tpBBOBhfTiigatX
         aNkDwjzEzA25nxematR9HFA6xoSmHuw96vCPGJUk6ZkK6VDZYcY6UPNzAvwAmEInCkAQ
         /yjyiOxvlwkfygsIpVxverGM1ljusLCQPI2fJBrkpbmAEpByvCxX29uKySihIIXlY1By
         gugiY22kKh3IzGU/m2TyxZT88UvRA6yrv9gXEwOY1bBm2sdmOeH9iWxUJRyRTKN8XkXg
         z0yuTAwJ9XrK7vYBDJMHtBR8hNosaHskp6xxZVhUtQO/lIJR5AEERY8o5PyjlFsok5U3
         kIbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793476352; x=1794081152;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ymL5qvPWIyrF5/LXgeDe0TiyyznlTEQO60Qfnl1OooM=;
        b=sjRydM9QkFlGVzQsLeB26AYAuAIwgbqfgfg2+nM2QffSVmWf51E76eXaXsVH9N10b6
         RVE4d2oV/mSUAmxQg9w67FlxUANjAi566sEBBjNNa5ycXUK/zXpFU9yH5iqrSUE+lPec
         8K26k5dNu5J+fRYpiWjh/ZdPDjMeJssg90Mzgmif7oZBsyvdT570VOJOuD8KruD3xA7N
         SY3SHUTwHohd85x0Wm5tXAeGuOXcYTsSun7adL76dTVASJH6kf9TfwALzGJ1Bok/A5LY
         0CAqrhVMdhu0hpOPcKd6BKGccl57Levn3Hd+1x27AjnwU3UAfLVfSY+kI1G5roWfwqg5
         fRJw==
X-Gm-Message-State: AFq9FYIPc2bY6H/vC1cyyvXbcMoF4efbSbX3/12Vq/2EaurP5jG7Cxgx
	NSt9LHWDNsGzvI51L1gOtD5PkVFM1iX3lNZ1wpBekZTMlUpI55rZWlo3JQZF9nWqLkLQwHBfVyJ
	bK7QmoatL+JXw0s+rCQrEmN7ys0gfW5I=
X-Gm-Gg: AYBFou3D3mqH7vst0vN3JNdxVJmwWaecEYGYK6RuRKeh0SdOfHP17Wg6dH72Btk9Euw
	ilD1YfN4mWTI1AnTruF0v4w3F9RHZoOXZeOLng+Gq6UFRRHwePSwXOXR4LOzIZTC3v9ei9/m11+
	te1tmR5S8zfJP1iXTc93LGnY+O+cdm7W9AtVVoTxZsB3Juezgk2QnAPlHfmyDNEJunXVaBqNyP5
	S1SuCbPta9Y0zpox4eU//oQDand3RE9Q5Wka9grZVJuNAH8pqhFBqdY16BemDHwL4t4I2X6jXuO
	k/ufqP0z938cOMrPLDZra8h3I5193e64/lZFIihWqpre3RYEBVinH9SlJ70wDulwy1NTnLqiRfW
	bY5+GBC9fnmH0bjqCOtzQvMqw0/aweROUyR/PS9gSF0GuADknimf9MdNGqUbSM37lRvF5Tw==
X-Received: by 2002:a17:906:7952:b0:c2e:40a0:7978 with SMTP id
 a640c23a62f3a-c4ca7a54f88mr480913466b.9.1793476352048; Sat, 31 Oct 2026
 12:52:32 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261031175213.704021-1-bestswngs@gmail.com>
In-Reply-To: <20261031175213.704021-1-bestswngs@gmail.com>
From: Weiming Shi <bestswngs@gmail.com>
Date: Sun, 1 Nov 2026 03:51:55 +0800
X-Gm-Features: AclHuK_4noahyXUVMwaXTRsGR35d3pI531O4mEpXqwFeyal3vHlzCksnNBM6N8I
Message-ID: <CANgPUi06dtO2xecWUE044CWYAaFbA4au5Lb4XU08-z==YAWX0Q@mail.gmail.com>
Subject: Re: [PATCH v3] ftrace: Complete subops teardown on shutdown failure
To: Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	Xiang Mei <xmei5@asu.edu>
Content-Type: text/plain; charset="UTF-8"

Please ignore and disregard this patch ([PATCH v3] ftrace: Complete
subops teardown on shutdown failure). It was sent by mistake.

I apologize for any inconvenience caused.

Best regards,
Weiming Shi
