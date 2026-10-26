Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793009133;
	b=CghvJhpb3rKsB89cTeNPDoaq2yXtWD0Ont2WQxdhK/i4xiTF4GGze2MPL71VpfQUcNxh
	 TOypy0uvqnaI733OBmRE3msDMzXKDFZVza27PJyQCoQjKB0LtP0zm2pu2ZG18CZUpF2sC
	 XRnS/RGDBjR4EzjpTW662GUbVCnAJbQ7cf3+rRHX69NPTCUq0uvo54fYSeuRVLAkVSYDY
	 3QrlEKVFz3E23IYsET3aU/dNMLMIE4MjOJvi4DnUrtt2j2tanDL1zsQElbFUehmhcPOU2
	 Y1qWRtukEBGhRDnXWN9TS447JAMU01t9WX9F1jdMDRBz5qP95SYt+PIB55b8XvUkIhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793009133;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=T+aX9Q4ROQnpcVK7Jjk1SxNchobadyriKnLi3sg6Z+c=;
	b=SWFR5P2uhUg/zpbhtT7XvypB0SKQAC2tqiJ8yyfX5Z0S6+j8sXlEYZ5GSF6Rklss18rw
	 jYbtjBXzEAumBnQoseWAwzClrE7IfcgkvbH8dQ0sT9SWq6dG4B1a08sXqKtnIvVENGE/+
	 eIjKBdF/S6NFF7/PBarQwR7zbpkLlrwq9+OqtiJdRdasXgUYP1yU0WWq/nZI0toKriTHx
	 emuLCBfbtqtmLEx1k6u3Shokr2q1cfxJK9SZHRE5pscIDUotSrEMqWeyO/oI29YN6SET5
	 5+jWH+yYOYnLwulaX6tmbNwFi1XqSooe9uP14rs0cUVUdSqDy+dqj4FPAGHt0URTNeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hkepGJ+9;
	arc=none smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A476060A2600
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:05:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A476060A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hkepGJ+9
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cd8ba7c2694so780650a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793009132; x=1793613932; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T+aX9Q4ROQnpcVK7Jjk1SxNchobadyriKnLi3sg6Z+c=;
        b=hkepGJ+9KZADoCTSL0KhXQsjDFns/ciXEafHmmJCT571jx+wlW2ACZbarIJnUpNGVY
         wM97afGqXfQSaYAN5Gk7WkcFV+pHCmvI6vPgmzelyRx6YWAdbZYtTVi0Y45w8sal6+kk
         OeSdFWGkZv7CnHuY+k84ayZODVjqi/4k+uDAVYOtBK4jWckfaHg/MgYFNtuQoddz444V
         pPUlUn4kK2ghGGIbUiBofU+l7y2rMz0e0ZCfoNf3ZMSg0dSSsw0yHwgYoq2JgQ9xSEMz
         yhTNrv1j9bdfPFKDXHch5zLBOc5LBcT9khgva1X7pi4SLxhZ4l+jij/Lj5IbvyybNsKR
         tG5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793009132; x=1793613932;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T+aX9Q4ROQnpcVK7Jjk1SxNchobadyriKnLi3sg6Z+c=;
        b=aCRU3d+deL4m2o6csZyk3QZLtFLvxf5fqeHWLoJcF1Q+IiGTVCAkBVRVP9bTaoE/il
         lBQ84Hqq+7r5gMDQ8g9dgLDGpy+XvroxXWMHKtBbDJnLOtyYaeZLXN6wvyK+Ht33U1E5
         GXxRLAgovuIj13HnCDttIBLNXUBuyOR3i70TXAp09S8dIssEAe6+bk4lui1bTDtAI1t2
         dgMyHCg2T4sIPVqTkXMgjm21zkv+kn+cdiOV7MqZWXN6ALSJ1i3qKG9gybFlc2LViieN
         57gk/tEPLh/yXayCWCfG17elpZAXCdh/VjOyIcElPJi7JFM06SwpMdyPp+dAt2VwBqJI
         uqnA==
X-Forwarded-Encrypted: i=1; AKwUvBykpJww+ZsuVRMfiwcLV8nePv22kUCIatSwjuqbfzEAOcZNwbMB0zU1y9JqDIEe8D2arvG6Z8VCMG/qDd4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKtjytf7yWf82wuPyi3f38SlEo+W5sRoFmr/WtdLGx7sfHycb9V
	JB1uSe/XHSYFYo1+OhfeVy3uCUXmHl6DEaz9c4QKvKDpoptYE5q/cb3K
X-Gm-Gg: AYBFou0+Ub6M3SS/9U6sPXmzfsLjIg0hSp1Kw2jGzi4jf3ScFx+PTVe9h0B1VlckiBl
	QZK+7TZTLzcEIyzsoOq7ogQC0j60waGftK+mrH+OyBPKpiY+RIsSqcj49v8NKPB5xtOedFfVEsW
	1uFAtjzKpRuqCQqzUMksW1SxZ0lc4ZVuANb9O6XMBsumgCNFNYqK4ePZisOA1jEgy6hLp0eh6lL
	K4zSyI97h6GjHJJMUZIiXsi9bK4J4L+FtptSJ9Xp/hyMOBDTnzetlcLC1wmSnFz0lQEw4mU5Wmg
	lCq2sqwsQ7Hf8MCtvfQH1c/PE3w2EcueWZz2rhaiu4blJYB9Md1w5Zgm0hPpUAm4B1W+IDo+pYj
	gRRyvuspNkl7ES8ujyCkxZUaGn0uIWEnxi2zMSM7cYqJHvvzUaSN5pTBYViOGXx1vrsBSrm134U
	49Mj8VaWpnAIFc+4VPNZHVtfjyKqQlmD0HFIPxnMxK799Rt3yB+FRetC2VQ7RV/G1I7X1lFzzwi
	+klAlHp2MUJpX9W3DT6g736I9XJ3Q5VUFlczluHw7VgdtkLTD7eyakTMgzan2CCT/HTkKiaFYm/
X-Received: by 2002:a05:6a20:c85a:b0:3d3:adbf:777c with SMTP id adf61e73a8af0-3e7bfa64f75mr3257808637.24.1793009131937;
        Mon, 26 Oct 2026 03:05:31 -0700 (PDT)
Received: from ?IPV6:2408:8210:2436:950:3934:2b73:344c:e6fc? ([2a13:edc0:18:16f::a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a36c0fdfefsm1078943b3a.50.2026.10.26.03.05.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 03:05:31 -0700 (PDT)
Message-ID: <84658f6a-4eb2-4deb-a174-842a2cd187bf@gmail.com>
Date: Mon, 26 Oct 2026 18:05:26 +0800
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
Subject: Re: [PATCH v2 2/2] platform/x86: bitland-mifs-wmi: Don't fail suspend
 or resume on profile errors
To: Chris Taraszka <chris@miget.com>
Cc: Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 Ilya Gladyshev <ilya.gladyshev@linux.dev>, Armin Wolf <W_Armin@gmx.de>,
 KentoNion <kento@kekto.ru>, Matias Civadda <matias.civadda2342001@gmail.com>
References: <20261025195456.43414-1-chris@miget.com>
 <20261025195456.43414-3-chris@miget.com>
 <5360953a-ed8a-450b-93c2-f55876af8600@gmail.com>
 <CAAcRvKM2CQeJLWDnUhQJ+pKxiduY3XakeBbJCTbnY8=beE5MLw@mail.gmail.com>
Content-Language: en-US
From: Mingyou Chen <qby140326@gmail.com>
In-Reply-To: <CAAcRvKM2CQeJLWDnUhQJ+pKxiduY3XakeBbJCTbnY8=beE5MLw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/26/26 17:48, Chris Taraszka wrote:
> On Mon, 26 Oct 2026, Mingyou Chen wrote:
>> What value does the firmware respond?
>>
>> This patch fixes the suspend problem, but it hides the real driver
>> problem (unsupported profile entry).
>>
>> I saw 0x04 in your patch "platform/x86: bitland-mifs-wmi: Add Xiaomi
>> Book Pro 14 quirk".
>>
>> If result.data[0] in laptop_profile_get actually equals 0x04, the
>> function should be succeed, but it doesn't.
> Hi Mingyou,
>
> It does succeed with patch 1. The firmware returns 0x04 (I also read it

Apologies, I misunderstood; I assume the "patch 1" you referred to is 
the one that adds the MAINTAINERS entries

of my v13.

> back from EC 0x68), and with the TM2424 entry laptop_profile_get() maps
> it to performance. Since then the machine has suspended and resumed
> several times without the warning.
>
> The test in the notes was run without patch 1 on purpose, on the v13
> default table, where 0x04 is not listed. That is the state of every
> Bitland machine that has no entry yet: the TM2424 before patch 1, the
> TM2107 before Matias' patch, and whatever model comes next. On those,
> the aborted suspend is what users hit first. Before I knew the mode
> values, logind retried the suspend every 15 seconds with the lid
> closed, and the laptop drained about 40 Wh in one night.

This is a good point, so

Reviewed-by: Mingyou Chen <qby140326@gmail.com>
>> Is there another no_set (for read only) profile entry for the
>> performance profile?
> No. GET only ever returned 0x02, 0x03, 0x04, 0x09 and 0x0a here, and
> all five are in the table.
>
> So patch 2 does not hide a problem on this machine. On a machine
> without an entry it keeps suspend working, and the "Failed to save
> platform profile" warning still shows that the table needs an entry.
>
> Thanks for the review of patch 1.
>
> Chris
