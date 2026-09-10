Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C9DB361DB1
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 22:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789080524; cv=none; b=Vr1U3a/qdywctqYK6tsd6xCH0BkSmXor909ybZ9wjZfpMOyb8bnzkDRcGxx9MkUpOUuObhFwJ5HBdHEmxxDVxE4XHF5hmDNCkok9Vy0XN1/VL50Uf0DUACk3fsthhpNDlWlA5Iq6EdRn05vw6Pw71A1tbZqFkhrA70I1/fSaZZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789080524; c=relaxed/simple;
	bh=UppgDEdeN24Z6bDVGx8PjgeRPS7f4gtYKDr5pla1Dik=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o44d1XVvTKCuYi50+15h1/LdRlSyM64tPyTHzjgYVhR/WHrJ6Hi9bGHyJrjXbpLIi5cNi/kIz72PST2s1W9fpjB21uwtSQnfVaj1cvd0evMOnnvlvQt10ewL2I/4Hr2xL4CTVxWdz8DW2Jm46GYOFFBmr8Bic04StGTxO+aTHtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E7WDqS4t; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E7WDqS4t"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b4ba7fe26so183495e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 15:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789080519; x=1789685319; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LgrTte8+Zm3JUi96agAI4ZS5dvZUFrbR10h0R21xs6c=;
        b=E7WDqS4tvtHZ8OVqNFj6tHq8EuiDGRv9bWiY6inJS5/JpqCU81odyKddLdmJpf1eVO
         Hjok5l3ZdqNErMISpNwLZB5AgJB/TzqOU/ilwyq1WvzVfrQvpqI4jlluCLpyOjGEzFap
         q5L/qJaZrhbUlh3hVT17ZH6N+ruZuQ+fngX6ElzXsXXpLIgDvjcJy1+Gd+jZm0yPC6F9
         3VkmI5OLJzKcgro3wgWRjm00lTj5Poo7wtBcKcTR7F9sL6GleM90bNr7WTcnl4oNd/pL
         HQbtfOAXaAt/6PmkhI/GCqU/apr6Ydwl0ZjGKIVJmDyF8ZJ0qCukzrEbnPdxUr6HC25g
         U6FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789080519; x=1789685319;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LgrTte8+Zm3JUi96agAI4ZS5dvZUFrbR10h0R21xs6c=;
        b=STm+rbqU0XDmkO28iyoM106uSbZERKRK8sJEJvDCctOanSoQAMXYE75Q8DrArOOue5
         qi41r116f8h2Fw8F00hps+LMYPahubYY2yqJlWbbvu0eS37YYWKBDqncKJJFVtwZM8NU
         I1Hbc0QsD5rzL0bFBZbhrbX/JOS6ieTf6IOtQYaXLtMrvTZCqSQbG71EHYFe1QaaqrNF
         ECnZ1Ljbq5R7TBfofEqbRZ3o1Vnj14UyfyQunDfbs82eWg4pm+f/33/7jYu6ythmSQWC
         eORYU4MSvXCxxDuQ2Fgegc6DLxRcjg+S/Sk0xBIlT2AZUl8T1H0nGQZwASfCT/5O6mO9
         u8jw==
X-Forwarded-Encrypted: i=1; AKwUvBy4ufYEZs0wEIGTd+IMjuF9YfZdPbfaZUKdg/A+edDWb3xAviEJot2ZZzNmLIsp6aSr/svilN97Y4zn6hE=@vger.kernel.org
X-Gm-Message-State: AFuF++kygBjyqUqVJ6HfihjY/Kniz7SqWgyELiq3Y9NAO3sD0Zc3Ugzm
	gNe+LT62M3V+PIpJktKKRMYE17LlL/J+LcPv3QKQswy+iSAITRD1R0vm
X-Gm-Gg: AYBFou0pWn3Ei/J05nPMUuajqMLku8FW5UWk/Qbw+YG4vWQhOfHjXLxjtkLLzSgs8er
	H+5tPXBkUkshMY3JODEyVEA30zo1O4+KeNphsm2Dp9+ulIjtFKLGNmkpYVgsjwEHtzATk8nuXYy
	/5Ho3VUXB0p2T8O/V/z40BSzdzpsZ1zsD/COP05CHMmtg0bQ6K2kRTl7sMK2I7vz8NuFp4WPbu7
	wcOg8y6O2qmcTqabttxMIe033IHKNM09mlkVg3Zq6X7BZ8IhFtkpXPFN1ZyJm1IvV1SJ8/5M1ko
	856VoyyVxPBMtR9PaVHa5+Ov4N/FHwNyrIdyzFK0592vLzB7+jxJ5AEZ08E6/O00Q0KpTtAcKO9
	KK43YHb2sj6KCY+TncY28cDRcJaqtX+wJ7SHvuP9XnpzWhITcq7PbtutN3Ojw6fB9HRCGcparBn
	lHws/2tl/0MPTAgm6aKPBgd3vXGgK9/ViGchoZlqXZLLpttKkfLCyXoYNLZxdLt2LELMhmFoFaL
	0hrMMoTZowhPDu0IIifuxYwwQDwcfyd
X-Received: by 2002:a05:600c:b99:b0:49d:1da4:511b with SMTP id 5b1f17b1804b1-49e619a8962mr11821315e9.1.1789080518610;
        Thu, 10 Sep 2026 15:48:38 -0700 (PDT)
Received: from lima-kdev.local ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eaccaa1asm2021565f8f.0.2026.09.10.15.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 15:48:38 -0700 (PDT)
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: tim.c.chen@linux.intel.com
Cc: brauner@kernel.org,
	bsegall@google.com,
	dietmar.eggemann@arm.com,
	imv4bel@gmail.com,
	jack@suse.cz,
	juri.lelli@redhat.com,
	kees@kernel.org,
	kprateek.nayak@amd.com,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	mgorman@suse.de,
	mingo@redhat.com,
	peterz@infradead.org,
	qyousef@layalina.io,
	ricardo.neri-calderon@linux.intel.com,
	rostedt@goodmis.org,
	srikar@linux.ibm.com,
	sshegde@linux.ibm.com,
	vincent.guittot@linaro.org,
	vineethr@linux.ibm.com,
	viro@zeniv.linux.org.uk,
	vschneid@redhat.com,
	wanglu.priv@gmail.com,
	yi1.lai@intel.com,
	yu.c.chen@intel.com,
	zhanxusheng1024@gmail.com,
	zhanxusheng@xiaomi.com,
	ziqianlu@bytedance.com,
	Kayra Cizmeci <kayracizmeci@gmail.com>
Subject: Re: [PATCH 1/4] sched/cache: Keep nr_pref_llc_running in the runnable domain
Date: Fri, 11 Sep 2026 01:48:23 +0300
Message-ID: <20260910224824.1209785-1-kayracizmeci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <82736e1329bf8ed195bbbc4990486c87094e6789.1789061845.git.tim.c.chen@linux.intel.com>
References: <82736e1329bf8ed195bbbc4990486c87094e6789.1789061845.git.tim.c.chen@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello Tim,

I thought about the older messages and I think it's really not worth it.
I mean, even if I'm right on 1 call site, the others won't behave the same.

And I think this version is cleaner anyways.

Only thing I could see was that on 1/4. 

Feel free to add:

Reviewed-by: Kayra Cizmeci <kayracizmeci@gmail.com>

Now I'm going to sleep. Ah..


