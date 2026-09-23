Received: from mail-qk2-f43.google.com (mail-qk2-f43.google.com [74.125.230.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A4A13FE64A
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 21:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790198850; cv=none; b=tsuB81YPGYXDA7a8oRDvDGJ1aSfWyra9UxdKghxsAe+LA2uN+T+FVf8xVFFDPKWcLyRO1fkmw88ygcmBTOz5h9C9MpIYfgGkWMjI+if/YyONXgWz/Gc3O4zD3UfrylOMyqqObXyltkr90msw70JqOFfX74woiMLYsCmuV9c4TdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790198850; c=relaxed/simple;
	bh=mkllFitehUiHcmTvhleoFTAEeeQDf9V9+bo50ETCWgE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UGG4GHdiIiX7bhZsVmJ5Jzbu9aJsrHsak1Lbnybra+44FO3fA2Te+M9om0bXDAYWME4DY2SDGcjZWIEiBsKS8exqlp9WvGt7WvmrUaVjCu90kjyfl3z3IFDotl/KGc+HYK9s9dYZBT7wLNGh53LNFwjp/BAGfD7kzAJPIzvJtBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=QAl4XaJL; arc=none smtp.client-ip=74.125.230.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="QAl4XaJL"
Received: by mail-qk2-f43.google.com with SMTP id d75a77b69052e-532db7db0c6so11457221cf.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 14:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1790198845; x=1790803645; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PcUop+HZQcR1eSCakcCGo/nA+544kosGhnj83z0mc1s=;
        b=QAl4XaJLfWTcEjCbmFDZyfxjxbSRRonMFfCcpp9GApt2uEFHHYod3l2E1g1CUgtIdF
         FvT5NmNsnrdK73UYC1FkazeeoKD3gevv+zHL9F65S6nQJl3wuqF8sVRETdELJcanwnYN
         UQQf5zhU07/4JVVpY1q6KDHhfiFXD11Uv+AaG5DFvCZggQ94ax1uJiSxQJvBxBVT2SMy
         thhagTV36EMRj32iYmQXJG0HHR2dofZerwBYKuUcyxADJGXGxcRjzqDGhOfx07NHNINf
         ZxOMPJOfNDs/7N++75TDagDSy2vYcVznpqA8dMlpeAQGflrRfiuJDrg+M3Y50Q8oTOAV
         89+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790198845; x=1790803645;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PcUop+HZQcR1eSCakcCGo/nA+544kosGhnj83z0mc1s=;
        b=Xoaw6pIfZQkJ9ozlHuI/5jn42r7iYrBhlrnUtxRXXjvGbaCjvhTJL9qW3P9I12URsN
         mAWoBocpKbyzRVBwWTqMJ5oNBLgtftEKIZlWq6rvxVETfECFSVMECpnF1jOPKyKnNhYJ
         U4MlD18Qm12tRmERRBp1zsgq3Oy1QFJmZDPS7k4KrsGQIH/he4McEFBlefGLK2jspEtV
         r5oe16r8UZf7sdqi2MN+be8a8sO6RwvoIPkXDXYWmHcNZX0ZDT3bJZn6vSwCDR3s8RNX
         bx/LyKromC8tnldSv6XqlcYTIrju4JMeqxm1bxbZCDHQARSKPknV5V6qnKopHeBlAifJ
         V0XA==
X-Forwarded-Encrypted: i=1; AKwUvBxCL2luyIPv3kzmKk9gv50QcqhNfF3r9JGryBuWD1zKkSI3wBvAAdurrj/OLZZaOTdSjbQXBy9ysgk17pY=@vger.kernel.org
X-Gm-Message-State: AFuF++k2D/p9rVFS8wy6ZiMgCVTTB+77tvotQ9PVk+A299zYGq5r0G4z
	iuPi631sfQ7AGspqDkyVCT/2jmPzvLjKJ/b4sJf8AnT7/BF2iuVwmRsS2HxYpmIf+9c=
X-Gm-Gg: AYBFou3enhisxZErsBqVq2crgg+mvPTWPZ52xd92kZPpmw/9xqe/H5KKZxGMSLEcyYy
	ibPGnrTbIUAkOMw60zkzvR/W/SuXK0xDiMUNcRa+JinHp/7Z9GhCIJJLeSK/5aiFJmfcGWQMHYe
	Tm9RmtOwgFSWh2fk/OvB5ytqEMP08DYFoBKZPpfNr+cjA0rRt4PKrz6pNTJlvwFU+JO/O2lcKLL
	R4zbUEvRlPyjLVHBRzS9fGs7jseMWap11PVL3j3Bubel6eblpAWuUb39+6VKNCp1zvEn/GCa4TV
	FxM9OBCgrCxq3qPzXWCkKYxm6bQrsh5ZCzXj8XikHvieT0VQl4dD5UftaT0pje7kg7iqIIQaEEI
	yNbNZ2aKgHmMMK6iZhk5RgpOVM7oC18Fm6lags+D5uE0suaeHK5f4FFvUQKKGuslM1A1v3kQG+A
	TTboXKOrR9JIngbpr7651dLaPFJcutAMmc114rf8oIrUcgDW8sjwcYa2tiBgSLbo/lIZedbeZtA
	slVx6r+3GkVYezrbI0VkOoWNBipkLqlbJKbuGSIO87rzAWtuz0sr2t4
X-Received: by 2002:a05:620a:1724:b0:939:9b1c:ea4c with SMTP id af79cd13be357-93c3470cfd4mr78173685a.28.1790198843910;
        Wed, 23 Sep 2026 14:27:23 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9141e27b5c3sm3228816d6.30.2026.09.23.14.27.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 14:27:23 -0700 (PDT)
Date: Wed, 23 Sep 2026 17:27:21 -0400
From: Gregory Price <gourry@gourry.net>
To: Park Tae-sun <ts930@dgu.ac.kr>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>, 
	Brendan Jackman <brendan.jackman@linux.dev>, Muhammad Usama Anjum <usama.anjum@arm.com>, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/mm: fix mlock2 errno handling and false PASS
 on ENOSYS
Message-ID: <arRD62HaBCs4Svcz@gourry-fedora-PF4VCD3F>
References: <20260923-selftests-mm-mlock2-fix-v1-1-750b627854c6@dgu.ac.kr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923-selftests-mm-mlock2-fix-v1-1-750b627854c6@dgu.ac.kr>

On Wed, Sep 23, 2026 at 06:26:48PM +0900, Park Tae-sun wrote:
> While inspecting selftests/mm syscall wrappers, I noticed that mlock2_()
> in mlock2.h handles the syscall return value differently from other
> wrappers:
> 
>     int ret = syscall(__NR_mlock2, start, len, flags);
>     if (ret) {
>         errno = ret;
>         return -1;
>     }
> 
> Commit 1ddae9d67ee1 ("selftests/mm/mlock: print error on failure")
> introduced this intending to make mlock2_() behave like libc by setting
> errno and returning -1. However, glibc syscall(2) already returns -1 on
> failure and sets positive errno. Assigning "errno = ret;" overwrites
> errno with -1.
> 
> To verify this, mlock2 was disabled in the kernel (via sys_ni_syscall) to
> return -ENOSYS. Testing revealed two interrelated defects:
> 
> 1. In the unmodified test, mlock2_() clobbered errno to -1. The check
>    "if (ret && errno == ENOSYS)" in main() was bypassed, resulting in an
>    immediate crash in the first test:
> 
>        ~ # ./mlock2-tests
>        TAP version 13
>        1..15
>        Bail out! mlock2(0): Unknown error -1
>        # Planned tests != run tests (15 != 0)
>        # Totals: pass:0 fail:0 xfail:0 xpass:0 skip:0 error:0
>        (exit code: 1 - FAIL)
> 
> 2. After restoring mlock2_() to directly return syscall(), errno correctly
>    retained ENOSYS (38), entering the ENOSYS check in main(). However, it
>    then called ksft_finished():
> 
>        ~ # ./mlock2-tests
>        TAP version 13
>        # Totals: pass:0 fail:0 xfail:0 xpass:0 skip:0 error:0
>        ~ # echo $?
>        0
> 
>    Because ksft_set_plan() had not been called yet (ksft_plan == 0) and
>    zero tests ran (ksft_pass == 0), ksft_finished() evaluated 0 == 0 as
>    success and exited with KSFT_PASS (code 0) without any TAP skip header.
> 
> Fix both issues by:
> 1. Returning the syscall() result directly in mlock2_() so that errno is
>    preserved.
> 2. Calling ksft_exit_skip() on ENOSYS so unsupported kernels report a TAP
>    skip ("1..0 # SKIP ...") and exit with KSFT_SKIP (code 4).
> 
> Verification on the mlock2-disabled kernel:
> 
>     ~ # ./mlock2-tests
>     TAP version 13
>     1..0 # SKIP mlock2() syscall is not supported
>     ~ # echo $?
>     4
> 
> Re-enabling mlock2 in the kernel confirmed all 15 tests pass cleanly:
> 
>     ~ # ./mlock2-tests
>     TAP version 13
>     1..15
>     ok 1 test_mlock_lock: Locked
>     ...
>     ok 15 test_mlockall_future_droppable: droppable memory not locked
>     # Totals: pass:15 fail:0 xfail:0 xpass:0 skip:0 error:0
>     ~ # echo $?
>     0
> 
> Fixes: 1ddae9d67ee1 ("selftests/mm/mlock: print error on failure")
> Fixes: 65c89684896d ("selftests/mm: mlock2-tests: conform test to TAP format output")
> Signed-off-by: Park Tae-sun <ts930@dgu.ac.kr>


Reviewed-by: Gregory Price <gourry@gourry.net>

