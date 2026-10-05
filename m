Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE15497B8D
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 14:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791209386; cv=none; b=jc/cwRhbOjBR02s02HsQ8ypkeGJYYMDlaDXupNrtAbQiZDxBKVabR2cR4K9R4VIZDWOxhncT7efCs+MbKZyCT6qrXMznBz9K0KMHZ5rZw0ckeStqqUlU2ODbT9MzU6cTHll1tSQspXpMZnYtnLbZB8kvvwPDEaVtmmwNWQxxpVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791209386; c=relaxed/simple;
	bh=0y2EFnWLqY4sRDLWt+zvNH4eikkE6qZYmGsErTpNqf0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nMqY6hf/7TrMBZ+fc/NMu1/2/G4fc8iDS2OfMs70uzMRxF93xdRIubMVBspBFi8yDbfWJVVnL0tjSnA9X3rNeb7t6PBxvhPPRq0jcjtrLUpglOYdAOKc2M0cJZCT3/5g/J3+7C9NzS3c5oMxYd24K2oWHQKDngNSDGSRSdVxge0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=bllkZWF1; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="bllkZWF1"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-4a1722c37c9so8126485e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 07:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1791209383; x=1791814183; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vq5Hi5+WboGt8dWZLLlgdEJdIoq3FZnGz5TdS8VWTXc=;
        b=bllkZWF1Q9P0E6hnc3R/KFYN0STv2ATrYZLCGS88JHqNx1xhfV/f5/tzQV9dCZ6DOG
         p5Dg+THuJlmyIZqwNBNk6qvxPizSXhwBUCzHaqi+VTsJBlVEmaHp55Xxk1NV/aWeqB4G
         iu9sr1Qnsf+RnusYk0ALSN9ON8yn7u6zQh/uMRx/u2YKT3zHqdgHpAtJCV+2aOIuHo9K
         3vWUQNeIITexRGXGl71uluiUblb2fUkNLpviL73wQNMDa2tp2ltEXIAsHh9wfMiuDQc2
         w6FflQXxeYSBRlLkoMRLuYJ2rlZAb8j9esSHn3cF20Fz0603tySabRVjoB8PBUyuuYAL
         6M6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791209383; x=1791814183;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vq5Hi5+WboGt8dWZLLlgdEJdIoq3FZnGz5TdS8VWTXc=;
        b=wUyIK6PgaDRCVLH7gWNb0utJdmhURC/Nn/OSQ2YEtekkXkgP3VtZ9in4gOV9PlFFWq
         HheSXtHBdf13UHpsFnDHKFh5cEQo3irvLFkkE3r0t09vtHByXRFIJJHHpHQEuAoV03Jb
         1U9It5pG5Ne9G0MOo5eUAcx1FmP8fwpO0lImaX9MkFlj2gmmrmj/z7hmWZdxxZtExLZT
         9QmWGspO4ne4AwvcYqbpAb6mzC6TeWKtXSUYunNSYgysFvEF0CadW5tWZATFa1cn3l+U
         QbV/HrCFENfQB8CP6BhjCFIONszkFPtlB9C6aDzoOSnSG7WFogMxUnW9sTlScr3m9qYA
         tYew==
X-Forwarded-Encrypted: i=1; AKwUvBzsKmdCrbj6x+pgvxuaC/UWNdbRpv9jF7k9tx9xrqXOIshZXFLrbfe2I9HOdezVqJmWdAzGgLKmYrWiryc=@vger.kernel.org
X-Gm-Message-State: AFuF++kqEWKM4NS5bBA45BcjwNYPTDnpvsA/YqXAYngEh8OWpq0ntGOz
	Ek0/aGLWaPP2GgzLRpG9liMu+KPxgPXfSH8Y1HED6sZ4n+RADOy3IDkhSiKgsuAs8mzX/Vubet+
	PP/J6
X-Gm-Gg: AYBFou0k83uAobzq59RLDfobDyRZujXz7erwumyT9/Cs0R9oTSe+7qBpGlg9otXXaJb
	3uBfEsesk+GjlHfe535XTfSFiLHUtQTaWSdKGyaT3MQXR4+U0yr6MQYG+dbW7ARDAF1lbHB4oM+
	xwJf1AL5rRsRK9qCmNT+efOGqSBVuGYUfj/J8F+bKoOv0spYc/cf9aEwu6yCEI1FbtMQAbT8qlv
	iAwj3do1deahOqOI4ej0xyiRa/72mXQyYwmnIsB+465+HRrv799vB0Pvw9smjlgUVwOM/C3h7T3
	dDY8PXwKuki/4wXd/pqoEamDUjB8kZEEdATqUdmdraXBqI04rd3/sYsxyF0ZXjIm3qJjvNTDUpZ
	CIeHErlUHHcgPHqMxYD/DdVB97KfeS5j/O+WNeyH/O0Sx8M5KW5o9kqDIIoEFAu285SrcFdoA75
	9E44QeieWw/ODF2v+3CuF0S76WjZku2j24Qf3HZWz3VyXplabRjHdPxJMIkiQpAKjGwEjpA2n9x
	iQBWgydUZ/cQlFaDOdVq948+kczrNKrtkneutsGag==
X-Received: by 2002:a05:600c:37cd:b0:49d:1840:4fd2 with SMTP id 5b1f17b1804b1-4a0275a1d84mr192922805e9.23.1791209383347;
        Mon, 05 Oct 2026 07:09:43 -0700 (PDT)
Received: from ?IPV6:2001:a61:139b:3801:fa57:89a5:c5ae:c89c? ([2001:a61:139b:3801:fa57:89a5:c5ae:c89c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0280ceaf0sm374240735e9.12.2026.10.05.07.09.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 07:09:43 -0700 (PDT)
Message-ID: <cf1b312d-66d0-4651-8419-e838a531a7f5@suse.com>
Date: Mon, 5 Oct 2026 16:09:42 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] usb: uas: quiesce SCSI before stopping endpoints on
 unbind
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Jiayi Li <lijiayi@kylinos.cn>, Alan Stern <stern@rowland.harvard.edu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-scsi@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
 linux-kernel@vger.kernel.org
References: <d3639d68-0213-4b70-a771-aa5dc3ec9767@suse.com>
 <20260930013332.829717-1-lijiayi@kylinos.cn>
 <813dcf3a-0615-4152-baa7-47b0046ca113@suse.com>
 <20261002145112.3ee2b500.michal.pecio@gmail.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20261002145112.3ee2b500.michal.pecio@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 02.10.26 14:51, Michal Pecio wrote:
> On Wed, 30 Sep 2026 09:22:49 +0200, Oliver Neukum wrote:
>>> When URB submission or completion returns -ENODEV or -ESHUTDOWN,
>>> it marks the transport dead, stops further submissions, clears
>>
>> Why this specific trigger?
>> I am asking because -ENODEV comes relatively late in the process.
>> URBs tend to fail long before that.
> 
> But it's sufficient, right? Apparently all we need is to detect
> USB disconnection before disconnect() runs. This will do.

I am not sure you will necessarily see anything fail with
ENODEV

> But UAS driver infamously has no URB error handling; if anything
> goes wrong it just waits for SCSI core to abort the command. Not
> sure why things are this way.

Good question.

	Regards
		Oliver

