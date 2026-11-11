Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794402518;
	b=cM/IxWg4/b8QQ3FfglAgd7S+t0ijXVbh0Rl8wOfIeiqt7P2fxWf+ReUcX3UJxg8A5Tqz
	 U+OOTp0UQNJPRyJaIEcuIdgaRmUoWFG+MqxNyzQTOhS4gBbjqqCVuY3VSeaUp7WUTj5/D
	 9hZK5UnY+vc0tipW7A9GbOK/jqgDWDI0D9G4In+aO0jIwlRG3j+p9vw1AXeWeas3xw3BN
	 RWKUmCpmt6UYcplzXY5dVwfbjqaK/MV6Rz0kOMOeKZ80verx/PbgpuIw0y7HB1Brec7dj
	 /Hlg88IQITAdFKrcGrDmVaD4GlMemwkYHuAtCZA1s8CwWGmc4zGbPz38OQXGJR6NEQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794402518;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=gSQbVcKPQJwETt5FSUoaPH66H/Mu8r7z5yZRwgw9qTM=;
	b=PXtVp5kalQDMgxfhyaQyVcnOAAz5AYJsYi9kK92Ge5zxTa8w9XtYtsDCVMvD5luvSbUc
	 qRu8s4SxDi51ORGAJVKdOE2i+7m9XePHT0IqIzPvyaaIVr9EPzK43YBxLjIkbkARVBdBB
	 rbVP/4o+gxcUiIlFzw4Kw7fAgKlQkznFmTugVF7h7jhh0WGQMlrN0LjG6ljsArS9tbsOp
	 NqMvun/q2Y930Z4KhzolYqoAsE9d4vfRmg2lyBMW4bKVN5qMxWv9Z7WhIE0HeQsOnnnEf
	 1dLee159j7Ioe3XuZ9NAOrj2gFvgNwwj/dfMcN5JDLmBMEP0aWzXAWdLoNOE4cIkKgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CyP6U48N;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=dl+iOwHk;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B247606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:08:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B247606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CyP6U48N;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=dl+iOwHk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794402516;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gSQbVcKPQJwETt5FSUoaPH66H/Mu8r7z5yZRwgw9qTM=;
	b=CyP6U48NEphKdWZGm0NGAYw4ZgL/9yEtOaxLjN2odfWfumXQ4FP9WLV6QTzYUbqIwvpLxq
	IFADfrcjZCtJTwY5j3w0NXwHC8D015mnBo6uD0pnf1b+BvuDX2DHCZRtDKqRV3l9/qQEw1
	AFvNtXKvkOk3UuVNcnz5BxivSmqiSEo=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-495-g5cKS1RbOqGo4DaEtVpfCg-1; Wed, 11 Nov 2026 08:08:35 -0500
X-MC-Unique: g5cKS1RbOqGo4DaEtVpfCg-1
X-Mimecast-MFC-AGG-ID: g5cKS1RbOqGo4DaEtVpfCg_1794402515
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5358515b4easo56196181cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 05:08:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794402515; x=1795007315; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=gSQbVcKPQJwETt5FSUoaPH66H/Mu8r7z5yZRwgw9qTM=;
        b=dl+iOwHkeDxqEWRUx94xdYjyTxeBE3I7du8tCWGfgmbz1p0Kym3NW1urdiiCed8L1M
         2sNgecxvFfeP4U+AKJ7fCm9/YyBChLDxw0BvvfvhqSRodKyg4uZWth/oFV66j5h6sDbt
         RShoxxDEyan74c5YocY2EJO44SfUysTqg2y/Ny9J819ItDXzaY17uQrGH/hcLAxyv8Mm
         eo2BtG/Nj1aORecA4IBgNIlAzzIMEZsslcBUSFVKsGg4R4rElvSAcaXrWg5x/+OeLcHy
         Z6ystUPxgJULckqABYZNeRkXxOwAdbC65vvixoaLcNlgsFqgQQUi/tKTgbRIqfnbjFYA
         E9FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794402515; x=1795007315;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gSQbVcKPQJwETt5FSUoaPH66H/Mu8r7z5yZRwgw9qTM=;
        b=2joKxE6RK6nhIGFrHYmreHh6kqCylCySr13BrixZmicB2qQ4g9GQ6ByRMYJLQDSZKK
         JLwzZiHRNS06zc7AhyM9deYQ8X6Aab6MVNqZ8ZVBwkh2tqY+6HTyyRa1DqbhVX6kH1fw
         e8TlXO8lWe6Kb3xup+h0zaoGbELj5uYu/fcLmQC+2JBX9/8GrZCLtXBFFDxFLg7fDyNK
         OjZy4Bh8PItBsE+1z128dkz39KRm7uJNAmP5flNsLuCLUMfqQEg4c8Vhk1RegVLctQjZ
         HlVw7ntXZk2am2hs3a7HVYIz/ZRLtSCVNesoxOaq8eh5Gz85ynuG97RKWqzD0G4kXeFO
         VIWQ==
X-Forwarded-Encrypted: i=1; AL+hErFgKsUxAO1wBHRFkCj6wZFkUNeqlJMwXhic0ydNMn5Gt/iQup9yl9BHjo3ZdEGKGatvbc6q3wifQASSzz4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ID+w6KcFpoCL5YVbtNNtPevjFUUgkdL+4UqSFbWfD3d1ODHAZ
	2toz3lml8ZBiaizXD536xTGcWNbnLKgSYZuzg+RsJcGFB0AQDM7Ey49PU2J/Kw1Us7hzEwAVZEU
	D9DaYcFWZFihOKEoCBB9XvAB0YzClRBMzAho5QQFbnWRsE0m6PHmRdb69+Lj/7EfxgA==
X-Gm-Gg: AYBFou1IdNqZndT/16Z1KSUXdALgnJ7Q7g1pBxBfuPe7u6Y3aT1AhkrxddQbsUW6EbE
	TGnTIDdZhZhAzwqaVN4I99fInn3yBSTcMaRL/k2HiQzv8Gboj0kM1sXUtPbFgD7eokbs1CS4sL3
	l3XYwGPTgjX1zyc9Jd99CHen0oVpEkkI6lKa+XgTpWFFW4ZL6+6yDUsszVYQrdJRsFeQj6Gs6BY
	Tu9cZspx69g/FePJ/V+nlivfV8cL0Mq+n6S5b+Dg4aW6HtqeVQ8UkNyqib7T7y20O59hUh1J6nq
	oOVaYLDvXh6V6BaShaKNsvWEtdTCGdFAvmFxixxA7MYJ1LBtuL9a/2Is8m+qw+RseogiyW1a2Rx
	jLvkSB/a/FZu/wsfMrlEIGyCo3tVT+4PTAoeK/qK0QM13LvOsQCYKLb4Vr4MJMBQBdC7bF+i5Je
	t61f5CZIZVFcc3AuMTDKT4tj2nswyFPK790/krECXf
X-Received: by 2002:a05:622a:1907:b0:536:2fd8:a4d8 with SMTP id d75a77b69052e-556bf740beamr31921841cf.15.1794402514467;
        Wed, 11 Nov 2026 05:08:34 -0800 (PST)
X-Received: by 2002:a05:622a:1907:b0:536:2fd8:a4d8 with SMTP id d75a77b69052e-556bf740beamr31921281cf.15.1794402514008;
        Wed, 11 Nov 2026 05:08:34 -0800 (PST)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5550af5f09fsm49902031cf.6.2026.11.11.05.08.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 05:08:33 -0800 (PST)
Date: Wed, 11 Nov 2026 08:08:32 -0500
From: Brian Masney <bmasney@redhat.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Paul Cercueil <paul@crapouillou.net>, Linus Walleij <linusw@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>, linux-mips@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] pinctrl: intel: convert to subsys_platform_driver()
Message-ID: <avRo0ItlTKTKyZ2f@redhat.com>
References: <20261106-pinctrl-subsys-v1-0-f17582f32aaf@redhat.com>
 <20261106-pinctrl-subsys-v1-2-f17582f32aaf@redhat.com>
 <avJKiYtczueslNSQ@ashevche-desk.local>
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
In-Reply-To: <avJKiYtczueslNSQ@ashevche-desk.local>
User-Agent: Mutt/2.4.3 (2026-10-09)

On Tue, Nov 10, 2026 at 12:34:49AM +0200, Andy Shevchenko wrote:
> On Fri, Nov 06, 2026 at 07:27:13PM -0500, Brian Masney wrote:
> > Reduce boilerplate code in these drivers and convert them over to use
> > the macro subsys_platform_driver().
> 
> Look at 20261104113343.1634218-1-peng.fan@oss.nxp.com.

OK thanks for the pointer. There's no need for a follow up from me then
since the series from Peng already covers everything here.

Brian

