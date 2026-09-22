Received: from mail-qv2-f14.google.com (mail-qv2-f14.google.com [74.125.230.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 156A148822D
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 21:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790110952; cv=none; b=U7Y7ae278wFa/xrIIASXlUhPGPw261usK8FxZVwDEjE0fE9ai0qv8p64o8iwJiqEc7nhSqbEUkpG5FvRv9SySQaXtBzBp6gMcLNAHN+0gGwKL2ez0maoXZ58hjRct03qg/7cdpeH4qee05ET6OVVhKchQpKT6vXy+5ZAZqiBHvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790110952; c=relaxed/simple;
	bh=mUiTpuXZ08jRjcCjuhENhAkI/h8z83dpTQbKz9it2Yg=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=NOW1BHe8OIy1IooBMba39ElsB1gMOLLDJrRHnbYCMwT1kzaXRFOhq5inPUaA04WcOU21ATIbIMkO+6i30JtI7IC2KZRAKAH+odG5Yt/lKO9xkvg2Gj5AIMbyoN9Yf0r1LpcWAfYCDJ56+5zjcGD4/akWiDxsSx0ldXI+jAasUKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=Xz3QqWbe; arc=none smtp.client-ip=74.125.230.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="Xz3QqWbe"
Received: by mail-qv2-f14.google.com with SMTP id 6a1803df08f44-90cdfcbe20aso2786656d6.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 14:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1790110930; x=1790715730; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=b9Tj2oRUZivsRV4DF4owfEOUU+s6qPBlsbxiJLCQngg=;
        b=Xz3QqWbeNe6T5XRZz5L3+ChBpuAe4QPy1Y7mRbru5/87Cowhbal5ABl6u9iE2l4eQ1
         TERdKW/fX4uCs4gZiVPwynPb23FRQYsBNj4CR5aFLLDYlKY4M3Ir9uhjDfsWygU7s5Ww
         HyvmXKfYHhu+gwetWtM7Q+Kuw3YVA3QgGhHoJXqupjIUePjx7LhiGMDtPhatKgwHLBuR
         /7YOGD3GWNNj01hLOQhodylUG4ITUQ+KcNwlGjtGpdSZ+czxVMiZLdDKSOXmGQqPATQ9
         Tu59Wo3o73/oS7jmXsm8quAeT+Tbt3jir2usiSjE27Fss38BKaM8kC/77bYr4GFs4mzq
         XnDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790110930; x=1790715730;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b9Tj2oRUZivsRV4DF4owfEOUU+s6qPBlsbxiJLCQngg=;
        b=yxAfaK8r6cusUL9ZfqqWb3IZUyrd+QcjRUM+PlL3H/o4KWkxh48AGTagm9JBrwf3xK
         aXicJB+Ksck/TQ/UMgc0IslHNeoO/W4mm74A21W8GmrQqiejzYVZYpCbPaeASWCQSdqY
         wRPz178Rrm7Sob0ucKxdUTYHst6ykKmPgmxZRJ3bF9+CJ8vgRXHKPvvscVPmm5ubt5pG
         3+aAJJoorV0DOmXSQc8tgTyDRB2wdXFt7t2/m2bo69lcWsSHsZJDHEs/2YUUvsrm8Ytx
         vxLFvV9VL2YVUURNHwbF9qe6MqQAd5Ip01q1HFSjuys0h3WxlpxvnxWc0Nr3ho7E/j+H
         SowQ==
X-Forwarded-Encrypted: i=1; AKwUvBxG+z8U8XmlVKlf+n95wuCGAD0LRH06K8qn/hrZvUFCgy0+7c+FrOksbbdnXKT656nyhuHXHZCF+zA3xHg=@vger.kernel.org
X-Gm-Message-State: AFuF++lOaoxVqfHZEgLU0iIiz2UEJmrajoTit2RFHLrEOU3UYq/Q5V24
	p/e1GpRG0b8rcM04kfKRQ3hpbuhnsvp+17ECLRwYD/htHBWuZ0Cb+Px5WU8BrXSNEo0=
X-Gm-Gg: AYBFou3xJvwXQeZPrD0/QGpWqD5hsG19emG2TUxe5BhHiMljQg/+/B3s4UNb0hacSk8
	eySOupJ155LyjWfy237yviXyoKjDrmQ+rQTwZemus2ELxpGlEydWQz4svun83JctcV2A8Oj8yQB
	j8lMDZs3C7vfOpRJI9tObzKesXgTNbKo07bIesd8Ri1tvFSbxSdy+zFgncvTIncn3C34LGmppX6
	Xojc8hUHI3kOGzz/ttBGkrKniRwUG8KA+Yxz0edToODTMTnAQWFmMvZdFakgwiuI7bEpmMuFGq2
	DK5Cg/Gfzd0JYr9Z4g6BdStRlmYhT3Ubilwi9y4ZFCag5cfYWB07Ytae7qb9fxzTo+3euygsNZa
	xgSqkAaOXWXUzW5JH8Qf3C5/yu3ZA44BxzcAYNT1jDpcj6UOtciWCBDAxFvEGNj0mZM1j4DPMmv
	yey5f04+diXPTgawuRDv97h2kGpydNIhYlfSwRpPmRdElundxGbkkOtJAXITzrwPOSra3mmio=
X-Received: by 2002:a05:620a:2682:b0:93c:2419:37d6 with SMTP id af79cd13be357-93c252555e7mr100858985a.66.1790110929661;
        Tue, 22 Sep 2026 14:02:09 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c24822e3asm69157885a.16.2026.09.22.14.02.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 14:02:09 -0700 (PDT)
Message-ID: <7e32063f-f1a4-4259-96c9-fcbdd25c7f2f@riscstar.com>
Date: Tue, 22 Sep 2026 16:02:07 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: mfd: introduce the TC9564 config syscon
From: Alex Elder <elder@riscstar.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: sboyd@kernel.org, bmasney+clk@redhat.com, jbrunet+clk@baylibre.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, lee@kernel.org,
 andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org,
 kees@kernel.org, gustavoars@kernel.org, p.zabel@pengutronix.de,
 daniel@riscstar.com, mohd.anwar@oss.qualcomm.com,
 lorenzo.bianconi@oss.qualcomm.com, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, mfd@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, linux-hardening@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260918165234.687224-1-elder@riscstar.com>
 <20260918165234.687224-2-elder@riscstar.com>
 <20260920-fiery-fanatic-manticore-6abf0a@quoll>
 <85b0e7de-e4a8-4e08-b801-a9664d366e1a@riscstar.com>
Content-Language: en-US
In-Reply-To: <85b0e7de-e4a8-4e08-b801-a9664d366e1a@riscstar.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/21/26 4:46 PM, Alex Elder wrote:
>> I also have doubts that this is needed - I see no updates to the misc
>> binding, which would be referencing it. But then another point would be,
>> that you do not need separate child node, which has no properties.

Krzysztof, I've done some additional work on this based on
your feedback.

I think you are correct that there is no need to define
this as a special syscon with its own compatible string.

Instead, I can simply define a simple syscon with a label:

         tc9564_config_syscon0: syscon@0 {
                 compatible = "syscon";
                 reg = <0x0 0x2000>;
         };

And then have the devices that need to use it, refer to
its label using a phandle:

         tc9564_clock0: clock@1004 {
                 compatible = "toshiba,tc9564-clock";
                 toshiba,config-syscon = <&tc9564_config_syscon0>;
                 #clock-cells = <1>;
                 #reset-cells = <1>;
         };

         tc9564_emac0: ethernet@40000 {
                 compatible = "toshiba,tc9564-xgmac";
                 reg = <0x40000 0x8000>;
                 toshiba,config-syscon = <&tc9564_config_syscon0 0x1070>;
		. . .
	};

         tc9564_emac1: ethernet@48000 {
                 compatible = "toshiba,tc9564-xgmac";
                 reg = <0x48000 0x8000>;
                 toshiba,config-syscon = <&tc9564_config_syscon0 0x1074>;
		. . .
	};

That simplifies things a bit, and requires no devicetree binding.

If you think this is incorrect, please let me know, otherwise it
is the direction I plan to go with the next version of this
series.

Thank you again for your review.

					-Alex
