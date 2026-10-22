Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792691714;
	b=Slf9oxbNv1BBN5uuz1qIqgYKGNLHqeHI/H33lBmp/aV8kELmgBl09LZ9zpU7a3FHx4lC
	 V0gT6UyImMdYTKKYhMRGk3WIOheB4oNyYVBAzTI9SdTIRMRtN2V1jGsrwmRqid1EzJMtZ
	 cf+xeTRmkaKhdFRPST4C3uXIpk2I45pEua5lcycQfkvWRUDtcI+I/p66pk7tSCpOR5jsk
	 KuXmc39xZnRvu6QOzxi1MNNnhG0DzBqJsk2uhcaTilka7uv6JkA+LjLeEOJT1nPqPwDrQ
	 sUd9LhDMS5IzQokl+glFwjkEpwwUzG7rk7f81tC9FUH0bMxKBceh+eiJKa3s97SvJhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792691714;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=/TeC0NXNIi46C33TZxhpxGLiMDTPEAX8N+gOk9RAd3E=;
	b=yOhc5XJNRqkf7x0kI0bULsSvlTns79OdPPNMlOOqh6gwoZ7/jPfoAP0TeuXijjFfDekq
	 Y4V5oPag2DdUPlX/tOaLhEQr1jcJnWfOzJiVXpyU69OG9utJej+RObIUyy2iDMGHZqwqe
	 xjVksX7lT/hCB3Ohp9Ad5So76YMnm3DuPreYCwMSygPSOojWxTTtVdsMh+9S43OiEmVAK
	 9nkndUDFQVjOdWYbCQ2iA89ja9iZfzAWmSI8t5DMrYYhAyfgfTHFxu2Ed51bmy6ef7TO0
	 RGWMU7EtJdPivkWgFpvcHhBvPGnxnlWTZY7soGdgtCHy9XFn9BZjTNnE3NHtLeIRK8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Ms/uTMgN";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B786606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 17:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ms/uTMgN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43B941F01825;
	Thu, 22 Oct 2026 17:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792691714;
	bh=/TeC0NXNIi46C33TZxhpxGLiMDTPEAX8N+gOk9RAd3E=;
	h=Date:From:To:Cc:Subject;
	b=Ms/uTMgNPG6o2y3cfz3d9+8P3hDkJIcXv7IattKaeyng507KnPBG8LJNOUswVNWWl
	 mF9mVufpRLzcAE8zbR8SZ0SPoSIH+eJ/i42xfspBINzneLK6ZRN65tXTbR4gbnON8+
	 iUMDKXxgx/0y0nPiykF9o2IgaOy2DKs+P055zpGy+boaGXPaGqpZTzQlEL+SvAZbwS
	 3mW6o+YGPmxx++RCULKjjI1M7RpkbDdzzlaWJFbomoEPm+27wn3dOp4lDZWC3dJGet
	 ubW8j3MhiPb/gUWjHZXQvT09hcj6BFiUe97pj/QcgaFG8MjkjxF6BZq3u3GQC5vV3M
	 vkvkUNEfi4Azg==
Date: Thu, 22 Oct 2026 10:55:13 -0700
From: Kees Cook <kees@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Kees Cook <kees@kernel.org>,
	Sasha Levin <sashal@kernel.org>
Subject: [GIT PULL] execve update for v7.4-rc1
Message-ID: <202610221054.9B1BE08@keescook>
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

Hi Linus,

Please pull this tiny execve update for v7.4-rc1, to Make CIs happier
about the execve tests.

Thanks!

-Kees

The following changes since commit df2908090cda368b01ff43709f51890076c56157:

  Linux 7.3-rc2 (2026-09-06 15:07:20 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git tags/execve-v7.4-rc1

for you to fetch changes up to b36b990c50b1f581b9a7f35ae256f5542415fa69:

  selftests/exec: report the skipped binfmt_misc_bpf test on stderr (2026-10-14 21:34:01 -0700)

----------------------------------------------------------------
execve update for v7.4-rc1

- report the skipped binfmt_misc_bpf test on stderr (Sasha Levin)

----------------------------------------------------------------
Sasha Levin (1):
      selftests/exec: report the skipped binfmt_misc_bpf test on stderr

 tools/testing/selftests/exec/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
Kees Cook
