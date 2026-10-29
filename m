Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793245626;
	b=PiqLIvWibWc0k5DhAJnRGgRpPRiNnCRz1zOWRw9uzrT6s2yHa0bA8vEqFvjDzz7E6juT
	 aESOXKEX2BLD4W/P4/d6DCPqCgJ6ko+Y1/p+77yRbmxnyX3kIBvNFnjtvLPxbRkGH2Fq/
	 T6ih82VPLT4Y2rEZ3s8LVPhId6BL8rpnP6eeDafp6WZiqhKMkGsQvfb8c1smimA5rYYIq
	 hGDGweIQYenFVNdT8Y/PR/ilufgFs+ha4c2EBM1bPT2VdafEYYEtnQWq19sAga700r+3O
	 EyBN62HihmEekbtnUP3faOqznBjPFF7qyYM36RHuSei5JV8xvo5HZvuvqhZW+OOc82w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793245626;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=h8kq6Pl9NTWK4dw0Rh3Cdb4b4qd62zLH0TTeqwKDwHY=;
	b=d/h5Zw3+FWgMuCsXBjhrrZhru5OHel2jX9XDh7YwHy0MJQZ+5jvbuLrkB3jPs+ts1jtA
	 0dv+0XWxyBLGEgs04EYdr2o6vg61VyI7sAddth/KVo6LsgE3CfWwjFojFESWbDugwjOvb
	 LoI89/zGfat2sWoC3dU2ZeFYtZtLYkQFKH33hdeO5Uato3KE/KFgrQUpEC4RGJDPnxkYk
	 vuFSJH7pvVmU2AoSaUCR1CsLPPUw96ir4Z55FvtdGqTYnRpGW0L/0mAwaf9NSeNZqKoZ2
	 P0PHuk6uyFdKdwrUMgodtE4rEFkKn61UsY+DkA3LeCaDf8IS3oA32dGylpyVPJdK+4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Rdevqk10;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44BF5606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 03:47:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44BF5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Rdevqk10
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2eb0f1b592bso3770905ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 20:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793245625; x=1793850425; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h8kq6Pl9NTWK4dw0Rh3Cdb4b4qd62zLH0TTeqwKDwHY=;
        b=Rdevqk101cr+v9xciAZsil4BqLgOOYPJCQQU9UwUBlzdc78kr+WTAffXPya3G+p+Ra
         +dIw97dMpGxDRnaRgGttsVtThIKggdWJFJhkU0PfGEUEBSEE7JMoXNpZoU/uGn6AAkMQ
         RgAFeU/1qrGEav+3t+wxhuVVlRniLqpBA1Kg7nMLIpwYnZpMlYTwTqPDCshZKGmQ5LA0
         I/S1nZLdYhgeTsDCqR5qP/gixcwfhmB86L8hG9bqty+Clp136EgDpmYfDoMqcAmPwALF
         qmGNMpbeks1sSR+QQIyrPP18qTE3uF5X14cRzD6ZWMnkWS/WGvF6pqeughyFfalIFudR
         lVXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793245625; x=1793850425;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=h8kq6Pl9NTWK4dw0Rh3Cdb4b4qd62zLH0TTeqwKDwHY=;
        b=fFqPUsvyqotqs1bRTHAISlOQ7bDvKJpxe37JULs6YUB3rpsFXYtCxhP2cGo16GaFTS
         W3EzG7qPyjn5guzUIeOeZh9LbknHU89PCcjORgduQlT8n2ZmOd1Jjvssk7Jf2EddKw2d
         0qBKDK6oHNHuhAI/t0DDuVY0nbATSgBNiCjV/jRpoop2GX2a3brIGd1bpw0j+rWkckmV
         EsBYsIHtuojw7/VN7MPZoLrTWdrpbzs3ZCOj6Jrt/73C1jrZpA0zUW8NGiP3JBEVmAuO
         HY7sp/ofdKAU11P2fbHV4HcSbclnMqo1H+X+XooOdUR1Aup+tDeRYUxIwmMTNL7ls85s
         kuSw==
X-Forwarded-Encrypted: i=1; AKwUvBwnBoEGSdtetuwJM6Xag4NFXQVJOmGzJs31BZY/X9e07YggWBgx4M75mUtFaLxTG/ug4O7TatYec00ooxM=@vger.kernel.org
X-Gm-Message-State: AFq9FYI9ZVlQJPL6wGdqfFoLbl2ZsUu0D0adRR2uzWCm77J1PPziXI8N
	RinZfIP2GdfFEueWiQzvK7CMNf7QlWWt1N8luUJ3Sud0eKtRwiJnpuYF
X-Gm-Gg: AYBFou3GxxG5+dq8U2K7wcqSlaHcOPi/xHy1kRmzX5iqmUXEAL+yz1WLQFQ0rpPFvS+
	s6EX3gEW7YxH19CxiDhlghqbN1YeO2HWHJu6outIyhvhI++Z5y0Yuge9AIrhRl6GTiEck32cTXp
	qWcil3D+lNhO9rAGqcHLhrDRzU3RAsV5Rjuxvu9ZUPJ4XF55jTZR32phN7oGp7Q8L6Q8miIPA0w
	BwqHytqPshVmnRRapw7KfnwPojQeHsmvs6fmOEcAb0IWJTR0DJE0kIjhCG3edyaNq83Q4vTf0FV
	s+adcyUEb5wli1LwjQ21FDacn/vUcrYIpUCbR4Pv4DfSbqZv/GjPsSyuzX3ueHnszDv5daRPSG+
	JhIORkiOfyijOW6+lRakPyEcuFIHoGtZhaWAJytXcx3ma787EMfILalqTaXl9nCwf3dtP5MxVRQ
	/9gn3+7ea5Upq7l6AzvuYrfq5ZtNP08bhTi6hLOHBMkUe7/Z0bDHnGyC59RZOiaZ6YiIW9AYCWn
	DK++QkId3E1FA3MDISIQYc2z7o7nqyrfgH30LPCpS7kNbBM7HTHyGpxWOC8PVL6KQeyHv1PoT0U
	tk3E4ZTC5iBYxtjnagIhdmtavi0i7UdVaxsNCzOKAUd6dWK+4kJxvLU=
X-Received: by 2002:a17:903:144f:b0:2ea:4c42:573c with SMTP id d9443c01a7336-2eb0054f6aemr38499215ad.51.1793245625415;
        Wed, 28 Oct 2026 20:47:05 -0700 (PDT)
Received: from arm-a100.. ([140.112.28.118])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6b76df7sm28619815ad.14.2026.10.28.20.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 20:47:04 -0700 (PDT)
From: Tzu-Ching Yang <shingekinocore@gmail.com>
To: Yury Norov <ynorov@nvidia.com>,
	Guo Ren <guoren@kernel.org>
Cc: linux-csky@vger.kernel.org,
	Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] csky: bitops: Use the compiler builtin for __fls()
Date: Thu, 29 Oct 2026 11:46:58 +0800
Message-Id: <20261029034658.3137810-1-shingekinocore@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <auIQ2RI89C374je2@yury>
References: <20261022115922.1210342-1-shingekinocore@gmail.com> <atpm00m6KYhXo6Wi@yury> <20261023140806.1367050-1-shingekinocore@gmail.com> <atuBH6-LHueXYbFy@yury> <20261027062319.1700461-1-shingekinocore@gmail.com> <auIQ2RI89C374je2@yury>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, Oct 28, 2026 at 11:12:45AM -0400, Yury Norov wrote:
> I wonder why the older GCC works better... Can you make sure its the
> same kernel version and the config?

Same tree and config: both tables compare csky/linux-next at
abb81e5ce7d9 before and after the patch, with csky defconfig (CK807),
built with kernel.org GCC 12.5 for one table and GCC 16.2 for the other.
The .config files are identical except for the toolchain-derived symbols
(CONFIG_CC_VERSION_TEXT, CONFIG_GCC_VERSION, CONFIG_AS_VERSION,
CONFIG_LD_VERSION and CONFIG_CC_HAS_*).

The Before totals differ because GCC 16 emits more code than GCC 12 for
this config, with or without the patch. __fls() itself compiles to the
same 4 instructions (8 bytes) with GCC 9 to 16, before and after.

> Anyways the numbers show that the switch to the generic implementation
> is worth to try. I've added the numbers to the commit message and
> pushed in bitmap-for-next for testing.
> 
> Conditionally on the (so far, missing) csky engineers feedback.

Thanks for picking it up.

Tzu-Ching
