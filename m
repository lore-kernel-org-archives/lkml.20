Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792975732;
	b=jh7FfV4jb062nnUJStndhNEzAq7D07fpwrjnfQxKgLAejbDoJRviIrKa4jIGeeSjY0wZ
	 TcgsertCIPZw+OFlxzydfIRFHthjSnN2u0nP3O/6XvldeVoEEvEPR9ZVtdThAnpvNuQze
	 XvtV2CCIe4NPcZLRkmReuqYMgyDUDHwy+osESMWP29HNuhLZghLe0mej5M23kYgDvI7JU
	 re9CaOobDkim3umH897Km27UTN4adXDV/OXabOCOgc39SsU6HeNwfFuKXunCQ3cz69mmR
	 NsuIsKnOtic6o1FZTYolHjWeBaMrMemjKpMjn1BKwq8tm39Tf22g2dh3efuqGBThWog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792975732;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=udVOlod3HEgAxXI2vzlG4B3fPf5JJlSfrQiG5WIkwpk=;
	b=2o7LRUQgUJA/b+kvImmjAzuFapInoQCe0WXTUwKWu5Wnh07zh/9M1xHwzMQQd9wH/9wB
	 vuti/vS/YV4syQe8v0ZUmJ516QtJkRw4iczawHsXSHZ14xr6j++knDdpPpYqctHOGom90
	 Xt6RyZoElBupLqdfHZ8brvuxE0Sv4osL3JUSH3HioPM+CRUT5TvaZJYOLMwNrz2WoTy/a
	 +tjoWXywl6Z8BKubik/2P6i4YhJSn9LTUOWNdH9aa8nK9NVnNYOqDwXXOQHxetLV8d2s3
	 MUNQVnopS5Ijb3ipN/1bldLLZ7nv1ehXJ8PlZsb3zne0Rmk43Kmm/1nhyQVBls6S3mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pobox.com;
	spf=pass smtp.mailfrom=pobox.com;
	dkim=pass header.d=pobox.com header.i=@pobox.com header.a=rsa-sha256 header.s=fm1 header.b=n0IayPEK;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=Exe4oodw;
	arc=none smtp.remote-ip=103.168.172.151
Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B706606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 00:48:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B706606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=pobox.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pobox.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pobox.com header.i=@pobox.com header.a=rsa-sha256 header.s=fm1 header.b=n0IayPEK;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=Exe4oodw
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.phl.internal (Postfix) with ESMTP id DC7B2EC02C2
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 20:48:50 -0400 (EDT)
Received: from phl-frontend-01 ([10.202.2.160])
  by phl-compute-06.internal (MEProxy); Sun, 25 Oct 2026 20:48:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pobox.com; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1792975730;
	 x=1793062130; bh=udVOlod3HEgAxXI2vzlG4B3fPf5JJlSfrQiG5WIkwpk=; b=
	n0IayPEK+VMz2Hjvj8EHJ6u+kXq9iRGPoema7Rm5vA9nu2cG2FRSSq5giCXfSz5N
	8e3Yxfjx3UhZrpvDsF4Amr3w7Guduwe2pTrgR3RKu+TN+XnaegnRkj5IROt6KqFk
	85cESkflFNT/sAc4Z+XubeguorkaVh35clZAtuyGuaN9j/ChmmEPHh0FjgKlX+Zp
	vC0VM2Bc7z/0leVlMfphWOBro2jUviZDICdvFb5AiI9KVM7a2AMGJeOd7Hiq9P9M
	kHLQZjFDsLeYuCUeaDT+4TaIBjwX0NEmYj5P8ab9FCPhmockXU6DUkZsplC/qZJJ
	xFQDJYUnT5BI2cRjfiBdAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1792975730; x=
	1793062130; bh=udVOlod3HEgAxXI2vzlG4B3fPf5JJlSfrQiG5WIkwpk=; b=E
	xe4oodwVG5TmVy6FOnDPljijtHU9zAuYCEEdKzuoPYkmRPv5ap01GxI2MWsqVsar
	abF7IbftbtF9tBW7fvT/IviYPzdV3/c3+j58lRkxNvdXQewd+skKlscHqWH/3r7l
	acO2RnUG+zvw6ytL4nfAb03yulygTRJkuw1iYVHwaWw8sgxGBRACtX0gDWpmW31E
	PPsRZxQoxFhnYP8i9LZIpDxMXG2qIFNi1muEZA0cA2miVgipy1fKgcvYQa5hh5/J
	pVB1hMuuegPzOG9gJLm8qz3ttM9m24dSCKhv0O57fvvXx1dns7zKn0aSv26So5Lb
	EDhj8WCXuHLI81rzPzMRg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=pobox.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792975730; d=pobox.com;
	mf=PGJhcnJ5bkBwb2JveC5jb20+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:jyvbqsCtwdBiChUuB8Hw7P2RbHZBxg/VM0+KYseJ5Dk8OsC
	sFUrDONx2VGIRBfm1jUnLplqzqBLmLkb5WBZhSPH/62xg/3O2HqhKJruY3LPr1g/
	SB4YkC4RhuDVkGDosMwPvPkH60Yde0CWUXn8OH+KmqiYy33bo7cLozm5UO5O7Ey9
	75yGfLoyXNY8/ttWCPCxbS1IaQcfRQyVrQKl9nK/O1MxD+LJDVwFPVWVhKWf+rnT
	Tx06/1a3gEy1Zi6xvu5Tw5wkEeBnaxFiJJa0Qxv1LMQFK9N3SHmIAKGYagyDZ9de
	ikSwzcQMBSuUHMaTHJ/m6ykh+gAYGOhy6bElpgg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=14;
	hn=cc,content-language,content-transfer-encoding,content-type,
	date,feedback-id,from,in-reply-to,message-id,mime-version,
	references,subject,to,user-agent;
Message-Instance: m=1; h=sha256:41MKAXvoTXN8LUdyB3+lq5a1h8G0EFUWaCA2z5YHMU8=:iQvbRSHRPGa7LFbYBx98BtR+DgVbLuGcOSRE1L7ajoo=;
X-ME-Sender: <xms:cqPeagBWlPf7TW46luIeDiZPqPKqa9izLIIuT2UX7JDp4J1j8xf9IQ>
    <xme:cqPeaubsb9PJZeZYlJwhzeQRA2yW_ltG1wtVlTnwvYN1KqwjgZKzLZp7VDXy813iw
    HeYeh-8O5qoIoWc7uEdVbfjMtz0FOUcaLIaV0s0UdF2yxWMAqExf7_i>
X-ME-Received: <xmr:cqPeavFomnZ2E2r5v_mZjbtT-VCaxBZU63RH3YksFBGlfmL7CT_uYhiuEIcQwqI8FgypmPrOK3Jc-ffOOI48TyrYujBUeUQz>
X-ME-Proxy-Cause: dmFkZTE9yGijkaZXXZ0EKKMGDgwIXdQ62+nstrZptYXNRPY+Uae5Lkg73KctWwVNxg6qb7
    Cz+PRXp+MNcKaZwJrvfDB4FJ+I32WWRQ8sPXgUccyqi9W3NXfMu/u4JhEY2fWvjt0VCCtK
    5Paerl6VDtCrDBak9W28q0sM1VjofokTB0BnnotlXPjeMIoyOZ8ENh48USJbK2tC9Jotc3
    XiPwKIM7QwvXXUKxwa461GcBL4eUB8kybJdF+qffY1NzfQLQ5OjULXvUFibfLSHlVIo+WB
    hMO+w3pDBHAhbJ/VuKornkXrxaPOLk2qM+NlSOMlQEedqGef41dWhSWh7FegGe3h5Ynqew
    EsF3geVb7hfaaO7yk74wCeTDVWVeDtaunzR6MSWEDDP6W4976slrPw6c76FUm7ioUxa95f
    iv/lhrVRQ1mH/A8fdL2HHHF7QAFV9JBs0rmlveVKd9iFZIN6gnMRSNhneG5KqlVRwzweAz
    20xH4s9Mz3i70/TNM68F1cNCllT9RBWd5PA0YVgeoSlcOJp3TxId+lGQVs97GlUiBRaozN
    YTbLO/DL+pbAORY5WrUkeAZ2o12GN2LAfRvY75T9kzgt+Q1JeUNPZncKWxg1+HqkTgSvZ/
    6uY4pZJlGzL1qIZDLIkYew3yE4IeEbGbJ/cRKTBN+8UrfglNI96OL7p9IOkw
X-ME-Proxy: <xmx:cqPeaqsepklbwYXqQHjUwC3WZQI0ZTjZHoFPwAkm-k3BJrE43d5R1A>
    <xmx:cqPeatJpWKaNGSxlj5Yq1avGeClyzNfkY1ZQGwWLdY33VQrjItkRxA>
    <xmx:cqPeagNRq6ypNGvNqfBt9QxDQx2mwPXIs1nWRsOsXm_9z263BS20Ww>
    <xmx:cqPeatZRSMIy5snZwa8by0C4ZDXpjk_o_K3LUieTi2133Ygio-3XTw>
    <xmx:cqPeanUCJ8epSBmDd8OJ92kl119oFzwheKlcgGP9O-9NeofV8H9HKGFT>
Feedback-ID: i6289494f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 25 Oct 2026 20:48:48 -0400 (EDT)
Message-ID: <8b3fd4ce-7a1e-46f4-b457-7ff9c09022e0@pobox.com>
Date: Sun, 25 Oct 2026 17:48:46 -0700
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
Subject: Re: [PATCH 7.2 000/231] 7.2.13-rc3 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com
References: <20261025125805.309934791@linuxfoundation.org>
Content-Language: en-US
From: "Barry K. Nathan" <barryn@pobox.com>
In-Reply-To: <20261025125805.309934791@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/25/26 5:58 AM, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 7.2.13 release.
> There are 231 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Tue, 27 Oct 2026 12:57:40 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v7.x/stable-review/patch-7.2.13-rc3.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-7.2.y
> and the diffstat can be found below.
> 
> thanks,
> 
> greg k-h

Tested on my Lenovo ThinkPad T14 Gen 1, my DIY amd64 NAS, and an arm64
virtual machine. This fixes the regression I had with 7.2.13-rc2. Thanks!
I have not observed any other regressions and it's working well.

Tested-by: Barry K. Nathan <barryn@pobox.com>

-- 
-Barry K. Nathan  <barryn@pobox.com>
