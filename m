Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794857458;
	b=0wJvvg5W3p/9GhYsxhftMm0ryxYpkWLg4qADlM6EsHwQRirmtTT3kTpK9BN01EtHjUBt
	 2bgxwPVfbgTyuPJItil28CbAoNBELGJfz5FpkSVL85BPwqqrW83ul9UZvau/XLXzCz2mz
	 t4YkJ7SZUbf16wtFeWG6FfWC48cBAMVfgRUtJ6rfcsRZuVnVul8ukhsLSs+AHcC6PIlbk
	 9qu9Su3fqaLJtqcZ7Wds4a1UwqbqMEjVAdlHDVmDxj74HrsudLqyKRXPkaFRBXaTpixxd
	 W0znLfiJZ61ncHfmXcBtL5xzV+oorTdqXnf1pA6qSVSkfXqRp4CKivA1BAjZMcUr1Nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794857458;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Content-Type:MIME-Version:Content-Transfer-Encoding:From:To:Cc:
	 Subject:In-Reply-To:References:Message-ID;
	bh=lzvwW5tTbxZZA1/V667Y0rWWpCLHqJJkJOsCn97Pqzg=;
	b=Z/0ZwKhkjDkXOq8I12eSjERimjS8JpEn1ZFvtzlSY51nIEtGSFXdAI8hWJqRTPHaP3jk
	 ZWvrhwZKFk5drv2GUr3JCl9Wh5tRqCDiB5GjortbYYFJvAaHpUHrK7NdxVTw9kgPEg7Sm
	 qvkGakdzj4/BOHUmavyb1pgGE28Pl4L26A0xURYsK0xRagoa8u/LTHU2D4NDS3ANxGVrI
	 AbW5ha34gzqUlBguHV3DMj38CdpNNYkbrzUlJdCgaQQaFZfBaVmrxpZf9VjJHyZ5ewN5/
	 efH4kxinuDvhORznZPnTvGGHu8tuBx09Ct6sQE3vfPuckDnTGsWQLu6qgx7SIBNddpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uEy1AElb;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2FDA606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 19:30:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2FDA606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uEy1AElb
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb68c197c7so23384705e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 11:30:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794857456; x=1795462256; darn=vger.kernel.org;
        h=message-id:references:in-reply-to:subject:cc:to:from
         :content-transfer-encoding:mime-version:content-type:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lzvwW5tTbxZZA1/V667Y0rWWpCLHqJJkJOsCn97Pqzg=;
        b=uEy1AElbgSN0iCbkHQHkrKmNsM5r3ifbSQ7MflZws670z1/j3XYQdOz48yxOPyaL4s
         OnMA9u0AM8XheCSCp8GjPpfa5hoNvGLyi7CE+UX9NUMjl6r6ZC5HI+l3oD47WctQ3f1P
         HU/MyiF8UH1zBhaoAkpuLOEPKzEnNw5Tty4ZE7srT+EqGmxJAvHbXGoF7UQ5Qs1ZDP0n
         2MZzc9shFf8oMnwKbQXiwfMTswA7/x+mAcIxIg7bugBCUJkoMA2SWLcfaoKaSg/vuDTu
         nx7esPZ9gdHvzYV0id1z6Ih+czIMOqDs+cNZLXPdITpR4tEbhO10xHpHvCBiQPRAycBM
         PMfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794857456; x=1795462256;
        h=message-id:references:in-reply-to:subject:cc:to:from
         :content-transfer-encoding:mime-version:content-type:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lzvwW5tTbxZZA1/V667Y0rWWpCLHqJJkJOsCn97Pqzg=;
        b=R24pujltwCzPuJk4Ef7W/UJt3BWl0fBwf4/TZQWjrje19DLmAbB/y0/oLPBNMyeSsX
         fwzThdVSV0NVDDGMmAppFugLP7WhVuwD1frypO9mQsonCsMbeOh1L//+Cpfyk1zB4GwQ
         siv06CbUZccBwCoPnEuRlM+DZ19ypRnShvOV5ix7FVRzbhQf+I8xYkwtWau22f9vPsuT
         gXiKuWscAcTdHcHZ4o7qtGW/xi1ytMc43sEV8g2UtUCWjXSNd1bBbu9wHS58CKAHrx3Z
         u5qjT+D0v0iefNirwBnpiBNJDH4nfAEYhF63uUNnuFIwTAxBDq1/zOyfSmXAfhPK2Oe0
         VGkA==
X-Forwarded-Encrypted: i=1; AL+hErH/QVYUNKbpFpqRXg1tuTMwXw8Rj58Z/wzhI7lnDgSMvsbdk24JYCmB5GQu4gK2b7Va31AWjCliJJUgq3Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z8d3G258ojKokGCcYEp9sHFCHdNwe1i6N8P/aZs6X+5HG4rDJcd
	/N6jYhmep4DS2p0cUzsqbvhsoTyfTf5NB1xHG8po7skiS+QWasEWlOIU
X-Gm-Gg: AYBFou0e1UTJrhCQNglKFXqoJamxhyKHmMauyOUPv4A9DUXAdJDfBjn5fQXSj13xz2g
	/bD7p1CvjcXEIX1VwHOx9A/11GNYCRizkd3OHL1+B2nX0p0CRaJbxjqmwcEpJo0SL0nfcMjH+aM
	uuTg/WkWjJwq6jZUmQTjnyI5+TnNPI76/RqgJJhcZmAofcgz3rJqvfaFD2QdmHT3knwJEW4w18V
	wsaXd8yUo9qP95jd/Z6IgpQ3qbZhcXpEwt1pZQTRoXftPspeidUUsSweEv4a8ppNg4I2OAGsc7H
	IKy6fHkhbgbKfe9jDvhi1E3gffDBV6N1QfmPUS5YGHL8ZaLFxU7hySPiAgTw+EXUIhpdLi7iwdl
	jKa/0EGxVXWp7kKPN7t7EionkPuTbdVNgygvZ09KgeDw9R2JkQ4y040nC7xa+kgAqHd+k2/sZON
	c2x7MkPhZq/2k3kj3e1qguvwRPqlqM9n9fUV3P5Ku50zmDSLBbxpMxDj3kKZz8qa//T5I0T6XWC
	VMwBrhcIEj9/lAqwNgICHKWq7BfmbVfs80W+sZpSnaquNE39q+A/TqW
X-Received: by 2002:a05:600c:428c:b0:4a1:9661:14b5 with SMTP id 5b1f17b1804b1-4bb55aabd53mr158518805e9.29.1794857456017;
        Mon, 16 Nov 2026 11:30:56 -0800 (PST)
Received: from [127.0.1.1] ([196.237.227.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783854cesm16318555e9.1.2026.11.16.11.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 11:30:55 -0800 (PST)
Date: Mon, 16 Nov 2026 11:30:55 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: base64
From: Daniel Carter <yass27106@gmail.com>
To: srinivas.kandagatla@oss.qualcomm.com
Cc: broonie@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, yass27106@gmail.com
Subject: Re: [PATCH v3 3/4] ASoC: qcom: lpass macro / soundwire: asynchronous
 probe with clock retry
In-Reply-To: <efa3cc40-15ff-44e2-b783-333306bc4ee4@oss.qualcomm.com>
References: <efa3cc40-15ff-44e2-b783-333306bc4ee4@oss.qualcomm.com>
Message-ID: <312911d6ca094b94b90264688aeb9df7@gmail.com>

SGkgU3JpbmksCgpUaGFua3MgZm9yIHRoZSByZXZpZXcsIGFuZCBmb3IgdGhlIFJldmlld2VkLWJ5
IG9uIHRoZQpjbGtfcHJlcGFyZV9lbmFibGUoKSBmaXggKENjOiBzdGFibGUgd2lsbCBiZSBhZGRl
ZCBpbiB0aGUgcmVwb3N0KS4KClRvIGFuc3dlciB5b3VyIHF1ZXN0aW9uIGFib3V0IHRoZSByZXRy
eSBwYXRjaDogb24gdGhlIEFzdXMgVml2b2Jvb2sgMTYKWDE2MDdRQSAoWDFQNDIxMDApLCB0aGUg
Ym9vdCBzaG93ZWQgdGhlIExQQVNTIG1hY3JvIGFuZCBTb3VuZFdpcmUKZGV2aWNlcyBuZXZlciBj
b21pbmcgdXAsIHdpdGggdmFfbWFjcm8gbG9nZ2luZyAicWNvbSxkbWljLXNhbXBsZS1yYXRlCmR0
IGVudHJ5IG1pc3NpbmciIGFuZCB0aGUgYXVkaW8gREFJcyBzdGF5aW5nIGRlZmVycmVkLiBNeSBk
aWFnbm9zaXMgYXQKdGhlIHRpbWUgd2FzIHRoYXQgdGhlaXIgY2xvY2sgcHJvdmlkZXJzIHJlZ2lz
dGVyZWQgbGF0ZSBhbmQgbmV2ZXIKdHJpZ2dlcmVkIGEgZGVmZXJyZWQtcHJvYmUgcmV0cnksIGhl
bmNlIHRoZSByZXRyeSBhdHRlbXB0LiBUaGF0IHBhdGNoCmlzIG5vdyBkcm9wcGVkOiBmb2xsb3dp
bmcgdGhlIHJldmlldyBpdCBiZWNhbWUgY2xlYXIgdGhlIGRyaXZlciBjb3JlCmRvZXMgcmV0cmln
Z2VyIGRlZmVycmVkLXByb2JlIHJ1bnMgd2hlbiBzdXBwbGllcnMgcmVnaXN0ZXIsIHNvIHRoZQpo
YWNrIHdhcyBhaW1lZCBhdCB0aGUgd3JvbmcgdGhpbmcuIFRoZSBhY3R1YWwgZml4ZXMgd2VyZSBp
biB0aGUgZGV2aWNlCnRyZWUgLSB0aGUgbWlzc2luZyBxY29tLGRtaWMtc2FtcGxlLXJhdGUgYW5k
IHZkZC1taWNiLXN1cHBseQpwcm9wZXJ0aWVzIG9uIHRoZSBWQSBtYWNybywgcGx1cyB0aGUgdW5w
b3B1bGF0ZWQgcG1jODM4MF82IGNsdXN0ZXIKUE1JQyAtIHdoaWNoIHdlbnQgaW50byB0aGUgY3Vy
cmVudCBzZXJpZXMgKHBhdGNoIDIvMykuCgpCZXN0IHJlZ2FyZHMsCkRhbmllbCBDYXJ0ZXIK
