Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794559893;
	b=wMi0rWIPmbW7JcW+csdqDDWXzFEJdhdtmPk7/qO2/XLU7p7ArO8adgej9wj7jt5Qag0s
	 aDrKQGvy2DESypVp85M0xqmcnhOHkdQuakkKizzaeFofnHT8RhyWV2JVc2d7OtaiGq8am
	 dbXLDUQl3JkwqXb2ZS48wDSYEk7vdZJqJmJcUoAbOb/LClv9cibcGH3Smi1TGT7Sn4c/c
	 i2Ie7PPFgzWJKCbpfeOqNL7P6SQ0NS0rCV4A2A3auN72d004m4JhtSOI2OkrqUt5e7gLm
	 HbwAJwISIp0/95X1YXegHwOxLGl7L6b3+w7PvBuEU9jqynDwU4lT5kYYjMFzr3Aguvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794559893;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:In-Reply-To:References:From:Subject:To:Cc:
	 MIME-Version:Content-Type:Content-Disposition:User-Agent;
	bh=CiBcy7QaND7m5s9DJlixmA3xnrmmNcQJ7o62g9gNxcQ=;
	b=HInY8mCrcQGvBNtf6C0Qxpn3NZ0dRr0RKigyY5toXNXyywnROBp29tp/e/SxMOQAYKFP
	 d0BGPs9K8lDhAtMbhATGRYm6EXWAG8AfGH9IMfVJKnz6kTpZaACiGWmpB6QzLwDqSPq/H
	 B6IzRJfIi4qLWZ90yNZYNdbPijN1UYSZ6Dzw+x7ZWZkOzH3V1CCnWRonE1q3gRxHEB7kk
	 iVahSdYv3N60vWs94TiGOhZIbVkn4RdG/4MEk1i00ywnJ7BwDkiqn0XuMt31SuIrZlSzW
	 KQRe79oZKm0HbWMhE435GuWISaUlQVoqWYdK3Pg4XbrAkYnN+A0CQu1SLmC7YGwdSJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=OWzVGAhZ;
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36885606CB1A
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:51:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36885606CB1A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=OWzVGAhZ
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2ea7987517aso8174485ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:51:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794559892; x=1795164692; darn=vger.kernel.org;
        h=user-agent:content-disposition:content-type:mime-version:cc:to
         :subject:from:references:in-reply-to:message-id:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CiBcy7QaND7m5s9DJlixmA3xnrmmNcQJ7o62g9gNxcQ=;
        b=OWzVGAhZZqhqY+Spa7MkZScWhtIfbQ+aCSE6Lg/k9BiTi/UqSdMuDH414YT7SoWnBU
         icDhs5dGXh6uSyGJFVapKIdGKkEft5ilfsXqHJqdPxXbNCR0faK7cI7N5Ds77uGb9ZrW
         cTJIi/vFsuC+LrCXv8kYgAR+zcqcuDghVWplY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794559892; x=1795164692;
        h=user-agent:content-disposition:content-type:mime-version:cc:to
         :subject:from:references:in-reply-to:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CiBcy7QaND7m5s9DJlixmA3xnrmmNcQJ7o62g9gNxcQ=;
        b=nS2cSrH1wduFqJmrTN3BHPP/WhpBAAA3oel7tv16a64+2Cv47jXZeRCJtt4QNDVOBr
         zqFgXtxdTfu7krdUXB9JjIOinHHlGJAHZyi1WG6l1VEU7ZY/XS1oYgrWcFg/Z0sPV+oi
         E076VoMfMLJtJV5pH3VKV6kqYaqqpDbU+bENrPrpgV8bUrmTSvSMU7d4F47ziGhkf0To
         ZdjdQofUfr2UI53fQEyfZE1pWWSUe4y3u7Aw9JJdm23Z5WV306TUv//EN+97kYiDLqpv
         8E0CCg+mm+B7kts8MVcgWjIDX6jGij3vy3X8IOcKTOAgFTYE+jf1+ftcywJjzdywo68U
         Bmmw==
X-Forwarded-Encrypted: i=1; AL+hErEC6drtTB24p4vgvBUQLvO1mlnzxtWOQcfZMGyDaqmwwe6002u3OyPct3d8GJdZAQeiavQRY5kO5dI+MnI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+AD4dlYBUUv7zs9eS5vChG55PdgDUM3RIfDjBYRT3XeZajmAvA
	q/RSItUiPvlmCs02XA9cu88XDvM0Otk3r/Mt6tNRTY60mKiNsH+QvN+mJ4sUGdVhU9U=
X-Gm-Gg: AYBFou0td8ZfacaZK/Io38QYjYsqJE7/l+vq73m1u+AXTdu427FWcxoOuHQR/oUAFIS
	wfmqJoNT7PksTf6E/vVOHhlhD926dDpjvGpJnmlUVUhI2Y/XaeT5Vs7HgpFqrtkH3T6z5lEWUHp
	l4Utd8Nk/4l76dI0m44Uw6qCxYmSaJ1hOzbYHtIYWDr0npYv6a431QGHOGYremrI/qKI2Loy5bL
	TUce7roNg7H6uFXX7ou4liQdK6cTA4c8JfG0Q9lc8RgFvkz34L8gYrXMkNe/qpZWb0YHJ+wLE9f
	0rrtMxS6nZU443tE2FtI49dwXADuPU7Wyou+xKrMvXIB2sLi1ykFWI/CcVsQDKbV9JZglhzO8ei
	bumBHUGTgEWFIklUQztwdCVCV2Rju+OE3XOMc3o+2g4QAEwxzzwCVXhN0UnzDi6IInmcwAIWQuG
	TOH+3BQhkaG3+6OLNygBy5yPz6JGrQ8GeNIIEWGNWRghK/vFJ/v4HwKkaB1DSZAGcYRLTWaMOef
	RJj+o/kgh5hLzJtgi3/jex4TrFH5coYW3zF4nxSJEhL9I042UCCIAxWBs45ZiUP3SohxjlfDoSJ
	mNFtm7PJi6qYsxzuRw5TuOevFTQi90bpaIfYyuOzOLelSN9BHgJVIGrG3sHC6errR4Khol1JGij
	O8Nc3iAHg5hLYjX+alrkuDtMvessBCq7K0kACYbx/xOHZKo5MW2+QZVC7nUbiI0Cq8qtzIwO/vG
	LIdAGWd+58NnFODzUMfLgktp2lMigSyW6rnMvTM1yry0jwjDgSluRsJAwWagU=
X-Received: by 2002:a17:902:b414:b0:2ed:e0a:1138 with SMTP id d9443c01a7336-2ee0d66682emr16000605ad.4.1794559892624;
        Fri, 13 Nov 2026 00:51:32 -0800 (PST)
Received: from [172.22.0.2] ([50.175.87.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f7e48e2sm6970455ad.36.2026.11.13.00.51.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:51:31 -0800 (PST)
Date: Fri, 13 Nov 2026 00:51:28 -0800
Message-ID: <5e66c6e1fb0514242c89504ce624773ad54f50bc.1794506262.git.chris@chrisdown.name>
In-Reply-To: <cover.1794506262.git.chris@chrisdown.name>
References: <cover.1794506262.git.chris@chrisdown.name>
From: Chris Down <chris@chrisdown.name>
Subject: [PATCH v3 2/6] mm/slab: Enable SLAB_FREELIST_RANDOM by default
To: Vlastimil Babka <vbabka@kernel.org>,
    Harry Yoo <harry@kernel.org>,
    Andrew Morton <akpm@linux-foundation.org>
Cc: Hao Li <hao.li@linux.dev>,
    Christoph Lameter <cl@gentwo.org>,
    David Rientjes <rientjes@google.com>,
    Roman Gushchin <roman.gushchin@linux.dev>,
    Kees Cook <kees@kernel.org>,
    Marco Elver <elver@google.com>,
    GONG Ruiqi <gongruiqi@huaweicloud.com>,
    Jonathan Corbet <corbet@lwn.net>,
    linux-mm@kvack.org,
    linux-hardening@vger.kernel.org,
    linux-doc@vger.kernel.org,
    linux-kernel@vger.kernel.org,
    kernel-team@meta.com
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

SLAB_FREELIST_RANDOM randomises the order in which the objects in a new
slab are handed out. Like SLAB_FREELIST_HARDENED, most distros already
enable it, and its cost is only paid when a new slab is set up.

With it on, the same system level benchmarks didn't change measurably.
Allocating from new slabs does get slower, by up to about 30% per object
in a microbenchmark which does little else.

So let's enable it by default too. SHUFFLE_PAGE_ALLOCATOR defaults to
SLAB_FREELIST_RANDOM && ACPI_NUMA, so it's now built in by default on
those systems, but page shuffling itself stays off unless it's enabled
with page_alloc.shuffle.

Suggested-by: Vlastimil Babka <vbabka@kernel.org>
Reviewed-by: Kees Cook <kees@kernel.org>
Signed-off-by: Chris Down <chris@chrisdown.name>
---
 mm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/mm/Kconfig b/mm/Kconfig
index f330c2c29fd2..d174537d941e 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -200,6 +200,7 @@ config SLAB_MERGE_DEFAULT
 config SLAB_FREELIST_RANDOM
 	bool "Randomize slab freelist"
 	depends on !SLUB_TINY
+	default y
 	help
 	  Randomizes the freelist order used on creating new pages. This
 	  security feature reduces the predictability of the kernel slab
-- 
2.56.1

