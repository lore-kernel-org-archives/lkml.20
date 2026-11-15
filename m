Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794778482;
	b=BwjNCocjXBFxdU/doh5w4fc2KUMZ2XU+1zbkSvQ9gLsu53dmzaO/+WEwfgS5joW/Clff
	 sqxreHus9D4CpohGKnsLksaeBFYksuX+qac64o8nANcQ/vuxLrDBEvMdiudFtjNfyxFuS
	 1KMhIUOuW44ViCKQKCPVQinusQmuZcv1oAjLpXYvzQrHwNLypYZxE4/UNUfa/hO1+NUoQ
	 H0F9FYeVsnbgXpZdd2Cdd+VB4dx3Ets/QEVTc/NO7YyyLbS+qgjN7ybeU+ZevyF/6cEO9
	 B2q9LK/oyVEE5/+GrgdXnce+fg++MrLX1pVOU6r1duTpDVltXPHklPUOYvbUh5Lwbiw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794778482;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=cs9JHELr5d8wuCO3bjOm1h46Bh/lIS6/9xmpt7kk/0s=;
	b=AGuBnfz9uMqCCbi8cIcBuqGya3CsHRh7Ty/zn7DfPcG36oMfkCCR8bVs5iIkVFhDfxQK
	 XdUwbfmrjHSdgqpbc7/KVN7XZXnZjnyZX3ELhpbOXsvNcrdTlVVCLAFdc6VsT4+A2Cvsj
	 4WY3ZZBVmqfeBSBY6GUNlDCeWdzBFsgHRTJkfdDibYvPUmdQqxFxpbbtOW0ShR0Gxc3t4
	 uoOqfXmDc5fL1P+wyVYabAePre2p6kMF0b8kK5BtHwnbgKhi/m2lwY+nJObbrrjRmUDGi
	 hj8+Rkc2bbBXbWHS7bZYSw5Przmy3dInGrIpM6IXXBzIWbwK0LJfTZ2lq8zsD5QWHgw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=LQb7bpGA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.41
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70958606A334
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 21:34:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70958606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=LQb7bpGA
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-70bf1671c21so2618104eaf.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 13:34:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794778481; cv=none;
        d=google.com; s=arc-20260327;
        b=JXXYBrqcP+tzwNSm4ETuqu4YNkpfzBUfwOYt1pIy07EvYxM9DAscshKK5c4uraSRQd
         YDNxe+zG+Bod+vu8CxyPRuYqAQyxUo7Zl2ir7eLV/mR47g64qHtCl642IikIk71KBLAu
         vxa5beCWBeY5xBa37QjdIUx64OV8+sytKkHJfv+U1FYQp2a4pUwzUJLVox4dqMstbeK0
         jPzCd7gjU6sWncZCqSXRajcQsRi8Jnzbo5dDR83gkSM+08bDVzl3Tv/ELukZnVNqDg8N
         /rjwV2kKMsueJngMkpwRzArTmh6nGLRWE+XMmhZPI8BCbK3Aq0Sz98V4x+FS2/ueyqlO
         FC4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=cs9JHELr5d8wuCO3bjOm1h46Bh/lIS6/9xmpt7kk/0s=;
        fh=9tl1YkVOADU2P+8TrXa6tCyOQLAsjAFV+zGJpWi9S4E=;
        b=Eraay6VeCX0Kiwhl1MDeVACtzI8/4HXqPwxjc78YYZS/HBzcY0AEnH+0ndZ5CKgqGJ
         3iCWKrsWi1VBEcIK+EBX5wO38+8KOk3rn7iZ7qXbUTyzkev9uYYQPEK43JUJBxT0q8Ru
         U/ksEL0HL/RU/AkG9WFKc5UOVLnmXSFDx7scH4bNcOUm/yZWwNk3SDHLkIGj5wAIF3jJ
         f7XFZlbF1z0wI0RDTqDvK1q09EBWwH1InxTJUico7rST8ovdqBbf8QfMSWhCWMe1oVes
         m7QitXhpuskUamey88ZJUWjZ0BrytETUiq+pYyT9tRuhtJxrIDoS17T4/UGs6f/Tz+yk
         4fHQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1794778481; x=1795383281; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cs9JHELr5d8wuCO3bjOm1h46Bh/lIS6/9xmpt7kk/0s=;
        b=LQb7bpGA03szUtIQx3bHdBEh40GP6gIqmFccn3+VEv955kr1PLbIVOR0uUlP87lFx7
         4/Dra29lac4PuGRuM3R/yXVFBmgDTi6WO6vI85vAlw0n1V34Jf/hJpYsAkBnMRiQ6mqh
         V3GMoen874LPOwBhk897GpaUo6XfRFJm+vBswGdzMb2I2uQPn0fQN6MCPQCsjuKV7gfF
         2GSizdod0eYE/AaE3zaC/iLIkeED6WCx5HrEXxJh4s8Cvi4lLu6aOzwNQot2VdIdJN3y
         8Bx0WHoW4EgCtFvY1FZetZuaNHmmrlxLT56LB0/prybZyypsd1+ABS5X/os09adxvk+0
         glnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794778481; x=1795383281;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cs9JHELr5d8wuCO3bjOm1h46Bh/lIS6/9xmpt7kk/0s=;
        b=ZwIkzx9VU6B4yTM9o6XbOmoPmOhDT58FbRQ4009GSlw2zGyxFfb6NzZ3m+DE/JC37u
         00VtqDpn28qN/Eh6yU3kle7xvuTSNVB3Zz1RmxsfrIVcM0NMiBX8uUSsNQzIA14i3xu/
         DrAdekweUdxsu+PIsbuGeIGHaSTwfWTsQdIGWhdofFw8dBY/I2/bTmHlfZOu8bL1NXIU
         99uDv4lHsRhqQoYHAAL9xzzzD3Ejj3Mb/kU4ARsdJfYxmETdStzcQke7+FuKVKNa9fzN
         X9q4A2IOm+3QtSvYjTL88SdCdVvkD9wkxvn3tutEnu3aDEziGiB/CmAUyJYPzvGIwa8J
         8yTQ==
X-Forwarded-Encrypted: i=1; AL+hErHTQoV7eB974fTKe62H8f9oKDiFRLkw771VPZI5RoS3foMrps/9nlxKaZLixfstxoI3Ijozb/BtgTfxAnU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+d12VL/tH0EXCIlHVqPNCS0KfA9jbC0NWhiwQ5PgSU5HCTTB+R
	+XMsoPH/bIn4tHMjLSCW78z/B7PwgMYI2H/fL262VC4IJgOn+qHX9Ku53vP8zZF8+qQyAUO8Qdt
	+OAWP6zC/qMEnQ//TeJ3LmodHaNoX6f9nnFdglC/bYQ==
X-Gm-Gg: AYBFou2vY5Dbxa1mvQ67oWjzp+yyV/IxDm0DQthJ8zXS5N6Diw5H67Qr+zV4QGt5WAA
	z6QqWAK18CNvfnip0PpmxmyuudNCH3penwxQX/tcHHS+p+nnp89nfPMYHHRGgJHSoW0Oj2wpbEY
	OcY3alf/cRXLA2JJhz3ciun4EKpPdukTNQDWMl48rn/KVdVI67XDcJs1bRcHPEpTlq4Q4ittnUh
	wxv0Q/59Sw+5bIAwkAITwp/XITmBnACJjDkLKWKwf0Houvbfn1bZgTyX+w/PYNaTizASOY1wrEW
	z7Ytssl/o+IQ7+EkFLKOkyRcEZodGtlBAy2oO+fjWbMUY0NTixlSNHPCHsC4MCYRmt1TCv/CAUv
	J10YSZ8LCoL8rE5ZQ0p17zGdbmr9Wr8HAbNWtAXVrcE/jJNC4PNi+wzTWtC4fpBJr50unD5aTOn
	pHoDa7tAHGzQ==
X-Received: by 2002:a05:6820:3389:10b0:717:866:abde with SMTP id
 006d021491bc7-71ab50b64f8mr4048862eaf.50.1794778481265; Sun, 15 Nov 2026
 13:34:41 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115212117.48496-1-emmaonana18@gmail.com>
In-Reply-To: <20261115212117.48496-1-emmaonana18@gmail.com>
From: Tianyi Gao <tianyi@cloudflare.com>
Date: Sun, 15 Nov 2026 21:34:29 +0000
X-Gm-Features: AclHuK-PPhL2FyJA0xoMqtYefnBbjo3uLjHDcDBJy-SQemPSC9ZW6IQWHZkbIBg
Message-ID: <CAG4wq-exUYFvw4i=gQZhwC8fF3tnhmOMtv+NceYTBEx_TO+F7w@mail.gmail.com>
Subject: [PATCH] selftests: net: veth: propagate channel-check failures to
 exit status
To: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
Cc: kuba@kernel.org, netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org, davem@davemloft.net, 
	edumazet@kernel.org, pabeni@redhat.com, horms@kernel.org, shuah@kernel.org, 
	ast@kernel.org, daniel@iogearbox.net, hawk@kernel.org, 
	john.fastabend@gmail.com, sdf@fomichev.me, skhan@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 15 Nov 2026 22:21:16 +0100 Omokefe Emmanuel Onanaroghene wrote:
> Fixes: c017800af5c71 ("selftests: net: veth: test peer ndo-xmit after GRO toggle while down")

The Fixes tag should point to the commit that added chk_channels():

Fixes: 1ec2230fc721 ("selftests: net: veth: add tests for set_channel")

c017800af5c7 did not change this helper. The bug is present since
v5.15.
