Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794523499;
	b=klmF2otAgG8pRfoaCHW8rU4wlIwkHjlaGJnVJS6TI0mv4bS4dy74J4fjXFW2tIWjuLBV
	 qwPTRie12GeqgqIxeVokxUbaNSkFiPZqWuxf/PJgqtEmZAIw7yAVtAFwfLqCw0d9dFzHb
	 HTDVOEMPvziLoAw5MOEZDHAKktkolVTQRcMI/WR5yct56juxcUygMHX51d+uWOVVWgmWD
	 1SAyTfLbKHcmdob5NguQSYBPcZs1Elm0YaV051zcARIchybRiKYyr7OTZtIKKY16G5eQC
	 8cHBZJC2cpwyx6vKFdxUgYYOZR1bAU7iHrTNESXZxcpAbiyhA/GjY31AM+T8bjSoJ5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794523499;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=afihCwaweNiVKsVg+YutBoDQwrNLI3A1qT+IzWvjoio=;
	b=PKg1Wv/zqnzizIklEDXvxNW9uRxVVXk5+b1k32ksZRib5HlZ5wnHJZY+XVTpZ5DLVDEK
	 N4pxe4JLAD3GpUPz5WiZUqmdctiJD4io5kicbW82QDjtALtKYuewjVYsbpQwaVCGxYEQd
	 ftihpK8t6+w6K+t/MB69WBUB/5z+jxZbPSNtLp9uSCCkDIcVCD5j+H2O7u2ujtgXui6MC
	 Oj1XYA7RxaS9KLI7q9AjRKcQR+wWm/skSRDftwosYyPdQCK5fx2xasczI6dOuVFKZVMZG
	 IdxGw+HOkS7WL1gaxVb7BG4h32JadHkEiGgfxpIy7ooEtWQe4RU0Iu1/4N+7OgDgU8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linuxfoundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=AcAVkfOj;
	arc=none smtp.remote-ip=209.85.161.42
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D79606A32A
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 22:44:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05D79606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=AcAVkfOj
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-705cb6ceebaso352021eaf.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 14:44:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1794523498; x=1795128298; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=afihCwaweNiVKsVg+YutBoDQwrNLI3A1qT+IzWvjoio=;
        b=AcAVkfOjkQSdoVtH+9OLXEJQBQp2t8ZbFDq89fPWB7IeggvCLJhUXFGrNObr5HlHWP
         0TfsWFM2M0g6s5piLPlsky4HgDj9QghV9jsfi7aN/cDrW9IlSnOez5WiF8WkB2WpFYpr
         QZQcJ3luqmITNdWnBY1qRGF7JYw3RAgeQiokY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794523498; x=1795128298;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=afihCwaweNiVKsVg+YutBoDQwrNLI3A1qT+IzWvjoio=;
        b=MBk+kOyjnSofgSv4Oiy3iq4A7bvfLLLRefVQSPYrVBQdxRWLlL1BMcxL2a+TdS2OpE
         ik3umDKIhems3rA1PbZ4UBn7LoDJylp76vDG2S6yiaXLPK/M5wabpN6bBszxi+xjD0is
         gPJh60SZnzKUIfQMvDJhP4ioGIet4CSI68D0qTYqTggKYv8tWmKdW5l8oO0BflWxAc+i
         QNpGhr4K0fG6j5X4IhFiVL8f2e9G7fCamWQUSfMwCW3sXGWLM8rFWi/lnrZ5XvveF7Zw
         sxe01Q8ZOCizOvejMvQ2yXoW4h5rRlOW9xOOO1xysvODCB/HiZYfy7tvpqdA91JRpwmd
         Aa6g==
X-Gm-Message-State: APuU4Z++J98YlMRSyy64Orkv9fNBJ+TPLnmlUhmtPK2FB721wqRpggUs
	qTpNNti2ryHtDCEPUnBw5QGJj7CNYbTC7q6gUuR70RjTH97jspt24PF594HWjjgeaOo=
X-Gm-Gg: AYBFou17HG6cMiSjvH8eRW7MjmbSMCH44K05LqG5ERJzzKWTd8uWOAVJANaIR+LNyVs
	FZutHbUrn5o5z1ogs/BaOQJwcg26kGvo4CQ4rtYZHgFqZyj3z7YaZVNHYzf2862NMYAwD4cL3Qc
	MSNcHOzVYPPJjroN1drTUZ05S7+mZEATVpOQz+x3uIBLpH22SW0vhBr3G9B0ysCfAmlYMTPOzQz
	AZ5zEwa9/LRKTP+6AG2rZ13PDFaQZUJJIqoAqGYwyOCbeMWnb07K4/Q6u01R/PUzSkFSogYaE9A
	aVZbG9Kc8rW7sEs8GHUPXyComUGn7jYJb9Pp5WeZ3LRwL8I7Kbk39L+86Wlea5c7ng7tQ8zUBV8
	IcEZw5Ht4/Xypfr0wLTEaYGXitp0R0G8lNxciU1dXHFb7s6QFc7rNwT9kRtJCQAS29GgoRNxeE+
	IMZ1AFZTjDR0KrQuGU2wGKTkQ2z6tIW85CtGkH/Ff5CFCGOarC8+CCa5s7GHfEBOK7G/p6AgpVy
	mXOG8WqgFOp8xois8FSKzTJd9HihCqTeJ0xZqLReI3JiCD73LGuezMsnvue4dZFL4HaPLr3fy7E
	455ivOyYuIKxDndvaq9tGAv0xoHHFqVbw76M5bc=
X-Received: by 2002:a05:6820:2218:b0:70a:df8e:8f64 with SMTP id 006d021491bc7-71ab4f0c26fmr517770eaf.22.1794523497862;
        Thu, 12 Nov 2026 14:44:57 -0800 (PST)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42c41e9sm479599eaf.6.2026.11.12.14.44.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 14:44:56 -0800 (PST)
Message-ID: <f849dfc1-c7ab-4285-b668-b37eb15e37b4@linuxfoundation.org>
Date: Thu, 12 Nov 2026 15:44:54 -0700
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
Subject: Re: [PATCH] usbip: tools: add --sockfd option to usbip attach
To: Raul E Rangel <rrangel@chromium.org>,
 Valentina Manea <valentina.manea.m@gmail.com>, Shuah Khan
 <shuah@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 Hongren Zheng <i@zenithal.me>, Shuah Khan <skhan@linuxfoundation.org>
References: <20261021214808.58609-1-rrangel@chromium.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20261021214808.58609-1-rrangel@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/21/26 15:48, Raul E Rangel wrote:
> 'usbip attach' always opens its own TCP connection to --remote. A client
> that reaches the USB/IP server some other way, for example over a UNIX
> domain socket or a channel forwarded by a multiplexed SSH connection,
> therefore has to expose a listening TCP port on the local host just so
> usbip can connect back to it. Any local user can connect to that port
> while it is open.
> 
> Add a '--sockfd <fd>' option (short option '-s') that attaches the
> device over an inherited, already-connected stream socket instead.
> '--sockfd' and '--remote' are mutually exclusive. Because sudo closes
> file descriptors >= 3 by default but preserves stdin, the typical
> invocation passes the socket as stdin:
> 
>    sudo usbip attach --sockfd 0 --busid <busid>
> 
> The descriptor must be a connected SOCK_STREAM socket: fstat() must
> report S_ISSOCK, getsockopt(SO_TYPE) must return SOCK_STREAM and
> getpeername() must succeed. Both AF_UNIX and AF_INET/AF_INET6 sockets
> are accepted, since vhci_hcd only requires a SOCK_STREAM socket. For
> AF_INET/AF_INET6 sockets, TCP_NODELAY and SO_KEEPALIVE are set as
> usbip_net_tcp_connect() does.
> 
> The connection recorded in /var/run/vhci_hcd/port<N> for 'usbip port'
> uses the numeric peer address and port for AF_INET/AF_INET6 sockets.
> UNIX sockets have no port, so 'unix' and '-' are recorded instead; this
> keeps read_record() working and 'usbip port' shows
> 'usbip://unix:-/<busid>'.
> 
> Update doc/usbip.8 and the usage text accordingly.

Does this patch fix a problem or does this add an enhancement?
What doesn't work without this patch?

thanks,
-- Shuah
