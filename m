Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B46B4BD79C
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 21:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789163143; cv=none; b=f4l+1JTI3pZaTQvy0ZgJxo7pMYn/mtFtvFR5B3RP20SFeM2yzFdHvQGv0hnGb2bj7UuHEgCaZO7xxg+4UV4nRptDYy2JHR0rhNMNQFk4bUBCj9v/yaYJAoEiWuS9c2DSMxbi12PF8rkIpiOqIy3NstW5xXBIf/5s+CohtwCg6Cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789163143; c=relaxed/simple;
	bh=EFpnGXFg7Dpc9IAzzJ2AnGl3jwtilY+LHWCkCYpJ57o=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=khlfUAoRPd3VOiY0m2Dyi53ZlYgjvjvzFnUlVnFL4AubX6Rgs442XyxpYxk0KB6pIAanaAIS0z0ab/C9xkb5GwkiWKBzAhgkHubYwK7bweMzrJK4/ArbEszF8ogmmEgCGI2gyF8f/tQvnA2i+wTX5+P+/R9L4llrVUmRXbNXp0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=n0C4riVQ; arc=none smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="n0C4riVQ"
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4b37a2ffee6so30343b6e.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 14:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1789163139; x=1789767939; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Djg1kbYc8KAYfIfIL1ACzR48Cmn//kJGwbSqiTyXnMY=;
        b=n0C4riVQBIo3VnNKDQPDoUBmamsJhRrTNcqCFKLHaXMrLxsv5IHubL35p6mPUVXkBQ
         bm0XfDGVI93+qLeyj1HXCP+EIGQtH1up3HT0bQaE3rbik2ouW1PsECicgzvzJTdBx2g8
         gzys0gI47iWqQIAJbGKrJxUDhjvwyNfnH/gSOxv7WNGJmajzDXC1N44Zpb1bKISvOxBc
         4j+KAto1rJHD0VM4mx61OU9xE12eeIqjtdL4g0FQM3R8Mb759r3joMPF0tYMNLRYwr1P
         eBPtgFUw7c6kaT8sXW4owvEe683NwG3M/7Mx2LoqTG5OfP+s3ACqYpk77lgShIWhmydi
         nx6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789163139; x=1789767939;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Djg1kbYc8KAYfIfIL1ACzR48Cmn//kJGwbSqiTyXnMY=;
        b=lnZxloAVx5kkO+AL/p6yeoU+sSyIZwGmHSP3btjm8FaPn5mS/jsDLtTbF+bFI5RxsT
         9a3QoyZ9MjDEctG9hGsuimXNtuLy5IvbPWL6JvfVCuHWseEWLXpP47Ao8cJ6B3mckva+
         1pL9QVmIFu1RkqmmEVa8yYRAoQB+i3A3XHsrkF4n4Sv7zK3oZYORJegZcseqsBti7SI6
         yJKSWWkEW8eFR1HBTlYjHosFs2BPceI/tm8PQplq/0T3oMAcFENHdZSn+BhUv69f1eJp
         MpojVojfzEUxTIK1hu4eh94mtuTxRvG8PS9sgDNjnAmefKsQ0GXG4fz79Uu7njzReV39
         llHA==
X-Gm-Message-State: AFuF++l9eW2Ggxva6/z3HFJcyFBXYPqPixWvK4r11porq4l4qljsxBIm
	fjIGaUm7TAfqymC2YJ2QuyKle9z3UmGsFG+mNwJmckANUVnzka775X3bnfbZFil2mBs=
X-Gm-Gg: AYBFou3LnlBaBQVzURU0DD/XP1UHQjk6qaaCPJKU1m+vhftxjmSqGc3+6DSBSwU+NIA
	umjCK6gw1lZw0LU4Efywaj1b771lVlWkgtqhQhH2YHSY6oMBKkvZQTFG+9/ZDb9D1TyxXiFnL67
	e0McYIaOJcoovj3Ae6ba8LJdxBCQTGZSJJ2Hz2ghZCrxFFI13eUIkl55w0usBrhkiykFPxMlkby
	9fW1Ng14wDBbGl+w15uzQTMuFXsUjY1rh+Xb63RbJQpbnvyJUKWdPdhJCDnhhj2nWC8YbkdajS4
	SsQt5wVlGmdql2NCVW6LUBNXALM55wNBnbMVXh0JSY7F4cJsOTBwPUfW22ehWh7DyIhAEAulpux
	/xboyGpwPc2LbfNiDqVOV+Uo4D5TKf2hPGsi/FWPPcZGy6z13ang3IU+ucXcqyVGDdCmCsUTy0n
	LtGWjwcrq2ZpXVU3cH+OerMp75SADd/qiutn+vl1CxgHwSOb22jg6/mFWBCAkrQkrn0Hy+EaXWI
	nCmRsJlvZhbZdIRNn1swKr4eM3KPRIuF7eQhzPx77/K117NHJSsRF/2Vg==
X-Received: by 2002:a05:6808:2f18:b0:4c3:7695:d76 with SMTP id 5614622812f47-4c4a71e3ab3mr389049b6e.6.1789163139089;
        Fri, 11 Sep 2026 14:45:39 -0700 (PDT)
Received: from [192.168.1.102] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4c32eb4274dsm3260110b6e.1.2026.09.11.14.45.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 14:45:38 -0700 (PDT)
Message-ID: <fb210ac8-b00b-42ff-8fc1-6f9243302b61@kernel.dk>
Date: Fri, 11 Sep 2026 15:45:37 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 io-uring <io-uring@vger.kernel.org>
From: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH] mailmap: update entry for Jens Axboe
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

I recently changed jobs, let's update the .mailmap entry so that patches
are attributed to the right (current) company.

Signed-off-by: Jens Axboe <axboe@kernel.dk>

---

Linus, could you pick this one up directly? Thanks!

diff --git a/.mailmap b/.mailmap
index 7c02242d4ed7..29c556cf597b 100644
--- a/.mailmap
+++ b/.mailmap
@@ -421,6 +421,7 @@ Jens Axboe <axboe@kernel.dk> <axboe@suse.de>
 Jens Axboe <axboe@kernel.dk> <jens.axboe@oracle.com>
 Jens Axboe <axboe@kernel.dk> <axboe@fb.com>
 Jens Axboe <axboe@kernel.dk> <axboe@meta.com>
+Jens Axboe <axboe@kernel.dk> <axboe@anthropic.com>
 Jens Osterkamp <Jens.Osterkamp@de.ibm.com>
 Jens Wiklander <jenswi@kernel.org> <jens.wiklander@linaro.org>
 Jernej Skrabec <jernej.skrabec@gmail.com> <jernej.skrabec@siol.net>

-- 
Jens Axboe

