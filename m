Received: from mail-yx1-f97.google.com (mail-yx1-f97.google.com [74.125.224.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC2949A3A1
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 12:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791377668; cv=none; b=u2Hu9TCYdHXNE2B+pZ5hpdbH7f8kFide1Plpk85tfXiKMg0cfltO7Xa/+YI9MPfQCgHJZth7hsyV99QmUbaFd5ihtGnVyBejRtlCB/hDsnJjU7MXs2a/S0oAq4DBZOse03sfJ4tNRZ98vFRciexZ7ezfTWp1FeqDCaYHY3svd3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791377668; c=relaxed/simple;
	bh=vQ5ti0IRpJKxnO/ajOgsAv5J3ZdzP6Vf+7alXOHlJ2U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=npP+yzHNI5rtk+BXxqys9mIC4Zztcgtm7FJPAhAMUfB8sF67l10XtZLH3ICVagh8dEUdQ5B+bGjnr66FgCme4ZfcTsrZF3q3r0wnwaVVTRfJa4TPl2WSK91xlVmWMAFz2COvK3Ezyt2N1oGlp+SjlBUq+jVErSgGHNUEeyMyMiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=RRPuu6+l; arc=none smtp.client-ip=74.125.224.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="RRPuu6+l"
Received: by mail-yx1-f97.google.com with SMTP id 956f58d0204a3-67489c8202cso3932875d50.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 05:54:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791377658; x=1791982458;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=WRr2bOzV+ACM051eiPZmuzY0jHiw8RpNfmmijxyyZ5s=;
        b=LWkgopY7ImRHpGbglkwf5n6jMh4Dig+UPvlQy+SvyIXM8jJEzn167FxE38eYybvPgc
         htDgiL7GrLrscT7aYa4OBOjwGTor7ZraRuSV6i1GhLFa66un2mgM+ze9gBMMQlLx6CrX
         afrZDJntEWx8sC0mtmtQHcqf1Fid24Oveh52r6gMFNOzHicwy1mp+zxnHAfuk89noLQI
         WclH1OuFGs8PusHD1R1zRuioLNSOfFPKbb/DTqHPN1xVbLigHRfmkfq0aUsiaFKVrfH6
         ZjNGk8V/+pgsEHYuyIe/C+Z6Ir7UJskaf3znDrA70ChRG/22z4yE9nUB+1d7Yel/p6at
         ZuWw==
X-Forwarded-Encrypted: i=1; AKwUvBy9viaRTS8jqAdvFv1QGobxH6NHiayiBEziu6fd1Z1I7JrPcr6Q9Sv89yYmrQt9/mzuWokPCIlbvSTIcYE=@vger.kernel.org
X-Gm-Message-State: AFq9FYL8LviKp/sr+M7PTstP+/0o2jUzWDO7X1FRXlDNdEGYwNKaviUz
	SA99jPybQXeodx5QIecAEjqyV25m2eLv8l8D+zaPkcxLK90g/t++W04g9VCuqNhbkcgqFc/8kkF
	+Qy8KcUoAP48Seh1cSohzG3WRP3Xn5CzQe8AHhR+LCf/81iu7IZj7P3dCsSBAYHyLyWvtWdaFwh
	xqTC/uTVxM3QXI3t+uaoBabAUVTkBx4EhKi+H3pYJU1ikuBpPNPvDZq0J3qowaoGjKGkfhhXEzh
	xeKgh0ijRzT4RGKvXKgO3AGHQ==
X-Gm-Gg: AYBFou1pdwjjhHvQ1LepFCKClmK0C0HHI1IGBixEr1Lq3RXWCpAKa1mxVOr3T71Lrp2
	FNWjNW9fS94ZIwC/QHsvJ05ahQhy+K4xGao58+oqZ3w7Kl0giO7bX+W9MhIQHr0GBa1cIA1OjkG
	eOMTJ69Bxz1vSpx1GWueOT2uHjJvwbZSEqkEIhuZ8tTSGflXmodkLakTB3ka4BNTb43X+/XkssD
	4NnWSdQb9YqilZ69kt6YBDI2oMHhR2biX4WUQQ4fzza3uW/vw+1U0QbXkakFPO+nx5ZqsufroyS
	0PxlldmXTLDS/vJrIbwvN2GBl+ajIbRw8ZJjVeUpW3mkLBu/ExhtGEIq5kxfYAkz711JQhK5Rem
	ZxtuDKtzpXiy8g41CcvjmustOdidzKuZoLQhXmwvdBddzTLDdCJrT++ibfvyG7i0+UKoIyq+k5s
	Klwi3V7u1ld6ZDZoe6FL+glGHSkrF5Iow+SD7K4LQ30Q==
X-Received: by 2002:a05:690e:1502:b0:678:fa71:2fe6 with SMTP id 956f58d0204a3-6790a5291a6mr1228684d50.101.1791377658428;
        Wed, 07 Oct 2026 05:54:18 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
        by smtp-relay.gmail.com with ESMTPS id 956f58d0204a3-6791b0c32f2sm814d50.30.2026.10.07.05.54.12
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 07 Oct 2026 05:54:18 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc44d708055so5075702a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 05:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1791377652; x=1791982452; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WRr2bOzV+ACM051eiPZmuzY0jHiw8RpNfmmijxyyZ5s=;
        b=RRPuu6+lLm6I2x6sXOOrNvh1BLc+q5EIBLLmmXx+lD/h9iH79fNTnhWy6F1udM7B4Y
         vLGo6TBGs/902r8fPhs883WYm/II5uXZ3yHbWv+89GDFCMfqkSCGc+TAPvli9EocJPLb
         VR5PnBWs1eANLE7zz+/0g/lVQzf+8ywkIx8us=
X-Forwarded-Encrypted: i=1; AKwUvByLecEH+mVPpZ5nx4C+eiftcUImsbLgGyMV4695GoDnqhYTLvMdzIynjClKCp9bNSfj2O+IGG4IEHpN26U=@vger.kernel.org
X-Received: by 2002:a05:6a21:3990:b0:3dd:85aa:452c with SMTP id adf61e73a8af0-3e134044716mr1756549637.30.1791377651827;
        Wed, 07 Oct 2026 05:54:11 -0700 (PDT)
X-Received: by 2002:a05:6a21:3990:b0:3dd:85aa:452c with SMTP id adf61e73a8af0-3e134044716mr1756535637.30.1791377651379;
        Wed, 07 Oct 2026 05:54:11 -0700 (PDT)
Received: from [10.176.2.78] ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd0a92d5b51sm1411697a12.14.2026.10.07.05.54.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 05:54:10 -0700 (PDT)
Message-ID: <d28a1cfd-1bcc-4319-bbbf-7189a1ff8dc3@broadcom.com>
Date: Wed, 7 Oct 2026 14:54:04 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/13] wifi: brcmfmac: Add BCM4388 support
To: michael.reeves077@gmail.com, Pieter-Paul Giesberts
 <pieterpg@broadcom.com>, "Franky Lin (Zhenhui)" <frankyl@broadcom.com>,
 Mathy Vanhoef <vanhoefm@gmail.com>, Kalle Valo <kvalo@kernel.org>,
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
 brcm80211-dev-list.pdl@broadcom.com, asahi@lists.linux.dev,
 Hector Martin <marcan@marcan.st>, Daniel Berlin <dberlin@dberlin.org>,
 Janne Grunau <j@jannau.net>, linux-kernel@vger.kernel.org,
 Hante Meuleman <meuleman@broadcom.com>, linux-hardening@vger.kernel.org
References: <20260925-brcm4388-submit-v1-0-b5cbc2cde2fb@gmail.com>
Content-Language: en-US
From: Arend van Spriel <arend.vanspriel@broadcom.com>
In-Reply-To: <20260925-brcm4388-submit-v1-0-b5cbc2cde2fb@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 25/09/2026 15:43, Michael Reeves via B4 Relay wrote:
> The Broadcom BCM4388 chipset requires new PCIe initialization and
> firmware interfaces. Add support for these interfaces to brcmfmac to
> enable basic station operation.
> 
> This series adds:
> - Signed firmware loading and mailbox transport
> - Fixes for chip identification and firmware capability matching
> - Versioned scan and join requests, and extended PMK payloads
> - Updated event mask handling

Thanks for this series. It is taking me longer to review the full 
series, but wanted to let you know I am looking at it.

Regards,
Arend
