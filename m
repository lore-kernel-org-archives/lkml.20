Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702BD399CE9
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 14:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791556670; cv=none; b=RDEJQgiDJk6a6xS9p7ZtIvrIvIEwNnCpHYsRbbyN0Ln/5qGiuXR1crviYrhIgRFj7VVf280kBFmA0X2RGhBWZQRLV5as1R2AkLWTutS/Xnt4OT3ToZXwKCuj77xVnEVEYs9CvXzCcbNHkQuMG2Go3i4YhmIITTUPXIziyX04rdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791556670; c=relaxed/simple;
	bh=p1F8safINLCSBZ9wkY6CcuBdKpiRtmwSdSx4OkzmuDc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=GuG3CdBTfdyPHD8NDj0xMaRMl8uskU1Xjua180vTZ20GkYNlgmA6Ls10JVw0K485+etDINdIqfBSbf8o/3klt/4yIs6Zw+Ch8gCOjjalBJoOp0y2O1xfcGCiOhsF8FcmDShG69xpM6SCUk1YWcd1Tb8Shb0OQu2QS8Hm+mXKp6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=osYILKjJ; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="osYILKjJ"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-3514e7cbbbaso8709644eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 07:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1791556668; x=1792161468; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h9da5zk0GHj2rwz2lfan29dlM/wk/e0PgyHn2IrcmKk=;
        b=osYILKjJnqtc0TkJ88vYBKZzNr9hTIkvA63C9nZnyMdxiK+zfxashWq0tcUZvasZKY
         kuISinulQXkq+rOjFEk4POY3fAN4MeRQf4ek0ERdJPlbJQepFBlq5nBVd1xYXFW481Mc
         BcNKx0VnuDOWSxjdPJtd64Ggo6eBSwJ28g8JPzny6x9rkuCMF9g0F26QjTlk1VSILKgC
         DxJ1kQ3+9P4f7vlLVYvw3aG15OBhuC4Iovyn7LteW4NZgr1rMW+6Mpm1odD0hI6vAVeo
         0Rc9ZRlFe4PMQbrVNCkIoknQfZyusGKvLRhwZqDMXoUvfxBvTuazkMC+UHc7hHsPWtTy
         dIvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791556668; x=1792161468;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h9da5zk0GHj2rwz2lfan29dlM/wk/e0PgyHn2IrcmKk=;
        b=WpDfMsNtBklSBl6Nb+7nNDytOnfe/gx9uTsAUvMJjKcEcv0W8yiMFplcNF/xNlEHdF
         BSNcLdAIhMJu9Kmtah5hrdBDgK7qoRLGBUD05oRYH0WZX10af20Osk2v2EmARPegjQ/K
         Vc3zTodT9u626jIdsTXW5twmdQySnV3rMQm5jyo8j/9cnUMfAs8q6vuC8E2PnNAXiE8/
         Ywhj/LzyQGJNTq/E3OrnnmEBeO8dF+DeciIo5dRo+uPz6WKCjtul+MyN84xHN6J/G558
         lB+MS9QFYAiArpwT43GfynSQ+DW09YdNJ6V5xWkJLwN9kQUOJBNViapw+3N7qqOH6yJF
         c0EQ==
X-Forwarded-Encrypted: i=1; AKwUvByKqhfxx0xGAGbe4pbXBS9A+DXIsIbUFCeCoq0zWIMbHk9CN9Rnymb9fJiYiS8vQTtlYCNz6sGHttTT9/k=@vger.kernel.org
X-Gm-Message-State: AFuF++m1QOCxxcc+H0eIVjsBwhyq6wBRCaV4LJ9x3V7lK88ubBmdY82E
	X9eTBmFYcqZwD4yZyVTQ+fna70Y/PBEsxPTPhMiXC8oOiBVYndJIPC+1SEMVVVld99A=
X-Gm-Gg: AYBFou2mU8xh59JjtBp5gBVh+CQ9zQtzErtoZxdHIycPmCK/VdjktqrWntPGA7poSqZ
	mBuC7f3r6Ozd1l1mjyVAbfxVvfiAr9uqep1H+KZnrn2mLZ0s4CWJCUlvjzYY5ELm2T7spkh2bJF
	cBo6mNZz5zJRnPD+GcW8+HDJkreyIwKRRD0vXn4CE4KK4+ouixX9M3/hjspMfUiRIPd34o5Lfrz
	7lrdSS1VdpwSEd4G0kihBNljL+c1ktP4skin+vIHKEdY3Bu8/Xsd0K0n5PhZIVLGAlimpD740+r
	AvpSlGN490vVIiu62pOJu+lYswVFAsaijbVN/m6rQowOWo6a4tz+P60tyiBkFuKC68tXOp355xL
	6CTaZJJhHYHQybRxt7qwl1jw9mALv529Wo257Tm2NiO+UoRl6nmTUjN4GS4p+1EKlkrInMZ5DtT
	Cn+Yaa13Uq9f+xqGdaZY8F0hkoJZbolkLZ30Uu91XOSyvdeOwyh4wbTVZyYEUinFAh479FMv/YN
	eJbclSvHVSNlHEHUvQ/5D+hlJaIVtTVdC7mWt2NCkX7S/ZS+nQl7ivr2atsrFJglktHtoXjw21V
	1wUdWuHpRA==
X-Received: by 2002:a05:7022:7f10:b0:143:3c9f:10a6 with SMTP id a92af1059eb24-16a57734472mr2827175c88.4.1791556668232;
        Fri, 09 Oct 2026 07:37:48 -0700 (PDT)
Received: from xps16.local ([155.98.132.5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a2d2db98sm6603150c88.10.2026.10.09.07.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 07:37:46 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Ming Lei <tom.leiming@gmail.com>, Shuah Khan <shuah@kernel.org>, 
 Uday Shankar <ushankar@purestorage.com>, Qiliang Yuan <odys.yuan@gmail.com>
Cc: Ming Lei <ming.lei@redhat.com>, linux-block@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261008-bug-ublk-selftest-fault-inject-delay-v1-0-a96af7ead06e@gmail.com>
References: <20261008-bug-ublk-selftest-fault-inject-delay-v1-0-a96af7ead06e@gmail.com>
Subject: Re: [PATCH 0/2] selftests: ublk: fix the fault_inject delay
Message-Id: <179155666606.221695.3172868322177231667.b4-ty@b4>
Date: Fri, 09 Oct 2026 08:37:46 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Thu, 08 Oct 2026 22:45:38 +0800, Qiliang Yuan wrote:
> The delay set by --delay_us on the fault_inject target is lost in two
> ways. Its timespec is read after it has gone out of scope, which makes
> generic_06 fail, and any other completion on the ring ends it early when
> more than one I/O is in flight. Patch 1 keeps the timespec alive until
> the SQE is submitted, and patch 2 makes the delay a pure timeout.
> 
> With both patches, a 1 s delay holds every I/O for 1.000 s at queue
> depth 4.
> 
> [...]

Applied, thanks!

[1/2] selftests: ublk: don't keep the fault_inject timespec on the stack
      commit: 955cba87d9ed334fbe0b669b35b4abcddd7f9929
[2/2] selftests: ublk: make the fault_inject delay a pure timeout
      commit: 69ae59173a5668d015ab2733c8628ed542f00ccc

Best regards,
-- 
Jens Axboe



