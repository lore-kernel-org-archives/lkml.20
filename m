Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792569690;
	b=Gb/GfYOqZQ3yzGgZVH5nFX/35+akpqG1gn4WJgnhRKq90/J3U/+UBy2bUkqdxx3VVLHD
	 vwxZpkNhCJJgL3zQL0wSPgbOYXO9EUx+638fkYjIgxbHGwaAdLfxtao7UYctJlbupPmhn
	 IFVTDI4d6b5cuW1cAdAnfwC+XIXE2WNP2CSvbOiHx1oN6KOaBGdnBWd9F1xFP1g1vnZrc
	 KFjNa3MVRVD42nY3154yEFegPavBP5wuUc+5aiV8tlyehtiOPj7OMTDLAlSX/pGo5f5u7
	 +m2c62Q0ayGJeMXirgrb7diQehbym1kZzOyNeFY7LMjQ8yqgTqW8Zdx87LHLZCVWcLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792569690;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=8JsivEzCfsBUsKB7VniSyajrogrywUv+aAjVG1xwA/k=;
	b=SweP1eDvfOuadVahR+yuxLQ/sKtFz29CML3Jt+J9bUrKuyHDFK4b2280gzxHmNXxd//v
	 CGbF8x7o+FoOCILlplIqo9xyj5nhQzvFHTXyZDlmE0EKcM/E79un2BpOQp4QFIre4Z1c4
	 k1npQ/lvwFKhttR9vYqDOWxh6ySxLb2nYC+C+yQ2Gc5cXAy6trpL1/FrradQWAGvRfmgh
	 AGTAo7ROLziYllrfp1CYCzqf+AVlLKqErTykk8eWfKsve/l6Mo+LpzMCn8JXRHMuFz2qp
	 dx5+htiH/BFx5yKxuryN7MWjVQ2mZfZA3VVJvnq8FUsTrSVS06rObY7u8S6UknCKXyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=PNQ8gbLw;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C236C606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:01:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C236C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=PNQ8gbLw
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48dc202a60eso154516f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 01:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1792569688; x=1793174488; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8JsivEzCfsBUsKB7VniSyajrogrywUv+aAjVG1xwA/k=;
        b=PNQ8gbLwhnN3xwijAEbY/MjJSOHfENlfsgK0sFWXmepdRB8kYoa9HWXzPjsMpOhvED
         VDrA3wiG0qOAFhoB2xbc7WhJQvPnfxbf+evFAsf4S9myLySRFtcIpfJlgN1U73OlEwir
         8Jn0IDENmxCNMB/M1o/HkAH7nPEDz5s1y2PT6x0q3C6gIxpCVks01c4GKW13Y+TONoRe
         BWrN0zg87NHSuzMHuHLDVkhBGTUuGykI6q5sHCJT/QBtHEw+qzWElqUpLFgMSOY7WFGc
         Cl7/k6id3HxKUn0tl11J8ImyvuwyXWFu7dsm5BRCyR9W5pNu722sAyWeWnvlZcYlSj+s
         HtcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792569688; x=1793174488;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8JsivEzCfsBUsKB7VniSyajrogrywUv+aAjVG1xwA/k=;
        b=hyCQL+zdSHzhF+FBEJHgK+y5pX/GwGGGp2YUPMLZ/KO/joXKy7aGHMP5sQGOtRHK06
         DgVku3129uIeZ3J6ZDn9u/ryglsFGk1N/SN9K4nZEml8SzvcUzYcuIf5zxjhIQ2jULSj
         7NWyFWQ6T7NrZeAXG054G8vet2FEaaI6/ii1aEpM1TaYVk6F5u5m9RD06DZrs5xVlBQI
         otzGUCsQErksgFU3140QLyF9h2VwQ69DA6nDY+XtT+EtspndPR16S+uN+JyW0LUjugIw
         8+4x8sh1oR8Jr/FXJ+167S/twU41gex9esr+TE8Xq4JGfmsWNbl6UT41+Mqm0MkLaA0O
         6SbA==
X-Forwarded-Encrypted: i=1; AKwUvBwuyRFgl28KWZnZfllLfkRFQO17Bohvw8+H/BS5AEEY569XLyMzzA3H6xqFKnllSRXrilDf0bZ/72s+cMg=@vger.kernel.org
X-Gm-Message-State: AFq9FYK8Tw2YkxRDki9tyAb+Guj1w5G+s9OCyOibpx9hatkzX71Tsrbf
	mK/f/F0TL/nBAmIyryF85k5FKToh0YBjSHDtspJ2Y7sv3odteni/IeG3CcSiQ/K3mmc=
X-Gm-Gg: AYBFou1kaYKGFWIbDivtJXpdAD0PH61RCLntiZSlnrYMnrEwjxlu8suAzlEuH1MkjgH
	0ylkfTVwFE84z6dl0Lh+FJn/VhjIQ1gL69luZdmmODUYZVrhZlo8VQ7Yqula7GfreoBtGlemXsx
	jDlv/QHx5vcuK3c/9t5GqTRIEE6us92p5JicQKVqaSgFGHER96lc79ae19Xdn2vcMJGkG8zypM9
	L7NSGSJ0tsdmyql7LeZXe4uHilgjeV8ZBSCYXs3sBFgW1RtErUB/EgQbvJUbkcZ/T5gZrtnsbVV
	sssoG1ObUkUSj0LXDMyLr/KTUvUWmoXgiWxyc/jypKtX0ilYK7LaXHjl5oPiawPc2nI8AtPxflF
	z2ghuz4cPI2YptD4uQN4Ur+XZ/AzPDrKvcmGPwtlWRXeuc7JfMgvPEEz6grcQZhCpYbfYQ1Rpe3
	wLQaefzGuXjGcvfpuw8qhiyxf7RAfc5BFFzlZnNsZGGu0AxZFHMz6udGAwqZPLKBJ+zcgCz/Vff
	nq9SNAd1iNyudJyMHt9CHngMVMGu121l5ugS3bdhxOU7N4mnyydZ5jkJsiMDLPi0xw/zimPsRuV
	71TDL+yCmBzZepIEoA==
X-Received: by 2002:a5d:5f42:0:b0:48d:f996:1814 with SMTP id ffacd0b85a97d-48e264fb916mr2431823f8f.57.1792569686595;
        Wed, 21 Oct 2026 01:01:26 -0700 (PDT)
Received: from ?IPV6:2a02:3033:701:244:19c9:79b9:fe6b:6f9? ([2a02:3033:701:244:19c9:79b9:fe6b:6f9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2582a53fsm3980308f8f.32.2026.10.21.01.01.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 01:01:25 -0700 (PDT)
Message-ID: <f86ca4e0-b294-42cb-b51a-d9e9984544ef@suse.com>
Date: Wed, 21 Oct 2026 10:01:24 +0200
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
Subject: Re: [PATCH] usb: core: Emit KOBJ_CHANGE on unbound interface
To: Fabien Sanglard <sanglardf@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <b7c2f7d1-40fd-4d83-8ced-5fc27e3be051@rowland.harvard.edu>
 <20261012171609.88273-1-sanglardf@google.com>
 <b819ff38-6916-40e0-b2f3-1b19876971bd@suse.com>
 <CAA92w6=OhNYXF_kQFV4tPKa19xdWRkdQbFXaqhdxfqW4N9zMVg@mail.gmail.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <CAA92w6=OhNYXF_kQFV4tPKa19xdWRkdQbFXaqhdxfqW4N9zMVg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Good morning,

On 13.10.26 18:48, Fabien Sanglard wrote:

> That said, unifying the behavior upon reset would be elegant. My main
> concern is whether some existing udev rules or netlink listeners in
> user space might break if we generalize this behavior and start
> emitting unexpected CHANGE events for interfaces that successfully
> rebound (which already emit UNBIND -> BIND).

On a generic note, it seems to me that you are concerned about
an unavoidable case. You can check whether an interface is
unclaimed. Yet you have no way to ensure that the result of
your check is still current and thus valid, at time you act
upon it.

In other words, you were about to design an interface that is
inherently racy. That is not a good idea.
If you really, really need to avoid it, you'd have to define
a new type of event.

	Regards
		Oliver

