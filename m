Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B5F944F564
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 06:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792391833; cv=none; b=CxDvrbyWI6T4DIien+f3Xah7KcNTsSjgDOogRsNwRVhhC7amlOm2GvrvZVRh4yPWMYghBYxfV5a1rBccFbdB/DruMVb3yxVOMPh8+m9cs9q6CyGc86jp3FoFiB3VZoSLhiOwR882qpCvTL/d0VfXFxo6XwhZNvHK/toKMur7xk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792391833; c=relaxed/simple;
	bh=1vEKNs1Lv8s9RlC0dYldCjP9Clmvu1wr0qp2xUuHHc0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U5qWaYTgVxDsLiqUriODIQj3bu3JTHWVvZTaclADQbzgWfePcna1odVBvl0Hx/yikRtxXvY4GLqZQUgBM9u8bVdx6rDowkGQ/rVk0JgVZ6WlJvtYHeM2hMgMfY8RXkE5OjTUoZ/D7Tpoh1Q5joNEn9pTxu/CJFlYYtDX73zTYr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EltVEAue; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EltVEAue"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-35aa0cf7c40so3599892eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 23:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792391832; x=1792996632; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mKqh3a+klgRP2nrDDzvAYEDMhzyw7ysI9kOxZXjrT/4=;
        b=EltVEAue9+qEdZCyEXhFXWuM+w5R9aaFVdIOHoJnqbVHyCmt5nJDmj0cLPD4d0nru3
         XAE3Q79HfNOjKwJ5LiJVRLARO/nwaNMkmL6HxDL3G/5RSHpA6BVSpU2/Tzm+X86GH+Ri
         +fCbuUh2CUkHFf9V2ZMK41zTA3LWDPiZH/msDrN3WTyaLA5vK9ZK5aa+6b6enlNxMQ+f
         dwP3OPOqJnFWoEFHfJihzJvjHPntzkiC39iPARN3mCmeouB+GggaoV3UWnIvPdy/E45o
         q+ATdj36oQdbGXy6Bg1iGeGxY7y8oTUajP3+jYJhpu+RmtZptZyLkfTYAsbpYumA8KfE
         RgHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792391832; x=1792996632;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mKqh3a+klgRP2nrDDzvAYEDMhzyw7ysI9kOxZXjrT/4=;
        b=SPKO3RNJdpvGraKTLO8PcoOmJFY08O5ZTNwhl3uSt3BMhCIkNwjTLQOFouWemodLJr
         Vr9Lvr0kCNdO57YpoS7boeKKCnvKR6MW5XcZpRtZa9hL86upbpIlnN3Vhh1OiEBadfnK
         ioQ6mQNzj+eXeoeARmTMHUI9WXvsblnkcNsV8Bx/j1FvR+8Jmnsw/S6gtQkF+KTgkgjM
         qhNX4fJCzgEW628h1U4sn3DEn3CaRUgUxd5b4KEeuUWT4W9EVXvL561gn+jU5+GxwguB
         MDEdV8Hyaw7OeVmNyjgtdTUrp8Xc9afT+2BTRKG8YbrW9COxq2RPht8zFhDncGg3GSZy
         AGbA==
X-Forwarded-Encrypted: i=1; AKwUvBxCvgt2C8N0DjBkevvuAH7TLCtcZK7bfrGONm0TrEUQBT44IRRPb9mcbPRyGJK07L8echGMyf0jyuOV2kw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKZfvJdQZC96qxxxgwf2EO9pZkyPRARyn/QfmGNM6O11v8ch5Op
	pDJe1vROqoeKEDD4l9Ctt6o7/6HlwZv0RFzcNRJxXqmuyBh+2CB2qIZA
X-Gm-Gg: AYBFou0VwXUFBrZl6N5K/wEICHZ2KE9X1YmSc4c9PwkusaCfbQ1gzTG1dfyDBZvMmhw
	Mv2fxU4bGObCR2Y7vlLJWfCyuYlrudGwEqfyIMJ7GZjD8Tn3WTEyJZPoNqqPxXs2XPvz7vVzD0E
	He12q1McJXoXFjd6uBs2D29/+BRxyqqvswkdOcDG8jp6Ns0wQLAau620d0+2iew2blVl4+h+voK
	j7g8VsPATePwEHyi/ZlHlpdF0wtDN7EWOzXSFsiS/ZjJ11lSjj40QZpYJP+E2eDDMP+lfZJTcSe
	qMm17u8zhfaIhWmw+kVzIzNRFnIT1uxTU3imm3+6Qr00rrgS7JuvGaNdfcQKeynLkNPZUCHWwy9
	JBYOzKHoStt2TZ1sX0Umg7Y9tDykSQPV7dN82iyXnJ4Y0M7d+WE6k/YdrLlNeLmJKCszfPM7HSx
	fUO3KaYEq5w80NxeB4/JqWsdRf1LsbvATEiFCPH4qxOad/+uryYLHmPEHqu4GePR0=
X-Received: by 2002:a05:7301:470e:b0:358:8bd2:fda1 with SMTP id 5a478bee46e88-361a2649752mr9635115eec.30.1792391831387;
        Sun, 18 Oct 2026 23:37:11 -0700 (PDT)
Received: from ubuntu.. ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36082a7b33bsm53697748eec.24.2026.10.18.23.37.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 23:37:10 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>,
	=?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Cc: Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Shuah Khan <shuah@kernel.org>,
	bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH bpf-next] selftests/bpf: Run tc_edt serially
Date: Mon, 19 Oct 2026 14:37:03 +0800
Message-ID: <20261019063703.2144943-1-odys.yuan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <DM6E35SUH95A.2B7HJ5XOTFJHS@gmail.com>
References: <20261009-selftests-bpf-tc-edt-serial-v1-1-f72e045f2465@gmail.com> <DM4FOVA9PW2E.1WIY5HRJWA1QP@bootlin.com> <DM6E35SUH95A.2B7HJ5XOTFJHS@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, Oct 16, 2026 at 4:05 PM UTC, Alexei Starovoitov <alexei.starovoitov@gmail.com> wrote:
> The test is flaky without -j too.
> It's in DENYLIST.s390x in CI since Dec 2025:
> https://github.com/kernel-patches/vmtest/pull/418
> and it fails on x86 with ASAN:
> https://github.com/kernel-patches/vmtest/issues/503
> Both jobs run test_progs without -j. serial_ won't help there.

Right. I timed the parts of the measurement on a KASAN kernel, x86_64
VM with 32 vCPUs, 30 runs each, median (max):

                 before 1st data   shaped data        after last data
  idle           0.7ms (0.9ms)     200.08ms (201.9)   0.4ms (0.7ms)
  32 busy loops  1.0ms (4.7ms)     200.08ms (200.4)   0.2ms (0.8ms)

The shaping itself is accurate. What eats the 2% margin, which is 4ms
of the 200ms transfer, is what send_recv_data() does before the first
byte goes out: creating the sender thread and accepting the connection.
That grows with how busy or slow the machine is.

To Alexis' questions: the misses are small, the test reports
"actual 2 > expected 2" and -2.4% was the worst here, and they do come
from CPU load. Widening the margin would only move the line, though, so
v2 [1] starts the measurement at the first packet with data instead,
which the BPF program notes. With 32 busy loops, 100 runs fail 3 times
before and none after.

[1] https://lore.kernel.org/r/20261019-selftests-bpf-tc-edt-serial-v2-1-41c3813e7916@gmail.com
