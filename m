Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794280967;
	b=X0gmpw4PCUENHTw5IcN8vv76OBrFT9kdgRDdCaiTzTj1M9ufzGdJs9VIHCVGXDqUcVPM
	 6+bVtsNh71T5aJNjZb5FMSmH/EyoCpTqFzhhyDflOGXK/QaFg2PTAkFo/0piIhZwl0UEk
	 U49Mv62GfJ/4ACWD9pYdrgRLbZmODCtm0OwMmn57LvV8+2nNEflC1n5pUNZ57rXgenvN5
	 AwBL0fyx9ho921I1hQzzpCPQUNKJS8HWQiMWSQHi/X9hgGHaHJVhudagK4NN0+5J+KtNG
	 fE52GIn8JjAavKHlX2NVo4urHoRnVNNE96lrBg8EbtV8JtkEcnOkRl3eYWHtNS1GiIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794280967;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=stnzaxH8NkDuiOo85TJCNs0yAvKFW6/an24wa5kJvj8=;
	b=fsrbzgaycdnBV0D1yBobuauX+bXcmVbApOZ2WSIA6qqOdxuhnjEzg4DCsP08Z8j8GxSL
	 XNzA50a6o/MRY5iyiuslWqdK51Fso4iNXm7hjs+Hpy54dP4BdoQRKyOBGIHS/3yMIDjg1
	 L2vWxsfxVFi3NMqufFRvXODk8LUxVHQVPQjCylLJLKCmiNUaNIArzjd66HBNOW7HR0odg
	 ZbyEheOvHzVB5CH8VL7S55NxwHAUL8YDD9rrDpBQ8iE0bPtFeCIRz4iboUkNxDyK1zPnH
	 0qgYvgAu0kGEO4Ov3mC4s1he1cZVWTc/irPN6LqLM2GlKjCI0kTRIOtXN1U6654+PpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=clGMaWxd;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCBB160A2606
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 03:22:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCBB160A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=clGMaWxd
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1a2761c69fbso2078883c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 19:22:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794280966; x=1794885766; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=stnzaxH8NkDuiOo85TJCNs0yAvKFW6/an24wa5kJvj8=;
        b=clGMaWxd1xDbbN+gMw/ioN1VLgmuJekJgKgfL3QzKFjCdJrb1uXulezmJxeyhJhrbf
         lT5v5cI1hFkX1HUKQE/YI9jDCe3FZJriOm8BGTNbYrwiGx8zgZJyw9IYXPJptgmq5Oah
         f1u51+46gzKXGBUCD8UKQa8DFoxsopJAM7/lBf/19N6yeQ1x25oUV0KZkil4gcZmZaCd
         lEefzmOiaq2+07BtO9V3Q/kgQbfpLmAtJcYKHo8cunpCabtV99uzPtcrwI8ihDJH8tT0
         fJ8uO9XzlXrxY67CFk+Vn7jMi6zd5680f9DualvtChmxyvaxbxaNs8k4Bs8n+Y4Le6aB
         6W1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794280966; x=1794885766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=stnzaxH8NkDuiOo85TJCNs0yAvKFW6/an24wa5kJvj8=;
        b=uXXsoM6HsnSdT7iBE+WV2euBAtqDWBtsIVDQhEsLrTQzvA1+bIWAY8sE1/oy4wrKPV
         hSiWa5znUBsjn7xXulks/fzRbni9pOjr+N4ttnm9nZnGoBMDlT1GxHehVp2uHUtSMGtR
         iCP2kZ83B6v3egww1UI20q8+3gJHcgqCAbBinJKyAmr0vjw/bFbQH9+3FhNGKHzjuCui
         fKzOopXHxpdF4//gdyuJa6Cxgh0yVq/uG8FdAz7n8OJl5Et+3iZyfG9+YfhdWEFW2QeX
         6xYgT2ANXKWnwg7c+Y4kkr4k4IcYwdwyIEnsLQ2kZ2vPx+mo9CYIOKoZbstbqGjWwZjZ
         EQgw==
X-Forwarded-Encrypted: i=1; AL+hErGrFkmKUT7NzCYr2zJcSaYQGXF3Za2y8oIPPI4dfX805tOcTTfuYuZY5YtVbaU6PzcNvat/ghhANgR31yM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8pCxBQP3bEy83nejaFEcDeFjDgQiRGWqdcu5Iw+FeYDXOxnwc3
	Gl0lYogVRhXsFpcJ5DrcNLW48kLAkKHtmyrm7wQ+qkbbF/gorYBGHk/V
X-Gm-Gg: AYBFou0Zeg52cYcFxMV7o58leRZVt3/mW5ZHPyOmE3hgLfzwbNOLbU6MES8ijJ+4ObD
	bxI3HHtcjF2qNuC+XyiI12nzbkn+6bAFKf3K5t6sP910lGER+EeEyFXZYZ47NwjlhhPPxThFKHu
	X5ojxx+wB5AWpdPJtsidz9RH/veQy78iEIcqL8/JmQisTImmGxETRp/e/2sedLaz8GG6XsCPrfy
	R2UGYxQuwThNc0j/k8JX3qBi92D7Afg62iZYCNYmY1Zy3DCXcFjgVgxz3IIfoiKXJgtBbLqR0m3
	HUC4JIFD1BrVC5OF3zkt4JoHpGHI+jzIl7RJe1Biu5NdfJt6UpXUKQXDRMN8cOFJe26+lOGsXjZ
	YxVZT2TvQjVQpBC5HyOvg4wQHwCBwf9Q5za0SYN9TP7JAPepB1QyFHVXEfpBcPnIVYHwwGahvvX
	xkxK2QRG7AqtqkIRyUmzn4MoP2Qw1gAtlGUquOYtQ57HCAVD1dYYyX8cmA4KxvPadWCpf2AMIin
	hq+fyNmTd8czi7uRDC3ngAGKdkrCmsK3D9xGMrrwE+CwIK/+4/b916Ej51t59Ii9s+bb+zDAaKA
	KVeKPYvd1gB4lrJxTkiNe2nCgaG/UUEeRpnER0gwImt6mUza5sAW2ePDQfVib3q6URonkRJxnsa
	QCF3AB3wc
X-Received: by 2002:a05:7022:290:b0:195:c6c2:c6b with SMTP id a92af1059eb24-1b3b6183256mr1937438c88.35.1794280965622;
        Mon, 09 Nov 2026 19:22:45 -0800 (PST)
Received: from thinkpad.tail59a646.ts.net ([112.199.224.229])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5890e04sm3284470c88.2.2026.11.09.19.22.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 19:22:45 -0800 (PST)
From: Hang Zhengyang <hang.zhengyang1010@gmail.com>
To: Chun-Tse Shao <ctshao@google.com>
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
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7] perf stat: Include PMU name and split uncore events per PMU in metric-only JSON output
Date: Tue, 10 Nov 2026 11:22:38 +0800
Message-ID: <20261110032240.3080302-1-hang.zhengyang1010@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261030192537.3079368-1-ctshao@google.com>
References: <20261030192537.3079368-1-ctshao@google.com>
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

On Fri, 30 Oct 2026 12:25:37 -0700, Chun-Tse Shao wrote:
> When running `perf stat` with `-A` (--no-aggr) and `--metric-only` in
> JSON output mode (`-j`), [...]

Tested on AMD Zen 3 on top of perf-tools-next 13a8d580433a.  With
'-M l3_cache,data_fabric,iotlb -a -A --metric-only -j' the metrics are
now on separate lines labeled amd_l3, amd_df and amd_iommu_0.  STD, CSV
and aggregated JSON output are unchanged, and the stat linters pass.

Tested-by: Hang Zhengyang <hang.zhengyang1010@gmail.com>

Two changes the changelog doesn't mention:

 - Without -M, 'perf stat -a -A --metric-only -j' now prints two lines
   per CPU; the first is labeled "pmu" : "software".

 - Plain 'perf stat -a -A -j' gets the "pmu" key too.

Are those intended?

(Tested with the help of an AI assistant; I checked the results.)
