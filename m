Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D44F4ED19E;
	Tue, 13 Oct 2026 21:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791926695; cv=none; b=Bj6cYfPqbSp+GTLKIH9n56sFbBVCDfzA0CymP5RwBgRwy/wCfIr23tOKm5tka1ypfc3XFwcs0uFl9yZNkV5hggWZYdSK2kLMGem27bMWFwZhWoAclauaxBGka4YQIwkoqjHNUfZollIkurOCCa12in3axpyA8zP2QEfTpFk+MG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791926695; c=relaxed/simple;
	bh=nKDrPdtKkv5zqB66996w81/rOjJtFS71nRCLGtuyIJ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LyqAFMtR+IWHqLWJxxGbbu/jCDrqi1rrncTGMtNw6vEU7uVpq9pJPBR5nf8woxJPRLTulqMCkiwzTq69XiLBCn+wXMcjGrCqp0KWz3LBi5WCRO5UauM5ZoXmWUj4NteF6gjaw51Vg0hRNrSPA0+bfiZlH/H+Kd4kxN/U3cuv8oI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=wr1S/Hvg; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="wr1S/Hvg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1791926315; bh=nKDrPdtKkv5zqB66996w81/rOjJtFS71nRCLGtuyIJ0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=wr1S/Hvg5UXnBzW08p4gPWHuR5AUhaU8qt4o5jIMTKUj+OeKC+hNv93KH3yAvxDpT
	 bWSf/OAlI7YyJk65IcIwrBW0JqyDSnoTqzp3ZhjWda8U9ksXiLe8wAvyVGfQ/R7T4g
	 RTRlh/TI7DeRsVXgSYU+OT8rmt8J0LNvkvc8ugV8=
Message-ID: <6956afb7-9344-4979-bdf0-2584e890fb22@lucaweiss.eu>
Date: Tue, 13 Oct 2026 23:18:34 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] drm/panel-edp: Add AUO B140HAN04.0 panel entry
Content-Language: en-US
To: Doug Anderson <dianders@chromium.org>,
 Luca Weiss <luca.weiss@fairphone.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 Jasper Korten <jja2000@gmail.com>
References: <20261012-book2go-v1-0-7188e7ea7a15@fairphone.com>
 <20261012-book2go-v1-1-7188e7ea7a15@fairphone.com>
 <CAD=FV=WVAnohGm8kmaLpfchk_MxCiUB8EcyyWBxZqtnc+9YPcg@mail.gmail.com>
From: Luca Weiss <luca@lucaweiss.eu>
In-Reply-To: <CAD=FV=WVAnohGm8kmaLpfchk_MxCiUB8EcyyWBxZqtnc+9YPcg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 13-10-2026 22:35, Doug Anderson wrote:
> Hi,
> 
> On Mon, Oct 12, 2026 at 11:11 AM Luca Weiss <luca.weiss@fairphone.com> wrote:
>>
>> From: Jasper Korten <jja2000@gmail.com>
>>
>> Add an entry for the B140HAN04.0 eDP panel. It is found on the Samsung
>> Galaxy Book2 Go.
>>
>> $ edid-decode /sys/class/drm/card0-eDP-1/edid
>>
>> 00 ff ff ff ff ff ff 00 06 af a9 65 00 00 00 00
>> 28 20 01 04 a5 1f 11 78 02 9b 85 92 56 59 90 29
>> 20 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
>> 01 01 01 01 01 01 14 37 80 b8 70 38 24 40 10 10
>> 3e 00 35 ae 10 00 00 18 00 00 00 0f 00 00 00 00
>> 00 00 00 00 00 00 00 00 00 20 00 00 00 fe 00 41
>> 55 4f 0a 20 20 20 20 20 20 20 20 20 00 00 00 fe
>> 00 42 31 34 30 48 41 4e 30 34 2e 30 20 0a 00 ed
>>
>> Signed-off-by: Jasper Korten <jja2000@gmail.com>
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>>   drivers/gpu/drm/panel/panel-edp.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
>> index 2b455369ed70..73cdc2d37ab7 100644
>> --- a/drivers/gpu/drm/panel/panel-edp.c
>> +++ b/drivers/gpu/drm/panel/panel-edp.c
>> @@ -1986,6 +1986,7 @@ static const struct edp_panel_entry edp_panels[] = {
>>          EDP_PANEL_ENTRY('A', 'U', 'O', 0x635c, &delay_200_500_e50, "B116XAN06.3"),
>>          EDP_PANEL_ENTRY('A', 'U', 'O', 0x639c, &delay_200_500_e50, "B140HAK02.7"),
>>          EDP_PANEL_ENTRY('A', 'U', 'O', 0x643d, &delay_200_500_e50, "B140HAN06.4"),
>> +       EDP_PANEL_ENTRY('A', 'U', 'O', 0x65a9, &delay_200_500_e50, "B140HAN04.0"),
> 
> I'd assume you don't have a datasheet here and that the timings are a
> bit of a guess. It's nice if you put that in the commit message, but I
> won't block it. Ideally you could reply here and let me know if you
> referred to a datasheet or just made a guess about the timings so if
> the question ever comes up later we can find the conversation based on
> the Link: tag...

I assume this is just based on copy-paste from the lines around this. 
Jasper made this patch, but I assume he doesn't have any docs like that.

I briefly searched for the panel identifier some days ago and didn't 
directly stumble upon a datasheet.

Regards
Luca

> 
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> 
> Pushed to drm-misc-next:
> 
> [1/3] drm/panel-edp: Add AUO B140HAN04.0 panel entry
>        commit: 9125232bc2a5020710db1eadd21973757f740648

