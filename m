Received: from mail-yx2-f41.google.com (mail-yx2-f41.google.com [74.125.224.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 651A34AFE06
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 18:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790275096; cv=none; b=NUX6KjhlfOVQXVVDNlLv4QqxDPWDW/GYqd8+agclk0LMv1RIVbIS+Pa5TX0NL/V4ujEIOOspSRX0JMzqPTIM+BLoglyV9v9v17l8BEyFTDbAfckQ4pk+a7syeBAJLR6CE9zB9Ya35hXehrSfalbgcVFC2UUOZW7f28btoYsmYkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790275096; c=relaxed/simple;
	bh=KtJnvxUz7F1I15+Pd4kNaboHZ1qLrVt2fXrek2eqdJc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QMePnJZQWz8WN8kVD2CfPvnqrTdYy/RQREuPNs06OVBKiSSY8/W7AsSJhEcyU3NsiPfn3lENg0516rAH+m12W6P1zc96UrrHyTliGPuuGselVWbragqy9nxRplzUDmuxfSyzeVDTQfM418GY3j1mB9NaaV8AzhpZ4LzYyDZ4fu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kYnGSJ53; arc=none smtp.client-ip=74.125.224.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kYnGSJ53"
Received: by mail-yx2-f41.google.com with SMTP id 00721157ae682-8a860e532bbso840807b3.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 11:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790275092; x=1790879892; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OKxC5vK38YZk3hwc5cGza3RH/rKb/7PEzxup8t6oAVk=;
        b=kYnGSJ53NBNWDf9RdAv/W6NO+CnYjWPEHfDRqOU4LItsVLT6PFb+J6QbFob4r0/0YX
         hQJuwqH9OLpcNdK8bLFM6NiT0U8kd7dwHEsL0OgfMgdHhQNwfeNXkujIfS46oVrPboFE
         35Vvv+Mh1RGyeaDlW8xo/ZOUI5o40Oe3wRx2Dab+5Ek7yw75IqPKyuPc+ah1dxRIsgy8
         e6KmIPWIrpZhpAOZOhGYWfQBpEFwp/C81FwFY4EkiVXeHvwfyb9lJsysHzyCaOedEtS7
         AQeqH4dmv+2hfoUE/MGNa7Qx4KI8NIkf/47IobOuIbmYG+HAsQdM4yyH+jyFLda03ZTO
         Tysw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790275092; x=1790879892;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OKxC5vK38YZk3hwc5cGza3RH/rKb/7PEzxup8t6oAVk=;
        b=F7kw5JnEaX9BYegwTclZGALhnFSNKSJR4N1uxY5ZCF/bOHEN7bB5Addr/hO3oUSMFt
         HzR3Apno0LBeIXoqQe3uPAa9eXDmub8g9dUzLZM9Oyaz+OJtbH4DqtfNqx5qhILOdclH
         VDrZcf3YPxCNQEq3P5U6HyIwghRDz/IkLfx6V9Z3SnMJ37iKtFo1wgz8Jag6tyMAc/7p
         l6yjvSHOzZGJRRFWWSpuKtc3zJXPl5N23Bkk+SB+xegYmCLmf5IyPy+hOxbdRdcKelzV
         ks39KrVFuBMhUp0FTpl5rr2if5H82kucIz4fBfJcnHsD1+xuC0aqVdtgeQiyhglEuOLi
         z/lA==
X-Forwarded-Encrypted: i=1; AKwUvByyBYBKOzoqThq3rg+hL053Rw6MKgfTuRk2TOEhGYKl/hwsTVEVrbHbOxUQL1CG4WqY3tMpccQ93o+Cau0=@vger.kernel.org
X-Gm-Message-State: AFuF++koQUofPTCVpf2s5tsOjTHWy/t7OiHeWvmNF9gI3FdJs7BjXsiv
	0d3Vz4+kJ8Gk/EfLMOWiuz7pq0dvaOCAX4hQDag41Ucu72YcCn4p/9Kv
X-Gm-Gg: AYBFou3n/IrLIhLR2HbWhtPuYaexewSezrds4j0D72Jkvo1LNnzfAw0Fi/M8LZkmZnp
	ylwSXTsE6VJggLyG8URwMCpGfqPG3rbQ9JF8RLG/xLNrP57+X9mhp7bDBqi0WV5GxCrSMONcCZ4
	MRfVs1dKSufekcTF0Uz7osDbGQxiYjBED68WRILonPrZTTz0cxtI/ZBN1uClqr7DzEJoTpI3l4g
	np73jo7M4mXleiS18Q9Yp6eFB9SpEw2JPd/Q0f+MWG9VVnzE98hQFm0dSwN1WkqKpfLzQ6OSb9M
	36S5sqUkxNSODYyyADAy3LHJnLNExwlRkBm2shESC1584PrM4D6ESWAKP0tdV0olufr9K4dSbzq
	OYy33StyehX7SV8RftUoUfJjrZ3uEZaRUyBQMpwy8lSCB0nKg6ql9yheY5TkP4e9LmQBPPNVJuo
	ZU19rOExmFULO0tXWrVGFt3cH25G8QMacv/h9ws+iYiNElP/MF7551dmYFtZ8w3c6R5ZKKCEBqg
	CQ=
X-Received: by 2002:a05:690e:4403:b0:672:99e1:11f7 with SMTP id 956f58d0204a3-672ed528680mr1242578d50.148.1790275091473;
        Thu, 24 Sep 2026 11:38:11 -0700 (PDT)
Received: from suesslenovo ([71.132.185.69])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-672d81781c6sm2494424d50.16.2026.09.24.11.38.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 11:38:10 -0700 (PDT)
Date: Thu, 24 Sep 2026 14:37:40 -0400
From: Justin Suess <utilityemal77@gmail.com>
To: Paul Moore <paul@paul-moore.com>
Cc: David Windsor <dwindsor@gmail.com>, 
	Daniel Borkmann <daniel@iogearbox.net>, alexei.starovoitov@gmail.com, brauner@kernel.org, 
	john.fastabend@gmail.com, memxor@gmail.com, kpsingh@kernel.org, matt@bobrowski.net, 
	bpf@vger.kernel.org, linux-security-module@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH bpf-next 4/8] bpf, lsm: Let BPF LSM provide xattrs at
 inode creation
Message-ID: <arVkWs7tG3ayGxyX@suesslenovo>
References: <20260915150739.284189-1-daniel@iogearbox.net>
 <20260915150739.284189-5-daniel@iogearbox.net>
 <CAHC9VhR2Zp9LzDRwDOZoesOC7o8hretfgRH-PRqQRXA0EES2vA@mail.gmail.com>
 <CAEXv5_g1XQAwsydnbu9SUvxNBdYQf+xXjPaZMeC8hxgfThP+pw@mail.gmail.com>
 <arVKSpezisxe3pkr@suesslenovo>
 <CAHC9VhSwbHF8tZkZ00JM40VTBeXVgcVdoBt7NcX0XKaKSARWug@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHC9VhSwbHF8tZkZ00JM40VTBeXVgcVdoBt7NcX0XKaKSARWug@mail.gmail.com>

On Thu, Sep 24, 2026 at 12:23:13PM -0400, Paul Moore wrote:
> On Thu, Sep 24, 2026 at 12:15 PM Justin Suess <utilityemal77@gmail.com> wrote:
> > On Wed, Sep 23, 2026 at 03:14:28PM -0400, David Windsor wrote:
> > > On Wed, Sep 23, 2026 at 12:57 PM Paul Moore <paul@paul-moore.com> wrote:
> > > > @David, simply for my own understanding, did you ask Daniel to do
> > > > this, or was Daniel operating on his own with this patchset?
> > > >
> > >
> > > Daniel and I work together and both have things written on top of this
> > > kfunc. He reached out to collaborate, I agreed. We're also going to
> > > send bpf_set_file_xattr shortly.
> > >
> > > This implementation was chosen due to its immediate mergeability (it
> > > only touches security/bpf), but was actually suggested by Kumar in v1
> > > or so of my original series.
> > >
> > > That said, sorry for any confusion about this appearing as a new
> > > series rather than as v7 of my previous one.
> >
> > Howdy all,
> >
> > Hope you all are doing well and having a good Thursday.
> >
> > These patches are excellent and useful, and have been in the pipeline
> > for a while.
> >
> > In the interest of moving forward:
> >
> > Would you both be able to live with the following: provide a security hook
> > for lsm_get_xattr_slot or another proper interface with the necessary
> > abstraction, and keep the kfunc where it is in fs/?
> 
> That still doesn't change the fundamentals around the kfunc: it is
> really only a valid to call it from within the LSM inode_init_security
> callback, it populates a LSM framework managed buffer, and that buffer
> is then used to by the LSM framework code in
> security_inode_init_security() to do the xattr initialization using
> the values from the BPF LSM as well as all of the other configured
> LSMs.  It's very hard to see this as anything other than an LSM kfunc.
> I worked with David over several revisions of his patchset to review
> the code and get it in a good place, I'm supportive of the basic
> ideas, but this really needs to be located in
> security/bpf_lsm_kfuncs.c as it is an LSM kfunc.  As we've seen there
> is precedence for subsystem specific kfuncs located in the associated
> subsystem's directory, things should be no different here.
>
Hello,

I'm less arguing for any particular placement:

More so that the concrete security interest of just getting the kfunc
*somewhere* is much more important. I have no doubt that the function
would be equally well stewarded in either directory.

The xattr kfunc in security/ question can be fought best in a different
venue where it's not holding back good contributions. So I think
swallowing this bitter pill for now will be best for cooperation and
good faith if nothing else, otherwise users and contributors are left
footing the bill indefinitely.

Admittedly I'm biased and am toying with a project that this kfunc
would be really nice in, so take me with a grain of salt :)

Thanks,
Justin

> -- 
> paul-moore.com
