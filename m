Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794578759;
	b=YpzRuKfCFZMjHWwEw904tRtQ6nr2OrE/p47OZ8C8gMz3qnBwaqzY7EJ+3SbVdepYd0Sr
	 EWEgi5OxOQ+gebJlSYZpiq2fYq2cQCz25amUI2KDWSZb4JR07C8D1x0M1Gkck5a940/bx
	 IWwpnimgM/bx2YK9N0A46rKfKJq4RpSCZt0RlPKKkMWgkzzCMpv8fyeOPNjl8v8I+UK9V
	 MZleUist0Yjoi92CXNcjhD624gMKxK24vZN2OoGB8cPvQtDi43I1dqO2jrUdLfwP4wA8r
	 Gi6u74m16zx7IHgF2Muc6s8G2PSbRVK2+WcyM7GaddtB5gX/DPVbsSEPC+r/xHAboVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794578759;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=xJIkWIAhn6eaORk/+4XyI9QAEduquInk9Y+K2HPVW0w=;
	b=0ca5L370JfedIKTeXwhvowMyWqhaGH+jAotxw3+7E+sQOLDM3YFe8QmBCygP2DBDLh9M
	 9V0b8rsNUvfszi6faH2TcnyrF143cdNyB7Ek13ZazIP9gbD2gYq9LYr/vfhNdo28iKbzc
	 DXNgoz6prdwFFQO3NuoFSuWT0tDEsgDhVvNpRcfB2IMr+m3vsb6K03HRQjXj4lnMYOaKZ
	 W6LhN65EWS8PTQlDl+lRq+oJR2erxMDuy+W35TUquFIZ+oajUJVp8PQW9gNFBW+i4VKV/
	 rof+AkBht9uRNUHy/n4+tDkwf3FDXmAhTyOi+8/rYKuCIc58qWZIicDRW9c/7fiJACQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z+Dwdge5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ACC9606A335
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 14:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z+Dwdge5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E28381F000CB
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 14:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794578758;
	bh=xJIkWIAhn6eaORk/+4XyI9QAEduquInk9Y+K2HPVW0w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Z+Dwdge5Ra+Qb4v3rNlLoPNWUPLho8Hjpe3H7Cd7446TKwVmY53/Uo2gVeICay5jL
	 IJ/ZZASdD4PafnFGIRF8GZjyanoN3m3gT9ZbpXEnUsIA6am2cFqhsom8R2A4QMhA53
	 cCN/9pQYm4s2cW81ZCfxm2U1iUshGauU7UmTlE8tqmYANbh5C49WD/UTgzjmF1RXgF
	 RUW3joqEuIUu0aReR2TyLo+S1quZ7kPKziL+HZfwcDrrOEsweao74OXe7q4nFdq09N
	 97GVQFnQVYs2692KRrvoIePh2X3/TeSuMRDE+aOuiuainYY/XEK8ePDFBUHnMQipxQ
	 ORNpPe2y/FRSA==
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-67921b515a7so948998d50.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 06:05:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErE4zcBhZXwpc0AbATeXKhwe77UWUCvZCIGQcyR3O1JaBZttt6rUrkDZU6y346R1DlwwQter4TZFYnsJBK4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9IIPL157NOiGQMwq3EidcMH1tN7Kp0H0AA/7mYrb+RiyJzhMjC
	/BO9E4L0ey/N6ecOD1e180qPe9T06mdczIlBNjWtmNf3A/8DJcm3qd3uwWBTB9hfhA2IKUqZJC0
	D+TT1tAmrop+58GWl7z2+0XrKM32AzLI=
X-Received: by 2002:a53:d484:0:b0:67b:e219:e623 with SMTP id
 956f58d0204a3-67d897c8837mr1245914d50.104.1794578758115; Fri, 13 Nov 2026
 06:05:58 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112185044.41571-1-mike.michalo@gmail.com>
In-Reply-To: <20261112185044.41571-1-mike.michalo@gmail.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Fri, 13 Nov 2026 23:05:42 +0900
X-Gmail-Original-Message-ID: <CAKYAXd9p4zt7Z5bQg_+0fW7cc3j2nF+vLkMAGUL-OVa04LfKTA@mail.gmail.com>
X-Gm-Features: AclHuK8zxv74vsD7TmQgCqfUvXEVQCah9Mc8SlG8GpqRrDyi4FeM2mxXWUWcfwA
Message-ID: <CAKYAXd9p4zt7Z5bQg_+0fW7cc3j2nF+vLkMAGUL-OVa04LfKTA@mail.gmail.com>
Subject: Re: [PATCH v7 0/8] ksmbd: verify session setup requests before
 signing with their key
To: Michail Andreas Michalopoulos <mike.michalo@gmail.com>
Cc: stfrench@microsoft.com, icb@fastmail.org, senozhatsky@chromium.org, 
	tom@talpey.com, chenxiaosong@chenxiaosong.com, ematsumiya@suse.de, 
	lsahlber@redhat.com, hyc.lee@gmail.com, linux-cifs@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Michail Andreas Michalopoulos (8):
>   ksmbd: verify the signature of session binding requests
>   ksmbd: sign with the negotiated SMB 3.1.1 signing algorithm
>   ksmbd: use the channel signing key for session setup on a bound
>     channel
>   ksmbd: refuse a binding request on a connection that is already a
>     channel
>   ksmbd: check a request before signing STATUS_NETWORK_SESSION_EXPIRED
>   ksmbd: use the current command's header for signing in a compound
>   ksmbd: consume the sequence number of a request on a failed session
>   ksmbd: account for the credits of a request on a failed session
Applied them to #ksmbd-for-next.
Thanks!
