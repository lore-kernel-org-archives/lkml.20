Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793981210;
	b=i8PL/O/GcAK4tQMTUefXeUMHXr/xC0oxRW+OaAY6tp+BUlu7bw21t0yId+liyL9VCaHa
	 7qFlijihS+IS35OGNZt8CHG3s/gY5ANsGAy58wyxuMtA/hlMKlO69mfP+P1RI+p+NcBQs
	 a78DlkdqhBKUxisgmg94SISJ0qjs3JQGso//Pp4hTpqQb9UFMhYio8JXdwnvXqMIuruEb
	 PCUyb+M4IebfeP+BanYJPxgQ8H1UCjhYLkbFSsLQPUHHU5c4YEiCasgM9cZza1KDy6iIl
	 tV2nEp5Qn7YmYW3olBcg4x5f+J2sL/cncB+DXgUEOheJ6yTHspVk6Fr182xz1zUSSDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793981210;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=WJzbf28TF6HkN7JNOqMOcLqHDlrTilq9qsNwsPdOZyY=;
	b=QKMghlMf67Z4rS5v/wbskmuXvPqRkFmfqurtFhWpY91+i+2EaA2AyDQmdcg4xdRAhlxN
	 Itqir3yGj0X9xFPpJ+8gmnDRZ0pSRoakpM3RF9JEfbmcVzF7//eoX1Ix7LmvTgYpp8A5v
	 URf0EllNWjsGkS5BsUD04nZVPZqT6xa5K0vLIoWIoDUkQZm53OtYmu6c4aWu/CljZ7OlH
	 D8ya4thqAHstjDTOqFPE3/iO+vGfKshsNLgDxWgj/+Az6YhXmCJjtLX5DuGSqLmK0uywC
	 Yd5cRbEdjOp2maEHpKVgVKydGijyXgG+fQlLTGXsA64YTVVLTZpk2fBIHKo+Pllag2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=FmSEEYOf;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C42D2606D821
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 16:06:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C42D2606D821
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=FmSEEYOf
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso6976525e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 08:06:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793981208; x=1794586008; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WJzbf28TF6HkN7JNOqMOcLqHDlrTilq9qsNwsPdOZyY=;
        b=FmSEEYOfRbAxuX4ZtuYuPL49kmYsFuLYpE7paXhrlg25qD5TsUf5jmSJ0LgW10YySh
         kqa+tK/h5HbaZm6W9ldQcm85LLc8I/E6rNLPS70ffxgbByVL/TLefIX1nS3qk0Q3tX8u
         JuMra9Xy6bp0v54JsLwrlyCA4R9MZaY7oU3xRo/2fCK1Kqm6lFeufdd1t9TJzEA/S2fj
         WaOJdBiwp7HtVc7O0P4lqACnR5Ce2RzkVffe1TFtcw74tlI7WwFD8Bp/L9/NXwVgqrWF
         s79OLC/ecq4HY0eF88ZzVMg9m3bjylQF7qeGeSQVFf2GvpiCIBChJCS235tLvR5VPX2V
         t5Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793981208; x=1794586008;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WJzbf28TF6HkN7JNOqMOcLqHDlrTilq9qsNwsPdOZyY=;
        b=Ym3buIiVkqXgNPeEaZjHnk3cUYE0vs1dfkrDK0VEiJXKtzGYVIp8SP0NDr/4OuJu3q
         Xiqy7+SnwaYLDxxbRzVCPdBYn5iyF9p8WNxN5pl3AAS1MAHHkUFhNodFuClY/zxxIPff
         p5vO4GTGSvJc2/d7Ocf8aLRziqjwVIrLD5BzvdZXQQNdM91kLzp6BlZVSTVXVOchtBrT
         PKblssEdpQn2+QI+qt0hLgjlGiHsG602hQkvxs5rI0WRRc5kfBojf6hBXpSL/Wxx+Two
         iYs7JedhkBDEkOFYar8SZKvLCC6ESnXfGT0SCc+ReWv/96syxuOuJAjdzPLqv84iNCIt
         251A==
X-Gm-Message-State: APuU4Z8qO3xV73RhbxMX62/TNfpg/17YO/oS6zEpiX4nSgAu6fNlYsLZ
	i43pRtsECnuzfG3ComO0EIkamw9cwkYTo2RFpdeMk/MzWRWEp0OsTuTq8HThc15ukwymvb3N6mC
	Vhwq0J5w=
X-Gm-Gg: AYBFou1U3kRC/ADv+t5IZKwPPyEBAnAla99b80r5BbmbVwKUV6L5eEHbi6GM5PkI4nr
	933GzW6wdMXkSnZq1p2mW2xHCB1qzpgtPqW8Gu7CnUyTRui0dVlP7s+XBvsUSfMW358+l5Ib/4h
	MvSdYppSuRm4nVDy7/2uweWNFBqgTinIieG6lUBpYaChve4y7Iw7TbjhY2wd470uvNGDl3ys0UB
	gV/LfwE1g63kcszTzj5nyfJvNhefWJVrrPcvSKJ6A6CKK2X/KqDKJRNOEGYM8i6ufjfmQeOtbnx
	ZCZoVU5vtzNy1JPw0LOklWZc5M4sgGIK2Iy7L/wGPcebNhSyk6yu+J6SJ1bh6ZxZ9D0o1xvz8rI
	dM1F+rG6kmrmwcUqwBvgINVBykljShdwoMkJIEm39oyASFIrH8iEDolD0skFIfQE8tslWxMgBzc
	FPpne1woBD2v4cANQpff9O92yUz5bYTlVXlbWlOA3YtM+8KZ6EGhXUGVF36FcUSGagZ86opOTvp
	6pGrKMVo9lDoMfoofcen8bH+hEyIP8U12LS4H5n1v86ecqTY3mZXGNwLP/S73PnodduaR4UIhr8
	Y5sLhQqagumj+ei32q22D9kQi/mPcREVlVQ7Q+wmCpsO538JoJT6
X-Received: by 2002:a05:600c:6095:b0:4a1:fb01:13 with SMTP id 5b1f17b1804b1-4b6df9bf214mr51113125e9.18.1793981208208;
        Fri, 06 Nov 2026 08:06:48 -0800 (PST)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b57373f7f1sm172665795e9.15.2026.11.06.08.06.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 08:06:47 -0800 (PST)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org
Cc: Frederic Weisbecker <frederic@kernel.org>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Ingo Molnar <mingo@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Aaron Tomlin <atomlin@atomlin.com>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Thomas Gleixner <tglx@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org
Subject: [PATCH 3/3] Documentation: no_hz: Add tick stop in polling idle
Date: Fri,  6 Nov 2026 17:06:15 +0100
Message-ID: <20261106160621.347228-4-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106160621.347228-1-marco.crivellari@suse.com>
References: <20261106160621.347228-1-marco.crivellari@suse.com>
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

On nohz_full CPUs the scheduling-clock tick is stopped while polling.
Update the documentation accordingly.

Cc: Anna-Maria Behnsen <anna-maria@linutronix.de>
Cc: Thomas Gleixner <tglx@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>
Cc: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 Documentation/timers/no_hz.rst | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/timers/no_hz.rst b/Documentation/timers/no_hz.rst
index 4006cab64079..d3ada4a0ebea 100644
--- a/Documentation/timers/no_hz.rst
+++ b/Documentation/timers/no_hz.rst
@@ -246,6 +246,9 @@ Known Issues
 		be even worse than that of dyntick-idle.  Furthermore,
 		this parameter effectively disables Turbo Mode on Intel
 		CPUs, which can significantly reduce maximum performance.
+		Note also that on nohz_full CPUs the scheduling-clock tick
+		is stopped while polling, so that it does not keep running
+		and interrupt the task once it resumes after idle.
 
 *	Adaptive-ticks slows user/kernel transitions slightly.
 	This is not expected to be a problem for computationally intensive
-- 
2.56.0

