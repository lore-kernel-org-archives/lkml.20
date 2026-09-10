Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEDAF4825A8
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 20:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789070609; cv=none; b=Y7FAP5Rl/bx56rIHruVc+wNqPNgZLvsE4HV8X/75Evigye5pGGWkaAs1wCa1ECripHeBCtFB42Mdtrav09o6He9SOush+CFAyvxFOL5Rzk7uX+nYbi/9uB63h81c/d9UiLlDHcuObkVX5JzQ2FPaC8YSfvTXLXHNHfduCz55kuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789070609; c=relaxed/simple;
	bh=lHnxCQX1mCPBdL3Z7XhDIu9MIrWJcC8ujNZYdLI5muM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GSjR7kVk+umJmdyrj0BLpUfyezVHPHfqgTfoSsFnQ8p6sC4f8nBFgt6kbYkwlkZXJCe5A2ZtSAijEKVD2VhLyipaX5L8zQZPPk0fse6028Irzo/kKzr6hvnUai/Vi1djoq3HAE4siGDCLWoVP7hQq33aTMQl1vFka+DstP0VMfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FF2ZqIfA; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FF2ZqIfA"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2d944747d41so1117135ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789070607; x=1789675407; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yA7AN5SquNgRd6IRwgD8k+yWYneUhO0DRBOSVnhp3mM=;
        b=FF2ZqIfALH0VKUDbRMc3V53wRMATEEKmBrTA1Qxe3g37XhOnzS7OKteneH1o0BTJy0
         +FjaFeAeb/NXajQPhXIQvAzME8gFsHra7bHygvowEmxQbfzJh/JWsXLq8EmLseSHngaj
         u1lGX+o2sBXT76RTtwvf7+z5evgCscp0fYx8eXAbsu2XNFC8y7WIrWWNdb17Huya/Ze7
         9C6iQxbg8/niib98U2KNgKEZXlSepY88igg9U38AilMDS37Z3A1HlKoe4qCC1f9+2ia4
         HaNqI8ebbMZIYmGXGRIKuncOR4bmwTl1Osqj1jqD7Ei0wT8Nbbx+yhLlh8VIC5mCocy7
         3ZYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789070607; x=1789675407;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yA7AN5SquNgRd6IRwgD8k+yWYneUhO0DRBOSVnhp3mM=;
        b=QY3f69Oa4C1CnocmTGZtlMp4oIIvQXUOa5vfP096vTymmM+xqOjw1t+EP9Dfme403A
         UXUJ9swnsh63KU6pVFrJIGIzYqlRHYd05a5QwJpdvVF6OTLnTNb8gBF6mR30s6+yFEhg
         V0v6842VTlPtIwpuUqS0apS3pezE8VKwIpAFc7nH8X5RgvbvZYJwmhPynjZRTlBBI9xo
         7+A8n7KaTdYCUK4A2xk/jw5y0zaOuEArgPcAd3rl22/rgNBZu6KLpQAm1UfwfJRd9/2w
         bMMmDqc5DL2PrzWYTtdoGq5oAUjNQsNSfm04PQ8U5Txl7UG2qX36LTS7NBrLzUQBka3l
         F7cw==
X-Forwarded-Encrypted: i=1; AKwUvBxILcomgm8pV4tPMBXXyppxwqyA5QB6OpQjbOEIA+fk73Hbe3Cuz/cSVXkFymDRzDk7iqBbZGdHszS9Ysw=@vger.kernel.org
X-Gm-Message-State: AFuF++mA18nXWcmn/OnrHhOh5/qkeEm9Xc+vSF3JsWiyzkdDmiAV2yKy
	13uAk1IcwfYM5dnHTFVLgtBoXXLzukqOo4sgqHF7StRJ1TIE3yRhT7GbG7bXaQ==
X-Gm-Gg: AYBFou1RWd66VGP6L3YSO/SYHjBmTvAXTNaIIQdPS4qd2D1f5inLSw0xgIk/iNWhJre
	PbwRSLD7s2CopDRorLL+1YG79Oj4tq2gNJRLV32XDwYwm5bXCaoHwLuFlcRjxGFoERBhhA2XTp3
	2Lgb5lBIpE+aUXHTd10ENtL8ztyDr7CWHOzaiM9HhqlnL9vwru85y/ANtseP57g7kp6x8qIsmXL
	xcKEXAMQ7rZiFSdDcFqXFjBeyB21YbORStzHp+NU5e+LA2kRnSbpEbyAopTfF6BPU0WsQMRK5DF
	JUzEmjLaPPc8er7MEIbo3sSq5qCDOYYJjmwxat+IcPAy5E02y4ygWFlVtTFWFVkJJQpMl4UcMXc
	FqjOYj/h8//G5hHfFQF/pLAfxR1r9HazjqsWaL1OhSre/mxIjtpkmP0n9NUhk73z7S0tY7kEKVY
	tf8ORHWY2JKuzSS75lW0l7L5d5hV1SQegeoGGwou+Rpa7SJgRZXP1H6kG0S4aMXoIJ0henW2CF+
	tXKKQYd8tSPKXEkYGz6fsbmGD1wHKPIQZfqTqSxE4+MQyl24yaPlAvDLjSRS8MbPw==
X-Received: by 2002:a17:90b:57c5:b0:38e:9045:bac0 with SMTP id 98e67ed59e1d1-39d9bc1b0eemr619404a91.5.1789070607042;
        Thu, 10 Sep 2026 13:03:27 -0700 (PDT)
Received: from [192.168.0.158] (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b348cbsm745536c88.3.2026.09.10.13.03.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 13:03:26 -0700 (PDT)
Message-ID: <0c9b2894-c5cb-46b7-abf6-db9ba2c6b691@gmail.com>
Date: Thu, 10 Sep 2026 13:03:25 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/15] HID: hid-oxp: fix default M1 and M2 key mappings
To: Andrei Aldea <andrei1998@gmail.com>, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260910032115.28669-1-andrei1998@gmail.com>
 <20260910032115.28669-2-andrei1998@gmail.com>
Content-Language: en-US
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
In-Reply-To: <20260910032115.28669-2-andrei1998@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/9/26 20:21, Andrei Aldea wrote:
> The default button map intends to assign F15 and F16 to M1 and M2, but
> the selected mapping table indexes resolve to F16 and F17. Use indexes
> 47 and 48 so the programmed usages match the existing comments.
>
> Assisted-by: LLM
> Fixes: e4c850a6e750 ("HID: hid-oxp: Add Button Mapping Interface")
> Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>
> Signed-off-by: Andrei Aldea <andrei1998@gmail.com>
> ---
>   drivers/hid/hid-oxp.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/hid/hid-oxp.c b/drivers/hid/hid-oxp.c
> index d2ded6b..3f2be80 100644
> --- a/drivers/hid/hid-oxp.c
> +++ b/drivers/hid/hid-oxp.c
> @@ -607,9 +607,9 @@ static void oxp_set_defaults_bmap_2(struct oxp_bmap_page_2 *bmap)
>   	bmap->btn_dright.button_idx = BUTTON_DRIGHT;
>   	bmap->btn_dright.mapping_idx = 15;
>   	bmap->btn_m1.button_idx = BUTTON_M1;
> -	bmap->btn_m1.mapping_idx = 48; /* KEY_F15 */
> +	bmap->btn_m1.mapping_idx = 47; /* KEY_F15 */
>   	bmap->btn_m2.button_idx = BUTTON_M2;
> -	bmap->btn_m2.mapping_idx = 49; /* KEY_F16 */
> +	bmap->btn_m2.mapping_idx = 48; /* KEY_F16 */
>   }
>   
>   static void oxp_page_fill_data(char *buf, const struct oxp_button_idx *buttons,

I'm unable to test this patch as my OneXPlayer F1 Pro only has the RGB 
interface.
Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>
