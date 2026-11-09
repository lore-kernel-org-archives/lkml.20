Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794239936;
	b=oGFNquXX8CsvK0x8iZaSonSMvVyNCaBQLy1797oVCQXF+P5qaNrvy2Hk2ySOZNHDx478
	 MrK75gKgkLxqYhzxfclPnFavW6lI37iIcb/6dA50JACJZ14/7FcL36eHjTqGccdz4dBWc
	 TsjIzaH1q60ZVZnLPw0QAhnKFDFTbjAtbRu0gwM3F5TWNbyqYYetMihHIDr6HXfRY87ly
	 KIvHpoO26WGet8qLkSNybEZidoVqows6e2ak4jX9tGA8DErtNv2qTLGyErwdvLCtFCqSt
	 NxZQsxm5GRDpFmb3mNdPfONPEOdUnACPlD47KXv80b/57H0Xt16US/dIYeMGDqUoDGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794239936;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=iZoyp77DHh7ciI1Pc9NBVp5LRxFNaKKZYvd2HzLuYGA=;
	b=JcUwDXrfQRfoa+F3wOjXd3mhQ7X2RU5K3Zq+hA/HCPSU2Q/Q0hiPnLEsT82L4Mixj6ib
	 ulyfpuy7vB98vIDE/pIyYgwwKXujTAolfoQ4tIJ+pBe7/BEH9QQrUQPAS8yPaIjJWhfWy
	 e3rNB36jzREUYZ2gun5yc/2s0N46nETV7BjAEF4O2Fj6jDsiTNVmhgvF4ZcqAXihwM7X0
	 RtjIWSuq3H4d+p+cLZiMnxNezS10RFSJJflEPYJ9iohJ7cjTB/w9zgXWTclgJ3RRZOcDH
	 Phv9726fhcUV7R8t9hBiK+bJ91blqIeaO280R8rh2gUZ2woV9IaiTl+nr85tV7TtU9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xuJBqQJp;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7516606EE93
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 15:58:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7516606EE93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xuJBqQJp
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-372bdb942dbso1435355eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 07:58:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794239935; x=1794844735; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iZoyp77DHh7ciI1Pc9NBVp5LRxFNaKKZYvd2HzLuYGA=;
        b=xuJBqQJppdiLhxluGyVMS+U7NscRuAVyhpmgJZhCjQisPImrNGSZ6oD6zvOf0FuXDv
         cZBstsXGEPoWZms5AhM3aMVlHhj8rt2OL6cg/nT/zngTkelyGcu/NHafk4Mn/mBdBlqU
         49zCCC6c/lFPDL6Hd5y79dDGrM5ILuiOaTkepEh/1CXQlh9bxy9RsFtosG6eujrLdoyU
         btNbZD5CtQ2Ft2uBiQTzKP1zCEA3Slvi1XObd3TKcdq+dfhfte3Ux4qy+fBBvqtKehKi
         3bAf3k66j+217uc6I7tmPI0x0HUOVi2hMuNnvX+o9cMc7n4CQz7YxoMT9uSWD3WQg4Sp
         VPeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794239935; x=1794844735;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iZoyp77DHh7ciI1Pc9NBVp5LRxFNaKKZYvd2HzLuYGA=;
        b=G94rR5Y4sXhmDHzoNBK76xxl7a/YuYdK5vOjibsp0F4CFyTNAwPfz+FmF/p0D6N93e
         Cg8Y/jWemsyp1z/BZADxUS5NrcGYSpUWf/kfkxgK9TEjCi8So9OTjFqA6IqXvFxjI+7p
         FJXPFSLOIGxRkb91lirOgMy2qHESkvyvwAZlEo05ye96naHqozRLmA7OxF4sklW/QhVD
         Hi5WXX0+AKxPysWnyC9H0m2c/FHDoVpPBdfHsB+uRDbY8N+2ZK6cDaq3S5dY7hAM0fA5
         cS02LypFue/fVUdE3LyCyXIRgXuUg7pqxVEVwoJgmzXNMSCUPXeJW37bipxM5b9CWh9p
         eG0A==
X-Gm-Message-State: APuU4Z/Efm1LKqUwKqEU/7cvBRTUWsLQE7We//C3Ed4LqkAD8uysqYR2
	/7wV/FumyyZAU6ht0fs4HXaeVC3h2v+5AZZkRWhlF0+FKTTcLw/OtKLS
X-Gm-Gg: AYBFou3Ju0NA0fpC1L6PPTGRyeeQAnC7pU9Fjh7aYTgjcBsyKJy0eDwOgitQvdDCrOC
	JHhEjpI8E4dYHjmix4Hhjri68Cg/sFKLSx1r99HGY73EebGEWfDao1uyXypuDOJ1QbgcP3iqYlF
	xafzTHVlvlHIXfaG6VW7/FJl3OUvfB78pT6QjziDsYE3qDdbsAKMvOZP1ORFXQl4NOeCobx1wlk
	ZMY0HiAQpfH67OIcT+hDW/eK2dm3haThOgeHZQ4YtTAa2HKlK/POZOhqSjIY4thmzeo/qrhmt1r
	sinDPSXUi5DmJUjJEEIC1XZBThdtef+3Oza61Yp9Kii8/U2xOTg5bdNffROZS3Fe5UqEzdddxRS
	89WQ6lH40OHIRWgF4zHCjZbk7KFMDwdEkRRVLcJNlamyqB+XhC+rMIxKbPQs1nEQ3I/QjPY6XfR
	1nR/pQTqs2q7JH6hbOAcgv0k0p3sM1ImaY6E+rEsQmLjl0TPMit9AsiYtYp7ANi0DgnHNJa2Nud
	KW4O3CiRyY1usJi1wocgyE/YSMKoLzEzFccB9EisPYINbnYGJG1GZCq41YmnVqFGOp3nzdlmLLM
	IGLcgo/igJtU9iBcO2Fulp36mzfVitJOX1/vMMRQxvWAABdbiQ==
X-Received: by 2002:a05:7301:7004:b0:36c:9b35:5d46 with SMTP id 5a478bee46e88-372571d9ac9mr8144387eec.26.1794239933856;
        Mon, 09 Nov 2026 07:58:53 -0800 (PST)
Received: from localhost.localdomain ([103.170.54.70])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-373920a0219sm9009881eec.9.2026.11.09.07.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 07:58:53 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	sreekuttan2156239@gmail.com,
	tiwai@suse.com
Subject: Re: [PATCH v3] ALSA: control: Fix parsing of numeric fields
Date: Mon,  9 Nov 2026 15:58:31 +0000
Message-ID: <20261109155831.5822-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <87qzguulaf.wl-tiwai@suse.de>
References: <87qzguulaf.wl-tiwai@suse.de>
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

Hi Takashi,

Thanks for the suggestion.

I've updated the patch accordingly. All parse_*() functions 
now return the end of the current substring, leaving comma 
handling to set_led_id().

I've also updated parse_uint() to temporarily terminate the 
numeric substring before calling kstrtouint().

Please find the updated v4 patch.

Thanks,
Sreeraj
