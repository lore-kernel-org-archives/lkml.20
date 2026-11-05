Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.204.34.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793862561;
	b=GfaO7j5YyPfRG6GWG2GzompWqyuWGxgr7YgDy50cVvnz2HAjdEgJkTuS/hElvwGjfiti
	 SFBzer8yb9VGdvJh5EqEETVkyrFi8QWiNVJ6nX64B1SFdoZ4WyhzhPFJf1wAhWZtAHXGU
	 i0KUaw7mmJE927kTc0ecxESKDe/+yYcaeXgjJtLqh6f2XEmEEYx5CHkFZI2CmvwNfjqn3
	 1eSwUgsj6JsXmhj4cb35rkHgK2+wlG57mWo9kAkeV/BAv70gR2tsSEj6cM4yoQXYTkqYd
	 QovCsLeb54EIMqO5cdm6XZlAUxla0CeYfRGu3WrA6RTIPXJ/XaHGWIlTnKMhiqzDfXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793862561;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:From:To:Cc:References:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:
	 X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=2wjAopW76cs/UHZAfdI5EmAbrGuClnCkHqmY5dgSxS8=;
	b=b9BmbdmZWIrTWmvHX+iVWT6eZ2DyTss9XEUi2k1KzfWcqgUnHLYav16Cx951CMwCFkQn
	 zmoyd/jy3aeIDIaeTJzV2onkZUlC3EuyNQn6jmVJpBGzbOur35B7pk4Si/mOmdN9Ig0XW
	 0c2kvAVsAfB7pBb1N5Z44R929Z1S12bnaiOGqduQWMIex30k6KmZZ3KcOoPYISrD6qihk
	 AO67jaMef1d75aXNk7dvkY7g0FNoaMFQAnyIrgmNfGIxq4/60J7xqtGlqpWgwZStqZbK2
	 9YwLGj4fo97w4tlzbqHWfsOzZV1/E+hEbNQURMrxdsd8N39Q+p10BpAnyeSp7vCYH4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=PkWq4gPc;
	arc=none smtp.remote-ip=54.204.34.130
Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51507606A326;
	Thu,  5 Nov 2026 07:09:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51507606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=PkWq4gPc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1793862541;
	bh=2wjAopW76cs/UHZAfdI5EmAbrGuClnCkHqmY5dgSxS8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To;
	b=PkWq4gPc59yZop55HhdqlRL9L3ch0ASjEYJDaMIeSjIumv6edHZAg61lueOCPMzq8
	 jptzDJxcVGVtmx79DOcaqDX/EXc3OumLc0pCME2gH9pbbV0qIXRcidKZvIB2ln46rF
	 c7ECHd5w2vMOj3KG2BauOmGhOgir96j40zyIV1WI=
X-QQ-mid: esmtpsz19t1793862540ta706a2a3
X-QQ-Originating-IP: Q9P8Ls0lg0KstabeEoyvHdwuqg23mI8mBT4P3m+pgGY=
Received: from [127.0.0.1] ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 05 Nov 2026 15:08:56 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 17593752035460933751
Message-ID: <17FBF8B3DEC33669+55643c4c-b5ae-4ac3-bb2c-a1653c3a6972@linux.spacemit.com>
Date: Thu, 5 Nov 2026 15:08:56 +0800
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
From: Zane Leung <liangzhen@linux.spacemit.com>
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
 <41B3F89514935AAF+5c08fd7d-1cfb-428c-9ef8-035fa3910bd6@linux.spacemit.com>
In-Reply-To: <41B3F89514935AAF+5c08fd7d-1cfb-428c-9ef8-035fa3910bd6@linux.spacemit.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: OGRTx1KypL8CpA+DIuVdAEROtTRV0TJB12eYaryXMkw9FwxWHC0Kq0RF
	ulc3XYtpeVjR0XJQR+eEd/vuMxaqlFZivmOdHMMkrZUroFo/NbmCvka2c9kvW23f4qKD2l5
	Qu3BvHlzYWk4D+drLb50qN3ZKi1XKa4b1oZV5zh2jLTzoJo403DLZhWYRxr+/oIzw27f57i
	TfhmpQA2xFQ3k1Lrju6gpUp8i03aMI10ERqxZQ0JznqeTivpZMLzy7v2ASHUaejpj4dH306
	GlGlwhRM2W4GjTcKEzERMR+EN7j8Kjqg/vjmLRYHJn1bKVEoo4OIA79xs/TrD851mHBGirC
	J48PPJsCN6EZZYziAc8hACK+Nyuf5WGzlQ8HHdhOL/b3id38kfWhGjv9bJd3aTDnEi7kEho
	a08yDtuGJtXw8z9lbNXbLd2JnzMK11lI8FbVYbC0+lA0mhNsCj4JAHsjrdtVS0QdiyhnPLK
	6NoEKD/hvU8zeZkCqZg7Kt+3d/fItisvah7laQAxZGne/ZHUYgKm36kEd10ZyZ3mKNg7MwJ
	W61yR+7a+q/g0BW1MhhgWVFu7nIYrl0VA93NbbUrunk/iazs3mLNw4u2wOqz1sj5pNmKiA3
	QRXeuKUff3UF23r2j8cJtHiLvdozkmSxyvkXJa6DpTn/xnSflbSzwFGqoJLQcXZO0uVUesb
	G4iFW3hYb6zm8xRCFtflGt4bzcFcGNfvNeWztLf67J/1Z2SYTPVBuPYbdrBor5HOYTGJknI
	mzKivhSOFPFmGAxeWWRQ20Ex0fJ4XNzXYCRipZnh7ohOSoOzytzfsKh2ttUlelx58iD+X/4
	Pyp8th4PSTRW+V+y45qsC1q6baiO1iPjkKzhiru+hvVECRPUImXuRZS2UaFW6h0h1g+muPD
	jvqrSq3N3GTsLYA0TNd8tlLYaiXq1f/y7lAjgZHN2bnzk9PRXswRQKAUzTyrkd9+OZddo3j
	H/ugxcQD/51+wTmqifLzFUocV8yPuldKfU1pcuwsN7gf4uCYvGGiux3m0gYNEc+f8xKpipP
	pB/0JiZdVRMrlwmc0neLe2NjU4zcuzvK3b7qYryZEKfAvLr1Gc
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0


On 11/5/2026 3:00 PM, Zane Leung wrote:
> On 10/1/2026 1:22 PM, Mayuresh Chitale wrote:
>> +/* Helper to access start, limit, wp pair registers */
>> +static u64 rvtrace_ramsink_read_pair(struct gtrace_platform_data *pdata, u32 low_off)
>> +{
>> +	u32 low, high;
>> +
>> +	low = gtrace_read32(pdata, low_off);
>> +	high = gtrace_read32(pdata, low_off + 4);
>> +
>> +	return (u64)high << 32 | low;
>> +}
>> +
>> +static void rvtrace_ramsink_write_pair(struct gtrace_platform_data *pdata, u64 val, u32 low_off)
>> +{
>> +	gtrace_write32(pdata, lower_32_bits(val), low_off);
>> +	gtrace_write32(pdata, upper_32_bits(val), low_off + 4);
>> +}
>> +
>
> Could you move these helpers into "include/linux/gtrace.h" and implement them as generic APIs
> (e.g., gtrace_read_pair, gtrace_relaxed_read_pair, gtrace_write_pair, and gtrace_relaxed_write_pair)?
> This would allow them to be easily reused by future components like Coresight.
By the way, please pass both |low_off| and |hi_off| as parameters to handle non-contiguous register offsets.

