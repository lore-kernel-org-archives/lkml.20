Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17FBE490BF4
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 12:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788352834; cv=none; b=XCb7iD4qABpZQS0AMtz2K2lPWJGEYtb+jhcRictRX/Ph8b5ZXf1IrI+0np5fqgc5KSwMGqBnGi1iYKF6tkr/4zwevE1CuXXfs/qKqE5v4hvFDPwRfM4SHusyqiou15aMpE5nOuNBylpMYQ7MoGxkzUnn+UL47CgyN1IG6izFzuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788352834; c=relaxed/simple;
	bh=/0FlnvMgf8ucFbML07sLt62uDSw38M/o6+5iK1tany0=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=YOAUT7bIhQYT8iqwlzAX8sGkzg4ZAKnRrZBeNH2UuGF7fPhv94mDcvcG031lkHHaCuX9895/yu3czOGr86BvcH5iC/NVAM8obvWNYj4z/PQbPJuJfQkfjtn7zBzcgjDM36UaIcDTRFyovFZsYHVmk0W7haADgc6tNNG8Zxt+Ihs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X8tcQlrv; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X8tcQlrv"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2d032846c95so12045805ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 05:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788352832; x=1788957632; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=pN9+CUjHm3nUnn6kbT0jqG6pViZcVeuyzSfqXWpIynU=;
        b=X8tcQlrvM9VYKg+8vg1Pd3+KTZAlBBJliu/95LwtfaAWuURqy8ZDzYr3ZyOuqcjLNB
         w6KqEEAkkg6RSaMN14rtt5ceWFTKLOsFjgmySje7tkLlcNfP+pU4RB/YxkAznf4t3qjA
         Pg6xUkgqN3RKVVrGE5PrBaJP/dCOcicoEc5nVycDJxvSd+G0kbW6huRpT1taiEgBadEQ
         GvVfciEp/yOhLAliZno7kQJ26Apa69fGl8AfwyefFe4xrZ2gvzoK3U3F8Zbgg9w8kEp4
         1C2fAgY3VeeNcJuKv6NmpmnvefgrKFSOTJqxmv38q+367zBfQvs/VbrvmZBcCsYOjeGg
         6jcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788352832; x=1788957632;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pN9+CUjHm3nUnn6kbT0jqG6pViZcVeuyzSfqXWpIynU=;
        b=K3fHLEVboVoTXr7qyfa31iPpEx68zYdK3jsD7WGdTwuOfRy1sK0Lu9RA4zDzjbjrUk
         VEZZD+bD0HvOCzn2VKzW1u7aul3FHNeev1HquO0/Ceo+3LRzhcWxOUvWms7S84UOpIB2
         it5SqKmqmWoj/qzHt/j43FmmAigoPxYVO66xQfQHisbOKg1IIUoNAkcp8CUSg3ix5nYW
         vGEKEBdN3gtknsKRpudDM9C0lZ6XoSrfNvlZ1gFVDHaP5jcrXfpefrKtmWVrNy3s6x9s
         T04pdEeYnrNsrEv9Y8E9Un4hT6pTRf0WKAnVzqY4d4r1ndgCePOHIyiLoBs1QjHsdVlY
         uKIg==
X-Forwarded-Encrypted: i=1; AKwUvBx7pXCai9kUc0/wvyXlUZQlwwyGpMTIawQ3Bde9bmSuAsJramWIT8Lo8hfrX2iR/3ff23na4KETYH+alRs=@vger.kernel.org
X-Gm-Message-State: AFuF++kJVUIsRTL5Dhg2c7m+ml8/IZHVxlGCaIIp69xH5SbkSvCKpEJs
	319MUHvSDOHkPWphiqe6YcWYm0bMSVAPfk5wNDavP/qtBAj5eu5jkyOu
X-Gm-Gg: AYBFou1IXukxWm9DpzX9CYKncGoWC9mNAWIfe3DoDf8RUaIwqhaQCli8BrzxcORG1XQ
	QDzbT4+9F5Tu3/Ub+H4aIGp8XhjhJSIr/5tDaTRhywAm6/1sG7hzupl3Dx4dCpZmGFpjefVqDPr
	Zfk6M5MFgsK3UgHN2xYS7UQYoh333NOqPaDPuLo1gOeTX3N5dcF/ldhd8evEPUSwKAr9k+x8yRP
	HV/L/rPzWBdupqlfVu+sviDNXxcpaQYGdscJz5NoQpXs0F/rCzoPU23mv7quBb4PrK4aA4wHoZZ
	e97/hleuqLvS3td/ZLxmeobEIKh2rpx2CdAsfH+/aXelGRcxxga7IsGfS8oy+69dliThYt4KC1M
	xkyaJhbIOE2nuWlTSP4wvqVmBRvJf2oziC+aFF3pkjqrEEbWbMvz4c8FjtfEEKTU1EmJEROwGTV
	IaWzdOz6dySD1kb/oIsFtSxlEDj4uLPuGZip5ZX7h95PJaqWL700MD26SJ2OUB/kM5BVfbjXqOQ
	UawuVJhJX+V7Agj23I+KocfHkNvR5B4zosXdcjMoH71KaptOr5vxzau7wGbHo3e9+g4XAQ=
X-Received: by 2002:a17:90b:3d84:b0:392:ca3b:370a with SMTP id 98e67ed59e1d1-39aedf7cc2cmr7542665a91.2.1788352832210;
        Wed, 02 Sep 2026 05:40:32 -0700 (PDT)
Received: from ehlo.thunderbird.net (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1430eb4854csm6767338c88.15.2026.09.02.05.40.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 05:40:29 -0700 (PDT)
Date: Wed, 02 Sep 2026 05:40:25 -0700
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Aditya <mradityadash@gmail.com>
CC: Benjamin Tissoires <bentiss@kernel.org>, Jiri Kosina <jikos@kernel.org>,
 Mark Pearson <mpearson-lenovo@squebb.ca>, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v3_5/7=5D_HID=3A_hid-lenovo-go?=
 =?US-ASCII?Q?=3A_normalize_calibration_failure_status?=
User-Agent: Thunderbird for Android
In-Reply-To: <CAH7J6R-Vh7uEtG=+Shj0CVgxm1RNpuxjuEmNfLJevhTmCz_3Cg@mail.gmail.com>
References: <cover.1788222001.git.mradityadash@gmail.com> <49b6e07395d2fe555e844758bd8ccf34ac0cbf0c.1788222001.git.mradityadash@gmail.com> <CAFqHKT=7xMJAvTt3__6CtBiS2duGu6eoHq4FWiGONMvjFE2CtA@mail.gmail.com> <CAH7J6R-Vh7uEtG=+Shj0CVgxm1RNpuxjuEmNfLJevhTmCz_3Cg@mail.gmail.com>
Message-ID: <205C547F-BF6B-43D3-A8F0-829B657167EC@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On September 1, 2026 10:06:18 AM PDT, Aditya <mradityadash@gmail=2Ecom> wro=
te:
>Hi Derek,
>
>Just to clarify, this behaviour was seen when sending a left
>calibration joystick stop command when no calibration was
>being performed=2E
>
>Sending a respective start command returns after 10 seconds
>with the error codes you have provided=2E
>
>Here are the exact requests and responses=2E Consider ellipsis
>to mean that the rest of it is zeros:
>
>Left joystick calibration start:
>Request:
>    05 00 0c 04 03 01 =2E=2E=2E
>Response (after 10s, no movement):
>    04 00 a0 02 03 02 02 07 =2E=2E=2E
This makes it look like the reason code is a bitmask rather than a specifi=
c value=2E Probably more difficult to present in sysfs than the value it pr=
ovides=2E=20

> Left joystick calibration stop (when no calibration is running):
>Request:
>    05 00 0c 04 03 02 =2E=2E=2E
>Response (this is near immediate):
>    04 00 a0 02 03 02 08 00 =2E=2E=2E

Interesting=2E This wouldn't be the first time documentation was incomplet=
e or inaccurate from Lenovo so I'm not super surprised=2E We can then consi=
der a 0x08 response on the status byte as stopped with no call running, vic=
e failed, if you think that information is relevant to the end user=2E I th=
ink it might be=2E If you stop it with a cal running is there a meaningful =
difference in the response?=20

Thanks,=20
Derek

>Thanks,
>Aditya

