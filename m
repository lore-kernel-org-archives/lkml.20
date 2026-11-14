Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794700462;
	b=tZV4SfmfMs1c9uXQn+MTi3Uaias/UfqqXogMRaGQ9ssbsKc7/vtxUnSQtTmLIS2xS9LE
	 OuE9R4oxJBzEzVVYaQfsPUQhUx0aV4fhZVW4/ySzMGSO50tJ59foITGRw6ODqFeb8KCrD
	 dxCZBlILuu+bMXvPrnG0NZ7qCu8Pq647louIYJU85njaSzkP5W0C9u7ERqq4MzXMAAue/
	 UPPSsYxydlY4crDQUeBHnnAAApbCiFaqtHR6hHSQHlZl6OQ1pBc8Z4A9MovN1Gbqu0E9+
	 2+nnF/SD6bE7p7NsiZZSFPyWQyq01gTsEHSi+sg48qHvv6LTXzb8czScwF/BFxUhHTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794700462;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Reply-To:Subject:
	 Content-Language:To:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=IufCbieA6Qd8N+6xo9KKOPiazDCkVPjgFR48LE6emEs=;
	b=s5NaKC6WzTuhvRDJZvE+1Cm+3piH7h7oBG+dtDBehvz8N3KKy64OK7e/kkPiPR6OsTXF
	 FNQvsC0cWbBuYxrKfS6fPxb7oxNXX9m4TMdf9Xoa30jQaRNzIKYGYI5oWNQGAFh0ZD9/C
	 n/RyGY/0u/de9MT0fjtQ7KoPIrdnYTno4dN5or21auV54iRlcZQXatKn4rr8a2aKJdVXT
	 LIM+R7sWF5qMxaPJ7K3DHURIQYhIyEffHfLxy7+ZAvvrdloMws2vopsVBzamTzUFnP7gi
	 YXDqv/2v7fQqxAGKY1NFKGmXD3Ths26Y87W/J6iJmSjmFuup3j/yDOyphv7W8Fg8OZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AcwcReT+;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E3EC606A32C
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 23:54:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E3EC606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AcwcReT+
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-36dbde64409so3337845eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 15:54:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794700461; x=1795305261; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :to:content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IufCbieA6Qd8N+6xo9KKOPiazDCkVPjgFR48LE6emEs=;
        b=AcwcReT+QC044IPHT6exIOLUEgeeK49xIuqeNAggMyZFbImm4qBXyiu6GnzPTnzF0O
         LyIgtMrKl1ZmN5XjVs6vL7C8ALbllys6YBCjcALl19AjHF8kZgB1gaDggpQyV9VrU9zD
         Syo17s9Vq08yv2z9WuwKPD8uw8rACx16MuX7r7bj7/9DH99+LefTGqCCMB9A23z2HZzR
         NWFuOGadUVdkAKILcwFUnEClxLZ/UQG5X4y1k43QRdgGsC8Sskrl/RDLXBMgJBxzkKIE
         75LEOqBwq0+MFF9sGjLZOZiDzItFi9AM+cK2i747T2pMvMN6mbeU3OG5qAdFEuGCGk81
         +vIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794700461; x=1795305261;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :to:content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IufCbieA6Qd8N+6xo9KKOPiazDCkVPjgFR48LE6emEs=;
        b=nP0eIf1KUMOwN+Jz/yk9yZ3rmu/NoIOCELrEF6lvdZxY3iLXkJXNXbvbWu3bQOb+YT
         3yf2Ee+6bBAZXEjoJBi0CZTmxcxipxvvf7cmlDw69tpWL3JAoe3h8sqWegy+g32KZrrg
         Ju2W45MQmCZtrM6wsH5IDJ9S0dih71fTjkyvcL4va23PGrkyqf6Jh2AIz4PjSSK3lyib
         3HRKIBLXYujEmBI02bd1OdGU+Ts+9EwnPN09ir6bLuH5xpsT2Smk1Gr+uoCM0QYT9JuL
         PWzrwsCVICbWAcAn4SZUa+KT571yg+/DCglvkehEdiaEgfACb7y+ToULcXPsBv3YXZy1
         dHSg==
X-Forwarded-Encrypted: i=1; AL+hErGawXki7WUyijeXzb3A7eYwafi/lBlkIzXoMNeQ052q1MiPy0qW7pyd9u6KYt/8j9idxJvzOPCeniE6umI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8qD3MPlRAtkuoA/LFEKX2+BKPS+B6m6mDwgpz9qCVbxh+BfNjG
	++Yy83cXm1B0NyM+FsFaIizYhCCGdWMC4LlgEXGtkGiNrK45KkQAv1LT
X-Gm-Gg: AYBFou0K1lZ6jMYBhINMrh+g9ZprviTEF2ZxFCvUaVaYblSJiYMSFx+A1Ub0y7k7axD
	3WI4Jh/BUdKhEKr067duUt6N50U0In9oQAx/2VO+8z1jkfMauFeTusWi7pmdIG+LZVsWzTqNH3h
	BsNxUQ6Q3MtTMOc3a7Kfgy5BDbXsm8KVkvjqqjPCh3tN9zgbJOdqsylYKdGL1v0xd9837miY/0X
	ZaqZnHn99hmugt/a0mx6zVquAYmvZRfp7yndBiQ5aF6LBSlqriZyKbRjKLd0CkXFYc6PkG0Q24t
	s1my01Tm2i+dSjNwdxgcwWfvFIucUfnmgws5KqztadrHOUz7M84H5dXKp2fSLVd8tjSE8nrjnzj
	SBAUwHQLZRqkRI0hfS1g7w0QjZvo3TYCon4i8Ivastj3OrV05bKZEYb7z5dnemAlcM08r5OxiY2
	iA7gnR0Uj8wnQfYjQ0WJnk9L6bZnfb/vUjOubTprMXcMFwV5L44pzraXcM5Yn1Mwj/zCQkiQJf6
	1wQjIqlQSHEY/pcRI58B4+B4rrV8EpU8t3EI8SOSqGBZFqUTj/Qf4QKZy7BvLB/SzPF7jfw+Eu1
	mt3xwLggiLd/g1qGteCMPB7jfu1e10inlsvMbgyXHjBt2E5mC1iyEZ/yTPIp+J4h5ko=
X-Received: by 2002:a05:7022:f116:b0:1b3:af3a:e793 with SMTP id a92af1059eb24-1b502fe37c6mr6384471c88.0.1794700460496;
        Sat, 14 Nov 2026 15:54:20 -0800 (PST)
Received: from [192.168.35.43] ([218.50.238.131])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50313d8f5sm29226208c88.3.2026.11.14.15.54.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Nov 2026 15:54:19 -0800 (PST)
Message-ID: <4b8a7510-808b-40fc-a6c5-551e7d88d5e4@gmail.com>
Date: Sun, 15 Nov 2026 08:54:17 +0900
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
Reply-To: chanwoo@kernel.org
Subject: Re: [PATCH v2 0/2] PM / devfreq: add Airoha SoC Subsystem scale
 support
Content-Language: ko
To: Christian Marangi <ansuelsmth@gmail.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261009073330.18175-1-ansuelsmth@gmail.com>
From: Choi Chanwoo <cwchoi00@gmail.com>
In-Reply-To: <20261009073330.18175-1-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/9/2026 4:33 PM, Christian Marangi wrote:
> Airoha SoC contains multiple subsystem that are scaled to a
> specific OPP taking the CPU clock as reference. Such sybsystem
> can enter idle or performance state based on the system load
> and power consumption conditions.
> 
> Example of such subsystem are GSW (Gigabit Switch), NPU (Custom
> Risc Co-Processor for Network acceleration), SOE (Crypto Module) BUS...
> 
> Changes v2:
> - Rename to a more symbolic name
> - Address some sashiko bot warning
> - Better describe the use of this devfreq driver
> 
> Christian Marangi (2):
>   dt-bindings: devfreq: Document support for Airoha Subsystem Scale
>   PM / devfreq: add Airoha SoC Subsystem devfreq driver
> 
>  .../devfreq/airoha,subsystem-scale.yaml       | 114 ++++++++++++++++++
>  drivers/devfreq/Kconfig                       |  10 ++
>  drivers/devfreq/Makefile                      |   1 +
>  drivers/devfreq/airoha-subsystem-devfreq.c    | 100 +++++++++++++++
>  4 files changed, 225 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/devfreq/airoha,subsystem-scale.yaml
>  create mode 100644 drivers/devfreq/airoha-subsystem-devfreq.c
> 

Hi,

The devicetree contains ths only clock information for scaling without any parent device
information even if this drier has used the passive governor as default.
I think that you better to use 'userspace' governor.

Also, are there any connected device to provide the utilization?

-- 
Best Regards,
Chanwoo Choi
Principal Engineer, Samsung Electronics
