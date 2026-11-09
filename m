Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794247155;
	b=V6MFzXQ3nypf62FtLevNhJk67+y6rBdtquOlBu8oeJkUi2Zb8qGhWBwNn45I+2vCUSch
	 Y/TJX15iN2L3GJ4OrI6TH8ukjXcAb7rjI2xWQWgmuqZZjQmWKdwxPz1dQx8LEI2u3kWwF
	 NjNIY/3NYFh5kP8nsa0p1LWG5tkz3FiOAqy5+XPcpGDDVerPpQn67Z+dmSZE2hf08c1HG
	 5ZL7B6aTmHvJz5QC1eJRVKCluGUYVbEzpnDzcGl88QQ/Vr/OGTujnngt2zP9cNrJIsJtR
	 Z42m0kcCN8IXar1/qtWCdLLdohZrMZF9MwXSLyf2QqYwVuyXlADF0yLbeqoOqzmik3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794247155;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:User-Agent;
	bh=xzxrWa40iQ7LOYTF6q0Q+O79NFISPGm9rApGiB+AUmc=;
	b=xnQ57AX0KFYX17NxmWYZ+ArmyR8BqWYKT8px5yW8tQngV/6nDl1PhdHZfIj8M57Es/Gk
	 eCxgKCPyFQUR+MPai16quqfIL5zSLSGOJ0I+cIDxUfOmZLAEegQq1mBZP1afx3Jo/DVK1
	 HJStVmI48X85xbuGcOy5Xa71zU1qzywRTdZYy66R2YmJtvA+HYw3Nc/SBYgO+XNin7VR4
	 cCHmcfrPx4bOnAgmaDnAa5NajQS1EtLL8IoK9WvyqE242EWhuKz19jhyP3VdBmVD+u+7s
	 hrxWslffbrr2Res7UcXcR1mtZWmxAxqZSpnxTph/ysfZDLDWAgnwb/X/oyvHha+w7LQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NkyXxXqr;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Hfuq1k0U;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19545606A337
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 17:59:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19545606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NkyXxXqr;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Hfuq1k0U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794247154;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xzxrWa40iQ7LOYTF6q0Q+O79NFISPGm9rApGiB+AUmc=;
	b=NkyXxXqrpF+Xu/J80la0nrSXqdHWwnIonM/+vBN4R6nc+hyEj9ZQJapQQVm7mb0TWBUco5
	cJ5c0Ea5t2T/BOvYXfQ5bmgZfvYc1Ubh8JqzO8CXUlJ/Qeh79IIgu9snMIJenP0cirQzos
	Tk6Z1M/l/v94nxFz/4xL0bsDwyUitfU=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-57-cNafGgOtPN66rUKCQJr_ag-1; Mon, 09 Nov 2026 12:59:12 -0500
X-MC-Unique: cNafGgOtPN66rUKCQJr_ag-1
X-Mimecast-MFC-AGG-ID: cNafGgOtPN66rUKCQJr_ag_1794247152
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91e9a0eae11so17437326d6.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 09:59:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794247152; x=1794851952; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xzxrWa40iQ7LOYTF6q0Q+O79NFISPGm9rApGiB+AUmc=;
        b=Hfuq1k0U5lj48vN+VVbPE+g94Um9TL7NKt28h+pN/ZNFUl6D8MgsemgnVVqm33u//p
         3pyClyCyR2WrZyljS1BdUQd1gllRbbjlmwxGkP/YFf1rN1m7zvGZAFq6E4l6Ta8jdzpn
         QPdp4/enLhhwTeTrHvYeAc8xJhoqmCB+MzuCbdVGCFG5epxMgchtIpnMQKSB6j/tDEv3
         9ZgLzv1zArLUvhnjJ4u5FkUhP4ghYc/U5BlIagwgrJX9/+zVHeZuPhPXqJVDPz/S5r7j
         k8aa+Nj0tCwsT3Kk40rjH79/VjmtuapD4F3GG+bHm2x1fICu/CN51iM0xFdMkRaVCCT+
         4jMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794247152; x=1794851952;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xzxrWa40iQ7LOYTF6q0Q+O79NFISPGm9rApGiB+AUmc=;
        b=z17Ro/Drq6mZzLK2HIJxS7oTlef2Dp/qvXMPONl7vcHloeHRthA+gv8kl6mjOcONLl
         fuXXepKQLMbQZQaJxBwo/n6+iGcoLdmvN5owZCFrOUELlZbiqsHsJxSEutiNmtsIGgXc
         pCGDr9jIXWzzL1VEZYrGd5H+hAw1PRN02s/keOg2Urr+1KWyGRPUtLk7iVaUGKm5gINP
         ag5i2dS8dNXOnarTOBto/ThEVh22TC+CnQqgUSBESyg6RhjPDM8Y/ze8m/tZq+a7oyXZ
         DuHIl+FFPYqzV//5SGIvrjnUAXqn7IynCXcR2i89b9K8g0j6AjwffAntS5sJxfnwwdyk
         +dyQ==
X-Forwarded-Encrypted: i=1; AL+hErEEgdyIG9+99yn3mRcW2EhOI4b3A9ba3KVDs8PNtl66oPHGlGy/5a7s3MAeGbR2EN+P3j/7ns4redyJ8OU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+KmKJqqeZlouiqTEuH0NEoCw6qv4Fy/YO/jU6KDdmvUTuzC+/i
	1gVrhCLw0yC4frF8Gf2bK0yJ5jfq3cBkUJcD4KZ/Cd9NeMVnftlYgP8NXj2BcPJi8xXet2XiRpy
	z8ttg5khJHJSWs81qRjEG1QzMHBDCMeNm0nqXctCYwRrp/CsXH+d4sGULw36gn99H7w==
X-Gm-Gg: AYBFou1FkgZDYKyokBNBvT+yTKbesCVm/S3uBT1Bw3BY/EACN3lnRnIGWb4NUs0J52C
	8b2E2pa96Bl1UuYsTAkeyfC1i3j7ZMNd6p9/wtYB1QMC5LdvzLLyNpOyon/VAslrkBu7ryUs9q+
	jWhM/TB8u3t9p8taTDGBilPbfMS/x9QeJBDfr6LzgJrwzYmO6m1d6/j7Sg66nZHdZrdvNhXp1GZ
	IHcTmV/WDGbpMyXSWU2WWN0Ha5GeZMbj1/kUHUCOZhENuptXmz/jUsIhV6eqyJTtJutD7v/8X6K
	ISR5Xpb7BJZRsM+mFRFf1HI2qx8cQZbD4Mr59Sg9VBAswbxVHKA8+ug78s1rTcCB6pLfD89pOER
	vy14YLiOTXXfctebnqXsqBlaJuh0R3FERo4prxZcV27VkeadZkAROD8f0+36d6iK0V2k25WIXs1
	zgDs2+LTZ7uYw2fU+rfwZwZtvt5QAGS9S4vAPUYcI=
X-Received: by 2002:a05:6214:5bca:b0:91e:8a59:5fd7 with SMTP id 6a1803df08f44-91eef724dbcmr7141556d6.3.1794247151858;
        Mon, 09 Nov 2026 09:59:11 -0800 (PST)
X-Received: by 2002:a05:6214:5bca:b0:91e:8a59:5fd7 with SMTP id 6a1803df08f44-91eef724dbcmr7141026d6.3.1794247151158;
        Mon, 09 Nov 2026 09:59:11 -0800 (PST)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ef0540a8dsm1273966d6.41.2026.11.09.09.59.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 09:59:09 -0800 (PST)
Date: Mon, 9 Nov 2026 12:59:08 -0500
From: Brian Masney <bmasney@redhat.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Paul Cercueil <paul@crapouillou.net>, Linus Walleij <linusw@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>, linux-mips@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] pinctrl: ingenic: convert to
 subsys_platform_driver_probe()
Message-ID: <avIJ7KZxtTzUkpfJ@redhat.com>
References: <20261106-pinctrl-subsys-v1-0-f17582f32aaf@redhat.com>
 <20261106-pinctrl-subsys-v1-1-f17582f32aaf@redhat.com>
 <CAHp75VfW-DV_HcorM_XWWkBnc6YVrj0fBReFf=WgziVCOoEjzg@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75VfW-DV_HcorM_XWWkBnc6YVrj0fBReFf=WgziVCOoEjzg@mail.gmail.com>
User-Agent: Mutt/2.4.3 (2026-10-09)

Hi Andy,

On Sat, Nov 07, 2026 at 03:58:23PM +0200, Andy Shevchenko wrote:
> On Sat, Nov 7, 2026 at 2:27 AM Brian Masney <bmasney@redhat.com> wrote:
> >
> > Reduce boilerplate code in this driver and convert it over to use the
> > macro subsys_platform_driver_probe().
> 
> Wasn't there already a set of patches from somebody for the same reason?

I just searched the linux-gpio archives and I see the effort back in
June to also add subsys_platform_driver(). I wasn't aware of that
effort, and it was never unfortunately merged into the driver core.

I got the macros added in 7.4-rc1, and I posted patches across the tree
to use the new macros.

Brian

