Received: from mxct.zte.com.cn (mxct.zte.com.cn [183.62.165.209])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D5A175A9D;
	Sat,  5 Sep 2026 00:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=183.62.165.209
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788568413; cv=none; b=ncN+8QDQj2Iv/4AtyusTrr4DjqMyrPn5bB25QirGx7393mucRKT9wH4rgbewg+8/KtO5rWuJGwCMBIHl+F/otn+Nu3l6TOse0od2T/v3OmfY05KDjNoONGMSquJRQVXyFjj6z+ByWxWRwTAB+S9hxcqnbm80O9ZvMLzITQcNeTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788568413; c=relaxed/simple;
	bh=NmyXnDbB2wZrHH6qXdu4y1K9w0bmVY+v6QbdEpm/Ygk=;
	h=Message-ID:In-Reply-To:References:Date:Mime-Version:From:To:Cc:
	 Subject:Content-Type; b=szI0RP347GNK58jFqR7TMPigse5ij0BFwDAUzLlfQHLAVtEKfyLchsN5ZYB7HPdd4FCUiaePN/SGZEBzMmnF1cxYDVwl/Uib1xgYjMH5ZrtCIxkFBDA1euzhJeRVjx9Xg8wTQX+/OdpYcaYQmjY6617NzeWcEQMmgUNrxo7nG5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=183.62.165.209
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4hcDpG4B8Rz4x6B2;
	Sat, 05 Sep 2026 08:33:26 +0800 (CST)
Received: from xaxapp02.zte.com.cn ([10.88.97.241])
	by mse-fl2.zte.com.cn with SMTP id 6850XP1u025056;
	Sat, 5 Sep 2026 08:33:25 +0800 (+08)
	(envelope-from wang.yaxin@zte.com.cn)
Received: from mapi (xaxapp05[null])
	by mapi (Zmail) with MAPI id mid32;
	Sat, 5 Sep 2026 08:33:25 +0800 (CST)
X-Zmail-TransId: 2afc6a9b635567c-a5055
X-Mailer: Zmail v1.0
Message-ID: <20260905083325942Joui9AuK11_fy6cREJVPh@zte.com.cn>
In-Reply-To: <20260829154319.5d5422b8da6a93eaa72a00bc@linux-foundation.org>
References: 20260829171238191s9SIXoZPTlZSmA2Px30hn@zte.com.cn,20260829154319.5d5422b8da6a93eaa72a00bc@linux-foundation.org
Date: Sat, 5 Sep 2026 08:33:25 +0800 (CST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <wang.yaxin@zte.com.cn>
To: <akpm@linux-foundation.org>
Cc: <fan.yu9@zte.com.cn>, <yang.yang29@zte.com.cn>,
        <thomas.weissschuh@linutronix.de>, <corbet@lwn.net>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <xu.xin16@zte.com.cn>
Subject: =?UTF-8?B?UmU6IFtQQVRDSCB2NSAwLzRdIHRvb2xzL2FjY291bnRpbmc6IHJlZmFjdG9yIGRlbGF5IGZpZWxkcyBhbmQgc2hhcmUgZm9ybWF0X3RpbWVzcGVjKCk=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl2.zte.com.cn 6850XP1u025056
X-TLS: YES
X-ENVELOPE-SENDER: wang.yaxin@zte.com.cn
X-SOURCE-IP: 10.5.228.133 unknown Sat, 05 Sep 2026 08:33:26 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6A9B6356.000/4hcDpG4B8Rz4x6B2

>> - Convert per-field delay members in struct task_info to an array indexed
>>   by enum delay_type, eliminating offsetof() pointer arithmetic.
>> 
>> - Add __kernel_old_time_t typedef to tools/include/uapi/linux/time_types.h
>>   per Thomas's suggestion for backward compatibility with pre-v5.5
>>   UAPI headers.
>> 
>> - Factor out a common format_timespec() implementation shared by getdelays
>>   and delaytop, using strftime for cleaner timestamp formatting.
>> 
>> - Replace the complex sizeof/ULL/shift Y2038 guard with a direct narrowing
>>   truncation check ((long long)time_sec != ts->tv_sec).
>
>Thanks.  I can't figure out how to apply this, and neither can Sashiko:
>	https://sashiko.dev/#/patchset/20260829171238191s9SIXoZPTlZSmA2Px30hn@zte.com.cn
>
>Seems there's a dependency on your "delaytop: add delay max, timestamp
>and sorting for top latency analysis" series which didn't get applied
>for reasons which I don't recall.

Hi Andrew,

Thanks for your reply!

You're right — this patch is part of a larger refactoring effort for
delaytop, so it does depend on the precursor series "delaytop: add
delay max, timestamp and sorting for top latency analysis".

I have read the discussion at the link below to figure out why the
precursor patch was reverted:
https://lore.kernel.org/all/20260804031240.D97F81F00A3E@smtp.kernel.org/

From that thread, I understand that commit [1] ("delaytop: fix a bunch
of docs build problems") was reverted due to issues it introduced.
Consequently, this patch [2] ("delaytop: sort by max delay to highlight
top latency processes") was also reverted because it depended on the
documentation changes from [1].

If I resubmit patch [2] as-is, running make htmldocs will again
produce warnings in Documentation/accounting/delay-accounting.rst.
Those warnings (e.g., indentation and formatting issues in the rst
table) were originally fixed by [1], but since [1] is gone, they would
reappear.

My proposed solution is to update the next version of patch [2] to
include the necessary rst formatting fixes directly in that same patch.
This way, patch [2] no longer depends on [1] and can be applied
independently. The documentation fix would be part of this patch
rather than a separate precursor.

Thanks
Yaxin
