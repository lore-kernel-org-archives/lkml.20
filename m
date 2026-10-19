Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792437058;
	b=uv25hp52rj5dfphheO8ve9jieTl+BZbzLXhlf1vgz3yWvSJLWEbCZXDdAntg10NI/q3w
	 QgHEFSNVrSWTb5786X7MRNMtVJw4AqLnjkT44ZLxL9GZrENO//wfAXZFvU0yipurRBW1D
	 a/rDzNa2Vy8BjQmGsWgB6PKPJYoRXr/VMq1m+YBdiZzMkHlPGZqvre3fKRauKPSvTfNAF
	 LmfvYqyR/RuT5RhScRwuzv5cvf5yJwQA9ZI+0ESL1wOfOjX2MsH9Cv0FPH0r4lEBzKRmt
	 WXYPQCzkDnX1TPdf00Z5FR9lqnziGlVzQdByczCbhT7IYiFdcey1Ecns1pDWL4aPeaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792437058;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=sJxESkmKTsLQ7pnSvDLN4hJFLb0j+Zil8xbu1xibV5w=;
	b=aQ1gWHecprgYWYvx4COz2V+b3SrsXvre3GxoUxvYwHcvhAv1Q3E6eJwIyj/1Q21fEcQ6
	 9RnnPzGC/T7BNwqmqLwkxEEn+K3z17ojzv3Yvp75TtuqMLtBSBSeKm3C8U7z9ONj0/uwF
	 udTKP8WrPRMAVfbX6N4/B44crbJ3Uz19zz5suhBOZAuuTspM18qOjQGGUmYstR1htaVWz
	 wBNpJQprjV6yXga25lmnWd2ExKONwup9ikU28AVwF7jB3z/AdWd57DJO3A7OrplvXeMY1
	 Siok5fGGWsSFUJyXWSi2LhAS94JoyUbShuDubdSP0mJIqhCXbIIGiyCw8gdzebBI+cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20251104 header.b=ldeLHpfJ;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51A86606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 19:10:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51A86606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20251104 header.b=ldeLHpfJ
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4956869750eso19935735e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 12:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1792437052; x=1793041852; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sJxESkmKTsLQ7pnSvDLN4hJFLb0j+Zil8xbu1xibV5w=;
        b=ldeLHpfJGodTfp+uG8f1t9UORb8i3CxKdHT6ZyCntkGt8eFRPj3qFA0D0Pz1t6xmnO
         Y/Soakl2WPqrReiZjdyGMMg1QCMqolx5JCGujXUf3jZ9CKCxDgrkXmssOhytnsg/bRGn
         CAONf0OoT03gMuGW7eaxVhHm4LEysswugQBfHPCaOke/74njLOjlGt3P6tzdqIGpaHTy
         XTrLjbE1nOH8lBhaiV1qA1jJ/sg90BYby0fAm0szKjyUhUQjgr9SieXt8tfZ09LCxOAu
         yNPWJGXVALRhk/zDDNFrXiocId2pWthkbFV4+9WLcB3qFnSFB7rebw+fLUUnwgSf5DtI
         o5mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792437052; x=1793041852;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sJxESkmKTsLQ7pnSvDLN4hJFLb0j+Zil8xbu1xibV5w=;
        b=R7FWAk1M7/HuQnpTkkOkRE2ua0ZOJO6p8zdQDMN6fn2A+WU23+CmqZPzeXck+aD5gc
         SGs3KU9bovy9vMP9eeabB8TOhWTdP+bRZEn/hTwhojncZf9Tr5tct7tlUry8Tac53m3E
         5vT1/RTpMHLDE11XKUpRFPgYKCUTReRuN/X/MZWK8cV6Ldb1QVtEsxwkxQmaFcFlFhaZ
         4+Wz8ECSdy9W2VrNkv/RgoI9vVqF1dGZYZLXRsYAdWUpA6E8tp7rqIVefiXAlS4VMzCe
         UYLeTZl9RxK35WhHUhN1fBo+14sCSWFF2ubeqlBuE+9ROu+3tL26abyE6cQaYpu+bVjC
         XgFQ==
X-Forwarded-Encrypted: i=1; AKwUvBxVhlg9YYrAztCz6lElfegBFjO2l8EctfBecIeI7OLoA2llDuf8N+E8K0wSlpQ6xeG2XJvvWTOt2wEOUvw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKvBIcfQRBhypuKxhARbPB4Vq/6TIP/XQ4wSfXBJBF0KQX3VEjh
	I8udqIwVMTfuVOmQm/lC7PuUewst+podxFbQAUqeTwK9vKwBeG5KOEU=
X-Gm-Gg: AYBFou3ubcA1r+L3Ksxt/xm2Wfu0737LFhe94D0XhDXe6v/CI/e16p7kSlPvYaeLY4D
	pha7LllAVQAk9p7DWKosGXWCMZEfUhs6eMZprgxGlxZF4ovEpBe3dLNu6t32TUt2CObjtmqa718
	0KpJUfc2Dl+z1F8/xZ64PB7mMapqtTIDVzuFnWj53dCy135LkqpxZwCjVf+wIBiBO5qmuc4aImZ
	nRL2Ccv82Ih8fMJiozYRh1gTGQlbxFDYtfYlhXYx+/ne4oyG/YnO3806cMrMb8a5+XPk8BBW0Et
	nRp21DzpGWw7hqhfCsg7no8b7T2+SP10j03L/DYTgOArt662J7JjNGA4TNAsG5dgG0cU7WGXzRF
	aAEBWKCVgAI8d1gZxH9f2mE4cU8rU/P9wp3x7p4LubWUuaBOfB2IidtlUcXiyvgjPtXlRThGhFz
	/5Gdb7vJ+ox7yaMT6bVXQDVLMpUEBrB8LuC2AKQ4G3c9hccc0T6xFZ0BPrA89HBlKoxuIwBUNVp
	qUD33rFOKC9obSLr2TBo0rn7e35itVCV8hM7ESBQhwPgD9+tg==
X-Received: by 2002:a05:600c:8709:b0:4a1:ac85:9696 with SMTP id 5b1f17b1804b1-4a1d75f926cmr159050985e9.17.1792437051530;
        Mon, 19 Oct 2026 12:10:51 -0700 (PDT)
Received: from [192.168.1.3] (p5b2ac02b.dip0.t-ipconnect.de. [91.42.192.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2ce2b8bsm13688775e9.15.2026.10.19.12.10.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 12:10:51 -0700 (PDT)
Message-ID: <892078c7-7fa1-4e32-a00f-1ac907c0ebcc@googlemail.com>
Date: Mon, 19 Oct 2026 21:10:50 +0200
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH 6.6 0000/1674] 6.6.160-rc1 review
To: Sasha Levin <sashal@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org,
 patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com
References: <20261017160431.119607952@linuxfoundation.org>
 <827e9f8d-5654-4964-a999-5ce94bd98fd4@googlemail.com>
 <7201018c-20e8-4187-832a-aeb0e5db98ca@googlemail.com>
 <rc-reply-0001-6f27dc9abcab@kernel.org>
Content-Language: de-DE
From: Peter Schneider <pschneider1968@googlemail.com>
In-Reply-To: <rc-reply-0001-6f27dc9abcab@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 19.10.2026 um 18:54 schrieb Sasha Levin:
> On Mon, Oct 19, 2026 at 06:02:37AM +0200, Peter Schneider wrote:
>> # first bad commit: [7c1e132b0967210526de05e7af6f1c26ad0c1516] sysfs: Introduce a mechanism to hide static attribute_groups
> 
> Thanks for bisecting this.
> 
>> I think the problem is, that if you take this patch for stable, you need to also take the patch which is upstream [
>> cd69fedf58f8ab1ab511f7c6ac1969cebf1c935f] sysfs: Fix crash on empty group attributes array. It addresses the exact crash
>> that I've run into.
> 
> Rather than adding cd69fedf58f8, I dropped d87c295f599c ("sysfs: Introduce a
> mechanism to hide static attribute_groups") and its dependent c7fbb8218b4a
> ("sysfs: check visibility before changing group attribute ownership") from the
> 6.6 and 6.1 queues.
> 

Yeah, that seems to be the cleaner approach. I just tested this, and this works fine, too.

Will there be an -rc2?

Beste Grüße,
Peter Schneider

-- 
Climb the mountain not to plant your flag, but to embrace the challenge,
enjoy the air and behold the view. Climb it so you can see the world,
not so the world can see you.                    -- David McCullough Jr.

OpenPGP:  0xA3828BD796CCE11A8CADE8866E3A92C92C3FF244
Download: https://www.peters-netzplatz.de/download/pschneider1968_pub.asc
https://keys.mailvelope.com/pks/lookup?op=get&search=pschneider1968@googlemail.com
https://keys.mailvelope.com/pks/lookup?op=get&search=pschneider1968@gmail.com
