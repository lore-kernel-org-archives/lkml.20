Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2303481FB0
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790245399; cv=none; b=DtQHm6M9dG0HOA+NGuQEHGxO8CdBcNLgPrOZrrIKsdYrLxywmFkb8BzrH4qDTPEv7NCqs/cv6/46Kx12yTkiF5pdfgyKy7w1bPIeFRTwsrY8JNtpgitjlJHDExAjljGzY4LIA1tWwEQhEOINg+Mq6nxaTzIKXMDz5abzKvC7I9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790245399; c=relaxed/simple;
	bh=E/m0YZzMmI4sKKxrYCkNhWsECzFNLMH+vihe3C9U+XU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T2ADfrTxjvcYHdOT9Qpt0Gge03NP9t+4LnLBSXrAEa9yq2TyKduiy+ZxU4ozjkE2XNeXVdgsmwUX7PoH+sPKcsInHiQUG7ayxs2ytRw6cf4q9Tu+Ekx7RXLN6e6ksEhHSPlTh/zKgIDI+3ZLgLYSObd9WxUJKaixR0vqXRemPjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B9Vj3K6E; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B9Vj3K6E"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc1ceb47d55so398953a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 03:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790245397; x=1790850197; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gl3fHPMWpRPJdFz90a3E85Yr2KY3z5RbROryxbkDx9g=;
        b=B9Vj3K6EvS5IBQCMrXZi8+0/Bc/8MAK+9Q2aGGAASQ2fxlWoJV1ZOVQiFGdQxvoAFn
         ZLNcR9P2QBMq32uB4MQiw0vZ1ILnVsnlmmNkWeuPxy7jRTlkEzbXBk5HJn3t+cJaOEk2
         kx5VbUJw8CJ/bpifTf7S3yHhWrrMfjIdLRhGYI7FJD3KenfnNaUWKHr+3df1NqH1+Gwk
         rvMk6+yzdBubY+DHI1lfQWvSEUSiUu8Y4zh5Da+xlmEe4EEx9DfzfntKsC/4si5ZcSC5
         avLDCVzmuTMDXPaf7JchGBsHqa74PV3dJ6ldQlzzWxUJWRNQU6kq8a03nmXzOoxOQyYw
         rgEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790245397; x=1790850197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Gl3fHPMWpRPJdFz90a3E85Yr2KY3z5RbROryxbkDx9g=;
        b=tzwjBpO0mG7hPBGqiW3Qug5pzKN9oTv7p5r5QFjTEtfpCEEOE/Uf71F0bWca7tc1y7
         7juDkXmxII+sFs17Sk21ucGIDRIWocR2Iq3v9QQY7EgNW/PHG4OU0/6JutFNfOh+A8p4
         rj1DgRnj9tlkJtOx4ouhwaskU1tCnuOPtR6YOjkJnrF6oD0Nfevpwbl3Ryhb2podWiVo
         KVj50qPd0s1sOmbmUL2ThB6p7KxPaWC0DDtzMIgF9y+q78PNn/OYo843GNNpS2RrD+0n
         6ulBdGWP0j2vfMUq8os1M2nCe/d3J0OMBuace3kqSwJmmm5sSzhzP2De1KXThFcngTHj
         S4/A==
X-Forwarded-Encrypted: i=1; AKwUvBwph/SXq9hy0paSt/p4egs4FO6f6zNhLm8WxJSNp9GpY6BH8TBPx5WfBlBoYLBbtV5L4BTawGwk//sa77I=@vger.kernel.org
X-Gm-Message-State: AFuF++lMskAo5wqog0Rc0Uod6IRaonNeQR1S+mUvuOGlz8oQspWWX7a9
	5YA4NYM07fbmZ0MSEpTtpWka6w+bJxgZbG+xkcwEO+P4biiTc6azgFY=
X-Gm-Gg: AYBFou1FXfkRJB7jyf3N8GBIfcjTXn22vAJvJYQFT3y99FPpAA6yA+1ANpAY1YoWYzF
	vUNg8oUQuZxK8kSpR7wjd303n1Ryd7kZl31wUrCPiZmC1/qEaM6uvYHt7IcLjw/TLWedPdwdKA+
	QG46Kp51paEVoM2jmBO8ZanTMbIts5rGPX4DlUS4i/76B7iy4+p/A9fnPVe1JvAm21+WwLw+uuT
	99o9vGptUxpwLSTfr878EBo1RvoK8NLaDkkoooMp/2GJK/LvOPrOdYH8ThGvJdfIJRoDxvC0e1U
	Ps/sdk0y3YqWYKbsuiHBeXm3Zg4ICQP9Q2C4n4C6/dyFaW0C0xw1wYdWbwpOcz+ehMRQY1FPJS0
	JQATpoqyhJ10cnCV9uUnFEQos+kxkLaCSdYJ6fL7QehHcO3Uy4wTkujiFoapZEoF9V95uK+SkYQ
	DJWckwcNbmZpuwBKdw9AP7uRFXblodvlDRhnYNx0Q+3vY8v4k7zgM6Gcwj7oJjvTc5DDvi+5fls
	mYmFkr42clmmpHi09NSseXv
X-Received: by 2002:a05:6300:68d1:20b0:3dd:a008:575d with SMTP id adf61e73a8af0-3de0e89e4fbmr833583637.27.1790245396933;
        Thu, 24 Sep 2026 03:23:16 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([211.230.25.193])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1d5c1ab4sm2664431b3a.27.2026.09.24.03.23.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:23:16 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: bot+bpf-ci@kernel.org,
	bpf@vger.kernel.org
Cc: Donggeun Yoo <donggeunyoo.kernel@gmail.com>,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	ihor.solodrai@linux.dev,
	leon.hwang@linux.dev,
	martin.lau@kernel.org,
	mason@kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH bpf v2 2/2] selftests/bpf: Test per-cpu initialization of a BPF_F_CPU created element
Date: Thu, 24 Sep 2026 19:23:10 +0900
Message-ID: <20260924102310.2120408-1-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <3d31f180b472adb3b215571fa73ba38641cc93a33ea2e8e82413f37957c2d99a@mail.kernel.org>
References: <20260923000801.1764758-1-donggeunyoo.kernel@gmail.com> <20260923000801.1764758-3-donggeunyoo.kernel@gmail.com> <3d31f180b472adb3b215571fa73ba38641cc93a33ea2e8e82413f37957c2d99a@mail.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 23 Sep 2026 00:56:18 +0000 (UTC), bot+bpf-ci@kernel.org wrote:
> Can this test give false negatives on the BPF_F_NO_PREALLOC variant?
[...]
> Should this arm either pin the thread with sched_setaffinity() around the
> delete/create pair, or loop over all CPUs to make the result deterministic?

Confirmed, it gives false negatives.  Fixed in v3 by pinning the thread
to one cpu.

Thanks,
Donggeun
