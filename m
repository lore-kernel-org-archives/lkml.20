Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF203F58F7
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 11:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787745580; cv=none; b=IncyodeIkWLgdEbmMlCo1o0NS1rVx6iXhEetRdtebEX+VGoHQl6010+HBhG29I5CLuWx8CSmNFW8Wrwp0NbUWu5CK4gIgMugnljF/YFJ8grNgQWuJSc+swBZGFNi19J2sAdMDWT+OlUuE5yqNXFe6oOlM6Lxy9OExCJ65BFsE9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787745580; c=relaxed/simple;
	bh=gMaVgfPNUsxe2suAiFliez055qKOvUgJIR9Bqte105A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hs6EnUlyA2BUjq237uig/XMqMwrVEqLRfKhZEpAqN3Y3IiN70iNyFDKJa5uA0g20wHSHbcK9EytT/DbTdddRvPFMEwfMeEbQBKXgbyOjBRyyzdvwJ/tMrEZys3pGthvz38zCZ3M9cl47DzISF7XFh8kXUu7GK0XtK9KrSM4mvm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zeo/Y6Ac; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zeo/Y6Ac"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cbe6295f05bso1479472a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 04:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787745579; x=1788350379; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bc8my8FbiDqjxCZcE9P0+mYGbrSku1wnrvIHI1ZOYos=;
        b=Zeo/Y6AcMExyqFo+LPlJ80uhXawjYFjKMHPFkElDVfveh7tAmRoDclznnOvFR5DrHB
         JgX20MATZM74In7MGvP1FRKxbZh2NGLHrnAduiemj+q4nMaqOs17ds/DvwGULibJD+lE
         AXkxJFY6Eja5MM/9KDze5UdkPR94WAORFm2d6sGFaqwdpOoUFNklukx3OPSyovyJXGOb
         gG9lOsoMpYahNBCu3sGcl9a40CnCzW/zhYkMy68NtnShNS8cTwMFhRyXCfa4V6Po1GKl
         pfBRiBuAslbs2NQKSvn+xANYSXOAFefhGgeUXZP3hKNXqCAwqHPCL2yYod3aGL4GvpHO
         2+yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787745579; x=1788350379;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bc8my8FbiDqjxCZcE9P0+mYGbrSku1wnrvIHI1ZOYos=;
        b=Le8HXnrfSSRT9hTz+nZewqxAQtDXetdB5FkMicef0Y097fquXWFdKDC1IvA8dte+o9
         hwbmRCiB26EksbCOYJ58cvNXIPOGLy00Ub1MYPwVLzX81An+inhhK2R8A2b9C0ulFtwt
         bwzaDl8rgAn05fuvWqXPi1pe7XX2fUCzwoQwdXZrpwp1akX6UXG+4sr3R/s4YVVy6b7H
         woSIaFGH85ulcgeYSnFt+GbJxrXm36P+SFGLBJSdOlVS3KPZT52cGbq2DO3C7pWTvmBU
         cPPQ0PsiQH/Aze1H1QSxAz11SK6LbNAlzDZ5uMV4YDeBHPKxKCXVG9oRCEHGINABun4u
         XpPQ==
X-Forwarded-Encrypted: i=1; AHgh+RopvzmZ0c7xdznqmdJ465e0+BY6rMmeMCVYpmUZ1FtlKNczlaC53AKLG34fnS5uEUCl+ZB62+GJLIZRmRM=@vger.kernel.org
X-Gm-Message-State: AFuF++n/MLI/XbuyXzLn5utJuyhwENYUjkKspm/MMbPLuWsSwyqmFk08
	5NypwTqJbsHES+D6UzBoY06uh48I0Y23XnZGJflpoqBSYIQekyWxPAjo
X-Gm-Gg: AR+sD12OrrlzbMc8LTvrjpLFnmvq8QAMuau5c/qTGpD2ol59L6cRiaSfmKR0naWJEcN
	YxFCM8t+8J8lWNrg215E0nuaMu7lhG71n4ZswxUmGWIKRTx4EpCyPF7sJ2wKQgWG65OcKj+tfj0
	wTCLDmvEuklSqBsPvj6l3dCkJsBy6q7JoEWr8SGCQdkZ6jo6pF8VIx0tb7+ZHHG7zLHjGSydSj4
	QFAfqHwOYpBXPojMMI2wMFNp99h58z9GbGZWikZQspl7IvqAmjuezKG1FFcgYH/BIt7GtgZZKz/
	2OeLXCMcq609UHcdnsZX1refOYOh1e3FRL8TAEha52TezL/eRjwJvQ6dUS557og+T76OsNCChLd
	2vo1cTtKDRNg0SJ26IcIiNWG7hNtS5IOd1qGSYQFQ3ecuREqwwrlcvzECM75aj9aGyyy/MSdA8O
	GEP4rjLYepvP+yZlawHgTt9ADFOguB1r/NeYHYsmPi7qpohwEyrGy0raeHgUMT4HwEdcu0PuxC4
	dwSJPwbPns=
X-Received: by 2002:a17:90b:1a86:b0:38e:9784:dd47 with SMTP id 98e67ed59e1d1-39645829233mr18130835a91.1.1787745578549;
        Wed, 26 Aug 2026 04:59:38 -0700 (PDT)
Received: from volcano9f8e-host.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141a8eefd98sm14607883c88.3.2026.08.26.04.59.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 04:59:38 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: seanjc@google.com,
	pbonzini@redhat.com,
	shuah@kernel.org
Cc: kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] KVM: selftests: Actually test PV_UNHALT
Date: Wed, 26 Aug 2026 17:29:13 +0530
Message-ID: <20260826115915.2882221-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.43.7
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

test_pv_unhalt() only checks that KVM clears KVM_FEATURE_PV_UNHALT from
guest CPUID when HLT-exiting is disabled; the feature itself has never
been exercised, hence the FIXME.  Patch 2 tests it by halting one vCPU
with interrupts disabled and kicking it from another, so that reaching the
instruction after HLT is proof that KVM_HC_KICK_CPU was delivered.

Patch 1 adds the helper that patch 2 needs to learn a vCPU's APIC ID from
the host, rather than open coding KVM_GET_LAPIC as a few tests already do.

Changes in v2:
 - Pass the APIC ID to kick in a1, not a0.  KVM reads it from a1, as the
   in-kernel guest does in kvm_kick_cpu(), so v1 asked KVM to kick APIC ID
   0 and only passed because the halting vCPU happened to be vCPU 0.
   Spotted by the Sashiko AI reviewer.
 - Halt on a vCPU with a non-zero APIC ID, so that a kick sent to the wrong
   vCPU can no longer pass by accident, and enable that vCPU's APIC, as a
   guest using PV spinlocks would: KVM only routes the kick once the vCPU
   is in the APIC map, which is also why xapic_ipi_test enables it.
 - Move the APIC ID helper into apic.h instead of keeping it private to
   the test (new patch 1).
 - Report the return value of pthread_create()/pthread_join() rather than
   errno; they return the error directly and do not set errno.

Built and run on x86_64 (AMD).  Untested on Intel, though the kick is
handled in common code and delivered through the generic LAPIC path.

 - On kvm-x86/next, the whole selftest suite builds warning-free and
   kvm_pv_test passed 10 of 10 runs.

 - Also run inside a VM booted on a kernel built from kvm-x86/next, i.e.
   against the KVM this targets rather than the host's.

 - Whole x86 suite with the series applied: 61 passed, 24 skipped, and
   set_sregs_test failed with "KVM allowed invalid efer bit (0x100)".  That
   one fails identically without the series, i.e. it is the host kernel.

The test was checked against four deliberate breakages, to make sure it
can only pass when the kick really works:

 - pass the APIC ID in a0, i.e. the v1 bug: the kick goes to the wrong
   vCPU and the test times out, so this version does catch it;

 - drop the KVM_HC_KICK_CPU call: the halted vCPU is never resumed and the
   test times out;

 - clear PV_UNHALT from the kicking vCPU's CPUID while enforcement is on:
   the hypercall returns -KVM_ENOSYS and the test fails with

     0xfffffffffffffc18 != 0x0 (kvm_hypercall(KVM_HC_KICK_CPU, ...) != 0)

 - remove the halt: the bounded wait trips and the test fails with
   "vCPU never halted" rather than hanging.

Hemanth Selam (2):
  KVM: selftests: Add a helper to read a vCPU's APIC ID
  KVM: selftests: Test the PV_UNHALT feature, not just its CPUID bit

 tools/testing/selftests/kvm/include/x86/apic.h |  9 ++
 tools/testing/selftests/kvm/x86/kvm_pv_test.c  | 97 +++++++++++++++++++++-
 2 files changed, 105 insertions(+), 1 deletion(-)

-- 
2.43.7

