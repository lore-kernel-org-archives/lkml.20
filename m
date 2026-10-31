Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793470870;
	b=NSEOlmSXWi+Nk6IVunAYl9V9JYHRDtHp8F7g7s3po1MPTbaZ2Hdre/C6Ljb6cSNmLwEW
	 +EW9BPGEque6XAgJ1jIJXSta95UDk9WVXFZ6B9ZwpIAxdYDl3XAQo74cm4EaTE4Ym9j/M
	 QlNYpHDx6EQn56Zsj3OQhkbLF777vM0bd6mSpvtqErt14FtKgDxQk8BFuz23teURqL/aF
	 8gCylCn1zdnMPAXTT0US7x7nlIm0PgLkw5uY6YDRfKvzLhTlVNt5AEI43fB5FV+ww7u2R
	 5L1nJf0PZtPjR8lki7ur4M9MFbjk/EW4FxAq2zBId8yqMBAv7Nq8k+bprtSDekngy9A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793470870;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=NgMpOyHgT4tLe/3pZX4/Fh1+jmri4pwwdDC4ZMxFH0Y=;
	b=tnxhLhCqpuAsjxgzn9jmN/ZTRzI94y0/kv5jYjr/+atdOukthCkpEmUkwELzkgnSue7Z
	 5OyfSFHFshcJwYVVII+mhdW0gAxsJ55X+ponLlK9FPri8LE5hPS+vczH/5Uv2QEnsaTcE
	 2Hgl8VCuUYUl2pMKj/O5fGrRAC+0zZ8P50xeFESowJdIurb07l8kCLxSoiuctzrnf53R4
	 3ccUQGJY6+B764PRYuryBE7/m6GqsJ2XG7EKqRsz60NoD9WbCAqHxc6rX+mfDvO3IlVBE
	 oxBy4y5z3/R3j9ks31VgAHIvUUhq9aEfXF44SrQKV0mVfG2o+QxN9Tx+GlNefmNQfVQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=04myyEPr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.53
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D851E606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 18:21:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D851E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=04myyEPr
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5bfc9154ceaso1368552e87.2
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 11:21:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793470868; cv=none;
        d=google.com; s=arc-20260327;
        b=iPwLAt68KdI6GpyU3BLOUmBgR8BnxouOBMpcPApqiucG7uCWGeT5fT2Pg+BeYeIlfM
         STPgGewiOf4hIBN1EUP3qPDpV0RsrBeZj97tN5vT3o9HG0VuTSG3tKvogc4hw9XsLDzd
         wcP1uWwVpBcEUd3Y6/TTVA6vAa9nQbi1uKUA4cXoxMUT4aYX7lXOZD+jiNQndnCaqzFZ
         /myAEel/A4Bf9Cx6JjnKiPegSx3qtVBWfZOqNmsIMYTUEE9nvkxADbR6kqruZ1trTv1d
         YlPYiH6u+UeDgG/zZzJ7iEv84gW1mB94Or95wBefpAQYFEERluZIXrLPxyRt2nL2xttV
         oBaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=NgMpOyHgT4tLe/3pZX4/Fh1+jmri4pwwdDC4ZMxFH0Y=;
        fh=nVl+1hB/Va+qrUTERQbZgDdBSpntLvZqsTotDce7tRE=;
        b=JOijuXklvcnGnCSXEvMsLzYKPSMweb+LCxuRLkYnYUa1TF2INgRmrR37jNCGXUDgky
         dtF8JWvmm1v2ww3/0icy3o9VUfOxW+l1h73IjG5NG3VzILLwAL7jE8oy8QylgLuDSbg4
         eOrlAZGHLX0sh6al/QEnWjG70l8s09xVDibk74GMgMO+N74q/2gaFjRHvRX5bX4JT+tT
         RFSwNYPMlWUl8sYojv0V78nnjgJY51JT9Eg5vZrL6YAdgV8MydpOBl5fefC3hvoTBi9G
         MFA7USuDDvoD/FSYmH6SHDSqrglq6D6pnt89kB7+NDqlsLk/yCFDQXaKrK8aiwmvtEhV
         R8dw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793470868; x=1794075668; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NgMpOyHgT4tLe/3pZX4/Fh1+jmri4pwwdDC4ZMxFH0Y=;
        b=04myyEPrHwLG0x07mujSWVZU0/8AkEqECvAmORwOikLlblI/X3UQpIp7WpyPbWYAcf
         3FMOrw23touvviiO3Jar40xSdBUQFuJ+Wq0mjuAmXm1FIBezF2KUJOtLTMT1jj/sxsD1
         9Fv333P00EvMMjZWF5uGbm4xd1MTuDcbkQvpyjEhpIjKpWC2zcD7VdHMKhXjws/bc77I
         0TvL73mhBqQ7gCf1oR5POQ0NWEGnHkZtCaUFWycdWHy22G2sJXMMRpAHtnC/Hun6NxVA
         WwmObMIntm+QXDpTKoRE2zS53dqr3KcC3a/JzkpJjLie0O8FdzKmApDtyue0gj47TGwf
         wtGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793470868; x=1794075668;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NgMpOyHgT4tLe/3pZX4/Fh1+jmri4pwwdDC4ZMxFH0Y=;
        b=usaM9Y2tFd4LuQRdKgbuAAzaATDNQthvhasrQE7zNQ4BI5l93aTAsVOMnHSNdWfAHE
         Zhtt/2Es11tJjglP5+gOkqI9J+EiF/Vs8jjYV4wMbKfxbV0rpZ4tl2C4cUEUGzhrXem3
         VgBn7AwL1Q1XCSbP2bj8lEKLyW0BAs8F2druDQU16JMcvDRIGueJt6n1Cg5Q0MT1/P2X
         w5rIlD/5RwMype5CbL7Okr9eWBOFAqnEHZ/5N3x1IIq2914lII5qQZWxGb9UUOLtwDie
         3tqMrXQVnxj5yqBD1xB5LIuIO6GTWg+Ru3ky3V5Q66sn/wGlNO1kxyQHdnefMzexCmQB
         QIMg==
X-Forwarded-Encrypted: i=1; AKwUvBzkh5H/DVgp7iZ4yvHKv/EHlLow2JVCvSJwcKG2o3suLbPHqOQ+YGal66LZxfebuen3zrs2VY36xRCqkAI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJuVCQtruR9jsvNEhgp/MjCJyHwVEfXEouJeHqQY+zvc2Zh7jGV
	r5+bRzycKa4g7wIMyPc+gMSxx9tLnATVnj+JFxdqbMy8QD/kTyij7HjzcQo2sqb3dP0Xw5s085N
	sSqBS0LUMM0iqyleMmp8s0OT7KpHT2f2g5f6OlQGRgeISEzU=
X-Gm-Gg: AYBFou1C2VA5eYrPrAurt6FYTIAHtnuYGyet1hsFYaJO1wRV1+u/yzK2FiHP1znW85p
	6j5DexKlh2lw1ZpyvcxymG1+P5qk+FME9dhqh7axbxpaMBRD0nvoH0m0fNDpBwY84ND/ZvoLrgU
	U1IR+R1VVvpKp0JX/WFZDbWskhxxs7eovplnvjE660dIuPLjz+G/Ita4xfPDG0ycztHafWeAd1/
	GFsb7L+a6Cn8GpQxxviCMhx57QS0u+7Vw61j0GHyMG1GRYroQw5G8yMq2Cy/N7hrzNpDa20c4JX
	PMIQBSxXSMEIy+ORpd308yYwY5YPGf/iL4KZxQE/hMTAf3oYz+nuAOHNdGC93GBFXR8lK5bHyrH
	GvLdOXcOGBCaRfHmr+OVx8XPAEET7wTVrt3c=
X-Received: by 2002:a05:6512:308d:b0:5bf:a352:a495 with SMTP id
 2adb3069b0e04-5bfd951f97dmr1794940e87.7.1793470867755; Sat, 31 Oct 2026
 11:21:07 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Regen Yang <regentropfen.yang@gmail.com>
Date: Sun, 1 Nov 2026 02:20:56 +0800
X-Gm-Features: AclHuK8Rrtbz_U38rdfB6lwuC-3qHVr2RDd8rO5whZdmmhGHeCiNbkOP36xafaM
Message-ID: <CAJze65gQg=q2OW-1n5wT6vah8FnjxD9rsPCsyg4HspOB42o53g@mail.gmail.com>
Subject: 
To: Shuah Khan <shuah@kernel.org>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

run_kselftest.sh sources runner.sh under /bin/sh, but run_in_netns()
uses Bash's &> redirection for running a test and deleting its namespace.
With dash, this backgrounds the command and performs a separate
redirection-only command. Consequently, rc captures the successful
redirection instead of the test status, and namespace cleanup can race
with test execution.

A failing test run with run_kselftest.sh -n can therefore be counted as a
pass and return success. The totals can also appear before the test
result, and skipped and expected-failure tests are counted as passes.

Use portable stdout and stderr redirections so the runner waits for the
test and namespace cleanup, preserves the test status, and reads the log
after the test has finished.

Fixes: 9d0b4ad82d61 ("kselftest/runner.sh: add netns support")
Signed-off-by: Regen Yang <regentropfen.yang@gmail.com>
---
 tools/testing/selftests/kselftest/runner.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/kselftest/runner.sh
b/tools/testing/selftests/kselftest/runner.sh
index 45fb8ec38493..38b364da2573 100644
--- a/tools/testing/selftests/kselftest/runner.sh
+++ b/tools/testing/selftests/kselftest/runner.sh
@@ -186,10 +186,10 @@ run_in_netns()
  fi
  ip -n $netns link set lo up

- in_netns $netns &> $tmplog
+ in_netns $netns > $tmplog 2>&1
  rc=$?

- ip netns del $netns &> /dev/null
+ ip netns del $netns > /dev/null 2>&1
  # Cat the log at once to avoid parallel netns logs.
  cat $tmplog
  rm -f $tmplog
--
