Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793876757;
	b=NxL/ljdcGP0IxttkkxNgC96SlW/mD1o1L2QKz5oJlWNKDEbf2gJeR3k5pwwx6OtgNgxw
	 /Tkoqv/djUa7fAdZhrJr+k/WPdvkVHLMwS98sqRw7XdvGZggQDspkitq948t6Iu0E9vVP
	 HLLoYo0AbCvWPdfRKBBi5SyVSNDeeclY5jTyAZEATL1vr+JFWYSXYQGepCAVZ/9Jkt8+z
	 VDYGyOEfwMx7H+kvBi/b7hr/JKI/9mWQL3vW+btTB+eDzj26/e/5DtVtX4eGtQ/TPH7X8
	 bViptPIJgcNaWt2aGCODyPAwXe7oeU3ZdUpDe5536/3SeoRD8RwhQXnabGXxatpDCUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793876757;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=UkU61sxV7gzGCXcoseb2sfWpv/CEGqGt6zB6Q3Q0kmk=;
	b=pEM/IsR8R8srxEpE/Dpk+du5fsg3LnBfg0GKkyGz17qy4SG0SBPVcra8iNGzQJzckhZ+
	 bKG8iiEuI4cPcqhuG50kvtZ4oK/zSlggFWl3xmhsj4KeYeABNoJ2gijrQ+hd+wR/NVVuo
	 KywqHmHhK7ACUxA6xiE6feP4NN51WxyIPoW91wMbFZVbCHVP98ZcqqlLxKlYUAzcArAEb
	 FvCpwZ0R/ruMi9/CFgZ6osB/gZRr/qfiQpLswA9EaoCeHlq+tl+bxPx0fAeOGMXfYkUIa
	 seR5OWdp7UY6tHGmx2kGwLWkI1+PeBB/J/jGzAwZCTY+I9S2FztDsdNr63z2RS0g6YQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=A22+nj2Y;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=WsXbCiUM;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB0D606A32C
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 11:05:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CEB0D606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=A22+nj2Y;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=WsXbCiUM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793876756;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UkU61sxV7gzGCXcoseb2sfWpv/CEGqGt6zB6Q3Q0kmk=;
	b=A22+nj2YOu97CDr0XDsbCNcOJ+/rakAzl2YiD3LQz0z+YMZnMtj4WpM5Ug+LHPt8YI8hfN
	LC9Ug5Kw385xcNWYB9v/oUPzYBXz5avuD5jaSZyAefbYXHMvWHkhIN5NCPmTOE3D4sbgzu
	vMtDuAV73rTwUCbvF3ADBTyDpXJL/Ik=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-117-IU0d186jMFOVRREJImL7Kg-1; Thu, 05 Nov 2026 06:05:54 -0500
X-MC-Unique: IU0d186jMFOVRREJImL7Kg-1
X-Mimecast-MFC-AGG-ID: IU0d186jMFOVRREJImL7Kg_1793876753
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4ae2756fa7aso12826575e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 03:05:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793876753; x=1794481553; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UkU61sxV7gzGCXcoseb2sfWpv/CEGqGt6zB6Q3Q0kmk=;
        b=WsXbCiUMSkqnE7ngUMd5bOc1Y7Lq5+aUK9198qqWt7QWr0eDvbmtZOI1vFmOKCjCVz
         fA44mYEnwS8K/g2zCYrINd6So33X1L/gDnLg/GQAZvMRYDZALc34jwUR6wOr8CIF5UOy
         +3BVK/kmtB9JfESFQdCVUCW+lCTlUt3+9X7a3swK7j4IVqgh1QQ+w8q6ac2lMCSLqHHi
         tsFJkYT6d7vB8jQpu2K+M+RpWi8VqiHAdDZtuJJXlgPClPdWiq/pE55S2yTwp4qjncDb
         K/zMD8S8Cjdz2kqrZiL3W7Q/Y0NdYBxuajnx/UwMwbrpWczieFQnuKBcA5LtYfG9is4N
         serg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793876753; x=1794481553;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UkU61sxV7gzGCXcoseb2sfWpv/CEGqGt6zB6Q3Q0kmk=;
        b=rqCQaa5/R2OoT/LlI8PAzkhBMHuEccQQL3psraT/8Aomclg6dTD9e9GtrerZYd8hdg
         F8fFsuXHZFdu35hHDzT88TIYyOdHSPPoEsIQ4rsfhm88O/op1hTfV/zw38PR2XXu2dGq
         wH19Nvfi+LF/w/wt6WlNl9WQMG0IhkQPP3jC2+yyBSJ0uE3R3HQJjDUY1N+OmnEjVMVZ
         EMJjbY+lIAOlUrLsmUfVpSLgeLDXNJ7rAYPf+xMyxCnpuvsopday6E15toEIUpJl92uy
         EEDqi6FfIzTRmyZpVvHQMQcuS04qTWEpcZu0d0xuLd9YA0d2lCawm0P6iXXj69VHN/tM
         okVw==
X-Forwarded-Encrypted: i=1; AKwUvBx78zNISsrz2Y3Wkd1JdWldhdFrPw/hE7pJF6KKbseGzHWLTejw2IfJYCTvLTTXT9+RFKyitDLbgoPzwFI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9S6vUfaMSfCiH1KomCi2lTVURbQfUt1BM9f5uBOX3sdsxmHgZf
	RZiqK+zu6lKyAUYSU911x3OJFsYLZgKTCwDPq3F2VPtcvCSCyqCZwTeosbZY67xeEgVkc1nHDvO
	DLTfNGjq0+2+HpdhWTUioJxVGl0tnc5HBTiBGdSIsIW/Bzw415LYPatw39FXca/g+jw==
X-Gm-Gg: AYBFou3ufhw+lDDvs/N/SbGxfpaA0TZXW9vdp8DxZK2II4oSE3/p5b1An/dj4YLzp4/
	tHFDOT55UiCdK8JS1njGTBbwdWxvjhS4hbJrSiZYU4Of2/z48DbiKNvp6wVeZyOk3XMtzkXE0t8
	JTxdr4r/4T7cPLyShRpChb9yoiQW2iI48OVXZmiMN37uGSq7JwRjYnDfc+fOmWqD57O+OoildGd
	Eu0WOxOfAIAvR/UmJRSR6xjb18ZJZlZ5fcFAerQvQUbTvpPUH7vs1ipZz+QGN8egkFq6jTTSpgl
	sMSYMu5QdYN/j6SH2oAdOX+881In+53YC52JI2dnQ6cXH1lOCHf6P4QaL/Q2MP1dknlrLEwGt/T
	KyKgLFsvk2Yyi5/qNp95SPNkv082M2UqK1kl1DUqccrJKzImggxa/SbJI8Fs0TkFvGB+pnI7XNQ
	BSxR4LckEU6YXL+lFgcAWEbia+lOrIGPidN19VUy45aJM=
X-Received: by 2002:a05:600c:a49:b0:49f:e701:51c8 with SMTP id 5b1f17b1804b1-4ac17ffb2ffmr423454995e9.9.1793876753418;
        Thu, 05 Nov 2026 03:05:53 -0800 (PST)
X-Received: by 2002:a05:600c:a49:b0:49f:e701:51c8 with SMTP id 5b1f17b1804b1-4ac17ffb2ffmr423454415e9.9.1793876752918;
        Thu, 05 Nov 2026 03:05:52 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56e2ae73csm59042825e9.1.2026.11.05.03.05.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 03:05:52 -0800 (PST)
Message-ID: <1518ee19-95b3-4a13-b36d-5791324a6a23@redhat.com>
Date: Thu, 5 Nov 2026 12:05:50 +0100
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
Subject: Re: [PATCH net v3 0/5] net: fix misc signed overflows caused by bad
 sysctl values
To: Jiayuan Chen <jiayuan.chen@linux.dev>, netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, David Ahern <dsahern@kernel.org>,
 Ido Schimmel <idosch@nvidia.com>, Thomas Gleixner <tglx@kernel.org>,
 Joel Granados <joel.granados@kernel.org>,
 Fernando Fernandez Mancera <fmancera@suse.de>,
 Petr Pavlu <petr.pavlu@suse.com>, Kuniyuki Iwashima <kuniyu@google.com>,
 Willem de Bruijn <willemb@google.com>, Maoyi Xie <maoyi.xie@ntu.edu.sg>,
 Oleg Nesterov <oleg@redhat.com>, Zhan Xusheng <zhanxusheng1024@gmail.com>,
 Gerd Rausch <gerd.rausch@oracle.com>,
 Nikolay Aleksandrov <razor@blackwall.org>,
 Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>,
 Wyatt Feng <bronzed_45_vested@icloud.com>,
 Hannes Frederic Sowa <hannes@stressinduktion.org>,
 Flavio Leitner <fbl@redhat.com>, Petr Mladek <pmladek@suse.com>,
 "Paul E. McKenney" <paulmck@kernel.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261101061331.286404-1-jiayuan.chen@linux.dev>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261101061331.286404-1-jiayuan.chen@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/1/26 07:11, Jiayuan Chen wrote:
> Recently I have reviewed quite a few fixes for variable overflows caused
> by config values, i.e. a value set from sysctl, module params or netlink
> that is accepted as valid but later overflows when it is used in a
> calculation. I believe there are more of these still out there, so I
> used an LLM to dig through the code and it found the issues fixed in
> this series.
> 
> All of them have been reproduced and verified in QEMU.
I think that the 'net' target + CC stable here is a bit too much.

The uAPI changes, even if reasonable, can still impact weird scenarios.

Targeting 'net-next' without CC ing stable would give time to
possibly catch such users.

Also issue predating git history and exploitable from root only
nowadays is a quite a good signal for net-next target.

If nobody opposes soonish I'll apply the series there.

/P

