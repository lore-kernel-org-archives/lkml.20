Received: from mta1.migadu.com (out-86.mta1.migadu.com [95.215.58.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666F3276050
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 01:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.86
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790906213; cv=none; b=VXUOD6+mHUiq89Viy8DGoX4YIrcHfCGZhLrAeOHjP2fpC5w05IVjQJHlaH3Yc1cnmRMFLacuSqBsH3KteHYVx7s5/7eFBpDe7WCeUK0SbAPmjOCVYlbWw+OwIHq85yfHjdsKzJUKhbF0pYuGaUoueRGqmmmbrk5rTXhJgklZIKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790906213; c=relaxed/simple;
	bh=oOqG0TKLy8mFSMKvvWHi4lBN0bSUCNpyPVhQS8gtLHQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mGyVtPkPWDKzxbWV2CtZcW1p1Qyu5AA0jvAtXa8YCRA0MS2drq6HbBVZOkpehRXT01/WO5HLJvHpXWAxg6DiSHSMiBBUn9b/x1E10AR8FjdJTZB00gB/OXkyzJraFUXHF3j7Z1hycUjNV87RW8uZtFWt5eBoSU+N5SfFRVTwIVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chenxiaosong.com; spf=pass smtp.mailfrom=chenxiaosong.com; dkim=pass (2048-bit key) header.d=chenxiaosong.com header.i=@chenxiaosong.com header.b=vBSQwUpP; arc=none smtp.client-ip=95.215.58.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chenxiaosong.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chenxiaosong.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=chenxiaosong.com header.i=@chenxiaosong.com header.b="vBSQwUpP"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=oOqG0TKLy8mFSMKvvWHi4lBN0bSUCNpyPVhQS8gtLHQ=;
 c=simple/simple; d=chenxiaosong.com;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790906207; v=1; x=1791511007;
 b=vBSQwUpP7O4vHqPMLFDGimd+14gKBWBJgysYeu3fNXrp7vuozvvKqQEqdzMVhtOqOrJCvv2s
 h0rXgWCkcTC+7xbedjCM2/bycLFf3zmUVg8H1/Euln9iiA/SsyK1DoDJkqUgJ5VngSYzyzNnr01
 wYAXQOJSSj2TpSakmBYDQ8Q8LtcqsIIOSe8o7BILBLaamFDx1nXNj4SbCoUpNA2FLH6UihDDVxb
 soisd5SwdXxAC0VpedHg26zfjjJt5WY77abCTvr4rKc5wK7LlgbGEqDV4tCp5IjSSqYouPA+jZ+
 jxCpZyDwgOtzthW/9mgjjVGrXOk6TGZ/G8O/JTsnUtE3w==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 9428782484ed6090;
	Fri, 02 Oct 2026 01:56:46 +0000
X-Mizu-Trace-ID: 9428782484ed6090
X-Migadu-Flow: FLOW_OUT
Message-ID: <dd85c8b1-075b-47a3-8a88-6b55e5adb224@chenxiaosong.com>
Date: Fri, 2 Oct 2026 09:56:39 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ksmbd: use clear_and_wake_up_bit() directly
To: Daijiamu <3058704216@qq.com>, linkinjeon@kernel.org,
 sergey.senozhatsky@gmail.com, tom@talpey.com
Cc: linux-cifs@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260930183758.32342-1-3058704216@qq.com>
 <tencent_464A86FF7A38FD3620EBF1C6062745316307@qq.com>
Content-Language: en-US
From: ChenXiaoSong <chenxiaosong@chenxiaosong.com>
In-Reply-To: <tencent_464A86FF7A38FD3620EBF1C6062745316307@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Reviewed-by: ChenXiaoSong <chenxiaosong@kylinos.cn>

On 10/1/26 23:06, Daijiamu wrote:
> clear_and_wake_up_bit() was introduced by commit 8236b0ae31c8 ("bdi:
> wake up concurrent wb_shutdown() callers.") to replace the open-coded
> clear_bit_unlock() + smp_mb__after_atomic() + wake_up_bit() sequence.
> 
> Replace the sequence and drop the now-trivial wake_up_oplock_break()
> wrapper, calling the helper directly at each call site.
> 
> Suggested-by: ChenXiaoSong<chenxiaosong@chenxiaosong.com>
> Signed-off-by: Daijiamu<3058704216@qq.com>

-- 
ChenXiaoSong <chenxiaosong@chenxiaosong.com>
Chinese Homepage: https://chenxiaosong.com
English Homepage: https://chenxiaosong.com/en

