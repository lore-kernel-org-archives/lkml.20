Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794874068;
	b=W0tPA1JobZXvarK+WmHp631d4mje7wb8TFC7jajd6p5FSoZVc1pq10vgfXV1QOUCMp8S
	 CFfaJRubFQTPShCCbjWmXUf6fcIygT02Hl1VYRxWcaJyZk/bJaLIjCDzlb4vVGN87Vg4Z
	 voLYW8KctQGgAJw0/Lfma/Tv4C0sRq2fP5ZlOwVOs0ZnkANDFujOO3O723JU5al75jg3I
	 y14rUUCx8VM/T/ug7ev/2etTlwnUiz6JhfPP5zuUUPr9lHQK87ZS8FarjYxu5A4CueH7E
	 Gtpz2glhZg3g/ujmkZZZy9WKYtL+tmQ0Jqf4FmwI1R3wbSGhpR6qYfC5cbxjncIvFsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794874068;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=A+yWjVg/RgP8llwsT9E3rZE971DL0mW9b4bpk6DiidE=;
	b=Zh7bHSHCkFtW2CCP2oLlIaieGTmNgnpQXRdv7u8EMIqtH4IdkFcmpWJu1ORcqaRbzsbx
	 weVpbsHKUnollwTWzNBp8tMi+QhEJffSEbiOMmOkfClOk3X/L/QnEyeqqmydZ4r9wP/Qr
	 eyc1S/5dwEnqwcZ4AhN5XDm+v2+vB0tFokqeutDMG6OJgnLodxaZ7coERjMfohy2+tvcR
	 iTwdHBtKiyhT1hvn/lAn7mK4cgarPphTGebWntXmoKMdsGksD77QLZeyink3Ab9GklW2v
	 GfCiHFwZeghc5MqeaEYfFKZL2/W212oCzAydnxHosbH1ox82MxVJjif5D7yNZh0Auzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L5AeQR09;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E403606A323
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 00:07:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E403606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L5AeQR09
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so42317075e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 16:07:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794874066; x=1795478866; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A+yWjVg/RgP8llwsT9E3rZE971DL0mW9b4bpk6DiidE=;
        b=L5AeQR09zRlNinlR0coJoNG6PEssD7POoJ42cgTVSFxn9Vi/t6WT6kwKcKfeVmKN16
         6ol17jStcLbBpf4sSJzL0nDihWHydZD7q/4IbWDEZKo1N12fY0szn5QkYYQxLUWbaGmE
         iD1VXlDrNNyH3lmKRthWt4F0n/v/jU3eN5bcmKYTNEGla/0+oI+ui95tpmSlOSIoQS88
         TJ2YBZ9vgQyP3b3bkiyZZrZmw65dmmNzqsbgj202oUodkbjPegYYQU8jNwGWaq9M1tpP
         8h7mW1wWiZT1GKDJZBwitNaSgGscNiQCuzRXifgyd+J9NNgRFxJa4n9XWjKKyYeablv9
         fYdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794874066; x=1795478866;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A+yWjVg/RgP8llwsT9E3rZE971DL0mW9b4bpk6DiidE=;
        b=Q+V+/PwqfQTyr6b4XnzaEf1wYOAb4tGGFewFq9dgugJHPSfcKxHvn7bf/QOgdWBoKK
         2BtoKqrMlyTqLM1ARPGJbCTESjrlZLteN+DDBz5QfIcbLjMrmZ9vXCiPO76ETNPvkkAu
         ZMzvaIcKWioXPSMHFjylgT/q7uuwvjGOgAN60jEbftuUOqoR+4HQR4gWTtLp03ZxDyln
         i9AvwFvFYVOVXH6oHKlftz1lb1PQN7GlVXmojRfwi4QIYDa31Orq/wxyXjeRnMH4fiXg
         hiRoisUa/e8+dv4gB2v4pa14dN9eU/RTuOH0XOJglLERM0NmG1uSHR730RAzk4jwH25p
         3iuA==
X-Forwarded-Encrypted: i=1; AL+hErEpcSP5QyQLdU+o/35pNNZRvMEw9pzVUHSJtr9SN41/0abuZPoQPWeezpc+4MFlQk1xseiiyUqNM/H8S1Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z9libCZrk7qpmNhiQBf0y36mql5I7ag1fGTaF9e0FVRriejsOPC
	dPaKY3lAO4pjAXu4s9sXapIycnfyuaXRFLRiMK4yhQ+S/LdvcPMc+ILS
X-Gm-Gg: AYBFou2QaZL/FZ7RvHXey0jjMhVqHWmrt5/T3ZQk8uxOqZucnBr83WeVZiSjNtULRQP
	ftelKL9Cqrxme7Dy1AlUSH8eNQgEU48zI1swcr7VshF0rPHJ49puEcbQcDqI4mQ4rw/0pD6oeSy
	r4HkE1bOpYOm3iI7dHEmzi5BCqUt7PV3LFMrU+4i72telfA+IE0voedw8mbsNlccL0Obal6ifVP
	z3V5nd/S4gmxSCoUi4/iJ4IOJa+qujpLJQcHogYpdewkplc5BgYoLF47sCuRBwAkR6PYaQlBNjo
	2sYkjXKH5BrUwtQ1JYlGwGZFJuX/opVxUkJz/tDu+v3cDV1KB4lvKRp1emRa6swq3WxidS1t7gH
	rIadYh2jU1QLHnPLFszQ3kU3mqN1Y/4s5UknevcpxOKeVXKpei5NmJSSg68/LCKdwjd9BlNgd3E
	4Z+fjNGJKw9YM4cCCpgf+i63/My2AkjC9bgtPYZ/hgDJb9vIsPo9aAl39n2LY6v0NHcJwoGmiNL
	wlEzyKeOfi8OX7ssRyqHx5PrW1AaqkZryRLZE+/t8VullZS9BCaSwog0zH09TQDmly9Q+suMAOR
	WTwNaayZEH2Gz3j0kA0YDUuGw4Hz
X-Received: by 2002:a05:600c:b86:b0:4b5:d95c:2378 with SMTP id 5b1f17b1804b1-4bb55ac4030mr261294925e9.34.1794874066208;
        Mon, 16 Nov 2026 16:07:46 -0800 (PST)
Received: from [10.10.0.26] ([85.105.252.11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7839cad7sm26779855e9.10.2026.11.16.16.07.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 16:07:45 -0800 (PST)
Message-ID: <068991e6-ca31-41b5-b9ed-f0902eae8368@gmail.com>
Date: Tue, 17 Nov 2026 03:07:41 +0300
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
Subject: Re: [PATCH v4 1/2] platform/x86: asus-wmi: add TUF keyboard RGB
 readback support
To: Denis Benato <denis.benato@linux.dev>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Corentin Chary <corentin.chary@gmail.com>, "Luke D. Jones"
 <luke@ljones.dev>, Hans de Goede <hansg@kernel.org>,
 platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-api@vger.kernel.org, Denis Benato <benato.denis96@gmail.com>
References: <20261029-asus-tuf-rgb-v4-v4-0-0d3b877d2c30@gmail.com>
 <20261029-asus-tuf-rgb-v4-v4-1-0d3b877d2c30@gmail.com>
 <cc9c8655-6f7c-05f9-ad09-4ea30f1dda95@linux.intel.com>
 <228df241-da5e-49cb-b29f-6b9158557f55@gmail.com>
 <def9fb29-3212-4d1f-8041-4bbb1c18e89e@linux.dev>
Content-Language: en-US
From: bartu alev <bartualev@gmail.com>
In-Reply-To: <def9fb29-3212-4d1f-8041-4bbb1c18e89e@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/17/26 2:53 AM, Denis Benato wrote:

> Yes, it's absolutely reasonable. If the return either doesn't have the
> presence bit set or is 0xFFF..... it is to be counted as "not implemented".
>
> And also yes, we should respect ABIs whenever possible...
>
> However... now that I think about it asus_wmi_evaluate_method_buf() can
> be used on setters and those don't have the presence bit, do we have that
> covered?
yes that wont break setters:

1. asus_wmi_evaluate_method_buf() is strictly a buffer-getter helper (its
   comment states it returns an error whenever the ACPI output is not a
   buffer).  Integer-returning DEVS setters use
asus_wmi_evaluate_method*() /
   asus_wmi_set_devstate() instead; even today, passing an integer `1`
   from DEVS through _buf() returns 1 as an error.

2. We wouldn't check ASUS_WMI_DSTS_PRESENCE_BIT in _buf() at all.  A
   buffer-returning call (getter or setter) still hits `case
   ACPI_TYPE_BUFFER` and returns 0 unchanged.  Only `case ACPI_TYPE_INTEGER`
   changes to decode via `u32 retval`:
   - 0xfffffffe or (u32)~0 (0xffffffff) -> -ENODEV
   - 0 or any other integer               -> -ENODATA (matching `default:`)

Then only kbd_rgb_read_status() maps -ENODATA -> -ENODEV so FX505DT /
0-returning firmware matches the ABI without altering setter or legacy
buffer semantics.
