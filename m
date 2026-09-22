Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF6148F000
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 05:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790055736; cv=none; b=IkaQSGaU8zOxfm2GkxmOEZinSDRc78MKqCMl7Gz05hpsG3ESqwU7cPJWOMEmsYcK0pYOx7wfkI4lAZne9oS4Tz04VKo/PrWICNK+4f0LJjEaJR8APDE73rq/Z9IQpuzMSZPHYBBZ5OQ7C7aL+9ouo4WjKdUadBFTjhUjepPKSk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790055736; c=relaxed/simple;
	bh=TQxuN2bp/gJjH6qiEsReIplR8dWai1cTY9+lJStDMtA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bB0urK8d4q5UJtAdcgzpCjPkOIZCLzY3+VID0uHhPDdgN7+lshA4FwcurtKYNKi0gMJloTAAIpGKHx4pvlaniDsNsowig6Ut5eWvcplaiDhia3Qm/H94SnxV05hPEe4XVhO8z2QkNPhvOSi3u4SR2mHyBDAkFAtob1kej3DQmAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LVI3yZjx; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZYcC8pDq; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LVI3yZjx";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZYcC8pDq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790055731;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Gc3045Dwa4vjQJ/8MBEFbFz/5QxFhFaTid5Jh1bQ0hc=;
	b=LVI3yZjxoFS2jEC58vtsKxH0EqpkPOzQM/4/3gpUGACCGErj1dekGdJDT7Wa3UqN8daC0S
	SeREZHB890YFniNFnH4/A3+J9VcMJa4Tc4xLwklbu/U9n0tr/erVVNiWt543I9kVcXF7LX
	kXlofP/c1+XA9Cdsso+ZCHrGUm2xYrQ=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-29-DadeTy0bMQKW65tRcn2Bcg-1; Tue, 22 Sep 2026 01:42:09 -0400
X-MC-Unique: DadeTy0bMQKW65tRcn2Bcg-1
X-Mimecast-MFC-AGG-ID: DadeTy0bMQKW65tRcn2Bcg_1790055728
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-398d0010cfaso6180532a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 22:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790055728; x=1790660528; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gc3045Dwa4vjQJ/8MBEFbFz/5QxFhFaTid5Jh1bQ0hc=;
        b=ZYcC8pDqdzaL9Hp0IIIr+bch/FHLK6BrLVgu/v0wUuPMegcwbbWXyYok1oOvHwiTXB
         80S24AkKvy9ehQIzy1dGanLqRPZEthK7D91VKAgNhf6R39HMwZONvKhf9elPiC4JlZUg
         VCdWWHdXvruR/leAW0sYZgAUqlaiZbuc/9Iiact3EWvVXKR2SFwpxcKpCy8fjRIYjjq8
         XxoMQ1U5/qtp2+ASwrIuzwOI66g+6lmDkISaUXK49/fXUzENmbVs2bzGiamPbf8Z73O1
         6KoTyywpKO4B+ZtmLPQY2979s72dGYw4ML78KwXoCBAw1f1lDms96q16xeG9LSH02cKk
         3Gyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790055728; x=1790660528;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gc3045Dwa4vjQJ/8MBEFbFz/5QxFhFaTid5Jh1bQ0hc=;
        b=i2jahZ59mQZIA7cfFkuBNMApyjmEDPqdmZNh/18Gqfz8VQwRy5eQ6/PD/uPcRxQD/u
         08x+BGaiHq5BO4CFp0bI0rzkFyblTBryArcOJQoJ5vOhqzS1ZFV0/FnNGEuxoweqlolE
         uD5BW6fGjfvpNa7rtbbmSneaXDY1agObg6iu7YR4U3WepKRrvKIS9J9/vaq06X4VPxL+
         OcqBRUDPaJYxiwodDf0eSyu4ZmbTxXfSUBJbTYiFrxwiA3m0lAaON1jRnUWIsA7C/NUg
         xJ+zKj9uThPRMGmXpw6KXzDL2MUQNnMhlg62QNoH5UduIRBgp0XZOUzh+4Vcqb/Irjpj
         R4ug==
X-Forwarded-Encrypted: i=1; AKwUvBz/TzNcqYBWcNBgVGkXwIX0aWTR+S5ExbQrkl4y/u/Iqi5q0meW8MIz8N2iXniaePKrz6kVTRtVKTtBoSA=@vger.kernel.org
X-Gm-Message-State: AFuF++nSHFYvbRWKLtWy+x9zoZkgxaf6fRETC9MwGXb9SJaRE20f0xMH
	fnaTkHfYsAWbrwZXaQyiy10RvlajDsoxxD/963QIcpuEEkpRyIvUwkGVj7YYICgabmrzGakET8W
	JlQSgPGbYugqBI4MdZSfZL5jK/HiqhRvNEeFVM5ma5nGbK1250yH6S3z4OiyZmcqObA==
X-Gm-Gg: AYBFou0glPqQMwzCKL5Nf9XjKYqC95C+5jfG/23SMPdA+bnb4ntGxVfXb/suOgQTuJi
	3vsuQfNvwahc5cQe4HOzUOAWPj55xl+fc//7PwzTkgqaToBX03B2kgQWxjafZ5vI0OoAjj8/Iqz
	STr6tIfVtqt42Z9kXi2ksPINyPDs2Tt4hQcVO+Jq7YLkZdR2TNUhxoubFWjEHfNABO4mwHyC8er
	GX7jbwPsIWET7SUcFSZESPNMFcUD/FnAREU3r+Ut4uI47jk76tcYWWqup5oeiYivVtDJdJRkm2n
	RqgJaY9qaq1iKZQ77JKlkMXpDFvgdNYAj3Hn/on/nTfZ6nqlXGzaiZkkN9MhJKLmbWTQZQ8fpRz
	i7oVuAKki5f/WPOPjtpJ2Z2LdoPdLItwFaPepvF9hFg==
X-Received: by 2002:a17:90b:1a88:b0:39e:6b01:f93c with SMTP id 98e67ed59e1d1-3a07310e545mr68741a91.13.1790055728211;
        Mon, 21 Sep 2026 22:42:08 -0700 (PDT)
X-Received: by 2002:a17:90b:1a88:b0:39e:6b01:f93c with SMTP id 98e67ed59e1d1-3a07310e545mr68726a91.13.1790055727738;
        Mon, 21 Sep 2026 22:42:07 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0715e9d5esm628384a91.17.2026.09.21.22.42.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 22:42:07 -0700 (PDT)
Message-ID: <a1084c66-4e4f-408a-ae3a-794dce005a4b@redhat.com>
Date: Tue, 22 Sep 2026 15:42:03 +1000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/12] arm_mpam: Restore the error interrupt enable
 from mpam_cpu_online()
To: Ben Horgan <ben.horgan@arm.com>
Cc: james.morse@arm.com, reinette.chatre@intel.com, fenghuay@nvidia.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dave.martin@arm.com, andre.przywara@arm.com
References: <20260917145617.2202986-1-ben.horgan@arm.com>
 <20260917145617.2202986-3-ben.horgan@arm.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260917145617.2202986-3-ben.horgan@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/18/26 12:56 AM, Ben Horgan wrote:
> When all the associated CPUs to an MSC are offline, possibly caused by
> PSCI_CPU_OFF, the power supply to the MSC can be cut off and all the
> registers that are unknown out of reset, including MPAMF_ECR.INTEN, are
> lost. Afterwards, we need to explicitly set MPAMF_ECR.INTEN when the first
> associated CPU becomes online and the power supply to the MSC is recovered.
> 
> Restore MPAMF_ECR.INTEN in mpam_cpu_online() when the first associated CPU
> of the MSC becomes online.
> 
> Fixes: 49aa621c4dca ("arm_mpam: Register and enable IRQs")
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> Tested-by: Gavin Shan <gshan@redhat.com>
> ---
> Changes since v1:
> Update the commit message (Gavin)
> ---
>   drivers/resctrl/mpam_devices.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
Reviewed-by: Gavin Shan <gshan@redhat.com>

