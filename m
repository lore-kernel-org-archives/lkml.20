Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4831446EC80
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 12:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791548653; cv=none; b=LRHbGQfeiAchnzHbIqZSI+gnfZRhqrNmjQV+ZfJTgqc57XNxhNbqqfb4MmSnimpO8fyp6BJpJh+6dhYAZg+4Vp6jeBvnbTRLVRAwegNd2dYUWhdlmMAqooCYxQr7QeRiK1/dxbfVGNcj343iC95IEu0BgECqBA+5/RdyfmmVxTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791548653; c=relaxed/simple;
	bh=ygzy2tiWw+zyB+8zPESgoW3Kc6ZtzDU0sZJXdO2V3L8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JoJFQZdTjrFEvBOT2AWhiQMwwlrRY7gySyFHTQXRitHkG81A3o5i+X8r9I96PNTk7/mD5aqueVeP26PDVEvBPLPoONg/EOYeIwkuKhj9gm3+2qsc1Nt7dvQGBv0pgdcrBwr5/f1WEIgucH4kCOf1KYsRLjJC0qxIbk44hd/Mae8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=VdqXgbr1; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="VdqXgbr1"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-93e706a6ba9so494322085a.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 05:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1791548648; x=1792153448; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7xVrLTdPBO/x7mZ2QJE4nRUIXu18ExDFNt/NWIXXmg8=;
        b=VdqXgbr1KgwSy/vK8WKrpPv6SUjEtbkhdHZ19ORmy9VFp/5/Ck0UNYVvpJAUZDEeAz
         NqyvzuDm3SA17xyrJFeN86MZkTeyIn4fOUemTPjha++nFj2nUKNu/3qoK2GGsHCbu2J7
         NmkY2rlLrNVn0Cy0VKXglEOf/BD4Q2vnJsgngGm8ZB3/Vb8YV7Ptv3mx8iu+uMAHvpCA
         S+hzXIyCHFMZC2bx8PLJHKuHbkcl0zu/daQrGmv+ETTlZcfmBez3ZX5qDhpOOW1K4b8s
         4WUt+b/ufDr3iZnBEQt3VGmafMI6x6l7i/0VuZube/WDHN52jeYjXXeV9wQ1Wk6CRBKi
         MvEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791548648; x=1792153448;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7xVrLTdPBO/x7mZ2QJE4nRUIXu18ExDFNt/NWIXXmg8=;
        b=d6cUdr2dm8fbWt9TEskH50gpgctG+lHG/z7Iyv0nxu52pzkOg3+7XBxAkg/OKRJf/Z
         uD1pKOi+AJH9w0M/a9LsMOfPFHa1vE8Ee2sE60tcHdjc+z4tENbDpI9bU4/HQVNDewVM
         SKEMqFwlwAWL3gCFu4bvo4VlQtrwIC50BWC2kjkqxpI/qMXhqDHq183MBoztXNMKnpWz
         B1v+xSF+Pi45ljDNZTD9MtKk2/qyite4N4JkaFlw9CSxXiwTFuF4bwKYWxslahcan5L4
         BR8QZAFaSt8O7NtHrqmFjo+EyfQDDcapIl2h4yzhE+rIx/2TMn9x1eNmgXV1qwzAaIdT
         KnfA==
X-Forwarded-Encrypted: i=1; AKwUvBxKapVhFofGWtHcHO23QN0j8+IonY1bEk6A+UQuQIBiGCtN0pfwxzE1IZk+3J+9KJh501YV+BqCad7u1wU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLd6qb9pw5YMrMJMCgusVH5hca7eEj2Q2wcf/QBuNQzvuJSy0sN
	r46V7LoC9kZCP44vjSO6qUnlaqvsuOqOs8SH3icW0E35FgoYJhkDTQ6DkmxcOaw0+eY=
X-Gm-Gg: AYBFou3zbDEmWstLLqardx2G2pF9wUJ3ZqgPfTycvbtBjY6jWUk0EfOhrq1Nj1bjaAn
	hQuGS7E2b9xz9iV25uQ1W93QMLgc9WjgB4dOV4+f4Sjb20aBc7P9sNu59aMQHwOFuEQlC/gmN1R
	IvqON8ylOO3ErKjjEA4Rgrw+8zD8DZ4TXXMEGM+enqNp+oYQIqBnJibqT2RW/P39XX4Fy+gmQSL
	NoFezedEmRaBqM9dwSfaI5wRu3aIXGqbZPEankU9TBkZaC15L/steg5sI3gtk29Ne1vYzvBrJWO
	Fa8z4FRz29pi41u6uyxRB/PHAefjZZKpmNaGJm2fS6vRUkcU/1a5Orc8blGus4HIv61WxWD8ybg
	sWLAQitcPRkb18uZtJX9j6RhemL5iBPhpZd2VQb0NQJ02mTMbwLbMrA3Kuq+dsUcCg8/kL2nuOb
	uKMsWoBNhlBv+/UZ9yedXH3jero1hveyH/1gexkj9c28bqojUP7tBbfTux2QqYoiqHpyogcygD7
	HHF04tDXYwJcxZ1B7cE7uFprckT6TLhYDJlGEghIvhl8RHmbnahphBA
X-Received: by 2002:a05:620a:1d03:b0:93e:53fd:4139 with SMTP id af79cd13be357-93ebd0c015fmr239646085a.9.1791548647899;
        Fri, 09 Oct 2026 05:24:07 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93eb99074f7sm169721285a.46.2026.10.09.05.24.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 05:24:05 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xF9ds-000000003qG-2YfR;
	Fri, 09 Oct 2026 09:24:04 -0300
Date: Fri, 9 Oct 2026 09:24:04 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	Joe Perches <joe@perches.com>, linux-kernel@vger.kernel.org,
	users@kernel.org
Subject: Re: [PATCH] get_maintainer: only use THE REST as a fallback
Message-ID: <20261009122404.GA14213@ziepe.ca>
References: <20261008-get-maintainer-the-rest-fallback-v1-1-7d26d0b7aa34@linuxfoundation.org>
 <8e194f64-6add-4fb3-a1bb-9b27719b409e@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8e194f64-6add-4fb3-a1bb-9b27719b409e@suse.com>

On Thu, Oct 08, 2026 at 03:15:03PM +0200, Jürgen Groß wrote:

> As the Xen code maintainer I have stumbled over problematic patches which
> were NOT sent to x86 or xen ML several times, which made it possible to catch
> potential regressions early.

FWIW I use lei with a File match pattern to have a 'virtual mailing list'
of areas I want to pay attention to. It catches everything no matter
where it is sent. 

Jason
