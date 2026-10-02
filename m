Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B14F23D7F4
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 00:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790900250; cv=none; b=cbAz7aIl0Ay3btQ0c/69BDzuZoX7dVcwVcObvSkVyM+fKZbSNhjaZoagpy5GUQaUcAuTDwFz4rXZUs4j4L0GNxqBGvpE8EkGZNj2xAH9RYiSnG9rr3Ug3O1SxfpIlmlmWctJhwV1zJ7yNb9mWZuLd5FCIUpAerwLdFLUgRUul2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790900250; c=relaxed/simple;
	bh=uU8ecgL9bHXX7U2HdHoZ1solGVk0L+qo7jnXMGu7ZxA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PXAaw96FBnxDfTaWPBtZmg57IpCxS7VlG6NugJhcxMLmgwPinoh1mK5Dr4pHQQlgsHp68NUm6+Fiux54kho+QUUmxaybhk1GA6EhkM7gHYtzx2BcLI5G98wS4V3wpkU6O8051M5dPBbDeRNycdBJpbqwy19IPSaFHLMYCWwMYBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aHE9iquu; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aHE9iquu"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e4b11so42662035e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 17:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790900247; x=1791505047; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=px+/xLsiECPGLRTHgt+4dAM3tfLMzLHXRYmynoZyTdo=;
        b=aHE9iquu/43JCktzueIIzn+zVCXhxrigI54P7qWXgor62VIVbfCY/jEY6g9wiqNLJf
         LK8FRpabV89BTGKyadA2SUBv4qgUHjx5iMxUULqxJbia/pvf2EwhC+0hX4sXvfY5ZyTU
         1OnIyjdt5XCLACOuleDujHggsq7cx5zEguVdC+v0910mSOif1vdRxKz3m92EVmL+pXbe
         MqJoTBN8UwbngR8GKWZdJ2DFknGHi9ioN1p1YtkjdEx6GQhq7/AVN1e+xTyJ6J1tnoWY
         JnoMy40o+cNzH8ZaZe9+833m1QlrtFl7Uf4PS8DHgZhJ4AqXgRii+X5lt8KibNVLny9Z
         Vf4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790900247; x=1791505047;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=px+/xLsiECPGLRTHgt+4dAM3tfLMzLHXRYmynoZyTdo=;
        b=ZEPfj0c+D7/gJe/QY8xWVTcizBIMS8Ydi7b8A0mIfuwA31PpX3Eq/8WbRbDsWpVX1h
         wjnOY4sOFaacwu72T7BV4umJRcbSY8H6NxIAcX4xU2aQacaepi15hvwZSNm51Bblg7dS
         cQgDF4c8OQKQiQKJ6j0VT9PXc0JQhdGIGm51mcAH7RXV2mrAhGul3LTs1vsxDDigCtn5
         +P+ZZ/dr/KJb7kJIhjXnb4GsLd7/h7RHdbw9TEaaBe6Va/7ZARSuSnubx9GmRiFazvDB
         bXJ6McHE0+Z7dQZgRXgluiQYHHduaK+mHxXiRY45oin/gVpclu7DBsND1Hgb9tjKWsQT
         10nA==
X-Forwarded-Encrypted: i=1; AKwUvByCVTJTE2gpcvQinS7T/ldtz/4wPLk7Q7twMwFWxoON3MaZkE/1J+JrS9N3tVwtY1R2RBrYHFzGYxFkX3w=@vger.kernel.org
X-Gm-Message-State: AFuF++k1T9CtIWCW6BcxJdxmHpJ1CEx2X/xaDInJW4B6rgcfCBRu9fX/
	sialJArIFUmYal0ZZNPqtCz4KN2o6u2xjk06SQmQR5OP3d0mEgcbV7z8
X-Gm-Gg: AYBFou3h3ARoeNFKT8xjntQ6Bq3d7HilH6+TfffkyBPgPUw43fl7M7NxEKg1tiYS/Qs
	0EbTDAwjoGr0IF36aci/W3a/IQTH195CvP/uNPnjwkFk1tDvN9VBMoO4wMbOSMEr4/80ZR64K4l
	xfRUt6J2gsmK9TeQhyCyNlr2zrDwETeDJh/jS1A55bPs+rWm2QatpP6PNh/Y0z8Kvi6abvJbrLT
	pi4ci8cjMlf3nPCexmFtLDj9U1tzmcEPWGYxadT1DIhuwDGcEO9ZV9bgW6+jrVxtlRwzXHfUkWE
	pBCbyn7t+OkWqGgnoFy485Q6qJTDmgP42bWFLumtfKzQTkGkguKCOzIi61sjEFMM+Ba9JjsBA4D
	i8JGBggXy5IIlWwAWOnaEA42mvU1+v8vRKQXnTftL+YLDyJZI8cXhXK5yVdCPiaVUDhRqnZ1nqa
	OZHLZwFFb9yKHk16rBvPBXh6VNUqXgo7/H2V47KiwTaY262qy9hukmHKmHg9f3PZJZbJ0VxGeAc
	49p5tnZVEwyQVU8SM2Z1ylb7HQa+x5QyUjhf2zS9urv+rPm9Y/KtIIUhrEwoO/JeyDyXO3qRPId
	unITKhuECtQPqHEDJtXVs0iOliH6U1igaA4lwxVLyVAUzHa/KQBf1eIfRl53k96oO8/DtDsiG/S
	5B+Itev/YSgzefxyQbgx9
X-Received: by 2002:a05:600c:45d3:b0:49c:fc6e:a3e1 with SMTP id 5b1f17b1804b1-4a0276f556emr18772095e9.32.1790900247466;
        Thu, 01 Oct 2026 17:17:27 -0700 (PDT)
Received: from MBP-von-Karl.localdomain (dynamic-2a02-3100-b3ca-3a01-3deb-81e4-0dc4-fbe8.310.pool.telefonica.de. [2a02:3100:b3ca:3a01:3deb:81e4:dc4:fbe8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a03048abc9sm7487875e9.0.2026.10.01.17.17.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 17:17:26 -0700 (PDT)
Date: Fri, 2 Oct 2026 02:17:24 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Stephen Hemminger <stephen@networkplumber.org>, 
	Arend van Spriel <arend.vanspriel@broadcom.com>, linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
	stable@vger.kernel.org
Subject: Re: [PATCH net v2 1/2] netpoll: use a raw lock for the deferred
 transmit queue
Message-ID: <ar73Oi6r__PY-RE1@gmail.com>
References: <20260928064239.32456-1-kmehltretter@gmail.com>
 <20260930192103.62973-2-kmehltretter@gmail.com>
 <20261001164355.212c8ce9@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001164355.212c8ce9@kernel.org>

On Thu, Oct 01, 2026 at 04:43:55PM +0100, Jakub Kicinski wrote:
> On Wed, 30 Sep 2026 21:21:02 +0200 Karl Mehltretter wrote:
> > Fixes: b6cd27ed3388 ("netpoll per device txq")
> > Cc: stable@vger.kernel.org # 6.12+
> > Assisted-by: LLM
> 
> This slop is definitely not a fix.
> It never worked, it's net-next at best, no fixes tags

Good point. I'll drop Fixes and stable and retarget the series to
net-next. 

But first I'll wait for input from Sebastian and others.

Thanks,
Karl
