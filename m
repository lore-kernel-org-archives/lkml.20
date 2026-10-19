Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792434301;
	b=XNtkd1AzxEyMo/wOnY3WAAK3MeYiE3rymaNmwAm9xNCbImrH1yWJelmfNjln2gU4iCYa
	 cL+l3CjLs/pBc6sw9C0k8KG+wxpd34varfChaz82WhP7QUOC28cyf3VZfJ3FP3Aj4dOFI
	 cumFHQIhL26uq79mZygaswZ2sBKBsmp0uRLyOT06WFqL5OElsa6bQ/tQzihPhPPa/xPLK
	 7kYDQTryKtXhzDbjAx8Ulvxfe9HN4ogm0W5Hdg0Cu6cyv4D0UqaXO1Gazr4o/+kDRYCKi
	 lwyXJ11TjJZT/l7PRUUMOOOcw3qAt09UqBcWVaxUlOVs8GRSUJSwCXDX0hXWcIPfWIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792434301;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=jtPccQqJ2uVD863ndD5Pql7lUKykf7N9xt+2EMl4boQ=;
	b=1L7RlkmnlKk1Qn1BdRQFLDRx8n1B3U3d58AIub5/fHbVU7jPjTC47eVoXobzItj0D/ET
	 qu1LKXkS1DEU/eCj0BPaVl6hPuGNdYqth2WogZFNjKtABcRdq4hrK1yWPgm6sdQHudOSW
	 0dMPNDuqJ3JmqABFDmrvjLfVB6DneV52lmH78U+He5s3snzBMlgPLeOn7vMG2Bb+ukyt8
	 RQSEmG+0RLCFnQCfh+1tqKvvUfRiZzzzv1tUY2d7kKKVJdy4ay0nXL9biGc35c9pCcs2h
	 OmTgsjCCM4Q0uj26FRHseYFSWS0VjYJxgJ209tBYJ/crc1/z+HdEYnIJtu4nTk/HHXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=okonski.org;
	spf=none smtp.mailfrom=okonski.org;
	dkim=pass header.d=okonski-org.20251104.gappssmtp.com header.i=@okonski-org.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=X4UC2tzT;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22D4D606A319
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 18:25:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22D4D606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=okonski.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=okonski.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=okonski-org.20251104.gappssmtp.com header.i=@okonski-org.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=X4UC2tzT
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c247f6687dcso181435966b.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 11:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=okonski-org.20251104.gappssmtp.com; s=20251104; t=1792434299; x=1793039099; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jtPccQqJ2uVD863ndD5Pql7lUKykf7N9xt+2EMl4boQ=;
        b=X4UC2tzTUDZMrZcRbRquqMSyNAEOAKxUZtciQ+klss0scatPZpmv25j24B9UxdZEd/
         xE62JUeiUGNFiVcWffAloXMa0JMZr+o8SsYSLbmCAVGPl8DFTqvqeUbompo6CKj2nMEd
         oVgiaPNxN27Sjag2nS8ZbA8JGhC+/GdREmTUpnpubIMCtnx7EiDY0aeTRjl0mc1Gyc0d
         GfpPgSxGEPBQatqNabT0jsPj7Myzvg1n7aECT4hFEmF1PHdrj1jxPY0i/HsngGe1exd3
         8NemxlzCAzGve5Olrt3xFbOQtq9/jyuRFJUcKqGvCRtwq6juCC1lfQ5/Ea78iNT+4cSj
         48/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792434299; x=1793039099;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jtPccQqJ2uVD863ndD5Pql7lUKykf7N9xt+2EMl4boQ=;
        b=AL/r/G+OMgP/l9q/16xGtLTgpnz7VmeMMemcX2MDHx4+CT9V4p+Hm/vaz6orVYYsPC
         Q4oV1+we5yLGu9uiVK8Hi8H453TxQkBxt7PRDme2z3xeS3ybovxnCqaaUnE9j9Mw3Sp1
         DD35Ssy4Y/lIJUKTdBa8jFs7bwZRLYy2DTGvCJ1AT9pOzDFhoWQHu/ALa8DKADoXI7G5
         HdHmJR5gAQtE6mP2YMp7dChTzzft+zBTavgkWnjV++9KVQRW8Ox1YxHbibTtnVJcYuke
         jjjCU5YknHdZDKXarPVcx0ID8NWl2VILuDYWK32F6Jicf54vYfDy4pBO2y6cIFA9+0aG
         R+XA==
X-Forwarded-Encrypted: i=1; AKwUvBzk9lZxjofrT0FDcr9DjDsqMdOGzbwuljjtWssZPWg/23Ce2pV/P2Oqq7JSXGazuKk9r0Nk4o/0Ob+bHKU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLS9jflca3lPbMkuNeYOgS6w+938k1AmSFkGUCVt53YB1xNQEhU
	paajTBOqxyDQph9B/dCr2nWEYEf5+l+DK0TOLr5krLiofinczSoH5zzfe/qDgfpHrHI=
X-Gm-Gg: AYBFou19U5V9O0yPPKIe+ShUJpBs5wTrFI3ktnXNtxs1DCLATaS6R3w625aTrIzDRAy
	9FXLRy3ZN0oGBvRJMAovriyefpjWIfZiU8MVpC/+/4mM+aQr8JZSDvcHtwMU9+FPCNQ1ml0p5nw
	PyC/vxAaOAhvmwDNV+9PVQzR5VO61oYjDF1Foisc0o9FNpoKKL2Bpw3T3w4WEbA/kTR86qiuddH
	H+vuQcgTNcF/5yHOzajK0mD6LiKFql/Qft+E4ucbarveK4iYEjX1cj1xa2kUlkKvCu4k+DtkMzy
	IKNiiGdayMB8qOsR4+s2RAGDrbWWo0m9jPbErnZvajoACBW+NpSLRS51kHwCUkzl3s97BoN4Wxj
	eKel2DbQCVzE6wVhDGYZOEw5O37QR7pX+RnSpjEK+yceQJiR3DDMMX8JvzhfdlS7fiIbMY2oz5y
	+Pqwx2s2XQk3oqbzLEOFm6tDhFWKDbSZErsvNMoR9yTRKZuIInT5oELV1JSBOWeQcImCcduVfGp
	MYORQ6NTgw3N0Hi8+byFNTOTlE0g3gnUP1EiTrPmTXmbEo8aNmEyq0qU630zGyjd87wmbIHEq7g
	Tbay7Mv4B47HOXq8fkq4SIAFV7TxcPopZ2r4KUrcQHY=
X-Received: by 2002:a17:907:b046:20b0:c42:102f:15d7 with SMTP id a640c23a62f3a-c42102f36d2mr336567366b.10.1792434299287;
        Mon, 19 Oct 2026 11:24:59 -0700 (PDT)
Received: from ?IPV6:2a02:21a0:10:748:1::2? ([2a02:21a0:10:748:1::2])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40919bc147sm388919966b.50.2026.10.19.11.24.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 11:24:58 -0700 (PDT)
Message-ID: <01e25832-955c-4f39-a902-6cc253a2791c@okonski.org>
Date: Mon, 19 Oct 2026 20:24:57 +0200
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
Subject: Re: [PATCH v3 7/7] sched/eevdf: Move to a single runqueue
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: Mike Galbraith <efault@gmx.de>, Peter Zijlstra <peterz@infradead.org>,
 mingo@kernel.org, longman@redhat.com, chenridong@huaweicloud.com,
 juri.lelli@redhat.com, dietmar.eggemann@arm.com, rostedt@goodmis.org,
 bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, tj@kernel.org,
 hannes@cmpxchg.org, mkoutny@suse.com, cgroups@vger.kernel.org,
 linux-kernel@vger.kernel.org, jstultz@google.com, kprateek.nayak@amd.com,
 qyousef@layalina.io
References: <20260605105513.354837583@infradead.org>
 <20260605124052.227463677@infradead.org>
 <58dc8e8a-7260-43ce-aebb-8d9c29a6afc9@okonski.org>
 <b1002150c3e4f877d04790cd8e85d2149d17722f.camel@gmx.de>
 <atZM6uF0CqCNh__I@vingu-cube>
 <f1d0fc39-6939-4fb3-a422-273cd5c347c4@okonski.org>
 <CAKfTPtB_gMM7axqM167_Tb=WiChskGPXFDgQ4YjVz4Bj+ZiJ0g@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Jakub_Oko=C5=84ski?= <jakub@okonski.org>
In-Reply-To: <CAKfTPtB_gMM7axqM167_Tb=WiChskGPXFDgQ4YjVz4Bj+ZiJ0g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/19/26 20:04, Vincent Guittot wrote:
> On Mon, 19 Oct 2026 at 19:36, Jakub Okoński <jakub@okonski.org> wrote:
>>
>> top of 7.3.0, it still regresses from 7.2.9 if you test with a nice 19
>> spinner in the same cgroup. I think it's incomplete.
> 
> This patch only aims to fix the sched_idle task group case. I will
> have a closer look at the nice 19 case. Have you checked the different
> cgroup_mode with nice 19 ?
> 
> Vincent

Same result in my nice 19 test for all of up/smp/concur/max/tasks.
