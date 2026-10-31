Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793415538;
	b=1n7fUXBhFZ0OfOIAMArz/gZvdtsNipZX2YFasoGlX7guaWugYV5uob3y58F0LqqKaBk4
	 Gas83X3+ioi1dY5IDznLchIlVJWD9026nlQTZKHFkv9sGBnSFyafJzImuQWkYQi4oybZk
	 94iM/okrZP1+rh3e+lGEiXKy349rLiEKaUwP01IE5zP+38dB73NNlfYn3XmYcXsSg4nZr
	 VuYZBIYQQo4U2t0iW9i6AnHm9Jon4uaUC6QaYsC7THR5Nix9f3krQmps0wI+0PVoZuHSV
	 nh2c8EJRIr9X4ESCnNiLf4SMI9+m2R4jjQiC5rZlv8mNLAr7ncJ5GujTEvhI4ZGcTFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793415538;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=JkfOBmmLSdrkWhRF5jU/G/pRdN9hDyVrLyqK8ebtGdc=;
	b=C/DhjdGYMpA+IB9VdC33PTyJ7pMIDyO6PpLV+lsV08eYbBpo/cK8MyQQ8mzEQFwwAIQ7
	 MjEZZ5RelTFYZRMBimpZtEnYWRZWTrcxxH3WQtKXOwPWOSQjE9iUsx5jKes8Bra3I08SG
	 KyIvwruuhUdKwAQttDfpCZoMIsvk2UBUCxvVA6zMcSY0reXhUvMCtpN5uGGWntn0aeVSi
	 CT3sZdvCpjO0ZnzJxnexdVxKZfT0326R2Z0sCPWB3HfvKMAIhFaS2WPgQnHb4hdPYNWKl
	 ALtvqnHOTJtFAM3G+MrmeihXEmEC7jACFOrlvml7p8uHhNK1JVNxYdVrO82nIzAhfxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jxeGsHyt;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA41606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 02:58:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDA41606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jxeGsHyt
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-36a1947498bso848971eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 19:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793415537; x=1794020337; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JkfOBmmLSdrkWhRF5jU/G/pRdN9hDyVrLyqK8ebtGdc=;
        b=jxeGsHytW4yu/6DB/vxLQDJ6XTdzQ9NKtaGobF2RApLEBOkWjHOQt5/g8EHt4G1+dt
         HuBNuEO1zy1r0Se125GkCO4kMRCm4VPpJn+3xfmpchJRgHRNZZD5fnr+iZ5m2J0/GoPM
         69/JHz422gSJWQMY2eoLlmiuythx8B8J9Mpv06hBhalfMJPbxC/Qq3VCGasiCA42QX3C
         MEZw/86OUC+8Cyrcglu8b/tKz9f3aeaA5cf8umGvRpxP/1jXIwKWnI5vlvri5ngY7OOn
         tWi3fBnqhTmOgjUt3QyMwCjN0k6nU2Juzf7HmGfAjGhjPIE6KF2lV3lt7wRV1sr3qhZz
         87Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793415537; x=1794020337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JkfOBmmLSdrkWhRF5jU/G/pRdN9hDyVrLyqK8ebtGdc=;
        b=qKPA+DZj/xECPT+FOgWE1ZH5t6OOd+2E7tWnpdAJiBcOwyy0aK/XOF+o/GvltsM6HU
         Qky8z7Mvk08+/ojfIetzryeLy04cvJuuAyOFMVXLVw3L4C5AaXpdnX4XR2wIMI6exT0q
         YcfWzl8ldYVn00uWczMnZ9pB7yqbpqpOYPltzIcp0hKkos3KsOw6hNDHVR5zl/uSpkBZ
         q5l8ykWXt3WlW2Dllt8zbAiHacIWK+pEd66Nsi9zmpwHYEBoEYEwJtz/run3cl2h6NA/
         i0RcmXxd9so885+7/pfXMuboOCHHABtOGnV7QhzObwt6s9oKKwOLpwnmyaJALF9Lchlk
         X3jQ==
X-Forwarded-Encrypted: i=1; AKwUvBxK1xBu1TwmVwdROKHB0c5/i+E2jPGTCGjs79Ae7/nhKukScY8lEPnfGNMWSsEM57XUwKe6HnZVIMJA5Ec=@vger.kernel.org
X-Gm-Message-State: AFq9FYLSLxhgxyKiDNQT1jXNuqOkoPmA6cx0jkA/uMoqaSbyNRpbqDYt
	QN664pIVmhu7ln+KEDkD7rXg+ALpApjks2VxcF2DobFkUqHwuB3ZRnaf
X-Gm-Gg: AYBFou1jS1kqCTAqk2VNas5OqNEsJd4wld4QXF5SY3vwTjE6lNZJS2FCiXKu2ZXaZA6
	lV6vHpqLO3n8wPR/JLVJ6qj0jiK4LvMrqfsZEVGBnfhh2rebtwBIerFfLnTjFA8LSf+jceFqURf
	IQcQBwS1b8Uz2wmeLQXNmBzPjtQDsGiQzoVWjVTBKDKSe25w8PZdPzi09bmEZ60nc80M0ZhQxk7
	imRGlFJGcdg+09ZcSa2bxpnt403ly1HOIEEwE7Pzgc7W+019resQHWUWoLT47J3Ou98Z0Y4SDma
	I0AFPqAcs1vbjPr47iKKcgGkSTnZjCCJBa++iBcqYXr5F9AieowISs6TUd/pyOu9UhlVngN3yzz
	9fbEDnVrQU8nxj6gbO+9/Ea+B+Z4WzcmEXAdzLIRmCzs/E1O8yQxKNpj1InSCeHn39ooCnFmKa7
	ZFbukHoOSqFjAdQYy3G7oTbRq89k/c4yAO/pi7ZnfQniHeUvjRMtdjj+lggBqNMqlBLh+fsmeEV
	laXc5ijBrfbT3+ATwdUhf/ZynjvSFNm05YnletpceFcfLXUuVXk/6ZIlFTCxmdsbqUgJ2N1aqrD
	dBV50PBA0DI1RbQX/uz9D9PmDkhjWLp3/txfPr5bEAzGjQs=
X-Received: by 2002:a05:7022:1181:b0:154:e9d2:d741 with SMTP id a92af1059eb24-1ac5bbb4870mr5104907c88.8.1793415536649;
        Fri, 30 Oct 2026 19:58:56 -0700 (PDT)
Received: from zhangbo56-PC.mioffice.cn ([43.224.245.235])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1b0a628bsm10940998c88.22.2026.10.30.19.58.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 19:58:56 -0700 (PDT)
From: zhangbo56 <zhangbo0325@gmail.com>
X-Google-Original-From: zhangbo56 <zhangbo56@xiaomi.com>
To: senozhatsky@chromium.org
Cc: akpm@linux-foundation.org,
	baohua@kernel.org,
	bgeffon@google.com,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	minchan@kernel.org,
	richardycc@google.com,
	zhangbo0325@gmail.com,
	zhangbo56 <zhangbo56@xiaomi.com>
Subject: Re: [PATCH v7 00/15] zram: redesign zcomp and rework backends
Date: Sat, 31 Oct 2026 10:58:46 +0800
Message-Id: <20261031025846.3774596-1-zhangbo56@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261025021839.1542805-1-senozhatsky@chromium.org>
References: <20261025021839.1542805-1-senozhatsky@chromium.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I reported performance numbers earlier; this is a follow-up focused on
stability.

I ran an 8-hour stress test of this series using the following workload:
16 memcgs each looping a kernel build with tight memory limits to push
anon memory out to the zram swap (zstd), plus continuous CPU hotplug
(~113ms per cycle, 254k cycles). Repeated contained memcg OOM kills kept
the per-CPU streams constantly torn down and re-created under load.

Result: ran to completion, no issues.
  * dmesg clean - no BUG/Oops/stall/lockup/hung task/warning, no zram
    driver messages.
  * zram io_stat: failed_reads=0, failed_writes=0, invalid_io=0 across
    ~3.56 billion operations.
  * All CPUs back online cleanly.

A shorter lz4 (stateless) run was also clean.

Environment: 7.3.0-rc5-mmnew+, x86_64, PREEMPT, 28 CPUs, 8 GB RAM.

For the whole series:
Tested-by: zhangbo56 <zhangbo56@xiaomi.com>

Thanks,
Bo

