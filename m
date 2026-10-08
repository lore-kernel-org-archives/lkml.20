Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9F064F4031
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 18:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791484625; cv=none; b=q7RlzOrIu2aFqWJ8yLu49aISEAwJektNz/bt1RXH/0HiFYNlKGMhdtrw0pplnpXThCbE+M/NOsQIPEEjJSF5YTKiZeY+Qja/lpX1nfQNIH57dUNR6rNNjJqOnPqbP6C5PWkiyDtJXO/th+sOAPZEcb1ZAWhQVxi5PFKjqQyvMn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791484625; c=relaxed/simple;
	bh=wWZeumKz9esFSRC87m2K4cbucNFbsWDBj7xuEZ4k6t4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RRWNjH7Dcg1R1c8GYevrk297Al9Hf9KsR1mDgLinfOfrhFdILZK+mndhHtmL4+V4WnfSKYUd/GPPibC+mK9zrWEfQZprx2Mfte3O6kZ11Bf3BK6Xm1aaf6Hv67wrGCAZOzn+7fy8zC6zrEQsRUh0ptt36vX3M9ZMyVMNJJOQ7Y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lGWxYTTE; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lGWxYTTE"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a018792ab3so30747565e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 11:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791484619; x=1792089419; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gpJdTFadC59MEdInBU99QKfyaqonluWTURkek0/6Sh8=;
        b=lGWxYTTElOnicnKGCKTgiJIqfxq21ZjOenVm3ZeoC1q2gMbvYFr12zJ0h2/sevmgV5
         w4Qin9hOtCfKbR3A1W/SYi+v3VlB9Ws80dI9HK9nHlfFuPvo2OT1DY0VLWp2v8379YWi
         VwtwX58K+BqgJceZVuzgBGGNPLIOrWw8HuD8ixsBsTtffCtd5hYt0iUPePJdg6+R7Qwr
         rZa4i7u6rjhKM+CGmPwb2Ale/UwcYSWoAOLp6az3ZOjbjQyfSp/DMCruRAMcsuwnek1r
         lm3td10pVl4iQM9v+ejncFsqT1p3+w0XFnTDpVPupH1XAPWbOskw32/w63fskWYM3zX4
         uhYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791484619; x=1792089419;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gpJdTFadC59MEdInBU99QKfyaqonluWTURkek0/6Sh8=;
        b=LPdBlHTH8g9KBAuqhMmvtWkkKc78rRCjYQtpp283aNyR8Ap6h38MEgd/vi/H3pFgbb
         YmhDwJ8E+VAKHg9PXAyBjXr0a/a6c6Z0u4VnmRHi9mxosiWiYBXBUykHZ8GBM0q97ia5
         PROAhk47+B9IyuP/18lt5utS1CwBD7lQrGKJEHeF1SOuYhIsTYPt9NU8am3OTMZBI0pf
         RkhwBJiEeCUYHAyYxMWNBMupG5wWdKvcjskkBxIdRsyNViX5gK0bgFdbx3J0IVi9QepB
         31/zn0u2s1Ae98ufyDpOJqZ71qYXLxwqpw/ja+/eOY1Hkg+M1ToHHmbvhYC66/+PxFzJ
         fWFQ==
X-Forwarded-Encrypted: i=1; AKwUvBzDvtbuLwSsq0NwJkoAGceMViWFgpKNOwF/Q6Mc6FpQrONhfqZ14QkkopkoZyELp3dnBApM5F9/My1VIs4=@vger.kernel.org
X-Gm-Message-State: AFuF++m6LCLVoByflcb0LJKygOyPAqi5ihIUybaAwdb81DE5g7DkdsmO
	pL3kCVVwB6NrWTZXJImH0+5Ysn6LlVfTnLp8Csey/NtGI5n8OyNzCTGh
X-Gm-Gg: AYBFou1k6k4yxi04zqrD+Zg2os5LLtPWrchxQvRycFDWETAqze6j0zazb95yjpQz77W
	jChwE29iElNgULEqaNVKXkaRe6qClmOkOleJrN6TIvZn18qLnzQlG2qR1DcAxxT8sZkso1WPLsk
	7x2XCG/flNJy+4DCuccllmveqomQzdwZm920cvUsgF3VPB61RIUqsci1L/Q60OC+VHI4NnHWG8P
	xZ2Qo5a3QZ+Iy3QXgh1zAFo+suO/VCSb4bn6QiLCUmHi/kK0CVuhRJ/k6IwkBObOLov6uwdnt1/
	5saDNblh+nQ8A0R463kAH/cumXbV0lIFDtxXgjbSpFxVP1GqAcoHGPH50cGHmDThEaOB1ieYxzi
	a7wZa93II71mdEtDjQC+I7vKJ/Ejsl1tOIfkqzJRevsD0G3evqtxJ6skmAbERGI2eouqlVSicft
	lhczGNyPLHKZ0uQIKb+N0CcIS2SMxSxbemQFea/jNFcIv2mB7pbm6MwQ9xSyWifeAlCYsy1x87w
	vLHYrFcO8tI4OTMogcGKHpKCeCRpeA=
X-Received: by 2002:a05:600c:6989:b0:4a1:6991:36d7 with SMTP id 5b1f17b1804b1-4a1802f622amr128959465e9.10.1791484618686;
        Thu, 08 Oct 2026 11:36:58 -0700 (PDT)
Received: from [10.0.10.92] ([81.0.251.149])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bb68abfsm5152555e9.0.2026.10.08.11.36.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 11:36:58 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <b43a2c83-2c19-4b08-bc53-47deac0c81c1@gmail.com>
Date: Thu, 8 Oct 2026 19:36:56 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] kconfig: fix infinite loop in conf_choice() when no
 choice value is visible
To: Leizhen Zhang <lzsx618@gmail.com>, nathan@kernel.org, nsc@kernel.org
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261008164521.3684735-1-lzsx618@gmail.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20261008164521.3684735-1-lzsx618@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/8/26 17:45, Leizhen Zhang wrote:
> If a choice is visible but none of its choice values is, conf_choice()
> counts cnt == 0 visible values and finds no default. When the choice has
> to be asked, e.g. because a new symbol was added to the same menu
> (oldconfig, syncconfig) or because stdin is at EOF (oldaskconfig), the
> loop that maps the answer to a menu entry never finds one and the
> while (1) loop repeats forever, printing "choice[1-0?]: 0" each time.
> 
> This happens in the tree for s390 when the compiler supports none of the
> -march=z* options (e.g. a non-s390 host compiler), so that all values of
> the "Processor type" choice are invisible:
> 
>   $ make ARCH=s390 defconfig
>   $ sed -i '/^CONFIG_NR_CPUS=/d' .config
>   $ make ARCH=s390 oldconfig     # hangs
> 
> Before the removal of tristate choice support, conf_choice() returned
> early in this case. Do the same when there is no visible choice value.
> 
> Found by fuzzing Kconfig input with ASan/UBSan.
> 
> Fixes: fde192511bdb ("kconfig: remove tristate choice support")
> Assisted-by: Claude:claude-opus-5-5 libFuzzer
> Signed-off-by: Leizhen Zhang <lzsx618@gmail.com>

Reviewed-by: Julian Braha <julianbraha@gmail.com>
Tested-by: Julian Braha <julianbraha@gmail.com>
