Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793701342;
	b=xW+ldsYc/zYnln1Du/PAT+moagWkk1TQRkwZewKicMjB2pKoQ5RSztLviICMHyJxNECE
	 ExHnZ4zvX39USWDtK3ZzB7vJV0okHCsGQpdVyNPGFlUM1NAJMcG84rnRW172frbjjXGFy
	 k/veFt3a8GaylZm7/lDLlz5r3c/2Dx/DXkKe4uFoJj/2hkWE3kb1D3X/cYp77mdjr9SIx
	 m8i1Xic3J+56gQp1dsn7Y1Q1q8zkrbFluGRcRMd766G5mPhfFUYBlhYBpnSkvdaH3sovZ
	 Lj6Bllirx+hH0pnwGdWHdE9rjC0SU/ljiJFQOF494MfGkkZgkwzMMuvEqP/99XhNNmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793701342;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=UFZrl8Gqjh0zbtPSbe7UBmuFSffWEbXhNMJ/JvbVAN8=;
	b=OudR45bOiJFzmnpNuhakjEU9meEL9+yHgydGvY9Brl3vq7FnOMUYG79psJekSxepurlL
	 q961Cibkdhzcul5fp3SMgUuKxkZWhB/fEJQ/BhtPQFYmks3bVrG7J5ovx1YlNgf1g7rqZ
	 MpGJUi3zqkjfS5Gwetlz1k4oHMNujnyX3sb3uW5Go2qfUUssW8AxQdOrYU3BF1SARstzv
	 qvDlaKs8FqVvbIaCo2U1pNQCOkAuRxyyKEBv2nM1JBITEAkY4fbTFSRx4e5Fo1EDczwP7
	 xKX8NuWU1qz4d/VvVfdq0zQRYlm6paHlTNWUVpy4xvkdIJVz2yluX2ujuS9isO9cy7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ixdou7KZ;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=jYIQepxw;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 664A2606A339
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 10:22:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 664A2606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ixdou7KZ;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=jYIQepxw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793701336;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UFZrl8Gqjh0zbtPSbe7UBmuFSffWEbXhNMJ/JvbVAN8=;
	b=ixdou7KZohYPa3XpTK1Vb5mEVMNBeBxC/ppgHFDXOz200PaJ0VZDiueR+X0YhJr5NENEBJ
	nutO5KKgtnHz//VWkwhTKO6P+1JVV43m9IHZojOur1d5sdjj21e810Oy+0QqnVtwVacA0g
	AoPko//1QATx0QBVMuX2Cz0a5+q685k=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-632-w9oz-hU7P7-fgMUoKF6K0Q-1; Tue, 03 Nov 2026 05:22:08 -0500
X-MC-Unique: w9oz-hU7P7-fgMUoKF6K0Q-1
X-Mimecast-MFC-AGG-ID: w9oz-hU7P7-fgMUoKF6K0Q_1793701324
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-48dfdc0f491so2135789f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 02:22:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793701323; x=1794306123; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UFZrl8Gqjh0zbtPSbe7UBmuFSffWEbXhNMJ/JvbVAN8=;
        b=jYIQepxw5jpnE/O/Q+sT96141cHnoCYT7ktbI905uuCcQiuHZvhQz9xQI5Q6XLYLWk
         ydgMp9p2bhDlP1OyE5F6q1FBjIakzIsFJOI5KLWlE4205bkD1SnjkgYWdj/e4zT5bWUK
         y57Zl+kTN8DsWMdfW54S4i/s1ix6OJCYsoEqezWZvoaKpdTcIwVNAKZwz7yYUhnbD7oX
         YvbrYFXulXIrz1+oD9xV15ZQ3Txp4/0g7HAetCE4y17op4DxJbTtXkRp1c0wpTADOwfH
         LLvfbxM35+I85+l6sUeZbr2GiJUs4PcYip0u2feXEbBCQUZSdBI9fSeCEHBlwfZi7CVn
         7UgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793701323; x=1794306123;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UFZrl8Gqjh0zbtPSbe7UBmuFSffWEbXhNMJ/JvbVAN8=;
        b=PMRZqMzUmER5cjmjLJ28rCmZr+Bt0LsjLoOuPMlAP4VNDIUb5YtfezTx/ilhVvmtPl
         eY4cj6o9qkiNz0lx5wjROZl3AECZFvoBS3Vo87tafL120uT8dip2f89jWP02X6qQc8ZV
         0D0/92IWMDpY0oLsWlBHJRcuArleyBkUGek/JtGXMzqR9C4XbOTVnvZIoeM1Hk36ukuL
         01PtNWch/aYQasMdKT7Hzln+Chliz49276i36VbVb3MhNx8vVjvFMdcrAFVMf7ZqNRFF
         BFkcPEhn21O/t98Zfdd7B9z10gBD7T4Fo5p+gW9IGptmwDz6eN7CHO9w0TvbaXi1BaYc
         vP3w==
X-Forwarded-Encrypted: i=1; AKwUvBwf2G3e0pt378Fxf8II1VsPbL3BqV8mVx8Jwz/ShGjm4ztIIXpzR8ZQQ5ePcaFeKgQv32WSHXateqhlLQw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9DBk7/eTBRrIq+8J3OhcPvY20lbeiV4GRMnVyZDxKyevZi8VBs
	R3Ueymuhl0xk5VvfANEixNpnUb6DP/PwqiePprofp/TW0njxNj60Xu35xBn3DSHlBYRjDFTxOEg
	LVhIDu8qJyJPU63byIlnAO3MuF8kOyl/mjtkdkYdpXFTFkk0Lln0oPSfm89zTOW9/SQ==
X-Gm-Gg: AYBFou0cAQMna8KPcdi6bgNeSVMzb3nT/xpMxKXcM3BakND36c7SU4Fec7nsd3mVgBA
	JCIhA9Xpoel3dRuQaONnV4ftNyRyxc5qVd00m/NQp8Km4CuNLc/MSl01X0loJlgbnY5Tu+XXETH
	PhqYTx2HqlwwnQSuE7upbLd7jEzM8vPgA6Q3MFwWEHy0z07ZJRgT7+6SwbqtqbWTgEBpiuNZmih
	gM/cc76OYa2Oq8BUbz5LZusw1KqOSu62USSINkXs/bSZrhwGSwpeXFNVjpKzhILwl4ciTJwZsXk
	1Yi7P++A7IVDmxfpiUqarZYzklja2DNKMn35NhW3rKe0NHUCDWcywl938bRkD2edtKoyYGpTH4a
	5rZPCD0/vJJxHrVgZTG47/BRZiXvY54coElCERfJlo0fVYodHCqu8qF+Zr+ICJ5qopkJXWwJHpe
	e2sT/RuyfUyqhrg6gjLwOd2nwRyh8QZ5TnTalOAg+IWZU=
X-Received: by 2002:a05:600c:e41a:b0:4b2:406b:f3bd with SMTP id 5b1f17b1804b1-4b2406bf3d2mr59717545e9.23.1793701323076;
        Tue, 03 Nov 2026 02:22:03 -0800 (PST)
X-Received: by 2002:a05:600c:e41a:b0:4b2:406b:f3bd with SMTP id 5b1f17b1804b1-4b2406bf3d2mr59717075e9.23.1793701322587;
        Tue, 03 Nov 2026 02:22:02 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abe7700c3bsm293753565e9.0.2026.11.03.02.22.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 02:22:01 -0800 (PST)
Message-ID: <fc454b46-b66c-4a16-aa1c-3ea0c2e91d15@redhat.com>
Date: Tue, 3 Nov 2026 11:22:00 +0100
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
Subject: Re: [PATCH net v8 4/4] net/smc: bound the link failover cursor
 advance to the send buffer
To: netdev-bot+sashiko@kernel.org, hexlabsecurity@proton.me
Cc: sidraya@linux.ibm.com, kuba@kernel.org, mjambigi@linux.ibm.com,
 alibuda@linux.alibaba.com, davem@davemloft.net, edumazet@kernel.org,
 guangguan.wang@linux.alibaba.com, ubraun@linux.ibm.com, raspl@linux.ibm.com,
 linux-s390@vger.kernel.org, guwen@linux.alibaba.com,
 linux-kernel@vger.kernel.org, hidayath@linux.ibm.com, horms@kernel.org,
 wenjia@linux.ibm.com, tonylu@linux.alibaba.com, linux-rdma@vger.kernel.org,
 netdev@vger.kernel.org, dust.li@linux.alibaba.com
References: <20261029-b4-disp-33001ace-v8-4-f9bb96e17827@proton.me>
 <179364387382.3131.13471253186660322977@kernel.org>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <179364387382.3131.13471253186660322977@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/2/26 19:24, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 0 (2) · Medium: 2 · Low: 1
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [Medium] The patch adds a cons.count < peer_rmbe_size gate to
>    smc_switch_cursor().
> - [Medium] The new bound in smc_switch_cursor(), diff <=
>    smc_curs_diff(len, &tx_curs_sent, &prep), is computed from a snapshot…
I think the above are the last 2 comments standing that need to be addressed,
(the high one in patch 1 is addressed by patch 2, the high one in patch 2 is
addressed by a separate patch).

Also patch 2 and 4 still lack review from the smc crew.

/P

