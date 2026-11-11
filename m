Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794423232;
	b=q9zElmfzv/uJpU++wlBNQLHS0l6Jm3iVFgHd4qNDfbV3bVFbl9ZTOrdtMGwkL3yzwBtI
	 viDbhDbGgpbkL32Qg8QPhzBPoKi5KCEuqDgPW0TpmDI3JFi+RRLAWTuaTefrnrSHdXmeu
	 hFisNYR0+RFPRTbltAM0P1yjXn8sj5cVr0SouS7ODTc1jyTyHSq1srQzIy3f5ACUuK17/
	 AaRMpRdQVtKZ9Pe9N0dM0jqhp4YcHH5+afPxk9KHaEOVgSMmEAY96x++UeF5tkyR4Ctvq
	 asjw/YIF6yyrJruA0aqpGaHw/39mvv+Y50FBRWH4Q++yDkvx7F6uUQc5y+jIl+ELa0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794423232;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/4cIr29+Hs9PI3pucOGutK0nS3SkmtCaGaKmmkeWSq0=;
	b=fqnsReal35FSI0gU6s0sX8wj0PgjlsTSNW/3oICWUrfZel0U91Os4hrWdwxdLD1ZDl/M
	 +lI8qY3qPz9lak6/9NtT0L1EqQ4BbfNVgEU29ORJdKrbBINzoeRLtQpVuCqQ3SnoSX0It
	 3eFJr/jTrpJWMDmk184XvlRI9jFukFS6S64tKgFuM5amJufZX8Y5C84yc+XjCmXGMv3hf
	 nrLRtiBmCnMiK1bMkye/Jhj8tgwFp0aj5bOlr+mJhBbFcykjdz2PNsItWfGUpiGw39QIa
	 PTHGP3TYEVZx5NaJ856oOE1ZnQEQ8dQXWybbZ32lSajOXrTANYQJA9upRzyo0PAMQhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B2oiFpvV;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F647606A326
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 18:53:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F647606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B2oiFpvV
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3b197cd42b0so100432a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 10:53:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794423232; x=1795028032; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/4cIr29+Hs9PI3pucOGutK0nS3SkmtCaGaKmmkeWSq0=;
        b=B2oiFpvVAHCSvVkAoCwh7p1b4GljYuVmSE9qalBNHF7fqaqMLdw7J+eMm8RyEaTKr9
         4ZRywasMpgkfbdFSVbWeYIzuD/fxfIA2zPA0BW8RVFyj+qV5Ay/hwL5hamI9yLO22oVF
         jr8UcubCg4zAYwX97+geS0L29ZL+YGdEcqSMp9zN9GGbs/xaRkLsplzvuOwLVZo1GdJs
         BDTXon7HSQOOHOmLfnumZXvS++ShdeyHEURCh9n+B5UirORqy7dlsilS0Omti/N/YDPW
         UKYZY7AICnwfd6e4BLAZ/8oiZ7ALgSZTIAXqTuKpABqHTYEc+0WEHd41/VLawS+y/Dvk
         tBrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794423232; x=1795028032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/4cIr29+Hs9PI3pucOGutK0nS3SkmtCaGaKmmkeWSq0=;
        b=MY627NtAYqA+uXZYOwYTYnpcF3ebVuuXTPkEvMyjmaplsVMuhaEE6+VkI9zhABsLiK
         +NylYZh0PqtzekM0CZjn4DFWcJoP5WwAkgBngwXJMZj5bJ13cCaRbvkZggjwCIMNrWvq
         CBLnRMoD0Oo7KpftUz0AR3dSx0FvggU0Eh167tx7gsuxEYUNK/qZnsewIIDZO4+ecCn+
         IEGJJjlsMTwcukyqSCREKfmvsT2ChKqKFyuTD5iS4neY0dwLsF+JKlzCsnK1SjiRNIQG
         dK/ZFoWmhdDcTMh4jnoFoEGGzX1Jc80Gj+pg32jCSO1t7KrqnMuWogy4jBDLS5jnQeWu
         1J7Q==
X-Forwarded-Encrypted: i=1; AL+hErEU9rKuDCchnfnHs6fw9DEzLQpHgdLffWm8okXmJSHYflYSvlqomhDVLmh8sECh6b8ShwDiQF7DlKRSiAA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8xloNWlXa/SgFMGwUyxYRXDE3UU6xcKy/kvdWKMIT8fFcfqQss
	IZ9v7Rs2Qlmx4Xqljky3xfMX09UjnS5PbapJk+PyJCZQlBmfd9TnnKyD
X-Gm-Gg: AYBFou1O9+qzC+/6gSq6E+eQfO6pDfEY6y5gtOjaSaZndHe+OVtPLcFFZrzZwcbM785
	KTbObP5C8k0CGKe6CTZ85kEfxI5vVXsoWgSqOwqtaI9UBOyh/yUb+qvxPJRLP2//rhxav0Uu5wZ
	T2GPlpItkhSbHA2Dd8V4XoDmPVQZSBVcCZh+TmdG5wcJJJmHnK0EKICk0vpRfob62+I3Kdnmj86
	AOa53rMg58c+nQ0ErDq4wgF+VDDuf7T8Y7QOE9/ac+rBAgHqtOEEJN5cn5qwGKG71+mhI4iYHuJ
	rhigVL+D0Zw2pDRfVCtSMz1+NS8qGl4LJCZLclprUZpQrC65LAm+QBIMPrLqAOpkLBNulMgW/mE
	3TnOSHyjlccSSwIEJs0dolreogyFwlAVOa7O1xLkzPvm/Ciu36xCyAPHHbvhBWDuU0IzgwsOzBU
	tltOlGaqLKvYYqJLkWGv/gveXEFmSsRPk88NmwhkbVOmE6wcT5D7sg1WHi78Eb0c4l4kRz1jrsQ
	5AkA55JuwT3E0TDT9cr6WjmgGgjuRDLV1KZ/1HnO7WTkXZYNdXN6WUfZ46cbqS9n2fLXHToQMaK
	AT/9Q7aarPtOBQmkBBM5wUxo2VebA7OOp+VaJMjfXp1r63CGs0iluQp5YEBfv4VQZwLB68d/ktM
	tTrl5wECSxQD1Por4R90CgIZ9Ct2QxQ==
X-Received: by 2002:a17:90b:5787:b0:3ab:c370:3684 with SMTP id 98e67ed59e1d1-3b182ee13ccmr2619693a91.30.1794423231792;
        Wed, 11 Nov 2026 10:53:51 -0800 (PST)
Received: from thinkpad.tail59a646.ts.net ([112.199.224.229])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197ce55c1sm480194a91.3.2026.11.11.10.53.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 10:53:51 -0800 (PST)
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
Subject: Re: [PATCH v8] perf stat: Include PMU name and split uncore events per PMU in metric-only JSON output
Date: Thu, 12 Nov 2026 02:53:43 +0800
Message-ID: <20261111185345.3538734-1-hang.zhengyang1010@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261111183209.1892421-1-ctshao@google.com>
References: <20261111183209.1892421-1-ctshao@google.com>
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

On Wed, 11 Nov 2026 10:32:09 -0800, Chun-Tse Shao wrote:
>   - Gate "pmu" output in print_aggr_id_json() on metric-only mode and
>     skip software PMUs via perf_pmu__is_software(), [...]

Thanks, tested again on AMD Zen 3; both issues I mentioned are fixed.

Tested-by: Hang Zhengyang <hang.zhengyang1010@gmail.com>
