Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B10477E37
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 17:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788198094; cv=none; b=YA8oljg05lS8EeTeO3RDaH8nwnLCpNuhao3nR1Ox+1xk5j6Golz0APIsGc3hSWzmvPMPSycsvPvKnMxv4wLzMLf5JseWpoE54SyWGjmg/oXJZbUFDZKsPlxayvqJ5lGuamnHn4PlAvaUXkW8A1GrBBZ6UGZyFwmcxOWhiO/b6q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788198094; c=relaxed/simple;
	bh=C/Rz9qm1AS7WcIJwDp7Kv3cwkoR6F2w0jDkOHOcFIFI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b2tO/BSTwC78gIpmB2a8AP0EWgRpd1aLaJHavuE76Rd3ATbLfED8qugc3d/A1Fv8Nmj6efh5X5QuJWAEv+Rkyn32ZLMDHTv5sd/SNVB78vXQ/kd9lm9MbGYs8B17OLN6YqCWfha5c/Xa9Oj++OQXyiu1EzHdwTob9g9zbt7MnqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H/3gY3aJ; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H/3gY3aJ"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-92e6a434cabso656685a.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 10:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788198092; x=1788802892; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Gve2pugT7l3BMYWVMzhugMxNXpv/Y4BKioJOYqJB6Is=;
        b=H/3gY3aJZjb/853Y0ygGssCvXexBNV7ijQaHpGAfUzoEZkuCUQHwyTuqBigVIvUjz3
         jU5zRsdLKMa5OpLORvfvdNuUFCuLG55mu2A2/YEugk0Jf7UCtqvE7IRNH6O5sLLlfIrn
         P+nVPPvGujofLsCvBLJd4YJy1BES4qnyjspmgsOrVhO25rrG9ThK2wxo/6pa+nHc3AWc
         4+U8AyqJ0AcYf8Q/+P33Fa8yHo8EAU3Fsw0WiR65EHWE5NNysHzIz/LpRIm/9j8zQyzF
         9n7Y/wJibiwY5oGUPAR4EsAeJgWf4gpfIkhiHnJFsRyHcATed2A1N8Loq5OsjVtshyuk
         /0vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788198092; x=1788802892;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gve2pugT7l3BMYWVMzhugMxNXpv/Y4BKioJOYqJB6Is=;
        b=JHfosDZ1OAs7Q1NL5VrHrLJtiCpe22kTnH7Tez50VhhNLMaoq81HhCbiaufZBiGzdH
         ZuGz4tgvqjlGRAcDg+37eX0Ie6rWpMiLK7yYeIh2cAfpPdBHJmsBh3RUhxDSXSF4L2V0
         yZSJ6hSYciQ717w3aeIHlOSdNX1xxIhD33DMQv0yPmq3uF7QpdfG35Gm+2hTXQObf4w8
         TudQox34zs94QBs9Ws0wXGs0xO1/55LOqRm/yIL0D8sAT7sguqI9F5hOJFN75XTzsbmA
         HKdDejWWgoGd6h/Fb/6WJhsBAHvnvVTazRid07LWrB4hgPPQdzqJliyy2ELqy1lR/ER3
         a5KQ==
X-Forwarded-Encrypted: i=1; AHgh+RoaMnb8WcNNrZ6ZLgJvanpE6L6HhNf4QZ0/HjP+NjvCCzYeCBh7g3SOdcE4gyP3QQYByr0mkNNzyFY1y6w=@vger.kernel.org
X-Gm-Message-State: AFuF++l5y+odA5X/DhxVjp7NWThUSlQy7wQA5BICAMdzen3gY3yQYPZk
	ljcHCW2wavW8VBQrK1oP7iq/VvS9WIeRXe0Vd+Wyk4LRUqHn99ZUPpE/NSAa1wmT
X-Gm-Gg: AR+sD11Gg+2fYiCaXDrBmcYQhEUx7pklnbB0RKJnhxUEJ/Jm+2XxzVVJtSWFh2KumK5
	V3qpIJNK18SClnHhn8y/o4sGvaMFhqUa2VwwD+ZgTC4whsSJuTebvJAjye+H+ITwPATcXQoTCND
	AT7LdzuYPlvgxaNFyY/o3KUejvgHJuKaQKIuzyPPfe3HNFmcuO8S1y4C0rSaOQcFfmQaIq/2N0m
	wS0IuLQFnO/xEhZlqkW+PaR0ehdbv/CQJJpcIc/yJb44omsNSOlEwrQw7SFy6eKZInvovFu7cVA
	48vTD2HPs9cYSeWHyuWu6K/OuKn7vsx2hou0nI8Gz4Mr8SIhpTEoBv5d2Gxnf/uiHxHmqLEisxG
	sE7cbvSqt3yQ4zDhFo3We926rx7pJ38Mh58lKFu512zitXgAHX3PGdBjxzBVJH2ILB7ZB9KdlHT
	FD0cvM5Edx/CbyTqCXKIDELOBwD0MXFtjGzlxDpDtdC1BY1UlGYjoVzG5DlpSSEnMDue6WfTE23
	8dvZgKWNFBZUmw5QeVDufVcr22NNFAlrQ==
X-Received: by 2002:a05:620a:27c7:b0:930:a635:a782 with SMTP id af79cd13be357-9391380cd2dmr3621041185a.11.1788198092300;
        Mon, 31 Aug 2026 10:41:32 -0700 (PDT)
Received: from zenbox ([2600:1700:18fb:6011:f6fc:b424:b1bb:6ff0])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90ce444e76asm89697106d6.2.2026.08.31.10.41.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 10:41:31 -0700 (PDT)
Date: Mon, 31 Aug 2026 13:41:29 -0400
From: Justin Suess <utilityemal77@gmail.com>
To: Casey Schaufler <casey@schaufler-ca.com>
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, 
	kpsingh@kernel.org, paul@paul-moore.com, mic@digikod.net, viro@zeniv.linux.org.uk, 
	brauner@kernel.org, kees@kernel.org, gnoack@google.com, jack@suse.cz, 
	song@kernel.org, yonghong.song@linux.dev, martin.lau@linux.dev, m@maowtm.org, 
	bpf@vger.kernel.org, linux-security-module@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 01/15] lsm: Add the LSM policy object lifetime hooks
Message-ID: <apW7yi06EutRfCBO@zenbox>
References: <20260831145858.3869191-1-utilityemal77@gmail.com>
 <20260831145858.3869191-2-utilityemal77@gmail.com>
 <fb9ee5e1-dfc1-460a-85db-1f31f2f6ed17@schaufler-ca.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fb9ee5e1-dfc1-460a-85db-1f31f2f6ed17@schaufler-ca.com>

On Mon, Aug 31, 2026 at 10:17:43AM -0700, Casey Schaufler wrote:
> On 8/31/2026 7:58 AM, Justin Suess wrote:
> > Add struct lsm_policy_object, the identity an LSM embeds in a policy
> > object it shares with BPF programs, and the three hooks managing such
> > an object's lifetime:
> 
> I am not seeing the cover letter for this patch set. Are you sending
> it to the LSM list? Without that I do not have sufficient context to
> comment on the patches (1,2,3 and 8) that you have sent.
> 
> What I do see has me quite concerned. It's possible the cover letter
> will addresses my issues. If nothing else, I assume it describes what
> a "policy object" is, and what it's for.
>
Indeed it did get sent to linux-security-module, it's up on lore as
such.

https://lore.kernel.org/linux-security-module/20260831145858.3869191-1-utilityemal77@gmail.com/

Possibly got caught in your spam filter?

Indeed it does provide important context about lsm_policy_object.

Thanks,
Justin

