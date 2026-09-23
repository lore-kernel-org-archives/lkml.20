Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9393E51CB
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 17:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790184064; cv=none; b=pqJS/sohgfM/Q6EgsULEZI6LMpZsLbrd2ayjJZkF/ItgmHkPhpEGxRq+FLGfdDlXAoJ0OTn6jRV/PYAE2nLAgbBZysuMaibNAG5fLDkTm+Cn9iQflZULHPFLmFBdUBD8IjWSiiV9n3EuBGk4sylqNFeeQ2KYPvoKMBbHdvb7JDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790184064; c=relaxed/simple;
	bh=CuFkbyS1Fi1t7CjLqy7uYRqaRAUsmKrLCabBPvlCDMM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n+/67enG5dCrkDx4YaMN7wEXiIEgQ6YbTfhqHJ/9R0g3aGC0+cP+AKbvU+P24PRHfNnCUvJ8KzN9SLcDelCKBQdAbikF/bn4ASRJWF0A4KxUPGPCDQdR/VQP/dSHX0be5a3khdEzbb1DazkRIhena5j7VFPaBR4oKX/QWi/S1b4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mc4f0uJY; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mc4f0uJY"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-8686f46e4adso847226b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 10:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790184058; x=1790788858; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qNOkSNmL+icguC7yTBQfebOAy9435FAObGtk9UHbSdM=;
        b=mc4f0uJYqrasouSCBlfZBJBRWxR4cgAJCfXV74P23ezhGpYuPNdt3hW/w6EK7KPlc7
         PdIxVh1nmIZ2nSWrREZbOllI4NTPwkkDPUB4ZVHd5gGh/luNHwQhX1nK9uS3FVWeCgPJ
         CMBypz5h2rQ3OpHZHp0jiAevvb/d0W5DkTZxZmFBHOZxyGPIFrAwtrDRdeUHxV8znHoy
         pRFl+TVmWAIUXRitp80rwoDSteWGFlHNZb33YjZLNR4oroAMgTmrsh6Ijt4UHgoo+SN0
         0+f77MFe5PpYbsl5tZmaNzvFy0fFNXr6CDaow7sebcikgidBao4xMKwxq9M6Ir0+4YK4
         P5fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790184058; x=1790788858;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qNOkSNmL+icguC7yTBQfebOAy9435FAObGtk9UHbSdM=;
        b=lydE0nCJpyQlRaKh9rhsrtRhQ5CKMK/VnjombsuNTAUe0skRNmA/qNYmBnz8GnUaTt
         yrVqrv6HE2NGpcL8bSEDg0IsnX/W3n27Mrx6JRrcxbE5Tm2CYFGB3fgAsY7/K30sR+Wh
         CiuZPYQ5X67YjFn0dQPrzIcY7ppSQalT7B7sTW4tyXy3MG5uWko3AYci/EYPNY9K4v/Y
         0NMdv36iIGTYXJT/m3+KVuChe1XmI/oaRyFk/2oCqdt4EFN4eI9nrgQliGVTLVSCX5CU
         D0h5iTIgPq5yctH7vxeEYdrTmbeiAkXqfEYMblyA9MSoFNB/T8mQhRs4qlcKltniRrTX
         PCeQ==
X-Forwarded-Encrypted: i=1; AKwUvBxSJG8W9P/Mf++b8tDKRnuef3sHnJTFc/et0mSot6Kgyp9YSGV06w6sdmBfehso4RD1PH3Ec26QUq9T7B4=@vger.kernel.org
X-Gm-Message-State: AFuF++kni9czcyrJICF4y/oGQYGU81gvg2Jd5SZ1O/yvE2CNzkIZXDLT
	A1UoSpqEK5BmNPeiivQ4y9LeNPjFeMs1DKYF9Qv519+DP6CScnZ3PjuC
X-Gm-Gg: AYBFou2idsLZOVw3jQVz5QrojbOIup4rOQVu1v0+Nn1fELb4CveU/aj6VbaJmfPYgBv
	AtnqfmXR650W4+fgG5TVMteNWcSDBy4sHndiep2HanoYnsLAm8bIhFe8JKz/FMhiFklZwCH21sw
	+KM3Iogo4yqVefYKxmYq1ZGWkwZ2L9Y500FMHw9Gtwr+Ulj7MU617BdBvKDsLPT3F0G2SGZThEF
	cDaqDfTuA4iqg2tVhfwEOcWBRXqeatlv1icSj+cD2NBxnnPRCzxHd/+0qxyesanI8XmCn+5Fvaw
	aQqT0urgSymVUPYhR2WZUVCgj1YUTZfohs6CWyWusuE+wmaMpJfi44WxOd9eUO02HXshSa107P5
	jnRPcre15cjRSpQXYMWRR36ICrCtVMeo0dI7ii+EyY30MHKjLMnEw7aiMgiPfK/6Rcr45kVf63U
	iI8CIPPifp3JnEVQEhGfI1RFM9NquTVS+ynBa5Rc2lrpHlRF5gKDiWKrA6E5/L60w8bwdEe4dW/
	fmQ69voiVvteqxw8g==
X-Received: by 2002:a05:6a00:1595:b0:87d:f8af:894a with SMTP id d2e1a72fcca58-87df8af8d85mr1205748b3a.31.1790184057336;
        Wed, 23 Sep 2026 10:20:57 -0700 (PDT)
Received: from kernel-vm.. ([117.28.251.176])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1d5c1ab4sm1682918b3a.27.2026.09.23.10.20.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 10:20:56 -0700 (PDT)
From: Chengfeng Lin <lin2530632123@gmail.com>
To: Joseph Salisbury <joseph.salisbury@oracle.com>
Cc: Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sched/rt: Rebuild domains only after successful RT sysctl writes
Date: Wed, 23 Sep 2026 17:20:36 +0000
Message-ID: <179018297078.3.9126136955304841169@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260313183716.990792-1-joseph.salisbury@oracle.com>
References: <20260313183716.990792-1-joseph.salisbury@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2044294105914805542=="
Content-Transfer-Encoding: 8bit

--===============2044294105914805542==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Joseph,

I tested your patch on v7.2. It reduced repeated RT sysctl read latency
from about 8.57 us to 0.264 us, a 96.9% reduction. I found the patch while
investigating higher read latency between v6.12.95 and v7.2.

I adjusted only the patch context because v7.2 no longer has the
sched_rt_do_global() call. Your patch's logic is unchanged.

The machine was a bare-metal i7-12700KF with all 20 logical CPUs online.
Both builds used v7.2, GCC 15.2.0 and the same config except for
CONFIG_LOCALVERSION. Runtime settings were full preemption, performance
governor/EPP and Turbo disabled. CONFIG_RT_GROUP_SCHED was disabled.
The RT period and runtime were 1000000 and 950000 us on both kernels.

I ran original A -> patched -> original B, with a fresh boot at each
point. One reader was pinned to CPU 2. Each sample made 4096 pread() calls
at offset zero on an already-open FD and checked every returned value.
Each case had 3 warm-up and 9 measured samples per boot. The timed loop
included the reads and value checks, but not open/close or tracing.

Mean results in ns/read were:

  parameter                  original A     patched    original B
  sched_rt_period_us           8547.294      264.575      8576.337
  sched_rt_runtime_us          8574.240      263.690      8566.828
  sched_rr_timeslice_ms          253.400      250.268       251.304

Against the original A/B midpoint, the two RT read times fell by 96.91%
and 96.92%. Their maximum within-boot CV was 0.89%, and the original
kernel's A/B drift was at most 0.34%. Dropping the first measured sample
at each point gave the same conclusion. The RR control changed by 0.83%.

Separate untimed probes confirmed that patched RT reads skipped
rebuild_sched_domains() and deadline bandwidth re-accounting. The original
kernel reused the existing domains: build_sched_domains() was not
called. Successful writes, including same-value writes, still performed
the global update and rebuild with the patch.

Valid changes, invalid text, out-of-range values and invalid period/runtime
combinations had matching return values and readback on both kernels.
Rejected writes left the old values intact. They also skipped the rebuild
with the patch. No kernel warnings were observed.

These are read-loop microbenchmark results, not application timings.
I have not tested concurrent writes, CPU hotplug or DL admission failure
with active SCHED_DEADLINE tasks. The attached reader is the one used for
the test; it does not change any sysctl values.

The data, configs and v7.2 patch are available here:
https://github.com/lcf0399/linux-regression-evidence/tree/b937265884a2f3c28403634c2bc7e309f83f7153/sched-rt-sysctl-read-rebuild

Are you planning to update or resend this patch? I can test an updated
version if that would help.

Thanks,
Chengfeng

--===============2044294105914805542==
Content-Type: text/plain
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="rt_sysctl_read.c"
MIME-Version: 1.0

Ly8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQojZGVmaW5lIF9HTlVfU09V
UkNFCiNpbmNsdWRlIDxlcnJuby5oPgojaW5jbHVkZSA8ZmNudGwuaD4KI2luY2x1ZGUgPGludHR5
cGVzLmg+CiNpbmNsdWRlIDxsaW1pdHMuaD4KI2luY2x1ZGUgPHNjaGVkLmg+CiNpbmNsdWRlIDxz
aWduYWwuaD4KI2luY2x1ZGUgPHN0ZGludC5oPgojaW5jbHVkZSA8c3RkaW8uaD4KI2luY2x1ZGUg
PHN0ZGxpYi5oPgojaW5jbHVkZSA8c3RyaW5nLmg+CiNpbmNsdWRlIDxzeXMvcHJjdGwuaD4KI2lu
Y2x1ZGUgPHRpbWUuaD4KI2luY2x1ZGUgPHVuaXN0ZC5oPgoKLyogU3RhYmxlIHByb2JlIGJvdW5k
YXJpZXM6IGV4YWN0bHkgb25lIHByZWFkKCkgYmV0d2VlbiBlYWNoIHBhaXIuICovCl9fYXR0cmli
dXRlX18oKG5vaW5saW5lLCBub2Nsb25lLCB1c2VkKSkKdm9pZCB0cl9yZWFkX2JlZ2luKHVuc2ln
bmVkIHNlcSwgdW5zaWduZWQga2luZCwgaW50IGZkKQp7Cglhc20gdm9sYXRpbGUoIiIgOiA6ICJy
IihzZXEpLCAiciIoa2luZCksICJyIihmZCkgOiAibWVtb3J5Iik7Cn0KCl9fYXR0cmlidXRlX18o
KG5vaW5saW5lLCBub2Nsb25lLCB1c2VkKSkKdm9pZCB0cl9yZWFkX2VuZCh1bnNpZ25lZCBzZXEs
IHVuc2lnbmVkIGtpbmQsIHNzaXplX3QgcmVzdWx0KQp7Cglhc20gdm9sYXRpbGUoIiIgOiA6ICJy
IihzZXEpLCAiciIoa2luZCksICJyIihyZXN1bHQpIDogIm1lbW9yeSIpOwp9CgpzdGF0aWMgdm9p
ZCBkaWUoY29uc3QgY2hhciAqd2h5KQp7CglmcHJpbnRmKHN0ZGVyciwgInJ0LXN5c2N0bC1yZWFk
OiAlcyAoZXJybm89JWQpXG4iLCB3aHksIGVycm5vKTsKCWV4aXQoMSk7Cn0KCnN0YXRpYyB2b2lk
IGFsYXJtX2V4aXQoaW50IHNpZ25vKQp7Cgkodm9pZClzaWdubzsKCXN0YXRpYyBjb25zdCBjaGFy
IG1lc3NhZ2VbXSA9ICJydC1zeXNjdGwtcmVhZDogd2F0Y2hkb2cgdGltZW91dFxuIjsKCXNzaXpl
X3Qgd3JpdHRlbiA9IHdyaXRlKFNUREVSUl9GSUxFTk8sIG1lc3NhZ2UsIHNpemVvZihtZXNzYWdl
KSAtIDEpOwoJKHZvaWQpd3JpdHRlbjsKCV9leGl0KDEyNCk7Cn0KCnN0YXRpYyBsb25nIG51bWJl
cihjb25zdCBjaGFyICp0ZXh0LCBsb25nIG1pbiwgbG9uZyBtYXgpCnsKCWNoYXIgKmVuZDsKCWVy
cm5vID0gMDsKCWxvbmcgdmFsdWUgPSBzdHJ0b2wodGV4dCwgJmVuZCwgMTApOwoJaWYgKGVycm5v
IHx8ICEqdGV4dCB8fCAqZW5kIHx8IHZhbHVlIDwgbWluIHx8IHZhbHVlID4gbWF4KQoJCWRpZSgi
aW52YWxpZCBpbnRlZ2VyIGFyZ3VtZW50Iik7CglyZXR1cm4gdmFsdWU7Cn0KCnN0YXRpYyB1aW50
NjRfdCBjbG9ja19ucyhjbG9ja2lkX3QgY2xvY2spCnsKCXN0cnVjdCB0aW1lc3BlYyB0czsKCWlm
IChjbG9ja19nZXR0aW1lKGNsb2NrLCAmdHMpKQoJCWRpZSgiY2xvY2tfZ2V0dGltZSIpOwoJcmV0
dXJuICh1aW50NjRfdCl0cy50dl9zZWMgKiAxMDAwMDAwMDAwVUxMICsgdHMudHZfbnNlYzsKfQoK
aW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKiphcmd2KQp7CglpZiAoYXJnYyAhPSA2ICYmIGFyZ2Mg
IT0gNykgewoJCWZwcmludGYoc3RkZXJyLCAidXNhZ2U6ICVzIHNlbWFudGljfHByb2JlfHRpbWlu
Z3xmaXh0dXJlIHBlcmlvZHxydW50aW1lfHJyIG9wcyBjcHUgZXhwZWN0ZWQgW2ZpeHR1cmUtZmls
ZV1cbiIsIGFyZ3ZbMF0pOwoJCXJldHVybiAyOwoJfQoJaW50IGZpeHR1cmUgPSAhc3RyY21wKGFy
Z3ZbMV0sICJmaXh0dXJlIik7CglpbnQgcHJvYmUgPSAhc3RyY21wKGFyZ3ZbMV0sICJwcm9iZSIp
OwoJaW50IHRpbWluZyA9ICFzdHJjbXAoYXJndlsxXSwgInRpbWluZyIpOwoJaWYgKCghZml4dHVy
ZSAmJiAhcHJvYmUgJiYgIXRpbWluZyAmJiBzdHJjbXAoYXJndlsxXSwgInNlbWFudGljIikpIHx8
CgkgICAgKGZpeHR1cmUgIT0gKGFyZ2MgPT0gNykpKQoJCWRpZSgidW5rbm93biBtb2RlIG9yIGZp
eHR1cmUgcGF0aCBvdXRzaWRlIGZpeHR1cmUgbW9kZSIpOwoJaWYgKHRpbWluZyAmJiAoIWdldGVu
digiS1NfQUxMT1dfU1lTQ1RMX1RJTUlORyIpIHx8CgkJICAgICAgIHN0cmNtcChnZXRlbnYoIktT
X0FMTE9XX1NZU0NUTF9USU1JTkciKSwgIjEiKSkpIHsKCQlmcHJpbnRmKHN0ZGVyciwgInRpbWlu
ZyByZXF1aXJlcyBhIHNlcGFyYXRlbHkgYXV0aG9yaXplZCBleHBlcmltZW50XG4iKTsKCQlyZXR1
cm4gMjsKCX0KCWNvbnN0IGNoYXIgKm5hbWVzW10gPSB7InBlcmlvZCIsICJydW50aW1lIiwgInJy
In07Cgljb25zdCBjaGFyICpwYXRoc1tdID0geyIvcHJvYy9zeXMva2VybmVsL3NjaGVkX3J0X3Bl
cmlvZF91cyIsCgkJIi9wcm9jL3N5cy9rZXJuZWwvc2NoZWRfcnRfcnVudGltZV91cyIsCgkJIi9w
cm9jL3N5cy9rZXJuZWwvc2NoZWRfcnJfdGltZXNsaWNlX21zIn07Cgl1bnNpZ25lZCBraW5kOwoJ
Zm9yIChraW5kID0gMDsga2luZCA8IDM7ICsra2luZCkKCQlpZiAoIXN0cmNtcChhcmd2WzJdLCBu
YW1lc1traW5kXSkpCgkJCWJyZWFrOwoJaWYgKGtpbmQgPT0gMykKCQlkaWUoInVua25vd24gY2Fz
ZSIpOwoJdW5zaWduZWQgb3BzID0gbnVtYmVyKGFyZ3ZbM10sIDEsIDQwOTYpOwoJaW50IGNwdSA9
IG51bWJlcihhcmd2WzRdLCAwLCBDUFVfU0VUU0laRSAtIDEpOwoJbG9uZyBleHBlY3RlZCA9IG51
bWJlcihhcmd2WzVdLCAtMSwgSU5UX01BWCk7CglpZiAoKHByb2JlIHx8ICFzdHJjbXAoYXJndlsx
XSwgInNlbWFudGljIikpICYmIG9wcyA+IDY0KQoJCWRpZSgicXVhbGlmaWNhdGlvbiBpcyBsaW1p
dGVkIHRvIDY0IHJlYWRzIHBlciBpbnZvY2F0aW9uIik7CgljcHVfc2V0X3QgYWxsb3dlZCwgY2hv
c2VuOwoJaWYgKHNjaGVkX2dldGFmZmluaXR5KDAsIHNpemVvZihhbGxvd2VkKSwgJmFsbG93ZWQp
IHx8ICFDUFVfSVNTRVQoY3B1LCAmYWxsb3dlZCkpCgkJZGllKCJDUFUgbm90IGluIGluaXRpYWwg
YWZmaW5pdHkiKTsKCUNQVV9aRVJPKCZjaG9zZW4pOwoJQ1BVX1NFVChjcHUsICZjaG9zZW4pOwoJ
aWYgKHNjaGVkX3NldGFmZmluaXR5KDAsIHNpemVvZihjaG9zZW4pLCAmY2hvc2VuKSkKCQlkaWUo
InNjaGVkX3NldGFmZmluaXR5Iik7CglzdHJ1Y3Qgc2lnYWN0aW9uIHNhID0gey5zYV9oYW5kbGVy
ID0gYWxhcm1fZXhpdH07CglpZiAoc2lnYWN0aW9uKFNJR0FMUk0sICZzYSwgTlVMTCkgfHwgcHJj
dGwoUFJfU0VUX1BERUFUSFNJRywgU0lHS0lMTCkpCgkJZGllKCJ3YXRjaGRvZyBzZXR1cCIpOwoJ
YWxhcm0oMTApOwoJY2hhciB3YW50ZWRbNjRdLCBhY3R1YWxbNjRdOwoJaW50IGJ5dGVzID0gc25w
cmludGYod2FudGVkLCBzaXplb2Yod2FudGVkKSwgIiVsZFxuIiwgZXhwZWN0ZWQpOwoJaW50IGZk
ID0gb3BlbihmaXh0dXJlID8gYXJndls2XSA6IHBhdGhzW2tpbmRdLCBPX1JET05MWSB8IE9fQ0xP
RVhFQyB8IE9fTk9GT0xMT1cpOwoJaWYgKGZkIDwgMCkKCQlkaWUoIm9wZW4iKTsKCXVpbnQ2NF90
IHN0YXJ0ID0gMCwgd2FsbCA9IDAsIGNwdV9zdGFydCA9IDAsIGNwdV90aW1lID0gMDsKCWlmICh0
aW1pbmcpIHsKCQljcHVfc3RhcnQgPSBjbG9ja19ucyhDTE9DS19USFJFQURfQ1BVVElNRV9JRCk7
CgkJc3RhcnQgPSBjbG9ja19ucyhDTE9DS19NT05PVE9OSUNfUkFXKTsKCX0KCWZvciAodW5zaWdu
ZWQgc2VxID0gMDsgc2VxIDwgb3BzOyArK3NlcSkgewoJCWlmIChwcm9iZSkKCQkJdHJfcmVhZF9i
ZWdpbihzZXEsIGtpbmQgKyAxLCBmZCk7CgkJc3NpemVfdCBnb3QgPSBwcmVhZChmZCwgYWN0dWFs
LCBzaXplb2YoYWN0dWFsKSAtIDEsIDApOwoJCWlmIChwcm9iZSkKCQkJdHJfcmVhZF9lbmQoc2Vx
LCBraW5kICsgMSwgZ290KTsKCQkvKiBObyByZXRyaWVzLCBwYXJ0aWFsLXJlYWQgbG9vcCwgbHNl
ZWsoKSwgd3JpdGVzIG9yIGltcGxpY2l0IEVPRiByZWFkLiAqLwoJCWlmIChnb3QgIT0gYnl0ZXMg
fHwgbWVtY21wKGFjdHVhbCwgd2FudGVkLCBieXRlcykpCgkJCWRpZSgidW5leHBlY3RlZCByZWFk
IHJlc3VsdCIpOwoJfQoJaWYgKHRpbWluZykgewoJCXdhbGwgPSBjbG9ja19ucyhDTE9DS19NT05P
VE9OSUNfUkFXKSAtIHN0YXJ0OwoJCWNwdV90aW1lID0gY2xvY2tfbnMoQ0xPQ0tfVEhSRUFEX0NQ
VVRJTUVfSUQpIC0gY3B1X3N0YXJ0OwoJfQoJaWYgKHNjaGVkX2dldGNwdSgpICE9IGNwdSB8fCBz
Y2hlZF9nZXRhZmZpbml0eSgwLCBzaXplb2YoYWxsb3dlZCksICZhbGxvd2VkKSB8fAoJICAgIENQ
VV9DT1VOVCgmYWxsb3dlZCkgIT0gMSB8fCAhQ1BVX0lTU0VUKGNwdSwgJmFsbG93ZWQpIHx8IGNs
b3NlKGZkKSkKCQlkaWUoImZpbmFsIGFmZmluaXR5IG9yIGNsb3NlIik7CglhbGFybSgwKTsKCXBy
aW50Zigie1wic2NoZW1hXCI6XCJydC1zeXNjdGwtcmVhZC12MVwiLFwibW9kZVwiOlwiJXNcIixc
ImNhc2VcIjpcIiVzXCIsIgoJICAgICAgICJcImNhc2VfaWRcIjoldSxcInBpZFwiOiVkLFwiY3B1
XCI6JWQsXCJyZWFkc1wiOiV1LFwiZXhwZWN0ZWRcIjolbGQsIgoJICAgICAgICJcImJ5dGVzX3Bl
cl9yZWFkXCI6JWQsXCJ0b3RhbF9ieXRlc1wiOiV1LFwic2VtYW50aWNfcGFzc1wiOnRydWUsIgoJ
ICAgICAgICJcInBlcmZvcm1hbmNlX2V2aWRlbmNlXCI6JXMsXCJ3YWxsX25zXCI6JSIgUFJJdTY0
ICIsXCJ0aHJlYWRfY3B1X25zXCI6JSIgUFJJdTY0ICJ9XG4iLAoJICAgICAgIGFyZ3ZbMV0sIG5h
bWVzW2tpbmRdLCBraW5kICsgMSwgZ2V0cGlkKCksIGNwdSwgb3BzLCBleHBlY3RlZCwgYnl0ZXMs
CgkgICAgICAgb3BzICogYnl0ZXMsIHRpbWluZyA/ICJ0cnVlIiA6ICJmYWxzZSIsIHdhbGwsIGNw
dV90aW1lKTsKCXJldHVybiAwOwp9Cg==

--===============2044294105914805542==--
