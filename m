Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794371195;
	b=TIevbmyX9RBkWL2BfjNZ2nWVlTcRdz5bfJ9rRP/ul8/4ugY24jyzuFDc1em4hOg0GNlk
	 /bguU5AMnENd72sBOoNZrmmGwSNUCFPaDLX0M2YkoJ+8m0u0rnZG3fSmcgQAqymkN2dLk
	 9qemmCmOPAn1ieNxfs5Mew4Dr3NL8gwQmoqDTScTkD+XNMjGrdmCfo9CQxBmxNTAvGYtv
	 hlZHLpH1Fj0XxyrXgtiXzIVWP+u0laPaJAvwhZN2e6xZlIe2RJXg6TLRVA4ESrePNup52
	 I4Xl1WoXlxmC3lK4unemyIlH4slCHNXZbGjxrnexraTDGBfvaUUAZYAGjTUDhcM7/4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794371195;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=JkuS+mUk2RH2MSK3tXztbBdwGQB9HnQXtlhnX94SlQA=;
	b=Ly0EmOI1Ms2lDYaYo9EdOV1pmFBlnER1DZRNJGgXYbKHrp6D4WjOQQMPzIzFrrepNrHc
	 x3JyD3d3B0ppT7Oapp/Plg5ugFo11spDt7MmZB/IDOvsfZcICUmUFn/8JxRm8yeRJrTxr
	 jiQcjNDjkmX7tcMBxxLJna6o7lNqW2kimJj3lRu3bl/3eUbd8Zy/VGm/508tftAGXDBzW
	 U4UUxIaH4PXvWU5A82uuBphcWpQkawxeTmmyNWMeMHTOM7cqz8djd87dHDvVTkaGdDcUE
	 8s1BPvJgw/LH9hY106KaoNUB7DBwko8Yuork67Z8JAS6LKHkCVd5P/ow7nFfqeZPYGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AbN1JFNZ;
	arc=none smtp.remote-ip=74.125.229.9
Received: from mail-dy2-f9.google.com (mail-dy2-f9.google.com [74.125.229.9])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E96F660A2620
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 04:26:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E96F660A2620
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AbN1JFNZ
Received: by mail-dy2-f9.google.com with SMTP id 5a478bee46e88-3678f64d078so3312491eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 20:26:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794371194; x=1794975994; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JkuS+mUk2RH2MSK3tXztbBdwGQB9HnQXtlhnX94SlQA=;
        b=AbN1JFNZQgkGlWWEsrQ2VJ68U4G/Mq1OjtG8B+uBa1Wwy7ExbZjxHbLdw2+MmyO23v
         5xcRGu1cceZx47w59x/vnxflTSZ408f+CyLztp8uw8FlHXOhaHCLiEZUJdQwRtrQVj6z
         YK7BZ4XyvWBzqGSxlYtPxATNNFfjGdh2qTeNaoRRobnn6qYwDemc1qtUVLdJ0xUFBqRV
         3doAvCXPD4DwUSk4lokM2xjHybRczcN++AbtIEQ+3QwVdAPKdozvjpDA7G78wlkZCMay
         87i1fRUI5BIObbUORel11gYkqfe0wUU2phrXekf0HtRcrWvCUEmkw4Bfh3vAQj34y6bj
         tk1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794371194; x=1794975994;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JkuS+mUk2RH2MSK3tXztbBdwGQB9HnQXtlhnX94SlQA=;
        b=hA/W0PAegAMcd964YONAkd/Hh6pJStvZzijKYsdOf/HJ1uKTtXs1gITaflEp6OeF+c
         4elYh4TdMmaYQfp9QTmWHAd9FhvkLRNSJpjZc6d2WPKAKhay2YyIGwEKxyAu21SHrUaN
         C4SIBVJo9rMbPRdtCmO59KgOBG52ke3z3GgJgGwVsAQiBO9Jvo9rjvrZ/ha329GtBNA4
         dGxL36X+M7XWhgqeHboc7KSC9awSBc4TJWgF7p9WNHzxBGBjK8X3VylpfSBDO3N7pNEN
         6PeIViBnaXSS0ozpSxCF9sSwXXgklzsG1ZiW04KSMfJcPQefoq9GNSsqDppv7K54z49V
         T5WA==
X-Forwarded-Encrypted: i=1; AL+hErFD4lQ/yr42YDM1wT6dBSt8WXRIaFSZnRJ/3/yK9T+sMD2QC238+akKm5FK1fsJRA++lLMw02uWrZGyhys=@vger.kernel.org
X-Gm-Message-State: APuU4Z8zhCM9E8idvhquPadD8k0xclviGa9F9W+hD1xwlzt9eWCwIMpe
	lWY7V/GezjMNkGbDSTmTRzI5RxtSmIdgT035f3PcQ3kDrObSZ2/w91CX
X-Gm-Gg: AYBFou3PiHR+5ti21hcplCSO2Zg4CjG3mJ2FMFQIKvgT65ObClBCcLA/TSiVVX6pj1t
	NqT2aZdJh5sjaUvBIA03qM2CZ7gx3J5s7H7Q8UqOAfB7FakDSzNoNBqouCl2eqYIUJEAV8CMxjY
	YwARYMlcrz3T+2h4o9BEr2RPRZ9zaqtcWm1VK5W46R3foeAxYg4/wyRTTAojXWQr/0Qp5btX49t
	2ad3yKeuq17yEcsxkmLz3O59LmaTp/oDGgSFyBXTavsxM4mRLXBj7aDwsyuNSs+OmGuNd394BVw
	VGz4e4SfjZFtXpkuzSxzlNwNRel8rqU8wVXLlXBX90hcH2jDIiYEe5Culji/NNi1dDn83Ucmdgh
	0SEQ7AY8obICU9OFgN5qSHIS+Xh4iCLi9h7PNKnNzHEL8kK+I369NyPMSby2oCsMzxhPukg5GDz
	oIkLv8O2pDIyidOHkVuKLPwtu34ruzLHhzTMUZWkV3mo3iuAPCK15TOLN0gJmEqAQ/rHLR6ZyC5
	pFOGEdhCIgJ2bA3ToTa6lzS8Q/8FTxngpTMoptlUiQEddH6M75ARCE6Psqt/QXObGgi18PKWdLc
	vpw=
X-Received: by 2002:a05:7300:c382:b0:376:bcc4:774b with SMTP id 5a478bee46e88-376bcc479abmr1028837eec.23.1794371193980;
        Tue, 10 Nov 2026 20:26:33 -0800 (PST)
Received: from localhost ([2403:2c80:6::10d9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfc6sm13018714eec.17.2026.11.10.20.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 20:26:33 -0800 (PST)
Date: Wed, 11 Nov 2026 12:26:28 +0800
Message-ID: <0d340a99e07dfba7ea1fba6d9529a1a6.codykang.hk@gmail.com>
From: Cody Kang <codykang.hk@gmail.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Haylen Chu <heylenay@4d2.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Yao Zi <me@ziyao.cc>,
 Uwe =?utf-8?q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Guodong Xu <docular.xu@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 06/17] clk: spacemit: k3: parent eDP/DP pixel clock to
 the PHY PLL
In-Reply-To: <1jwls975nh.fsf@starbuckisacylon.baylibre.com>
References: <20260809-k3-display-v2-0-327d7910bf71@gmail.com>
 <20260809-k3-display-v2-6-327d7910bf71@gmail.com>
 <1jwls975nh.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Jerome,

On Fri, 25 Sep 2026 16:43:46 +0200, Jerome Brunet wrote:
> On dim. 09 août 2026 at 21:14, Cody Kang <codykang.hk@gmail.com> wrote:
[...]
> >  static const struct clk_parent_data edp0_pclk_parents[] = {
> >  	CCU_PARENT_HW(lcd_pxclk),
> > -	CCU_PARENT_NAME(external_clk),
> > +	CCU_PARENT_NAME(edp0_pll_pxclk),
>
> hidden behind this macro is a .fw_name. Basically these are your DT
> input names. You can't change them at will like that because your
> bindings are supposed to be stable.

Thanks for the review.

> You should not use placeholder name, ever. No need to make the
> name too specific either, from the beginning it should have been
> something like "pixel_pll" or whatever your doc refer it with.

Agreed. The new names follow the documentation: the K3 user manual
describes these two mux inputs as "pixclk from eDP0 PLL" and "pixclk
from eDP1 PLL" (PMU_LCD_EDP_CTRL, fields EDP0_PIXCLK_SEL and
EDP1_PIXCLK_SEL).

> "external_clk" is not declared in your bindings AFAICT, so at least it
> should be fine to remove it.

Right. It is in no binding and no device tree in the tree supplies it,
so nothing that follows the bindings changes.

> There need to be a dt-binding patch documenting the new name you need
> and then you can start using it in the driver.

Patch 04 of this series is that patch ("dt-bindings: soc: spacemit:
allow eDP/DP PHY PLL pixel clocks on K3 APMU"). It comes before this one.

I will change the commit message in v3 to better align with the logic you
described.

> In the future, please try to document all the inputs of your controller
> in the bindings. Even if you do not use them yet, they exist.

My read is that comment is more to the original commit where 'external_clk'
being commited, which is not from me. But yes, I agree with you.

Cody
