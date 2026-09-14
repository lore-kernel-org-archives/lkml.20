Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9830633998
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 02:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789352421; cv=none; b=LRl2n93g2VzA87KlQRKvYB5ym++oDaFCE4vlg2orj1pE3rMywjs0ftYK1ihQM3NGwL/bXJm8cWZo5a7nfq54Tk2D48ThtI75m8cl8Rz7BXNC0W6d32q0+Q9UEB4sMJwuYYq29Ln0ZhlKAR0riw8o/S7jB5XsNxoXGiaPvwSPctg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789352421; c=relaxed/simple;
	bh=ItUAaJ9Wdza/1n9xkRWUnVpV4ybgd/bt14CQdsSCP4o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=El1Hewcq4Fm+cHxpH/L048ljwRgAOX4AEqwTLKi17PGtqv/5piGUvXnf5hD2a4YZz7pyVZS57tbGzTgGu8zWxaVvR7KiDetEcPPJSfvFp3MShfTgl6dOnoqH/NidA+kIcqrdqEM2Us8NUumzIb2SmWD+YEvzi+ix2DbNSQ9p9Pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fR4ywe9v; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fR4ywe9v"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2cfbbdfa60bso28449095ad.3
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 19:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789352420; x=1789957220; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UfLRzFeHvv0Zv9+KpeI9Bfuaw4G1ta+ZF3c/S1UYIso=;
        b=fR4ywe9v9RJefE+ErUkWfj95sPw9OQCOjr2bej5J0TvYTI72F0GbEdP4AAey3sCRlm
         WY/pnZJNZvFqjKGX2rvpq1H2HiJeBLOt6NIOS6Cb6cTKVAF0hQ1XCye1Riv1bwSxatkr
         92R3aSOLMt6d2hQXR4zCM1On4uo97x7h5URPj4tGR3WBaskEmPOdcaVm8WfYdgarbfYT
         UVOHeiIQU9qq5J0jQt1wUIPBjKAwUo6XEhEtN/wbItDdiSY3vwSseEG9TdkVzXEoS5md
         GAfvoFW6Owcg/i4GAMSxdWfe4T4rAWe/EPZViIRP3+ltCBLv+yRhBoE0W4V9357KzhUc
         pwbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789352420; x=1789957220;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UfLRzFeHvv0Zv9+KpeI9Bfuaw4G1ta+ZF3c/S1UYIso=;
        b=fprTcgdEApEkWwqgjdgbTDsHbebCylmxCUuG9WRsICIER0SRSfT/N/fS7hvRjDd2Yr
         AM04izMa3770f14VYt4j/BV0iGyaPsImNxIYImmRu6hl4G01Y9ytLJB1UVHgpbNJGguv
         RI6+biHyDkIIxfpZkqyH9oXc9omjYdwXVeYmp0UFSX1B6oGZtqt9JThh8/mlirNasNwU
         1xrvqCyNdvNcXMfw0b4KtrwBe78trZYwjNtx99gWsI4rB+LPjT0T6+8MzDkSYsycX57c
         foveqq8ewt9uFWq8iqgzHNWWK5GVWrWiaQbZ9nCGbbxJjdTUL6NdnedEmEzfJdwtBV3x
         20Ag==
X-Forwarded-Encrypted: i=1; AKwUvBwPIXoXT2UgEl5facGlok2MHV94DYHq6QVXsFrPjHHz4LCHo1M49mJ9NdQCcdcKdcRua3iiRiTc+TFhnwo=@vger.kernel.org
X-Gm-Message-State: AFuF++nPsA1iJhPscMgXYzfniXEeYKWx49EZWhFxPgU1quVMUwIwlj6r
	GXr8Fr+81P2e1mbePJ0irfU350F1kom01PdrZ7CUpcwH3+buE4YIWaRS
X-Gm-Gg: AYBFou0SUP0+ehR6whzCY6UgWnMdNhzxKqk4XZXorW3t5lBorFU1P4KJsJBO7XIxovZ
	zcQ6OWSBX0kc3GPizpgagZ9W3yrHODpuKiRQXIge5O/ZXaasOhpfZECdEF7T2OcjRn5qjiVVeXI
	ZlQPWmpRrz/O+/MI4yomncwo+ePhYvS8VsUQQGHm5X/rcZVOEk79hNy88e/vJyotQgX1BGI6Enk
	wxUbaOfvGM2oTRsGCPaPwPoJyRTL2xyoiJgUX9+4uWz2wqnkM3hAHwfkz1U4kpUXAR0MVyl5MU2
	hyrGiVoKhU6MNtUY2zcVUQJStOsB8O6fTIogOJiK+MA7UELEYrRQI88CF73cD0qcYmIFfyUXfNN
	l2jyWZV7ZGu6I2zpUqAu6IoFNGFtLKAZaZl92OT/W7lMKsBoG2WcXj/recq4lWTT83v6Px4SRr2
	Pqv9+TdrxXe0j2vwsIPks5tjMa96Btf+uOPgK7SUEq4FKv0P/8FuboMWfI9DeeFRqlvaxzqCHHn
	IiISPIeS0dKyghZ9iNJ4VHSWCZIIuCax3uw99o5CfLCoB/VVtys96stTw==
X-Received: by 2002:a17:90b:17cd:b0:366:10f1:3d91 with SMTP id 98e67ed59e1d1-39debf88a21mr1358455a91.1.1789352419921;
        Sun, 13 Sep 2026 19:20:19 -0700 (PDT)
Received: from ?IPV6:2607:f598:b3da:2e70:b8cf:e0b4:f155:e178? ([2607:f598:b3da:2e70:b8cf:e0b4:f155:e178])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4e9a8a9sm22496831eec.13.2026.09.13.19.20.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Sep 2026 19:20:19 -0700 (PDT)
Message-ID: <99263485-90d4-4321-a434-8c6d1da6b53d@gmail.com>
Date: Sun, 13 Sep 2026 19:20:18 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: bitland-mifs-wmi: Support WUJIE15 PRO HPT
To: Randy Dunlap <rdunlap@infradead.org>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Armin Wolf <W_Armin@gmx.de>, Gladyshev Ilya <foxido@foxido.dev>,
 Mingyou Chen <qby140326@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, platform-driver-x86@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <0da43a8c-1755-49fe-b8e2-403489297f06@gmail.com>
 <38c933e8-b026-42e7-8b68-6b469e39abe9@infradead.org>
Content-Language: en-US
From: Bozhen Peng <bozhenpeng93@gmail.com>
In-Reply-To: <38c933e8-b026-42e7-8b68-6b469e39abe9@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Thanks for catching this. I'll fix the underline in v2！
- Bozhen

On 9/13/2026 7:01 PM, Randy Dunlap wrote:
> Hi,
> 
> On 9/13/26 6:12 PM, Bozhen Peng wrote:
>> diff --git a/Documentation/wmi/devices/bitland-mifs-wmi.rst b/Documentation/wmi/devices/bitland-mifs-wmi.rst
>> index 9e86ecc29..fd966cf18 100644
>> --- a/Documentation/wmi/devices/bitland-mifs-wmi.rst
>> +++ b/Documentation/wmi/devices/bitland-mifs-wmi.rst
>> @@ -7,6 +7,37 @@ Bitland MIFS driver (bitland-mifs-wmi)
>>  Introduction
>>  ============
>>  
>> +MECHREVO WUJIE15 PRO (HPT) firmware variant
>> +-----------------------------------------
> 
> The underline should be at least as long as the heading line.
> 

