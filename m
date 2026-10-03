Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF8C33ADAC
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 08:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791015068; cv=none; b=secKMQt1wcQ1ONAaw34MzJ/CY6YQedAdCxWuVw/nqQt07xHGnQbjPZDybhxoGj6GLo05E9PjCVs92Xcjq34ma5AWWIAWHoteSb7VX3jPY37eahltafUV5AayHEJECUs2Qk++TUfPJ2Ukovug/30XbGNgpn87zJ3eLNBfFpM9egQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791015068; c=relaxed/simple;
	bh=wtwQ6JzEMapAlW6zEvQWmul06EKyW5l8OOrIKIXFqHg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D7bP4w8wtz0W7xvwvacTQFQllqvggrkbVXr8GUOWBiJtWB78v1s1FGg4Gc61ZnItv6ghsN5shh66Tt+ZDziBfH4A7VgECVE2JOPIHoIhmeht3+pS5wvuKzC61beyFY4gW1z0kUZst+/MHwfGq3zIPEi2qfReNHWmc6EU+xQl3Dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912d8239so4083285e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 01:11:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791015065; x=1791619865;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8UOj4UBtpSDtB1u/mynjbblWtbQNRWQi1yFF6YRu1C8=;
        b=EiX5il+tQZtFJAGCxIk62l+o/HpY1msKwTUrjXxGSDJsu8eL9wLjIeO9kKoxWBmlG9
         dp5Rgu1RL79TbmZw44o0kDbzHbMELwuQfwlPpcRTAO1+oh2azDIhzbxLF/O4KXfkQgtu
         qDPAkt/bsnKVcyVUhHgYM/xWi9qNuzgxlj2yY3TUM/AzMH1aTIY5FhJ6YJm4F0jgwBjX
         jg8rDOuTPVMkbN7jlrppsczSAEL3EzkYtylIdyYySi4MjWckFUj7IOXI8zYmKm77WaDf
         5n4ZP2V1Wudr5AXryzVykvpdm6AO1263Xsuxmb8X4YjjhtpylxQCorcmhr9XLehPPfua
         ZjMw==
X-Forwarded-Encrypted: i=1; AKwUvBzaTDLopFQ4M35MU/HDfXrScSRJVoyaNTUidtG5hHt0l63r3xBJ+W9yYbz6GrBGiLJPpZIeH8a8MKsErC0=@vger.kernel.org
X-Gm-Message-State: AFuF++mYBE0ukIln3voqIKCWIW7tliGhF/VLmfEDv8nsjbnjEUIRCQ7S
	sLOZ8mzB7Rg1MG2V/xthSYTzF/stE+Pwceg8E/hmGEUAOCt21DP/no8z
X-Gm-Gg: AYBFou1Z1xRVmEGftKvgkMEpvm/8gXWuARxF1QHsYS0pfFIL90/rIOhzJX/h+XgDXkd
	IIwrxx8GFjFtIDbLeIF0JJka4PEj5s1CXSZc3T+cNZjmWD932irvnMv+Hw2eX8zzsZKhsTTwpN3
	Yz8utjjndOSAD/sOGM8qeFuF/u+qbUe3tXwr9iMOBmK3zoo77BH3KgC4izZcmIzI5XzDKg4uc4d
	6z9ZZpQdL1wUOr3dFHlSdq9OjymiOo5VWYopJ0vDQlOFZgr7gX0wdapWobn7hG7zbcxQOOXc94b
	oLCByqDZdCTwwzxhmGqFm7XmfttVtejDPOZWvHeHZPbADdzrAq+pWZJoKuqdYC3Bjkr5dkTa+qU
	rskLq9wv1CqKpfuzDA8gnK/RmtyKGmzIsYezv3BypgjIZUdzEEO8hCInZcLR1kLvQ1B2x6mZE8y
	oJ1VVVb6C3dubHdKerM1pmiL2epuHrPdF5TlIrT1Sn6FdEWyDJYVmWHhx3aFB47NNRQ0fFbstj2
	fUU0SJXsm4V+D08mrh+BUK9n31R
X-Received: by 2002:a05:600c:a011:b0:49d:4ef:bf70 with SMTP id 5b1f17b1804b1-4a02756716amr80264645e9.10.1791015064857;
        Sat, 03 Oct 2026 01:11:04 -0700 (PDT)
Received: from [192.168.1.135] ([84.68.183.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b82253e7esm10140636f8f.0.2026.10.03.01.11.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Oct 2026 01:11:04 -0700 (PDT)
Message-ID: <b3ed6eb7-2d32-436f-a984-45366389d0da@linux.com>
Date: Sat, 3 Oct 2026 09:11:03 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: mmc: amlogic,meson-gx-mmc: document
 the T7 pipeline clock
To: Rob Herring <robh@kernel.org>
Cc: Ulf Hansson <ulfh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Chuan Liu <chuan.liu@amlogic.com>, Jian Hu <jian.hu@amlogic.com>,
 Ronald Claveau <linux-kernel-dev@aliel.fr>, linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260905153234.133217-1-tanure@linux.com>
 <20260905153234.133217-2-tanure@linux.com>
 <20260916203701.GA1463751-robh@kernel.org>
Content-Language: en-US
From: Lucas Tanure <tanure@linux.com>
In-Reply-To: <20260916203701.GA1463751-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/09/2026 21:37, Rob Herring wrote:
> On Sat, Sep 05, 2026 at 04:32:31PM +0100, Lucas Tanure wrote:
>> The SD/eMMC controllers of the T7 SoC are physically far from the
>> NIC_MATRIX bus fabric, so the hardware design inserts a pipeline stage
>> in the middle of the bus path to help timing closure. This stage is fed
>> by its own gate clock and, when that clock is disabled, a controller
>> that starts a DMA transfer can never complete it.
>>
>> Allow a fourth clock entry, named "pipeline", and require it for the
>> amlogic,t7-mmc compatible. The other controllers of this family keep
>> the existing three clocks.
> 
> Did the SD controller not work without this clock? If it did, then this
> is an ABI break which is evident by the current warning in linux-next.
> 
> Rob
Yes, the SD controller doesn't work with this clock, so I don't think is 
a ABI break, as the current code doesn't work and the board crashes a lot.
And a few patches got merged from my work, so I will resubmit a new 
series for this.

Thanks
Lucas
