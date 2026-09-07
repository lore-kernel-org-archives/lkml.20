Received: from mta1.migadu.com (out-68.mta1.migadu.com [95.215.58.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A5ED2E7367
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 02:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788749508; cv=none; b=qFBBF+1VmADMW488qXZkUtjUF/dzgBPYCU+bXOvM/LexnqTZmEXaiWNk8Yzn79jmJx1QdEShNlW6AVGHg1YIqLUN1z5spSCHqeqNXh5Ax8yIR5SAxw4JNoLonGqFEy0WRiWVVsF1BXlPJVDQPVQPV0VR00bt8wgIMSaoRxmqHgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788749508; c=relaxed/simple;
	bh=SxzjzX434z8T2FekJgnAJrbYVmucvXUWeYnZppPlDZk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=itT+dOt9hxx5EHiu8co9XFZiBKq5igR38RA9Tm2sHJJr07IxLBUVC/oYdhXQsK36tFh7S4pf4RAlUn+juHWhg5/bUCEoOE3LSNUl56iH6e9Vi0f8cMGaswLxPnegGc5w5XEeiIoOF/b25SJ1TlMm74d/+lJBil/ZMkEPvylgQjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=huIfSwIq; arc=none smtp.client-ip=95.215.58.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="huIfSwIq"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=SxzjzX434z8T2FekJgnAJrbYVmucvXUWeYnZppPlDZk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788749504; v=1; x=1789354304;
 b=huIfSwIql7bAvbMpbjCxU61Sb0KuWhQA5LKrw5Tmf4hu4wQcF93B2UDAoYOqsaodDIXoUIrC
 Ss8XVdrvDB91JSYoHlV4FQ3/UH4KrMcCo56t7/8IQjO2iaAhSMiBWL7aKQfvkJT0q3ENEYX2BZ5
 dedx2FmhrvgSbtkv+fOxYZLk=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 209a31feee9fdb3e;
	Mon, 07 Sep 2026 02:51:33 +0000
X-Mizu-Trace-ID: 209a31feee9fdb3e
X-Migadu-Flow: FLOW_OUT
Date: Mon, 7 Sep 2026 10:51:23 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: "Matthieu Baerts (NGI0)" <matttbe@kernel.org>
Cc: Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/lib.mk: run_tests= print summary at the end
Message-ID: <ap4mq02KukH7W8kI@fedora>
References: <20260625-sft-run-tests-print-totals-v1-1-bfe588266249@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260625-sft-run-tests-print-totals-v1-1-bfe588266249@kernel.org>

On Thu, Jun 25, 2026 at 06:22:19PM +0200, Matthieu Baerts (NGI0) wrote:
> When there are many tests and/or many log lines, it is difficult to
> quickly find out how the different tests went when running:
> 
>     make -C tools/testing/selftests run_tests
> 
> This run_tests target executes 'run_many' from runner.sh, which relies
> on ktap_helpers.sh. At the end of the execution, the KTAP_CNT_* counters
> have been populated, and the total can then be simply printed with the
> ktap_print_totals helper.
> 
> Now a summary is printed at the end, e.g. here with the two last lines:
> 
>     $ make -sC tools/testing/selftests TARGETS=(...) run_tests
>     # timeout set to (...)
>     # selftests: (...)
>     (...)
>     ok 1 selftests: (...)
>     # timeout set to (...)
>     # selftests: (...)
>     (...)
>     ok 2 selftests: (...) # SKIP
>     # timeout set to (...)
>     # selftests: (...)
>     (...)
>     not ok 3 selftests: (...)
>     # 1 skipped test(s) detected.  Consider enabling relevant config options to improve coverage.
>     # Totals: pass:1 fail:1 xfail:0 xpass:0 skip:1 error:0
> 
> This summary is printed, using '#' as prefix to be treated as a comment
> in the TAP format. The summary is also printed when summary=1 is used to
> redirect log lines in different files because it still looks useful when
> there are many tests, not to have to check each line.
> 
> Note that this 'make' command will continue to exit without errors
> (returned code is 0) when the tests can be executed. I guess it is
> better not to change this behaviour to be able to continue detecting
> kselftests failures.
> 
> Signed-off-by: Matthieu Baerts (NGI0) <matttbe@kernel.org>
> ---
>  tools/testing/selftests/lib.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/lib.mk b/tools/testing/selftests/lib.mk
> index f02cc8a2e4ae..de15e63bc6b4 100644
> --- a/tools/testing/selftests/lib.mk
> +++ b/tools/testing/selftests/lib.mk
> @@ -106,7 +106,8 @@ define RUN_TESTS
>  	if [ "X$(summary)" != "X" ]; then       \
>  		per_test_logging=1;		\
>  	fi;                                     \
> -	run_many $(1)
> +	run_many $(1);				\
> +	ktap_print_totals
>  endef
>  
>  define INSTALL_INCLUDES

This helps get a clear summary for make run_tests.

Reviewed-by: Hangbin Liu <liuhangbin@kylinos.cn>
