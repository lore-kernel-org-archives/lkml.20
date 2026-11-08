Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794176889;
	b=nbI81OmjZwQvK75/9ydRY1sOEZCN2Y/P6LlZ6eyJyzFkmb/JTH8rVHeySKkfsLlDqMXa
	 LVKPv+I7qAHvBMoJ2k4z2OBzDAUK+U/DMYhootrRwbmuKkexmUrbsUgPs7T9K88k+ixeS
	 7jl+U5zOwjvxdOgDU0s63U4f+Nm5PXfMiniGdjgc/s2JiHrqAtVve2mQ9RVYS2wQW+M7f
	 9EPSx8XOFQMzc8srfcsyywQBBPEAp/XUsFrIsmvlIkMSPzb8TmE7jUtWuT8xfANvPC1CV
	 3KeMtuoy4zrzQEsbF/LR/gbKR+R20YQ9bNN2omYdb6AuRwrkv4Yy4mybeOCOa4UaszA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794176889;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=7p12hu+h/2h8BDalwKmT9RqYemNdCQPSYKJ8VeGC68Y=;
	b=DjHfM/cRJFVP45nEpHDkVQjkmn9VaGZSCvPVO+yH75w8fsh2sJbKNb4gIcKQPAP3tsod
	 vr0AnL3dYqntPQr2+AEN47UvL3ltYCuSy4v5zxnmZ17ju5MJxjMw4o7H192SCQPXHnjid
	 6LYWhnXSdUF8iu1FEFrHxLziHjmLGW06R9CLyAWa1jzy9Z+MAvFk/j8rNpnhPd0p320MF
	 OY84Jg0KK38XNlB4BQgl38KJwsszS6qFs6CvNAiIHWImqp10apfARZWbGLzmpIlwqv+3k
	 49hITJKIgWN0ga38GLYDD1/BBFI5TE0AgA7SsE/TgZ1TmfIqUW3CgKO/n5zmNFcLGuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gc7oUUKY;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1D4C6082BCB
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 22:28:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1D4C6082BCB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gc7oUUKY
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a78ec32fadso365635e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 14:28:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794176887; x=1794781687; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7p12hu+h/2h8BDalwKmT9RqYemNdCQPSYKJ8VeGC68Y=;
        b=Gc7oUUKYhXfkzyx4k8R8oVoqd2a1GEZJYPK8L4AhkN64P4yEv7LvuatfcoSyFVoVWw
         LgjwkaxoNOBgcBLRLPZ6qRzyJ6gy8CxIHCs45u7htBQv6+liu+k5eDu6hrOsQjCZSA3P
         ueHS/oBEzNRSm96p8tQUy+0/WHVA/HuqX+6iDRzLP6LPc0wqvybPxavkZv7tOeqKSxyv
         hi6WTI+N8x9ng5uL5hgJJWVXc+bvFnMEn8MfovnvgBxBL93Cqaq1Tfk5OWmc8iWTSbvy
         jbU7JtTs/SYdTNq2cmcvjKHrvOL85H9ksfXgMDpUNnXuuqykGC0zvTaBSsFQFjpvo8tC
         9z9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794176887; x=1794781687;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7p12hu+h/2h8BDalwKmT9RqYemNdCQPSYKJ8VeGC68Y=;
        b=hn5moImp20EhhL08TqaZAlGXleikvlS6WANTy/ZlkVr3a7TYilwFN8TEA/MropwJiS
         qj3MkxaRoc1HlsXwcCXrFVab7dmsGYwA9DSyjp4lzlTodNmkWVTFHBMbxngdwn9i5DKw
         MdaT/O+5hv4T1bn85R+XYidu2BK2/jt3sxiaAJqUwUQ5KNhYgZItFDdFixyt1QIuZOmY
         S+jfySsiwOPZcHmeKBdK9Nj1VHDsJFL+rF8WdpvtlXMWeWS4gr75cS1OJMTFZqW0GCQD
         8VSIoWR5tarlsKxGaTbPlkrZBhiVE17xwkZyjlWnlti7Z04vbB45SSBpeK8QaWSDj26L
         uDRQ==
X-Forwarded-Encrypted: i=1; AL+hErFTSLTagtJ0DBTacRds2JqYkf7ezQnxn+h+Dsfkk95HWhccHt+qzWYbDBV92OqZt5/eGpuglthJp4aepuI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9LHnDFMqe3I4rDzrldby5EixudwpdAfNKO1QYa8AWRXejx59X6
	JIcoD0WAOu3+fPAAhGQPks8x3p0o7GG1i3Leclb2ojtMtyOpkTolOxuf
X-Gm-Gg: AYBFou10rLmutNyOeEQs8sTAmWZGMM0acbY/Iv/dA+gMQe9ER42XwvKkhyW5OIDuYAU
	hJrei6x0zX3jMCqdYKUzRVpCYepZzULDlmOEluG7+4pWC6V9sf8d9iJa86GqTRaGOebZ9ih2fo5
	shQgVwM3SqF9G6YMJCFNVJbeUjENtXnahWGJLimKXdtdFJG3BXtXzqX+9Z02I658GoCaNygGA/V
	+sn+85qoJ5FSh5eW/GLV1iWONmSXng89eFF1m6csw1Wpz6WdJioP5zjFArUPDrhRUEtoCilWUBc
	5+myYTbpmJjLS9peXnyTkh8UiyjYOr8CLxIwo7Wa6EpKnjcCyNajaJ1DBbjb09Rs3JocmuDNDHk
	4vxB+LRdHDlMia0qh5IJ0OTeBjgx1rwMyDl3ga7QwDBp83OuVv4MEGwoN9LJmGz5cNtmELGZfWQ
	pzTD5O0tAO6buGjK6u/fGaivn4q/c18L/4fJy2Ow6/OcEX0D/mmEB0nvfLVhW2Yahg8rg/eA1MX
	+52g9iS4WTGQq2zuAITlLXbzqVooffHGl6/VA1vsCT1zIV0FwIhBrjgSRwqhlDuQA27Jg0AgEOI
	wHNFdzTxoibzr0xCPWk8xiS4C3ZfiUKti/HDPqLvlRMo0KfkPxfq+Q19zOh5h2ys0FFy1HEhJL6
	JSV1fWjuKMp4IHBJiAcemjt2D4qzU69dak4Jk0Plp+FDYh7bToG1jHL/uVROoI5oQOy4BDoD5no
	HP26EK86XWYpCRdBiWDoU+EEtiJr/zfwKFMZNJQJCpFqCwGTc=
X-Received: by 2002:a05:600c:c09a:b0:4a0:1f9e:5f78 with SMTP id 5b1f17b1804b1-4b943f77191mr31556685e9.0.1794176886817;
        Sun, 08 Nov 2026 14:28:06 -0800 (PST)
Received: from ?IPV6:2a02:3100:599c:f8fc:6c90:be22:1a93:1ff? (dynamic-2a02-3100-599c-f8fc-6c90-be22-1a93-01ff.310.pool.telefonica.de. [2a02:3100:599c:f8fc:6c90:be22:1a93:1ff])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b76cb772e1sm212597315e9.0.2026.11.08.14.28.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Nov 2026 14:28:05 -0800 (PST)
Message-ID: <e1a0aa77-908e-4786-96b2-5d0d58675f21@gmail.com>
Date: Sun, 8 Nov 2026 23:28:04 +0100
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
Subject: Re: [PATCH net v8 2/4] net: hsr: refuse forwarding devices as HSR/PRP
 ports
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, andrew+netdev@lunn.ch,
 shuah@kernel.org, kees@kernel.org, petr.wozniak@gmail.com,
 qingfang.deng@linux.dev, fmaurer@redhat.com, luka.gejak@linux.dev,
 bigeasy@linutronix.de, xiaoliang.yang_1@nxp.com, skhawaja@google.com,
 liuhangbin@gmail.com, stable@vger.kernel.org, sdf.kernel@gmail.com,
 lukma@denx.de, fmancera@suse.de, danishanwar@ti.com
References: <20261107220544.20-3-xiexinet@gmail.com>
 <179417570554.994134.17137863494736269542@kernel.org>
Content-Language: en-GB
From: Xin Xie <xiexinet@gmail.com>
Autocrypt: addr=xiexinet@gmail.com; keydata=
 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
 sNySbH3veZ/55EtlXA==
In-Reply-To: <179417570554.994134.17137863494736269542@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

The point about cloned data is right: skb_share_check() only
handles a shared skb, but when packet_rcv() or a tc mirror holds a
clone, the TCP/UDP GSO handlers on the RX path still write the checksum
into the shared head. v9 will make the head private with
skb_cow_head(skb, 0) before __skb_gso_segment().

I will check the TX GSO cost on HW tag-insertion offloads and mention
aggregates from older HSR senders as well as older PRP senders in the
v9 message.

v8 also conflicts with Sebastian's pending "hsr: inline PTP header" v10
in net-next; v9 will describe how the two combine.


-- 
Xin

pw-bot: cr
