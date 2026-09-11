Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 642DF44E649
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 11:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789125333; cv=none; b=kY1wIHfAHeCR8OpC/pCZ/lBkhmiEFflE8UVFZ8inWa+FuN765OHiEqfEbXCethUIrsPW9VNYIT+PAQPk634iDan1edGNg2IxUoLyHF+rx/6R3Zp6L5b6pUsO1CvCgVjXgmIktbtIrH7t+MA21RWu2VcPvusMUffgHTLhUQcAEKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789125333; c=relaxed/simple;
	bh=Iz+Cr6Z0loakD/erjIMAsYt7hdgC2FopSJGK1uDAkvY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=pLqUMgzTOc/GFpBe2u5xqspRXuJnw5r4NdP1nxA8L2uriQy4X9K9OM7Hut4lZmDmJkaTuWK0cvEOfXCR2Hd6SHQxI4/AAMUiXmOxkxzUiQeQh4ennyNzA6AdhQVMCHi/vIwwrZ1hp4L+D5zUlCxN9vlDQ6qvzxGSptrlZrOuinE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nYN7yboU; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nYN7yboU"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd38e0e5dso9778295e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 04:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789125323; x=1789730123; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Iz+Cr6Z0loakD/erjIMAsYt7hdgC2FopSJGK1uDAkvY=;
        b=nYN7yboUsoHcEc5nUsQJYuoDyEQomyfsb8Tmq/BkIeMnhsjnfGI5/HFz8r/AkTM3Wk
         fMb3iSNIdFWfFdih2MN+3IZwOqYCChkJgR7x2qVu41AHaRHp+HbuG6w2uZCfWSyVLP12
         Wm4B8Bs7UiZ5ga6mA8l7PJK0SZYVGPRsF+qvizWJohI8bXzpKbsHZ8PCGd7QhI7Iam53
         TpHP7p4Vv1QDl1AF6PNX9SetufiY9Tg7RhmcVieIPB+cq0nNySHFBH29t0rsjlmA+qMh
         ralwjmDFLS80fJ1XBeougI+7nia07lOrH96GP8WKTO5jrLFP4ReEhNzi39J1VQeuACyd
         frdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789125323; x=1789730123;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Iz+Cr6Z0loakD/erjIMAsYt7hdgC2FopSJGK1uDAkvY=;
        b=jfr1hu/DgLyuHsZdU6QfB1a81n7AhpuVubRggtOdGf2S/S68p2pbBjvDlRov6vcHeq
         2MDw+dAbGLzE7kFz1UhFVEl4C4AWitTpzxceFjvOYEvqIc1tCiNcuXJ9H+CcZR6nqWDZ
         txd0XCQekaFE0pUZMaO/lwSvch16JdESNzUpqZmSdkPXsXS0t5N2vTsbutPNM/HBRANG
         Vq5Y1zwNgWV7/FZXejHbz45pUTBOX+rkhL0ypoAXSsL0+fviEM+6iH6t9/BeSQwsQRnW
         kX/GhqdVGtWSKgy1SaiODeFYjoQlwgJDGRTRuyKJzGmcIz81o/9L1Bkn6A/IQXmgPZ+T
         h5zQ==
X-Forwarded-Encrypted: i=1; AKwUvBwIbf4kaVabuGmTqW93VzTOHgFi4+8Ji9bvd2VS1YtSip/Uq9wq1rykRji1sr428mvC+0CxPLJjU4jmIak=@vger.kernel.org
X-Gm-Message-State: AFuF++nAINrOlapwNUPdHfG4J+//N4p5NHMcgb1aniUJNwwu15SUG1d9
	xh65UV21jlIxz0Vl1O5YQvVJvyt2hbCsVHehvEtzbLr8zRQFXMM0wHc=
X-Gm-Gg: AYBFou1m+OAshVIL/mmahRablBrwYgdS1MXZkMFMuJITGywFp0u+wkrMnG9fNXDxy0z
	2vr+lPur7fIymeuDHPd84uykX7r/I4xkh1tEtdkbf8UqJGsRngYD4GJOQDiz1zoKXn018qtds9J
	tmUkeR3yc5bMcYFkhCg180+TS4KCksiQNsDoAAgMNYgCrUWf2sEp+wHcrhHtWX1spR7x9f82ygw
	yXLPN9JYc0wYTRV/fyaICd0RU8miUqbOLLsKDXNzEYZ02k2MAUOI54cTC0ZklT6KdYO7DfHReLD
	+Hkem0nGCnr7uIRuDBWv3O0da7U5E0t74t/1ZjsYNnYNh9YeUp/c46AgfGR51q1nC7gRYtAwWun
	ptlIrGS5Y3uF8GG+LJu/Nn4wEXgWW7rb5QQZYX81YOVntTD0KslEwPqGhVIZZK0a/3IHoKBeLPZ
	RFRoizV8iJ4OsWB+SiPgtN4pigc8ay/v0lgDQITcu6nU9PqhNzgDDNmxdcrQm7x8TBq7S0VvKJ5
	5S1xNvDJete/nzV/i6clUnIF23Lipsslqq/c7fkvyTGz+Q0dLFQk6uQFmfRLcrBSEI7Uj3/xYY/
	yl2vWHgbuWrd5vPsd9Paodies1KPT3wJhJ1ZOmSUsEPK8aSPmLEw93n3p0xEv6RTsU6zZEt2
X-Received: by 2002:a05:600c:4693:b0:498:943:ccc0 with SMTP id 5b1f17b1804b1-49e619bec89mr78139215e9.6.1789125322522;
        Fri, 11 Sep 2026 04:15:22 -0700 (PDT)
Received: from localhost (92-242-249-81.broadband.mtnet.hr. [92.242.249.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb2ecfc3sm5062381f8f.4.2026.09.11.04.15.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 04:15:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Sep 2026 13:14:20 +0200
Message-Id: <DLCFZ1Z5FV92.3JAXNVQWJZGN8@gmail.com>
Cc: "Geert Uytterhoeven" <geert@linux-m68k.org>, "Ulf Hansson"
 <ulfh@kernel.org>, "Jakov Novak" <jakovnovak30@gmail.com>,
 <linux-mmc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-kernel-mentees@lists.linux.dev>, "Guangshuo Li"
 <lgs201920130244@gmail.com>, "Runyu Xiao" <runyu.xiao@seu.edu.cn>, "Shuah
 Khan" <skhan@linuxfoundation.org>,
 <syzbot+1ee4f3b9228e35f14677@syzkaller.appspotmail.com>
Subject: Re: [PATCH] mmc: vub300: fix sleeping function call from invalid
 context in vub300_inactivity_timer_expired
From: "Jakov Novak" <jakovnovak30@gmail.com>
To: "Johan Hovold" <johan@kernel.org>, "Wolfram Sang"
 <wsa+renesas@sang-engineering.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260816153809.7067-1-jakovnovak30@gmail.com>
 <aoLCr8JEYaYxcJcQ@hovoldconsulting.com>
 <CAMuHMdU_Rx4ZGi9SsNxKUDyYmV-GbD8rD9NMVzYginBMXdZDMg@mail.gmail.com>
 <ap7CaVj82BJZgjf6@hovoldconsulting.com>
 <CAMuHMdX6JfqpLMGDQJSQ8E8XNobRwr16LOzuphPt3Afs-OZdJA@mail.gmail.com>
 <aqEDb0THnCM-Q_Vy@hovoldconsulting.com> <aqGWWhvL5CKH2mgx@shikoro>
 <aqOoBwBav8JZhMQ9@hovoldconsulting.com>
In-Reply-To: <aqOoBwBav8JZhMQ9@hovoldconsulting.com>

Hi Johan,

> Thanks for taking a look. I guess we should fix this inconsistency in
> MMC core eventually, but that the vub300 needs to be reworked to handle
> this quirk in the mean time.

Should I send a v2 based on my first patch with the Reported-by,
Tested-by and Fixes tags fixed or is there something else I missed?=20

Best,
Jakov
