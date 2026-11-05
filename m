Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793841671;
	b=FF3mqKwQsQYhD7iEPv8g7AKzXUKuQRD3tMOzefW+vYnldwqOuK6sEwIvKXIChM7NgxUh
	 ixAsK4K2n+Z/lSIYUs/rRUoz6bXA8QO/bbZPQjuvxstJ2inxOyWbDrvMJUHtdWFZN4rpo
	 cgmkkZu9W0P8YvrUSA2ptqzaduFbaDKOilIVf3aniMSYglhwBu+8RMXMF1SrwFeGCM+sh
	 h6RtQa4sDuYlG6Azhy8mFdHRvn8+Nw/5HiuVjp+BzC5vy43pQcpmGf8loraAklJ/zvRsa
	 XWOb1Mnb/0CGItUgTHHBzpCYtl4d5lbXsMuiUip7ZIp8fu3AdgI/RjRenRqqfyi3Ckw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793841671;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Content-Disposition;
	bh=x5QYTvCtCz3JW9P9W3Sr2AhKR5sD7hyZrYU2fGwOKig=;
	b=PDvjM36HpQMtZpuu6TJDJ4D/wCYNKDinCeIy7Qn30+x1JTD5+cye/4moKCe2AVxx0DJ9
	 K3IBCSKWYxa9n20pbRYGkmAKtJm8aRoVpGG0L2RRSTSar1GlagOFtLy4Esl/z8d4AJ8JP
	 wlTnPEvFU3fDx5JBPESRUF8uK2kGS2HCUnSPvJRU8DFIQK8yYTAcLmHwLlT0xLMli2CKj
	 jcqYnqPVJr7LBvnUVNtBjQkvOhJCLgAFlAqXbCR0Yi69xzmANd9KFdham8Ji2kvCcE987
	 pwnHfplmSumxuzlYSgS9Wes2JIol39uuyBjgzKuJuWqcfTM7sgaTHos/HnvCe0TbgUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BD16ZQxg;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98373606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 01:21:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98373606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BD16ZQxg
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-14fc585291cso1350897c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 17:21:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793841669; x=1794446469; darn=vger.kernel.org;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=x5QYTvCtCz3JW9P9W3Sr2AhKR5sD7hyZrYU2fGwOKig=;
        b=BD16ZQxgHFmbFqo9AZgHLxmPK1yaIpujrhkdBWMRYRoO1wP182BXbj3NB7e5IaD78b
         VN6bTJKTDfxdhAzEFCHFjywybvH+9QNhANiMPsiCKtSiKaCcX6sCkgsgDCB4Cr2GsWww
         EOo9kbl7jT1tHh5EJiC/BV0GKpAxhVopG+9chtzgjfCzPwvx/RZEwg5c95pFMLd5cn79
         sJ2XKTz6ewvm+3vuWaLJH6YpMx+6q7qUQ3ovWuJ+uAuzszpfr/D0qqQRxOEpKQ7RLE9I
         YmZ407/QcVwCfBeKjct81iwjf7epmgD+ICtDiOgOSEZrdWICh9lnJBr3fwcEgaQk/H5q
         7XYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793841669; x=1794446469;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=x5QYTvCtCz3JW9P9W3Sr2AhKR5sD7hyZrYU2fGwOKig=;
        b=M/4S8jW+NUoxvd2KrWBMVazkjKHaYUEfHojgM8e4w6HHR0vW3u5kcBwQMaP6iRI5IZ
         izxi3d6Bb3DTseawI4qxRm8bV5LnHWwytV8calBaTNv62I10pyT6ImbeuAwo9z8QbtFM
         Za6KMdw+YUyrxECJpix7sCsb+wAdzMInw0BKvyWgdgtWtTCptVjlOpaFO3boj21EfOZl
         GEthzvM4MXLxgQt1VfjHKlymIkrIa0jMrC5Fj2lklQLUFIU47YV7cKgOLPcEKJx7W3Wu
         SuV+UKa8tpZMcR5kYmnktryqibiU5fS4Py/X9UDfMSO9iPwBey5hzJHIa2+d/org64kl
         iehw==
X-Forwarded-Encrypted: i=1; AKwUvByTH48zQqFXDLf+DoqARWtNLzN5FaMP2yNyn4PFY8Oum42Xj9D2AXvUmHWiNnWBq7Rt+w2hxM+1zq+hdww=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ivSAs61EY2jyIbHZAqgWcAn9BWm/3HJ/IbRL2NPVcFnbozgqJ
	WTvFVwM1SOTXHNI0CkUOle+l7tmmM9GA/1FRsVpiCyIimHVtyvZsOGaj
X-Gm-Gg: AYBFou2HVvTJ+O0VBktuJcehHPDDWakPC6UVkPcLrBhR2cddIH/Vuhh7y/Kbg1u2apK
	9hXN5vpwCQ0VWaoUNgwFFo8qSuk+S0JGgEYNUoKhSPqLylUFrFPWfaSR692V2r6EGnYUClS2fix
	IKz3mrzYbXgfxbvoejDiG9N9EI3ADlDoPtN5aPkFtr7oqqZlP3Le8zCf9LY0adyAwXi+nq4A2XN
	mcHo5k4uePw5a/vifiCDtggCfEquiQ70NlsjIXM6cAwJDiqdNGYirWnskyEGGEjuGSZiWorGEHI
	iSQpVpLbciWA7N+kQkqbiYGdGZ7Fb107QfZhEF3JqTnaxGvf5Jn+hJ7L5G9DpExbaonbQkX3jIp
	Cm0e2ACuiCDzj3uBQ4f5XbgbJsUUFER9HCk0H73G+PcgMXLBdN6mvJxN+OdhIQDoPIczN1BJztn
	NF84c0JMjFsKZsg5DXbabyfDbbNIwabZ3Uw3LcVsY4Obi9UmvD9bhd9NcoPn4WhFczCktvxGNoL
	NqmfCxbGSdntPTw7q+IlNIWQLTFTwNnYIYqD+dSzyfndM+g1W4gOh++FbRDnVXrqtw007YnZ12+
	cIlzOdDUWYE0TB7lC51+QDrzsEV/76ZMt3fcIIjCbZNaCankRS29B4kVLouqFTohs79jzg==
X-Received: by 2002:a05:7022:29c:10b0:143:8860:afa1 with SMTP id a92af1059eb24-1ac5f36d693mr25685468c88.46.1793841669393;
        Wed, 04 Nov 2026 17:21:09 -0800 (PST)
Received: from localhost ([2a00:79e0:2ebe:8:c8f4:b7d9:252f:4483])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245ac2f44sm12371355c88.0.2026.11.04.17.21.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 17:21:08 -0800 (PST)
Date: Wed, 04 Nov 2026 17:21:07 -0800
Message-ID: <21f4cbf39c7872893f8f2d3bfde7d829@gmail.com>
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] driver core: fix race between bus_remove_driver() and dev_driver_uevent()
In-Reply-To: <2026101409-unkind-ablaze-08a3@gregkh>
References: <as71DkwHeLGNDsPv@google.com> <2026101444-unnoticed-caliber-21d5@gregkh> <as8dAu4R99pP1GHD@google.com> <2026101409-unkind-ablaze-08a3@gregkh>
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
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Greg,

On Wed, Oct 14, 2026 at 02:16:50PM +0200, Greg Kroah-Hartman wrote:
> On Tue, Oct 13, 2026 at 11:11:33PM -0700, Dmitry Torokhov wrote:
> > On Wed, Oct 14, 2026 at 07:31:19AM +0200, Greg Kroah-Hartman wrote:
> > > On Tue, Oct 13, 2026 at 08:24:20PM -0700, Dmitry Torokhov wrote:
> > > > @@ -830,6 +830,15 @@ void bus_remove_driver(struct device_driver *drv)
> > > >  	driver_remove_file(drv, &driver_attr_uevent);
> > > >  	klist_remove(&drv->p->knode_bus);
> > > >  	driver_detach(drv);
> > > > +
> > > > +	/*
> > > > +	 * Ensure that any concurrent dev_driver_uevent() that observed
> > > > +	 * dev->driver before driver_detach() cleared it, finishes
> > > > +	 * accessing drv->name.
> > > > +	 */
> > > > +	scoped_guard(spinlock, &sp->klist_drivers.k_lock) {
> > > > +	}
> > > 
> > > Shouldn't the compiler just no-op this away into nothing?
> > 
> > It better not. Why would it?
>
> Sorry, early morning before my coffee had kicked in, I was thinking a
> simple lock/unlock pair without any data in the middle might be compiled
> away...
>
> Still feels odd though I don't have a better idea.

Just a gentle ping on this patch. Could it be picked up, or would you
prefer a plain spin_lock()/spin_unlock() pair instead of the empty
scoped_guard() block?

Thanks.

-- 
Dmitry
