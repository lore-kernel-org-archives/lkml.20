Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793646897;
	b=3NU8r4Ixwj8fI0Wh/+gHSzCqzBZ8TRAPruhCkCRxZIHxkSfZJqWGXhKrpmk4Jqo1NO86
	 Eu1ZWasnfUQxy7AxcnyFPIuVJIkPVTCF/yFKWw2VjUPHw5DmpNvwh3ri2v+qOwXLZ2Ppa
	 AFOtfg+U7EQH2h/z65HurgazGg+jYXvUec5R0ZY/qu9Fu5fRFfjJt+/hQ4kFXO3+dExxO
	 pat5EvG2QSrhXl8ZWOjL+eukFA+K/UovRnlZ+wKF4BU7IgXOSaKubfy+zsW4KK5wIJFTJ
	 Slg9l/dSBOuVP+MdFAHk14M/AOufzdYecPza6cPHGcs08zWaQh5+l22pVUt+sRO0OcA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793646897;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=B7USxQeBWqJIvk+TNK+EFuqKe9jxWcobFGDrERPiumU=;
	b=JHJN8+/k2yBu0srzJ2rfLzP0A/D7NsdKl0PTAJwPMGI9SkGj6yEPOJtyE06BrJ6U1GiU
	 RkQwUmoBy5nGmGIt5qKuy6AoQJbB+iReeSmqN24MkVxAHB+j8+WkDDAYMhsh8n/Y/D4Jc
	 6vDJk2QElSta7I6U7UNw9n6Dkn/6i9aUCK/4LfsELZsvK9WiNNV+SzdYmSVRIhxBpjl/X
	 fEp+0A8fRMO16ncLvoGKRsVDvYLavqiYQDlQAtHc8y+wnEXngCp2vxbip8Jn/ddQ3qKwL
	 Jf22JAu/+CarWSrdymi+p0FgkSPvu/wGqJU4s34IO8FfVMeBY13nQHzJ/WNccx/h2Dw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yHR6+QKn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28DB26083617
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 19:14:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28DB26083617
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yHR6+QKn
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c4cb6834eaaso456113066b.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 11:14:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793646895; cv=none;
        d=google.com; s=arc-20260327;
        b=ifzk98fPBCEqf/Y1yxkyMTbbgL+Nn3YKgjxXNr0G/1GBQ0yFYy9e8v50ILdZCN9QRq
         fK3xyxzhL60AhfUn/77dQYZET4ioKUTnJIGnhwgaGT5Y4HJS2wx2xZTY72a+QegUCWQ3
         46yjPqcFb/WM2r4LyzY6XxYbCycIJUtodblIKkO2O4K12NTimI+xra2qSSyfiWMvRtuM
         HY6MTFUXUhf+sQE6QhRsJTw7qVt/xmQxLODWFAfihMtVJpxskMYOVBtnUe1SLfsgYG6m
         c3RCG7gzbOk03CX/yoPDumi8XdWVlxHjiOHAATGGwGPvNMTPsjxiGQ2ZNT8q/m3fjCan
         138w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=B7USxQeBWqJIvk+TNK+EFuqKe9jxWcobFGDrERPiumU=;
        fh=NM0kj/iEcOjEBT6/m8/XxCzME5yD/dtvaTWgx3z1sjU=;
        b=bsgkBByrY3lv2EYZZR3U9ElOuLa/8aDZqtC6cwNw34git/6CP6Ht0Y/YEZpUolgF8g
         tDRUq6me0brKpPNQ+x/mmlhRjEyh+H+rRaF4I3u2AoJqTVlaq61kpVn/T/BYhzuQ5i/H
         TnQCY3gUvzphUSfpq+7++0hVROMI2mkeF5QDHMXh/6tZhDdl8Y2/xlaLhEFWXeMWZU3I
         HMe0zMSma+o9dgmqi3qdKaCUaBjBrnz3/wkxZrFiC0t8tYo5uZLy9zCoGPg6ShS5Fetx
         UWSV65FvrMAMEGflEtwCimwIDp9pi0M6HaNDHaVk5ckwZqAKWxYYUKfZI2FCbSDGtDpF
         r1SA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793646895; x=1794251695; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B7USxQeBWqJIvk+TNK+EFuqKe9jxWcobFGDrERPiumU=;
        b=yHR6+QKneSTyYA1HkIcvbRXbKcCV+7xObIMy4aVMdoO8LeQzN5KjmPbxsjnQbZESiS
         3K0Ru8IQ31zzoTVqJwb/y7dQ/ISvpdoFbuDJWL78hF8nzMiPp4k/mT9V7FnX+PTJ0MZM
         qEF3LuxiddQS9mMhTlgNHN1bSwxnKMg7Vas7A1fmMMsOLCn7hwUtP4nr2NEz/p2E2BTt
         AOHZpppvmcwPt7mtR9KPI+nGPNrxQrkhYjVRLGnEqqb0+4RkpS5zZ7hiJu5R84huE92e
         i+dECqg8DbDsFDAHGVObjqFle03hSpXCobVZ3rbYfq8eU3N6wDUoY6+4MnDom6EwTHfO
         n8XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793646895; x=1794251695;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=B7USxQeBWqJIvk+TNK+EFuqKe9jxWcobFGDrERPiumU=;
        b=narcZgW/JnxNHuyBYWvIbJhLa5eZ87gpmkonGWqFC69UuE6QluBTKgE0NvRjnBdkMF
         4SLx7AScBgjzn2DuqaL9ijC19lqDr5lKlEV8ONgEvwR6Ye1dLlUQX39cbDU7xhRlSCq9
         3hhY9qze33CEWrAdWtrOCSqYhLpNWhnxwT7kC6TX2kvB3qfuFE6RjdDf8pYsQEybCoSi
         ORgPhqhf8k1BOs1lAbUPvsc1kGoV+Lne8IZ0vl9bfrIYa6pB4Mu1IzhlcDB2RC4zkXpO
         LhQ5XtyV85EGGmnezcHTQfaiiyMeR0zSk8vNqsmiXiLgQ2MmycLpRI+V7h4BK4D7+SOk
         2xlA==
X-Forwarded-Encrypted: i=1; AKwUvBznU9agy0KnGHYLfz1s+Oxg7lMUmnv7NwmO4JUPpPEddqhDQILVkvoZJIzI+Spmr/QxSfO3jK4s+bbvXyo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8MBjJlYcTc9ut/c0eMBTm87xuamxSrJtBt0igSxGY59GByF4Tx
	jtgJPpoqpvteYIbu37WxFcb1juEaYTlg7Jd4NfmPtoyh3+m8snOf5F3Rlm5UF5yU0gcwYjSVJLJ
	tO1W4iUdbq8xLmL6tDwy4lzWz8IxVrd8=
X-Gm-Gg: AYBFou0DoaTDgdH9NGRFMnT2UDUR75imE/fH1NLmdcq0fgusXRQuxFtYLQsH256w2lM
	B2TOKGS2EYRda74i37TJsf6oNE59pnRwRDNKiHjOaiDUccgRYRnJ6ONx8SOmPho07Z5FLfbUoU9
	6+j1dnxbo+bhkfPAgonu6ZMFvTeBPy1nProFtxeQ/ORGfDOdhPSoOk98i/aI7T3I+y6HBlukgMM
	MuAEW9KeC61pmsKCgAFNr+1qksDEMbmcuuvhpTHzXgJQ7EuVQxZq3LrshFabh4jo5eK+Nim4YQK
	jqedmbTVdFuH5G9i8y6Re+1TYtmv1XHpe4BiDbjeANjOL2Gn+Ca0QQ/QWkej79ULbJn3JQ/L1fO
	sbHGpw5pLqys+pm/ql8Ri2HNXyYymnqVMnJTk+g==
X-Received: by 2002:a17:906:f595:b0:c43:ae92:9a9 with SMTP id
 a640c23a62f3a-c4ca7aa3e0emr937269466b.33.1793646895408; Mon, 02 Nov 2026
 11:14:55 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023183434.9109-1-drifabdelmalekmohamedsaid@gmail.com> <20261101203113.74d0204f6d57deb81cdd0dc5@linux-foundation.org>
In-Reply-To: <20261101203113.74d0204f6d57deb81cdd0dc5@linux-foundation.org>
From: DRIF ABDELMALEK MOHAMED SAID <drifabdelmalekmohamedsaid@gmail.com>
Date: Mon, 2 Nov 2026 20:14:45 +0100
X-Gm-Features: AclHuK_Sn4VZsbOYzKg1RApQU1YaVmSKpjQokS2EFefzJWNdN-jlaD7qM-TtxrA
Message-ID: <CA+xk8n__CCNUE=ULkxLWzdW3K1NnxeUdkrU5PUeSX8xEidBaTA@mail.gmail.com>
Subject: Re: [PATCH] selftests/proc: proc-empty-vm: wait for child's SIGSEGV
 instead of sleep(1)
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Alexey Dobriyan <adobriyan@gmail.com>, Shuah Khan <shuah@kernel.org>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello Andrew,
Thank you for your reply,

>My review toy claims
>
>: Separately, tools/testing/selftests/ptrace/vmaccess.c has similar
>: sleep-based synchronization. A delayed child can make its attach test
>: fail spuriously, or let its vmaccess test run before the intended
>: blocked-exec state. That deserves a separate fix.

I just checked that file, it tests for a hang/deadlock when a ptrace
attach is run against
a child with one of its threads as a zombie, so they both hold cred_guard_mutex.
This, as far as my understanding and testing locally against upstream,
would cause a hang.

Is this the intended behaviour, and if not, is the problem from kernel
ptrace code or from the test,
please let me know which part of this i should investigate next.
Cordially,
