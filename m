Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792432198;
	b=5bXypxmoWVo83oBreCbmrHZfUiNS7rn+16HCyVp/k73d0YmkttTIdKzPeD1EeSB/SFxd
	 PgfAKxXr37zpmthbbnd+e/6YUaoDEfFLI3Tfb/vllUgvkfiBRG4Mj/04uirMEec/nw6UH
	 xR2DmyP4In7suKl6a5y0RhkwFKHqNWrlDKhV125QrDxkNQsXCM7o/JF6Mh50cV6smIUv/
	 et4ZUdByDQcRJYEZcqBsVcYEiFkJJp1rN8bnmZtiDmRcOGZBtJ2q/KxT8gCu7y1eGjY87
	 OYBHPSnPlWjKxUFFQqtpdPgBCk2M0WJTnhRCaJBGwPgJ6zhis10rsaBASACALLmZX/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792432198;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=639/CBjTq+N5Owb6RBW7UK/oNchKs9KrTos6BTqd4Y0=;
	b=oz54N9S6kd43oYoR9AVzyPeE+gSiD/Tg8FgAyPAGbuL0Em7vL5Wz8N/8Vgiov91p06w+
	 fP+9IDKnsXGU8XOgKKqfOQa9COKRa4uN5zUJmTmwsCmRuWyvWceHMtpu2K/AZF4NQ9wcy
	 3/zlN/va2QwgI3NvjIm5dM7fEPp1MlaqQOtjjx2KBOyKULe6Jjr4zH7QXt5AnENLDdaxx
	 oEUbCMRx3ga4LGa/O4EJ5iADfelQ8C/DEagx1oTcBFgdZhTv6jVYA9P+LTWL24QjU9W4v
	 OnlOrnjmNsIrItbVtkS4sj+qVgwQg/VwKc65ov8xdfd7kPg2xhNBnaKjtf3/uTW32iQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TrpmEFI7;
	arc=none smtp.remote-ip=209.85.222.172
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A11606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 17:49:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33A11606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TrpmEFI7
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-93cb1c0e851so172353885a.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792432197; x=1793036997; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=639/CBjTq+N5Owb6RBW7UK/oNchKs9KrTos6BTqd4Y0=;
        b=TrpmEFI7tgmuxaiLFhOG1AfLDCzh9t38tdaNq4TC34QmZWpMMsIQhLwWy3Sh7ijCYx
         pzpvDD5z0Y69K9YZ35fk6nObTGwLtHSvnI6MbVCXdWKVcbDG5zdaWKWMLhC9rr/koPKK
         y4ZPae8rIOQWAY3VgxcGUftjggF5vUPeVVsPkoaC8TPxtSguw9get4ubsu/KYfBMBn6D
         Ll7UNzML1468VNpDI46hqB310SFY+K7icsuHYIPtj66PBlOIo5H3xk3qL2PHBQirAt9H
         2ZNYdYwBob2Z+jiH28e6HL/xN9qHQJ2DIl5BKOcB/gZaIx8duypZz54wIoGpVlgzPcTu
         4qwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792432197; x=1793036997;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=639/CBjTq+N5Owb6RBW7UK/oNchKs9KrTos6BTqd4Y0=;
        b=lNqzjsOE/AOuRzKXnJmIVRk9oVr1ru7xWQs8e4pRkyr6+gEEwl4IMGJzs4PQhdqagY
         cMT+DVBSTY5xf3LzvM8povEZ/GabtcIZHpcISNA9EZaRTxvgb1J6Rr1de8bsMMcBMJ/H
         ujfbNlHnRE0mj64zMLq8ZXmjvoc4YsDpD3TbjJyNNFdWf/S6WZt4JHQkc7m6ditDbsiF
         WS8cn6baDguBqSGo6LOtyrXyUMrtVVQ2pgbTOlqB3CJx7/j2OY+gkNpS0sEmRreqmNZR
         tUMI3NKDYiqdWqwPOmUAJXApmzxeKock6mDMG3A6tBu/TvJafDzug4mlGUbkbgQkxcxu
         nFnA==
X-Forwarded-Encrypted: i=1; AKwUvBxNv/cpUv23QcVdl3MzLlcsUXqO102iqsMqaHxnEFZ4+Phieczd7lxx1/ELBiCeTv7lvg7XI610WMc9bs0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJQWEfe6V9EGRcuWH+bm6tbVdDH0L8hD7PR8+2HANtWPQRQ1kiP
	w7HppqcZ0m1PllwEGRpQQlXKQsdVf9ANL7tXZos1Omn8OyuZ9RjMskpB
X-Gm-Gg: AYBFou3NDoE2DjviDqlWgi6xbtk1e54V3uQf++IY3yxrb0fykSwN4srucMAtoGJEvd2
	+BOozeqkffmyPI4hZxSjmjR5Vjvb+yWlVDFr86TAC7H6kjOlJbfIn60HpaOjXFFa6xUi2RF1X3F
	5iaJcRqdFiEZhyA8CtCsFmQoxZpLUFW5vOHYpbQnGQaae5rBzBnu9Cje6lZNd6iHe+wwD84mRjK
	/tOwOw/hrqzIdws4tMGfRBzYPrzac+bCqA+KqT/oW6DHnAkeLnmuVNcNxqAyVII70haJUWoQG6X
	TnrK9EzAYmraMdIabe7+t310o/Y0dn59fKXTISOgqE/B93+zpAcySMwUpD813i7o+lYihDn1o+N
	TMy2eePIWb5hnRK280Y4vD0XLRz1/R1xkYrQ9xuWxStwp1WsMQra4Hg0cLSkiWfM1gbgb4D1E4W
	TU5b6mFtIy8zCQwAZeBpw8qyURaLJlzhd3aXSqeyvm1BpBnF3GZMPRV6QO/55w+IF5kf+JGiJRf
	hK4CuU+Ub3nEckpVi6gcrdm
X-Received: by 2002:a05:620a:410a:b0:93e:c12c:f127 with SMTP id af79cd13be357-93f29db24f9mr1288869885a.83.1792432196991;
        Mon, 19 Oct 2026 10:49:56 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f4af465c2sm17387785a.4.2026.10.19.10.49.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 10:49:55 -0700 (PDT)
Message-ID: <41fd012e-e699-4165-8224-e0f65f4a4a8d@gmail.com>
Date: Mon, 19 Oct 2026 10:49:38 -0700
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
Subject: Re: [PATCH 6.12 000/869] 6.12.114-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 sudipm.mukherjee@gmail.com, rwarsow@gmx.de, conor@kernel.org,
 hargar@microsoft.com, broonie@kernel.org, achill@achill.org,
 sr@sladewatkins.com
References: <20261017160036.979869304@linuxfoundation.org>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20261017160036.979869304@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/17/26 08:47, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.12.114 release.
> There are 869 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Mon, 19 Oct 2026 15:59:15 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.12.114-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.12.y
> and the diffstat can be found below.
> 
> thanks,
> 
> greg k-h

perf fails to build for ARM/ARM64/BMIPS_GENERIC with:

util/event.c: In function 'machine__resolve':
util/event.c:775:32: warning: implicit declaration of function 
'perf_env__get_cpu_topology'; did you mean 
'perf_env__read_cpu_topology_map'? [-Wimplicit-function-declaration]
   775 |                         topo = perf_env__get_cpu_topology(env, 
(struct perf_cpu){ al->cpu });
       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~
       |                                perf_env__read_cpu_topology_map
util/event.c:775:30: warning: assignment to 'struct cpu_topology_map *' 
from 'int' makes pointer from integer without a cast [-Wint-conversion]
   775 |                         topo = perf_env__get_cpu_topology(env, 
(struct perf_cpu){ al->cpu });
       |                              ^

-- 
Florian
