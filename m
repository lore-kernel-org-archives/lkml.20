Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B65AC560ADC
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 16:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791996236; cv=none; b=j4Sdagivr09nnnbl4TCTJuk6niRYHMFY42WC4bms3t43KDasXd2d7pvmbVBUU9vDz+6Kkgq78vmrnfq+Bjz9tU0yR5ULnHMyN3PrbdFKH5Qlx/a0Ubv9rRHemD2//qDR/CUtLzWiaz66X+7kn03d8WnQAzK9vx/3VpD/D5kl15M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791996236; c=relaxed/simple;
	bh=bMi/DEr46nCBK0Ri82lU6QRjtiZ7lCr+IIP2NY+jCtY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jJ5z3OA2rRPrFYVd6HuWt7W0/pZw2bIxeuaWWEOkpj5+aj0Tua9af41xZveAFS6Fuh0/DyJcsphqhjZK4Wfg9/W8guLtEH9iS87X5SRwLFbkpb3yejkMLGwFg5+0DstDXjRl9C5/QPAuIcNswjF9posOQSlDp2uCRM2pjN/wRrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nHhtqaIW; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nHhtqaIW"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a16bc2278aso31338315e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 09:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791996233; x=1792601033; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3r2lwCTZGF+MXPZOewUY2omgQNLDPCVMfOb7+0VhAMI=;
        b=nHhtqaIWnbvF+Q5Gu7ednVb4dAHoR8yQkAWPl1pvg74E6gWwx7LZLQ3YlsWgIJG+Dy
         6YiS78q2yD3ohd8JblPi/RAJrcjzoAmXpkBy7vHt4lOpmAzO37yaGDjID13Rzlkm0qTc
         zJd5U/7uXx6cVWrbdK4DVJyevKGF4I1KbfPmCEPWkFb0WisXlxnzKrBQHuCUxwNtM22r
         N9sMU045DJpHsq6pJPqise5BT/1S9cQgEt19IRpt/GGbCPvtRes7zOwefC3pcynUiTpE
         2ibXDeM8IZWHZqDrWgrTneUs9wc/ibMQA0ppVGn2RORKunwRyVeE2j1cW6YwHL2rHCXp
         7RDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791996233; x=1792601033;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3r2lwCTZGF+MXPZOewUY2omgQNLDPCVMfOb7+0VhAMI=;
        b=CsF3tQI1JhzNXRlwJN20vmwD0wN3N4tVRFS17zokJHXLVznI1j6+T+q8H4IHQgtFQ8
         Xz8FBbNf3J6y/WVIpCvOHr06iMsTeg4158qBqprb3zZ7yljbu96em/4rEqOhNKRSLcXl
         8B08I6kiyEl1OXHgB1XcmeRZPFxzccDJsW1Y9YxT1YNVWAcnA7K9oaiyrDB5pPX8e7U5
         3GQDPBiDJ0mv+gzQpWInAgAGgUMXN4UcbgPL5SmmT4WvotFFN+f2R6+a7f7s/jyokzAK
         lte+F+F2ocXxCV+FLZwpjrBR6XTzxhOXQBPFTXqrKe7/JikDQlGFUMfxDlNiDLII06ut
         euoA==
X-Forwarded-Encrypted: i=1; AKwUvBzI5m7YOAHTulRC8KA+P3T9MWUshT3Ue/o2jYQuh9480qnuIifdvHyTrxQIHJVKAVmDNPsThxG13Yb3REU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIu0wNbPKLOl2DyVnLTVUJ4pKBcvfapFdJ0dy2RSAdfQHf34kQ/
	LSFzzFJenczZk5fLonWPxabiTFks+Mr2iYIlVNKRBih/OJVGNwuDPtn4
X-Gm-Gg: AYBFou3etk5EeAZrO6I5YrqWBa05J2mArZ88Tzs4v6ghyqkulYgTKtvDgD83DHfHJy7
	pg3d8/d7M7u614V/iRiN1ZHkH6zLexnvvI9kHjhgJDcUQCqZ551ngaNrXe9OjS0QQXS8FwaxEja
	7uwhcerI6iVr38yzeI+lNnX6DYHpLb0XU9maW3Vryu3hU07vhmy1ddP21yAGWj7GxVgFbcRRaGs
	y0BZx6D6BuGACG3dqe11txnvMxIBIkMsV0Ksi2ptGP9JxyQRgFYTyFuq1vEa0r+g7Ce8U/qApOV
	QDjlcXX8aGVqclyrT8dqJvIaNMFCw2wPADYTVTKlib4Cltk7Mt3cQSHnvgZ+ZW8AwOrIruPcqY1
	OCSJqaj3LHWy8pZ7ApWWzZOxyCJDVIDHf0+FXQ8GdayPorkzbjxWoV1okaYy/3VCTBtPxW2A1Qv
	iq6+pkDfLBX9A/sDljra+Rr9QTpbUe40hl737kaVjBHyNSxkJWlki0wgyB9fkjZ+CZVkfPG2e69
	qLSfwFaViuiblBdQecHiT9E65yUUmDVVHWCXBM=
X-Received: by 2002:a05:600c:8b83:b0:4a1:811c:8064 with SMTP id 5b1f17b1804b1-4a18e4d5512mr318233085e9.26.1791996232493;
        Wed, 14 Oct 2026 09:43:52 -0700 (PDT)
Received: from [10.5.0.2] ([187.14.227.28])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd9b381fsm3544945e9.7.2026.10.14.09.43.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 09:43:49 -0700 (PDT)
Message-ID: <6d881c38-33f7-48e0-88d0-4d16170c24e6@gmail.com>
Date: Wed, 14 Oct 2026 10:43:46 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] staging: greybus: replace PTR_ERR() with %pe in error
 messages
To: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>,
 Alex Elder <elder@ieee.org>
Cc: johan@kernel.org, gregkh@linuxfoundation.org, vireshk@kernel.org,
 elder@kernel.org, greybus-dev@lists.linaro.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 outreachy@lists.linux.dev
References: <20261013022402.6322-1-pavankumaryalagada@gmail.com>
 <2fd23f9b-7eab-4afd-aa77-93a5b9ff0c75@ieee.org> <as6mC7sZnpqIKxN6@user>
Content-Language: en-US
From: Jeremy Dean Clifton <gservice341@gmail.com>
In-Reply-To: <as6mC7sZnpqIKxN6@user>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/13/26 3:43 PM, Yalagada Pavan Kumar wrote:
> On Tue, Oct 13, 2026 at 03:11:51PM -0500, Alex Elder wrote:
>> On 10/12/26 9:24 PM, pavankumaryalagada@gmail.com wrote:
>>> From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
>>>
>>> Use %pe to print error pointers directly and display their
>>> error names.
>>>
>>> Keep the other PTR_ERR() call because its return value is
>>> needed for ret.
>>>
>>> Signed-off-by: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
>>
>>
>> Generally I think what you're doing is OK.  It looks
>> like %pe is better than just %d, because it prints
>> the error *name* for the pointer-coded error.
>>
>> But I have two general questions about this effort:
>>
>> - There are other places in the Greybus code (even in
>>    just the staging source files) where this exact same
>>    thing could be done.  Why limit this to "fw-core.c" only?
> 
> I initially limited the change to "fw-core.c" because I was
> focusing on the error messages in that file.
> 
>>
>> - Do you think that all Greybus error messages should be
>>    converted to use %pe (passing ERR_PTR() if necessary)
>>    instead of %d for showing the error number?
> 
> Using %pe prints the error name instead of just the
> error number, which makes the error messages easier
> to understand.
> 
> For example, the current message is:
> 
> 	failed to create download connection (-12)
> 
> with %pe, it becomes:
> 
> 	failed to create download connection (-ENOMEM)
> 
> I think the second message is easier to understand because
> it shows the error name instead of just error number.
> 
> I also found other PTR_ERR() calls in Greybus. some of them
> are used to return error codes and should remain unchanged.
> 
> For example, in fw-core.c:
> 
> 	if (IS_ERR(connection)) {
> 		ret = PTR_ERR(connection);
> 		dev_err(&bundle->dev,
> 			"failed to create management connection (%pe)\n",
> 			connection);
> 		goto err_destroy_connections;
> 	}
> 
> Here, PTR_ERR(connection) is needed to store the error code in ret
> for the error-handling path, while passing connection to %pe makes
> the error message more readable.
> 
>>
>> I think your suggested change is a net positive, but
>> doing it in some spots but not others means it is
>> adding a bit of inconsistency.
> 
> I agree that similar cases elsewhere in Greybus are worth
> checking to keep error reporting consistent. I will look
> at the other Greybus files for cases where using %pe would
> be appropriate.
> 
> Would you prefer me to extend this change to the other
> relevant Greybus files, or keep this patch focused on
> fw-core.c and submit a separate patch for the remaining
> changes?
Also, you could coordinate something with Julia to use Coccinelle for 
this. Using regular expressions, you could programmatically find all the 
places where %pe and connection can be in place of %d or %ld and the 
return from PTR_ERR().

Jeremy Clifton
