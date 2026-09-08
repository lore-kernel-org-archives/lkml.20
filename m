Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A9E290DBB
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 07:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788853046; cv=none; b=hCGl4QFaWA5+1AW00pxLJxe2Xaoo/UehSURIu9kDUpZHpQK8NUxfII7y/fdUY+B7srM0N5asKFaoIYoyD7MdCr8h5XG+p8+M5sRKj1sJ24YpSZTSlCpl+45Cxf4r/2pScRm/0W9uwtcVPwqwqyP5ZIRYgW347rh4o4qCnL/0wvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788853046; c=relaxed/simple;
	bh=O0/ChRmLR49PqjlSk3WxMDNtjzdOttNj4jO+gAd5+6Y=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CjitpzyLsAGCBlpa6MqnIe9AiQEXTp4t1MjI1PhB8Dboo6+n60Nu3i3DEPnXutBvcedLRxT/dKdAigRXbePHlnWcsnL9TJ8SpLcOEdThUGbEf+gAEEs9aQ3HmPTjRgwfGh6cch9kAWgiwdZ7nZWz4VUwvcIE1wpw/Ly+n2TAaR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YGppl/v2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YGppl/v2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83FF31F00A3D
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 07:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788853044;
	bh=O0/ChRmLR49PqjlSk3WxMDNtjzdOttNj4jO+gAd5+6Y=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=YGppl/v2ZzsUMlXq1v4/UcsTR9rpe/o+mauE+QnB5zxoeJ0WSyfAnXXbkTk8TXzR8
	 Oi91O72/4fXg6CfKCqgd/N0oC9U7HjXchu6nxcMThdSiThnyduR5gJGM2ZrDmvEdAt
	 NFxUKTqo2snfKZbMKwALg/TMLkk+7roI6194RlnQTZiPZH1noN5XhVIdYHX9ZfAySj
	 soCS0rNLmQGpOefI0HvO6V0XTK+NaaVajCx9g2te/v8utsWe3UEQeDnn3uzepXu9ow
	 8Ab5Cc7itDVyrhpF5MpwBuF0uFrpEHfOwrIoOWKw39eKaFK8N2hbueiU++xuKJumCk
	 rrhQuHIKzAVwQ==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-39c8ee87f7eso38651291fa.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 00:37:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwx2QaxrXt5WC3aKhAs5+HJ9WfOkjkh0ovaywUWGrRAgfr2aO3uaiDhls/l8MBmm2ku4/ogPP46kxitj+w=@vger.kernel.org
X-Gm-Message-State: AFuF++moK48OAEz3+nDoivi95wmOI3wGqnCbtvG2Xch6mFsAmDhm5iu4
	ghlwr0WuLwsjjRYprx3rJZ2WvhENbOJJZR/h/mbwhlxc6yyZ44Ohkt39hicq/DF3mzPvw5X2e0M
	qgz5gN6YDNPNrSoF13/1sNcXp/85Dd4WHeqBsv+Nyjw==
X-Received: by 2002:a05:651c:b26:b0:3a1:35f3:d2f2 with SMTP id
 38308e7fff4ca-3a371bd1cd9mr30141431fa.12.1788853043166; Tue, 08 Sep 2026
 00:37:23 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 8 Sep 2026 00:37:21 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 8 Sep 2026 00:37:21 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260907-unnamable-geography-d04f61df0fe5@spud>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260905000919.155694-1-rosenp@gmail.com> <20260907-unnamable-geography-d04f61df0fe5@spud>
Date: Tue, 8 Sep 2026 00:37:21 -0700
X-Gmail-Original-Message-ID: <CAMRc=MdHUpmoFDtmXdbXnbS+_4ffBQcFLo9XjdO=jMom+getpg@mail.gmail.com>
X-Gm-Features: AcwNN1V0p3oAVIg0gRX7T9HWtn8hpH3AtiTX2TEeTVAnx9nYkEQ0V6n4JfAdYO8
Message-ID: <CAMRc=MdHUpmoFDtmXdbXnbS+_4ffBQcFLo9XjdO=jMom+getpg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: gpio: pca95xx: add onnn,pca9655 compatible
To: Conor Dooley <conor@kernel.org>
Cc: devicetree@vger.kernel.org, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Peter Robinson <pbrobinson@gmail.com>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	Rosen Penev <rosenp@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 7 Sep 2026 18:54:12 +0200, Conor Dooley <conor@kernel.org> said:
> On Fri, Sep 04, 2026 at 05:09:19PM -0700, Rosen Penev wrote:
>> The pca9655 is the On Semi variant of the pca9555 16-bit I2C GPIO
>> expander and is register-compatible with it. The addition of the
>> compatible in the driver missed the documentation update.
>
> The commit message makes it sound like this device should use a
> fallback. Why doesn't it? Either it should, or the commit message needs
> an update.
> pw-bot: changes-requested
>

Actually commit 6d49b3a0f351 ("gpio: pca953x: Add support for the On Semi
pca9655") added this compatible to the driver back in 2021 but it had remained
undocumented until now. Unfortunately there's no denying I signed off on it. :(

This commit should probably contain a Fixes: tag pointing at this commit.

Bart
