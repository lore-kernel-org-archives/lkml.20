Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2817B3D6CAA
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 21:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788990065; cv=none; b=WZlSgll7MEs+gsK/5MFpWqoCVuQV4T+fpEcyU7fMogDqLaV/5/3bJB8pPK/5RzUYtRhoT0dje2qVrEGktjNCkLsI/mK7wOlILYaXpd6e2OkjzBLPtpOQ/jZUjl8pUj40nldEBnadbnCDRUYwB+hr+141RcQR4S228IqR/HoYP2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788990065; c=relaxed/simple;
	bh=EqoYwk4Ts62ySjDOF/6WGrqI75EaG2zkY0Xm84rY1As=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JH/UZ0ev21fNi8Ft65mgRyTmWC+R5dEHnqHjGFMXiQmBHBCNxATc6tSgfK3RKxF0UjKbq0b1/q4qQAQ465KjCMojARFFJe8kT6joWCFL85BlkCn2cDhtgfvKvT7Pz1yM+g8pGHlUwc4mQYOjGTc5euSZXPRNK8B7JKnS8x3NR5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=f+5R6J2/; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="f+5R6J2/"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2d942c7cc2fso55030055ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 14:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788990059; x=1789594859; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=laxcxAy6OrDTYTV8oVpLvlCb5cwnJq4gntL3hU2NYlg=;
        b=f+5R6J2/0Nytfk6I1eX1iPbdAA0qUgmSEwiCcCwIWP48kY4/urMMoYSyDb5xDgXxUu
         1czDmgtbYcBTqwTE/oZwUPZV+GqqUnIMpD0MaoUHRDjm0fbpz+9JVQrXOBOlLpINuykr
         FLpbXY97yYe52miWFQn9tn8YbwB+eDoOjGmgchKxfCHvEF86O7+kTBPAb07ui04/u7iE
         RA5I3EpyPdpgsxwqsydS/5QUzIp8jhHKXCgScE3XEw3jhWs5QW/g3997kZP3EmFYqQG3
         s7Kw2ZEtFtaTp8F2LaRy+QGLQVDnUcM0GAMH38vCdZUT/WNJ1rRrzOeURqZ8cU//4fHm
         Biug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788990059; x=1789594859;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=laxcxAy6OrDTYTV8oVpLvlCb5cwnJq4gntL3hU2NYlg=;
        b=f4NKVEDeQjAIZknsT+Md3B7WIcoaM8ENCldDloLQtj72+6jCC06TV3tL/+lkZH5zfc
         VNXpqZd3UkE7XOJIDLaAUdT1j2iO2LRWBP+QFedOqB2u29yg3JdZBZiEI2kd08BksxZK
         OhdsP96El1qPh9rpQYqAQNTlVxSKThVGXDpril2broYcOxG/sJfmrNuNmB+wSiiIheYS
         Ck71Bj2dtXQYeNdSVgN8j37boZk3DnSdGp4TIFpoL/UP61dZjFkqe7lumTfAl88MAfVH
         86G6SRVoIfLP34nhT0CrjITf8W2XDRcit2/cNq4ymwfuqusqQqkKPZzzEL91BwCDb1zZ
         awdQ==
X-Forwarded-Encrypted: i=1; AKwUvBzFkFAxQ8my59l2WwRmoMwQMfY4ZgCmG2rSMZKPhJiywSN2wz70NbtRM5+yWsslnJ9uF93+J87w/ug5Jwo=@vger.kernel.org
X-Gm-Message-State: AFuF++mjoZoQlThmIrfuyk8mrP2UnWsbWhuBVGWTzgta3U93apW5VMen
	a1jLqZ2Oe/H2sdE+m0nBpNt7C2fACwjqmepuApzLh4laGyEYY5JfjMsBXAAd06yhL9++a/DMALt
	IWbv31Q==
X-Gm-Gg: AYBFou2xKa+nSiTw/WToUjRKXAR8/R+pZyjflI/pIBVeK24fh37eDEhb0EobYg9Qk9j
	sMlR5uhPFLG0PgTsQ2ty5Mj/ogERJP7sYBX2A55fOz/PTM/zr7aw8/Mou9Wv3hV7oI1z+pLDkho
	G382a6JCyP/rUrcGVEi8/08Yku++g2KrMd2oS9dK0+Kr0W92dh3bGJa80dq/nDY6+XQsI4cNoJN
	LhwL7fw0dCUHqJNonyoWAjel/quSo0Npv2EQegI6q7d6j4VMQuTLIfo3+aCfmLqVW/LerpQsCSL
	Vff1oaj0JaKkePzYm6JcI0HjcVX6ZIJkv0WbJm6SLo112myUaYi7SAeIHrt2XxHSzQQtxwBDLeP
	4WMdxUqpa7YQwhGpNzbrbTCG5NtveUCEN7K4XWZZ6MOULFo51agn7fFIuhN56YTVG88YW07wgrJ
	Sbw1j7YBMZla5n3/G8gHw1ibwrnhOq3VY+LkL4Hp4VMynKqJtBJqEr7tzB4gaaRuNtTb13QDMWm
	Mnf3V/m0sgWUifTV5/25IVlxn/rW6A0pOwYzZXn
X-Received: by 2002:a17:90b:384b:b0:38e:524:8797 with SMTP id 98e67ed59e1d1-39b261e79f1mr53396746a91.13.1788990058864;
        Wed, 09 Sep 2026 14:40:58 -0700 (PDT)
Received: from google.com (132.200.185.35.bc.googleusercontent.com. [35.185.200.132])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d7e840f3asm78161a91.12.2026.09.09.14.40.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 14:40:57 -0700 (PDT)
Date: Wed, 9 Sep 2026 21:40:53 +0000
From: David Matlack <dmatlack@google.com>
To: Alex Williamson <alex.williamson@nvidia.com>
Cc: Alex Williamson <alex@shazbot.org>, kvm <kvm@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	Jason Gunthorpe <jgg@ziepe.ca>, Kevin Tian <kevin.tian@intel.com>,
	Yi Liu <yi.l.liu@intel.com>
Subject: Re: [PATCH 2/4] selftests/vfio: Wait out transient -EBUSY on
 open/bind
Message-ID: <aqHSZY2IhWfK-jhl@google.com>
References: <20260901215358.2421359-1-alex.williamson@nvidia.com>
 <20260901215358.2421359-3-alex.williamson@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901215358.2421359-3-alex.williamson@nvidia.com>

On 2026-09-01 03:53 PM, Alex Williamson wrote:
> If a test is killed, for example due to timeout, fput can be delayed,
> allowing the subsequent test to be started while the failing test still
> holds the device open count elevated.  This results in a cascade of
> failures as each subsequent test fails on open, blocked by the single
> user requirement at the group or device cdev file.
> 
> We can make the test framework more robust, and allow better
> identification of specific failing scenarios, by waiting-out transient
> -EBUSY failures on group open and cdev bind.
> 
> The 20s retry window is heuristically determined in testing on a system
> where scheduling can be significantly delayed due to SMI handling of
> platform errors generated from the mix-and-match test.
> 
> The SR-IOV uAPI and IOMMUFD setup tests retain their non-retry bind
> paths as these are not expected to encounter process kills due to
> underlying platform error handling variability.
> 
> Assisted-by: Qwen3.8-27B
> Signed-off-by: Alex Williamson <alex.williamson@nvidia.com>

I think we should fix this in kselftest_harness.h instead.

If the poll() times out the harness issues SIGKILL but then does not
wait for the process to finish exiting (waitpid(..., WNOHANG). If we
drop WNOHANG then the harness will wait for the killed process to exit
before proceeding with the next test case.

diff --git a/tools/testing/selftests/kselftest_harness.h b/tools/testing/selftests/kselftest_harness.h
index 1e459619fe86..150bd690ca7b 100644
--- a/tools/testing/selftests/kselftest_harness.h
+++ b/tools/testing/selftests/kselftest_harness.h
@@ -1008,7 +1008,7 @@ static void __wait_for_test(struct __test_metadata *t)
         /* signal process group */
         kill(-(t->pid), SIGKILL);
     }
-    child = waitpid(t->pid, &status, WNOHANG);
+    child = waitpid(t->pid, &status, 0);
     if (child == -1 && errno != EINTR) {
         t->exit_code = KSFT_FAIL;
         fprintf(TH_LOG_STREAM,

