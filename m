Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793699926;
	b=dFQXHqjlaX9Z99vG7Z1iI77ZkgjmZGlJCJnqboFMAfYu7LgBYcd8jauG4LzdZphr9Fll
	 0RoorZyVMRJToH4HDcCco30bavtZxLJT52IjDNXWpJvYHXjMf+36Ngj3QGFolq4i33gc8
	 iumgXzDOjH2egVrp+ykfPVwSWkJ0Ym2xn6BgTAjMHcjHAOeUCtKmJf7rvGiqqS+LkZ03o
	 lklDD+Lfl78Y0yh0OF7n2k2C18uLySyigQ2tJsAY0fuJB4dQ0lxv+3BXDwuZjmsaBtJkm
	 QLiB6g0GRo1SyVdce1I8mtmxBPiXVbJyC3XRWaOgFAOzPAPzg9EU2V/g+oOLs29s/Pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793699926;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=iAKv+yT4A/GjeZOo4+mQtD3Vw+a5YgPIPq1fplJgNtI=;
	b=SeTjFbBDMJOkiOZcOf8lpsYCpMNJuirZvoWzfz07CwcyzsbLUCmsof6UqGA95EkYQWkT
	 D4PUqNGjR+RVyPr3T8csUIpCR1uXf6wphIIVFLUSORRggZXimr7izbrnfhZU30EOd8pS9
	 RvTmc+ddSK7RAg79Y/L6mmupfvqDiwgoaDhaf1VNMaDtLlrliGLIyUuHKCBMeXLR8E4Mo
	 gAUdr9kd+jw5Oi3AED8AkJAkFd09Bnn5Qe0qJoksQChtprcIlJfsnEloV2flRvirgpz4S
	 iyeLGxrGS2N+nNQsUl1yoMe/NBiR/+F3+0G0Mr1L0spglAwTKFeeVp3jw9S5R3KEgvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uhJ8zL+c;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9742606D829
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 09:58:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9742606D829
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uhJ8zL+c
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48df8fe8513so3414438f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 01:58:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793699919; x=1794304719; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iAKv+yT4A/GjeZOo4+mQtD3Vw+a5YgPIPq1fplJgNtI=;
        b=uhJ8zL+cXD/RApQpFWv9O9nfY0Ue33CrXAkMENgbUOQoAduK/JIPT/0CjLeNWjVcQF
         CYewWBoY7Lj4jOtItSjykljxkOben9vI73D+gp52pAQSBUGnRkDJzr/gF3YwX2t6s0Rl
         JF1W7UN6/fXj4D+1tMx94oUimiFTswu+vM/S+iBNS8N68BfkGWLbfvPl9edi8cVYpgjj
         j33hYoOn08xNu790FzvDB7MERtv4TK/A3Da4Z/hnCiC/N0jbqdDq7Sbpht3axJXJ5agP
         IpXjmAfo2+Ih5z2tijuv7TB28dg0PxqLhvAXjRt/2zh0oElyJUgse/urJULmPmFzf9LG
         BPUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793699919; x=1794304719;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iAKv+yT4A/GjeZOo4+mQtD3Vw+a5YgPIPq1fplJgNtI=;
        b=aHkevpfUfuFzJBHa8Je86fHpWxj/1aOUVSXjOSrbIbEjG7txL02ayU7TsGEiRPKQr1
         t/xfTWCSG9EHruxT6M9Yufzcfd34cVdYrr2kqO59WeBNAb9x+cfV6dED1OET/t33USKU
         mSlBIgWK4O0kAqWbmTHWIsAX6Q4fkKOwDlE5/cV5n7UE/zz5vHsqCqPw7LEKnHk0vZ7y
         cK3NF1Z03VW0APAKR0hVfD6riS7wK0mwccbVNOCs65rkgtaLrMakc1sCB7Glukf8Yv4S
         kmKYfZ+jvcICJGkpqA+r2g9Dz4ofB47IzxhwzcyS9zLusMR1pjTB9bJH94YeHQKaouPN
         mEOA==
X-Forwarded-Encrypted: i=1; AKwUvByIsD5L7EKQrm7nT9zV7Xgd0YlE5s6i94zNDo6oXqjfYs+3M/eqvc34DzKJgIqLWWXhvmh0HNa81m27hQ0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9LoaH1EiLtoVgvggipv7vtaAvVPd6vJGNDG/xP4zpydA2MkWXS
	2zMExx0KnavPj9h5ArOgp4WPlO8+KDfKOUjBGQBCkZstb/FmIDcBY3SW
X-Gm-Gg: AYBFou1xsXeZHVh1keVZr6peXRc9dVKsFvpnCW2jqcdlg2HmGX5JAVTHXnt2O4hMMax
	84fN6TxV5gTdBoLPiWCZOBu7KnDfVGqhbdHe4Y+kNby1T58NYM5IKnVvKxBiz1C0soDGNvi96g3
	Hv/ZL9ULiKT3rn0XJZ+Ah86G+qpJ+j6AkaEEEyCU68R+Iazsmjvz6dmdnbz9TMrHa79ctsrVUSt
	V7fmsCwAjzOwYuzndRQTzY3w537IiFbZnFS52PduCZbOBM8bSO7T9fwy+NHAJmximBExZwwbrXQ
	HZA6R/5Ra1kUIPRToJ0oRM6BQGNajbDYCYXx3Q0/g9qTKE3sq2INkdOzp3NNJ6lb1zljwiQBhJ9
	9Tl2uAaJBCO9TH4F7QDRuC8x/pae3Ga5188WHaJ3kDYbTri+kDF1dTblaylEairfEURZoUf3whv
	25YJ9WpHC7DsDMskYHwMC2Xr70VMX+P7/QWUelbmSX0IqIF9iigy4p365qThYP2jMJWKWshYizs
	rS8igrC8HJ32XXWPchWb1Cz2iTN2TMExsXfUQ2Oc+em5+3xf2+feKoLNn/kniLxNRgrFoy+rZwD
	EvUX6LEzRLwp934ZWC3AfVja0rkIisESbZ4WRtu6fgQaYJwGrQsh2Qq7O7mO5F/KtKU36Mun+By
	5uUKKG6+6ZxzefOv4mI9VBeKPbL04zoO7bLP6vbDx16aEin4upvpIwgYqWvx7yEpIiw==
X-Received: by 2002:a05:6000:24c7:b0:48d:f460:2c62 with SMTP id ffacd0b85a97d-48e6e50da1dmr29721511f8f.33.1793699918835;
        Tue, 03 Nov 2026 01:58:38 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b964desm23901951f8f.46.2026.11.03.01.58.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 01:58:38 -0800 (PST)
Date: Tue, 3 Nov 2026 12:58:34 +0300
From: Dan Carpenter <error27@gmail.com>
To: Johan Hovold <johan@kernel.org>
Cc: Alex Elder <elder@ieee.org>, Maritu Hone <marehone12@gmail.com>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bryan O'Donoghue <bod@kernel.org>, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: Re: [PATCH] staging: greybus: uart: fix heap buffer overflow in
 gb_tty->buffer
Message-ID: <aumwSiYE_EfWGdo3@stanley.mountain>
References: <20261102195332.19860-1-marehone12@gmail.com>
 <f3848ac6-a105-4581-8f17-fc9d3f748b74@ieee.org>
 <aumfB5MLWIQuTYY3@stanley.mountain>
 <aumlkgtsSDS1fw4g@hovoldconsulting.com>
 <aumpM9Hlh40t9UZd@stanley.mountain>
 <aumuFpFQWloRxaqO@hovoldconsulting.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aumuFpFQWloRxaqO@hovoldconsulting.com>

On Tue, Nov 03, 2026 at 10:49:10AM +0100, Johan Hovold wrote:
> On Tue, Nov 03, 2026 at 12:28:19PM +0300, Dan Carpenter wrote:
> > On Tue, Nov 03, 2026 at 10:12:50AM +0100, Johan Hovold wrote:
> 
> > > It's the kfifo_out_peek() in gb_uart_tx_write_work() that may write 2
> > > bytes beyond gb_tty->buffer (as its size is currently just
> > > gb_tty->buffer_payload_max).
> > 
> > Ah, right.
> > 
> > The right way to fix this is to have a commit message that
> > says.  "The gb_tty->buffer pointer is supposed to hold a struct with
> > a flex array at the end, but gb_uart_probe() only allocates enough
> > space for the flex array so it's two bytes too small.
> > 
> > Part of the reason for this bug is because it uses a void pointer
> > instead of a struct pointer.  Clean that up as well to prevent
> > future bugs."
> > 
> > Please send something like this in v2.  (Send exactly this code
> > but edit the commit message if you want or leave it as-is).
> 
> Looks good, but since kzalloc_flex() was introduced in 7.0 (and this
> bugs goes back to 4.9 it may be better to do that conversion in a
> follow-up patch to assist the backporters.

Yep.  Good point.

regards,
dan carpenter
