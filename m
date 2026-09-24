Received: from mail-vs2-f43.google.com (mail-vs2-f43.google.com [74.125.227.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59E694ADD80
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 20:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790283478; cv=none; b=mhlMhST678ZYzUGyTMDihW9JCmsR/o92KQExWJX19eJLU9VPwKD4PRUDjgwE8Dz4awpOTuHn+w/hzdT1g91zQDYo6RKhLRsagt1JpG8OWLZaH0xTdrss3JfzUDXf9wYJ1+w1I6FlApsHF0MC7h+XYUZzUAiw3zD243xkH0t59Rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790283478; c=relaxed/simple;
	bh=cI6JjRAPl5s3hwiM9J/azCfPvw76HMtUKiwS7d7bH2Y=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=auJCdqxuyES0mUHzHBwDixboDK8omD6En2rHZ942OYkIVCf/2NUARGws9c3L5oCWYOsfMGu/343g64t9SsyjjuxAR1eTiz2r3XrBLkYUfjh8h9Rr+Uewi/C9jfGZ5Kh+zDvDRnHSufinzBwTjp/GAnXhy8dJIVVLe+GiR7To79w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca; spf=pass smtp.mailfrom=marek.ca; dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b=CuUwyyiS; arc=none smtp.client-ip=74.125.227.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marek.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b="CuUwyyiS"
Received: by mail-vs2-f43.google.com with SMTP id ada2fe7eead31-7856441f7dcso105471137.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 13:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek.ca; s=google; t=1790283476; x=1790888276; darn=vger.kernel.org;
        h=content-transfer-encoding:content-language:content-type:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xrph7KLghv0DUb1CsXQcyrZfkEtJln0bzCnCNAimfOg=;
        b=CuUwyyiSXh2N9oCbTmFURDYhw3HRscbSuIzhTgPmvHY9/hwpORY0Rlo8knQt3hHdhZ
         jSIi7z7vV+5xIu04WmqHyZuep8NZE4B4iO86OMrjfouz+iSX/bazFyhNDe0/VJL8KcQF
         sfzH4Raq2HQUR+L6q2ZEVaC8j2XkDy2C7PPo0deAbOfrGtq77jRA8VPI5FeAG219doAg
         fvsjcOlibngbGgy8R6hu1vaOtTXDdbeuN6TkCNQfXElt8V/WJA46Ah8GKmiuraG8022u
         TPn3jNUDOV34GjnJ41+AUbD56zFKcu3Lc1Lj+hUqL8uOPagPKdwSl0ViLeytz1rn+uCL
         U67Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790283476; x=1790888276;
        h=content-transfer-encoding:content-language:content-type:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xrph7KLghv0DUb1CsXQcyrZfkEtJln0bzCnCNAimfOg=;
        b=qERj0hedL3owirhMySnTYWsG7FCUg4ctPNbQrRYGoTkMA+R9eI4RxWgAEEl6wKQywX
         O4pbohaBxZuPUnre9YItGZ/6/PPc3aqcloo7aGv65pXWUiIcQYYvHvPgEKNDUUr3QQMi
         L0EebiG1mURSLTK4LQ1MqhN9h61xkXz9bPX1bV87ZVftsJ6Igg1Y4bzo/9CI918zMeTY
         3wy7TQsq/xHUVIDQIUaVyReqH+CX2pDbrpwXPfESJRj0qr4U6CUl5AkGJ0svrgQu015Y
         aoj/bRyvnk2iA27rk9wCpPJmBoDJ/jKDoKddJG8H4wmF1sSh0MPvgc7HTkP22M2T9b9u
         aVww==
X-Forwarded-Encrypted: i=1; AKwUvBzYZysbeBtoO4KmefmepgihBufR09kBbqvaCEHqsGjuKtaPk/3mBee0GMVE40+hUJKamFsKJh+WpgUg0FI=@vger.kernel.org
X-Gm-Message-State: AFuF++mCk9jTScww998o5XuCMRneeDDGxjocUyQLy6VdqUe/RiHqDeMR
	85R5fqQgwbZTZSVVVy+ta4axiJgNOIUsDbpMxUdCNDCz7668aNAAwzjEDf4kkQBE0NCdUxiKPow
	xCaTV
X-Gm-Gg: AYBFou1JKzCJBKSguSfdEQgxl7r/3UxgYmIa9EOBdl3B2clysSMbMrnsLX9mEwScIlD
	R9jRzEX5xpXSyT2/zBwycLNn+NNjgyIJgJpK3HJ4IFZXhqoxo5O6YXyhGXXV8wx6r+Rdf462NTb
	qGNw3oB55WqyZo+Qv1VY7hFC+igcK0Tnvh1xc6JQqxkqmHpi4DZXTeJI6qEXldaUU0hl8M3bPOr
	o0Sqmy0mgK8ouNGeAO4Xj5y9v/khLejVHzfIGgmHDF7Tv7RmcABpT/88brHNGLVy9zkMKXNykj1
	qcUt5gFRNyzPiR1H1OjiAMnEUKzEvmdNRBW1AuMiSezGbtjxoIikCKsm1tugSeC6LFcJH6I+chF
	607EcJTd3uBaH/KnU3N1Lk7aI+MXzk+WNM5UBBdH9fB/lLZ+hdtErMUHrvfYW7YIDZrYoJH3L2x
	cRlUorHWYp50Hqwcjtl/06cFVaTx6UXxw8Se20/TtY2F/Vird7kqStHtqDQT0elWYA2wNJdggDJ
	6GRHqawRjeYzOBizAHaWlv5SaRnsbh0esYQskA6rosg
X-Received: by 2002:a05:6102:441e:b0:7a6:a24e:811f with SMTP id ada2fe7eead31-7af1c79966cmr2103036137.7.1790283476089;
        Thu, 24 Sep 2026 13:57:56 -0700 (PDT)
Received: from [192.168.0.189] (modemcable125.110-19-135.mc.videotron.ca. [135.19.110.125])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5cc65d664a6sm647405e0c.15.2026.09.24.13.57.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 13:57:55 -0700 (PDT)
Subject: Re: [PATCH] ASoC: codecs: lpass-wsa-macro: rewrite the interpolator
 volume after enabling clocks
To: Liviu Nicoara <lnicoara@thinkoid.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Johan Hovold <johan@kernel.org>,
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260924125940.22665-1-lnicoara@thinkoid.org>
 <54f8af3d-a01c-d1fb-36b4-7eac71174f92@marek.ca>
 <CAAhq3a6OV6+Z0p=qVqpUiL-QoP92fYTsf5MBQL-f2oedddW=Dg@mail.gmail.com>
From: Jonathan Marek <jonathan@marek.ca>
Message-ID: <d617c7b0-e6e3-bcc0-7ea9-5b955bc367bf@marek.ca>
Date: Thu, 24 Sep 2026 16:52:42 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CAAhq3a6OV6+Z0p=qVqpUiL-QoP92fYTsf5MBQL-f2oedddW=Dg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 9/24/26 3:52 PM, Liviu Nicoara wrote:> However, on my unpatched 
driver an idle volume change did not take place
> when playback starts (changed it from 69 to 81 and it played at 69). A
> change done during playback though, takes effect at once. I don't think
> anything writes the register in between.

in this case, while its playing with the wrong volume, use /dev/mem to 
directly read the value of the volume register and then write the same 
value, if that fixes the volume from 69 to 81, then this patch might be 
necessary, otherwise its papering over the issue like I wrote
