Received: from mta1.migadu.com (out-72.mta1.migadu.com [95.215.58.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 403492253EB
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 00:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791765228; cv=none; b=l5ftxWirr3pWWD/aPNmSiAOKGKqMmiMRjqiVnGcGIXXAn1bnV0Z2NCPUOVhmCK6y/3nyjbpJMA2ONTlfsTFX43g7kIMfqO3mYJcsI/bbwdG5r2GLwiXOljJfEwGspP6q4xw579Vaa5EZhOPGoOg+XCh3TthA4AxdEqDRgdpMSbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791765228; c=relaxed/simple;
	bh=A2FhU4MuJrHd8/v0XQVjBT/Ve73V1hi6TGe39ZtD+us=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZTmcfXi61dl2wzIfBLkW6OrFD8p7uhn9G9OZo5afdEruFQTIxIkB+4SumVnCKR0aGFro8FSQB+bc8s3oXxNo/T+dOMPPPBfOdcaDUPTj4MES2Ij1RJ21l84PPKGTXg1KZs6r0BkBVannkazStyrd1Z/om6n+ybKSpQDaKmwK6ZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=RBMk80ND; arc=none smtp.client-ip=95.215.58.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="RBMk80ND"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=A2FhU4MuJrHd8/v0XQVjBT/Ve73V1hi6TGe39ZtD+us=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791765225; v=1; x=1792370025;
 b=RBMk80NDpXKeQ5ttoN8JcctbGvBNnJ4Ps8rVmSKIIx9nOC/g7b2OkJA1CAcPkxhLFKNQI2L6
 xgGV0eKFx75tFOiJBARNfm6nIVU63RRiT3Ij6w15Camj9g0Py9pxeMVY3qdAsUajX2Vl2pZSyN3
 upbh9WHOnzDcfzNfzmHmj19I=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 7e21eccb68bbde6a;
	Mon, 12 Oct 2026 00:33:44 +0000
X-Mizu-Trace-ID: 7e21eccb68bbde6a
X-Migadu-Flow: FLOW_OUT
Date: Mon, 12 Oct 2026 08:33:33 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: netdev-bot+sashiko@kernel.org
Cc: andrea.mayer@uniroma2.it, davem@davemloft.net, kuba@kernel.org,
	pabeni@redhat.com, horms@kernel.org, shuah@kernel.org,
	edumazet@kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	liuhangbin@kylinos.cn
Subject: Re: [PATCH net-next v2 3/5] selftests: seg6: move SRv6 End PSP setup
 into its own helper
Message-ID: <aswq3SlvWG_ydFQR@fedora>
References: <20261009-srv6_flavors_endx-v2-3-56ac7f838f41@kylinos.cn>
 <179162766399.434549.2048681726157385482@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <179162766399.434549.2048681726157385482@kernel.org>

On Sat, Oct 10, 2026 at 10:21:03AM +0000, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found more severe
> issue(s) in other patches of this series. This mail is only an FYI, in case
> you want to address the nit picks below when you respin.
> 
> Low priority / nit picks for your consideration:
> 
> - [Low] The comment in cleanup()
>   (tools/testing/selftests/net/srv6_end_flavors_test.sh, lines 328-330)…
> 
> --
> 
> selftests: seg6: move SRv6 End PSP setup into its own helper
> 
> This commit moves the End PSP policy setup out of setup() and into a new
> helper, setup_end_flv_psp(). host_srv6_end_flv_psp_tests() now calls that
> helper with set -e and SETUP_ERR wrapped around it. cleanup() also changes
> so that a setup error only gives SKIP when ret is not already ksft_fail.
> 
> > diff --git a/tools/testing/selftests/net/srv6_end_flavors_test.sh b/tools/testing/selftests/net/srv6_end_flavors_test.sh
> > index 30a939392eea4..5ebd6a0344d69 100755
> > --- a/tools/testing/selftests/net/srv6_end_flavors_test.sh
> > +++ b/tools/testing/selftests/net/srv6_end_flavors_test.sh
> > @@ -328,7 +328,7 @@ cleanup()
> >  	# check whether the setup phase was completed successfully or not. In
> >  	# case of an error during the setup phase of the testing environment,
> >  	# the selftest is considered as "skipped".
> > -	if [ "${SETUP_ERR}" -ne 0 ]; then
> > +	if [ "${SETUP_ERR}" -ne 0 ] && [ "$ret" -ne "$ksft_fail" ]; then
> 
> [Severity: Low]
> This isn't a bug, but the comment above this condition in cleanup() still
> says that any setup error makes the selftest "skipped". Should it be
> updated to match the new condition?
> 
> With this patch, host_srv6_end_flv_psp_tests() starts a second setup
> phase after router_tests and host2gateway_tests have already run.
> 
> Suppose one of those earlier tests sets ret to ksft_fail, and then
> setup_end_flv_psp() fails. cleanup() then runs with SETUP_ERR=1 and ret=1.
> The SKIP branch is not taken, and the script exits 1 instead of
> ksft_skip.

This is intend. The test should report failed instead of skip if a test failed.

Thanks
Hangbin
