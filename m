Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9955243E07C
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 14:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787753438; cv=none; b=l8/C2Lpk2Q97AV8xv2Lcpfha9tr9xIWC8LwaRveDGeFCtIFHyuAkbd9iRrWTpYd8XlI2BsnItDTn/cqfL/ju9XrgS/DZVn6EpCiU3sjrISYSbBHIXr84jQ/uV4oMRq0VWpAzj7kInc/6d2StrAZOa6fEhLKdi/Tvz9maAPGmW0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787753438; c=relaxed/simple;
	bh=16ZIh5Vuq12569adw5f4BoHxYyjKSZpBEJ6cgXbeKG0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r4YOqZm2uXSn1+YdWduzFq3TpsoxPWVU+aOjKWzStAAu6POzceT0Rqap00SxcysS3yvbPNkKJIqo3nxqfi0DEUIotgCnGBTPIgifTbNsNljN/i8qGVk6RbugXaLtdt6yOB4wViS6X2m+QjrXMVJfhPWoQkj2x5C7KvG7hh9YtmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=ZFb/vrHA; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="ZFb/vrHA"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-9382fbb1208so32100785a.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 07:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1787753434; x=1788358234; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/foZ+M7MX7oIG5rAsNJns1XV1eb4qctVVygdk5kNIxs=;
        b=ZFb/vrHA6PlNOGI1GvKUvTPjYhRcdt/jKt72EjxqS1Gvn30Gg+uHY06yrlEFO7C+x2
         JGjShyo7754OTCZn4RI2PF5ojWeodgL8JRQTiPKb7227r35rdgBMJm852R/+qp9Dp65f
         ZJqpEYNqEodYubYcA76ILWKZELbrt5+sXSgTNCbMe19mpiRybioW0ycdxc9YD6YTTwIf
         GRJ37/1aNt5FwAuEx9wnhrXqlWrU/k2OMeJ8gRPisCeWeTbv/dtrwugrarmCN5NiaeRd
         9uW2Ezr/RrCeTEEKEYRBFmwgpJeO04Xts6ZD/2xdzRHHVubmtpLNBk8F5JMZLtM4J+e3
         VERw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787753434; x=1788358234;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/foZ+M7MX7oIG5rAsNJns1XV1eb4qctVVygdk5kNIxs=;
        b=EgFVUa56fVlpVEgCVGgkUSFbttHHlzffil+87xZ78+wSGzl/+avc50Sn/bq1X/zImo
         CATqAUQ2LldslaZ5WkH58u9G28Ig6VAx5StmcOiPeKdBZ44/2Rp6z9NnuCDD5YszQaIE
         6So/UiAAF3VVnZODgzgGFhc6A33ro07OGyKyVGau6OXD4MzoT4gwdJlFdSWNKNglCsni
         OEqMIFAVvrduBsXV1/WKzVS7LIAEF0EK+ZVH0+XTXRldy7uoy4Mu+kYEZveUEXHnyZf+
         Dt4G2m8uCimGhg7FhUrLRkl68OcrCLLn3wHE23D9RAIDSiGFYoFFEdjYle1U4yfnJ+Hr
         NA+g==
X-Forwarded-Encrypted: i=1; AHgh+RqgiZWcJqPTe3nqKsLg0k5OnBN6nGf7+oRYNArzmIQwnsR7/+iq+oTwrAmMbeCJuboJw0BWyN3fwrewulQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lmslURFGnxwjJ++AsGHqjXQlehQOblByh09eoOI7jww8nszoQT
	rQjnPXVwJV5CN+C9WzJDiAM/WY1f88y7PccdW4covQZdCu294rGqFbdexGUael/gdoXjpuj08pZ
	cclvN
X-Gm-Gg: AR+sD11eXeW2Ny+Ijsp1qoQvaFcwcnQjGkStwIYmvdswQjuspClmZI0GbgZFUJj1NvB
	F/dGRcw0Xe7qAwJeRUr5fRo/PnNXHjmSlrId3tscPK2GwdYGcSUTGGtJI/1UPdf8yvxnbK8QgA9
	NYBbvTIvGAyhe/HYrjkpy7L36MvlewdxsNFOa4CHha3SUEZ7IJsN6rTCC6XruIe2vd2JS1chH6a
	l6dT05TafgsBibyIWoHI47RJ13mrBa484G1D+zDApX0Apm/IvgRJysh6tUaUxNsfn2KLTjskk2c
	3f39S26LETUGqFVx34QyZYD4yUosyCMGZwIHdrii+vHW8hrTHCAs2kyivZ05dJhKS18VFuz16+e
	9m8vzdZC0t1P4fjFAILqApAfCj4xBX5Y4cI0YhQTotR8Uj0foaD7D9n6w/0pqcr012QAH/78ZGm
	WL8BdmoUblWj1witPVkWJpBpk5pElGYpF0e0S7tVK/igrLIw==
X-Received: by 2002:a05:620a:240c:10b0:936:e192:e394 with SMTP id af79cd13be357-9378047c277mr498130485a.31.1787753433893;
        Wed, 26 Aug 2026 07:10:33 -0700 (PDT)
Received: from ziepe.ca ([130.41.10.202])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9377e658a3asm218414285a.36.2026.08.26.07.10.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 07:10:33 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wzEKm-0000000FQfM-2V2G;
	Wed, 26 Aug 2026 11:10:32 -0300
Date: Wed, 26 Aug 2026 11:10:32 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Liu Dalin <liudalin@kylinsec.com.cn>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	Liu Dalin <liudalin@kylinsec.com>,
	Deng yingchao <dengyingchao@kylinsec.com.cn>,
	Qin yungao <qinyungao@kylinsec.com.cn>,
	Luo Qiu <luoqiu@kylinsec.com.cn>
Subject: Re: [PATCH] mm/gup: add NULL check for unlocked parameter in
 fixup_user_fault()
Message-ID: <20260826141032.GE1449020@ziepe.ca>
References: <D1CF78FF9DD1C630+20260826062943.3255351-1-liudalin@kylinsec.com.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D1CF78FF9DD1C630+20260826062943.3255351-1-liudalin@kylinsec.com.cn>

On Wed, Aug 26, 2026 at 02:29:43PM +0800, Liu Dalin wrote:
> While the current callers either pass a valid pointer or explicitly
> pass NULL (indicating they don't need the unlock notification), it is
> safer to add a defensive NULL check before dereferencing. This prevents
> a kernel crash if any caller passes NULL and handle_mm_fault() returns
> VM_FAULT_COMPLETED or VM_FAULT_RETRY.
> 
> Fixes smatch warnings:
> - mm/gup.c:1597 fixup_user_fault() error: we previously assumed 'unlocked' could be null (see line 1573)

It would be better to remove the previous check:

        if (unlocked)
                fault_flags |= FAULT_FLAG_ALLOW_RETRY | FAULT_FLAG_KILLABLE;

And update the kdoc if it is now true that the unlocked parameter
cannot be null

Jason
