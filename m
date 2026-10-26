Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793028302;
	b=0ufXxT6vssl2MR2g1uOf5zpEAYh1U8mJmSMXhlEIqJSnNk3C9M9sYKQI7HQAjzieH0VI
	 /Gc4qk+fCjf50rd13cRJv8BiStaJlISbMcSnxnHK6PWmjT/3bsa6zGuVHHpYaZR2oojhs
	 kNR1YOGP1JYMn/vmshgf2nRMDKdSRCDL8zOnH2vICsFSZQ5W1VInuczNqlgr8jrE3mDBm
	 SLJPr67jEPq18RMnDUOSp7wAjfakUW/l8opK/nyNSbwy010apXltDAqaRI3M50IOIyQkx
	 BhZRtITYJeK0fUdvPGaT8+aodZWrz4oD+k5r4YiOBi/cl/XMR4a1yQ/1ZhSu0+oYNRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793028302;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=8/eKZYT2XBSHJPb67RYoqY4k1/nqAIq6v5M2nmhwAcE=;
	b=a5zqPfndWqVc9L+11YlcTZ+4ecYbr6XjK/ML1o3BtQAok6+sG5XdxwBFud3Qmxp8/56Y
	 VD4cZen/qpgghuaYWVDdrLNahHEo3Ys90k6z0dWLwehEhzdLtVP496fO3SOXa35UqKFLP
	 gRPqCh8iBLGQZcFjRCkwUtAqYa3dxN0J1GXWlPh4OdswSHwZYEQuMKTLgzxAS3oSY+15j
	 +o0Diwk+95eIEYmByMG+MjM7F0AIgOCWWhSOa7B4Sm4Eil0gIh2XLPQX13AfaNfLD/Nf7
	 Gn5T2zRIMmoabBN+xh6U9pMKw60A/1WF3gln65tw4MYO5z44m5HYbELf3eFvovFxEmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=NRzyVEYP;
	arc=none smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC00606A320
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 15:24:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2EC00606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=NRzyVEYP
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c423b145922so419590266b.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 08:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793028295; x=1793633095; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8/eKZYT2XBSHJPb67RYoqY4k1/nqAIq6v5M2nmhwAcE=;
        b=NRzyVEYPtSo0/zlZWWXstcRd58byuqjYNBOOe9xipLu3ODsIsmj4a5CwgYvbgHQ1Uz
         8HVRbBtBUNQs+TFHENrCPRIXnR+zdeGog15QXOwyY45+27iAh3wSJJnZZwNZSIkpgWK2
         tmSSrI0CqXfZR326vGfxQaqD/2vjNfVIaZHp71yW9JVO1WfLb5KtJxGCerEXczCDWCyt
         1I3P7GH/mDQarAkyPUg2Ewr0Ugiq42A0DNK0OInhJvOJG413JVmvIYrblCKadXHfK7W/
         yfGDYAsf5k4JKL6V/l0Xy7NOE/BS/uMxh59sNYgm4f/LRdkZ3O6Lx/TOx7/7hnpEF2Mq
         maJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793028295; x=1793633095;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8/eKZYT2XBSHJPb67RYoqY4k1/nqAIq6v5M2nmhwAcE=;
        b=S3z4O931YT7M40ELj3ZtIMQo9A9+j0Pl7RqxcAdqGBaLXMcarST92zcQSWgoXGXTkn
         fSr6l0nIkX3r4/ZCxzr9QSYExZKJaqZPVowdvTUfQ6h7k4UcYe1DaTCNI15M8AbMOpQi
         jc6vxxDOY3nreLg5hEW9QT+PcZPPeuTb6Cq+DeaK3jUaA/t0yb9Zv0R7HmYQ+AuGoiJs
         FpcDcQjdrPWZTcuWHZhrFSI57ddig6IaX/WO096HUfFihAwwzLXTRtzTwmt+2aw7bxrM
         Z+ahNLJVjkmGPY+tBzcXSraveuql7z6kc/eiZ4UBUEHiyoKzK9evC5Zy2RgT+u/cafPY
         OiLA==
X-Forwarded-Encrypted: i=1; AKwUvBx5sBvl+i/Z1OT9CriCyVEOVeM9L/erQr1JMt6YnMlZ02yUP9qNk5mpTxLKdUpbrDQTH8iYex0F+7tXizQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJR8e0f4ziaOGUt3xiSiiUYBwrs9ee+iHp1nz28jXM8cxViqIlE
	WakxhR9qPyVQ30BSahc/XGZOu56o8Sm4LV72cEIL5Taga8Gbu4xNZPI0E+8Ykc/zDaU=
X-Gm-Gg: AYBFou1jAqaWDtNg39e4mhHsCURwPsJiIZidAvy2cHi6aCWvxN5zNRj+exWYIecYWqC
	iIoPaUJQakK3FbPdvVfDtJ4JjS0e7ye98ce53G+PvPUxl29o5tNpRDogyNCnjGd4QqjPS2O23WO
	fWJ5bin1+0qZLzXLdc6frbd8JVE2512SWaqEvi1lHW37vN6sFmNSziljl5eOmCIFREV0KFaIpUx
	G1kXgZ2LqfMvVd53ZYXlQMHG3Y9uvt61VF2x5JbSYYapfhbbsvuKlCk9mFcVWtl75QJSzfFLVZ+
	iDnbbikiCwlyuJ+go9D39ze/90bUiurUrEnWtJ1gxOVGJDYs9m/mMJU0TTWsTCoD5KxQyNl76x1
	wuoFIVqGjsyqmNyZ7c7R++VvYoUPD2aFUgrPpQb/yvgOr2Bx0ToqgBwfVnXazesvXz3z2j9LoLS
	CWUsL/YlhrdDeKOZBCkRd+C9IG7C3PQl+N5v/yvlDPm479jO4o1FwcBPZCOX4SDCd+CeaxYjqb1
	rnE3r4m/htLdn4v6tQJx8j7OmL3mm2mz/4W1lLh+2Uz/lmOsU+XNSVUVZbc9fMmMZ4INtfj/7NC
	sONto4kSiR+c
X-Received: by 2002:a17:907:6092:b0:c31:7495:e57 with SMTP id a640c23a62f3a-c46bde9a0eamr770063266b.44.1793028295532;
        Mon, 26 Oct 2026 08:24:55 -0700 (PDT)
Received: from [192.168.0.167] ([64.43.151.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd34f465sm329841166b.8.2026.10.26.08.24.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 08:24:55 -0700 (PDT)
Message-ID: <c9d017f7-f072-4533-8b2c-a87ed67a8712@linaro.org>
Date: Mon, 26 Oct 2026 15:24:54 +0000
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
Subject: Re: [PATCH v3 2/6] media: qcom: camss: clamp VFE clock rates to the
 highest level
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261026133726.3249235-1-atanas.filipov@oss.qualcomm.com>
 <20261026133726.3249235-3-atanas.filipov@oss.qualcomm.com>
 <CAFEp6-3WQyjjFDjUMeVD7QDAK0VNhfD98XFw2YYJ8FZi54yypw@mail.gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <CAFEp6-3WQyjjFDjUMeVD7QDAK0VNhfD98XFw2YYJ8FZi54yypw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 26/10/2026 15:03, Loic Poulain wrote:
> On Mon, Oct 26, 2026 at 2:37 PM Atanas Filipov
> <atanas.filipov@oss.qualcomm.com> wrote:
>>
>> The VFE fails to power on when the pixel rate exceeds the highest rate
>> listed for any of its clocks. The rate tables of the VFE clocks are
>> independent and need not have the same number of levels, so a clock
>> with a lower top rate than the VFE core clock, such as the SC7280
>> camnoc_axi clock, makes the VFE reject pixel rates the core clock
>> still supports.
>>
>> Clamp each clock to its highest listed rate instead, and warn that the
>> pixel rate exceeds it when the clock lists more than one rate. Take the
>> clamp into account when another line powers on an already running VFE,
>> so that a clock running at its highest rate does not reject the
>> request.
> 
> Again, we retrieve the pixel clock to derive the required VFE **core**
> clock rate. If the VFE cannot sustain that rate, failing here seems
> like the correct and sane behavior.
> 
> What I don't agree with is applying the same logic to other clock
> domains, such as AXI/CAMNOC clocks. Their frequency is not directly
> tied to the pixel clock, but rather to the aggregated bandwidth
> requirements of all active clients and data paths. As such, deriving
> their rate from the pixel clock requirement feels inaccurate and, in
> my opinion, is an abuse of the existing logic.

camnoc_axi and camnoc_rt_axi are matched by vfe_match_clock_names() 
today and have been for a long time so excluding them would be a 
behaviour change.

Perhaps warranted but that would be a different patch for different reasons.

Upstream:
return (!strcmp(clock->name, vfe_name) ||
		!strcmp(clock->name, vfe_lite_name) ||
		!strcmp(clock->name, "vfe_lite") ||
		!strcmp(clock->name, "camnoc_axi") ||
		!strcmp(clock->name, "camnoc_rt_axi"));

Also - RDI path computes
pixel_clock * bpp / 64, which is a bandwidth estimate, not a pixel rate.

> So I think the implementation should either handle or delegate to
> separate functions depending on the clock type:
> - Set the VFE core clock based on the pixel clock requirements
> (typically vfe_clk_rate >= pixel_rate).
> - For all other clocks (like camnoc_axi), and until we have proper
> aggregation or voting support, a simpler and safer approach would be
> to select the highest available frequency.

That's a bigger change - this patch only changes the top of the table. 
Setting to the max clock by default would burn power for no reason IMO.

On the core clock though I think you're right; if the sensor exceeds 
what vfeX can do then failing is the correct thing to do.

@Atanas could you keep -EINVAL for the VFE core clock and clamp only for 
the rest.

cheers.

---
bod
