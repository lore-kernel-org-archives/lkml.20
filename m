Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794411014;
	b=c3p62nKg7jt0ZDL727uUqhQPCB3p0NmUJ3ksYkSEIHphKWsJVpvE4t7KuNYz8SMYSPKX
	 RLQZWLkuwT54E5T0h68E8YjsH4H/rwaX1I09KIMVW8ShDm3XgACUFe72Jy6HvLlW78c3y
	 l1iEOEIbMy+AGOhkJx8n1eZqLZxsYaAWiJ3FsurDxRsC2coH0fdAKVesaqIK8ZUCDLWJ9
	 JlluYK/W5AC3DNaSYVyjJ2ycnH4c8IAiMMgdLoE5gaS+tb9o0uOiKb1VhrAENSNc5cb1e
	 0bFDOW3WC+Ec2bwGqwLHVdNrQf7OqhklkVX5S8nzXlbQ/4YPbiI7NBSz7cjf/3Fw4eA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794411014;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:Received:From:Date:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=dX6hFmZdS7Gg8cUOEwScRtDpzCl55I9CPUiy1XCzenQ=;
	b=GGdkcg7N6QlYv2qrSH8ADJcC3LQNd3wvLTCBfujGUSLD8avZry6VC2IWndWEvilSKSpS
	 MjynK/9WXk2H/CmKLH2nalJjnjZmb3wW83w/onVAsfCKmrRWQ5I//rUpzSGteziVidvjC
	 BPP/3+4rbKLIRo3iHqGbfg1LR8otAAcN46VcjMF7lwrNN2OXFcnEUqHEvN6+g5MXmeIN8
	 XxaQ6+uZBgGM1rheNf8JPb7nMe0QOGLfDsCFgdZ+h6Q66I+0nv0YBZgIaZULpHNnDWrNO
	 Djuh4xlAI6FY1oOkqSv//GO7B9LDO/7j0lGsRHg8aGrZbNK6cwc//SPQS0gIHl4S+gg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uPvURM2E;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.43
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F1A7606A326
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 15:30:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F1A7606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uPvURM2E
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-47b47de8b4cso2069937fac.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:30:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794411013; cv=none;
        d=google.com; s=arc-20260327;
        b=Slco+Hf9DiwRf++9gF6TdMriz4mI/Rcly5Y+UlqjYemHCNlJax3m8eIoIF9mKk2SC5
         9UBLzBzdixqbh0WAcXX1665m3r05qOSe6BOIdge8X1Jd0vPmtfqfF2C6n5uTx6n0TU54
         r8f105NGXWpIq9OGUvQIrs8i2t4XhpolI59yyZJxgvlRqxAtW5jC+06muK2fkoQ3bluj
         N7KbFCwvNxG8zoLW25JMoBXIQqDqkBhEYLtVyUV8P2DvhqNZfDM/hp+1Haxrm4slK1uj
         uE5jUH4sqRveCZGTpTndsZM2KSGOuWz0Iu1W3QbHyLsVMb9FFMJCLUil1LRXrR7QueUH
         Z2Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=dX6hFmZdS7Gg8cUOEwScRtDpzCl55I9CPUiy1XCzenQ=;
        fh=UIiYvLVGP6uv86mvqwHcUnJhjcDscCztxh8c011fw7Q=;
        b=JsEG5Nk6NMqei63xqDOKjrnAQ6Wgpg68BPt61w6kVr72poW5JU9a4HMLmPZic0nlkD
         YVafgOXnwkX7JDHEwDF6aT23Q7ks0Ps48xG65Yz90egILjFJ2NX2a0gVLAEV6TGeDHuN
         TcssCiSX1L4kNWA6D4YFVlWgugE7bj0RnciR4x3G0aVtarVOdzR/PYEkVbtJvygPFwZc
         GndihknY0Exr+RKsrkBQilDlazwLR0nS7Z1GtJHTz++qEgPeBrZSeMHeVXR0tJPIQvrg
         MpB4ipclFmcFYiNun99JQ9boXdPF/z9PFxh0yiw9Qn6LhruJ0kZKPw8M4/QEnSmBad3F
         2xyw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794411013; x=1795015813; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dX6hFmZdS7Gg8cUOEwScRtDpzCl55I9CPUiy1XCzenQ=;
        b=uPvURM2EQFxOyq7hd1v1FGg3JL8ari51ttuca9gK060yWtnx9L3TA4MmDMiMSo3rZL
         WFD1G4lvnZVNa2HuDBUrZq6ik1T7dI675MvF2kIPB1AjR6o0pwQmedDHWg3g6F9g1Nol
         dRGdVeA0htRy/F1dI2UaxY15rtGq2ijkVikVT/YdY6PSa4/479UdwKOS7LmkZ4MHega3
         5aLRD/SwptUczegbPOjkbigMsTrzCLEifDGFYwYEslf48xjKM1dSlqpCziK2HWHO1jGM
         4Okcd4LKVRA2WaqFtRu9agY3VafW7MFh7Vj4ZW5tUkkucfzNCFpJbG3hrwMAEht90mgO
         udGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794411013; x=1795015813;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dX6hFmZdS7Gg8cUOEwScRtDpzCl55I9CPUiy1XCzenQ=;
        b=StGqX9VoqIRLdg3qYj++J3iaYwRzdwQa/qsc3/pzRh90UEFWJatrxsBwryLOKhTdv2
         xyoUSTY7oyckCwgMqQaikq+84NihX15qtp4tbago9jddPNKzuV+MOrjOTLIQpLmuTY9W
         Svo9+8uHeAgixKz3pUZOmU1L4VWXYtGOaGMRXJ93wNZVbNe55kBrPAX1ReQqHPBkrSmk
         GR0b1RguuV77KN1PL9WuTCjdrbIlOVhqYvT1Kg88hqZ66WZXrC7/BIg/xLl3TFEdo6Cu
         KlBX5zxOREZoy3pj3ZVtn1arEgqJ2GR8XaKgmO+gWJEHMgS6zvE9yo5xFiHgzAnlrFyU
         W0iA==
X-Forwarded-Encrypted: i=1; AL+hErFrdrdPOPzF79wKLXW0kCvJMtx1F4JS0GlZynfFnqzrMCaDNlW3Dk5Wpk1sszAiLEHyj08Q9W6+w/iOvXY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9gD6mSdc+sdw7tCOXot0xRONjGg97uvIHHEu0KZU02lIOlWWFz
	Hyk20piGovr5Hrf77tVf9JAhQRMJrJ2wzrX5aBreTYc0kjCblSiduDNGY4uChMytHooom7ZGekc
	fVm9+5CU+ePj98fjgUywAV3aJpCg4B/s=
X-Gm-Gg: AYBFou3AVmn9TmRj8tq8nMxifPSqUVW8OBs5abFVO2v5pp00Gk4aTntO903ONB7vbwH
	arZaYC/6CRKffqd8nu84+tGuDp6J7oOTj1d868+tGtDUjpuFv9Lg4niv+y6YPkg9zLnRp0ndHjG
	ZYv7Efkl8b2JCQTPWuEqt51OVr7amuAjMr3TRt6ye8f+Bnh1JL64Fn1onVyGQxP7InsO6MfwM+A
	roeCk9H9T8VMe/nzIwTDG14znlRw78Ja6ObTg62t6Q+HNHy8MVwrs5s/nnEhJl0fqJmEDgUTJBD
	xpZyFZUuBZ92iRlNu1oBKyL+JQF2NsdZGf9vCqkktKwav/+DLnDT2lVjG8uM4rEKHsxfd9Ut2K+
	sBl7Wl2hSNgG1f4c9XPOoF2nntElhvDWd2Va1Zh7WcsDyXBd7v3QKF0iaR03U7zcZhFsltxcJGf
	3x1bXBfYXBfhXhjBlg6UljWVc=
X-Received: by 2002:a05:6870:c112:b0:483:cb42:3979 with SMTP id
 586e51a60fabf-4ae46a42831mr2381441fac.17.1794411012764; Wed, 11 Nov 2026
 07:30:12 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 11 Nov 2026 10:30:12 -0500
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 11 Nov 2026 10:30:03 -0500
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Received: from 77377267392	named unknown	by gmailapi.google.com	with HTTPREST;
 Wed, 11 Nov 2026 07:29:09 -0800
From: Kanishk Singh <kanishk2607@gmail.com>
Date: Wed, 11 Nov 2026 10:30:12 -0500
X-Gm-Features: AclHuK8RPhVT8h4SoQ-sBKh-mRKS0ugcCHlJN_3RKGREeGlNi0WOGPnSLTYbW0U
Message-ID: <CAC=pywoHKV1157BrUsew_E4zriGMx3Gh8B2o_rR24c1yfZ1V0w@mail.gmail.com>
Subject: [PATCH] selftests/cgroup: Decode waitid results correctly in clone_reap
To: Tejun Heo <tj@kernel.org>
Cc: Johannes Weiner <hannes@cmpxchg.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Shuah Khan <shuah@kernel.org>, cgroups@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

clone_reap() applies the waitpid() status macros to waitid()'s
si_status. Unlike waitpid()'s encoded status, si_status already holds
the exit code or signal number, and si_code identifies the event.

For example, a child exiting with status 128 is reported as successful,
while a child exiting with status 42 produces -1 rather than 42. Stop
and continuation events are also rejected. With WNOHANG, a live child
can be reported as having exited successfully because the zeroed
si_status passes WIFEXITED().

Check si_code for the requested event and return si_status directly
for exit and stop events. Accept CLD_TRAPPED along with CLD_STOPPED,
as both correspond to stopped children.

Fixes: 27eaaaf3b30e ("selftests/cgroup: add tests for cloning into cgroups")
Signed-off-by: Kanishk Singh <kanishk2607@gmail.com>
---
This patch was prepared with ChatGPT/Codex assistance for code inspection,
implementation, commit-message drafting, and local testing. The task was to
find and reproduce a cgroup selftest helper bug, make a focused fix, and
verify the result against the original helper.

Testing: the cgroup selftest programs build successfully. A standalone
reproducer linked against cgroup_util.c passes all 256 exit codes, SIGSTOP,
SIGCONT, SIGKILL, WNOHANG, ECHILD, and an interrupted wait after this change.
The original helper fails 255 of the 256 exit-code comparisons, the stop
and continuation checks, the WNOHANG check, and the interrupted-wait
exit-code check. No full cgroup runtime suite was run: the environment has
no cgroup mount. A ptrace stop check was skipped because PTRACE_TRACEME
was unavailable.

 tools/testing/selftests/cgroup/lib/cgroup_util.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/cgroup/lib/cgroup_util.c
b/tools/testing/selftests/cgroup/lib/cgroup_util.c
index 823b0312b..4915d80ed 100644
--- a/tools/testing/selftests/cgroup/lib/cgroup_util.c
+++ b/tools/testing/selftests/cgroup/lib/cgroup_util.c
@@ -508,17 +508,17 @@ int clone_reap(pid_t pid, int options)
 	}

 	if (options & WEXITED) {
-		if (WIFEXITED(info.si_status))
-			return WEXITSTATUS(info.si_status);
+		if (info.si_code == CLD_EXITED)
+			return info.si_status;
 	}

 	if (options & WSTOPPED) {
-		if (WIFSTOPPED(info.si_status))
-			return WSTOPSIG(info.si_status);
+		if (info.si_code == CLD_STOPPED || info.si_code == CLD_TRAPPED)
+			return info.si_status;
 	}

 	if (options & WCONTINUED) {
-		if (WIFCONTINUED(info.si_status))
+		if (info.si_code == CLD_CONTINUED)
 			return 0;
 	}


base-commit: 067c5c24cef23d913b67eaaf71ae67e7169a6620
-- 
2.52.0
