Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793292978;
	b=VftylFJRNm+Vj+ivJjoIlFnTKg6OIg2k1TUh7sX5Q+B7qdRMC//f5gAokv2pp46Z+GFM
	 ae9xpJ1/1UE53Tx99snAeJR6B2Sc+oiT1u/xAnDXJRJNAkSazsHlTOmPiBjHadDF35DGm
	 zVNQbu2g5AR1nqB4KVZ2FrzCEWxItK/XejaKN1Ds47BGoi/GSQ420AQV0UH3KhduaETNo
	 xax30zXKzmxn7YwbUow04MYQueKuZVsvSWzDCi6H/hvLENph2xtY2RlJjQUkV83FQqlsY
	 c0jdTTxsGf/XvftFMgHOmpwCSdRac6lv3BtGP7FQXfEAr46P27A4IcEVmjNMkqC7dFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793292978;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=kL5j3EEqbMn3qYBmWtzp3XXkY9AfG36sC38Zmkd8NNA=;
	b=eI1HfX8sX2wf+Iu2rJlRFjZvWSnTOiSxDIek3y1wq5wvSC8QoRNDlbjcCW/16Qjr1yyv
	 6W7vPwVR8mGkXqwbXX3uU+Flw9wlNjgXy+5TAxsZnLuOgfDsnCoTvkD2Q9YLMCaK/goT2
	 iT/1VNiiXK1hEWkPp/U+vx+vKt37VKYFU4iNRvzk7ab4pBzkzv20bXi2mrMc59y0Ka1Ts
	 5kAhd2Yppudez0OqlPo+1Kz6mCeCLhsBPiGkg6/siwfTWWHcYojU5H4hvJsHdDRHRrsKe
	 EjmSUw7LLv5b1uVzE3VNCIrpCRhC1hMk7x5/0UwyBWCKBtU20c3dQ/q4qJIS3I3cSgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=nilk.net;
	spf=none smtp.mailfrom=nilk.net;
	dkim=pass header.d=nilk.net header.i=@nilk.net header.a=rsa-sha256 header.s=nilk header.b=fHewcwhQ;
	arc=none smtp.remote-ip=209.85.167.177
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5D4E606A31F
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 16:56:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5D4E606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nilk.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=nilk.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=nilk.net header.i=@nilk.net header.a=rsa-sha256 header.s=nilk header.b=fHewcwhQ
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-4b28d9537bcso692839b6e.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nilk.net; s=nilk; t=1793292977; x=1793897777; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kL5j3EEqbMn3qYBmWtzp3XXkY9AfG36sC38Zmkd8NNA=;
        b=fHewcwhQIjNO0M14v2tyKKNcwasiZIxpd0YZ6NF/ma/Eh29ffF64GuU5nLtuXnlDQc
         75PDEGdKkSZM+xRlXuJX8lxNAs+aOJUskHSWRdHzJ57hxZ1ksqbdPhqcXIemcRBEnsYD
         CHM+zuGGkz9hoSKp1i6IlU5pLHpT8pIfaPHMk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793292977; x=1793897777;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kL5j3EEqbMn3qYBmWtzp3XXkY9AfG36sC38Zmkd8NNA=;
        b=v5kVIHYVZaSDdfVj6/p8S9Ml6vngs+YB//N2NKU6FDfI44x0TdIXpqpDHNYkAge4nE
         8r11qOGhyfB6cPBMAI2gfoTrZIAwBh4Zz+TToS/3uwSREJQ5oRFJYpuzalFM8aEqusHY
         MxfOJOhds9JG91EucGW59Z7JSxQ3I3W5G/QfgS+ooJqHeUn6sm5xKrbjtssdewvHVGMt
         hTqcZjx8daK3xyzVrxHENXxvY1OA7eiH1VK7O9I4tG/3p5lBNDpwJsT3vmvCIOwtqZTH
         /QbalJWdyCb6sB6a3AWO7GiQ2QtKBR26WHcIc5ZgbBfzpCw9gi0sAdMenF1OV677Q7gB
         GUNw==
X-Forwarded-Encrypted: i=1; AKwUvBxiTlUzjsBcaYNQ001RJwgWUDh+IEBvNWaMGHu5czQvxft8yMDqQUEI6GNELt1SU+rbbRWDxxJKm3ltfUI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLy3QyqPcQCdJuyahoEPibVgcPg7k3XqBvJyTgCRphMFGS48HwA
	+7z5T+/fLwHxGSUvx5SyYBVxntM96H78UViDIpJAry8aTE2jqy4P8cPTS/6aU2/mDA==
X-Gm-Gg: AYBFou3+Asu2tjNB/sc2HxhKpy+PNpIDNUmz05j65EO6P47pNMRpPBLaoLuab8XXoTy
	ClDR4fvjPcomp1fCAXCrL3wDyFRtlXmiTsnki5GRRbm/ViCKHWF0yTtXQA0l70Bj/fDADUjWSu5
	5bJl87MPsGlIb7myrZzGo4v3fh7A8OdGmOrlnAUExkZTcXW+4T+qQEmhvy5Y/gtWaR0VU6ljKSY
	iGW7uXSFA5WyvhhSv+V5gTqpwsLWuOrsszzTHqIiJBRUo4iT60RBopWkwEdg0sB04CcMBDa8bfo
	TmyazZyG1P9i6bC+9lCR5ZYsbDTGdsVUFm2/dsYTxP6DsJkOldSstnHko+nymzkp2EpR0PouNq9
	4qQaypoTFzvKS6L4Fu61DOy9joVYh7M6lfLPAjd9fA74z/DCeOzhkQibQpPydN7fVj3IgqOLTZR
	iF56DpuYe5r9DDn7oB57PbwebU9rInr9ZI2Y4KfVnUsdauuR/XvN9Zyj3DqGvljj+oCcgck54Ex
	rfzUfe98Cl/FEFKubsNjwE/KeQcXXnEWZtKuuRxDObOjdpUWBXLAMSK+Hrzc3MtthjBbmkW803F
	f4VHqT3yvfOOAyFTC6mD/hFFyY8f12OGQQ0wphD5Ui1RRX2EHopqWyP4eAm/c65X+xL43QlqhBU
	xtzXelykbu5wNsKlWK203Mae+ooxTqCXtcaZ3q4EWQSdPEZMu4zIZOWXtGgGq7UvkMJzCdELWLS
	tsTqhoEMR+xdIAjGYXEAdU2St+FdMU112Yj35b9gEYChebDl+n3uE+A9cW5s2BX9JRZAjgppuQn
	oPidtRa
X-Received: by 2002:a05:6808:1b2b:b0:4b8:46e3:e224 with SMTP id 5614622812f47-563ef728ba8mr1823577b6e.16.1793292976579;
        Thu, 29 Oct 2026 09:56:16 -0700 (PDT)
Received: from [192.168.0.114] ([187.14.252.62])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-563c634709asm4289499b6e.12.2026.10.29.09.56.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 09:56:15 -0700 (PDT)
Message-ID: <1dd56310-9286-4321-ad1b-e4643aeaf60e@nilk.net>
Date: Thu, 29 Oct 2026 10:56:13 -0600
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
Subject: Re: [PATCH v2 1/3] media: i2c: ov5693: Program the mode registers on
 stream start
To: Marco Ziliani <rylos78@gmail.com>,
 Daniel Scally <dan.scally@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, Tony Garcia <tony@loafecho.com>,
 Simon Kruse <simon0x+git@proton.me>, "D. Manresa" <dmanresa@gmail.com>,
 linux-kernel@vger.kernel.org
References: <20261029-ov5693-fixes-v2-0-2526d7b13030@gmail.com>
 <20261029-ov5693-fixes-v2-1-2526d7b13030@gmail.com>
Content-Language: en-US
From: Chris Simpson <chris@nilk.net>
In-Reply-To: <20261029-ov5693-fixes-v2-1-2526d7b13030@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Tested on a Surface Pro 9 (Intel Alder Lake-U, i7-1255U; IPU6, front
OV5693) in a 7.3-based kernel, with the v2 series applied to an
ov5693.c that matches the base-commit (d7e7bca71698) apart from the
pad ops' client_info argument, against the same file unpatched, using
raw captures from the ISYS video node:

- With the sensor held powered between streams, OUTPUT_SIZE (read
  over I2C during and after each stream) matched the requested size
  in 32 of 32 streams requesting 2592x1944 or 1296x972, and every
  stream delivered image data. Unpatched, it stayed at 2592x1944 in
  all 32 and the 1296x972 streams gave no frames.
- With each stream started from runtime suspend, the path v2
  changed, OUTPUT_SIZE matched the requested size in 12 of 12
  streams (as it did unpatched), all with complete image data.

The test scripts, the analysis of their output and this summary were
prepared with an AI coding assistant (Claude); I ran the tests on my
Surface Pro 9.

Tested-by: Chris Simpson <chris@nilk.net>
