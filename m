Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D30A850EBF4
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 13:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789650055; cv=none; b=Y1fZWm0qNLdvjNUf+YjOg3YiiwQ/bju5OJuQccXzxFYzKa1yTh13qvr2pQ4kU5C2kXooxyY90cD4FqW48AKvF3Mo5jVfSjOih9ucO7H/UwpG367ypF4kq3UKs5ePkR2kAK1aWPLqbhQ7HrF3ci1AMpL4PiHyFJgzDC1ofIzxY3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789650055; c=relaxed/simple;
	bh=vwgRYswkmFYVOj7RHSLDpXjS8/vNLNG+d/Pzf2YpRbs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q87OKPy/AKCeWOhXKkBlOXo5MnvTHrCWZEJA81d8SkBJ1H8ruulkgqD+j2zAHGs519m+ahVgO3CMd5Vd/B6Qm6ZWTeuTPAueosjQiS0wRirQj3zxBnNOACunwOI9aGz26WfVF/bWhCJtD429yN69egNHZfmnMTuhyz1Bs/DeGt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UREkS+Yn; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=gYU1mMVK; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UREkS+Yn";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="gYU1mMVK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789650036;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6ouQ9UMJuK7mTop0Sws+ZpuUFqnmqPSVJ5MDQLtIoDE=;
	b=UREkS+YnlKP5ScFevtzZO7BIdtOOgXsNqzqBxxSgkyE58bg++UQwXhmdDDP9paC9DEySbC
	V+ftIyQbPaBHicPhfCHS8SQm93vilTrRRowCx17pdXDB2qB+afSjw8MFNLfXF8ph9jCJc5
	8/vn94DgsRCJR2erkKv+4UpxrizBFKc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-468-RqNoSxH6MnufySlr-xIWNQ-1; Thu, 17 Sep 2026 09:00:31 -0400
X-MC-Unique: RqNoSxH6MnufySlr-xIWNQ-1
X-Mimecast-MFC-AGG-ID: RqNoSxH6MnufySlr-xIWNQ_1789650029
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-49e7631c43aso10184825e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 06:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789650029; x=1790254829; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6ouQ9UMJuK7mTop0Sws+ZpuUFqnmqPSVJ5MDQLtIoDE=;
        b=gYU1mMVKxpIL7kVEhorRkqxxcgyrl5GASp1nooXcYDHSkjUCcqaOXNE5HSK7oSDnV1
         7ZbyUbuhQiUyFL2EP9LJtB+pvx3uav+XVIMrI2xZRN2pIMKmnVft0tC7CnRuBTy4LTXK
         xQB7JcuIJ49HsIKOuVyfxWiejbrJK8zzP0qdyG3h4e0Z1paX42IuO13Eg40uZ9cgO1A7
         DTGimitjeeBb70bEVz9SSIQnxMuHwz/zZmP7W3kg04BTHbE0XBPJ04AeBqSkZ2N3kMn1
         AfTDkcU7LITdCgU1V4zTBev9c2k//xBDWNN0gAhLJKZ8HTAzedgvI/TfOQTuiz51SBgj
         37+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789650029; x=1790254829;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6ouQ9UMJuK7mTop0Sws+ZpuUFqnmqPSVJ5MDQLtIoDE=;
        b=PMILUSrgA+YOZxPUJ7shVcTMUurphOWLTOcCr1wNsEubQMCDvPpNhWznbl4WF9m8Rw
         aSK5oxSviC9lHeRAZXDfLTof38ghRb5q34UM7icggxYbx0xqEF/8EC9p80osdVBKOnwG
         4BihGC5qM/zfjSE+je9m1h333Z5FURrUy2KbRayDS0XUI+sMyxxZvgZyffhkL0E0brDG
         mG7EiTlIHLSRR3SEbB68wTmUnRzwWJkdu4RwGqUx5Mso5ROlhEgisW1FYZnEcN7HuEz+
         1F2TEjunwqp8D8NOP20/ok0zfUcD1Rm0WCpozbZWdwwdeBwBxJaowwKyH5cQG9evQk1v
         k9Ug==
X-Forwarded-Encrypted: i=1; AKwUvBzzfIru9ZTodHj8T5M6Y2PJ++oqRZd2pcHxEUruzlaOW0WJ9R8JAXzyEOVBgD6IQ266HZw8E0pSJfLVX/w=@vger.kernel.org
X-Gm-Message-State: AFuF++npWRA4Q8yolYJ6u1y92/OBoHSacaH9smXagccvcCKO+O12iOJ5
	20cchSH6IvAkqf8MY3thDt9atkorvVa034p1WK/mTxAXuNXdBmYn2f1Qbzau5yRtG+hurmRY9I3
	qHDmH6QznD6e3O9xXuiV9k59GCD/9cYMub8mpBQESEB3lUc2czZNoXear6htl9Yywxg==
X-Gm-Gg: AYBFou1nBIbk/asGBz6uX3/VmCO/dmGkDFH990KpxFgVD0EAujhOpQ/j4sTIqx2+Laf
	fXmrR9D6naxC3U6WC8HEq6OBSl1mh7qrJsu1lzU8zdcgSHPIoMy5Kt2MCHs43M49NqbKlVPwyqb
	hQ6NFw0f0qLDTzhGDd6nrV8VaAwL1BHRLjZ1fLXxjsHjoY2AUNllpUhmg4g2FbOsb5FzMgGzNWD
	7zhhn1ZBv1dcnfrMt/lgnuSilcKP2I6/Bd4bDMGUbaqIYele89MxLQbX3snTxAdQoIoySIDnti7
	4H1Ww0hy6yx9Sb1gt4E5CVeqTlOnEY4nPgnrSRxup4aVarK04SUuscW47n0gWEkmPtMXFVoqvKV
	BuJ1BJ8HNyw+oDOM1GZwrpqKgrfRPup//GRCKx4NitYPTOjDfrMNrI+RLUqKa4TzJz9RU6H6qrA
	==
X-Received: by 2002:a05:6000:2089:b0:487:92e:c608 with SMTP id ffacd0b85a97d-4870ceee268mr16040967f8f.1.1789650028877;
        Thu, 17 Sep 2026 06:00:28 -0700 (PDT)
X-Received: by 2002:a05:6000:2089:b0:487:92e:c608 with SMTP id ffacd0b85a97d-4870ceee268mr16040713f8f.1.1789650027358;
        Thu, 17 Sep 2026 06:00:27 -0700 (PDT)
Received: from [192.168.188.234] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf342a0sm15323682f8f.24.2026.09.17.06.00.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 06:00:24 -0700 (PDT)
Message-ID: <ab569155-f779-427e-8c8f-1dc5315fb0ff@redhat.com>
Date: Thu, 17 Sep 2026 15:00:23 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2] net: usb: catc: bound the RX packet length in
 catc_rx_done()
To: Aamir Ahmed <elb12345@hotmail.co.uk>, Andrew Lunn <andrew+netdev@lunn.ch>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Peter Korsgaard <peter@korsgaard.com>, Ziyi Guo <n7l8m4@u.northwestern.edu>,
 Ethan Nelson-Moore <enelsonmoore@gmail.com>, linux-usb@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <AS8P251MB00015FD7716F38C345619B56C8BB2@AS8P251MB0001.EURP251.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <AS8P251MB00015FD7716F38C345619B56C8BB2@AS8P251MB0001.EURP251.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/15/26 01:06, Aamir Ahmed wrote:
> catc_rx_done() walks a multi-packet URB, reading a two-byte length from
> each packet header. Its bound, pkt_len > urb->actual_length, ignores the
> header offset and compares against the whole transfer rather than the
> bytes left from pkt_start, so a crafted packet header makes
> skb_copy_to_linear_data() read past the buffer.
> 
> A length below ETH_HLEN is also accepted, including zero, and
> eth_type_trans() then reads a MAC header from the uninitialised tailroom
> of a shorter skb. The is_f5u011 branch takes its length straight from
> the transfer, so a zero-length URB reaches the same path.
> 
> Track the bytes remaining from the current packet, and reject a header
> that does not fit, a length past what is left, and a length below an
> Ethernet header.
> 
> A transfer shorter than an Ethernet header, including a zero-length one,
> previously became a runt skb passed to netif_rx() and counted as
> received; it is now counted in rx_length_errors and ends the walk.
> 
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Assisted-by: LLM
> Signed-off-by: Aamir Ahmed <elb12345@hotmail.co.uk>
I'm sorry, but no minor fixes for legacy drivers.

/P

