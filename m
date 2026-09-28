Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE3D4DA9A7
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 14:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790605073; cv=none; b=aT3jvK1GfF9WC1qcNQCeW33s0RdwjG1m2x4SyHeBeU/t96DW+JUy4AAvKrMkD9do//X1nKH20me/bEqrbkF3y9LEA1c7QZJ1ZDdoH+YNSCNZZfeoIHrVpAJgTli3BffU05xUTLy4hIx9gcVqujyx2tG70gddIhxmRc8Jb48tEy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790605073; c=relaxed/simple;
	bh=D2//y+zWUZ6eFjK/x9NzKFW0BnNMu6Nlh5/iRwYrEcs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hsxmf0xEymzoSd1KR7UIcDMgFkcbrWGSucjYjPieriPKtRcwZCahmSYwXf3M59j2uukp/WRAm8u3mognNRt1Q7yDv0yiKkl6PXRnfAnpS/4zNyFkVZYpIdJ9ex2U3ly96Y1+g5rr93sqw7YWcrO+RAKWODVX1/wyJ3/N7v/uM5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IkT6T6Y9; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IkT6T6Y9"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-3115c4451c8so2475786eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 07:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790605071; x=1791209871; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=n1xwnLEC8y1A7VnXJXruluUIMCpMITxsOOOYMVDzt2M=;
        b=IkT6T6Y9+toBLQ3J5E/0FhnrkoUw1EtWhpw1wV0vSjbNZZhbHrguIeeW7aTSSokEUi
         Kv7xFhM4tLAWSwRYgjHTcyuNl/SPo74drKm/lzdfuEr9KFLV6zcVafgAYivnN3mJBWI0
         9cw5/ib9V3wlXpI+9eGkljZz2s3tdhanvUcNzHJQ7EkTdiklvVT0NeADOYWkQqeYiIoR
         5/11KvA5btsHHq9Uzyh3iLPUS/diZygoDKXo+LdiYg5adRRIpdTU7agbjB8wFlpLBFIO
         rmnOqrurihUR8pphLsXSEj2V0RM35fpcQj6QhOQz9S1FsIua4FmDxzsN3WAIAhIUdBPN
         d+pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790605071; x=1791209871;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n1xwnLEC8y1A7VnXJXruluUIMCpMITxsOOOYMVDzt2M=;
        b=Ga82tt5uBbR2kGT7kDrnXR4r/KKpdyOC/ih+5RwR+oHJMrgHZG8TqHxPQ6JD6x0Spz
         +jOoRUHnF4Czobj9jxyKSL9esIuv9efyb2fKtIRiiZKyT/DoZIiqkik6gVs92bDEGVcg
         7PScQ0I4wcQ6Fv25F36Uqy8u26xaN0Kwrgegr99f/dsxKw4+hhjgAlSSaanB/S1gG2rT
         hPQY1WpzIPeGxst5fbpGhRonIhV+ciMhS4WzdOwLgznsAXEYTjEhKvvqI4ba+rp69e2/
         +u/b266vZ1j+fjitUlWMXkxSg9D6kUo2xEYLAZTZIIxK6nkq3iXIoz1DfXxpDKMRgs9r
         IEOw==
X-Forwarded-Encrypted: i=1; AKwUvByqakKC0ldR2PhezwwUagodOBFnnZVg2zrFwBdEBftBiIe/7yfWEn/k9x5YQgus3mrojwbblOTyv3qHE0U=@vger.kernel.org
X-Gm-Message-State: AFq9FYJkN20owv7Zi8VDC8YRnF2zWNqDnrDI+504TPB2RyPsVvg9+A3d
	CJSKuwUCOKt1NjTtQUDPPt956EcIZmY7xX/W5vTOer4oLOpvO6sMbA/j
X-Gm-Gg: AYBFou2G4WK3zzuP1RK9EtSI8rOOjgoh/lD6ZbKWlrnNGg+d1pUT4NypcDekGLMmoJo
	WYkyD5aYcg5Z9e4KMMkD169YoRJ5IXuTJ7UGWBi6XiMYbQN21K/2dVGaEDfkvozQrP1j2bHqQC5
	Z8sFmXf2RyGLWMsuZJAbnAS3imvZ5/aY85KrWC5buIlc8PIC/Z7g7X0+8EHiPKQ3W67btdesCTk
	5+Ykpuvmf2k+t4Hngbu3ZA0dWE854f8JFR2ry/8puxNvc86qWEkxDqSZPNmrBrDK9unaSrXcRgC
	9gx9CUsPa5K3brvLGdKyd+298VWumpLEKVhKgC3lWeccscMxe4dHPe2s4kt8EFJhOh8wbix86Wh
	CCYPSlWflntcITbufLb/PcXLVlbRM89ptuDsdeyDw183PlAa7BWvCL6p+fNUrTqEX8rGi2ipVPb
	lJoW3djHii9m/BiUjtBOExD3B7mIxg8mPDf+QlJat87Be0bh0ON65umpGai/v1eIoWJdsCaLmOE
	Hk4mgDlgYnc
X-Received: by 2002:a05:693c:80cf:b0:347:7d10:4c7 with SMTP id 5a478bee46e88-3477d10a211mr3099391eec.15.1790605069659;
        Mon, 28 Sep 2026 07:17:49 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3413fc2413dsm29107917eec.0.2026.09.28.07.17.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 07:17:49 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 28 Sep 2026 07:17:47 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Christian Lamparter <chunkeey@gmail.com>
Cc: Ridham Khurana <khurana.ridham222@gmail.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	Christian Lamparter <chunkeey@googlemail.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Nikita Shubin <nikita.shubin@maquefel.me>,
	Shuah Khan <shuah@kernel.org>, Jori Koolstra <jkoolstra@xs4all.nl>,
	Brigham Campbell <me@brighamcampbell.com>,
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH] hwmon: (lm70) Fix rounding of negative temperatures
Message-ID: <6cde225a-3ea9-4ba1-935e-8e2b56d39f3a@roeck-us.net>
References: <20260924205326.1739229-1-khurana.ridham222@gmail.com>
 <f28a5470-0d9e-4045-9c64-5614e0e88de2@gmail.com>
 <3334ba64-2f0b-4e66-9a3b-84f46af70212@roeck-us.net>
 <eb76f982-d29a-41b4-a5ae-61ce486f4839@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eb76f982-d29a-41b4-a5ae-61ce486f4839@gmail.com>

On Sat, Sep 26, 2026 at 11:22:39AM +0200, Christian Lamparter wrote:
> Hi,
> 
> On 9/25/26 11:19 PM, Guenter Roeck wrote:
> > On Fri, Sep 25, 2026 at 08:03:06PM +0200, Christian Lamparter wrote:
> > > On 9/24/26 10:53 PM, Ridham Khurana wrote:
> > > > temp1_input_show() drops the low bits of the temperature register by
> > > > dividing the raw value (raw / 32 on the LM70). These bits are not part
> > > > of the temperature: the LM70, LM71, LM74 and TMP122/TMP124 always
> > > > return some of them as 1, and the TMP125 fills them with copies of the
> > > > temperature LSB. Division rounds toward zero, so a negative temperature
> > > > with any of these bits set is reported one LSB too high.
> > > > 
> > > > For example, the TMP122 returns 0xffff for -0.0625 degrees C, which the
> > > > driver reports as 0. The LM70 returns 0xf39f for -25 degrees C, which
> > > > the driver reports as -24750.
> > > > 
> > > > Use an arithmetic right shift instead, which drops the low bits and
> > > > rounds down. tmp421 had a similar problem with negative values, fixed
> > > > by commit 724e8af85854 ("hwmon: (tmp421) fix rounding for negative
> > > > values").
> > > 
> > > For the TMP125 yes:
> > > 
> > > Reviewed-by: Christian Lamparter <chunkeey@gmail.com>
> > > 
> > > 
> > > > Fixes: e1a8e913f97e ("[PATCH] lm70: New hardware monitoring driver")
> > > > Fixes: a86e94dc946d ("hwmon: (lm70) Add support for LM71 and LM74")
> > > > Fixes: cd929672a9ef ("hwmon: (lm70) Add ti,tmp125 support")
> > > > Signed-off-by: Ridham Khurana <khurana.ridham222@gmail.com>
> > > > ----
> > > I wrote a little test program by hand (see below) and ran it on x64.
> > > No idea if different archs behave differently or if
> > > a clever unsafe math optimizing compiler flag will
> > > convert the  "/ 32" to a " >> 5" but I doubt that...
> > > 
> > > ---
> > > tmp125: raw:7ec0 tmp125_proposed: -2500 tmp125_now: -2500
> > > tmp125: raw:7eff tmp125_proposed: -2250 tmp125_now: -2000  <--- loss of percision
> > > tmp125: raw:7f00 tmp125_proposed: -2000 tmp125_now: -2000
> > > tmp125: raw:7f3f tmp125_proposed: -1750 tmp125_now: -1500  <--- more
> > > tmp125: raw:7f40 tmp125_proposed: -1500 tmp125_now: -1500
> > > tmp125: raw:7f7f tmp125_proposed: -1250 tmp125_now: -1000  <--- and this
> > > tmp125: raw:7f80 tmp125_proposed: -1000 tmp125_now: -1000
> > > tmp125: raw:7fbf tmp125_proposed:  -750 tmp125_now:  -500  <--- also bad
> > > tmp125: raw:7fc0 tmp125_proposed:  -500 tmp125_now:  -500
> > > tmp125: raw:7fff tmp125_proposed:  -250 tmp125_now:     0  <--- ouch
> > > tmp125: raw:   0 tmp125_proposed:     0 tmp125_now:     0
> > > tmp125: raw:  3f tmp125_proposed:   250 tmp125_now:   250
> > > tmp125: raw:  40 tmp125_proposed:   500 tmp125_now:   500
> > > tmp125: raw:  7f tmp125_proposed:   750 tmp125_now:   750
> > > tmp125: raw:  80 tmp125_proposed:  1000 tmp125_now:  1000
> > > tmp125: raw:  bf tmp125_proposed:  1250 tmp125_now:  1250
> > > tmp125: raw:  c0 tmp125_proposed:  1500 tmp125_now:  1500
> > > tmp125: raw:  ff tmp125_proposed:  1750 tmp125_now:  1750
> > > tmp125: raw: 100 tmp125_proposed:  2000 tmp125_now:  2000
> > > tmp125: raw: 13f tmp125_proposed:  2250 tmp125_now:  2250
> > > tmp125: raw: 140 tmp125_proposed:  2500 tmp125_now:  2500
> > > 
> > 
> > Sorry, you lost me with the above. Are you suggesting that the patch is
> > correct, that it is only correct for TMP125, or something else ?
> > 
> > Guenter
> 
> Ok, I guess the same thing happend to me now too?
> 
> Is there something specific you want to hear? My reasoning is that I wrote that
> cd929672a9ef ("hwmon: (lm70) Add ti,tmp125 support")
> 
> I definitely wasn't aware that / 32 screws the with the rouding result for negative
> integers and >> 5 wasn't. For unsigned compilers actually replace the divison when
> the divisor is a 2^x constant on their own. You can find so many threads/topics about
> that explaining why (basically pick your favourite).
> 
> https://softwareengineering.stackexchange.com/questions/209678/why-does-division-and-multiplication-by-2-use-the-shift-operator-rather-than-div
> https://stackoverflow.com/a/27052650
> ...
> 
> It's been too long to remember what went through my head back then, but I knew that
> replacing / 32 with >> 5 is a common optimization because the bitshift operation is
> faster than spooling up the hardware dividers. But it would have looked funny when
> all the other conversion codes (especially the LM70s. Because it's almost identical...
> except the LM70 has the sign-bit at D15 and hence the raw value can be directly cast
> to a s16 type). So definitly that >> 5 was on my mind.
> 
> Now, I was surprised to hear that / 32 and >> 5 differ for negative numbers and I wanted
> to find out and the experiment tells me: yes, it's true.
> 
> Do you get the same result? What if you replace the function with the other
> LM/TMP implementation?
> 
> But I have the suspicion, this doesn't answer your question, or does it?
> 

I asked, or tried to ask, what I thought is a simple question: Is the
patch correct or not ? You could have answered with "it is correct" or
with "it is not correct (possibly augmented with 'and this is the
reason')". I don't see either in your reply.

So, no, I don't think you answered my question. I'll just assume that
the patch is correct, to be fixed up again later if needed.

Guenter
