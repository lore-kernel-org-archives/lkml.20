Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793945377;
	b=fAtPubQndBB/E2SlZFHWLSoamKFyNqglpEVEaJDSnBmCFAhyNPS2M9PJqVJYSR/4uECt
	 HD+Z0eEjdqrVDBfWqjQX+jgcd/lVHFWWmtzRg8RPx4oqbs+mxPy7s6FaGKtBRqrUQCcl1
	 vq/J/4eo/ks9SaaAN8rF5ntIZbj0I/FvQvQllEFf5r432K3yXUILboob9Yuz27EKFJcBY
	 qHYichK/z+WX8R4BiHLazeJdgDzX6sqGN8gFFiFseK0zZqTXQ1C1H70fkaLvsHhgPmvav
	 mq4OCrJXgmLaW8lJG7Rxb8H6fkcjvQUoVsUAe5R+pg2/SyN6LQSTCA27RcTgVYkrsAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793945377;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=H78gSmzAHOzV4l0I/w1s/VX9KmPbK8qgl1NsjdEHRpk=;
	b=dxVsa25QTNCafxmPM8bhBqrcQGhO5Tttq7OX7JhLbNwej17HLMKblq/rXQigQVbugGyh
	 EH7NOHUsjpw2+/HYpdW+9jTbFW1SbPX9DcL/E7eRegffmLWcQLV1n86gp0xPcUcBEQy9s
	 L/aaE1A7Ni0eXM9Jv5MBBVUcvlIxZzL4i03wotjzlfx+Y+2dQanOIqNJQzjYe/QJJUFZV
	 +an54cN+pi7cBZqtpsC9cmEkLqpwIJn/jgEdskFgIF7xe1q6l6Xe9BmH/ggQYH8l0aXN/
	 paGWH98v9cat+mc8ECSY4fBbltX8uZCSMd6e2cTbq/BbRttYQutv+4TvLnOSySY5opA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VtK2mIPm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9636606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 06:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VtK2mIPm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15C061F0089F;
	Fri,  6 Nov 2026 06:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793945376;
	bh=H78gSmzAHOzV4l0I/w1s/VX9KmPbK8qgl1NsjdEHRpk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=VtK2mIPmdOtcoCU5NUWc7mH9aLhWebzf0IBqCaPAEhNffYTrgEA5WSgTuGS80V6zh
	 UOT5wKVYrVyZ5/BJU4JcUfsXbc0c+kMxSq4PBjHBQ8fd1S6r0tgO5NYVWIhY6s9Jt3
	 UZZt22HxCBPyZ88q9P04SouS1EJjqoNAukx8vIuNmBFl8640K+WAKMOiYE7DcMrUq6
	 xzotTWSrvVSLyxEMyO3uemVIVz8wFeTJQ21qPk+BDTTudzeFEMmbMbCJGhb5/74ljy
	 2PY9uvZL0MByIjzNNwEqtO6znZkrrvRjDBz9m+CLdk35s4288xiQwgd+4OjcIequpC
	 iZww5vss3e5Zw==
Message-ID: <b9537359-9558-43b3-975f-de2a1017e463@kernel.org>
Date: Fri, 6 Nov 2026 07:09:32 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] MAINTAINERS: fix bouncing {sbranden,rjui}@broadcom.com
To: Ray Jui <ray.jui@broadcom.com>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org,
 Scott Branden <scott.branden@broadcom.com>
References: <510bf9b037c522ccfba270926c95170291115ef3.1793602003.git.jirislaby@kernel.org>
 <CAJ8Y1dTUmFXTHnoPuYMNKULVdaQPtr4S8OiCqhHKZ05WeyGCFA@mail.gmail.com>
Content-Language: en-US
From: Jiri Slaby <jirislaby@kernel.org>
Autocrypt: addr=jirislaby@kernel.org; keydata=
 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
In-Reply-To: <CAJ8Y1dTUmFXTHnoPuYMNKULVdaQPtr4S8OiCqhHKZ05WeyGCFA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 02. 11. 26, 17:20, Ray Jui wrote:
> Thanks, Jiri.
I am not sure who can pick this up, I tried couple of recipients without 
much success... I give up resending this for now -- you will likely need 
to pursue this yourselves. Maybe feed it through some your (broadcom) tree?

Thanks.

> On Sun, Nov 1, 2026 at 11:47 PM Jiri Slaby (SUSE) <jirislaby@kernel.org 
> <mailto:jirislaby@kernel.org>> wrote:
> 
>     Both emails are bouncing like:
>        Final-Recipient: rfc822; rjui@broadcom.com <mailto:rjui@broadcom.com>
>        Action: failed
>        Status: 5.1.3
>        Diagnostic-Code: smtp; The email account that you tried to reach does
>          not exist. Please try double-checking the recipient's email address
>          for typos or unnecessary spaces.
> 
>     According to Florian, it should be first.lastname@broadcom.com
>     <mailto:first.lastname@broadcom.com>.
> 
>     Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org
>     <mailto:jirislaby@kernel.org>>
>     Acked-by: Florian Fainelli <florian.fainelli@broadcom.com
>     <mailto:florian.fainelli@broadcom.com>>
>     Link: https://lore.kernel.org/all/688738af-100b-48af-
>     bee1-4bcbe4422f94@broadcom.com <https://lore.kernel.org/
>     all/688738af-100b-48af-bee1-4bcbe4422f94@broadcom.com>
>     Cc: bcm-kernel-feedback-list@broadcom.com <mailto:bcm-kernel-
>     feedback-list@broadcom.com>
>     Cc: linux-arm-kernel@lists.infradead.org <mailto:linux-arm-
>     kernel@lists.infradead.org>
>     Cc: Scott Branden <scott.branden@broadcom.com
>     <mailto:scott.branden@broadcom.com>>
>     Cc: Ray Jui <ray.jui@broadcom.com <mailto:ray.jui@broadcom.com>>
>     ---
>     [v3] just resend, noone picked it up yet
>     [v2] fix emails instead of their removal
>     ---
>       MAINTAINERS | 10 +++++-----
>       1 file changed, 5 insertions(+), 5 deletions(-)
> 
>     diff --git a/MAINTAINERS b/MAINTAINERS
>     index 04f465490612..88e010e78eb4 100644
>     --- a/MAINTAINERS
>     +++ b/MAINTAINERS
>     @@ -5318,8 +5318,8 @@ F:        drivers/iommu/generic_pt/fmt/*bcm2712*
> 
>       BROADCOM BCM281XX/BCM11XXX/BCM216XX ARM ARCHITECTURE
>       M:     Florian Fainelli <florian.fainelli@broadcom.com
>     <mailto:florian.fainelli@broadcom.com>>
>     -M:     Ray Jui <rjui@broadcom.com <mailto:rjui@broadcom.com>>
>     -M:     Scott Branden <sbranden@broadcom.com
>     <mailto:sbranden@broadcom.com>>
>     +M:     Ray Jui <ray.jui@broadcom.com <mailto:ray.jui@broadcom.com>>
>     +M:     Scott Branden <scott.branden@broadcom.com
>     <mailto:scott.branden@broadcom.com>>
>       R:     Broadcom internal kernel review list <bcm-kernel-feedback-
>     list@broadcom.com <mailto:bcm-kernel-feedback-list@broadcom.com>>
>       S:     Maintained
>       T:     git https://github.com/broadcom/mach-bcm <https://
>     github.com/broadcom/mach-bcm>
>     @@ -5616,8 +5616,8 @@ F:        drivers/net/mdio/mdio-bcm-unimac.c
>       F:     include/linux/platform_data/mdio-bcm-unimac.h
> 
>       BROADCOM IPROC ARM ARCHITECTURE
>     -M:     Ray Jui <rjui@broadcom.com <mailto:rjui@broadcom.com>>
>     -M:     Scott Branden <sbranden@broadcom.com
>     <mailto:sbranden@broadcom.com>>
>     +M:     Ray Jui <ray.jui@broadcom.com <mailto:ray.jui@broadcom.com>>
>     +M:     Scott Branden <scott.branden@broadcom.com
>     <mailto:scott.branden@broadcom.com>>
>       R:     Broadcom internal kernel review list <bcm-kernel-feedback-
>     list@broadcom.com <mailto:bcm-kernel-feedback-list@broadcom.com>>
>       L: linux-arm-kernel@lists.infradead.org <mailto:linux-arm-
>     kernel@lists.infradead.org> (moderated for non-subscribers)
>       S:     Maintained
>     @@ -5654,7 +5654,7 @@ F:        drivers/net/ethernet/broadcom/bgmac*
>       F:     drivers/net/ethernet/broadcom/unimac.h
> 
>       BROADCOM KONA GPIO DRIVER
>     -M:     Ray Jui <rjui@broadcom.com <mailto:rjui@broadcom.com>>
>     +M:     Ray Jui <ray.jui@broadcom.com <mailto:ray.jui@broadcom.com>>
>       R:     Broadcom internal kernel review list <bcm-kernel-feedback-
>     list@broadcom.com <mailto:bcm-kernel-feedback-list@broadcom.com>>
>       S:     Supported
>       F:     Documentation/devicetree/bindings/gpio/brcm,kona-gpio.yaml
>     -- 
>     2.56.0
> 


-- 
js
suse labs
