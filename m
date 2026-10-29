Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793271837;
	b=Ed2gLhEHTE01GPE2rlK23TBRyW+o/rDULB42pFRujei9toxeQYbqDXPiZ1Y6Qfe4WyLi
	 FlVaR0zJ9fGyZlbcVWy9DGagLOKb1mzYi0dgYwQzU8afmsHafXIt3HO8NOVvBJ0XRE5Ls
	 MQfChmzNnnsFavFkTUTnNNqHRWi+mRu/ddOI9GMympyxPolv0lNVPl6b2cwPpr/OCKSJz
	 Wh8ce2C7f4jgghb3uuanQgAt/xOB69DhaQ9lRUNfRvx35310+EkMiiw9YLmXJqHJT5P1x
	 JgoVnEJKDbDIzj+BS1qnYlPJYsI/QVfmEnfD7IPPi95uFBZTJCyrYiOni2a/ZUMfICQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793271837;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 From:To:Cc:Subject:X-Mailer:References:In-Reply-To;
	bh=muSquEeptmJIsXJiarZANV9wpj/9lTOSCGNsvcEZLTo=;
	b=NAcoVx8Oqdv3f8TOktY56DK1JIeAxVhgLU/7c1jyCdGARZKF2Fu26kQ7a8OR/IUT2NWN
	 q0RP6Fogr4eyAJ26HY4iVedFqR2n3sMxzSnvfOZOIIwo5R8NXeDrQfsXjLStzM1O1PFdk
	 pHwTYzndhhZPeWjlxcamknShPd0Kc2/5tGwQnQkUbCEBwGtbPkQCp6tFjfWTlpinFKuQW
	 zlPQhYGm8HguliIgXOctdYUEPnHTVhFO5CvyiuM/Y6UuVMJSrJaMfOPxn8BHiALVI9Ft0
	 uXMQ/tF29wk5At3pmiK7dqcTqBL+EW1E49RjsBN7hADo2p2lFLPU9XAyiPzj3anpf8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="qvHinnD/";
	arc=none smtp.remote-ip=209.85.222.179
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D69A4606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 11:03:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D69A4606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qvHinnD/
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-93f3c8958d5so213714885a.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 04:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793271836; x=1793876636; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=muSquEeptmJIsXJiarZANV9wpj/9lTOSCGNsvcEZLTo=;
        b=qvHinnD/zBOohgWrBCPjKhxrCzsM5HIs+nI4rv2uerlKKl4bAfAogD0nXVnEzVc6E7
         /QPewiKO5a3PhClnv8wrwJHy4hWNsd1N5JOXDhXrYiqwfGGWk4Eyi2PRTbkOn3EvNE3f
         bzHsuT9CuuNzS/XKGTdWov126Pyo/KycEqR3JkcwfoPBdxwZTjlGWmqDWC0IvPb+STt+
         vGUc2mxpeYiT/o6Tt64YokXfvgkLvmTzniUq9524kWyfOGfzXFS6Jlm7VFsqFI74uP8N
         glpJ7XJu/M2le5uQVgKOhgpK/u3vfnmihOyeM3U3AOTEBBR2+q1/ek6cNwxtoFZVYwLJ
         xtCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793271836; x=1793876636;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=muSquEeptmJIsXJiarZANV9wpj/9lTOSCGNsvcEZLTo=;
        b=hiYlVPdVl6XdtsV2jR2DENL/TgAGSPZqO8zQY3qWnLsTCTgOf5tHCkN7RVrT3buX41
         1ye+HDTMOaI/Z0OB7GwR67AwCiShdFxIpbm/Wh5MtFvogAOWrXCTKlETKqjIBCOKowCC
         AetmIhZr0snb3kJ8PQeoj6bsvrwLm1+XKJ8f8HztkjF36ASRU+mOZpM502wfHFZTLUmE
         Kp9bImCGSGNB5IhiaRlpDZHWZE/jCdUDE8Dfi99bH/VrSWHpzR2Dw+klyxl/yyC0jkVc
         8n8obPyxiuDfVFnRpW4k9d22Np3/aP2Qk8bOtKv9//gt/zqq2hPTGsyFSDfF7c9PEk8w
         RVNQ==
X-Forwarded-Encrypted: i=1; AKwUvBwoD5dr8U+vjXM86qhErwVrQlMkqxlJD/Qdnd18iPolaEAUljACuPQZ16rkU54R669UYYGfK4699vuULIM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJhuWIgzI7PL8bgdb7/8oSjIG7OQd/HFHpXESMwJyR+NCz94jbj
	Vja2amdkHfigviqPLPCawPsRHD7PtOFKTQJB2gwV9C8QeoDqh4LOEuSt
X-Gm-Gg: AYBFou3TutbGQnhvCqRSL8H68cQ5t4o3tAb81lZ1otHkxIFAdx2T2oZeIECf9SIniSw
	i7SJxuZycdM+lF5cJRhPYNGZdcBpuMsIfcegevBEAkpnwxVKNz6LZHwXLpmc44Bl59pwfvzmpsl
	9aN2hdiYuLarzZLVRAJrh4UCLiohLfeRNQV0SKOORl8VCWY5ffhdbuJPQM0C0ha1Pjdis0+EkN1
	DbxJl360Rcd4QGBVXNU0UlWPnSguGnJHAJ0fPVvpkgPQUExizTvVwXWqu4zit5393hqHu7bIqeY
	Dh1Bc4etf4wmVmCtv3dgkc7g+Hign7q7U/dnUnVlMTBSraFoxn0cyuNlZcUZDKoSJKaXtauQAab
	jwxRmPAGUVPsCGMBctgnjZtmh5KI1MlpqMlUpqsYacZ+emCAGa1w4mTr4qTQBEWIW459V6tivzl
	oo9lOEGVtK8OaNE0tWDXxtnTPVH/kU4vbiWjyaEsNXvKPfYNhgPRZCVCZHd349hjSWGs9v4dwSn
	st7OSJSttunyr2aQmM8GYTXoKxUpwht+Lnp0tPzRBSsAKOk+5WjCIDvzP+O58XOxasg4XSpsObv
	V2jpwvXHlNfCk+1SFajEdx8QyF+BmrKh/g==
X-Received: by 2002:a05:620a:3183:b0:93f:2c95:658c with SMTP id af79cd13be357-94408a7fa2amr789388085a.14.1793271835721;
        Thu, 29 Oct 2026 04:03:55 -0700 (PDT)
Received: from localhost ([2600:4040:9399:4000:e553:72e5:7d37:c7ef])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-940f05af648sm1506079685a.1.2026.10.29.04.03.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 04:03:55 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 29 Oct 2026 07:03:54 -0400
Message-Id: <DMH9T7NY96VZ.X2G6APCG51K0@gmail.com>
From: "Daniel Zahka" <daniel.zahka@gmail.com>
To: "Kiran Kella" <kiran.kella@broadcom.com>, "Jakub Kicinski"
 <kuba@kernel.org>
Cc: "Daniel Zahka" <daniel.zahka@gmail.com>, "Willem de Bruijn"
 <willemdebruijn.kernel@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 "Eric Dumazet" <edumazet@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>,
 "Simon Horman" <horms@kernel.org>, "Jonathan Corbet" <corbet@lwn.net>,
 "Shuah Khan" <skhan@linuxfoundation.org>, "Randy Dunlap"
 <rdunlap@infradead.org>, "Donald Hunter" <donald.hunter@gmail.com>, "Andrew
 Lunn" <andrew+netdev@lunn.ch>, "Shuah Khan" <shuah@kernel.org>,
 <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH net-next v2 4/7] psp: add core tracked stat for
 outstanding tx keys
X-Mailer: aerc 0.21.0-threadmapfix
References: <20261009-psp-v2-0-5596ab50f677@gmail.com>
 <20261009-psp-v2-4-5596ab50f677@gmail.com>
 <CAPHeo3erVfzLE0wTmz4=0HKWdOL63+7W2KXO67OuEfRXhf_M8Q@mail.gmail.com>
 <20261028152950.6624ee83@kernel.org>
 <CAPHeo3c0RP34ASvzV3UrwDa4PvXHhuAOq1+-Bn0Z5+QXFV+BpA@mail.gmail.com>
In-Reply-To: <CAPHeo3c0RP34ASvzV3UrwDa4PvXHhuAOq1+-Bn0Z5+QXFV+BpA@mail.gmail.com>

On Thu Oct 29, 2026 at 3:14 AM EDT, Kiran Kella wrote:
> On Thu, Oct 29, 2026 at 3:59=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> =
wrote:
>>
>> On Wed, 28 Oct 2026 17:16:17 +0530 Kiran Kella wrote:
>> > > +      -
>> > > +        name: tx-key-count
>> > > +        type: uint
>> > > +        doc: |
>> > > +          Current number of Tx keys installed on the device.
>> > > +          Only visible if the driver stores keys on device.
>> > > +          Kernel statistic.
>> > >
>> >
>> > Maybe it is good to have a counter that denotes the number of PSP
>> > sessions set up on a device, which is managed in
>> > psp_dev_tx_key_add/psp_dev_tx_key_del operations similar to the
>> > tx-key-count. That way, even in non-SADB drivers the user can know the
>> > scale of the PSP sessions set up on a device at any time.
>>
>> AFAIR the thinking was to also implicitly flag that the device has
>> an SADB here. So this stat should probably be called tx-sadb-key-count.
>> We couldn't think of a reason to count the tx keys when SADB is not
>> present. Rx keys? maybe, because of SPI exhaustion. Tx keys - why..
>
> Tx keys to just provide info to the user about the scale of active PSP
> bidirectional sessions (after the key exchange) for debuggability and
> for any other derived scaling/performance metrics.
> Especially for non-SADB drivers, where there is no device limit on the
> Tx keys that can be created (of course limited by the SPI exhaustion
> on the peer).

The main use case I had in mind was seeing how much of a device's SADB
was in use. If the usage is high, maybe the user will have a policy to
not even try rx-assoc (which always succeeds), just to fail tx-assoc
with -ENOSPC.

Total active PSP connections on a host is something I think users will
want to track. I'm not sure it needs kernel support though.
