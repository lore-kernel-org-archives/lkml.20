Received: from mail-dl2-f42.google.com (mail-dl2-f42.google.com [74.125.229.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 520653CEB99
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 20:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790108803; cv=none; b=C/aeQrm/t1DJZbTclVTeJZh9y3AHxi0rWZGz2cVqEYFsUI222EtJx6ty5c6lOLRz/rR/NwyLG+XYwkBwsj4ntZybU9V94xHsx8gMNSuSPyZ4N+ZMuUz0i9K1CRXVqDfXO9UyFWWtY25rZt1bih/eFeazL55YmAOdN8nwtUyOsDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790108803; c=relaxed/simple;
	bh=b7yiiiVzjNolnX+5vmFrNaqT8CYZKoWM7E7gNxa2Uq8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IwlGsgyXoThY3hS9Zj0Q8wOjekXyOGzwoJ7kg4jzuRkVCGi7JsT2adEUh6UVnSt0dHb1DWlNrwssqJhffhJfXF/CsuSS2ndCk3HJsoS0Vvmfyw+DrPqVp0+gaXYqe6UfaLzqezQ2NsljD0WHZoCa/e+VOqpDnjFBRDt6jO5lTYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QM+/jddd; arc=none smtp.client-ip=74.125.229.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QM+/jddd"
Received: by mail-dl2-f42.google.com with SMTP id a92af1059eb24-144f089b1e3so222710c88.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 13:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790108787; x=1790713587; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DmZHmFTN/GI+Q0CTZwWa92OwQr166WO/bCQuEomtguQ=;
        b=QM+/jddd7ZJk5RM42t2RB4Q4/3g6jjfUe9fIxR75XvaQBVmBg5snPw20a6GAfP8SCO
         3GdK0mh/2IWbIk6S8F/ldDJkkJBY8T08twPnuvbX3zMe/6aiqjnBRP3C4RGbczdKKoEr
         A19FwjX1fNFlQ2gtF76j/KtIQHTFuD05M0oYP3qQvl5XA6uAiBlYqIsa3/5QsvRa3LHi
         1MwUY7/XAqScJ2s0uinK03fn/Tm0L3eO2fPsrC71dwzYs5dKFUZ2rV7qK5Ks8lii5tk7
         Mbhel+wCtN2TvPYLEoU5KZtxWu2VRXc0H77msMdKV8wrV2gb2XknQsSswB9wcgShx4gk
         PuQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790108787; x=1790713587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DmZHmFTN/GI+Q0CTZwWa92OwQr166WO/bCQuEomtguQ=;
        b=KX9DKSgKezaCHm3QGB1x5lAcc8k5f2+ecxfweQ+4mG1BsHwqizSaiP4Ie9UandWNRR
         02b1Da4OlO29pwyeZM/yNmdM1ESj4pGWJEPHvgQ25FW2UHEONoBtkCJSZ0gaOz3+DNiD
         loWK5dttxP2OxRSKEfialZX71bCVqMn8aiED9uH9Xwlyg/MRKn9+y94LnBp/diO3PlN6
         7dV0wEiIzJtaJkkaAY39DwYfo60x6WNs2/cgIURg0GtMQ8ahCqQlyvY6FCCXuh+AwlV+
         Lje7Tk3wmp8ovC/KZVRgjbsvlwqz9AaZVmN3mibB77YQbwsJ/oUGReU54z56UZcXYQlO
         gktg==
X-Forwarded-Encrypted: i=1; AKwUvBx8BFJXd7FYNya7BxlSlXq1WShP19lpJ42r25KpIY2DiV0YctlrgJ9Jjq+dB3ZGaK59YKE8AAQIBHGHDjw=@vger.kernel.org
X-Gm-Message-State: AFuF++m35MV3tVHHa+6CfP82HcsDOokdLuEVyR7Fo8peJuhuBqIj7HwU
	ghkFdqDcYOpakozfWOSLzzKZG4avWyoT3lV3knGjYHPBsoFsgm6bZaff
X-Gm-Gg: AYBFou3r//ix7tAkneQk7ArWk1YDCJZ3eNC/CQ/mwn4Fm3MIh95HWFVHDlZ81K7VzZ7
	iEdcB7LXpeZD3Evb9J81EgGPc5OezEIYy/D0r1q7gsdHpmvZdo0fvYJ7ZUUo9/9ZZtI1HzOVeXg
	NWN/YMZin/OOIWJot39myDwU33JAL9LuaILxnFXVQP9NoYo5wrJwIOG7MUwRw9CEwzhDUfXWwr+
	rsaGc0lTBmUbVvBLWjyvDA5WUd8YVEcqf2ZiZrfd3eA+32tJ/22jpDmAKds1XNtKYCQ+zrzvAvu
	hfL+hFFDZv/eBJZcLSCPIXpEtPFoiMB2F4BKBCCkwLG0MFq01U1rcQ08WRE88LRk0Dx2H56KKKE
	S5CkOPudGE8RBvaJrHTSFgoHILhCtcEzx/zwB2ZCtyoe7IwTtqh3KCT3u+6nc4YKhr7F19yIjV/
	6fRll0aSQgbA10jn46BtQu9lVM6eoJ46TuSERSzmqz0g2tVD8Xec2oULfXSpfuyaRE1DBoUCLvz
	x3jsyqIRi8T2o8EWp7pJIi4pOQRoVwiRhXeTHCYO3kA83u7aMM9Qu2K0tWyU8siaDWRTRy3wmU=
X-Received: by 2002:a05:701b:4546:10b0:143:298b:ba79 with SMTP id a92af1059eb24-144f91ed3eemr496551c88.40.1790108786209;
        Tue, 22 Sep 2026 13:26:26 -0700 (PDT)
Received: from Inspiron-14-5420.. ([2402:e280:21c6:671:f16e:2102:25ad:9cdb])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f983d73fsm1149953c88.6.2026.09.22.13.26.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 13:26:25 -0700 (PDT)
From: "Hemendra M. Naik" <hemendranaik@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	hemendranaik@gmail.com,
	horms@kernel.org,
	jhs@mojatatu.com,
	jiri@resnulli.us,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	shuah@kernel.org,
	tahiliani@nitk.edu.in,
	vishy0777@gmail.com
Subject: Re: [PATCH net-next v6 2/3] selftests: tc-testing: add fq_pie per-flow class stats test
Date: Wed, 23 Sep 2026 01:56:18 +0530
Message-Id: <20260922202618.25970-1-hemendranaik@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <179002340887.2160803.8030592378545876774@kernel.org>
References: <179002340887.2160803.8030592378545876774@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thank you for the review. Replies are inline below.

> Can this case ever pass with a released iproute2? [...] Turning that
> blob into the literal tokens "prob", "delay" and "deficit" requires the
> companion iproute2 change [...] which is not merged. [...] Would it make
> sense to add a 'dependsOn' probe so the case skips when the userspace
> support is absent, or to assert only what current tc prints?
>
> A related question: the pattern hard-codes the exact label text and
> ordering of the not-yet-reviewed userspace formatter. If the iproute2
> side lands with different wording or field order [...] does this
> kernel selftest then break while the kernel itself is unchanged?

We'd like to keep the check as it is, without a dependsOn probe.
There are several cases that were written against, and still assume, 
newer tc wording with no dependsOn guard at all, e.g.:
  - tc-tests/qdiscs/fq.json (commit 3007d8712c9b, "adjust fq test to
    latest iproute2")
  - tc-tests/infra/qdiscs.json (commit 56acc7f51974, "Adapt test's
    output to HFSC's iproute2 printing changes")
  - tc-tests/actions/police.json (commit b7df2e7eaef7, "Adapt tc
    police action tests for Gb rounding changes")
  - tc-tests/actions/bpf.json (commit ac2944abe4d7, "Be compatible
    with newer tc output")

We're doing the same thing here: this test is paired with the
companion iproute2 patch, same as those cases were paired with the tc
versions they were written for.

> Can this case fail intermittently depending on the host environment?
> The assertion needs a backlogged flow at the instant the dump runs
> [...] its exit status is discarded with '|| true'. If ping is not
> installed, or the installed iputils rejects the fractional -i 0.001 /
> -W 0.01 arguments, the fq_pie queue stays empty [...] Would it be
> better to check the ping result, or to enqueue traffic in a way that
> does not depend on neighbour solicitation timing?

We'd like to keep the ping command as it is. The same pattern
('-W 0.01 -i 0.001 ... || true') is already used, unguarded, elsewhere
in this test suite - for example in case a4c3 in
tools/testing/selftests/tc-testing/tc-tests/infra/qdiscs.json. So this
isn't a new risk, it's existing practice..




