Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793345738;
	b=Z12UD3ld5glXrmSj27e2IDYHt3wJ5ApMqvEjykIcjRSg2PGGVE37S6Yl7UGk18cbBuaW
	 gxh+xxPbILEKpOyL7m/19/Ka77g1T8V3LF4RSNrT3NrXK4wkwd4u+83gxXZhOO/QFUqCo
	 oiuNTgAGG3Hk8xT2ZBCsa8cwGqb8LPMK3+ogFxM+EDnofPiqtzgb5NMqnjOMO2WZESy3C
	 lf6q1Kp6RuNSB9rDOI/IU/tSFSNFgyxgb/NFdtzAER05pxhj3yzfv6baE8/2+69p3JcOF
	 2X7ltzMYd0FThrw1anAzkOnLB0bB8RRNE/OuXGeyQPObVaUHT54KFyfxWbci2vNCpFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793345738;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=eGiW8RvcVr3fwqj1crm//CbfJIk1OPn7AoDBhadQcmo=;
	b=VC8kBE37YBAANfqpbyK4erVR4T6fND6jSIyDT5yLdvoDcXCO8G8ijskdt55tvLn1MJ+4
	 O7ixHP+OI6OYloRJQqNMkcoXchgiq6yRRJWAuhx2xXXaCKXOuWThP8B+9naUvIexFT+9K
	 O6qIdisOfLZ9i2tt5s/PqMZwlUcHPbwfBM7QUmW38pw5O+HBG738qJGgdqxFiZKoP+46z
	 JOc96ibLRXPJYV+ZxWMacR+dMSI9sZKOWJxum9XfP6U/9guIDjt30OAuyUPSbRW4kn8bY
	 kT5wqyYzQ8wZ61SX3hwiPZzLmvlhu6B4qL591/uqbo5CXe1L1rRLQXWF1D2ozZFWXZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oxtxUsyW;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B45BE606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 07:35:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B45BE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oxtxUsyW
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c49df71182dso53634566b.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 00:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793345736; x=1793950536; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eGiW8RvcVr3fwqj1crm//CbfJIk1OPn7AoDBhadQcmo=;
        b=oxtxUsyWkSUGcx88r+mZxY6yEP4cgJIGdQTXTPbFz0lHuMrHqGliKsZYbZiDVutwHi
         ORPZjHLcA2o5rgEh0skN15D13RN5+/vfSVda8NE4B8poQwtsg5xZPf4IABCrZcPyIx6N
         vLN84EmFodtwQnAT545kbEHJY4WoxufJ3kbqeuBU5STtwmL5kkjXMlib8K/4KqtK45A7
         l1RvaH8CnumoW+SVn0S/iqnq3Iq0bmSezASKgF+G04MDssAp2e5MpYzBA6cZ54qBZNaY
         SpA7U9w2NDAzZH67aEGaanQ99/jiA9IZZTF99fQkjP/2kcSP4mLTTE1kPc3TUblfZQdL
         a3UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793345736; x=1793950536;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eGiW8RvcVr3fwqj1crm//CbfJIk1OPn7AoDBhadQcmo=;
        b=fTzRqXqw6ka9Ez6IROYGyxWStTSioDcFFXPzYOw1qInp/ZHh1BW/X8M5WIv3XN6YFs
         sbfaX3/+MW9MZm8sMAijDvmc1rT315NVcUCpUhOR6sJGTkCBeIrLQxIEMThJLQE4ZnTe
         jnc+9T3xTzYYLah/TmNOoB+c0F4M5FMgRyCZ77pKiSzEe2uSCG+QkLvLWrRXWtlb8G8k
         G1sMdlgrPtq7E2DBlfm9d7DFq9Y58t9no9Pe6+FL6aN3fOAwmXDMBK9U48Kp1M64HpgH
         74xPvc9j9Bqzt1/XriRnZ810toVjwpeHNcjJz/UMGtUXvtewp0HrH3uka4GhRTm7eFEn
         ytZA==
X-Forwarded-Encrypted: i=1; AKwUvBw4KuH5t91xwT4hlRnhDGq0uUi84pd7E2lEtq4+3XEHXlofmfCUciVKB3ZuZIzOtZJmXiXbDQ88clKUiG8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKi2j4NyyCCsX9nCEfQwCxSy0JH7r1dbschvQwjI0EaTdXH9RdD
	efyiqJsRto1DrW6ioauC3Imo8+/ymQPzqSz2leIyYp1tDiDtsWxR+yp6
X-Gm-Gg: AYBFou3YIFFldlCXlR34FpwhaOL8xl4LOcVRh+qliAVTvFET7fCRk7PY1pR4Wc9yKso
	v4ENCu1Zd1QNx9IpXXmqvijeVF5aR3aPd3t0QYLx+g7RgbzalOPMUJeNXKeNHEJFlczSYwitF6o
	0grbbsyO/onFdv6nLETxaZLEBHAulxLt2zi9/EysIdwzDbLmlIP2fweF/u2GXJYP4pRX07byw7S
	Go3c4EA5KSDZBILGf2UTXVFmWPGw2BTcbMVePygFzpvtVvQbEuD5+taVPYrPwGlRnBOmm0sZg38
	0diZ6F1oPRYvWExmR1KNtHnSYwNuJkwakGXauvyL8akpzWFwKKE7ahFLlbdCN1kQhDJgLn+RBIw
	PKCTfSQjPzVW5JeMl1fKyzZqm+1BRC3pzT1rSQJIxJBlvF3cgR5PeiwW5mJ2R6pcdDEq117Xt40
	i0Z5K6I9GIBql7VdTj5d8bgvYZiPMgiRu9g9Hl6r5ppBD9rHA5CyOqz229NuMfm6NXnfz7F9t7O
	wZ0O3v04khE8JheDhzM1blzlwnTAwvIQZQ2hmSWwV0tpx/nRjnmi/ai7nqHTPGcG5m3Fkv291+z
	XDZswNgRdwFJ/OV95FsWRXXNmkFwWMT/WlTKvQ4pnj6r5e72KKFExiVBzoCv5dWOOvjqjhohlsw
	bbGiTGamHh90Q3QSlxfw9bYZJ/TGn6J5vvs7kV8qHJgHYKQ==
X-Received: by 2002:a17:906:c14d:b0:c40:4f39:22e8 with SMTP id a640c23a62f3a-c4ca7acfb41mr120166166b.44.1793345735937;
        Fri, 30 Oct 2026 00:35:35 -0700 (PDT)
Received: from [192.168.1.229] (20-144-89-188.ftth.glasoperator.nl. [188.89.144.20])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabc1920csm34203666b.5.2026.10.30.00.35.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 00:35:35 -0700 (PDT)
Message-ID: <80246e46-8b9b-4cc8-b3a0-b07f9e5aaf8f@gmail.com>
Date: Fri, 30 Oct 2026 08:35:34 +0100
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
Subject: Re: [PATCH] dmaengine: apple-admac: Fix position one period ahead at
 period boundary
To: =?UTF-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261029105908.22809-1-sn125164@gmail.com>
 <E5478149-FA00-4A41-8CAC-7E8CF8578473@cutebit.org>
Content-Language: en-US
From: Jacob Procee <sn125164@gmail.com>
In-Reply-To: <E5478149-FA00-4A41-8CAC-7E8CF8578473@cutebit.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/29/26 17:10, Martin Povišer wrote:
> Rewriting admac_cyclic_read_residue to avoid the race altogether would be
> best but until then, your change looks to be a strict improvement.

Hi Martin,

Thanks for the ack and the extra background info. I would love to take a
look at a race-free version of admac_cyclic_read_residue() as a separate
follow-up patch; v2 of this fix follows shortly. A complete test setup
is ready on my machine that traces every position read and logs the raw
registers. If you have any pointers on how REG_DESC_RING behaves, or
already have a direction in mind, that would help.

Best regards,
Jacob
