Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.28.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794556605;
	b=f0GK44Glv8OQLghkfAC1nqUCEMELDAT/KjlEi0aDWII8oEWrxK8Lo8J7dqd/KgJoUBrX
	 NNEWkCIxnK7sM7LwtyS/rv5f3ZcB1FWt8hQoC1hQV8wFYlJODJKt1lcnrUM5ob6kPP6Ox
	 gJcBAvhPKMFZE7Pbp28lYJ4lu1mEvzvdUkzUJFQ1kowp0zqLwlxK33A/R1c0d/0UKT8lj
	 NPUVuq73VdF6eZCaBwTNI10LYbRvdofe3I+aBH7NgvoMhI5SpJ2Vf7163M5IybGtMLOfZ
	 8a+Cp5uXZXlSj9iDuJKGSSWCgZWQ2xxsuEUYz7NZPkLb1jILQOjMVguo5uA3HsBevWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794556605;
	h=DMARC-Filter:X-Alimail-AntiSpam:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=BeOQvh1rwGYlKbmD6yTPMhUR7igBrJzTCIt83SjJuB4=;
	b=Bo8Q0O8fdwuEOOFYom9D4uPr2rXoveXYnM8ak0aUvQ1cS45hSs4yVxUKc7GTLs+J4egj
	 FXv8wmAc2QWwbmov08gz5UtqaiFu3ZsAk0iWK/xUpBKvxpLmmFMMT4Dm+ROrDyUUKNx5y
	 lhpblHGLlSy5G945YBXKUHi8IACLBh1x6B2JcMUYqK/A/Q2zdGh5hj/AyoQsMZ8O0kTpR
	 HHic8yX1c47JR4OCNlz9a6dGcN9Z4jCfDiIyfpJRYvjiVoaHvuOYN50nroSBjr4iZZ9tY
	 Ykhl2lSKkfFTKQ+t4biADnPM8VBmyPRVnV/7kdJMJrL087BtTB0YJX0sNcrxc1CIwFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=open-hieco.net;
	spf=pass smtp.mailfrom=open-hieco.net;
	arc=none smtp.remote-ip=115.124.28.2
Received: from out28-2.mail.aliyun.com (out28-2.mail.aliyun.com [115.124.28.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA50606A31C;
	Fri, 13 Nov 2026 07:56:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3EA50606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=open-hieco.net
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.2447411|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.0129008-0.00472964-0.98237;FP=7587406834914928285|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033032065030;MF=wanglin@open-hieco.net;NM=1;PH=DS;RN=12;RT=12;SR=0;TI=SMTPD_---.k167Dxv_1794556597;
Received: from 172.18.24.170(mailfrom:wanglin@open-hieco.net fp:SMTPD_---.k167Dxv_1794556597 cluster:ay29)
          by smtp.aliyun-inc.com;
          Fri, 13 Nov 2026 15:56:38 +0800
Message-ID: <1824e0de-7011-4cb8-837f-0dc5a47e46e1@open-hieco.net>
Date: Fri, 13 Nov 2026 15:56:37 +0800
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
Subject: Re: [PATCH v9 4/7] RAS/AMD/ATL: Match AMD CPUs only
To: Borislav Petkov <bp@alien8.de>
Cc: Yazen Ghannam <yazen.ghannam@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>, Pu Wen <puwen@hygon.cn>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Tony Luck <tony.luck@intel.com>, x86@kernel.org, linux-edac@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261029053313.46323-1-wanglin@open-hieco.net>
 <20261029053313.46323-5-wanglin@open-hieco.net>
 <20261113050924.GDavabhDniAGJMUgtH@fat_crate.local>
Content-Language: en-US
From: Lin Wang <wanglin@open-hieco.net>
In-Reply-To: <20261113050924.GDavabhDniAGJMUgtH@fat_crate.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Boris,

On 11/13/2026 1:09 PM, Borislav Petkov wrote:
> On Thu, Oct 29, 2026 at 01:33:10PM +0800, Lin Wang wrote:
>> ATL matches Hygon through X86_FEATURE_SMCA and X86_FEATURE_ZEN, but
> Ok, I had asked about it but that ask wasn't met with a lot of enthusiasm.
> 
> Before we go any further here, I would need you guys to go and define
> a X86_FEATURE_HYGON and convert all the matching that Hygon does with
> X86_FEATURE_ZEN to this new feature flag and get off the _ZEN flag.
> 
> Because the _ZEN flag is an AMD one and you have no place piggybacking on it
> because when we go and change it, we will break you.
> 
> And you don't want that.

I agree that Hygon should use its own feature flag. I'd like to
handle that conversion in a separate series with the Hygon CPU
maintainers.

This series provides independent Hygon node/SMN paths and makes AMD
NB/SMN initialization AMD-only, without depending on the new flag.
The flag conversion also affects CPU and ACPI behavior outside the
node layer. It requires reviewing the existing users across
subsystems, updating the affected paths, and testing the changes on
Hygon hardware.

Would it be acceptable to merge the node/SMN separation first while
we work on the feature-flag conversion?

Thanks,

Lin
