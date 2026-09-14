Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35A521ADC97
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 01:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789348738; cv=none; b=IvHEtSuuhJHA6uXssT19RiQUZqwxxpO/LZo/S6x9q9Q2v2ItJ7oN7qsEU+xHV1QKdB8d12zVJ1Oq+bBDYdmVjjWmiBm0gwYEmRNPiq1vlpT6Gv6a/g8UBVwlEtdGZg9hBGETZMqOJEm5dtr/W35ZDyPFRFivnzMqIIzTzPp+VSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789348738; c=relaxed/simple;
	bh=S4Czo7uLaPCl+8Nwr7deQ8dkI3BVQlUw88tCxmvRZTA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NJVpDIrtXu22WdhmKkIhDEvkpR2VJjokVlIswscDt0u9jtOP8IjkNBpM5yYZiYHTpmf4lqAyfqbIl+WvyS384P8/AaTNh/edrxF084BdLy8Aodlcdf6nAxm7A3Ls++R/3iD6+V8ErfQ2Nhml5rqPF3BiBaaHbIDXPcjT11wwuuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AhfNdJNV; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AhfNdJNV"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-38ea87caafeso2727521a91.3
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 18:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789348736; x=1789953536; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CqBxOmWaZHPQ+R4D4QAtlbH6s7C0J46+dx/pSHVm80g=;
        b=AhfNdJNVxskwNNjV+9DBSX2Xb5S4eEQ4yYtYf6oqMQ3VlFryBFwscQXXnJhTO5DYRu
         etq1aibtr53xcGl4X1uohRfzc0KdTrXOS3YufXtIgQvMbjy39gfEkC8F7dDhrhzLvLEa
         lpYwxKfPlpilHmeRfO1t78jnh5/Bx9Z4glSf6fYRwV/kSgv1tvt+V9/mgz+2bdYL3Z5+
         d5F+62SR1acQ2UXw5jJU6kP2ZBORV6ofPXbSAkN1yXcwfWqBfYvZ50Xket2nCz5TTfgh
         wwnByeGuVHdvMjBN+fSP9eB4M8Gsl2HP8B6OFYeHgjBEdojkQBmJRFH7DGIjr0TgzEAb
         fO1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789348736; x=1789953536;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CqBxOmWaZHPQ+R4D4QAtlbH6s7C0J46+dx/pSHVm80g=;
        b=qIvl1xHoKbAxQulqG3pNWYwRlYIHcL5sLjHMZT4zLACztEn8qe+rz/LdS24EEqNaJX
         GXbka7O14geJ7CdHj2gQvdumupcMHtCffCEUtYGOQ5qJkWVif5Lqj2jihq3Ja0SVRb+u
         eM6txMyd4A0XrjpX1Ea7+dICVEcRDSPqEj4ZAFBV0wrCMiLChHBiKv5CFudk13ctniJL
         8505u3VKx7P1V2EgghXr5SK580sn8p7FT6aKcO4fIZHUQuVWtgJ8Vze7QG6n4KEvpUWx
         6jDdsF/nPfBbvapU/wAQqlFQphZFv4Ua6+EyOlu7kQGSlg6jpxwZ8RdIb7fGpbwfFb3S
         8yuw==
X-Forwarded-Encrypted: i=1; AKwUvBymtoQosVVgeih5KcQt34FC0R9lfyI9iw2qihOIeq4AOUz4gBCrQ6yzMa0byxq+N1Sla9oLCAkIzy9UQg0=@vger.kernel.org
X-Gm-Message-State: AFuF++lKsnn5Ae0duosbIWPVa2SnM+VTJal1veY8TfxlPnsM/x1ddHiO
	rcwGGlTb6j+LaawGekbU97xjwziHF08UfT7zM+Vp6Ctq+uDgs9SjYX0Q
X-Gm-Gg: AYBFou2WtYfTyzedz2eTwhobzvqL4nixzMl7RqN1DqD+eCeeLrvWJJ9D/iMwVY/ETj8
	jx0A6MWclI9R6rIZXgUNnUyP3FeOSUHSk2xoBFW/uLkjVGaVCKd4G3DglhPzvR+VyVFQQG282AK
	F7qlpBLR/zVNgWIvCvGICWykdRC+rh7r5Oe15ujoz2EBvNaW8zPFrxja2ak8ShexanaHggqJXCd
	rMOE/G3a5R1ZTvrfG92VUa8uGE8tBXniYmD3CzP02sgVtCemR7dNj6TcQ+ETERilW3OXKjPAik2
	hi37pcV/6LMj+g5AASSAJmhxndn1PpXr1vzTAVjN3oH9zXtKs0HbotfPIoUCX3Qy7W5LuSd2kCE
	RKkfN0EA1hHuqj/L3N5GnAt1o/gh9Ad5Y+WwRApFzGHtikuKvno6XZt23sLPn+324HVAw2tpaZd
	Hm7hB1yMwRFnspYbPFPH7uBsIctugmJDG8eq1RCJ21I6RzKmxB4HUyxlJEYjPZGlBzd3QY+/eRq
	6KYUHRDZ0DnDXpTPDQ9AwcDBFS86eQcA5kEWE3eazs4pgQO0MUP
X-Received: by 2002:a17:90b:2e0e:b0:38e:250b:122f with SMTP id 98e67ed59e1d1-39dec056382mr1000824a91.16.1789348736340;
        Sun, 13 Sep 2026 18:18:56 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:a739:376c:7eb4:ea2d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4ed295esm25517357eec.15.2026.09.13.18.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 18:18:54 -0700 (PDT)
Date: Sun, 13 Sep 2026 18:18:51 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH] Input: tsc2007 - Read "ti,poll-period" as u32
Message-ID: <aqdLRrHQv6GdBTW9@google.com>
References: <20260831194352.1185860-1-robh@kernel.org>
 <apXaYJhFnC0UCHb0@google.com>
 <20260831231829.GA1244140-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831231829.GA1244140-robh@kernel.org>

On Mon, Aug 31, 2026 at 06:18:29PM -0500, Rob Herring wrote:
> On Mon, Aug 31, 2026 at 12:51:44PM -0700, Dmitry Torokhov wrote:
> > Hi Rob,
> > 
> > On Mon, Aug 31, 2026 at 02:43:51PM -0500, Rob Herring (Arm) wrote:
> > > The "ti,poll-period" property is documented as a normal uint32 cell.
> > > The driver used a u64 helper, which makes the helper type disagree with
> > > the schema even though the stored value is still small.
> > > 
> > > Read "ti,poll-period" with the u32 helper matching the documented DT
> > > cell size.
> > > 
> > > Assisted-by: Codex:gpt-5-5
> > > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > > ---
> > >  drivers/input/touchscreen/tsc2007_core.c | 5 ++---
> > >  1 file changed, 2 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/input/touchscreen/tsc2007_core.c b/drivers/input/touchscreen/tsc2007_core.c
> > > index e4d7da0f4434..e2f49b37e18c 100644
> > > --- a/drivers/input/touchscreen/tsc2007_core.c
> > > +++ b/drivers/input/touchscreen/tsc2007_core.c
> > > @@ -221,7 +221,6 @@ static int tsc2007_get_pendown_state_gpio(struct device *dev)
> > >  static int tsc2007_probe_properties(struct device *dev, struct tsc2007 *ts)
> > >  {
> > >  	u32 val32;
> > > -	u64 val64;
> > >  
> > >  	if (!device_property_read_u32(dev, "ti,max-rt", &val32))
> > >  		ts->max_rt = val32;
> > > @@ -237,8 +236,8 @@ static int tsc2007_probe_properties(struct device *dev, struct tsc2007 *ts)
> > >  	if (!device_property_read_u32(dev, "ti,fuzzz", &val32))
> > >  		ts->fuzzz = val32;
> > >  
> > > -	if (!device_property_read_u64(dev, "ti,poll-period", &val64))
> > > -		ts->poll_period = msecs_to_jiffies(val64);
> > > +	if (!device_property_read_u32(dev, "ti,poll-period", &val32))
> > 
> > Do we need to handle -EOVERFLOW and keep compatibility with device trees
> > that used /64/ to match driver implementation? Or we expect that there
> > were/are none?
> 
> I suspect there aren't any users. Nothing upstream for sure and there 
> never was. We could probably just delete the property.

Applied, thank you.

-- 
Dmitry
