Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793186424;
	b=4JNYbSYA9hNsdKCiyGY3iwNvE/S9LIxfye+qyWlc60xYxYInIXjIKy5Bvuu+E2HUrzrI
	 QHP121o0sECeU/f/w6XDd2nALBnM1HeP3k4FisVpvrrspTT8w+7mrOfYTNzoy0+Rpv1tr
	 X6AGtL9N5vp4bOJejunE5WLjCGHipV6q1VW9+W6JrOD3J0pUHfyYIqr9voiDyZOPZHpKi
	 EDGE944g5Ep+sOgnX6nvdL4HzDsPc7UsoL2KUbcnPY0v0iZLCPLMGRqL7Xg3dsLqPLSpD
	 OMqwKag7I3wPdg/RU+RsS9IOD09cXW3EiuBjC0eYRfulBQDS5BXqlV1TzuWfLbAHn3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793186424;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=ajE/q7I1zEJfBxj1a/+xtjsSSjXlOJNoR4NX2ZgCrjc=;
	b=lHY/7Mayyxys3UzCaIxnPvOxYtdIBnOm2kV1n+BH9xDyT6S8X4nn68s+d9R/C+KQSq0z
	 wvqDCMUZImovb1StcFs2ns/UZMW9Pi/hA7nRgTbLqSLqz/tttz0MWS6RXNExeJh4WgCIP
	 C4Zc+5xlo9YMbYscpLwQpoPGr8ZBfafBTXzVIM1wdWkkZAGMcpWZ+eDcJNfMhlm2lvNo2
	 9KZJxVcGEoQQ2GtYYonYICZlQjZy7z5K6LcEdbr+FCdmykGSgB1+69TSkCrLpzZovVnEc
	 yfPobqzxAsCAChqixvHdoorYX/uHe72Sz+amqR6SgvSSnbLFX/sMn9pzfSyPSJUQfRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=f5mMdR30;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05E39606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 11:20:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05E39606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=f5mMdR30
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48df54150dfso503026f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 04:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793186422; x=1793791222; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ajE/q7I1zEJfBxj1a/+xtjsSSjXlOJNoR4NX2ZgCrjc=;
        b=f5mMdR30W9cgBi+XZgA2ln5U2NTFxZGbRtrXBHwZZY8F0J/toSCU9sQ/HE6nIAPoRk
         O5McOg/f9i8nwom7WsNcm+NBLNGqVcdXsXXk10a70P5cr2hQC+Q4laX3VCrjn9RuNsPL
         tZDi1h0xCv6kN2o69mJR42wcK/TRM7qzHrFXSohz9Mo/LaiIsvFrZU2QrY1qI2D2BvE4
         BVWphoPn8pyHDq+NPGIw00/erE7qslDAcjvy93WK4eEI+qZ4pAUXYlQZChVRfd0cFqOa
         RJLxYIuhfSWOXRNmxn9A6GpkbbqNHtdOsaBz/GyCJ5oMVvG5qMKHQpfGu8qrKQ5J+JDT
         UmMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793186422; x=1793791222;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ajE/q7I1zEJfBxj1a/+xtjsSSjXlOJNoR4NX2ZgCrjc=;
        b=F3Yr/hL5dyu4yRkj5Xmr7FlksTMQiJV8GNzmfSPfBjuwEKVWozA7Z0y8qB8E5SNx2d
         2MZFzS8Sg+/ijHDoX+qfazFuYFxFJpP83/7YMOvyjtyxBY1ZhHHXFuKOtZ5Y+rS0hMxY
         yqOcsBnInafgSP5jYkHRmP6Vx5zWRA0fHu0lNwNfbd2Zr0upN05IIglgBtSk+jMsTVv5
         AsBLNh+gfC9AMWvdjAQBYb1W8AToK7qD/rr9mcesB8NcOJD2UophxBPSst+MIyLvlVYf
         9gJnN8s9laokG3TCtZoyby1dj8dipKhd2rC3OZgDj7Is+O4s1tCvHbcRnwQknaGmo3j3
         hA/A==
X-Forwarded-Encrypted: i=1; AKwUvBzNNe7MnQoLZDSZpnpb0quknFYCrn7GGpLbWAlk53pOECzCw2wemCMsn28kmyb+UoBJ4DDB0VzjgpVNFrI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIZ39p1j8f8bZkSMfA3O5eSRnNWXMIsGz6BErP728T0bnP6xway
	NgPzYCKWpm73ddwPwIbzmpPvqpm+2kAHPNQXrJjUVpMP/XSYeii8kdYIx/7GIsBgSQ==
X-Gm-Gg: AYBFou0V2naMcdB10ASmFoL02CDqhRO/YwR+RbygBGg0cu1M2evTLIMEg8YMmm/v9N9
	TCnT9E0Xb7GWWho4Hbpher0RAbLIzBCDj1oFZQjkBpqfgERar/r/D+Gtk758TcPMsY/SoweFHMi
	ihGagl4AysmZZJeWIp+ir2KbaBHommnLbaF01LIBLFxqGJxn7DO68xmvWSmxYwy0PqMh/2Mw/lw
	LiM+WuXRLGUuJN/0gdXDrXxhG4zGK55sl/soIcxY6M9lkiTMCSGDUFZXFdQQFrzf2k77EGATDAI
	dJjUDeDhOo8Rth0wX/1q/X1emDOQ4aFMqTpuodjajeqicVZAQQhuNwkj0AphkEONwVqyJkLY8hK
	l5h/H71SlL6/easvPxLZjpQmeWZFvjr2w2pCS5Tg+MToUJe/qOxOYijDQ/uEISJl62DMVuQdgHP
	GLqiiaK6t0V7uN45vSt97LyhyPGBZYLlrfzuIkvCXvysxvaOvsu03JF04Y7eMYRJ34MQ6WcqT4k
	Lr9uRzbhIfYgxfMsButDWdg+MEAVBvVWCugtdVcZMI4xzSgmW+0IfMclG392taM0X+VMjlSGqck
	X+LSAij2UMtrchWEvmqvNg8PvfPXRy0Z5zRhB18u6TYucuUXEgLbuuqijePPi9BKew==
X-Received: by 2002:a5d:6f0d:0:b0:48d:f851:ee5f with SMTP id ffacd0b85a97d-48e5d5bf164mr5101226f8f.24.1793186421919;
        Wed, 28 Oct 2026 04:20:21 -0700 (PDT)
Received: from google.com (0.182.34.34.bc.googleusercontent.com. [34.34.182.0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecdf9bdsm26871943f8f.55.2026.10.28.04.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 04:20:20 -0700 (PDT)
Date: Wed, 28 Oct 2026 11:20:16 +0000
From: Vincent Donnefort <vdonnefort@google.com>
To: =?utf-8?B?6auY57+U?= <gaoxiang17@xiaomi.com>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Xiang Gao <gxxa03070307@gmail.com>,
	Donggeun Yoo <donggeunyoo.kernel@gmail.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Lorenzo Stoakes <ljs@kernel.org>, gao xu <gaoxu2@honor.com>,
	=?utf-8?B?5Y2w6Zev?= <yinchuang1@xiaomi.com>,
	"linux-trace-kernel@vger.kernel.org" <linux-trace-kernel@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: =?utf-8?B?562U5aSNOiBbRXh0ZXJuYWwgTWFp?=
 =?utf-8?Q?l=5DRe=3A_=5BPATCH_v4_1=2F2?= =?utf-8?Q?=5D?= tracing: add
 ring-buffer memory usage statistics in tracefs
Message-ID: <auHacGXSJqCe983K@google.com>
References: <arJNSjKsJ3bK40dH@google.com>
 <20260924102755.02084435309be26f664e3333@kernel.org>
 <arTlRPvmR54Fa71o@google.com>
 <20260925100908.66c46353e5a2abeb73b1e15a@kernel.org>
 <cb0090dd1ad84a5b833e9323fd2b05d5@xiaomi.com>
 <51b25b1c996d4412a0c43d94acea98df@xiaomi.com>
 <20261014091839.11488a0c@gandalf.local.home>
 <4f9c82054c46459688d9a69df58293d1@xiaomi.com>
 <20261024080423.069948c9@fedora>
 <be9ca24989634d79b037f8ec1d16ac65@xiaomi.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <be9ca24989634d79b037f8ec1d16ac65@xiaomi.com>

On Wed, Oct 28, 2026 at 11:14:40AM +0000, 高翔 wrote:
> Thanks for the explanation, Steven.
> 
> 
> May I ask when the next merge window is expected to open?
> 
> 
> Thanks,
> Xiang
> 

You can refer to the estimation here https://deb.tandrin.de/phb-crystal-ball.htm

And spot for v7.4-rc1 

-- 
Vincent

> 
> 
> ________________________________
> 发件人: Steven Rostedt <rostedt@goodmis.org>
> 发送时间: 2026年10月24日 20:04:23
> 收件人: 高翔
> 抄送: Masami Hiramatsu; Vincent Donnefort; Xiang Gao; Donggeun Yoo; Mathieu Desnoyers; Lorenzo Stoakes; gao xu; 印闯; linux-trace-kernel@vger.kernel.org; linux-kernel@vger.kernel.org
> 主题: Re: [External Mail]Re: [PATCH v4 1/2] tracing: add ring-buffer memory usage statistics in tracefs
> 
> [外部邮件] 此邮件来源于小米公司外部，请谨慎处理。若对邮件安全性存疑，请将邮件转发给misec@xiaomi.com进行反馈
> 
> On Sat, 24 Oct 2026 06:59:28 +0000
> 高翔 <gaoxiang17@xiaomi.com> wrote:
> 
> > Hi Steven,
> >
> >
> > Just checking if you had a chance to look at this one. Any estimate on
> > when you might be able to review it?
> 
> Sorry. You sent this out when I started my travels (Sept 15 - Oct 10th)
> and when I got back I had a lot bug fixes to handle before new code,
> and then the merge window opened. You're patches are not the only ones
> that were postponed. Any new features that were sent after Sept 15th
> are delayed to the next merge window.
> 
> -- Steve
