Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0384238F62A
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 20:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788208664; cv=none; b=Z8SbXJ+DwvH4130l20+CzkmdCrDzxwVYSD/gvlQJSYox/CQgLpa/GJupRl0IHld5jlfdWsCyzD053y/rDDpCEXC6KQQHBilcMftzqnctAmqlr1hJcCSm2ROytW0BmhZh0HCOSSQT6PIBFZRyH1k2S8l+eXy/7J7TEHl0a7hvZvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788208664; c=relaxed/simple;
	bh=luzcgfRYxds/VUPt/v/kVbv2QxFOf/KBARnFP1UiCTM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SqRpmxbmOzF6XY+Fd5x6Q0jLSiiyjmYdMDgttsLcsFWbSkqe+IUUQYV67ItgAX732t4oCT6d06+NhuROmlix4Z8I4TcFAnieEDbkfhM+Ohs+V2tNxSKz/FfJe0sUDLxx2glD+K2bzTe+Y24t29zhcF7mMw4677eKjp3PYU9oBQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dBcobuSo; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dBcobuSo"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cc1bc88a20eso291605a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 13:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788208662; x=1788813462; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S0kQgsAl72FQNt3GLeFqPyaJ63mCAwOtZbt0gZ+AST0=;
        b=dBcobuSo68QEhygtfZ8w7/3UxJlF1dypPwXezf5ew9diDFfdzna+0tV+Sr9nB0XRwa
         dNORTx1S7i3ioneuxsl0vGaiS3Tg5nf0jRBzLinqo2kzEfq6QKfpWrVqlRaKpcKRwXpx
         wfZPLEX63QFq8uWZI4Oi2pTV2QDO0T6cyzvDXwt8x2refsHw4XvZOYoCAv4R8QbTpShQ
         iomLQZnnyLWwBEZ52QaIUioVKIZe1rbnTDi+dfwJHuSmwJqAKVqHaQl8tW+po9Cph2jz
         dE8NAA46vYSH8j9nXDCKSePzT9iMV4z0R1zayebcBrN0QVd5z1dIGM9VzocG3fIJzDMf
         9ovQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788208662; x=1788813462;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S0kQgsAl72FQNt3GLeFqPyaJ63mCAwOtZbt0gZ+AST0=;
        b=TYsyNwuEa64vH/vA0wEu6LlAhHIKXcS3bQSQob9Rnci/cgXvxtQdGtQ+5x8FEKZZ4f
         149Rdiag3aFJMTUGXw81zRJtHIETNGL2MxZuX1jtX1JMdEfZeO1ANGhUY8PkkZyQgSeg
         Tf2Fc/R2pUI/urYJifH1+8ZCx9CAD3bh4HTCDmRt0LfRpKg1PeXahXosf2umR2ijWdeX
         vyWm6RjXeSIIvT1eqXUnHKsan1ZeqLS/sDZ6b/0eleJX9LFgz3QgKaDIhArjQMdux4ue
         GjjmgakdPp7eG6PovOpy2meKedygoLD4HFXHE0d7HSWJRA9eTU8szt+aawlI6+mD8H6L
         RY5Q==
X-Forwarded-Encrypted: i=1; AHgh+RpeQB04rxAPyPhXfMWddwYHHYXV6ZmPS/WfRgKcY1biN33mnejW1pt7U1lePBm67VlQ5c5pErf9uhdEMKI=@vger.kernel.org
X-Gm-Message-State: AFuF++nGx/yuC6H3rgaB6Wdz9oQ0Ak4EH5ElMr7ck6xXLQsSg7LNX0IM
	NpQ7Bdn1gzmG2KFVh6/sI4FzLT/dPMPtB8SjKQezMm84yvNnjz2qAx9UNam756iT
X-Gm-Gg: AR+sD13YgqWCvJT0nAqq2HE6CVtAj7i7UUykNiBl717SNKZ2w8IFhzpBVm4Sbzj0g34
	YDADANxJWxsMbwnkhXPZAoL9Dz0oPh8yJgOpEDODDoE1EGmdiEfxAdvo+g2h3yhy14ZQyAKdy53
	aW2/+7whFJil4JOZOXbBO+iC6sR4iwpl3yxk6y4sBu/uvMHHKrMchW5jg9GIuXdzSuW7ulDEBDG
	Nku9o8jPUrzK71yusdItJCgsy6SkCim0TvLUgRIT6uNJ/gyD/axfX2SSAYvMhz5n7evjDMi+4s+
	jO7lK3pvn4TEDPynza9/Iz9GjWBVbfjGTJdKKo5AgBqAp+GjMQ78puGDjSZ/dDSlOGKupl+C5qs
	4L8Wj8zIsC/KapMpD8JYYWp5ZjuamQtwNctnnWe6CsaTpQs4GI/hV45jdCDCJ5OSxb10pl2pnLM
	0tA9bkbQ7YgWFbTGGMXrH8rS3WQx4yQzkvcKGVaPcGbMftBYmpLFJJA8eSoMXgMfLKVmlP7dyym
	E4nQwMDX+d142tvkGk/opUxWP4vhw==
X-Received: by 2002:a05:6a20:3d82:b0:3c3:b57b:6285 with SMTP id adf61e73a8af0-3d26784f2edmr43303632637.13.1788208662147;
        Mon, 31 Aug 2026 13:37:42 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:15e9:e9f4:23e3:4f32])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286fa400c8sm37185001eec.30.2026.08.31.13.37.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 13:37:40 -0700 (PDT)
Date: Mon, 31 Aug 2026 13:37:37 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Linus Walleij <linusw@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/6] platform/x86: x86-android-tablets: fix Arizona and
 Crystal Cove GPIO lookups
Message-ID: <apXlqKuqhlBkSgpf@google.com>
References: <20260830-x86-android-lenovo-swnode-v1-0-066a91acb4ba@gmail.com>
 <5f5b802d-b0a4-493a-9816-e9bd91fd94df@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5f5b802d-b0a4-493a-9816-e9bd91fd94df@kernel.org>

On Mon, Aug 31, 2026 at 10:17:41PM +0200, Hans de Goede wrote:
> Hi,
> 
> On 30-Aug-26 13:15, Dmitry Torokhov wrote:
> > When gpiolib dropped name-against-label matching in favor of firmware node
> > identity mapping, lookups referencing unattached software nodes (such as
> > arizona and gpio_crystalcove in x86-android-tablets) stopped working.
> > 
> > This series fixes the lookups and cleans up redundant software node
> > registrations on Lenovo tablets:
> > - Point Arizona GPIO property entries directly to the codec device software
> >   node, which is attached to the parent device.
> > - Hold a device reference in gpio_secondary_fwnode_init() to ensure safety
> >   during devres action teardown.
> > - Generalize gpio_secondary_fwnode_init() to accept a node group argument
> >   and use it to attach crystalcove_gpiochip_node as a secondary firmware
> >   node to INT33FD:00 on Lenovo Yoga Tab 2 models.
> > - Drop redundant swnode group registrations on Lenovo Yoga Tab 3 and
> >   Yoga Tab 2 models where codec software nodes are already registered when
> >   attached to their respective devices.
> > 
> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> 
> My initial testing report of success on the Yoga Tab 3 was a false negative
> caused by me still running the older kernel.
> 
> There was a generic bug in the new gpio_secondary_fwnode_init() helper
> which was causing all GPIO lookups for PROPERTY_ENTRY_GPIO() properties
> in the x86-android-tablets code to fail.
> 
> I've send out a patch fixing this:
> 
> https://lore.kernel.org/platform-driver-x86/20260831201157.36397-1-johannes.goede@oss.qualcomm.com/
> 
> Note that patch applies *on top of* this series.
> 
> With that patch everything works fine on both a "Yoga Tablet 2 1380" as
> well as on a "Yoga Tab 3" which covers all types of GPIOS (BYT SoC,
> CHT SoC, CrystalCove PMIC, Arizona codec) used in the x86-android-tablets
> code.
> 
> And the changes from this series look good to me too:
> 
> Tested-by: Hans de Goede <johannes.goede@oss.qualcomm.com> # Yoga tab 2 1380, yt3
> Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Will you apply everything yourself or will you let Ilpo do this?

Thanks.

-- 
Dmitry
