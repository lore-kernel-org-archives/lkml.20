Received: from mail-qk2-f42.google.com (mail-qk2-f42.google.com [74.125.230.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 930F84FDA45
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 15:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789745896; cv=none; b=HdQiM+0+CUWVD2LNLSXh+gOkL/bvXERM+6W3EErim9vVFcA/qaZeyx9q8ymQU46MOBTR2ze50XtJGPzYJkWH+fRHOJkmOOn7jIeZFQSQcQlQWylKjBuuQrvqC6HX5mnYTHpUDkMNJzDn9/ewJCU7XRADv2l4z3hQFZ4T+KnRDKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789745896; c=relaxed/simple;
	bh=NKTBErfeYAFwMh88Ax3YpWdTdtUhF2krkTjr82UCsCY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ppjq/JRm8nP8UbK9Cn1Y2t192hFhOwpEXlmQMKZBkI/bB54uVA5/+OxahqZvqIWBPPZ0uoqoawwwN+zxz8cjDVurLDFBsLxzr/f/fBoxhpHr6XqHFrQ4e2LTog31tz0wuIaR49FSVcRJOOSzvYZ6f5VSWz5heZ7dfmbToZtJnUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=HvIftuR2; arc=none smtp.client-ip=74.125.230.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="HvIftuR2"
Received: by mail-qk2-f42.google.com with SMTP id af79cd13be357-93bd580489dso93495085a.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 08:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1789745893; x=1790350693; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZPX/IExiJfHeeEYWclzoLImRY6MfSvptPhsoDuS3euk=;
        b=HvIftuR2XxPVL+HIMJMjzbSSZ6wm21P8hdfAYgWfIAQphUpppET0T6JkIHTWYROW9W
         0FBMEofz4OsHm/fR7flABm2uZr1RTBShlUypswwdOV8L2W/77dY2fr52y4jL+hxLX19E
         Bly42yJbRGsO6T1gsUT3KqM2oYnLMu+ddlCGrKKtOUtD7frXwNHl7+e0kpsttLEfYJJd
         M8nxxjKn01U7qrBCHanOn6MGdwm+6RRnaF/BKrmzgTnf5O1R3Lt+NanpG/0tvZfwvJI1
         WQysTrpfYLsjfayHWIdLQDljz26GLI4s+usmTThAhxKvBbc8Z2QlHqWJ6nqvZV+x4Mus
         FEGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789745893; x=1790350693;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZPX/IExiJfHeeEYWclzoLImRY6MfSvptPhsoDuS3euk=;
        b=OLsyJ4rCPhPP3LX6SoBkHpAkiLo059Zby7EXBviKGJ6dCI4K3RHU4JL+dK5I6sBzaR
         GSmjOMweB/C283lCqNWym5tPE2NEOL52FXR4/YI82Rw/T0fQe24SyKscRLBJoZLHLfT3
         QKuciERIHXJvAruM7zp5bfb76/8cdcE1sXoNZIL3jVjdYhsUeNw6/M3TjAHDe8FdfnFW
         g/zcS50Afi69xVnb/IfF3AlqeNSyq6tHXKj71U94kJJxcy0+vJMx8to9yzEaqaAB3wKR
         +Qu3NgdwqEDwUu5dZGGYkUH+uwofUKzPFBLj9GfmeQDiYOtIJABq+rAjfYzT4B1c3a48
         qPvw==
X-Forwarded-Encrypted: i=1; AKwUvBy2crmvhmUW60j90HSUr7qAMqEzd4oZeKfDUneWnTJKw6dPpUUW5/2zzNLg0eGRuCH/Ja5WUW8xyFzWG/4=@vger.kernel.org
X-Gm-Message-State: AFuF++lsWzw5X6t3TeU2bVB+i8X40cD4U6odKN0PAJH+utqxjoWcP1z4
	I4qaij+t9tyWnqnr5IBqHqZQ12R5C/mQF88heHiJ8v+9w9h7GJJAY9gPLGIn4y6jLUDX4F0Qfg9
	Mge8z
X-Gm-Gg: AYBFou0Z+ddGa6YbSWiokdX5EUKH5p5HOiONAlCo/VM7khalBFtFinjtwug11XH0Nct
	9RYF1IzXICuFZevisFpLxjp7y8d1rVsxyy8eePx5BNlv/5uN2TB2LNxEpQPxI2hStUEbCwcJxOh
	f3SCQ0eh/5Gw1tUZ1LCs7YgolkYe4EYcPoNoEARn2A5tnnupphqhqT8yZr+pGqQfNaGhHj0dARK
	3WFtLHV8zdjPXzJjK/Y1mOqOn4VVSaQ7ZaupGu337oLZ1thz5PwWhqCJpMyM8UCUMI4/qXmQPU2
	eDdMfDD24pW3CRio/2P6f+/EQLEkqVbCl832xOMXnTqsqJQ5hj2AHntDuSb7k6Gw4PSH3LPh9Bk
	hUFZCYY71NoeE15iQ5ky7zAH9hZPSlU1c7jnBzijbBbS4FvFgJ/J0kGvUbRbUD+Dy4FBaplCPtN
	lqQuk1DA8Z5hneL4Iy3plmqOD2O75PfQKMUWDQTyo+NDGX2LomK5NJnNj86U/EDFx+zxDfkE6C1
	5xvAstDu0RumvKjqPBrAWoMdu1iRRQnIQYzfq96wSpcU4hURVhhKCqBAYW2rJe7RCY=
X-Received: by 2002:a05:620a:6493:b0:93b:d7a2:83d3 with SMTP id af79cd13be357-93bdca2333amr399972385a.66.1789745893495;
        Fri, 18 Sep 2026 08:38:13 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93be0e508a2sm165680285a.11.2026.09.18.08.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 08:38:12 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x7afD-00000001ssc-3a8b;
	Fri, 18 Sep 2026 12:38:11 -0300
Date: Fri, 18 Sep 2026 12:38:11 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Steffen Eiden <seiden@linux.ibm.com>
Cc: Sean Christopherson <seanjc@google.com>, kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org,
	x86@kernel.org, Alex Williamson <alex@shazbot.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Andreas Grapentin <gra@linux.ibm.com>,
	Borislav Petkov <bp@alien8.de>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Eric Farman <farman@linux.ibm.com>,
	Farhan Ali <alifm@linux.ibm.com>, "H. Peter Anvin" <hpa@zytor.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	Harald Freudenberger <freude@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Holger Dengler <dengler@linux.ibm.com>,
	Ingo Molnar <mingo@redhat.com>,
	Janosch Frank <frankja@linux.ibm.com>,
	Jason Herne <jjherne@linux.ibm.com>,
	Matthew Rosato <mjrosato@linux.ibm.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Tony Krowiak <akrowiak@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>
Subject: Re: [PATCH v2] vfio: Use file-based reference counting for KVM
Message-ID: <20260918153811.GE11599@ziepe.ca>
References: <20260903-vfio-v2-1-ef4cd4190ae7@linux.ibm.com>
 <apmsZ3j0mtZq4Lp9@google.com>
 <20260918134543.84754-B-seiden@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918134543.84754-B-seiden@linux.ibm.com>

On Fri, Sep 18, 2026 at 03:45:43PM +0200, Steffen Eiden wrote:
> I sent the changes incorporated in the main series[1] in 5 patches:
> 
> KVM: Introduce file_to_kvm_<arch>() infrastructure 	- adds the macros
> KVM: Add file back-pointer to struct kvm		- adds the file field
> KVM: x86: Use file_to_kvm_x86() in SEV
> KVM/vfio: Use file-based reference counting for KVM	- the swotch in one go
> KVM: Restrict kvm_get_kvm/kvm_put_kvm export to internal KVM modules
> 
> I needed to do the switch in one go (i.e. merge 5->3) otherwhise
> there would be conflicts.

It seems to me many people want this vfio conversion, can it try to go
this cycle? IDK if it can meet that linked to the s390 stuff?

Jason
