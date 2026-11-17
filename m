Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794909983;
	b=aMBTztG6fpjuKsl6hAV03zsr52cL9bdztbI55oUZt51auf8dUOQQncSZnbioST6gptmx
	 WCrUl9BkFXDUEW2lvJpMcqyPTIiHI+hrQ61vLBh4BcHJn0UTqfVGdozc8BS4wtrMuPUnQ
	 mY6WkDAIzSc2FkBorpD432fBOAd888aCdI5UA8B2dyFjjA9/vsCWEYwxaI02M/LDgu7Fb
	 7RN0HV4jN4Vlrpz1rEh/SwP2P/cv3jidD9FSNsY7I9p4t+650fWrVvWzkEJcpxD8NceO+
	 JvbrFJ9OoLFeuZ5b2qaxJ3AoE1WqSv/DduWpj6yQFkcHWUtogBGpI2VyUvw3bXgjIfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794909983;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rI4LasV5b++IgM0KeqrCTlvPABydB8GrsEj8qvf7nig=;
	b=dtM94uhpDkCzNSVo/yRZm8reXXYVYKbfT8tXCgZ4VXQoG1BtCc9CjLgC87BzjU7UOf2Y
	 nVodaHO8cjOn5lBoq72s7jsJ77Om8L308T5on2ysqaiAR0EhnkP31boV1WLG15Az2NYY+
	 oxYlPx0JUs0Uz7vqLeb2TRODMexKpuy7/5WJegyO7Xaq4cqHMJ3PmZzgKCDM+kOsHRuDT
	 Wc41tZe65MECvUXCaBUPVdAtwEJ64jowshjdaYRICVlDYv0H6SsdgIXovbB6sapNGLatO
	 54wgzT9TeLhaxWsy/GqapQy3IRrESkcfxztHdsgmht1vY7LH1Mwom0C9xQshUPZE0qQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qxv9jBgr;
	arc=none smtp.remote-ip=209.85.210.169
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 020CC606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 10:06:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 020CC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qxv9jBgr
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8b66d1a08ccso4152709b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 02:06:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794909982; x=1795514782; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rI4LasV5b++IgM0KeqrCTlvPABydB8GrsEj8qvf7nig=;
        b=qxv9jBgrMfukboKyv7rMfU0CRJtV7gusvERDhwg5BfQidZfaSNFmoCgVDYV5+KawKG
         A+g9wnY8xkRgzR8DfqKm1NUUgy4dW5ZvMv9Swp+lsbmwof3PDIO5WNc5xNX3Yc+RZj2f
         LIek1j276h4dfUO8eWmtCxwxgq/rzQGWEPtgUrKKfcKMJS+JoCxutWpyoPOgiDew2p4q
         GMtIrO/Nd83auNzlmLnbH2tBOb9T5ADDVO3R/eS0FcDYiB/alU0NTh6PRI6fqWuErplY
         oi7RigbC+vvQ6godEP3zSZ3YSsKCsfTX1rcImmxv+4/EaKThBRN2B9q2xRkcXtCYbp/3
         L9SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794909982; x=1795514782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rI4LasV5b++IgM0KeqrCTlvPABydB8GrsEj8qvf7nig=;
        b=BcppUpENYSx7sz5qIyx6cNDHTudX7KcSYjU3nOLL9e2tkWFb47U7dZB/gA/CQVKQAF
         m6VlfXY6r5o0tHhuA3anJdAYwmM6Sng+Ldinib3S0eFMPNWCCi7x9Usev2Eb7wHr3TaV
         aexhlow20j58rpObkBhKAze4NQCwSz810TDS1nwqkQ8ktcVXFCbnn7UmvGOteqYbs0aa
         OZhhaFM6ux1iuvdGHr1Vb5tGCFeJb5IYn52jkAB0FP/04hjx/H5GVCV2x/mK7quEgXKl
         7B3BXEfs1rhGzTa72J3TBmpeY9b6jxH7eRAa8KcTegYkeu8ZN4h9p8tSvN4z/bvZNtqc
         VKQA==
X-Forwarded-Encrypted: i=1; AL+hErF2luMmwI3FA78r02gJI1vv7QtX3P12MYCYNXlSQA8xkV/7jgoTYhrCsdP6LMYrsdoIi3hzi1Q2H0R0DEg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/N+TDaa6JzIqpndbVhW7zvIl5xgLuTdyeWa5E7O0lSdkSZmWva
	iKfAsGbFcbQ+Elqo28KlTrp90XxGQ+GwnSC3NQ0iCBr1JcBkIbh5t2Y1
X-Gm-Gg: AYBFou1S/ePh8rbOt0lTVMFlTjE5LDsCEtX67k/VeIOKN94rUJvq4eFsV7BjfbdzCzw
	krN9FBL3imvQjUquNFDq7OTAlmokVsBGLRP66sM8YZzcdztWFubHY3/Be9dhj6M2KyEWXR5YIqP
	MEKdhCunLI4oNOrMF+JCxz/kfrRXCUR3oqYcR1tDLATl1tmV7XqphSu8kWqAzwlO/b9xvBeGnsq
	9JH5GFBSml6QB1i9bPJY/1QKVDWAnLFMoBJcbqJJWD4D4j+j+QfeyAwg0VcfHndRqIwKdSkhiJA
	1cdUIBV11j0IBrxCtGdK5ovMK/s/nx4GJ2J17d1BQhJNl08AAvxlFpLoOR/ls1Yv1/aNAK7ddcf
	pYTHVwdWsfqrAKT/pEZBY+9i1mbpPWNlOYMJuUs3Phx85EQTaQX3EqyVl4xLGFP9BXQ5xTcYNbf
	5+R6NW+Uh35F8rqK3MmUfoU45rrPf8MV2VvKJYGCgZorwZ5DI4vluJ22MaKAttR3BhPJhgSYt36
	soMMaVJ4CIR2yw6vt/m3rz789GIEAePFPthvvcCFY978wbZAPOhw0aI2VDS7PKy/QUdMVECApKn
	pvDLm4fZg7ZlVCBirbuwpnVDsGUnzBL+BKUizTsyFhpuThOiQYSDs4vj817wbi594UIL1mKNUtg
	mTtSlZO89wVOzK8Ia7iqP1AngKhAN9Y7bC+rZM4CYZRVPgU7vquJvwsYqoNvweYmn9z2Y+WxPa5
	8nRfwzBj9XaEHjkSSs7vfVAFv7tCUqPQYr+3DWN1Gc9zNaGeSOvQXAorM+iTS0r1q3YWHH4FVQD
	+dAMJCIOUfXhPPZnsyKSfFU3I7lnW/QgGOAJDTCfJD6M+XlkkBNCs3K3NpLK2p0
X-Received: by 2002:aa7:9ec2:0:b0:8bf:e028:7864 with SMTP id d2e1a72fcca58-8bfe02879c7mr6741005b3a.0.1794909982190;
        Tue, 17 Nov 2026 02:06:22 -0800 (PST)
Received: from localhost.localdomain (123-243-92-89.static.tpgi.com.au. [123.243.92.89])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed263b354sm4752612b3a.47.2026.11.17.02.06.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 02:06:21 -0800 (PST)
From: Daniel Wade <danjwade95@gmail.com>
To: David Hildenbrand <david@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	stable@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/memory: mark unshare copies dirty to fix MADV_FREE data loss
Date: Tue, 17 Nov 2026 20:36:02 +1030
Message-Id: <20261117100602.797-1-danjwade95@gmail.com>
X-Mailer: git-send-email 2.39.0.windows.2
In-Reply-To: <c7c8ba0f-49ff-4b22-bd24-20fc394b1e36@kernel.org>
References: <c7c8ba0f-49ff-4b22-bd24-20fc394b1e36@kernel.org>
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

On Tue, 17 Nov 2026 09:55:24 +0100
"David Hildenbrand (Arm)" <david@kernel.org> wrote:

> We should always prefer setting the pte dirty, not the folio, as the latter
> needs atomics.

Will do a v2 with your version, thanks.

> numa_maps does not show any such data. Did you mean smaps_rollup ?

It does, gather_stats() ors the pte bit with folio_test_dirty(). So I
kept it.

> A more future proof solution would be to only allow MADV_FREE if we are the
> exclusive folio owner, checked under folio lock.

Makes sense to me, it kills the whole class instead of one producer at a
time.

One thing though, that takes the folio lock on every folio. Right now a
clean exclusive one doesn't take it at all. If the lock is busy you skip
the folio, so jemalloc freeing a big range would leave some of it
behind.
