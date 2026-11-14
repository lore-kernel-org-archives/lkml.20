Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794642803;
	b=PL91xqB1d1W80iHQjLPm6BkeiG3aLG8S3rcPbD5LVJeAnimFp2NnftxOOXOXp1jBnfB3
	 Fn06mRfwbltLZmJswokM4M1Q85LJzOpJzEkWvQDNdJqQIN5SL02WRLKQ6Tb457JTMgbU9
	 lmrXu+teDigPdNQu7E2MmxNYrjVqFyExlME7hXfsCwOOlnhGtmLx+bJbsfupOCwj+WhpV
	 ZjtB5k/4Tm2OuzWE5Xlaud4jm92f8lX9gp1eG8QiGPbs9l8ldClvyoQfKDZMwztlJMX9c
	 XXnriHqyzP6qdduSqR0DtlJ7DRQXWNqzKlRRHKXp8XnNCNmvZ1cAfWxFmSkNr4P1POw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794642803;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=Oh/mhrRlY1hzHfSankT6HJSljxVCxzPE9l8vrGjjWKk=;
	b=IOOxxLYKjDRiT72IDXKcDOohwBQiHOxevlro7ANkeNangE0jw03NmtS6x3BlRmNRpq82
	 dexl77Newl0cRhH8Rq4q6BqQICIziwQKUDYF4g4fPZhbfgokhakWI8LnrCKhUq15MKqdt
	 +rJr7ULnHYsFYzQtNcOmSxrzi80dl4al+/0bDQkqbZWBSf1wiT//rw2ZENFoyu8yIluGB
	 72BDBiTn5/bORQtDV3kKrOVEKnKCAQn/0fB5pPga4FGTc/zIJxRuCA9vmG8Kr916W4V/f
	 MdwCU8GKsxHqeOqr0+ODGLsjUf9ABsVl9lpwpw2wfkWqiG5T3wCW06cq5S2vArdj1Rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="XXTjm8U/";
	arc=none smtp.remote-ip=209.85.210.199
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C797606A331
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 07:53:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C797606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XXTjm8U/
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8a073778890so1334698b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 23:53:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794642802; x=1795247602; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Oh/mhrRlY1hzHfSankT6HJSljxVCxzPE9l8vrGjjWKk=;
        b=XXTjm8U/Il4amLefYiHinEsmVLvaOPlCq2n7QQBBZizEiY/IGQza0/A0AsD0+zHxGP
         Bc6vvr6RoWdi4WysHssqdeWuh7RS5/o539LQfJhey+CelhbA7fsR4ajTWHOXhe/ZrNEE
         PY7XqzaUxcUgrI3OAt3bt4OMM06s352Ri8h7G/TupYFri1pXJ1K5qj9tJI2oulzHnJ0z
         2aFqgBnjB+/PJoUC+g7/qD41D1f+Iusb8YIjZuE6gcx0qA+aWEWwK86rPiDPe8HqMPH/
         7I5HYBu3lK55bAraS2DEsa1MSwH2qr+hbzbnDP+Zb4w1OMF65+y298hgVXqOtF3URiqe
         3b6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794642802; x=1795247602;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Oh/mhrRlY1hzHfSankT6HJSljxVCxzPE9l8vrGjjWKk=;
        b=sZgH2B3XIpBsOH2uJicz2F2senBTNUSjspdZEcpelByRzauKQ/QH8+4M143PQJENcY
         5WElmEjbl2do56W+dzjicco4ddNMjmV7AiGZ5tn9VaJ+vXdh5C7TYzZeLgqxRBzsnyIX
         R+RFsJ6S9vAdmsmgJAGZGeCRvt9s+z0LIGscPo1A2GumslrWPbSZ46kUa4P+YJiO2/m4
         NiF3nc86gFjDjb8968B8uoXobewaGpolN9POxCU3k9+Ic5lTMSqeZCVwhSP60+vT4uM9
         LtJdxC4efbW9RNE0sG7M0XEOilSWNyQ3h3PwhJWqnb5xLgm6W+NeAhp4jY09OoUDd9rQ
         QaKw==
X-Forwarded-Encrypted: i=1; AL+hErGhEfeLTme1VSrFwDSVbMrA4vO77NYxNgHDjxmSdztE9JpO//XC8XjsGcnrTYVXRCcvpluAG3xzlJJkOaQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8qyLV94NCDV4WJSj9W4WoG1Nbpcl6V7ak3IKfcLo2vfIsJWUQj
	2EPu0anwc77cfFmNstWVVQxiHbuLqtxiLMWzQQjV4MNlHc9mkfCZTk2fTPrd0MsAvO+pqcMux/R
	wn9PmzQ==
X-Received: from pgij15.prod.google.com ([2002:a05:6a02:840f:b0:cca:d82:90fc])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:a382:b0:3f9:9114:8045
 with SMTP id adf61e73a8af0-3f99114b75bmr595819637.43.1794642801339; Fri, 13
 Nov 2026 23:53:21 -0800 (PST)
Date: Sat, 14 Nov 2026 07:53:20 +0000
In-Reply-To: <20261111225148.88506-3-sidchintamaneni@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261111225148.88506-1-sidchintamaneni@gmail.com> <20261111225148.88506-3-sidchintamaneni@gmail.com>
Message-ID: <avgQgQeWDfQMQgvl@google.com>
Subject: Re: [PATCH net v2 2/2] selftest: af_unix: Test scm_fds on dgram disconnect.
From: Kuniyuki Iwashima <kuniyu@google.com>
To: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
Cc: "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, Kirill Tkhai <tkhai@ya.ru>, apais@microsoft.com, 
	hargar@linux.microsoft.com, rlmenge@gmail.com, egoriluk@gmail.com, 
	netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Wed, 11 Nov 2026 22:51:48 +0000, Siddharth Chintamaneni wrote:
> Add dgram_disconnect_fdinfo in scm_rights.c verifying that scm_fds in
> /proc/self/fdinfo/<fd> returns to 0 when a connected SOCK_DGRAM socket
> with queued SCM_RIGHTS datagrams disconnects via connect(AF_UNSPEC) or
> observes a dead peer in send().
> 
> Signed-off-by: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
> ---
>  .../selftests/net/af_unix/scm_rights.c        | 79 +++++++++++++++++++
>  1 file changed, 79 insertions(+)
> 
> diff --git a/tools/testing/selftests/net/af_unix/scm_rights.c b/tools/testing/selftests/net/af_unix/scm_rights.c
> index c165f250220a..ced83d3173b7 100644
> --- a/tools/testing/selftests/net/af_unix/scm_rights.c
> +++ b/tools/testing/selftests/net/af_unix/scm_rights.c
> @@ -395,4 +395,83 @@ TEST_F(scm_rights, mixed_lowpoint)
>  	close_sockets(6);
>  }
>  
> +static int count_scm_fds(struct __test_metadata *_metadata, int fd)
> +{
> +	char path[64], *line = NULL;
> +	int scm_fds = -1, ret;
> +	size_t unused = 0;
> +	FILE *f;
> +
> +	snprintf(path, sizeof(path), "/proc/self/fdinfo/%d", fd);
> +
> +	f = fopen(path, "r");
> +	ASSERT_NE(NULL, f);
> +
> +	while (getline(&line, &unused, f) != -1) {
> +		if (strncmp(line, "scm_fds:", 8))
> +			continue;
> +
> +		ret = sscanf(line + 8, "%d", &scm_fds);
> +		ASSERT_EQ(1, ret);
> +
> +		break;
> +	}
> +
> +	free(line);
> +
> +	ret = fclose(f);
> +	ASSERT_EQ(0, ret);
> +
> +	return scm_fds;
> +}
> +
> +TEST(dgram_disconnect_fdinfo)
> +{
> +	const FIXTURE_VARIANT(scm_rights) variant = {
> +		.name = "UNIX ",
> +		.type = SOCK_DGRAM,
> +	};
> +	FIXTURE_DATA(scm_rights) self = {};
> +	struct sockaddr addr = {
> +		.sa_family = AF_UNSPEC,
> +	};
> +	int ret;
> +
> +	ret = unshare(CLONE_NEWNET);
> +	ASSERT_EQ(0, ret);
> +	ASSERT_EQ(0, count_sockets(_metadata, &variant));

nit: count_sockets() is not needed.


> +
> +	create_socketpairs(_metadata, &self, &variant, 2);
> +
> +	/* 1. Disconnect via connect(AF_UNSPEC) */
> +	__send_fd(_metadata, &self, &variant, 0, 0);
> +	ASSERT_EQ(2, count_scm_fds(_metadata, self.fd[0]));
> +
> +	ret = connect(self.fd[0], &addr, sizeof(addr.sa_family));
> +	ASSERT_EQ(0, ret);
> +	ASSERT_EQ(0, count_scm_fds(_metadata, self.fd[0]));
> +
> +	/* 2. Dead-peer disconnect via send() */
> +	__send_fd(_metadata, &self, &variant, 1, 1);
> +	ASSERT_EQ(2, count_scm_fds(_metadata, self.fd[2]));
> +
> +	ret = close(self.fd[3]);
> +	ASSERT_EQ(0, ret);
> +
> +	ret = send(self.fd[2], "x", 1, 0);
> +	ASSERT_EQ(-1, ret);
> +	ASSERT_EQ(ECONNREFUSED, errno);
> +	ASSERT_EQ(0, count_scm_fds(_metadata, self.fd[2]));
> +
> +	ret = close(self.fd[0]);
> +	ASSERT_EQ(0, ret);
> +	ret = close(self.fd[1]);
> +	ASSERT_EQ(0, ret);
> +	ret = close(self.fd[2]);
> +	ASSERT_EQ(0, ret);
> +
> +	sleep(1);
> +	ASSERT_EQ(0, count_sockets(_metadata, &variant));

Same, these two lines are unnecessary.

sleep() and count_sockets() in FIXTURE_TEARDOWN(scm_rights)
were to wait GC to purge cyclic references, but this test does
not create that.


> +}
> +
>  TEST_HARNESS_MAIN
> -- 
> 2.43.0
> 
