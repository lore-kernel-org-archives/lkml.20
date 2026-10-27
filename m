Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793092899;
	b=BALOZLwZDGcuDMkjAKbMjDO+i8Q9bhVIwitt6JNeWcbiS925cSkAbyhdGncubtnndF/L
	 PuVAJMkZNILtFAd31KIEDnmNGhGAy2XxDpGfp34bIhGER3AiM6UILkSeutYGzyeIeWCHc
	 rbOVfWC0WlwwN0gkQMFpcelhju8TjYHEJppE6f+DfE194j4HIkwkT+VKmVGU9CUGqxfiI
	 BdHSKSJR6OXXVcltSrnVVfXmhfBh6EU9icpcKEpPiCMQfIYdQqxhSLlP1v5AwdYtu6O5T
	 ULu2OchUozP3rjr8GOa7alu7XFCvtIwgcLqrexf2SB/DR2GcTnhNOP1F0kV8HiEwcmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793092899;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=7ADcUnp4proYsWbdFg56tAcNwpkklMHnW/J4M42WqqU=;
	b=FQGBC5dfEg5NamVkw1IiF/lQpAo4kcfwSjCZv5oQ+SodXxnk7InzdeGd+K9zf1qXqOza
	 o5VXgXzo1yhfyH6qSN0shpPdIoZd7pEEjP72afM2EVrucjveI9Ej2CIbp6mEcoBZTvABB
	 7MdG6j94VqAXYl1+NTEXHHfvAbPB34pGw8xgnAaHdseiglm1od6Lqe8RGHNDZ3bt0fYB7
	 0auGd6CSfsv0p4+eo6iWuq4DDXyQ6bloSU0e0IvIQc6qq8q7G05jdsu+KNh6nm4LDZ0Yh
	 Ddr5yj5V2Pv2BZgTRrV1RjLrE8I1S4f3dAqQIJf2YgtR4t85YePKHevtznIsNHXJBMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=HKeto6TE;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A9BF606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:21:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A9BF606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=HKeto6TE
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso34086195e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 02:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793092897; x=1793697697; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7ADcUnp4proYsWbdFg56tAcNwpkklMHnW/J4M42WqqU=;
        b=HKeto6TEqhT/Kmt3LtGRwmpX3Qjn2/N4v80HIvwRBwzBca+QWFl2eRdlqdQRNjceZx
         Kv0z9sU6QaAlA660MPA2nM0wWxC3ya86QEwfutyzhfw/XYBsfQKwhnAxuSPXDa3Y9ZBS
         XDf8Xa9xcm6QPOU6gpG65nPRbOXiwImy2PpqulEQAL2gt7eDckC+dhH7yjB2VhwyqPod
         gcLiKMwaLvuTV9HYAtNMByfHgN+388Athul+NhaKGwgqMdsZ78YRrJr5jlUBFZp2dYzo
         fyGHHEEXpugjCoRtFOgXZt+J5nr91ZlPsmaxroz6RiDepTn/BNYcVo7ODXAyrrGhx5vl
         ALkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793092897; x=1793697697;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7ADcUnp4proYsWbdFg56tAcNwpkklMHnW/J4M42WqqU=;
        b=cmVdnF/K6CWEuC5GhT3TKWwMx8qIfxRIBeN2VbWnvooIonDlYqkoAIGKu2uR/I01lU
         LWU8PWHRNjKaAo6j6MEhDi04izRNXH7F3PYqCAE4AxEJZfAh2lGbhF2kXbM6UOR0Eqnt
         YN8JxPyNz5rkUXS3zFJRseI3odMC9Tz70heIA7bbnyuhNOqvIAS5ruvhh6ES/dOSvuRe
         NXVFMRHPcanmRoOdwTDVGKOfuof1Hgxtk1iEqGOyeC+HPQ9eAc9ueYAbG8F8u9lVh5i0
         lf2N50T4jtxm93csvaItJymnvvADVKNDoMrkDZxtellx62Xu1yyctsYa6fYVyiQb9cAL
         0S3A==
X-Forwarded-Encrypted: i=1; AKwUvBytxGpwse6WW+mn/rmm6CauPsEU4qPSKnW6OuT2WxuR9au+6pM3FaaF30RIt5VrHg/2SqQ/HGwApmGlyeU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIW6pM1AtEkJLwEjGN/NXI1Hk775FsT1KTqFRkMOpRrkvIDmRew
	H9aXwhX8RKkDRtGJOWMRk9yoe6dqfpydmN8ZJZJZRTPZmN2IMbQBs+78T1YzBYpRl/A=
X-Gm-Gg: AYBFou1rEVareGJIYKdwfuqptmqKiHcSO/ZPS0b5JDusSU7FLTSlwj+SEODzVABTs/A
	FNRbKdIIVETTsosDEHC1vb4KxYrtuh4jZCGtiLl/F1aJJVPd8KHjiVEZdbdIjsdHSGc+/jaipTR
	2cAwcgIDduMG2FkJAJdz97vC8KYhIoOOeE5xdmGPkQ8UveswHJNjDV97/JaL1iCKxNrVeX1qNrx
	7Vj7foY7ZhD6gvyXAWVluv64TY4mBKBG/KHwD1KC0CfIY991DRMQyBeoSVV1d45L2QkPLnqjgbB
	h9BSZWBatP8Oe7KUvnab0le8mFuKI9MvHfn555QtVSlyD/w+rqMGKTVvHTFkhOdxKL/jXIpRNP7
	eQD2CUHzt47/xwexrvNjSh3Uzw+bBkFI4Rv76egWMogOU1DGXhiCx72S1PJdWYQC/CMWhC5dchb
	+9KkVag6LKlsrpSM6RwNiDdbXp+EyXTeTNFmf9a+SxRp+CTugNKD82kxPhLyNFYa50voS0Nue6f
	cyqf1UBX+ZJR/MxoqkawaUkmR6VNRVRN2HlPdKi4oni4LtutT6mR4nEW42dHvEfXR5GKSvqgv5r
	xJZz3W6hj8GjNvxheU37yA==
X-Received: by 2002:a05:600c:4e87:b0:4a1:f99e:f22d with SMTP id 5b1f17b1804b1-4a35acafe0dmr181678695e9.6.1793092897467;
        Tue, 27 Oct 2026 02:21:37 -0700 (PDT)
Received: from ?IPV6:2001:a61:13a7:df01:6e79:f35a:ab88:b157? ([2001:a61:13a7:df01:6e79:f35a:ab88:b157])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3eb8f36asm21839576f8f.1.2026.10.27.02.21.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 02:21:36 -0700 (PDT)
Message-ID: <caa4542a-f1af-4a24-bc1f-f6c17d6e93ee@suse.com>
Date: Tue, 27 Oct 2026 10:21:35 +0100
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
Subject: Re: [PATCH v2] usb: uas: wait for pending commands before unbinding
To: Jiayi Li <lijiayi@kylinos.cn>
Cc: Alan Stern <stern@rowland.harvard.edu>,
 Michal Pecio <michal.pecio@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-scsi@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
 linux-kernel@vger.kernel.org
References: <e6009e1b-2d95-4350-8374-d5930200ed24@suse.com>
 <20261027073800.648951-1-lijiayi@kylinos.cn>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20261027073800.648951-1-lijiayi@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27.10.26 08:38, Jiayi Li wrote:
> Hi,
> 
> Thank you for the review.
> 
> On Mon, Oct 26, 2026, Oliver Neukum wrote:
>> 1. If an error happens while disconnect is running, why do we want to schedule
>> work?
>> 2. Why only this and not also scan_work?
> 
> devinfo->work retries allocation and URB submission for commands already
> accepted by UAS. Those commands may need further URBs submitted before
> they can complete, so I intended to allow that work to continue while
> new SCSI requests are blocked.

Even if an error occured? Does it make sense to wish to complete
commands that have failed while the driver is being unloaded. 
> However, the existing queue_work() calls already schedule these retries;
> flush_work() is not needed to enable them.

Indeed, but shouldn't we cancel scan_work _before_ we even try to complete
commands?

[..]
>> Some commands run longer
> 
> Yes. This is intended as a best-effort grace period before cancellation.
> The timeout values were taken from uas_wait_for_pending_cmnds(); they
> were not selected to cover the maximum duration of every SCSI command.
> 
> If a command remains unfinished when preparation times out, the
> existing cleanup proceeds. An affected bridge may still require a
> physical disconnect and reconnect in that case.

Understood. We need a genuine cancellation code.

>> Is the resetting flag even needed anymore?
>> If it is needed, why set it so late?
> 
> resetting is still needed before scsi_unblock_requests(), so requests
> dispatched during the remaining teardown cannot submit new URBs.

Yes, but that doesn't answer you why you are setting resetting
only _after_ waiting for commands to complete.> 
> Setting it before preparation also prevents the submission worker from
> progressing and makes the status and data callbacks skip normal command
> completion processing. In the hardware comparison with the flag set
> earlier, the URBs returned, but the command table remained populated
> until preparation timed out.

This answers it, but why do you unblock the device then at all?

	Regards
		Oliver

