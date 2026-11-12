Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794444224;
	b=Lv2KX+B5y9EFP8pnfTPcl0lSRZ1KXk4j1Zfw7+38r9QPlGqMjlI9/1x67vxjWKPrLWU5
	 NW2TVJ6r282CjNgSWmFH1zUs53ZE5kAUWm2ZjPlvKp66Vi1a0p1AYVfp9LiqghYJwFc3w
	 Mwh3ZZr1iASfyz4bxrO2mZAj+kxJfqhg99+lvXwv1BElam5LNAIY5ShffXT8gpKtLr28l
	 NeqpNBhSgcRHaaNBkqkivuu3zgoiGuQU8KrUJrF0rm2zLUY80gxTsqs93DF51599cpPuX
	 p0xLJn6FlMm1E4Fl4QKaoGOZPLyoGrGRL4gOeWEqIyTwdxz8+yvFkX/RZXWJD1iBFog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794444224;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=hSyluR/dxUK77LHU2y4jYATB8HCJe2GhcZU7P8Sz6hg=;
	b=RLF6bM72Mj2UErYhJXmEer+wMQGBNmiTvPTi6tWvYZNRjk3wBS524FskVQw+wyvAmQ25
	 uk5gaNGT5hMlK1G6RgTQxymvtij3cWYIjwex9AV6Z49nt6CPwQ7hYd/KlNni9FvC7BNRN
	 TNMhG8kjY/JDqUDBkRmXdVAw4sk+hf3+YtX8iR89am5rPCGMABcpGwq0DLJxTF03MSV8A
	 PCxkRYD+FlLKmBb/wweaxxUdNdCLzxnoBcHPnT1u5YU4fKl0K/r9886Q9xwWty6HvRHSM
	 O+H/p1QSDUmez0/xhz303gXWh65oFVJaGdZM/HqNYavQ9qyeeJEtzYwIsUDEeIijBIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=lHobAEFp;
	arc=none smtp.remote-ip=209.85.216.69
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC40F606A324
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 00:43:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC40F606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=lHobAEFp
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b0e00d7cc2so3454251a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 16:43:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794444223; x=1795049023; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hSyluR/dxUK77LHU2y4jYATB8HCJe2GhcZU7P8Sz6hg=;
        b=lHobAEFpPNodsOrZAO/MJWT0XrffSgZyI1gfmeiobgQ3ON+qNjHXPplABL731CQxc/
         9dpI3Ofh7qY4jV0gAMLkXGjiI47Y38wIgpkJlEL8AQDXx6lWak1iKtZLuFNodMzaMyYh
         pfdC5+ns+v8uniBBnL80jNek2BXcSEI5uJstCe9rnuLFypjr2mghMGBVKXLu4iOMibsm
         PFL23tU8WYXqbIfqaJK4WePJlOAwz8Mh/+IhTA4rhegNZIP3bYIBBPuxgGboHvGJALn3
         46DdPJR7mve8re7bXX/dxfPB7qvnqV6zo9GTMYKAUNjtJG82qcxXg60keli1ug1L6v9R
         7+Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794444223; x=1795049023;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hSyluR/dxUK77LHU2y4jYATB8HCJe2GhcZU7P8Sz6hg=;
        b=iFQY2Z60kz0UmcuFzJpDWEtPc4iomkdknaIRL1vetP4a6a6ftFAs9HNfHw7ZitnMe2
         g9tyicP7Ime0b5q5eIpNEvEcsSeDaJIFGAFlXm/4nVg3dLAxmF1NVyF3byVkpSUff/GY
         BI0kDdsav0W0aPaxZR/PzZHSfp1GkiQOzzr6FvleGxIvAq29O8YISuu5NjHx8c4d8xFJ
         q97lapwO2obL449yFj+Fvoqc3fItMkXEn40KZjCPZDvskIt3NdBT7K5ZT73CWDIUkH/l
         HhJBxa7JRszc+qbOsyBHhSVHwHZ35Dayypg7/LckO6tDHJcAmUG9sZ2mZhaKwup4I0qX
         4o1A==
X-Forwarded-Encrypted: i=1; AL+hErGve/ssk97pQiy0ZurBkHIGTciBY0vi0jPTCDsCOqzsMvOegWL7FJloEyyvNsXeoMljXtnSi0jM/tqCuHg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ONJMsfz7eYW3zmdWV7O+MeIQMLUNGIfGeOaPhsMHzcCcNPb7k
	nAZD7XqcZjqHdsHrouYZ7WNEYe4sAZ10mk3rRCmaLbwIysI4gWPBxzAdmOzJbvoH5J5Lp/+WpIe
	09d1odWNgPvc6zcqyZ5UifQ==
X-Received: from pgac17.prod.google.com ([2002:a05:6a02:2951:b0:cc7:e0b2:a5a2])
 (user=stanleyjhu job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:2e41:b0:3a7:f4d:b23d with SMTP id 98e67ed59e1d1-3b182f9e1ebmr3416903a91.52.1794444222998;
 Wed, 11 Nov 2026 16:43:42 -0800 (PST)
Date: Thu, 12 Nov 2026 08:43:40 +0800
In-Reply-To: <4ec390037882aa4cbfd8437b5597009058409460.camel@iokpp.de>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20260914144910.931518-1-stanleyjhu@google.com>
 <18d98074c73f90db.3137322e31362e3131332e313435.266ebc.0000sendgmr@google.com> <4ec390037882aa4cbfd8437b5597009058409460.camel@iokpp.de>
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
Message-ID: <20261112004340.3079348-1-stanleyjhu@google.com>
Subject: Re: [PATCH v5 0/3] rpmb: Fix request serialisation and teardown races
From: Stanley Jhu <stanleyjhu@google.com>
To: Bean Huo <beanhuo@iokpp.de>, Jens Wiklander <jenswi@kernel.org>, 
	Jens Wiklander <jens.wiklander@oss.qualcomm.com>, Alexey Charkov <alchark@flipper.net>
Cc: "Martin K . Petersen" <mkp@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Bart Van Assche <bvanassche@acm.org>, 
	Avri Altman <avri.altman@sandisk.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Bean Huo <beanhuo@micron.com>, Can Guo <can.guo@oss.qualcomm.com>, 
	Ulf Hansson <ulfh@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Shyam Saini <shyamsaini@linux.microsoft.com>, 
	"=?UTF-8?q?Alex=20Benn=C3=A9e?=" <alex.bennee@linaro.org>, 
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, linux-scsi@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 11, 2026 at 07:49:39PM +0100, Bean Huo wrote:
> Gentle ping. Alexey just hit the same failure on Rockchip and sent a
> separate fix https://patchwork.kernel.org/project/linux-scsi/patch/20261111-ufs-rpmb-bus-v1-1-b07100e53f6c@flipper.net/

Thanks for the ping, Bean. v5 no longer applies to mkp/scsi.git
for-next, so I sent v6 rebased on it:
https://lore.kernel.org/r/20261112004112.3059801-1-stanleyjhu@google.com

Alexey, a Tested-by on v6 from your Rockchip board would be very
welcome.

Thanks,
Stanley
