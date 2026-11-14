Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.164
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794638777;
	b=jKaxHmsr/eqs6UdSdIRaHNS5m/X+FrepzCg/2+mD+jdZu6g60pWGfvXdLjrz2SOwPHr8
	 oZrXEJYRPFb9Kg+4J+uxj9vNRMv3erh66mp7K4LRdMQm8ZGUbW2wPsAEXUno0VEKuujSs
	 q1wD9mH2dnoTuJ/1S8rDqacCL2rAVYxUdrZJfhbmlzyAAHwUaKVybzX8laHa09FLJVyaN
	 P0chk5Y7pq2NVjUNd2apHYXj47GIy7yed5AH6dVw2YoxcMQUxqtTYvJjHKtvfU9CuiOu/
	 UFULuQYpMtrHormddZJ620H7basqmb2TTO/6P54+0+Bhx5GRs4CSC+hbqCkqiwFZi+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794638777;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=AaPwVUrayMcOL53EO0YjPrtEQPyzLJXQlPQueQUBdho=;
	b=BzdzJmu+a8EblWFdnGIKQ9wIS/V8pKy0KT9T7Y0TWl9XZbS0HH8gP1N/Cf08oeS2DzY+
	 2iapxByoHz1ebrR74u99OjIkB739xG2BfuC1wnUAfYq9AlTcW6aUIF5PDWOLtMLFPN98c
	 VN0UWXgiUZ0U4IMULm148SmdIcL0mHxVKnSAOvYuIKUtEyEnOXAeaa6/HNiE/u9vT2RaM
	 ZUcukh0cQoUuqVDx3CMRAyjEboqYzfupEz73dUAyjZrttKucfNnHJP02vDlgRbQ0l2+4Y
	 qf/5EPaejgFwG3utELaVVEwDug05Q2KZIBneamu4vTI1Rg7ORksPjVx8iomLkWIn4iA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wyuan.org;
	spf=pass smtp.mailfrom=wyuan.org;
	dkim=pass header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=Y+jzMvuE;
	arc=none smtp.remote-ip=95.215.58.164
Received: from mta1.migadu.com (out-164.mta1.migadu.com [95.215.58.164])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CCE9606A880
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 06:46:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CCE9606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=Y+jzMvuE
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=3cJyP5lKJCHlA77XpqOzvcgkBdaNcWgWzFkwIUEImyo=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794638774; v=1; x=1795243574;
 b=Y+jzMvuEampRL11n2cXF4oeIWscStxjd6yScIQGZFMaNzaYV6LCq1bJKH1ZCzdOfYmXnlx10
 f3r0q2xpbgexD5QlfU/0dqKC7xHYTZeh4u4is5gHAFAptf9dA+5bpErzBUSw6SclIkrwT9ukowC
 sWLtvAJG41tx0GP5HSx/yl7wP896y5hDTHfgdqgz3xPE072LUTl81++30ZWcqRqPPu7ylxriiFu
 j4SEj/43W27ganBu/Gms8qSTt0zRs6XmCsujolwz0n/Y+N1DlgvAtFOFLEq4UzWQC2+gfFEi0nO
 Pd6B05DjwgOMX7lhhQThgQt7eyfW3QSsa7j2GHAMtthgA==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id d22ed1a8d6056b74;
	Sat, 14 Nov 2026 06:46:14 +0000
X-Mizu-Trace-ID: d22ed1a8d6056b74
X-Migadu-Flow: FLOW_OUT
Date: Sat, 14 Nov 2026 14:46:03 +0800
From: Weijie Yuan <wy@wyuan.org>
To: =?utf-8?B?6Zey6YCb?= <2368492046@qq.com>
Cc: corbet <corbet@lwn.net>, mchehab <mchehab@kernel.org>,
	linux-doc <linux-doc@vger.kernel.org>,
	skhan <skhan@linuxfoundation.org>, rdunlap <rdunlap@infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/4] docs: kernel-doc: fix export selection and error
 handling
Message-ID: <avgDq_FrLSbuC7bK@wyuan.org>
References: <tencent_9BF64A4FFFB7B990DD5E6D6CF26C43565306@qq.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <tencent_9BF64A4FFFB7B990DD5E6D6CF26C43565306@qq.com>

On Sat, Nov 14, 2026 at 01:40:28PM +0800, 闲逛 wrote:
> Hi Jonathan and Mauro,
> 
> This series fixes four reproducible kernel-doc issues:
> 
>   1. Multi-file export filtering reuses the first input's exports.
>   2. Environment warning-as-error settings do not affect the exit status.
>   3. YAML error paths call sys.exit() without importing sys.
>   4. A separate -export-file triggers a missing-xforms TypeError.
> 
> Each fix includes CLI regression coverage. The warning-policy tests also
> cover KDOC_WERROR=0, empty overrides, and command-line precedence.
> 
> Validation on Windows (Python 3.12) and Ubuntu 24.04 under WSL2
> (Python 3.12.3):
> 
>   python3 -B -X utf8 -m unittest discover -s tools/unittests
> 
>   Ran 131 tests: 127 passed, 4 existing expected failures.
> 
> The series is based on mainline commit
> b3dfbde62cf1981c4638939c159dfd087b7a72e9.

> A complete Sphinx documentation build has not been performed.

May I ask why? You could just run 'make htmldocs'.

> I could not verify docs-next because the server's TLS connection
> failed; checking for equivalent pending mailing-list patches is also
> incomplete.

I don't believe you can not clone Jon's repo and checkout docs-next
branch. Is there any reason? (Looks like git.lwn.net is doing a pretty
good job of keeping AI crawlers out.;)) And I suspect that this part is
the output of your agent. :)

> Codex assisted with reproducing the failures, preparing the fixes and
> regression tests, and executing the tests. The task was to inspect and
> repair kernel-doc behavior in a local Linux source tree. I have reviewed
> the changes and requested that my Signed-off-by be recorded.

Thanks for the disclosure, but this may not be put in the commit message
of your patches. They should better be under '---'.

And please see also: "no attachments"

https://docs.kernel.org/process/submitting-patches.html#no-mime-no-links-no-compression-no-attachments-just-plain-text

Thanks.


