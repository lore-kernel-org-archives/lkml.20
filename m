Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0E0253E303
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 20:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791921683; cv=none; b=ebgKOTOQpUakTkXKMbqgN0N9dIZW0dYyrsSa0Zi6wYsX082mH/fMN6SThz95TUARuLG/sAxXggQxsl2988ENWWa9gAMX/kHC4nbtK7CK7qxk/7OLpzt/yEndUYc29rPAnBi/sXTtzIKZlBC+ATFxGpeKjr9onF1aEknTe4URPvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791921683; c=relaxed/simple;
	bh=fQVY5chC60ZjBQjDFPKKF/d1XMZEKgL4x/CtPrZ0YQc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GD0lhcusuOBby7u+EGLXHBSdfGBEYwQK2iUKCUEsWFHMfq1/u0B+nh+vfSVxMALUeC4SA+LSiPZGV7VmU4k3eA726V+sMixKuIaVst5vdtKDr7aRz5ljSXLH+VpiX4MlP2xvqF9Qpb5gxWoJKSMm1gTWozfU6GOyHpwine3H4Ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=bHHNblJA; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="bHHNblJA"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7f432ac553fso3843651a34.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1791921679; x=1792526479; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yptnc6KUcr57HmaDPJW3YGRT6JlQRoFG6je5ZFpjWiE=;
        b=bHHNblJAwI9TqaTiC/MFjsd0joApLpBanlzHeO5elCnR6Em9h4aL7Gki6LXOqQUBn4
         HukHeCqAhzWt94MFMYsY/Bk1kxfCWaYFujo+AGDrMPB9B14AJFQMJFcXsh55J9LrWnPN
         xu1tJBrHCaSm3ozS9XlCitZEEPO9GWn+rwM+U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791921679; x=1792526479;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yptnc6KUcr57HmaDPJW3YGRT6JlQRoFG6je5ZFpjWiE=;
        b=sAbtBV8vGa10gtjG58bIFj22ofRxyf+iyPW53xOPzLPfTlhnvvX/uPYaaI38QCUXds
         +6iKBOuAT7cbe/1CVyaLkR+nT3hdLOClDwAk6R3nIDvG8Qg6VPuSbL5g8it0My8p2kCO
         Qjz3Lk1QCeWIvlww3FMJsWry7+aV/JY0cF6kXrv/4h4n6ge6pBlH9wD+W2Hqi2Lwq2q7
         0VrI3YWloJFfXBWlo2pPBexoHTohhYDRTQ9tYYBRf19VGj/KSB5ONfvt5RS1GxYWI0C3
         yevpZ5yWxcd/yrPU0Sbhl9EhvSa0SUJxDBLmBriFQGKcbSVairrNYVxI7XFjJxzwpjzN
         6r5w==
X-Forwarded-Encrypted: i=1; AKwUvByCf3G4rDHImLd1b9MIkVdN7P0GK9bnJyIyT+nyiPNiWiEmn+LwoSxvaxAn4l/+HYeEgwP6mjc5JYSdpxI=@vger.kernel.org
X-Gm-Message-State: AFq9FYK85DXnK1TVr257JfcCiXhdSNPpNNoUBLxaLGKLN9erdi72xlFd
	nqKg3ByxObr3AGGLpEo2cbNHXjVPG+j9nCL0cOGWtJTf8/z2J8ic+x+EQO44pwtgTy7pOGEwm+T
	2HQb2dcg=
X-Gm-Gg: AYBFou3qxU8NoykJBL9Fwp6/9xaiW+SGmUjzv+RETg8Eru+I2xd7jSkCyL/xyKj1l7Q
	7U7ttffRcEXzYORnQs7v7+va/CUcLx/hFdYUFKYqarRV6Lr4/qhK+A1lZh84bIPI0RBHGMxPnpN
	k52YmlYJqfWjWxcgvhyFDrxi9qhLUUQ8TIc2bXhHxoNQcXBtjWwr0XR0XVYSlfLMiTU94FsY/c+
	sY+rr5NifpGl5xGs8EqYxqhY4tLxWjPqyld1JhsQ2UPT4jXSMWcIMrpJa2bq2qrmgMsU9J2Z/IL
	J2GmR08PXCmF+b+eXdLF5PKNQWB9CN7TFtjlwaxrI5a0iDM5L1UswWfB+QSWcfI+KYWFQAQEZuH
	4ZBz8Pk8qEH38WTuSXkonqh/93/bubMysTJjQExtT3wFt1iVbuhMc+HUdsqmCdPjZ5rOMcIuHsB
	UrieXHd9vRE2gdPx/RM9bRJtOSuiNmvvCkkWuFVt2/txXf6zS4B8FprQLGXwGA7HaN6Cv1gKdB8
	PEGKocT1Q==
X-Received: by 2002:a05:6830:680f:b0:81b:ac5b:ea0d with SMTP id 46e09a7af769-83096cc4e39mr13898778a34.19.1791921679468;
        Tue, 13 Oct 2026 13:01:19 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-83039a3dfa1sm13350079a34.18.2026.10.13.13.01.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 13:01:18 -0700 (PDT)
Message-ID: <3c45e083-4e08-4699-adea-1d758baf8d0e@linuxfoundation.org>
Date: Tue, 13 Oct 2026 14:01:14 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: remove Assisted-by reference
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mark Brown <broonie@kernel.org>
Cc: Jori Koolstra <jkoolstra@xs4all.nl>, Kees Cook <kees@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>, Sasha Levin <sashal@kernel.org>,
 corbet@lwn.net, federico.vaga@vaga.pv.it, apw@canonical.com,
 joe@perches.com, workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20261009083137.3-1-sashal@kernel.org>
 <202610122124.08E058768D@keescook>
 <ea3ff257-70e2-43e4-aba7-140e84994872@infradead.org>
 <202610130120.E43D236E@keescook> <as4gLo_6acb_zZu0@daedalus>
 <20261013125559.GG4214@killaraus.ideasonboard.com>
 <7524f3d6-02c0-488c-be76-23de8afc2b76@sirena.org.uk>
 <20261013170744.GA178151@killaraus.ideasonboard.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20261013170744.GA178151@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/13/26 11:07, Laurent Pinchart wrote:
> On Tue, Oct 13, 2026 at 04:18:32PM +0100, Mark Brown wrote:
>> On Tue, Oct 13, 2026 at 02:55:59PM +0200, Laurent Pinchart wrote:
>>
>>> The absence of the tag on a suspicious series offered a low-effort way
>>> for maintainers to push back. What's the proposed low-effort replacement
>>> ?
>>
>> Greg's suggested asking "how did you test this?" or similar, a lot of
>> people just throwing stuff at the wall simply won't respond.
> 
> I've done that too. I still find it better to have multiple tools at my
> disposal, I want to be able to tell people they're expected to disclose
> that the code they submit was generated.

Asking how the fix was found and tested has been helping me. I get silence
or didn't test it and that ends the discussion.

> 
> Maybe Documentation/process/generated-content.rst is enough. As I wrote,
> what matters to me is the disclosure requirement, not the Assisted-by
> tag as such. I'm however concerned that it's even easier for
> contributors to ignore Documentation/process/generated-content.rst than
> the tag.
> 

We could add documentation to call out the need for telling us why the patch
is necessary and how the code was verified in the commit message.

This will save time asking those questions.

thanks,
-- Shuah

