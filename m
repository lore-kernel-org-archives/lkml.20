Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3891223ABBE
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 00:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790900217; cv=none; b=gaqcpzP2lU6L8+yGAur7nWkDMCT4TMYqDu+dISxz1acku5M2sm/dfmeA9bkGq0r9IHwJZPi3R0rgIfMJ9TyRKns/uGu2H+T2rKavOGe/grTTsx1N4W59h+QJeHM78KPD3X2hkKxkGmYSzZtnM2kc+nCnpNUxtMLh4F69BB9eb24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790900217; c=relaxed/simple;
	bh=q+6Q4y6H48Avufnw/sWDV+vkmXuakE9O0dv+vfnCP1Q=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=tSJGJE6donBMk/bGWSUTpU8n7qi5cXmCTJsRUHzUjvBt8BqvfYundpk3Mcp8yZT86VP4oiQ6K9x9icZR/PnvFkBi399eX8FyMqZGvQ/Pj4o7mvUHWYxwVPTMOThHeiJZ0okV1x5FBy37m/51V5t33YDzRSNVoQ6SJwY+dvXmD1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UxdjpzR2; arc=none smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UxdjpzR2"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-67583c777abso1072291d50.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 17:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790900212; x=1791505012; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rOgGB5KCdvmsyYEL6jVLup/+Bx353wLBXoi6WGMPE+0=;
        b=UxdjpzR2UzzLpH4PrgCMKqbUj3yzCWVRe2n+6F3CacNyaA86Y/3bRKTVQ0p8btAvFT
         eBVXKiBZT5h0gH0jMpSlRgIbxIFGcEz0IK8VknxwHCxnJPhp2UvMmqg3EIvCYCzKaacL
         OrU1LkKzuuUykcG9q0tzOKYCbg+qJ7SMyHUlBI1/t8rYAJiC5kWiabS34tlwNYH+ol2F
         BVF7XuFslARhm9WWHw2zzb7c0SROzsDcmZ/xlPSpgpZYF1lJnBaDk6dDOimPkfJPJvYy
         efKcCpVIkg7HgvX4yf6ZkgcpPFwGLzuX9SbKknJDXDhvelJIwqJENKnp5CswY49c31wy
         RQqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790900212; x=1791505012;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rOgGB5KCdvmsyYEL6jVLup/+Bx353wLBXoi6WGMPE+0=;
        b=ZS9Ps08H8Vx2W0zB/QFao7cV6dFyLG2hMg/IC9I9DBZgMmRaKm/28dRahAzh6hpsrp
         aNz3L9mn2OCq6UwoWUhcse5b3Vbek9hHsY3r5O240chG14bZm26kf81+pVyRndzx1EK6
         whvCtVSCAB8RjTnuHfbf/wWYNAiMZ5DrOluq/NkEMIyOEP7oCKmzR8N6F2jg51mb28Hd
         VUKXdyItaFRvL7rpHvxhJpIiWc3gKzYhOLYPcXhtOq1sE6DQau5ndCAK6g1ygj98tStJ
         E/YgU71tm8XPzHQNkGXC33yjA84jNzDbQhOvXAOsX0Xfs+ACM9byP/MuxpMmDV4JbZ9n
         ywFw==
X-Forwarded-Encrypted: i=1; AKwUvByXff+KktNLsoIBUrLwJhVlcMX3RqEuQy5tboHj4y1iXSMxe9spqGmhYFkJTUiSThyc/0Dy6HcaPMSW8XI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJc6A3CZq3NADBB9m2yQ8i02Wj7GuWNqUI/3CC7pxHCt7p8cIWo
	k5zVDdYf1yaKOKDF0CQdHNS+eF9UAhQ14FipCRvV9wBctA5fD+6HgyZ+
X-Gm-Gg: AYBFou0o+mgbPklc9tuADTOutep1S3VY+ME9uYCP/PtfdrS9xFGxJgOSmmLlq9llklx
	juV57VDwysvtM+K6DFtLq11J0xWbcB1pfhOeSkXBuJKnpVX5v1IACE4ScNKelq6j2dgD989BhAu
	s8tKPI6S2ksq//ulCgM3cAkYNmwaIiDif8IVbjaukrHyE5XhJSJsfCxAfYlJOfeHJQuzDTbeZT0
	p5TyiqblDOiwd9FFj0jHg3hDDqrTfKJ0g8DwslKdtZb6DvdqklB2vw7bRCOdF5+20VNpieocQ9W
	wAtSEgi7PEuccpGlTyT5f7W6UmILEwf0FcpnjW5baQxooXnTZCioh9qFXIoVLyzze7rewdSa1Tm
	uhaQ5zmbl1wWoaFim1olPNrf3zz7vqM/1NWTA5obloDPM0smaS6ap2mTsDVUdcjnn18XxGHLCCt
	g54G6zONEQ5I+CUXKK3oJOiV9qoZEtENiaDpukHyW4rc75SoURTOe6Be/SzFpqKigy0VrLXfHyu
	g47qYtznkm7bGAFt5fQXQH55QInsjxYa8ajnJO3poS/34LHjhjS
X-Received: by 2002:a05:690e:24d1:b0:672:c99f:5f5a with SMTP id 956f58d0204a3-67691115553mr1514703d50.8.1790900212088;
        Thu, 01 Oct 2026 17:16:52 -0700 (PDT)
Received: from gmail.com (111.46.245.35.bc.googleusercontent.com. [35.245.46.111])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8ae33ee086bsm3230397b3.46.2026.10.01.17.16.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 17:16:51 -0700 (PDT)
Date: Thu, 01 Oct 2026 20:16:51 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Daniel Zahka <daniel.zahka@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Shuah Khan <shuah@kernel.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 Simon Horman <horms@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Kuniyuki Iwashima <kuniyu@google.com>, 
 Willem de Bruijn <willemb@google.com>
Cc: netdev@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org
Message-ID: <willemdebruijn.kernel.678a05ecc978@gmail.com>
In-Reply-To: <20260930-psp-defeat-v2-1-f266e7447129@gmail.com>
References: <20260930-psp-defeat-v2-0-f266e7447129@gmail.com>
 <20260930-psp-defeat-v2-1-f266e7447129@gmail.com>
Subject: Re: [PATCH net-next v2 1/4] selftests: drv-net: psp: swap closed for
 connected sockets in assoc tests
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Daniel Zahka wrote:
> Future work will only allow rx-assoc and tx-assoc to be performed when
> the sock is in TCP_ESTABLISHED state.
> 
> Several assoc_ tests, as well as dev_rotate_spi, test using the rx-assoc
> and tx-assoc uapi calls against sockets in TCP_CLOSE state.
> These tests don't involve sending or receiving data, nor involve looking
> up psp device by dst entry, so using a disposable disconnected socket
> was just a convenience. These can be replaced by a disposable loopback
> socket.
> 
> The loopback sockets are IPv4, where the sockets they replace were
> AF_INET6. This doesn't reduce coverage, since the assoc handlers accept
> any TCP socket and don't look at the address family.
> 
> Some users of rx-assoc and tx-assoc on closed sockets are left if they
> validate errors that are returned before the kernel will check the
> socket for TCP_ESTABLISHED.
> 
> Signed-off-by: Daniel Zahka <daniel.zahka@gmail.com>

Reviewed-by: Willem de Bruijn <willemb@google.com>
