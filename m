Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794280959;
	b=xcUuixosW73Qvs5LxQJH8NcakuNBOtvbYuFxCVXTlUYhm9kxGDSL/eeVFiVg5QrS9pP7
	 hK6yAqvf1jLO9odu5v6Xf7fk/8YSxBE7D7I1meCGP5tg6NIzNvxBy3OlYwwEJGEu+vIRM
	 eai4CaFVyFZWt70xTP+l6w4WKdeprhVUeIwHXXePrEzrD7Hrr7mLz9RALC3i1MVQjOvpk
	 34rj+XdVcMSgzCcWHbZ1RvuDPTD/GQ2EOU42prR6gSKDBvVuTbKrPXneJZTBaueW8Ub4d
	 9EdGuKC8e2xGvVlxG1bHfnBf75HhQd5xaztSoyg3yQrk9w0n7Cw+VH0IQEhbqr8lNmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794280959;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0n3oxuSYM0wY0dNcqd4sVlOYEFaqxsxikNeoWib2fRE=;
	b=2KK5QJlEptGfI1IdKixSOmLABUgOeBTZPy047WD3PsDQRp9ND38zttme+J+m2lLyDzAo
	 vE/SZsZuA4RJE+Vmc6cgNa2NJ2cTvQTSyaFGIlgZWc6KgkFoX4MRuBIsVjlG2Q+Uu1xxl
	 R9W55cXfLcKlzTTUF3LDzVSu6xyvxVsk442ekXjznUCLFgquaasl2TjiR9/K7mdN2qfox
	 OoTDN40QrW2hMNQrNWVkdkjBqkWdqqX7a070aOqZbU2diNhP14oUUrLknjUAIaZ4rvrzM
	 02oofWc0E+XJ/sQNz3sQVRLHKnIgjPdS1HuXCj4gAC4GwHPlUPZKYEqx103E0dEzUIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xAUVWEMJ;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5D360A2617
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 03:22:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC5D360A2617
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xAUVWEMJ
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-170135e43c7so2342088c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 19:22:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794280958; x=1794885758; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0n3oxuSYM0wY0dNcqd4sVlOYEFaqxsxikNeoWib2fRE=;
        b=xAUVWEMJIPDmeFKsmhIV1Zj5U+r9lthtoqzb4uiUSi+lhY/v9VM4NRGRtUv0iZKNib
         48gnIUfYYOqQk+RHI+f3V/r8RoOroRbbLIzkSN1kIlMijRinYXiEMIl4fm6fVIqdGdjP
         24zwrkKvTtOLvn63wV/XoF3rWgS3UZkyQ3JPYP0IvcNnB57+DP4EruFYNfzF6ZaSaToL
         2vuPPiSUPxaSL4/oEXyRwrVWxve9OWSM0aC6pwIaI5dyiJTj/PZUvtPzUPK5int/2xqe
         z85UBeAGqDSfdIgmFkJAhdU3OstphZ8Mcy78jvm46gnohop5j00V8PL9Vj6J+W19OQRz
         Y7yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794280958; x=1794885758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0n3oxuSYM0wY0dNcqd4sVlOYEFaqxsxikNeoWib2fRE=;
        b=GTt7jyEUsxXviSQ7//2Qzh2LqHZxsLRrVqrAp8bYDkhWJY5p1XtHvVgpqhZF6s/4vH
         9gp61ehH8Y7F4GGaevWxQnEVfJpUxM/k3rnx11IKILHl4bEcMFldJOGfrdDki+WFasQg
         gOUXAtH8NLoL0Mc2bxbph0yLm1w9u1WnUlUD7xqZvO3GFha2Up786rd3l/vuDxOywNOh
         SMAP8IkcEaz1JujXVVKFNMFr5y3cqIR0ooJnNL/KB8oNrcJDhdU6DlFGL9/eXsO9n0eX
         YLTm1o1m3yWitiSH1s+xPxD6LZigY5CfrCsq/4wYfK4SPbXNL7FsMp918LYtUKSLRJEM
         647g==
X-Forwarded-Encrypted: i=1; AL+hErESQfRQJDYxCHtaxozKv7b43jJeBQGYmi5KXi9s6lwM2GXYPKJa3wljiV+vuinrkUyffou2dEmthppfQVg=@vger.kernel.org
X-Gm-Message-State: APuU4Z89FVeDLvZbaXOyQWdkVqOo0Uk8KZ+g1Xb5f+NfyFO4xKx3FMkH
	vNBUH1Jgywm8oda8yhOQRTVlHeDA564RG/iMvw6QXMrYbc6CH498tt51
X-Gm-Gg: AYBFou2hC/+7+3FO7v9EHU8ZuYEbQZa7m7+qCgy1BWhahxN05PeS0Go4m2yn+cCEYC8
	40jV3Dl5SVQG7iVLZC/JddILsfIcxnIgl6jzaKrGQeEfA7zvWBheo3LwBKgrIEvA5NNSgHzv9g3
	LO2z9KsMxmPsBDssRpYU6NOQ+hm3JDVfM9XPev5/31gELNHJenOI1bl2DGqGZ5BDwsCJVZWDhE6
	xjNDhFOJnJ4DVO4AT451SOmnV8arOddXIXj8tNOgmKccrc6zgy0RGFtmsZp4o+brBVQsqMdwCY4
	f4vvAYjhMVetCmhzJCQnpbn3UULq9H7Z9mAjWFSf2Q6vMDpEAmxmxPJRQl/mRJoueP51iE3ShJ4
	LqOjBrokcDQw3W0O5a/omZAS9c5Ag2OqXFbTxShNHXrNZs/BLPUBqtZkcYpzfbKkqEMNop5H1Io
	5w7o8QGL5+l0nzRV3lfWpEqNcz6pVJETknCXOtacLBHHzh7gvQ6cBMMLWcSVEhzimUAOyBUJox9
	i0pnv4vLl/Jfrj8+P6V7bLQlMNNIoG8JYAIO/OKdbLPcvzbylFgPU8SHeEvCQuzJJhEU8Xv5cIk
	4DbS/swXsxZr/P/ESrE2+aIC2uNjV9mwZbj1V73hwdH4Nx2p3eLqGoPyydycQrf3+y60FF4R77I
	Zxq3Q5UE9
X-Received: by 2002:a05:701b:2302:b0:1b3:a9c0:6a3e with SMTP id a92af1059eb24-1b3b5fff49bmr1860238c88.29.1794280957671;
        Mon, 09 Nov 2026 19:22:37 -0800 (PST)
Received: from thinkpad.tail59a646.ts.net ([112.199.224.229])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b4efc2sm2897362c88.15.2026.11.09.19.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 19:22:37 -0800 (PST)
From: Hang Zhengyang <hang.zhengyang1010@gmail.com>
To: Jacob Lefkowitz <jlefkowi@akamai.com>
Cc: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>,
	Ravi Bangoria <ravi.bangoria@amd.com>,
	Ben Chaney <bchaney@akamai.com>,
	Matt Pelland <mpelland@akamai.com>,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] perf jevents: Add IOMMU PTW & device entry metrics
Date: Tue, 10 Nov 2026 11:22:30 +0800
Message-ID: <20261110032232.3080268-1-hang.zhengyang1010@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261102-perf-tools-next-v2-0-4d237f886710@akamai.com>
References: <20261102-perf-tools-next-v2-0-4d237f886710@akamai.com>
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

On Mon, 02 Nov 2026 21:14:15 +0000, Jacob Lefkowitz wrote:
> Adds AMD specific metrics for the IOMMU with respect to page table
> walks and device table entires.

Tested on Zen 3 (Ryzen 7 PRO 5850U) on top of perf-tools-next
13a8d580433a.  Both groups show up and count, perf test 130 and 131
pass, and under O_DIRECT reads from NVMe the values match the raw
amd_iommu_0 counts.

Tested-by: Hang Zhengyang <hang.zhengyang1010@gmail.com>

Two values look odd on this machine:

 - lpm_iommu_ptw_nested_read_ratio is 100% with no guest running:
   page_tbl_read_nst equals page_tbl_read_tot.

 - lpm_iommu_ptw_reads_per_tlb_miss is about 0.2: 142588 page table
   reads against 440805 pte and 192018 pde misses.

Ravi, are these expected on Zen 3?

(Tested with the help of an AI assistant; I checked the results.)
