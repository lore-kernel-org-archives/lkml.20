Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794524660;
	b=HNEc4ckyi4V9CyOnXI0vhQ2ZNbNn37NPZCmVtV/Il2hI5eWUASJgjly3XpVZn7xjlBdy
	 cd4qjDunKRssLtk3H1XYRCKeCkqHCjAx6jrcHkcPgxsTGA2x0ywHyVgFCZYb6qmfA4cHR
	 AvqfeF9tNuMXzxeRum4edQNnWrHwGCaqQwqf2OqtOrvA0wk4r3ECc/mZHdniIYAdhAv6u
	 YKctXiSKEJat31Un9ba2Wvt5Rr2WHnJgtuxeJ6rB3yYHNlOglhhW6VT8yqSUxhSWRk9II
	 796lQASrJ2tEJSNHa5Xgw0y13FyVc9iAuGKOBrXtjRUwW+KnbgLWrLot+d3IrC31sgQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794524660;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=08MDudRooDplOYZuxvUS0XwmDlBnmweFEYBeZu/K8vU=;
	b=grnN/yFdhQsfVhquUDnMWIwT3rAm9CpVqarZ6eIGh5hdFSKfXv0wQ/eIzUn1y2jYX2om
	 rWQTKkQQaxNdH63AxhhwoHt31nz7sSfZORBIvbxgqD8ZyTsy5XGgTs76iowQoxtdxeOO8
	 QAElWA1fHgPkr5kpifTDqHHK5TUWju0bH3lMgJpDzmn9xPElv3BvyfLOy8lJRkT1uvR9U
	 iiB16/d9owmsqNbCuhoqPfGoJm3oRar/+vbIg8S4JUNj6oRGTPgipprX65X17OnTbAnzi
	 cbYmzPJOtTZqXA95PU+jpVkq6UF8HUPNPJT2AVnrXMdF1Bjq8TWOEvHlSr2S4KU5piQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=everpuredata.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=everpuredata.com header.i=@everpuredata.com header.a=rsa-sha256 header.s=google header.b=YEuX+fX5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.175
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48EE2606A327
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 23:04:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48EE2606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=everpuredata.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=everpuredata.com header.i=@everpuredata.com header.a=rsa-sha256 header.s=google header.b=YEuX+fX5
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5eaa5e03c47so1340871e0c.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 15:04:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794524658; cv=none;
        d=google.com; s=arc-20260327;
        b=lrdbg/8tOKYhgFXQD6lGRAhuY15Zt/NNj6fwI7T+VQTRg1iZtHl4lZ28/lqH4wdEXv
         mzUxoU8tf2Z8S3VtBFdnH/WHsa81+ksKYMKtNxO4/yNn2aj6evt3oIVPZ7h9+zcFhRWh
         cOk0f53M5btgSTLrmciBe2+ezSS9QMYmQYFVAD5mwZNpFEwGbnvofDlMkKSkxxGqKYuO
         xXMYoxElipGEeIaxuGUp1V+Sd6YB6XeZjbaX5lgPQAK1uKRrkfXs+0Ukv4qXuAOmkQkf
         3G8XFY2Cln+7+Es0jsJe1PImC6dvIB0xAwThsh9a/80kRuPlVw0fX6Tv0/QTb8K3G/u6
         C3LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=08MDudRooDplOYZuxvUS0XwmDlBnmweFEYBeZu/K8vU=;
        fh=5xoL8Tk5g0qJ4i/rWGJF1ge9xTb6BP8YSuWI1ShlKg0=;
        b=bzOqt/8RXYQAhnu0YYBJ9Zh/DkUpg/W81dpaKk2NrUXT2Xb/2Ld3+j/N6gfVlSILP5
         yWlTBAWLkZAz7lBEy6x0mFPdPWjuWebfwP1njRaY5xV+waiXun4ceseMA1MKFFsG00z6
         o6MohhZYTscXJzoYlL6ERJIDoAqi6OtIneA8N2KL5VN1Ey3aQFSQkXLE27i8N1sS4bcp
         NWpDyK1VZL4G3hmQXOLp4DwOc/Y6J22VcQ6LBoZiJdJic4y/fF1c2umuQ9clRkF2DHqk
         Jvh2hqDyrxgRKJyHyZjCfwBaiCGkT2mjXcCN0oBLWW0LmSA0/GPIQ/c1/GSF+RKDLYZG
         3Qjg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=everpuredata.com; s=google; t=1794524658; x=1795129458; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=08MDudRooDplOYZuxvUS0XwmDlBnmweFEYBeZu/K8vU=;
        b=YEuX+fX5PVk+ImDaWF906WZy8L87NhbtVg9P43fmC2fewvrznUnbo63wuRLcy59skh
         GnRGKrbyGMz2w/B9lWL9UatD76ON/1KxM2SwCDMcioMTi6MNw5Eb2Wc9v8T/z6fgrIB1
         dvi3Ze6/Q1bIbPMCoQp3ukySEtx7HwxWZsI+gHk9izaRgjvZQvfYAunAsM3L1neAFMuK
         DQ2XXlgNRvgp5N8UaJZk6uUhqBlL2qb2CoOPPXZq6dEj4MQlo4VDdBqosBvbVEfV/GQD
         Y7LbTvm5kcgeC1iQCyQ9Lxlr7GOvxUouAI/iSUf52rUG7Q0W/y6AO1r+iSC93n+cvcoQ
         gcZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794524658; x=1795129458;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=08MDudRooDplOYZuxvUS0XwmDlBnmweFEYBeZu/K8vU=;
        b=Bh4ugXxeXNuAxfMmeHLcIAHOA+4QLVe9y35iL2jNMeJRhYERhF7poEKGjZT6ZKklyV
         JxFLFthCGukITDYm87CueC0D0fw5isJLK/0LLbXP2YG9kod23fvqVEC+ZNW66c06H7eh
         Gy9UvNnGAJ1lepfqfYjjBrIChLLkanQEZdLqAqi4IhoKsxdVrz6Uemi8M5Gn7ZFXIPtM
         CRjec+/57a6lxUGxZZvN8UFodObrDsAXf2BUHLFPQPzycZP/vnwH8T7hWGjBWdVGlkar
         ephgCjes3hWLN8PQd7sxkNEeCVC8NLYcGXIhbl3bbN1HYc2d/zY7Cns5HoQNXNpb4h1J
         pDqQ==
X-Forwarded-Encrypted: i=1; AL+hErFr0E6K6Kp4snyjlJAu0epJr8a1GG6qNjQhKemwXTN4hX0hwkGew4Q8OkpkG+myYIGtwF8vLaoRrWwsNsU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8z5KzJ6vJGvdo4mJxDBzTMWKi+lBgLPCcbpwrwdmXGc5TS47vf
	7POWZ1g4PwRHT9h4bmzdiuV/NXaAqp/6yqsbaYf9ZZGtyWfHQEunwTkf4rChMps/X9x/gfhDBgK
	IUihf6myG6oIpNvJcdcQEtZE6hLJx2f1KhvbxIKr1EA==
X-Gm-Gg: AYBFou0cYaCEw/cK4u4wfwWmzGBwqJYSwSiCFOAh9mleuAQJV44m5AtVb+Odtl9Do85
	U7kSiGtTrQL87EGfcZuEwh+Cyec7hvZkK/5t2St+u+PH/KIyzxAgZl16HpSZRhYeLPsXVZgh1wN
	/d58y3M/3qJU2Pnfo7K9QL2aug+L02C4ushITgRAHXyxyBr+ruER/8jMIHZFAg+cGwMsTQ2LbRB
	V/xAmJanUf6soRJWWLS6xkRC0L7BmGQNB235cSn09Two5sz1sxurE6i51cc1rNYD1ZPl4QmIDZ8
	6Hj0aKIG17skRFKyiPa4vuWbJ5+RWBp3qmT61FZc18ZTf1WG+/Z/ltEjru9Yh5RjP1wzITP0iDC
	reQNqEjcSTqV2GKCVfYSzm2OtnooE3vW1ZVxkFhOUtGvQufjk6s2532Zh1J6yp4YyWp9rRT1MyB
	qMmtST3gLCeYyfvdh44HS0sdhvOHzQlzCmqKR+6eVrRrevHdxhKLi2ko/jcAMfFou35/WVdqTVA
	NODhds03gObUQ9ETeC62//OKPq2Dz8JUrKE9vIQYy4fWN0=
X-Received: by 2002:a05:6122:6849:20b0:5ed:c029:411d with SMTP id
 71dfb90a1353d-5ee274efedcmr1175996e0c.19.1794524658165; Thu, 12 Nov 2026
 15:04:18 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104183442.617519-1-rjethwani@purestorage.com> <20261110131222.7e228d44@kernel.org>
In-Reply-To: <20261110131222.7e228d44@kernel.org>
From: Rishikesh Jethwani <rjethwani@everpuredata.com>
Date: Thu, 12 Nov 2026 15:04:06 -0800
X-Gm-Features: AclHuK9qUUhccz7x5a5PPsAmZt6NNNYClixwKS7-w6C5DGK3uR7rry1APfVSnPE
Message-ID: <CAKaoeS0KoGs9mZZZngwh97+8VgphrRxnHdGr-XmKUzmVp4AK6w@mail.gmail.com>
Subject: Re: [PATCH net v6] kcm: reject attaching sockets with a ULP, and TLS
 on KCM sockets
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, stable@vger.kernel.org, 
	Jiayuan Chen <jiayuan.chen@linux.dev>, syzbot@syzkaller.appspotmail.com, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Hannes Reinecke <hare@suse.de>, Sagi Grimberg <sagi@grimberg.me>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 1:12=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Wed,  4 Nov 2026 11:34:42 -0700 Rishikesh Jethwani wrote:
> > Holding a ULP also has visible side effects: getsockopt(TCP_ULP)
>
> This part does not feel right to me. It's not a real ULP yet we will
> start announcing it via all the ULP uAPI.
>
> If you repost please try to trim the commit message and the
> documentation slop.

Agreed. I'll replace the dummy ULP with a bool in struct tcp_sock
under IS_ENABLED(CONFIG_AF_KCM).
KCM sets it on attach and clears it on detach; tls_init() checks it
under the same socket lock.
KCM still rejects an existing ULP, without appearing in the ULP UAPI.

I'll also trim the commit message and documentation.

> --
> pw-bot: cr
