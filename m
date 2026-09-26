Received: from mail-ej2-f42.google.com (mail-ej2-f42.google.com [74.125.228.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76095415B74
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 12:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790424728; cv=none; b=KAAtKt6mWx+iy9ImPJb0LBwhrRkJRloyH8Jy9o5uTMyQefau3w6hZPwCwt20dSIh7ft20FSO6VnTn75XZQBxTTzS7lqpZp9PIalfo/m2zkwdc1bqNlsUn194htzaChooy6WN7ptXWlhPk8Saxl8lJZl+WAwHBr3sNYEOsuboJkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790424728; c=relaxed/simple;
	bh=4b/AkjhNna1R9Uyl4AgeyjsThwIUEKChAEpbm7uJFzY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=J87tqX6ljeaxj+oa7X55rW2pDQ2k0BQG8d74PtLgrqc1DIVpFxTvCXAgARnfLepr4lImseX+noHygvq8zdeY9TZTD6cRQeBzM2fJ2ZNg0FzYQAs+iQEX8mK2HFs0fSAtVPIzfElbTnqMjwWw13cXpxud1XHlpBECyrc8PgR2rcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dKEne2CF; arc=none smtp.client-ip=74.125.228.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dKEne2CF"
Received: by mail-ej2-f42.google.com with SMTP id a640c23a62f3a-c2dbdcb4f59so39324566b.0
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 05:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790424726; x=1791029526; darn=vger.kernel.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gL6yGYanOuXOFUt9EY53ACpJvwH+dAQMRzWl6hM5a5w=;
        b=dKEne2CF4p1WW1W4mmoZRHehjKrPszgzBhubPdal3RyK+PWBq5TUddDjvBUJu5Yudw
         NShk3AUKbAxrxUgRjiJr/zCpsPNECM5+n0vAEXU1ohnpPL4IBskntmgQhm0rY933T3tk
         pjk0wseYRZhavQPVOEyZBm0/5g6RJhTNxhtX3uwPAMyTKKcgFP+PXl1uTn8Ojvl1eUwK
         Ezl79Uulu3ydO9PkU0lbOOhb4s+juMMWQyq+qPkj/sw2tIgSCGsn4LoRDykO3+brQ1TK
         QJWJ4/haAC+EmeDDsSiCbFTh71oQb9ujOYwdkMr6YayM5+B1VeAieFebbtCSeCgorVFF
         NDaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790424726; x=1791029526;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gL6yGYanOuXOFUt9EY53ACpJvwH+dAQMRzWl6hM5a5w=;
        b=amj7S0oPYWoMhWQM1vtZP6hB5Dra1YigcBV48T9U+HUlMoQkq6keFav6QPjDWHosvm
         hzQwmd2wrbLMlFSAO5+Xfq23zAv6gQ3KrogFNL5ztg8kleKY/qvP2Ol5kaDxYjN3+a8z
         mTodVUuO4KqMreAMX1IMSV3IBTit07e5zccfQn7yaVD47P/XibpWMs9cFlJ2AwiQA5qN
         pJ2vk2q4RniOQFjLXyK6az1HCcPpUKrRjLCr+UJxgAzvkvJJgOiHRVa2sqsgMOqb9yi6
         imkAaRwvYizru5i22xqdD7AtnzF67cxloteBOmH+G3sD0+zo5YkmPEIA8hmr1hdLjzTj
         8+sg==
X-Forwarded-Encrypted: i=1; AKwUvBwTamX5tfVzdmvs9GLH/CkJzvVo+vspGL7fWlEvzK4wsPpea3A91qgvNQX0SKTrG8Ejuq9LyWfz0xPNDyg=@vger.kernel.org
X-Gm-Message-State: AFuF++nSN8xENhfMqOeTMgmCi7jXMtZk0TypqqMo8zstWRAUzR0ZvY69
	wzT/6un5pXGYqnIWfbrchKhzBv4xTK19KrAfopfbNbey5m9J0lAf2HTW
X-Gm-Gg: AYBFou0pnkRRNSixO1rIMztE+DfKw6POq5CK5x4M0GlDeJZg04OtnDu0EDgqD2fK806
	YhLfWTpRNEneNutEpZnA/8EYBbGaDYjv6M5g5CUDEQz++i8U8WOrsN/6/w4P7BC6NH9wfbvSg9w
	xAOY3SAHjvnBkXvg2P+b471w5q7JNz3H4Pj6lYvy6iv+6WjQyMCguVwpEktTgUgesQblj7L5RQI
	O56qNQy+oQnahuOYNCn4D7+jHcK9njbEqoc/smyhJhS3sPl0UddHC5v1cFJmjxA920NS5eHyjWu
	GXUUh36thsYidErUA4KB7WDTcwPB463ehoCcv9bjeptVn/82ehuSy1ed6I4hSLoy3QrCt+w0N1w
	dnt8elIFk/4R52WMDH84f3nN9eGVzNaV36mZIkCFderkvte6ijN0ROxnnR2On8+7LCW9BAajB0r
	fMddXX+HDQM4rGvW8LVD0Nzrg+xeagVXKGcp5qM+hra+v0RP2TxmDg9Lr4Epicp/hSAHAq9KGOA
	dax5LHUEXl1Fsnmjdf7UZSmPgw+NmG1+9OVZsnHmWB2
X-Received: by 2002:a17:906:7946:b0:c26:1648:a06b with SMTP id a640c23a62f3a-c2ac2511a13mr683690866b.38.1790424725612;
        Sat, 26 Sep 2026 05:12:05 -0700 (PDT)
Received: from fedora.localnet (81-224-151-184-no600.tbcn.telia.com. [81.224.151.184])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2dbd380646sm49097966b.68.2026.09.26.05.12.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 05:12:03 -0700 (PDT)
From: Erik =?UTF-8?B?SMOla2Fuc3Nvbg==?= <erikhakan@gmail.com>
To: Oleksandr Natalenko <oleksandr@natalenko.name>
Cc: Benjamin Tissoires <bentiss@kernel.org>, Jiri Kosina <jikos@kernel.org>,
 Filipe =?UTF-8?B?TGHDrW5z?= <lains@riseup.net>,
 Bastien Nocera <hadess@hadess.net>, Rafael Passos <rafael@rcpassos.me>,
 =?UTF-8?B?R3LDqWdvaXJl?= Stein <greyxor@protonmail.com>,
 Alexey Zagorodnikov <xglooom@gmail.com>,
 Roman Stingler <roman.stingler@gmail.com>,
 Lovekesh Solanki <lovekeshsolanki00@gmail.com>,
 =?UTF-8?B?S2F0ZcWZaW5hIE1lZHbEm2RvdsOh?= <k8ie@mcld.eu>,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] HID: logitech-hidpp: fix Bolt hi-res wheel handling
Date: Sat, 26 Sep 2026 14:12:01 +0200
Message-ID: <n9DH6GE8RMS3_4u3nLY20A@gmail.com>
In-Reply-To: <n5eDnakzS0uqjND_OMcM0A@natalenko.name>
References:
 <20260922-feature-bolt-fix-v1-0-63b0fa8da0d3@gmail.com>
 <2UD2rmaWS9W0wgq6AdNLxw@gmail.com> <n5eDnakzS0uqjND_OMcM0A@natalenko.name>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Hi!

On Saturday, 26 September 2026 13:39:18 Central European Summer Time Oleksandr 
Natalenko wrote:

> 
> This is touching:
> 
> 0000  00 23 e7 90 c5 8d ff ff 43 01 83 03 01 00 2d 00   .#......C.....-.
> 0010  76 ae b7 6a 00 00 00 00 01 1a 0e 00 00 00 00 00   v..j............
> 0020  14 00 00 00 14 00 00 00 00 00 00 00 00 00 00 00   ................
> 0030  01 00 00 00 00 00 00 00 04 02 00 00 00 00 00 00   ................
> 0040  11 02 13 00 00 00 00 00 00 02 00 00 00 00 00 00   ................
> 0050  00 00 00 00                                       ....
> 
> This is untouching:
> 
> 0000  00 23 e7 90 c5 8d ff ff 43 01 83 03 01 00 2d 00   .#......C.....-.
> 0010  79 ae b7 6a 00 00 00 00 5e c1 05 00 00 00 00 00   y..j....^.......
> 0020  14 00 00 00 14 00 00 00 00 00 00 00 00 00 00 00   ................
> 0030  01 00 00 00 00 00 00 00 04 02 00 00 00 00 00 00   ................
> 0040  11 02 13 00 00 00 00 00 00 00 00 00 00 00 00 00   ................
> 0050  00 00 00 00

Great, thanks! This confirms that touch, but not tap or proximity, comes in on 
HID++ but not at all on native HID.
I don't think evdev has a very good output to map it to though, so maybe I'll 
leave it unmapped for now. BTN_TOUCH combined with some appropriate BTN_TOOL_* 
for denoting thumbwheel would be a semantic fit, but I think there's a risk 
that userspace starts to interpret the device as a touchscreen then, if I 
understand the input event codes documentation correctly:
https://github.com/torvalds/linux/blob/master/Documentation/input/event-codes.rst

By the way, when Thumbwheel Divertion is on, do you get the regular thumbwheel 
scroll events on HID++ too? That would be the 81 (native HID) or 83 (HID++) on 
byte 11 in the hex output :)

Cheers
Erik




