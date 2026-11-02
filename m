Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793600114;
	b=LzMPf1OnuCLddRORzLphDN4D5KJslkeYKsAHjkcGI/ToDr/6v4UgSemzCBISDKs14jhL
	 qwT+9hIFjAVhfgMMPiAgG6Uw4dUTlVr1EcDE8rBh2txUnzB3Qg6VMvWaCfZ2siul3qISx
	 J+AHIlu0VdAjpXMjTMGxBp2k50d7gzkvKHMI0bFgxUDiaXEBGT9RqPhhXsrlZyfxt+Kzm
	 xnXqohFoZQrEZGN/xX9AVQYezRCSuMemrrCp0cCSponmpA22BOZxEmP8Mwvx24VzsPuJe
	 i1l7gKa1dzQRroTQ8t3D44MIvP1WwD45kq+i7qpXyiX/QtYboqfc4Q1bdBVEg21A10g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793600114;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=N9p8p2HdUkdNstArIXEZ6d9TeiYQDnJxf1m9IIs2SIs=;
	b=5mx5sJqNqyb2ziu2RhTZoBFiKvIPZk+4adDWX/U2M0JbXT05pQ85FSuiXNhOnH5e/ACI
	 UxQ+YQ5Pd9l1UXSNXVNEbGJ++rqq7XdGenRd+/MlFrkwmIl//zybncDsqnr+AN7CPyHIn
	 bCTrrS0na6vjNE//rY87IA20TqZGifWfbbApcfZpn4GBK7U9ccunY+usxOuZkE45Gk4gU
	 gqWbR9jybpJqgzIVtnaIyyvrJI6dnbX2fwb18q+UOxxa51jWKq9h4lxKG0X/E0UAZoeJ6
	 1L87zXwZVy3AnILBzaO61kKp0CSiVVThTqJlG1J9VZ6eirsL0IGhWEjzXwFSGWQfhpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f4zjSubf;
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91D52606A327
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 06:15:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91D52606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f4zjSubf
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cd6acc50b8dso761355a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 22:15:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793600114; x=1794204914; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N9p8p2HdUkdNstArIXEZ6d9TeiYQDnJxf1m9IIs2SIs=;
        b=f4zjSubff7t65yc9TzSFbWKzjEAU6ddyIxf7Rl1tmnjRJRePp4qnIdD6CFk1rIzsf9
         RKB8I39qlVFwEAJ2BouHPHj5aImJHb2nRDs/6Z1bqSTKoflIHa/vXKhQIQe4FdUVOMr9
         dwCaKBwj6Dx8Cm5Q85FpOHauS9FTuxWOs748MtKdp4H7SKrtrV7wPHk6vIOOEhSo+ArD
         GsmT4WQ8X3l9VGF7paEw2Dz762JpqwtLjzZyPl2/yyP8AhwYX0t6+1Sps3UbQgLEM3Z1
         C8fN8KrfjH+6Tafp/j/Hy7W4O1OIUVxT92pNORqRWsX+KFeYR1aIiEV445G4AtfYj34P
         fm1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793600114; x=1794204914;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N9p8p2HdUkdNstArIXEZ6d9TeiYQDnJxf1m9IIs2SIs=;
        b=TeBLknsMwise0ZwHedY3btMmdeB6EK8WRj8+1aGLcEMRn9F5mxvSI6GN8zNuY/lSfJ
         g1/rZ5uvN/Y9Jagmm5WcMygllAerkET7DiuI+v7GMKaZVaJRRL+ycrzshIZd1vPyKhob
         g/PdxeX6BAlXTxxhCG5m4Q4OU3saJJr7t4sdnZGdCmC5mDDQrzu39GRekl4VLj9TkXlh
         2MD7q30YzZqkGL/+H2C+/RnMQmSrY5HiVp28228iX2jTPcJ8y7k4HhmKceBn9lrtydUl
         xQUBZ74V0ML/qCRfqCjh1oslwktPVDA7m7b1u6NxnS4jx/FCSOBSt+SzJLAQiRVPwLqg
         Gonw==
X-Forwarded-Encrypted: i=1; AKwUvByMXYrsuhnER1lrWQvWzOs+Qfso/LqT1G2Ms5cEKjLl2QDSD/WPAOG+C/64p3LN9aVBpdCLLnr4u6rdg7s=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Yv43M4coIERTkiZchMzXdxmv9wuRi6Bxx1ZejaqPV5FR4H8bR
	nFNSFBq9ao8SvkGYUBh4xe7iKhAfDSHlwoMVgV0U90GvNNg+Jz5XaOJrvra1qw==
X-Gm-Gg: AYBFou3RWcSct5W1gmPaaDQ3DMcG/iRsL1hujY0w8NAQ1hH/eEx9vhVmmeT9r+gG6jd
	1Rvd2pzdHg9COEfkxzKvsdo2YXRWKfzQ6SfnO4j/COjCyrfmarRvRlZedzBZcTLXmF1o9u/Krs4
	XOa/XdqW0ei5+qXdtyqKISo7Myd2/7fOT/M4N8RimHio6YRH4KrUDaf1qVH9YYxD9kmGdCTt29G
	aNowgXrJJnkcHEwlVILda6WWruNpQBulIFEIckEz5mkIgnIgfss1NQtz+uOe9x0dHjXf+3mPZba
	R4/V22w/+MosRwEFGw+czADUJoERYY85z5jJVHneaZ0MSPsbCTdAil8TXs/xU3lXspEPHTx02n6
	nkSLmdVhtoVzWuzz4cgFeINZv3HxRSp1TvFOm8UQzLIK6RzWPqbaiUBrWKf3HcNZ/KtdmC40k3C
	ZBZ5xeV7i7c5VO15oujyOZ4LmfuihozS9sMdsDdVOaAdpMGmDZrqlO4bKIK1bercL8C2FqvRbOD
	NN8DlOdaW1p2Su6w8l4JzbcE8XUVHDHtsqTgt+ehcyRzikZKm2pQ7/g45gqV9ybE18IhPY8FCNu
	5ZkNdY0mm86mFMATziuo1mg9SSTx9x+ixu2bpq/gYI7Sk/siWgXxTYmIFt9t4NXGtCpg4vYk4kz
	o8WiAsqcafHN90wFBegKJSD7neStADMSd0g==
X-Received: by 2002:a17:90b:1b11:b0:3ad:4bfc:1e77 with SMTP id 98e67ed59e1d1-3ae897dd40fmr7444865a91.66.1793600113727;
        Sun, 01 Nov 2026 22:15:13 -0800 (PST)
Received: from localhost ([153.61.198.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e98f888sm17118903a91.13.2026.11.01.22.15.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 22:15:12 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Nov 2026 06:15:11 +0000
Message-Id: <DMKI6C7FPCCV.2Y4YLRGWNSKW1@gmail.com>
Cc: <bpf@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Mykyta Yatsenko" <yatsenko@meta.com>,
 <qikeyu2017@gmail.com>
Subject: Re: [PATCH bpf-next v2] selftests/bpf: Wait for wq callback before
 checking ok_sleepable
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: <thamrinjonathan@gmail.com>, "Daniel Borkmann" <daniel@iogearbox.net>,
 "Andrii Nakryiko" <andrii@kernel.org>, "Eduard Zingerman"
 <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi" <memxor@gmail.com>, "Martin
 KaFai Lau" <martin.lau@linux.dev>, "Song Liu" <song@kernel.org>, "Yonghong
 Song" <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>, "Emil
 Tsalapatis" <emil@etsalapatis.com>, "Ihor Solodrai"
 <ihor.solodrai@linux.dev>, "Shuah Khan" <shuah@kernel.org>
In-Reply-To: <20261102-wq-poll-fix-v2-1-48b7d12815b8@gmail.com>
References: <20261102-wq-poll-fix-v2-1-48b7d12815b8@gmail.com>
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Sun, Nov 01, 2026 at 06:36 PM Jonathan Bastari Thamrin via B4 Relay <devnull+thamrinjonathan.gmail.com@kernel.org> wrote:
>  	ASSERT_OK(err, "test_run");
>  	ASSERT_EQ(topts.retval, 0, "test_run");
>
> -	usleep(50); /* 10 usecs should be enough, but give it extra */
> -
> +	/* wait for wq callback to finish */
> +	while (!READ_ONCE(wq_skel->bss->wq_cb_run))
> +		sched_yield();

This loop can spin forever.
The two ASSERTs above it don't stop the test. When retval != 0 nothing
starts the wq and wq_cb_run stays 0.

  what goes wrong                  today   with the patch
  -------------------------------  ------  --------------
  test_run fails or retval != 0    FAIL    hang
  the callback doesn't run         FAIL    hang
  the callback gets a wrong key    FAIL    FAIL

The second row is what this test is for.
The watchdog doesn't help. watchdog_timer_func() sends one SIGSEGV.
crash_handler() prints the stack and returns. The loop goes on.

Waiting for the callback is right. Waiting forever is not.
Keep the loop bounded, like prog_tests/ksock_wq.c.
Then there is no need for wq_cb_run and for the changes in progs/wq.c.

Something like this (not even compile tested):

diff --git a/tools/testing/selftests/bpf/prog_tests/wq.c b/tools/testing/selftests/bpf/prog_tests/wq.c
index 97926e3..c4de70b 100644
--- a/tools/testing/selftests/bpf/prog_tests/wq.c
+++ b/tools/testing/selftests/bpf/prog_tests/wq.c
@@ -7,7 +7,7 @@
 void serial_test_wq(void)
 {
 	struct wq *wq_skel = NULL;
-	int err, prog_fd;
+	int err, prog_fd, i;

 	LIBBPF_OPTS(bpf_test_run_opts, topts);

@@ -25,11 +25,13 @@ void serial_test_wq(void)

 	prog_fd = bpf_program__fd(wq_skel->progs.test_syscall_array_sleepable);
 	err = bpf_prog_test_run_opts(prog_fd, &topts);
-	ASSERT_OK(err, "test_run");
-	ASSERT_EQ(topts.retval, 0, "test_run");
-
-	usleep(50); /* 10 usecs should be enough, but give it extra */
+	if (!ASSERT_OK(err, "test_run") ||
+	    !ASSERT_EQ(topts.retval, 0, "test_run"))
+		goto clean_up;

+	/* The callback runs in a kworker. Fail instead of a hang if it doesn't. */
+	for (i = 0; i < 10000 && !READ_ONCE(wq_skel->bss->ok_sleepable); i++)
+		usleep(1000);
 	ASSERT_EQ(wq_skel->bss->ok_sleepable, (1 << 1), "ok_sleepable");
 clean_up:
 	wq__destroy(wq_skel);

pw-bot: cr
