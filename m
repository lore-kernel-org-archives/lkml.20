Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A65D43C1D7E
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790153122; cv=none; b=RWpJR/szXZXvKSqTh/2ITFydZ8+0LKOnw7FKKXe+LgDBr38h+Ur9B7mjYo7QTmbKjAmOULfOBxeNYFpT1aj8v9FFuMHh+n24sL+H6HO1wvsNLVX5ebXxwTZUpwX0B/9wLjFwxAee8UUh1zoYa8lRc9Gj/VY/q14QmzWH3yiY1Fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790153122; c=relaxed/simple;
	bh=wyjM0rFWDepE6/qrc49OzW5k6J/z3ungg3fHVUX4/pw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nzdgurZiQ7J19IVcTHaTePQvTEKYZepZL7cJTRzyZM0BpbUlt1LAh+v87EYSDdX3d67Vyzu2MhqWsbUvaeWhNvFu/tbAp24o8fMWDN3O/rNH/qlenxqPvZ5gRhDSz91jVRfncIzLaL7VDw8n+7HKXoq0BFh6qKAVwCnatzGOv8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=iBmwXSJx; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="iBmwXSJx"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49d1fb0cf5eso4315035e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 01:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1790153119; x=1790757919; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Khb/KdpiX+lo91ZKj5PeRaNyRTTDX7UoZyeLg4/ynRg=;
        b=iBmwXSJxFo/e6J1zjkNd7QzXCHEe0YNa+EwHRBo0MNUcYH9z1r3B9N8rY84iFn/STI
         ped+CRMo9C+lPAO4TsahtWzJ++ujsfNcXffAIfGNzq3/tpbnMae7XXJhoV4ljs/dub/S
         +11hEkqfI7hxCYE2e/HlSOxqEvzXGUT5m/m0E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790153119; x=1790757919;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Khb/KdpiX+lo91ZKj5PeRaNyRTTDX7UoZyeLg4/ynRg=;
        b=azJMx5JTj/X8Z/DWEmvsUeimoj1Y5uulSBySH83kC7ehbyIemZq0zsxHbY+9ENbu/W
         x0x8hYai7h3ASSOwfPVPOqG2r2tSCvSwN2Pqdq5Bh+byQhJC2KzjIglxo1W7yjjAkV5T
         /mOmgYpl6fJe9umcBNXf10OgvrSMXCMTw3zass6UFJMjeYQe5IhVWLwMF9LKFkDaR+iJ
         b1S+k2vKduolW5exJTZu/6zxQeUCjoZXqrvfBgQBxWQpygK5qHtUCejo5Kzfusi8Ddd0
         faAOOcS4S+xRKlxYwDf4k5o/kIMwUav2PAE017ugKUQUItqNxinh3QXW/8iEWjnu6KBX
         +KPg==
X-Forwarded-Encrypted: i=1; AKwUvByfDDakMjCeolMehRBfHgAmZ1vHI2Kfy1lfg8SoRJ79ofv+wPxioTnsvG8saFFbUwgF2/4Vdd6i+0rf8E4=@vger.kernel.org
X-Gm-Message-State: AFuF++mrWk8Bjk7jWXHA3AUQ6jaNb0rzZR6B//Bhkvs4nAaxCMeQuBWc
	CCnuDeK9haOwSuIPHuVBr/elk1IhISEtHZwZlUTuvGILhQg0O+gc32IfKuP0Pcmx5UQ=
X-Gm-Gg: AYBFou0Q7thREODayVti64tfmuwxc2rVwOgoxnCsXio/8OdNsSyQplzlVlfeyppaABb
	yJeh0OP6DBL3BkXVQDQYBkzT/9MVecQB1pRG5KNsgW/lhwV7heK3bYarkSqhqKgNmvxbIAem4/3
	J2lwIeNXQI6T9ncFL3a15gKLzoCU4U0j8sGqH7GU/khxaArtwBL0aIWsCfl3j0vUebHDlceCShu
	UPEbrGxP7RRE+uNDiIKtIme875GVMXzohSrVNuPSr+XtrP/eTVUpz6X4dPIPFdBVBDaB4YzSDIF
	jIyxHahkaeqcgoSAs0tGgdoWp8tS9H0QziRVJ0ivxMaZQovWDghUdPNnUWF+esQsDsBfG++caee
	DYayCSX46qLQzNFKZMWaQfVlV+gHvn8GrCQw1vB24Wl8e2D8izPnh9IbFSlajmy/dNM6UitbknN
	3a4jJOd/ME6FwzEDXk9bVvLJ6+PPQUyEZMOsTDX5xgYt8gMEB+EnGzlFDJXfybnMYlhEs35kQ5A
	Qlv9g==
X-Received: by 2002:a05:600c:3b9c:b0:49f:bd3c:bc1a with SMTP id 5b1f17b1804b1-49fdf137212mr27274715e9.21.1790153118894;
        Wed, 23 Sep 2026 01:45:18 -0700 (PDT)
Received: from [10.214.128.75] ([149.7.5.83])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde185329sm61475125e9.1.2026.09.23.01.45.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 01:45:18 -0700 (PDT)
Message-ID: <96eedd54-7d2d-49a8-97a4-44342460c9fc@linuxfoundation.org>
Date: Wed, 23 Sep 2026 02:44:58 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7] usbip: make remote list honor parsable output
To: Jason Colapietro <jasoncola1@gmail.com>, shuah@kernel.org,
 valentina.manea.m@gmail.com
Cc: greg@kroah.com, i@zenithal.me, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <CA+Z0x2JTGOsnu7gNPWBfxCZD0vesbezJ7-yhT1sOOuUdmdcQRQ@mail.gmail.com>
 <CA+Z0x2+wLqeT84WGYsWQ1bPu1mz_A72_Ka3vv9u6RHdtQvc_Xg@mail.gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <CA+Z0x2+wLqeT84WGYsWQ1bPu1mz_A72_Ka3vv9u6RHdtQvc_Xg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/14/26 11:43, Jason Colapietro wrote:
> Hi all,
> 
> Friendly ping on v7, sent September 7. The code remains identical to
> v6; v7 only corrected the Assisted-by trailer format. Please let me
> know if any further changes or native Linux/USB-IP testing would help
> move this forward.
> 

Sorry. It is important to test end to end on a Linux machine to verify
patches. I can't accept patches that aren't tested on macOS - it just
doesn't make sense to do so.

thanks,
-- Shuah
