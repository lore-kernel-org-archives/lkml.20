Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B8F44078C2
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790244855; cv=none; b=jmknMz2lZsCGapPsilx1wg0+eMj5/BphXR/+gjTp4fcnoy/SuJHNxzupn3NYASbJ8OASy/5pf3WnPydREuHgxE5Q2v+WjnlRAGTL2eLrVY2eHFnbuzRcEnf1ozFA2rzdz272jCuRGhemsac+VXypDao6wU1FQqm/y7jqiimYLVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790244855; c=relaxed/simple;
	bh=NN0e0g23jeBHX6DFaufsvruZGi8WnjPIpSL3GTO21Mw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E5S7dlfYQKcovJZDwXd8DQVvRk4QPiymwIeJ0RHWih0UYbkWBPY4lNLuP6S5PgwcJ1fbGeU9j4qbxvJyqrybBbeHaqY+puHPOL53EzO5FnSCBlznUtKSBm3ATEWC2nX6ifKEGI48WLRuDBSaMvNi2PDbqYFMz+ELxDb/ldGzXcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=J84dTtYk; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Cp8BzTOz; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="J84dTtYk";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Cp8BzTOz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790244842;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YxjUDCrVF3cPBepPW95UZ0ZG6+HKjGTnptEQIR9dc6M=;
	b=J84dTtYkU18ysRbnjBoKfLb5+57Kv594Vb9cm52iB8iHNTYlDXGr0NQpcrXXgUuBNo5Jbv
	ofAJ6FgtIfHosBouEaOhM1KREIFNbDl6/VbN4jpafz+CzeIQAF6RhJqLXIc13Z8nifYIcY
	HXCvlMoXmlBZILFp2QIXbsGmJqRdZ48=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-626-DuudBdwJNUS7F-hoEBPrKA-1; Thu, 24 Sep 2026 06:14:00 -0400
X-MC-Unique: DuudBdwJNUS7F-hoEBPrKA-1
X-Mimecast-MFC-AGG-ID: DuudBdwJNUS7F-hoEBPrKA_1790244839
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-49cf4cc2125so8829695e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 03:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790244839; x=1790849639; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YxjUDCrVF3cPBepPW95UZ0ZG6+HKjGTnptEQIR9dc6M=;
        b=Cp8BzTOzuE+FQku/yyxtEMZyQw9rLFDoakeNIAs+uYvLoP8SiZwMX/Q570mzAB03QI
         1Dmh5xyWQkK1Ou6a3UyQtB06dC/baYhoTYC75AsaujaNcpu2dguTEVU8Z/B3jqOFTv0W
         RphynXZlT43xQAPvM3TVU6BkTiz9Ke8O+SHz208pigF3Xn6MoWjceLeypyAz0iK4wE0y
         yQg1k1QrTMmWogWGCTJ5mhjEhCmQmQDD8zkZt1HXhVIyCHUhCAaZCL1WwM3ZWFQMdSDu
         KaLE4bIdydV4rqGnOPNfZRzRbOREGpvQm171hrg9kAUJWIt1fKPYKvhMRrot93/CQ2hR
         s3Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790244839; x=1790849639;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YxjUDCrVF3cPBepPW95UZ0ZG6+HKjGTnptEQIR9dc6M=;
        b=MkhhPXPgc5rSpue1CZkHaNUahJ3xfpeHNw9RLVcJdcxvI+81elxgngvoSax/oOF7/l
         rOmKKTcNdlZP4LONRVVSIr2YPrjObgf7KZsxwPADBpiiUUrBaXgyrjxP4HOhdTuujAPC
         arKOoOwsZw3zTJyse3tTmJO10dbPi/aaYpmEH/HGn+TYfk+Xe77Eu5E+pXB0zTrJpT1a
         KLjPuEXqVSZRW9mlENh+INOkH1EAaXQx/jd/e/AU7Lpg4FLciFepuCz4gbuVe9PJCPaW
         cdY63tbZcI3FOyjOolvjVZwX9dVvpdEG4tKWywg5Yt4hA9ytZCtl+vR1jPGP/1IXlgo8
         FLmQ==
X-Forwarded-Encrypted: i=1; AKwUvBx/63kr14JBzNS8x2IS/Di26n+/nvd1/wnO1A87xQzl8EImvm7f2Jz2Z/2PEGilb0YvG93oPwlYPRrYBHU=@vger.kernel.org
X-Gm-Message-State: AFuF++l47Cxz5HfXy7tjtOBL7TR5yoEalhBnT5M+mwNTTuUbXmdRxcCy
	IKJNJGUSWacgpO8qO6Ewjv6g1WvVQ3wa3M5SiWpr5nCIG3ewKrMeLuisB9+Gf3nhtfoVzot5viz
	OUPZcztzJbC/uvis84F6L7fJflUykeyHSXKUh3PIZNlOOjaTxeLrIDzX8S8d7aYqv9Q==
X-Gm-Gg: AYBFou0aG5ig36La4Gl/TQsocBkbArtVN1YVYNQ3jKLNPZI/qwRZlxDa1SgCAt12TAs
	yFGY3sBaC/5DT8E/Jq/xtYzfIXvGqpZO1olnrEcBdJnfzMkorsCO4BVUKjCdmUG4BOgXtEJXvG5
	rZqG8c0+tJcTOW1VmUsSzZ6cPmfkFFNp5kW+6s5ANifnrFLMQgvW4fvb+mjqmOmPrnzbm7sp/sn
	CKq67I1khd/bXDiRghooSn9OFQJuhuQ0hLybUp3mGPmtdLeX+dnztnNhqR7QHQ+kclC7mCta+xa
	vvLi1woveiXe0N5S2Fhqugvivv2YMilwY0TNOrHlTj8KyncJYTRJnINKdRiYIoOXe8LSdeLFsdY
	FhqPJaDlzgZJwb2ZQqOrJFGe9tAm+KC6q38jSP2faHNe/yiLYTyb7NEk1VHFjgG9J5//8LD8E+A
	==
X-Received: by 2002:a05:600c:870c:b0:49e:6050:9fbe with SMTP id 5b1f17b1804b1-49fe66d76camr33596545e9.15.1790244839500;
        Thu, 24 Sep 2026 03:13:59 -0700 (PDT)
X-Received: by 2002:a05:600c:870c:b0:49e:6050:9fbe with SMTP id 5b1f17b1804b1-49fe66d76camr33596255e9.15.1790244839132;
        Thu, 24 Sep 2026 03:13:59 -0700 (PDT)
Received: from [192.168.188.234] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe0c5b646sm53445335e9.4.2026.09.24.03.13.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 03:13:57 -0700 (PDT)
Message-ID: <4745a390-6859-4a5e-8ee1-ab9634b3bc10@redhat.com>
Date: Thu, 24 Sep 2026 12:13:56 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] sctp: copy zeroed stats to user in
 sctp_getsockopt_pr_streamstatus() when !streamoute
To: Hui Peng <benquike@gmail.com>, marcelo.leitner@gmail.com,
 lucien.xin@gmail.com, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org
Cc: linux-sctp@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260919213634.3314055-1-benquike@gmail.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260919213634.3314055-1-benquike@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/19/26 23:36, Hui Peng wrote:
> @@ -7589,6 +7585,8 @@ static int sctp_getsockopt_pr_streamstatus(struct sock *sk, int len,
>   			streamoute->abandoned_sent[__SCTP_PR_INDEX(policy)];
>   	}
>   
> +	retval = 0;
> +

AFAICS the above is not needed; retval will be zeroed later, if in case of
no errors.

Also this is IMHO net-next material with no fixes tag.

/P

