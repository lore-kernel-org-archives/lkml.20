Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.207.19.206
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793862048;
	b=4pzyhG/s/jAXJb5qDBD/HIFBSZIVnsKUVXIyw9b8wuLM7ikxeOtB3wOUL5VooPS1xCdb
	 lpkXxF5QJycR+TLLKkp7Xg9xgk4K6/hwL9tdrrjI7nakDYoha0JTZGVPdK+LtXCH1UMmt
	 47FUXYslAZRBZAKHGg56mbTFqRD5shUtU8tYb5aNK4vDlYR9z2WImF9/xWFcBuLGuQsA7
	 gIgXYDraBLuD5yetzKHfN+zteUbMcmi0NaZoM0Bs0GMXiZwYiZQvCninlJp0O3NLqH8A6
	 +BGyUxnKF2lYnNfiVlMFGaVfmTVyzDYTXQ9Ik9Df5ZQqzHqIXwu6C04QYwb40DoEXsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793862048;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:
	 X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=MXIuh878KbS0qTfh1/i+lplkSClQwh04M6y9YYPiFcg=;
	b=TMPpA+s5oFXhGCi+42SdivYrv+dg6fdZaPHRCfBCZj5l9BFEuHuQv2gDhTMB1/w6lsHf
	 fj8e+ASyHdNFL1q6pEiODe05/5TAkWAxRRtU0YdDXcnKdbw+0WnLaiV4xCV3I+Cu4xxHT
	 rPYfHLLUmm4OB9Wkoc1KCm/84cuLFelZqJm6M5j+UUIcypnadmo7Ywu5D6/oFcWpIWQEB
	 hBC4nmcu4806VyS+YSDxUdMUbDdKaNPzPKmKeuMWelWR176kqi0lhBtvXQDFCdX7aYupM
	 hM/DtHdMCgKfjPqksi7aLIye++svLqutywZp7xNIGa34mrCUkUv6x72POiaqAjXVZpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b="a772/hZy";
	arc=none smtp.remote-ip=54.207.19.206
Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A18F0606A326;
	Thu,  5 Nov 2026 07:00:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A18F0606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=a772/hZy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1793862019;
	bh=MXIuh878KbS0qTfh1/i+lplkSClQwh04M6y9YYPiFcg=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=a772/hZyqLmLqKXm/Qu3OK7mgnnR/OKG+hM7qfEnAu+Jb4zyM4lmTzEBJmFcCkIfi
	 pqdnco1rIKWRX8fRRBxgxydrXqmKc3l8vkfU8TBfyOyVpAf1vd/XhMCIxYhv+RYJcV
	 MrRgjtCHOexoHg2/Jgrz9HbyNZ8jhK5LuIYGx19M=
X-QQ-mid: zesmtpsz6t1793862018t2516ac74
X-QQ-Originating-IP: MTeUKjwypxYcnyqmTJBobIe+FEl3TfB5eQ4OtFO434A=
Received: from [127.0.0.1] ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 05 Nov 2026 15:00:15 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3473592725829115131
Message-ID: <41B3F89514935AAF+5c08fd7d-1cfb-428c-9ef8-035fa3910bd6@linux.spacemit.com>
Date: Thu, 5 Nov 2026 15:00:15 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 09/14] gtrace: Add RISC-V Trace ramsink driver
To: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <pjw@kernel.org>, Greg KH <gregkh@linuxfoundation.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Ian Rogers <irogers@google.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Mayuresh Chitale <mchitale@gmail.com>, Anup Patel <anup@brainfault.org>,
 Atish Patra <atish.patra@linux.dev>,
 Andrew Jones <andrew.jones@oss.qualcomm.com>,
 Sunil V L <sunilvl@oss.qualcomm.com>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Anup Patel <anup.patel@oss.qualcomm.com>
References: <20261001052243.3042627-1-mayuresh.chitale@oss.qualcomm.com>
 <20261001052243.3042627-10-mayuresh.chitale@oss.qualcomm.com>
From: Zane Leung <liangzhen@linux.spacemit.com>
In-Reply-To: <20261001052243.3042627-10-mayuresh.chitale@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: OBUGnm9pFasA0Y95VdBqDLkfHFQ+Hd+x2d4AB0Ev0Dp/a54JZmZ8PMr/
	BHThQC2vFvNTKHF/Krs1Rnatbn3C4KHHMAc5EPY/NknNj8qMron5fuusRp/RL48r1aNzAWk
	BHTqDINPRqFLCg1S1MrTzN4JaPA+SSQy6hobimWF7OOsrmHuly70R66qAHHX6Bajy7moiZC
	RZF7H0HyP4NlcoGnxxquUCExuTph8F+0Dqxza2SWdtJgzQSrR1Y3urGlo5eavwyEpVspyX0
	q0Vhc0+bzoekC5Dj526ssXfnthCuAdgxvLOWzn1aqoyfr0mzk5D6tqu3wGEnNCUjIYc8D9R
	2/Ld2ia2zmjH1kFO4JDubXGZ+XoGGU19GorSkRIZffXE/5waa0KA3vaumWp6whpGXvNP+CF
	mFFzODmpgTqRXaopI9xF0mc8OPn96Uch9GTSEptfyM9oYjaAf15kJETJTUIgRsqUsJnfwKA
	IauJp9dNpxXKmclOhR50BJR3R4qOd2kRUIhBTBL5mG/9ZOX6uu0HTPXap5FG24HBuzrxAjd
	Do8dUobdWh8RIhd4O8Dz38kNQYt8gN2GgPHnO5SOyLtYRvxoLsiJCV3QNdE2D2lsG/FSMtl
	yTK8blQMKWHEKdvJIf1MeTm9znUJloqJAsLNIBwYAgVMsx/gPtNrEBALAcvp5hW0DNb+zEC
	fVsASd16UPNzct//0Hou9ipBucVyXdoGjN+k/mSaf8mQoLar2frX3nE4seQAP281V+yNlXo
	FlWMAbaEKZjLBhqFeWz7Mjb2/5eL6jEr1g6qLQQfu2iYiL5Ez+dwrLV09qyZDpTZL0E5Tmb
	GDqSD4Mkyzr4jrUbl6MZz9R2FC0+TB5vHszC7qVzq3Vv0OrJG6jgwqrTBZ+1L9iAZnsw3qy
	jfcZFNy8o6nPEdUzOdR7FBVyadkVrZPJyIVsQk7fRxS+HDOKtJIjdCZNyeCaZnFVlAS4Vom
	2n/PPmHj+bn4m9pvAqMo6Fp6KUvPZGDatRXikjAbg/GPK2H39EmaT34U+AuQBpc58OAgObp
	qIwun8jSwQ/vP/zNfJF4YzUY3SiuzU0/Wdfq/tsw==
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0


On 10/1/2026 1:22 PM, Mayuresh Chitale wrote:
> +/* Helper to access start, limit, wp pair registers */
> +static u64 rvtrace_ramsink_read_pair(struct gtrace_platform_data *pdata, u32 low_off)
> +{
> +	u32 low, high;
> +
> +	low = gtrace_read32(pdata, low_off);
> +	high = gtrace_read32(pdata, low_off + 4);
> +
> +	return (u64)high << 32 | low;
> +}
> +
> +static void rvtrace_ramsink_write_pair(struct gtrace_platform_data *pdata, u64 val, u32 low_off)
> +{
> +	gtrace_write32(pdata, lower_32_bits(val), low_off);
> +	gtrace_write32(pdata, upper_32_bits(val), low_off + 4);
> +}
> +


Could you move these helpers into "include/linux/gtrace.h" and implement them as generic APIs
(e.g., gtrace_read_pair, gtrace_relaxed_read_pair, gtrace_write_pair, and gtrace_relaxed_write_pair)?
This would allow them to be easily reused by future components like Coresight.



