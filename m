Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.230.115
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794197437;
	b=kCgONOAGQ2uLca8LXFiHEvUVNlL1Z5/b9H3IbSIgBykVcJERai21QfLCwgC+z/LBrWnL
	 wwapFmAIYs60K588JttMS0SGc2OCTHDiRtHAsA7FFnxSZRJ3vsEvpIs3OcW4H5OaX0JPT
	 3h+D8ud63I0BUGIm9d9EQbcCqydOwbMnr7wTrnwr/L3plOKlUQpw5wqVCM9tPN4hnfCKA
	 O1GI7r8U1CL9fMQ1gTtQOgXkv8moKAAeyMk+NCTYQ6v6k5Vr/vN1Lg5Ns12vJ3mYU5zkm
	 gXz88il/dt/PM+jTBhELoXCIu7RkJsbGFRr2/nEvSBxy2TBbZ7uOxsfBSUMucdvzDCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794197437;
	h=DMARC-Filter:DKIM-Signature:X-Lms-Return-Path:In-Reply-To:Date:
	 X-Original-From:Subject:Mime-Version:References:User-Agent:
	 Content-Type:Content-Transfer-Encoding:To:Cc:From:Message-Id;
	bh=mjCS2cccvac/fD96GCgBgLZYurJFuPvJEGsUseQ1xMA=;
	b=4ADFDK2Z5IC1il+c75g+lKeJDu6MQrbDwjbHCZ69q8sajZa9v1qfiJfJxaJeGrdMXdr/
	 P1IHDMQUeOvHqpc8czC9h+UQrHx5sm62Yqhs/ccf45JBH/s2PDld4cKcgch55nWGLBMDp
	 i885hl/zAZb+AJSouHnkhCHVsf8Bo8XONtlTVE31DA39lmufcYZXm/LKEVk9t+OzSrjHi
	 ajPaAzp1hx1MK7eDJC6BzWcGdBuRSg14cRoo2j0vI0RsbZ9KXY1D9vzVeiVM6/dkKkJHB
	 H4NIzoLcFtrta8g/b5y0Uu164RVBZ29vhBK0dWVdosIP/ieXnoSUr2L5U7Zlf58qT5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=aC8oy7DI;
	arc=none smtp.remote-ip=209.127.230.115
Received: from va-1-115.ptr.blmpb.com (va-1-115.ptr.blmpb.com [209.127.230.115])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 751A1606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 04:10:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 751A1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=aC8oy7DI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1794197430; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=mjCS2cccvac/fD96GCgBgLZYurJFuPvJEGsUseQ1xMA=;
 b=aC8oy7DI6AYJdOPYIjJ5L1SoAo8XBW0GiKJbiVFkL6ynnuthgsd4ViFdl2jPLeTDgSDI7l
 S5tHcMa+6CIwR5eAuS05pVy+fAMhIgjE/joHgWSEyXqTrTKr+KLcZEgmYFyWez/O/rtWL/
 F98zXkjhdSODQm6BPhJDcBiqco/40/Zadgai39dRiMB3vJumwp08h5U5ev0ij9Z98xVHnV
 t/jPOQWS8uG3CQZFsf3zpEPbqEfDzlgm6lz8Tg7KPg6ue1JJpx4JaYDnoEpfdKYFt2pgkm
 4Zmv/krkSswaEcIDtPwpHRuZX8e5X9IGwxsA4e0UKABNTVg8M8cS8MLs2GJelA==
X-Lms-Return-Path: <lba+26af147b5+cf4fab+vger.kernel.org+zhaogongyi@bytedance.com>
In-Reply-To: <avDGjYYR6Tj1sVgP@redhat.com>
Date: Mon, 9 Nov 2026 12:10:11 +0800
X-Original-From: Zhao Gongyi <zhaogongyi@bytedance.com>
Subject: Re: [PATCH v3] arm64: ptrace: don't warn on missing siginfo in a group-stop
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261105113051.97810-1-zhaogongyi@bytedance.com> <avDGjYYR6Tj1sVgP@redhat.com>
User-Agent: Mozilla Thunderbird
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Oleg Nesterov" <oleg@redhat.com>
Cc: <catalin.marinas@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>, 
	<ruanjinjie@huawei.com>, <linux-arm-kernel@lists.infradead.org>, 
	<linux-kernel@vger.kernel.org>
From: "Zhao Gongyi" <zhaogongyi@bytedance.com>
Message-Id: <7fb3d264-ada7-4dfd-be21-05ce370686a0@bytedance.com>

Hi Oleg,

Thanks for the review and Acked-by.

On 11/9/26 2:59 AM, Oleg Nesterov wrote:
> 
> ----------------------------------------------------------------------------
> But can't resist... The old comment was obviously wrong, the new one doesn't
> look clear to me. It correctly explains why info can be NULL, but not why we
> should not update orig_x0 in this case. May be it should just say that exit-stop
> always comes with info != NULL?
> 

You're right: the comment explains why info can be NULL, but not why we
return. The early return is intentional: it keeps orig_x0 unchanged
during a non-seized group-stop. I'll wait for Catalin and Will's 
thoughts on the wording.

Thanks,
Gongyi
