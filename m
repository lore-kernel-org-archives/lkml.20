Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B4C53C9EF0
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 09:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789031801; cv=none; b=Jkw8/rh2RwM5DpE9kQxSwlt5XibJ6ELPQlplE45zJCH+T5RRhgbrkBtwrgFEdwoJaLU7Ha1+WExc5/To2nBUkWYTR8O4jL8FvIBcPpJtKGA0J+MINKYnNi5Iwvj/Zc1/VKWSJTpgrXLNd0M6IjhESJ8nL02HHA//MnBSDHOT+GA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789031801; c=relaxed/simple;
	bh=+/iOSz3YxvUoAYiJmsRbsUB2Rs0NWl/i0h9TlCQHTtc=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EE2wg58aj2dmrFqNEFQMwrMLxGyeYA5vCfObjGZ2a1zErJIbA44CpOg5tmz/LatLWkJcAneoixtexG/rHUtnLfTWa93vx3yRo2hkVcRs7RaEpa4sBv0yYBG3pOYjiXA8tzP84XelbtYtsReevKZLSPVQ1jjj0m5tTCUnGsffpAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=awW+h7Kr; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="awW+h7Kr"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4995b0343c1so93310115e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 02:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789031797; x=1789636597; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :organization:references:in-reply-to:date:to:from:subject:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+/iOSz3YxvUoAYiJmsRbsUB2Rs0NWl/i0h9TlCQHTtc=;
        b=awW+h7KrHYx1lo266kHfwT2hlqfSxRmdSZfveSz15CCzU3DNvybZiXjyX3pslhXVFe
         3518LphS5rlw7WoiB+orALiVaOaTWdfzMnN/Bz845qFXBT4sgp3vBQeP2mVf3ZIJM0o8
         wQkqDnRK56mlgUVL8jbmhds0F4n+NSf1RhMdGCSF1SFYhk6IGF3QOTr0i/srPiHAHBBl
         4kGkBfRUWcvcsMqVkEfvT3D/h3jGsc689yMJPF41sEdb/egG5Mz9cAU1hjQVUKgI8AHv
         JqbNGvkZ5Y9Bz1UEs07kgANdYaAMNBGBnc4M9tWj7qw6YyuragB14ZtaRCLZKHvg95li
         YSaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789031797; x=1789636597;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :organization:references:in-reply-to:date:to:from:subject:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+/iOSz3YxvUoAYiJmsRbsUB2Rs0NWl/i0h9TlCQHTtc=;
        b=OWjNTW/m68Yb/wMYbSaXkmBT29NGNRV5+YSRZ6Zp3z0pROfYj2SDQ8cT0qdenA5OuM
         hMtRLCr7WcCF3Rc85YKSdyFw4Bur7Zx8wXQ04hbngWxLDcy5Uvyrh5ifc5ZNPCaB0jTR
         0xeinqJqtuI/RXikQTFOufXjKBD4GZJO0AfJW9yGtaDs/DQdD+sfxw+cdkDlceBHcKl9
         n/mx/hroZvB0Y3dHPzWmiLCjSERIyJspUSIY0wgBfi2VSjY/4f018Vu/8tY2UdOeIzXE
         +LISir0wgXZFOFeSnnTO+o7x0c0nODkYPhVRdVUlreIbZ5OugEMYGWJ18iXxq2sHiEZb
         Evmg==
X-Forwarded-Encrypted: i=1; AKwUvBwdeCZUsUHkMyPTGWAQ85cUCCpxnmkRuXg5PHnffLSSh67R80mBMtMIESf+SjHX/teh4nvTDdA+QPqD3qQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kOpmylDrwLVQlgCFWiKxYUPFV7U9pyfjbxxJcLW8KxjRSX9hWL
	Dx5Iz+fnCnSRy9Vr2tEK6wTTQWW5kHOxvs0GRM2/Sps5cSEi1KfSQqZxGBvBC5JOaoM=
X-Gm-Gg: AYBFou1+0yWKrosK13MDBtAfDU326P7ieCz0vQoMmdAdtSiiI3EJSv5kKhPPySNl8yG
	L+OFzef1CVykF8DbncWpPoG/dFtIYY2M1y94biZsxy5GzN9zxfGemtWVZFUUcv2NykVaNXWWAXc
	Car7bl9Vnjv1yVv2y9OoxT3fuAIho7NxUvEZQWhydsLX+qSb2FpC+/B+6f0vUAcX7qAgbh93T/N
	Fjo5Mrbtfj7p4w/BFNGiim8JbcVGBeeolIr6YmBFj1sRKJW5oaC6XRYS9owmq17jU535DTgkkUC
	lvVEwaoohFXDfPeMSOkkhD47XqaKwxlQQTzs1jwI1GRNbidbXIBtCgllhWcrOI4anssCxbuG5rB
	KIdn6aL1qv7q+n40jFg6f7oABWl8Jfhta3Mx4eTkaYNZQXOvi9LfJXXQnYnWo9BqoA7WY05MXKC
	HMmCX7b2ibawozO/OdA8Klbaj0UhpnKqNzxjsApN4Uj/DNr38mkigihtnPiLZxHcYfPFjURHnXh
	06q5uvbz6jP/gZx+hzc3NNKb85BNup+8SFkGw==
X-Received: by 2002:a05:600c:3b02:b0:49c:fa21:1c7d with SMTP id 5b1f17b1804b1-49cfa211d76mr383356255e9.18.1789031797188;
        Thu, 10 Sep 2026 02:16:37 -0700 (PDT)
Received: from [10.102.8.172] (mob-176-247-75-158.net.vodafone.it. [176.247.75.158])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e2212193esm17394445e9.1.2026.09.10.02.16.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 02:16:36 -0700 (PDT)
Message-ID: <71023ac4c8f2eab6dc5f7dc135fd22d2f07a5d5f.camel@baylibre.com>
Subject: Re: [PATCH v4] i2c: Add FTDI FT4222H USB I2C adapter
From: Francesco Lavra <flavra@baylibre.com>
To: Andi Shyti <andi.shyti@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-i2c@vger.kernel.org
Date: Thu, 10 Sep 2026 11:16:35 +0200
In-Reply-To: <7d9d7bfac46269c1a66b6aff25a28d12354cc3c3.camel@baylibre.com>
References: <20260225112046.2394231-1-flavra@baylibre.com>
	 <f5991c1e5c1c71746b543258ead46caac0e6ac6e.camel@baylibre.com>
	 <7d9d7bfac46269c1a66b6aff25a28d12354cc3c3.camel@baylibre.com>
Organization: BayLibre
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2026-07-27 at 10:07 +0200, Francesco Lavra wrote:
> Another friendly ping
>=20
> On Thu, 2026-04-30 at 17:40 +0200, Francesco Lavra wrote:
> > Friendly ping
> >=20
> > On Wed, 2026-02-25 at 12:20 +0100, Francesco Lavra wrote:
> > > FT4222H exports a USB interface to operate as I2C bus master when set
> > > up
> > > (via the DCNF pins) in configuration mode 0 or 3.
> > > The USB communication protocol implemented by the FT4222 chip is not
> > > publicly documented, therefore the name assigned to the various
> > > defines
> > > used in the USB communication code is a semi-educated guess after
> > > sniffing
> > > USB traffic generated with the FTDI FT4222 userspace library.
> > >=20
> > > Signed-off-by: Francesco Lavra <flavra@baylibre.com>

It has been more than six months since I sent v4 of this patch, and there
has not been any followup on this, other than my attempts to revive this
thread. And that is after all review comments from the previous iterations
have been addressed.
Is there anything else I should do to help this patch move forward?
Thanks
