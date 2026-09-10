Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FBD838DC78
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 08:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789030422; cv=none; b=PrcdNkOoz0lY17YhAvLXf6HILBUygymhe2+gA2eH+zJF9YfQpYHqRzCAmX4wXA74D4RL16GW/Ls+EenXTNmIpc3FGoLmAzgxhLqTEzpDAV/udV2Op/PYtxfrFh9zcSN9y+1bTDC81GOPOBKhU2/fswQe4HxLKmqGf0bloxvbbaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789030422; c=relaxed/simple;
	bh=/dreYYaLqp3ZXaKtqFxcEqMlkeWKaRmEMqqw/lqnmCk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i8qyB0pngama/geZUt1MCnVsd9CddSSEwAzBEl7gvRDXCX+jaAHDLaWzQ/tU2+nTCFI9nWPwUG0ZTkI5WHyE6bpoKJaFy+hGJ0C7tIoxWdGUEnA7qoIb+jakolwAwMWQm6UXC1BwaWDaG+JInBT/2lzneyjE606EztUrb3Lx3dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Z2Ev2H0Z; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=bn3ptV3N; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Z2Ev2H0Z";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="bn3ptV3N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789030420;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZAg2LJ7V1QpIouq3KzdiwTZ+1yA0VO0nV76TsNGwX/E=;
	b=Z2Ev2H0Z1BA1DMEl0ku1k4e0Tz7KZOZKPEsvYFMgS1bsacWbdAbMgl3ITpXYBdUAL3E0k0
	jXh0B1ooSDqgHrL/QzhsGt156ciJxqcyV/OjMvYl2GFVomp72kjZxR3oyE1jAyzz0fwrKx
	Y7/buk78kAAkJqmLz5tZU0wP0kGviXk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-445-cLQ_6XL7My-VNdwGTpKiCQ-1; Thu, 10 Sep 2026 04:53:38 -0400
X-MC-Unique: cLQ_6XL7My-VNdwGTpKiCQ-1
X-Mimecast-MFC-AGG-ID: cLQ_6XL7My-VNdwGTpKiCQ_1789030417
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4994aebe932so86869835e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 01:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789030417; x=1789635217; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZAg2LJ7V1QpIouq3KzdiwTZ+1yA0VO0nV76TsNGwX/E=;
        b=bn3ptV3NGA1bBaCY3psQGUO/AnSCb95iDWF+uvlr1dGZ4mKb5h3gTdxbjtYUbUo11j
         eP4q4g5q8NU3ne5hJly6Trq+P68Xf34Y0DJF26PsgX1jrOgF/UxJrpQuEeKML2XEWucj
         5BNJajeSOpU5cdR7gLeBzXlGF+v3/Z29YXfeSk2gajho6hJxD97P1tCPXSwMFHKSjGb5
         5sZ5UHF1z/UUPSwncTqAD9D5ildHKqsKo2g+2pIemAG7ET3PyGu6l30nbZcopAiqFYUF
         EzmynpPD0ZwuYWF0ViqACi0pvksAOxXSx8VJisxsYqX2pyD8tKCaOHq9NCakdPRXj17h
         PsZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789030417; x=1789635217;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZAg2LJ7V1QpIouq3KzdiwTZ+1yA0VO0nV76TsNGwX/E=;
        b=eZWNqiFpL2lH3PcQX1iq1FyCyXdGzcDfXRuqykaOsnoQsIjtgIsmNQSb+XQbalaGmt
         HtbFZcodfT1uO8KCIJbdHdXUUhbltWer/D8XKIaCdwxUhe4o7kHRWW/L7kOfeE1z8GSH
         a554mUu2XsiW8nqOcA9L6ZZSt8M83ZCVl3u+bjTzHXWyWGQVv7BMgnoLJJ0LOgP+utMY
         blX4XCIwz2qwIrxscU8jo8kwwxYW+rvnzAgkv0Lt53P4luwTFQ8i1GX+KspIY41Pu+55
         5yl+HgBZzPEu4xjyaVGEGd8POvPzL3Y7IiDmjxERA01XAvivrGRtkveHj++OlfMI2jZS
         OgzA==
X-Forwarded-Encrypted: i=1; AKwUvBwvOmkAOvpqNskl7ad5sPth2iBmp50qhm0wc3ExafTPMCIVZRdjID9WDBSrBO87JL+Zk1gKSK+Q7twMoao=@vger.kernel.org
X-Gm-Message-State: AFuF++kC/Om/6wmTBbR0uEcE1xRKui6/odXLbZkQBxL/Ai2sXJxQRFGW
	C79wWQTMcEW1Pd3DlJ3NTQBmG+8xVcocsyQ8/NqKiuSoXCzWCiJ+XQaWpjhOkO3E/7/l+xH8Xn5
	xLNvrQFhBZzrhGM/qD3ls6naquEkjW7eeYs6fBXdm5sNSg414zvU4ex212EEeUGcb7A==
X-Gm-Gg: AYBFou08gSBm780VqXS64RCr6E0+HkvBO4dHamBqzfayCvEq7BXs8Y/lBT6p9VJczV+
	Tfer58C7udTKFui3DVqm94umvqsEcaKNW4dY04BQvNUopkk8Ol0hJxKgo7QDw0RaTzEL1ICK4JW
	u0IIlZeio3dGOhOBPpGR9RC8aeqNAAxN3BfdUkriYBQ7zScrJcKkOXhGbcES6a9Tctgx+hcfyxb
	rVeLHXV94ArqGabVeYIat9i2jiyh7ZjLa8lJLnXbciPwzlgujaFKi7/um9EcAInGdNlw71JeJJJ
	3O3fZuaEtqWzqd0zDDoz8H9DsXraNLA5V6ez4sWU0W6yga6XPU9eYnVRyUGBXiefNqPSNps70GD
	jteSRZ7sT9c+foeNQF5cNayM+hKmOgRVaPanuxopyfEx/rQ==
X-Received: by 2002:a05:600c:1d9a:b0:498:943:ccc0 with SMTP id 5b1f17b1804b1-49d258ef83amr131559715e9.6.1789030417495;
        Thu, 10 Sep 2026 01:53:37 -0700 (PDT)
X-Received: by 2002:a05:600c:1d9a:b0:498:943:ccc0 with SMTP id 5b1f17b1804b1-49d258ef83amr131558735e9.6.1789030416951;
        Thu, 10 Sep 2026 01:53:36 -0700 (PDT)
Received: from sgarzare-redhat (host-79-53-30-11.retail.telecomitalia.it. [79.53.30.11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26bdb629sm50255115e9.2.2026.09.10.01.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 01:53:36 -0700 (PDT)
Date: Thu, 10 Sep 2026 10:53:32 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Melody Wang <huibo.wang@amd.com>, x86@kernel.org, 
	LKML <linux-kernel@vger.kernel.org>, Tom Lendacky <thomas.lendacky@amd.com>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, Claudio Carvalho <cclaudio@linux.ibm.com>
Subject: Re: [PATCH v1 1/8] x86/sev: Make SVSM calls preemption-safe
Message-ID: <aqJrk-WpI15nMmuc@sgarzare-redhat>
References: <cover.1787973545.git.huibo.wang@amd.com>
 <8e6e89b87e34a8eb2a20d52b0d92c26e7a61ac42.1787973545.git.huibo.wang@amd.com>
 <20260901011934.GGapYoJvmhws1D7iAL@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20260901011934.GGapYoJvmhws1D7iAL@fat_crate.local>

On Mon, Aug 31, 2026 at 06:19:34PM -0700, Borislav Petkov wrote:
>+ folks who added the vtpm stuff.

Thanks.

>
>On Sat, Aug 29, 2026 at 03:39:39AM +0000, Melody Wang wrote:
>> Two functions in the the SVSM vTPM guest implementation do not disable
>> preemption when fetching CAA.
>
>"	... when fetching the SVSM Calling Area Address (CAA).
>
>The SVSM CAA..."
>
>This way, you introduce what CAA means and then use the abbreviation.
>
>> The SVSM calling area is a per-CPU structure. When a thread is preempted
>> and migrated to a different CPU after fetching the per-CPU Calling Area
>> Address (CAA), the SVSM call will execute on the new CPU with the
>
>and here you can use "CAA" directly because you've explained it above.
>
>> original CPU's CAA. Which is wrong.
>>
>> Move the CAA fetching operation inside svsm_perform_call_protocol()
>> which disables interrupts around the SVSM call and thus runs
>> preemption-safe.
>>
>> Signed-off-by: Melody Wang <huibo.wang@amd.com>
>
>Should this be CC:stable so that it gets backported?
>
>I think we want to do that and mark it with
>
>Fixes: 770de678bc28 ("x86/sev: Add SVSM vTPM probe/send_command functions")
>
>> ---
>>  arch/x86/coco/sev/svsm.c | 11 +++++++++--
>>  1 file changed, 9 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/x86/coco/sev/svsm.c b/arch/x86/coco/sev/svsm.c
>> index 916d62cd17dc..92ea93f506c0 100644
>> --- a/arch/x86/coco/sev/svsm.c
>> +++ b/arch/x86/coco/sev/svsm.c
>> @@ -74,6 +74,15 @@ int svsm_perform_call_protocol(struct svsm_call *call)
>>
>>  	flags = native_local_irq_save();
>>
>> +	/*
>> +	 * 'caa' is a per-CPU variable. To avoid using a stale or incorrect
>> +	 * 'caa' if the task is preempted or migrates to another CPU after it
>
>"... or migrated to another CPU after the CAA has been fetched..."
>
>> +	 * is fetched, always fetch 'caa' and then issue the SVSM call with
>> +	 * interrupts disabled. This ensures the correct 'caa' is used even
>> +	 * under preemption or CPU migration.
>
>s/even under preemption or CPU migration//
>
>That's kinda clear.
>
>Leaving in the rest for the newly CCed.
>
>> +	 */
>> +	call->caa = svsm_get_caa();

svsm_perform_call_protocol() is called also by svsm_pval_pages() and 
snp_issue_svsm_attest_req(). After this change call->caa is set 
unconditionally inside svsm_perform_call_protocol(), so the call->caa = 
svsm_get_caa() there becomes somewhat redundant. That said we can't just 
drop it though, so at most it could become a local variable. Probably 
not worth the churn, just wanted to point it out.

That said, I agree that in those functions we don't have the issue since 
both of them are disabling irqs.

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

Thanks,
Stefano

