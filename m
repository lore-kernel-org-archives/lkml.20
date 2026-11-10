Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794318507;
	b=jJj5nrDHhHuaVEyvqPWJw3ibZFQbmZqnE3jcz8rqaC0jYGPRmXWibE/obymEuY0baYZR
	 BCfZAZ08JMEj8TQfca7MAqJMhY/Y77uQEOaFCs2yxv0S4K4+D8xf2buubfabw/+fwaFHE
	 ddQQTbG7NdmDwWS5eCkathEQp9/CthRo9FhebHQESyGiO8NWGrRagxcLsjyu3rUsoNPJQ
	 6SikonoElGs53rGNGpN+Y0TPmy76LYAKIV7cGvejNRllnzCaMzMacNHppDS04SdLDADev
	 r8jOuyLobFOfzabdGUANgtV0g8jSfG94GdfUx2CRF06d0YFOYBo2NN/u3JD2F/ViHOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794318507;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Qa/RCZFR0wligE06OpZS2PXhYivUpmqS4SHJe2hoXp8=;
	b=qptVFeoWR/aUraBuVml1db6Ie/8fTn8h3iwgAQlqcmSwhXkP6l2+w/GcMOWRsMCjt7vO
	 3KC0runx+82yMKubZ21Nrn8iD9j7xL3T/25BSzmDABxZtlYzYoEd2JiwyApEDrjBYq4Fb
	 PqBPRvFZclUIts7hPcDYEG5UFzpW6Xt+IVm0nNgEWPMzUhKXSYtMPW2Mqj+wCvgANZJPi
	 IG2Sy66RN5FmxWAUDf4/HAOLOZeok5mUBdlZltClqwh5/6W2/BLMiTPx1Q+h5sA/fqydN
	 5cQiLyKQe1F2cT7Yfj0vO3JV5GNuOUFzFlSyXKEXM3ETWCBzR0lU7aI/Oww0zLqu4DA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=HB72YQ7b;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0269A60A3802
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:48:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0269A60A3802
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=HB72YQ7b
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-36fc0a3fe93so4018497eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:48:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1794318504; x=1794923304; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qa/RCZFR0wligE06OpZS2PXhYivUpmqS4SHJe2hoXp8=;
        b=HB72YQ7bzSNDKvQpdxAzIXhw765K3FZEu89E/O9EvBAPCZqbw16+8jdeStxCmh5A15
         plkmjPO8EHmTzJvTZ5iu6BYR5NFtuz+PTB7iWBCPUIRLkCgu6DZUC9NPs+2aGFTMkAeF
         cdfF57UkHI3sFT3glI4X4YC+ImrI5h+BfInsK0pf8epb50QuCpEkzvlJabGla57nhEm0
         qtRQeJYwqKPqJFXucU+zDvokJIDv8OtwSOdgHbYYEgnnlt4BzpJeJPiYDWxA8DhLQvZF
         RWc/iO9vAht0cLG9xmCvvnyRMTvvz3L9yaRsIuNigHxgDc+jeJ0hdm5KfBq45theZ3hx
         MS7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794318504; x=1794923304;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qa/RCZFR0wligE06OpZS2PXhYivUpmqS4SHJe2hoXp8=;
        b=yXr4kxAjv5wwLiQtMPpUh1jTuwXa6Mxz6RTPLg0y9+70g6iQ6q/BS+Kaig1wolDTEO
         SCXiZF0WT3k4/qgw4TYa1DD2kNfWkTn31o3kk5IrMQgC6Rb8kOGuAbmrk7q2bUavVftI
         kAb0U2/v7Jf/2mUXVnWvgts2ctu5wJ/8cN7po0+WF/T59/Tf2SQp40Mm0sGMRsQzpJCN
         iGnTDwB/p7R4dnSZiu6LRcLL3rbFxiUOJh0AqwQoL5xL+uz5xGnPV9/HHhdSfxWeCL5G
         tIbwNKVmshkYh09w3DFT1PCVGldU828TULJTOzKd9vDIUa9EQ8Uf/wllMyrZWTnM+yvU
         LVNA==
X-Forwarded-Encrypted: i=1; AL+hErFKs3qw3oepxx/wuXw0xoiT0noY7vfUhD16deT/8wlAfCXE6rSgv6FiwN5/Xa/NBVyqxORR9Qjf3b1ALyE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/zmdXJDbpgqS2D6wYfr9UUThLmUJwM6Nfeq6huq3/cM74hUMG9
	WBu9xEKWsR68E0oA3WJKYqKSdtFEfVm7e3KpX5/WJLIVNSwZNMNjQmVB3ww/BvmeTbQ=
X-Gm-Gg: AYBFou27VqproMy2ZaCSs0ahHD5DQhzTDJtlkIW05DXEPHaZb0sidWtTeTw0qz0mYn/
	YFB315jTgcPj0YDZiWpMmyPeDPNrjzynNNdDgJFNIAvOaYoIPi98VIwCY6vnNfgqYwRG53+zA+5
	PQJlC0eh6oVe4q3ErfOlyz+Lzg/9Nwmx6/4zf6XLzIg85r+jz4vwvbnbD7xFW1EbsHrMQICaInC
	tnJ1RfKz0rus5WZnpn597MBAQQWdi0lhXTf9tm2n1TS/evHgG6mUkuZZWvLWY57FKc9XxPDrfgO
	753EcwYptYou783HKlI+yP5yPIHebbN+d2sf4LUsmS15H9kYaiv5pcqfV7VVH2sU109f7zpofU2
	dD7IXiz+Ggd0kMhMEQU+3YSxUg8HWF/Gr97P9CaXn1hqVPsGc9peOxUufbH2lMeLM2qa2+mVNmn
	d7Zi9OYsKM1jpsunikFOALq4QhsEvmEV/WB2hh4/hpbBwI/GJCrepv2aaFwCx3xmHaVsHAM/onX
	WXw1JjpfgEIzhDJPBwyQwUVRgCweYJZPbd7lw+gGQRfsgqzGKu8cg/TRRVKowNsMBqNCO3a1HOp
	6FgLFG27NPT6CoO/tNkyIzJEYW4JKhHbCBnoV0C8ZSxQj/aPsCf/vc+jBA/uGfTkFAFu13zu1du
	D6KB5ewmfjnGSXQ==
X-Received: by 2002:a05:693c:8350:b0:36c:a1ef:f8f7 with SMTP id 5a478bee46e88-3751c82ffaamr3514528eec.4.1794318503557;
        Tue, 10 Nov 2026 05:48:23 -0800 (PST)
Received: from [192.168.1.106] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375212e7d24sm11503678eec.22.2026.11.10.05.48.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 05:48:22 -0800 (PST)
Message-ID: <a8dea1a6-1f12-4f28-bd41-b751b3a9c7f0@kernel.dk>
Date: Tue, 10 Nov 2026 06:48:21 -0700
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
Subject: Re: [SECURITY] io_uring: ring resize splits mixed-mode large entries
To: n3rd <18670333770@163.com>,
 "io-uring@vger.kernel.org" <io-uring@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: "security@kernel.org" <security@kernel.org>
References: <371cd386.bc0dc.1a1c5844185.Coremail.18670333770@163.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <371cd386.bc0dc.1a1c5844185.Coremail.18670333770@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/10/26 5:52 AM, n3rd wrote:
> 
> Hello,
> 
> I am reporting a security bug in the Linux kernel.

Congratulations on being able to run an LLM, less so on being
able to read and comprehend anything. I'll keep it short as
you've already wasted more of my time than what is warranted:

1) No need to CC security@ if you send it to public lists. That's
in our documentation
2) Send a patch to fix an issue, that's also in our documentation.

and most importantly:

3) This isn't a security issue at all. An application resizing a
ring and getting a CQE or SQE mangled is NOT a security issue. It's
just a bug.

If you want to actually be useful, send a fix. And don't bother
security@ for trivial bugs.

-- 
Jens Axboe

