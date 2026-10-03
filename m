Received: from mail-pj2-f37.google.com (mail-pj2-f37.google.com [74.125.227.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C975231618B
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 20:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791060357; cv=none; b=ReoVso2mTBG0ZwP2dTAx/y2X0dF0DVqOh7zAobefb/p1Cwl+tNY32RiZ30s8XB01WGNdD056lj5WhTLu1shCK49/JiGJHVGXmcWGcpQDyXTwJjyVVz7mI0d/m5Nz7+OT1r5CSX0hTTuzdi5CYD9l0dZSt2NN66WlLZLOACEyfjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791060357; c=relaxed/simple;
	bh=FRp4Cct50HXCeTViDVPkOvyv0qHQZnD+X0WubEU1Bpg=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:In-Reply-To:
	 References:MIME-Version; b=KmIbL+4gp3DX44ZPqzR2tuK8j3c9JpI1ywK8/56t+XshDPcCvlPfXiAM15/i+HK04J5eGBX3CEY+wORQw8H0JoFQjfVhuGjG6qmQUp4t4ERnWbiUpqFt/CcOnBNO+1mcpeM78X4hGfmd54fvM4MTqT4ZVa60xXEubV9l3FrTtm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n8Zkw1si; arc=none smtp.client-ip=74.125.227.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n8Zkw1si"
Received: by mail-pj2-f37.google.com with SMTP id d9443c01a7336-2e300fa474aso2298355ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 13:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791060355; x=1791665155; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FRp4Cct50HXCeTViDVPkOvyv0qHQZnD+X0WubEU1Bpg=;
        b=n8Zkw1sihXcl4/Pod6zhjI9skgCU8j8F1VKkIOWyX5CldojzAfWimmAks5nfi9OI3O
         LbN7M7jT2pSdPqOjAibpwHGhCfkmKEeJa16o1lM2yFRjyEhm4MeQNUwLEe02xZF4vbj4
         NeZadT6r48WSu8JRikuJCVsKoEhQMgAxyyGz7+cPMHDGRx2a07APhzA/cXMI5ZAkknsi
         +8Qoz0NWe0WKvKeW4oFLFGxdiBrgDzayaQPcO0bTL6xSS8av6YHG6ltu0YR4yjKo1gb2
         gbzTkclD39paWI8LoyivQfZbiFf+84u6SYhDpdYnX/ohVVesjMuxLL5xG1Uye/24m7/6
         Ta2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791060355; x=1791665155;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FRp4Cct50HXCeTViDVPkOvyv0qHQZnD+X0WubEU1Bpg=;
        b=pBNEZf4luRXACEd05N/Yw73Jyysel2OVeC2SOa1mCusOPDYUiHS2+6j0L8xi4njcf0
         lKHhplPsdJ06dUPiJwerUCIAh8U4aQlvtWTR53kNG0gdDvwiITg8QvKyPJntIuel2Sbx
         uWv2n/FbgB4cVpYJOc41qykWIbByaI+H4pa6ySWcYgTwd8iZzc5Csf2kVVR3mYbHPd6/
         e6/2SURJ3D6SYoP8vdGSE4vGz9P8gDI4ELTuXaCc4HyYPn0oaLPo0QnA5I1SR1Ry2lg/
         OhzYZbI8ReZV8JSRkN0V6tkGtn5KQcY4w6PdBqQwuF9nEW65B8inZPgZnZbZrmnjNPLE
         +sKw==
X-Forwarded-Encrypted: i=1; AKwUvBwWoBran4hpCP8efvbc/tzYZ37b/JJL8QfsG86M8zd40cCb+qjthtKVXUWe5YzEWjT3mK2oFUL+M7Z40F0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKgQie8vXjqzZLPRWnoGw1vJnWPp93z7u0KIhTEnv3+LBiiD/E2
	3kgdsEacERXbm49N6pba8M4pDK4Ujo5JgKCrwSYKjYisHtss/ZAOB3ma
X-Gm-Gg: AYBFou1+TkBr0QwZkspILxqE81zN+HJ00m2qUA4wHRZFnkGgyf/hWzfSvHrwh2b2Rkn
	Sj7orAc+8ItBL9cyLJVrAk0dMKd7svVI2eubUrNoJRYWrmJLB/5KxmWz4uFJjYrghoZYXFYxHQT
	98zh/Ka81QfGR6ggSkRmvV2M+2UCHTq6NUOQlTrq58cJKbYhVNyRc0QrNXL//FOkNQnSjaHQEtv
	ad61goGA8JZYBErU1lW25SOka1Mbqs3p/WjRtbe+6BIZ+7StpQSFydWcTXa5Lo6YwE3/r746WrY
	LHO0SVmWhgYtt9HJBX/wV6vQVIlhKBW9MN+KBMHQrFdcmbdXVYhnx/q55fEvE6lDsvi11zMlKSP
	3vanJX3Ab7zqftOEH8iA9DY0Sb/hAlPK4M6DIbEi17VY7PsxCGjGQZsE4dmLWuw1mQjHManEV+e
	nojM1FHeSo0AezikkWHL3beqBBlAhV3JdKiZ7ZAd8A9AyP/5Qq4jqfaXpTtCplCVN0b5Xk75E+2
	SQ+pR6lZ106gA0o5jEddwu9C1HySA+oq1laXlRbXGi8h88CqlGMn4rDCG80t9bdO32IFPFYFj7v
	p1bpQ/75/oa4Cw==
X-Received: by 2002:a17:902:da91:b0:2df:83ce:724f with SMTP id d9443c01a7336-2e49b615cf2mr61626695ad.30.1791060355061;
        Sat, 03 Oct 2026 13:45:55 -0700 (PDT)
Received: from localhost ([153.61.198.243])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e533e8397bsm7343265ad.78.2026.10.03.13.45.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Oct 2026 13:45:54 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Sat, 03 Oct 2026 20:45:53 +0000
Message-Id: <DLVHWNL0AVKU.NV007WEHWST8@gmail.com>
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Tao Cui" <cui.tao@linux.dev>, <tj@kernel.org>, <josef@toxicopanda.com>,
 <axboe@kernel.dk>
Cc: <cgroups@vger.kernel.org>, <linux-block@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <bpf@vger.kernel.org>, <andrii@kernel.org>,
 <eddyz87@gmail.com>, <daniel@iogearbox.net>,
 <linux-kselftest@vger.kernel.org>, <cuitao@kylinos.cn>,
 <ameryhung@gmail.com>
Subject: Re: [RFC PATCH v10 1/4] blk-iocost: add BPF struct_ops cost model
 support
In-Reply-To: <20261003124045.1289305-2-cui.tao@linux.dev>
References: <20261003124045.1289305-1-cui.tao@linux.dev> <20261003124045.1289305-2-cui.tao@linux.dev>
X-Mailer: mkdraft (claude review draft; edit before sending)
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sat, Oct 03, 2026 at 08:40 PM Tao Cui <cui.tao@linux.dev> wrote:

v10 was sent 11 hours after v9.
Patch 1 grew from 712 to 789 lines and device removal is still
not tested.
Pls slow down. Wait for Tejun before sending v11.

pw-bot: cr
