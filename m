Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793816160;
	b=JShCCmEleYiKv7aeCitS+8cC+7lnn0BER2Gkdm9PU02xeqg2zNtADZwFJI5T9BjdeZN9
	 TeYe4B9Ob0N2s6Yalvkx3KO8f3sH05+ZcCjcNnjYamGJXyoIctC4qDESmqN6WRmsYfj2K
	 UHh5QeO7s/sW0DwfGwCxgPcah4N4XV7LvRVCTEjnkowSo24isa0DMvO0/UuASCCQL00eo
	 RuD32FBw8Z3nbXNylRLtKhGksU3+QCEizhetK5+gHn5j0MxPcBHEq4j3hJjH6mvocG63e
	 ncBY15RVPIMwvTKxFCTfJu4+xeQSBjniOHjtS4X3rePK3paq4Pm8nuDeHzoB14uwXrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793816160;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=DnkyCFwfTEyghMwBbYx5eIEahNaTNIOnK3R3J4LlqI0=;
	b=3xW43U5mr0t+u8AjriLLBGp1/kHZRofMh3LZwrMc/Cp33sKfj7B9wy2FIb4JYHFGhtPB
	 yRaaoSRxegwrOIaoZX3aJH2WZQjCm4xCahrBTaHsa02B7ja2mmUv8NsBo1RKIOBJGcv3k
	 mtHSRP5OaGo5QY5pZygutsjzp/MdGO6nlbqxp33ntluXGWHgTadyVtHxunG7v67H5thZv
	 riRnfFKg3mFTzij40RoGuSbz3/1AtxlfVFqN9AN0KQ6rKvQMMwxZKrzRcCjmoEmSnGSdO
	 MtwP4PxaGyW2IiwkP5tP0Bneb22w2apwtjJ1QHFGhmcHhJBPO72PlGKYAuAuJECHTWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dh++Upn4;
	arc=none smtp.remote-ip=209.85.210.170
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 505E4606A330
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 18:16:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 505E4606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dh++Upn4
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8a05e3f0d23so540408b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 10:16:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793816160; x=1794420960; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DnkyCFwfTEyghMwBbYx5eIEahNaTNIOnK3R3J4LlqI0=;
        b=dh++Upn4ZWf7TCTz0JkNT4qSQSDu2Uaew4OU6cXSrs7FN7XOMXZsdZov0rgiApzPdc
         j/ns2tZ0F2dx8nx41mTa8X6jql6kq29Him+xrNExnL/EM7kKeBV8ig+90HaAGgqZAnT0
         LMettOORnr9NA//uos5+vFkmDNagJBGWiOQsed3rCndc7d9bJkQuY7waS+JLgLTTTOOy
         mBOzI23pKm7CIAMKMPrEoPNirsQWVh5aoYVmAVqFVvbXlVpht9LmGTxRgpyaAIIXSUp/
         oTAYhipNNWLuQs/zyCPXYHTZAnXDgPYTakhqHWuy2hrQCEQL/YrC2pcCxPGbjZ7j36ME
         pQzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793816160; x=1794420960;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DnkyCFwfTEyghMwBbYx5eIEahNaTNIOnK3R3J4LlqI0=;
        b=EGHys9S5My+GiKyaSXUyknxYXZxBbYTCt++GLHq+ca5VoyDul0tPxh8Jdo0W9ohW7P
         DpyxdIfilEqgS3ztCWpu/bkS7ZlVOTlUw/we6irAp4+qMHAGa8ywGHCuQ782hwS2BOQt
         TghO6XbLgvKolRnxydYOV0tYqZpI5pBJkotHRz97K94DfYbSy2iAm3NDYIKoJ2lt1QDc
         nBCmbyzZtCuAkNjkK9b5vElcQCuYt6InGspRsXLRTMbw5QpME1csl4CNusazYg2ioR9Y
         pDJUGrKkmz4ZbvTbX+oNrSAK+PmoqngRJW05XQceOdto/yCJixwgQaWXBy1nsymJlQxm
         0+bA==
X-Forwarded-Encrypted: i=1; AKwUvByrgegk0AlhQmvKLpMpJHAAGQwENVAocyXpYYlx1rP/k8xxNIsgsL0TQ5T/dO0g0Db7fuf6SpeXKc6swDI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+zSKLdjCvqSgRpfuTIEEREnUTOC6cemFbsm0ppTWAAxrtzKGXf
	9g4/DvhiDC65B5KZ7Se31V90ssk8ityx8AQeXu0m9kjOnFZvFtpEck1BcafUolu4ew==
X-Gm-Gg: AYBFou0UOM5Lxf/DR14tVJF+DAvQQHkKpXSXUqujVgiOw1BvT2ylkru+Svcnsd+XCr4
	kM6inIlNvSqvTrWl+kja1quQRLJuVANOgbHx4JU4DQsjMP0AnSXdLVmL2eZbKRxzggfiqYshmc+
	Y6fsTUVV7YCDDT7HZZKMBn8ufRotNRCtP9599gSqfdOFen09uQu8H1SDfDqvI+qtDAVrLI8mwla
	JUDeXSr5Dzbt1O10tbU0nH8guKgjFtMBEu12sJvY6bzWt04rEmXcmR0iBccp5QYvBo3lA3aS/Gs
	NPxGUMRWerj8nbHtOxElEPv7YTvW4HWF33FUvD77ztpJMRll8I5r32vctgHrkW+7NVGRdjXD8QB
	jBzRI2Qsgby7aIY5lBIZ+/vD8MsoIjnhrZuBbUKMzdmq4bchLlvEpQdimJP3rjxWzdQLJ0FMz5H
	j77mFYekaujcO37hGdMdYTUJrUqPCN2PKkwRlH37MI+gIcWlSKXm9aDotehKoRlth+29HgAbvJW
	zuarL04eJjwsSWVnz89F4UXyBGLZB5hw+fCw+bmOPek3xCrnOyqHF9Zj26U4fvg7dM8eIp2jSMs
	CjWWkJi1e+he+8DvTTo9VfHoS9rg2+mQ2eaIwitshjgWZKbMzAGqXDJ+PdFChh7u
X-Received: by 2002:a05:6a00:3c89:b0:886:46c:8a1f with SMTP id d2e1a72fcca58-8a9bf0466d7mr13529775b3a.35.1793816159117;
        Wed, 04 Nov 2026 10:15:59 -0800 (PST)
Received: from google.com (33.79.127.34.bc.googleusercontent.com. [34.127.79.33])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b09bd3ad6fsm1246841b3a.55.2026.11.04.10.15.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 10:15:58 -0800 (PST)
Date: Wed, 4 Nov 2026 18:15:54 +0000
From: David Matlack <dmatlack@google.com>
To: Alex Williamson <alex@shazbot.org>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, stable@vger.kernel.org,
	Abhishek Sahu <abhsahu@nvidia.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Shuah Khan <shuah@kernel.org>
Subject: Re: [PATCH 5/5] vfio: selftests: Add test for device power state
 transitions
Message-ID: <aut2WmTGY9M8BM4U@google.com>
References: <20261029203324.1637772-1-dmatlack@google.com>
 <20261029203324.1637772-6-dmatlack@google.com>
 <20261103153553.6caa7d7d@shazbot.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261103153553.6caa7d7d@shazbot.org>

On 2026-11-03 03:35 PM, Alex Williamson wrote:
> On Thu, 29 Oct 2026 20:33:24 +0000
> David Matlack <dmatlack@google.com> wrote:
> > +/*
> > + * Put the device into D3hot via config space and then close it. VFIO must
> > + * return the device to D0 when it is closed.
> > + */
> 
> But we're only testing that it's re-opened into D0, there are multiple
> ways that could have happened.  It's pretty common that a guest
> shutdown might put devices into a low power state and it's brought back
> to D0 on close, on reset, on the next open, or even on the reset in
> open.  So I don't think we're testing what we claim to test here.  I'm
> not sure this specific D0 transition is observable, even if we were to
> resort to pci-sysfs.

You are right, this comment is not accurate. The goal of this test is
to exercise closing a device while it is in D3hot. The close should
succeed and the device should be in D0 after it is next opened. The
transition from D3hot to D0 could happen during close, open, or anywhere
in the middle, without changing the uAPI.

I'll fixup the comment, changelog, and test name in v2.
