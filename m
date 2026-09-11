Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37DE14BEE46
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 22:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789164641; cv=none; b=GqsUbzwZPV3sGgQ0cxinG4m18KWR7UGq12IV2cXdTPFQk6TWgUH42lIuYE6EZNkSUFDTGqW9IiSLl6CapCrxzew4UI2MhL/cG2th3c+c2Q1Pi4DN9K5TeHIjAkYjcHPiGY4hjepweYvcM6dN1Kfu+c+3/d5g908j4RmVgJUjmbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789164641; c=relaxed/simple;
	bh=UGysDTrnyTAo5ChTgSWtkbAJJAteuC+sMgl/HdEfmPk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YUAh0B/G9FML7qM2HIbj/IVGXJSJ+MdHwBr6YMDpkMB5n5NFt0Srnj6WAIhJwBvm98p6A9hdv9vHsSAWXBjLpwESPXUSJhaZMAJJ5A+doRwZUHFSeU7QFM1II9atbpMTb4QHZYAFXmd3sAPNpd3ogLq+SFQup0F9WwDERrweFk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MvZMHCGl; arc=none smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MvZMHCGl"
Received: by mail-vs2-f12.google.com with SMTP id ada2fe7eead31-790ec94be85so30946137.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789164639; x=1789769439; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UGysDTrnyTAo5ChTgSWtkbAJJAteuC+sMgl/HdEfmPk=;
        b=MvZMHCGl3H0RUeJ90UXoiYlByoDCYDgiHIxN0UESRh6dvWIDuSIAo9lAWOpccijCik
         xEGTHJOaHHzThjvdxS8aC2SnHp0boNW6KgXpqSZlD3HKe719DDuaJdn7oYttqmMqmr+4
         oTP9AWImLtwXU5wT8gxtH9PtMMiT2hDSQk1OdsN+mTlU9bSOMWMN6ZWoh4OgICSirjZ1
         VofUif5PnTJfXRtws+qNcclh4rTI1W59CpkST2XjoVKrcqAkPeeHBly7Xjdcmt+VQzjd
         7RpHBg1fbkrk8uCYsHbbb1XE3UAjTDYFUXupzcQJSkO2Xygomu8NdK0bgNPoIRogFsv3
         Ux4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789164639; x=1789769439;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UGysDTrnyTAo5ChTgSWtkbAJJAteuC+sMgl/HdEfmPk=;
        b=b9MYcRgTsUM2f64B6n2vjrdZMOOQ4neJs9UIcoFIuYS5bsQDKHIxF4hYVN8sNwzMkz
         rYiLzw3Gy4H6oxJWbFrJrkVyh6BlxwkYGsf2iGj3vrkRXkJuUvyEuzcSfSK97a1BhdKt
         4jX/gbBqsBZObX8dc2SM2rMeVp8Y+d6mHuO560Rmu/70WpruJSIge18kSDXTHBSRvc+c
         Q+rW8i7KmFM2pijvYyLsWO7D4kMAYyLcgTW3mrOJaBow/BI3WPlAqip4dgl5fLSPeSJN
         1iFc7Z/oAE7opp0bZmnQSDdchV3ckjL53j6VhAvnkOhdqQJ6q8zE32IIZDVqQaeGqoJa
         xPog==
X-Forwarded-Encrypted: i=1; AKwUvBygVNPSrWD3eJ74fuY6T9HCnoRmNyN9sqQliacV5RVBMeCGf5VbPCrqtcwt8Z5viCt7eHX5lK45nhMJIos=@vger.kernel.org
X-Gm-Message-State: AFuF++nhAL0vwWSlArilK/fM6kacJq9TNXpRzb6a+hvvktDFCdD0gyX2
	ztiojni50sGmz0ZHBawAN1k47sPiPTUQ1T++uRwivCspStOhSRDdkjQe
X-Gm-Gg: AYBFou2h4eL6TaMlnQIrj6ITrLh29JSdFt6FAYL5ZwZzH6v83iwEcQ3em5Jq/iXhoz6
	0Exk5EePCLKM5qcSS/dFmd9N8FJ11NyJ2eAemOoh2H8WuscpGNJZJC5Xtea5pCJWORm85ClMLTB
	uPfB5DkgTpZW6U6KHUABuoLCj+niY3Lm4ptE600IsPa9ZAsVLyj5ARseyba1HSn1TC8Qe/N/C5N
	GMtSnjloqFKQkNPfx1PP4lXqhm04IhfllqcAcVk0KTM7bzVvXtQLbdeYO1EZZNUhgPr+zMoJmZi
	gsvrfU67mbCA0MhEQBHWGkmE6F/l2OGKtTmdQkF2oMMx5E13BJPxDp1gj+/XCdVY/QGt1IQjoeS
	noOBnWunbB+8bm/Djvb7cAkD/BRCA1wPaTy+wJBTImJXoOCEZGjDnUu9gN/XOg9I+N94b7Bdc/E
	EVQNLYn94m9vmOCS3pRBwVE+RhdodCIKDtGs3ceQi9ct4PuHolbZMT8Wjq8Qx6Q3KBoejIoJkqK
	kjiHJcqzAWUB3K7ITj2U0Q8vA7B
X-Received: by 2002:a67:e703:0:b0:785:3211:f5e4 with SMTP id ada2fe7eead31-795a707296cmr539109137.4.1789164634294;
        Fri, 11 Sep 2026 15:10:34 -0700 (PDT)
Received: from localhost ([200.151.1.221])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7927cbdf149sm3926638137.4.2026.09.11.15.10.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 15:10:33 -0700 (PDT)
From: Davi Chaves Azevedo <davichazbh@gmail.com>
To: yu.c.chen@intel.com
Cc: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Tim Chen <tim.c.chen@linux.intel.com>,
	chen.yu@linux.dev,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sched/cache: Refresh LLC capacity across CPU hotplug
Date: Fri, 11 Sep 2026 19:10:14 -0300
Message-ID: <20260911221014.1384294-1-davichazbh@gmail.com>
In-Reply-To: <a3433e6a-0d1f-44a8-99bd-bc63d1a15913@intel.com>
References: <20260911134825.420748-1-davichazbh@gmail.com> <a3433e6a-0d1f-44a8-99bd-bc63d1a15913@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Chenyu,

Agreed. I've restored the original boot-time shared_cpu_map explanation
and kept the CPU-offline and cpuset-partition rationale alongside it.

Thanks for the review and for testing the fix on both the Ryzen 8945HX
and Xeon systems. I've included your Reviewed-by tag and noted those
results in v2. There are no functional changes from v1.

Thanks,
Davi
