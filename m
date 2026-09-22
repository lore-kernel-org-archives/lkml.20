Received: from mail-pg1-f227.google.com (mail-pg1-f227.google.com [209.85.215.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A6AD5678CB
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 16:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790094084; cv=none; b=WC+ExaxeV/LgSc6Fy5fyAnaozPOuXcjgul2J1oM6BwaCCA/GQVd1Qxzj2cD0Pg4jNJt0fI4lny4XgjGZkog8WfrkT+uB0oOUW1Va3QwWJRKQtfLGOL1ycPrij1MkBhfIuu8FpjbfRXlcABRoqDcjbUK0UzP1tBYt5vkQa0Hbjn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790094084; c=relaxed/simple;
	bh=tJtLQV+bO7Nva/4XSyhPEP2Zi7kZ4Kp6hcrD36xSWPc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fKDsBi/x0Klm8iJ4QYMjYZ7zMNhvIOZluft5xF4zCL3HISY9XNgPG4HX5FNNoHX0wXx72RQwoMcZ8qGgsXkOO4QF6q0oN4JMcaZr4cUHi4gv/7LLdyOpnYZWvwF1/W1355xCvxOns9N4daBQo3zZbpSMsGA2Wf1UMWauOIYuywU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=O+Jifje3; arc=none smtp.client-ip=209.85.215.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="O+Jifje3"
Received: by mail-pg1-f227.google.com with SMTP id 41be03b00d2f7-cc2276e6daeso3132a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 09:21:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790094078; x=1790698878;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=4ojZrMQFLGqpJPvFhPFzqOHSZKQtuJ5kORK38PdRnJk=;
        b=C6Z1nZdzqmDPqttGj1ykYvKPboH71OmI5VnoPJYMrtZKreMLIkpewQTXtbmx+RwbDM
         N48rK0MFQCRsyKvjGG+aJnOfpHqX71AfKk7sWW5It+BM0yTwNuXAt7L2ggp6wFSfJU9C
         psm8OQhIq7weh6vSuv6OjKDvjwqjaDnah48t+YiTiR6DiTt10IDdiAHp0YJ3eHCg2dz9
         TdvoaU9N1CWlrGEfsqT3xvydgN+xxYRGib9sKPi6EdYpCtiqL10lnOEvnfMJ07L3OEff
         pqp799ImVV7Oh0tGIUakH6FABVX+4iwJzI7K+kfg0jOrPdurxMWXbbFD6n6en8oeXy0o
         RfBw==
X-Forwarded-Encrypted: i=1; AKwUvByY+O+k+MrcjMAZK9hAM8AGd4PrJ3IAgT0ncHkgoGSlib6qNNen4+l8NFOLK3oKAEvcM/AOQD8KZP/Lx08=@vger.kernel.org
X-Gm-Message-State: AFuF++nZPDZGOxUCjYkvJWENnfj4M89c+jXzIRyWczYSYn8nl28Ml2gC
	2/+1jW0qa/OrvGLf+1n4BWSyAjOs3j6KlOW6dOoBB6SMymkqC5AyYMfEejmz+L5ciNWIA+R8qXV
	cRYPtActMKUpjHObJPpLWp+6/uXkpDw8lN95+c386KnvH0IDuJhXvlzFLcwKryowKf6gf6gV45Q
	aHRaID1fZqP6br+b+jg3qyw5gxNZvCYOXDMVjQqNfsWYVo4m0OTMqLz4WgTBKlQnF0idh5Z21CM
	T17EB6H6b8bRhdRSg==
X-Gm-Gg: AYBFou08MoF/28LvA3Xo1NvmQZPlS+dS1n1gFaRzVkwf44ZCH4I93rNrkL+w3MOktwD
	rt5bwL7try8uScH+tl8QctljPgJdzVugnisW700VT15I4//hRWslquE8jyZZzPDzMFaKtmXaa3f
	3fFWJyV/IqEq6r7eetv5oANvGjmpFkOe7zWtMrkhgU+8qQB34opla0LH6jeAodx4M+iuAXCcSOQ
	GDRyQPUHMMQUlqy63IyWyLbHdb29B3HzMF3JX6iAr8m+JNPuHEekXe8WPO1dgBb3buSI8Stfegs
	soIgHBAKOC1W27P6cAoIwlKk7oHCDBT+wPW3LIpDK0yS06WX29PlEURzHLGFo363jKv3UNq6MXO
	kO3iXFd8CEp1SrDQSTT/f2Z0ZsN/yFWec7m6BKQuNm3UfuCzp5aEHEemJAMCZRhgv7dQ4QV13kT
	dIRyy/kOAWtIbS+C7DMpMJaU6k9xrgK+BomHl+W4Uq0MHWDRI=
X-Received: by 2002:a05:6a20:9f06:b0:3dd:a00a:7ac4 with SMTP id adf61e73a8af0-3ddec7baaf6mr2280561637.49.1790094077843;
        Tue, 22 Sep 2026 09:21:17 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
        by smtp-relay.gmail.com with ESMTPS id 41be03b00d2f7-cc75697fe8asm986667a12.1.2026.09.22.09.21.17
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 22 Sep 2026 09:21:17 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-672a29ee420so4655014d50.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 09:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1790094076; x=1790698876; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4ojZrMQFLGqpJPvFhPFzqOHSZKQtuJ5kORK38PdRnJk=;
        b=O+Jifje3oNuzjxV0LcjWHN7ivRqsh3BdeEuh6s3pPsRy3fsRNQbtrjMooz6ZdwEOms
         lJ1exFp68eJSauyzt9VGARr/FQ8vf6HDj8q4KBvDFJBAFUr9vc7dbC4vqEreRxrtcbxm
         LPUcg8rCnGpeZV8PtyHj+L2Gin5TDvtPp1xHQ=
X-Forwarded-Encrypted: i=1; AKwUvBybiZY/SehyqFj/b0NMKPXFpwLb9i6LZxLer72QEhD4e4MWXeptfhTwt308pojZCeYE+WYArDzZFfLmm08=@vger.kernel.org
X-Received: by 2002:a05:690e:4386:b0:671:3036:42d8 with SMTP id 956f58d0204a3-672d58078ccmr3241d50.45.1790094074947;
        Tue, 22 Sep 2026 09:21:14 -0700 (PDT)
X-Received: by 2002:a05:690e:4386:b0:671:3036:42d8 with SMTP id 956f58d0204a3-672d58078ccmr3201d50.45.1790094074466;
        Tue, 22 Sep 2026 09:21:14 -0700 (PDT)
Received: from ?IPV6:2600:1700:3f50:2990:1945:ab68:117b:9387? ([2600:1700:3f50:2990:1945:ab68:117b:9387])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-672c75bbe17sm978519d50.5.2026.09.22.09.21.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 09:21:13 -0700 (PDT)
Message-ID: <1e8f8d52-e910-440d-9d02-aaed28c94cfc@broadcom.com>
Date: Tue, 22 Sep 2026 09:21:13 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] MAINTAINERS: add Nicolai Buchwitz as GENET
 maintainer
To: Nicolai Buchwitz <nb@tipi-net.de>, netdev@vger.kernel.org
Cc: Doug Berger <opendmb@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, linux-kernel@vger.kernel.org
References: <20260922073140.1471858-1-nb@tipi-net.de>
Content-Language: en-US
From: Justin Chen <justin.chen@broadcom.com>
In-Reply-To: <20260922073140.1471858-1-nb@tipi-net.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e



On 9/22/2026 12:31 AM, Nicolai Buchwitz wrote:
> I have been contributing to and reviewing the GENET driver for a while
> now. Florian asked if I would like to formalize this commitment, so add
> myself as a maintainer.
> 
> Signed-off-by: Nicolai Buchwitz <nb@tipi-net.de>

Acked-by: Justin Chen <justin.chen@broadcom.com>

Thanks for assisting!

