Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794329364;
	b=2xiEIX9g4dFKcCWxF9yuA6GM9lBdVZZyztcZ+S/yXrMpbHHkovma2ZKvqeyJFcS9N5mX
	 rb0lTkjYowpmSKATMeBMExs9+k0D7jQ0WwJ+Wp/V3a5nGJ1jOZPe0C+a0atEbSevfLrYq
	 LOCEx0Sa6oOfbDSVhB57j5BqQ/Js3Iu1bFbxLzUBrF0LkMmsWJbr1Mqn2l70HJnneKZz7
	 fkC358DxV1beLNybGAeh9Lrm3hzACpgK19mctXl7Pu45GYGs6gvHUwREQrwWPH1EvAJmp
	 2I4B0uZaabBIclFKOb2fpDFesgjykMjlzr/D/M3P//UuJZkg7lovS438v4i0/deNYQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794329364;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Content-Transfer-Encoding:Message-Id:References:To:X-Mailer;
	bh=nPtrbd2Pn3rK1sw5Bc8c1fg7SY1qBfAR8Azz15uZZXI=;
	b=Uj5OcajhQTWa0FSfrrwHH+o96MpGPO4gSXj1KEB3EhmSSc//I+0vtgealONyf4aIIi7w
	 et/LOP9q/CQew1Tq3kJv6J0XRjtx1llbW1EqqJBk/kByHAPMNw818MTGIxZbJXB2vet5R
	 JYyZeXG8AtMwLtL1LqrVzr7RLAV9jJwCv2krCgBG3xZYHxnUg3v+Sg6RXFuzDM8Z6Ps6T
	 hSYH7rxdjgPdKFjDgAqgINKkcbJoR78c810fV3aQBMIA4u/7tf2rfdskhZMkfNxsHAa7c
	 bklmqAJGNEe9zDltCPGPQp6Dya6RI7YhPAiuA/iAeyB4e1MGVd18dfcmPP0HR9DjBYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=POE2dKJi;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72DB606A326
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:49:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C72DB606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=POE2dKJi
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-18818daa3e7so659548c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:49:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794329363; x=1794934163; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nPtrbd2Pn3rK1sw5Bc8c1fg7SY1qBfAR8Azz15uZZXI=;
        b=POE2dKJio14LyaDVkR+BmbhlmJfL3c+ppSMEYXAn68Zh1qMJQkRRgYrFpfcjoPIdxe
         LKNTJZ+qLl5KycuQa/KBAa0V7qCYDceZ72rU4/d7aIOqMEqb76zw8F2kBmFjv/dkSrts
         8KeVMjltoTlxis9vnEKSzF/mz0U2xBpQzv/CUbpoABR8TmmaIhAtN95GBKAYj0bQ5y4K
         WTflcwHcbLFOlptFw+pVwlZcd51SidZ/s0KEYDXY1vnyaH6k3oFribB2jbDeLWBn3Dei
         8tpKh9Mhgze0pDpKuFNQ/iUQl12ffQjfbg9Z47WfuKSCBcxZHxrCfv+ORkavKx8ydT5n
         yrSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794329363; x=1794934163;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nPtrbd2Pn3rK1sw5Bc8c1fg7SY1qBfAR8Azz15uZZXI=;
        b=U8zRVqg+kIE1cYGpwxerb+/qgIBXKLP1gZGd6toou7dNkXPsUDTKa6386ZdOPJBwJ1
         AmjXJPufTVSyos9qBzzuHO3X8KROXCMhJ/AdUu48DMpbeW6EYGdknEzlAdHoqtloIUGR
         HhWnwsNOYqv45VxLEs7xl1sFd2fVgAKaAwecYwBpy4AuLNSKvk0pYTfmTFaPSvfH5t8B
         H3KqDflxAbSbzCFWzDFsaTXbDgKMDsdUmd0hFSnjvmKKZcS3T80gRujXRrjzIdpEQHtC
         V5dbNi8X+67wybUkEjZjRPFFMOKIisiUTtKJMUU05/YUIdbbdAwjCEsSXysa1ghKxcs8
         Bc5g==
X-Forwarded-Encrypted: i=1; AL+hErFLBE1it871Y26CXfMd/YUaDWpEYcSkYy5710LGLTO+58ImDmiQ9azF4DwB5LspeWDAbeAs2SH4vIJqrjs=@vger.kernel.org
X-Gm-Message-State: APuU4Z96hoUJnLD24+n9M2OIXUYxjWJ4+pnVFFsHw68+ew2lI+5h8eiQ
	TwYt5jtNhDVYb/5gjwpbDSkF85Ez+XuQw5/lD4uv+JnWwbmRnnV48j/U
X-Gm-Gg: AYBFou3cb+E2F5BPBkU5giwB9lWHrg8uqt1hVov0dfTQRdq40fFLYaFJwfxonGA2xpt
	Ux4jSSlKR+aQIQs2xK1tMSJh7RgBPVAf6dEc2XHZzZptGt8IJmJ5GJ22ihKiObYnh6IhDoKZg1f
	NX+lpu3BGv/sRPDyd8TYtVjoqajHZOdE0g8QAevIVSqcMup3wb3c2qLWr9OC4V/s2BFV+W7L1TP
	kIHRDL/FITWK7AsyqeFAnpSO6BMMzFcTb8Cq7nVtY/Ozrd1MuyZUFigzTUhcqWWnrLrPTVbcyio
	LGUXm5Ik1TmTuG5uRi7v4rflZEV2oMmg7crhFNqfwGrFPb82l9eplm82fdCr5Vuas1+T3yB5da9
	Mk3Dn+3SzfQx1JIk31yoQxVN/UD1yD1wOYhugScVyyzUFqq2HNwrFyj/wz+TNJ4aOvzXmuzMIWf
	3ARGt0fcuBylry1FCkhjcn7KwhwVJu/m5WRu+a0iHYHW6B81sU+3XcsoiauO/YDXzaoPoC0zf5M
	JlX48myrltOz74XZLfnw1hZLh6hy0quvb1jR44PnZ2TMClJk48mdA9Y86RWiSCNGbfJUYOmQxJO
	cFPVuSWbZxsC5DvS1E1Tn8lKFkXXCgbifM9hty+eD9aWgVH2fYZwDoyVGGf9z9o/O3o=
X-Received: by 2002:a05:7022:1586:b0:14e:d0ba:75af with SMTP id a92af1059eb24-1b3bee94f73mr67874c88.6.1794329362760;
        Tue, 10 Nov 2026 08:49:22 -0800 (PST)
Received: from smtpclient.apple (v133-18-180-162.vir.kagoya.net. [133.18.180.162])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5ba8426sm7208003c88.23.2026.11.10.08.49.18
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 10 Nov 2026 08:49:22 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.12\))
Subject: Re: [PATCH net-next v3 3/4] selftests/net: packetdrill: add TCP black
 hole detection test
From: Esko Mobius <echoowall@gmail.com>
In-Reply-To: <CADVnQykoJWJL+vZ9GC=RqZuiSEypNtmTONBzV7XRQ1jsXy0X_A@mail.gmail.com>
Date: Wed, 11 Nov 2026 00:49:06 +0800
Cc: davem@davemloft.net,
 edumazet@kernel.org,
 pabeni@redhat.com,
 shuah@kernel.org,
 kuniyu@google.com,
 horms@kernel.org,
 kuba@kernel.org,
 netdev@vger.kernel.org,
 panweiping3@gmail.com,
 linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <18B3E417-AC3D-4A70-88BD-4ADA9003ACAF@gmail.com>
References: <20261110-mtu-probing-series-v3-0-dedfab25d641@gmail.com>
 <20261110-mtu-probing-series-v3-3-dedfab25d641@gmail.com>
 <CADVnQykoJWJL+vZ9GC=RqZuiSEypNtmTONBzV7XRQ1jsXy0X_A@mail.gmail.com>
To: Neal Cardwell <ncardwell@google.com>
X-Mailer: Apple Mail (2.3901.100.1.1.12)

> So I'd suggest renaming this case to be something like
> tcp_mtu_probing_blackhole_no_tlp_retries1_is_1.pkt.
>
> Then I'd suggest creating a test like this, but with only the =
following setting:
>
> `./defaults.sh
> sysctl -q net.ipv4.tcp_mtu_probing=3D1`

Thanks, Neal. That makes sense.

I renamed this case and added a test that only sets tcp_mtu_probing=3D1
on top of defaults.sh. With the default settings, the TLP and the first
three RTO retransmissions keep the full size. The fourth RTO falls back
to tcp_base_mss, about 4.8 seconds after the original transmission.

The new test passes in all three IP modes on x86_64 KVM. v4 has both
tests.

Thanks,
Yongjian=
