Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793783353;
	b=St8Yzw/VCiBvHpdgUR2V5oMnYUaUiYolnKcvR9JmnjMD/l74nJsYg1tsqcFfVq4/LALS
	 it6HFVpfOD+DKyYgQGC7uWygjdR3roPnSdWWtpMMqgI7xBrPsciPwH3jff44FIQ6Vs6fZ
	 Oyr3bI9oefXjaaq8yeGdPQDmyCObQ/ruafJd1vuOSgut3VsGWehf7nHcHyfOBlVWdF+zf
	 IQ6hh8UM2ox3Ka333zSYVk4/qyLKvUboivALKehK6TXVjHDKjPihWsbTjYITgtwC8FDvE
	 vbjAloe/FAxpmiO5JFvKwhKXrGnhYZiwwCCozqxZOMpT2i/yo4lK7eWdi2pWW8GrCwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793783353;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=6N0dCwGYbaSifjtRcxiUXP9JeEw4YeOJxqoLR+j9Zzs=;
	b=Eg77bZjrPCZQjDyL9z6kxwyKZ5A0oXGW96gI8MqKBHuvNlYPV3IMQgGQ+S333v9yla9T
	 JvzcWcTH2nOMhuStV3zSxL0xFAqMqA36GclOlXiRtTDKu48zVgSt49C+0tNdyjIbdjgA3
	 i6VpbDW68G9CoRPfm0q8KWWJ2mV2t4cz8fu0qmL3nFsChazlsbkTFwpyPwpecLjhEtFrb
	 JMtbLkXm1rdEXFVHYSAIeZE67oCPQnh6xpZH6nDGNWeey1xjz0Yu05yWGUGLffi70II4j
	 YAgSF8pDyksNmtJUKwpkIT9HDjL9XTCjgHdfGxZcpz54853W/SMED8cfG5rYLVuwLdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VFIuY8n+;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F839606A334
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 09:09:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F839606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VFIuY8n+
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c45551fa84eso78386166b.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 01:09:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793783352; x=1794388152; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6N0dCwGYbaSifjtRcxiUXP9JeEw4YeOJxqoLR+j9Zzs=;
        b=VFIuY8n+9o793fjQfjKA7P/9zTDobpgrzq0l8UAw3pBk++/vGCLdxdIMTmaAjyT81U
         //JombrXujrMyVPoqHMHvcB5CsvUrosqajPmPGH8hn+nqyBuYn1UJuSANijZK6xA6iZp
         G4BD730Hd/WYprQMgKqyMl2/TWIEymIEK9drSSwnb8wab9W7IPUb/Sw0udoYAWa56o4z
         uhJdbagPEwieAE3uob/cZp56fQiJ8OnejF3Eh6VqY+KfDH+vrZ3EPxXACr8N2/32L4sq
         AHPa1STKngj6EdVfs8KZtBZ5n527Ss/lDcxnNXxb8T/iri/gC9heJwiNxtK5YZi2X9UZ
         3uag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793783352; x=1794388152;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6N0dCwGYbaSifjtRcxiUXP9JeEw4YeOJxqoLR+j9Zzs=;
        b=Y5eaPNKtHpFTfkA8y4kebl/uA+UTGdEAd5QkwwTUjtb5zD3fu0p0MSjjFofQtJZI9j
         KvGqRAt9Sgx040jHbZUWUQAtoj53eweodKnNGUM/SOhx0gPK4e8wxr3eeIU0baVZLPgO
         KfqmACz2EPFCM0RS3YBTwSOARt3OXsTsAFWyWhfaVLzw8DweNyQMjSMAzqz3b8aehMFa
         xezCt9J+w76RzLPkE3OV+H7bJbEyaiBjgnlTb2WaxfC+XvNMjFqvi2UMarm6LZCG5bv0
         RlzdYB4YFbCO7m0xa7nJa351lBEaSmUHntLxNPF3sTlC2f2ymerzj7HcSXFuLeSPVqfm
         +AlQ==
X-Forwarded-Encrypted: i=1; AKwUvBx71wDUuEoh6Br3yeBBIvb61RQ3iHYLrkjYZx2U9Ko6oSKRH59ZKCC6YDQpNSN9NFG2/pF4wyM+2ak3REU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9E9w20zLmpAVSbOVeK02atMxOUJvnyYDVwyH4raHNm3Zd/CuOk
	eDkiybATIXOs1gYnAxyjrE6cJSAJ+VVFXNSsgzxccilbA7Qu58aHqdJY
X-Gm-Gg: AYBFou3IpP8xbUHeqrWMrriWKTJyECm1FyxvTv/1JUmbyOGWJW2plKaSfreeUyVUTZ9
	8pWEBJAcQJcIEbXvK2/QtsdjjWpI+WXYpQT9SszQG5igCvktTtYxvdHcJ4xbKHzVhFZAKVxqrop
	gyh10gIcNKkB7+SASee2MTt4QHUJoqy6UTDZyvCQPqD1zl+sj5SrZeW+Dvn8iD8cSuPVrikctUk
	CnpmVU+fTI+Jta6JsBrWUKV3SmVuSXB50QTcC9h8Q3AfNbOupFMecLK98QPY/7bcIgqTmAITH/m
	b+CkaO8ujPKOs6UclYENioUHpztpQd1DBotWdMDNKxcOUn+MgtliZAGsejl4IwALw0mfrPWkPXI
	JS0Hd2tyhkkioJtKn1yZVZMmO70Lm6cte88PfFkeOYofCvc3ffGV/sq4qTLA80qtaItfJvR1GkW
	bCakXQxmT8ielzhum5x1KsRoMbEP9qRcJWbu5RPX4OTW+BtAteh99U91yvGr2GNjHsDkxmfd/3Q
	W8r2ktIEo1FgupVaf60ooBeZg/iKzzSzwdA182IhCHgOPKsv35lfzjnqDQE/PSr+jbFdytaVhSH
	LSWpcyXZpGHHQcgkiRx7wBUGu1RoU0VpLYZ4tE09KJk9dvHRcT19eD6XpdN90BP8jib4hye19CZ
	8PXpNjZOq0KAV0Owvl3g70WeC89bv9ipp3EPxOd8T2fi9znU6oaFMjqMl3vpYykAoMruFx07bce
	pARPD4Sdo/aFAYnEWrHN5xxFlrg1x4yvJtbfAmnrDDzYTrqQzhDtsQ+bpVM82LmQMD
X-Received: by 2002:a17:907:6d24:b0:c40:4848:f7fa with SMTP id a640c23a62f3a-c4ca7a9fa2amr1338324266b.44.1793783351592;
        Wed, 04 Nov 2026 01:09:11 -0800 (PST)
Received: from [192.168.100.100] (87-205-15-91.static.ip.netia.com.pl. [87.205.15.91])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d0e41da78sm48735666b.16.2026.11.04.01.09.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 01:09:11 -0800 (PST)
Message-ID: <e669a5be-a96f-4909-b962-5e55f160bd1f@gmail.com>
Date: Wed, 4 Nov 2026 10:09:10 +0100
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
Subject: Re: [PATCH net v2 2/2] net/sched: taprio: do not replay missed
 entries in advance_sched()
To: Vinicius Costa Gomes <vinicius.gomes@intel.com>,
 Jamal Hadi Salim <jhs@mojatatu.com>, Jiri Pirko <jiri@resnulli.us>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>, Vladimir Oltean
 <vladimir.oltean@nxp.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 syzbot+e044a9b6370ed8ca9737@syzkaller.appspotmail.com
References: <20261009123309.284193-1-krystianmkaniewski@gmail.com>
 <20261009123309.284193-3-krystianmkaniewski@gmail.com>
 <87ik36lee9.fsf@intel.com> <ab4a8b2c-0274-4423-8d10-04e7efb6c120@gmail.com>
 <874ieoj990.fsf@intel.com> <ff74c290-3093-49ec-85ce-0e2385419366@gmail.com>
 <87bj85wh0n.fsf@intel.com>
Content-Language: en-US
From: Krystian Kaniewski <krystianmkaniewski@gmail.com>
In-Reply-To: <87bj85wh0n.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/4/26 01:56, Vinicius Costa Gomes wrote:
>>
>> Hi Vinicius,
>>
>> Just a gentle ping on patch 2/2. Did you have a chance to continue the
>> review?
> 
> 
> Sorry for the delay, just another minor/optional nitpick. The series
> look good, run a couple of tests on a VM. For the series:
> 
> Acked-by: Vinicius Costa Gomes <vinicius.gomes@intel.com>
> 
> 
>> -- 
>> Krystian Kaniewski
> 
No worries, thanks for a review. I will still send v3 patch to
cover for everything you've found during the review, hopefully
I can do it either today or tomorrow assuming my local testing
goes fine.

Thanks,
-- 
Krystian Kaniewski
