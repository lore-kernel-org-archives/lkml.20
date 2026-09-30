Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E89A472F7D
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 09:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790758922; cv=none; b=uEe8s9+t/tLXAyN/Zh/696GxbQEtdjtyLgA4THu0kZXK2QpQ//uI+nZQ78xnouXcW7MhrCHW186btUXbfyzK2LUrriBx08eg+eG3ovTyerwWUHkTbZIobdBTs2wcnsCO3XPg6vMeNUvdQxWseOn1rJgLi1Saao/IQEfsfo4iixA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790758922; c=relaxed/simple;
	bh=vUgSmNgYb3xPR6GE41yrOSkOkZp4hMoyauJEOX0p9L8=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:MIME-Version; b=Nx2xtJQAMdjPWl+7cUzYFi/FrMgNLxWUkBuvUlNgY1x+TbdV+F9d24EJq12VPr34DKZYG3yhJg6COYvNIBz7NU5cT9CCFFwyycCKzTlm/rWjPl+Rd5kxWT/vq9dl0yqC/7V6oYxXVoDwL18tf1PxKLmdkkyJh2jMRliA7In1LMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mrEVprzN; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mrEVprzN"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccdaea76so1587063a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 02:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790758921; x=1791363721; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=valg39DdEk8sl2YI17Dx/FsaQPmRarO/oHzT/4W/5sE=;
        b=mrEVprzN0dqQUfx+UcDuOSUunQCmSQoRDCoPlVJNXaRxT3bhcUyWkTjCcWOmTyeYI1
         pNYBnNAGuCMTfp+T/RXXlc1GIJW8MB9cV6aQ7tSkF8q5+tIMjwqH3MLQq558/9T6DYHU
         l5+RcKTMaZRZc1wzTjdsFW9w6Lj05xq+RGIYmn8d3yo37PL966uKJ0F8ReEw80b5+HXS
         P6ul2TSu5uNyt0U3lZe8UJ2q92FBJo2451J9XjhgRzu7DwLTEP/RXHGArBerLKN/dE6e
         y6LKNF/OzeoWiIBUkduCBKZxaMCzbA81n55IRvAC5SN9EDUwHY5+OecMFBmkG6wFn6Bj
         Wdrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790758921; x=1791363721;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=valg39DdEk8sl2YI17Dx/FsaQPmRarO/oHzT/4W/5sE=;
        b=KOFIHNV6Evc5CYrC/Xr64uENLI1JwnubpZp/UzigHUTtngQdCKk7EemV2KDhgdMz8V
         WuoCY//HEPuBFQR7Casz11811NeUtj9X6qQwdUZY/riF+/HnxRUF43H9ML4Q2f7hgPV0
         7I0tx+zJJ+E0O48FwyYrnkrzoyr/v4p0yQHy1fmuDFl4t3Lyi7fg8skG9sN4JyWyolO8
         73VBQkpALIUPtVPuM5ZoCXgDn5t+glkF0wmIUV8Lneod6anHI7+kCOx9sVG2awgyXzpg
         Ygz1eE3QNAaEojYYbAQ9JWmz3CBlR7UwpqLIZ+/RNGguTrEvlCm9jNvtTD6zjUv0fao6
         gFww==
X-Forwarded-Encrypted: i=1; AKwUvBxT4ITLkk3WlDtmZ5BhrJjbWcjkVwQURJZvbJIDfv8H1saLuL+Fjviu+Q7kYIhKWeawZfUOMHAn+L6YpK0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ1IM/hlthWZjb0zxbrEQ7r7ItGElfXYSCqsz5e3/Izw9xSw9lC
	l6tn0+9iJ9Zn6572QELChjRFGKvh7jqagR3BQoyDFR3qeksyax4yojYB
X-Gm-Gg: AYBFou2tysUgkKOoujJMq+XJy6p6XhviSGX4UJlV7zzZ6YEpoC0U/9KUYUaCZnpw+X7
	/gTEL4hcQfNpkfMfLiaKa6u8N7cC2/LU6lPSY0cMOx0qrLlwJ36hMP4NLllaftp9YiuznKK/l7s
	v+MpKYP7RCOsUOYLZsMKMktwDekJPQpPFdqOiimmk3rHMGJnQtHLH1VRGfQsJLW3093fGyH3HWd
	ETUN3lTkGxaHhcisED/Ot/qHeCxm30flnnXmn2IX9U0rAIJqgElyIH7ZlQscllpaGkBjaVtGPOJ
	dslHpAPFlJUsX8Z2R54AHea5ymXMDraiJvbotEwrWGrfR9QIlo0GZOSgkFU8R1n+kcajLIo/0yu
	VVLydb9uxAWvQc2B1T3Vga23GDYjXkwY+WuQIVK+vo/U9yGY9nvA+cw74ic9YAGeWvQ8Ycrhaz+
	veUVdpU/ToiMVOXxL+E3ZyJLWVXhn9cxzyQRE2lwc3fdcx3wt+fvTE2m9MVaaf7L1hGbzMik6bG
	M7cei7fxCHOzpvx9u/LH7Cn4IDH0TkIg2pPT+9NGgsiF48MfIo7lm4hhpaCxB1VO9+VBzHk5Eap
	8YThNUJIxRNj4qs=
X-Received: by 2002:a17:90b:2888:b0:3a0:f4ee:d2b2 with SMTP id 98e67ed59e1d1-3a4d2895ae0mr550843a91.32.1790758920501;
        Wed, 30 Sep 2026 02:02:00 -0700 (PDT)
Received: from localhost ([153.61.198.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4c9938fe0sm2567574a91.0.2026.09.30.02.01.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 02:02:00 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Wed, 30 Sep 2026 09:01:59 +0000
Message-Id: <DLSJ22P7T6BZ.FCF3J1JWCOET@gmail.com>
Cc: <john.fastabend@gmail.com>, <jakub@cloudflare.com>,
 <jiayuan.chen@linux.dev>, <daniel@iogearbox.net>,
 <cong.wang@bytedance.com>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH bpf-next 1/2] bpf, sockmap: Fix udp_bpf_recvmsg()
 spinning on backlog-only ingress
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: <chenyuan_fl@163.com>, <netdev@vger.kernel.org>, <bpf@vger.kernel.org>
In-Reply-To: <20260929083447.558818-2-chenyuan_fl@163.com>
References: <20260929083447.558818-1-chenyuan_fl@163.com> <20260929083447.558818-2-chenyuan_fl@163.com>
X-Mailer: mkdraft (claude review draft; edit before sending)
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, Sep 29, 2026 at 04:34 PM chenyuan_fl@163.com <chenyuan_fl@163.com> wrote:
> @@ -91,7 +91,7 @@ static int udp_bpf_recvmsg(struct sock *sk, struct msghdr *msg, size_t len,
>  		timeo = sock_rcvtimeo(sk, flags & MSG_DONTWAIT);
>  		data = udp_msg_wait_data(sk, psock, timeo);
>  		if (data) {
> -			if (psock_has_data(psock))
> +			if (!sk_psock_queue_empty(psock))
>  				goto msg_bytes_ready;
>
>  			release_sock(sk);

sashiko is right. This replaces a spin with a hang.

pw-bot: cr
