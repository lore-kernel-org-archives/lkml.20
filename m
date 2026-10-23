Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792715831;
	b=PgjkrVT3Q69Q1+SD6Ny3cbIPa3heCe1n4OYlLfHbRDyu/GsecuwPT2Afn7aGGIQnrwZz
	 KTO7fLvoJyVIhtoUcDzM47Lu44UKjMVPx9eMRb2dH00M/mmFYDIB62F+M6vLNqFxMeGtO
	 kfOoEcEVFFThNsXLq95ZmVOBuz9yKQZsaXns5pLBWsSFUEu91/+5Lviiav1PQzk5FA9eh
	 fKZVLV3wdmGtQ/r6DkmxK/mm8pkWGAelOpWjSXGP6wUeVu2ILIDBdBp2G5m0RmjPGwjrI
	 y2t6nh8aS9uMYXSiOamfF05ZEW38TGCXE5e9j5WbrwWrndM6eVxc1z4jf0znD2uNYyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792715831;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=VVFibIdLtPqndtnVc2dqUS7yKr9vOJdSVF4rU6lBVbo=;
	b=Qz0YarpJDGU5nwk8Xxjo/RN+noKUnKKC2xceTvzY8tJQ9K3lyMcQANxcY3aL3ZsA/ptG
	 o1SOrq/nfe/Zzl/JlEB0PaFHIEuw5lzZAzypY7UMZQFn0nG6OWFf6t8SFrHysYe0pIJNM
	 xKanBcS4aO1jr6eVtxJ6SgD/G1lOcPr1MfAAKHyEBfiZJXvi+mU6iYgkOh8Y9tIqt88ph
	 qxKcWcQbb2SumqwzEeFqNNj80QRnVaQorukYV+Sagd7TRtVMEbXaO8khcEmGuOYvTOhY+
	 SGZrihMqh+cAyGFxOZjDq2V6/YWdqxptvjYOAV0zSWhuvDw+ozqwicowWlxhXsj6H9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rLxpBxVc;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E507606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 00:37:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E507606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rLxpBxVc
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3acdcfa2bd3so287190a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 17:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792715830; x=1793320630; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VVFibIdLtPqndtnVc2dqUS7yKr9vOJdSVF4rU6lBVbo=;
        b=rLxpBxVcixkK+51+Z4/1+3dhIWLpp9PBBGBj00fP7WbiAAe2ETfX2l0Bz/8aeFeEx/
         S3Vrq4hMXRhjJVBtuRM8bIoZ/M3JNwa3WO/pNbe11Wr6a12npnwvjoD2nP9vc/Hqdeot
         TVfiGIizeNDZ4DP2rQco9xxscDrbIr9vvBSmAKod9msHExoguY0a7TlKjgl+GWJqOJOg
         dCbeyp6p8m9Tm9HWmSEkA9I6C+ilj0rTh2MTe2wLz2o9QFYGFKrniAPxzOizgE55g/mg
         O3BLAceoecepk4jjEhRqz2t3Bu2PvAHCb9HwCG8ZJV0bkfbefe5shztJi6VygUxgFQuT
         U1GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792715830; x=1793320630;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VVFibIdLtPqndtnVc2dqUS7yKr9vOJdSVF4rU6lBVbo=;
        b=2pEd0ogqzyQOEN3+2dAIMXtvkWnTOv4N+B3mXQ9LI5vIwwMrwjYfx89+9e+ZE13vUx
         hE/Cz7yJa0dHcSVzWdnHX6fVYjAofsHrF51PiDN2Aj6lgdOszN9BT8mndycVJ134PZUx
         nDrIamYXO2pp5b1s/eMT+NzECxb4VvzYtIEQVxj888ZI7JiJxgSqhVaqfg4ekhFVoJwN
         XaomxivyKr5LN41v6J2b8/njxmHwFOKqiQdqYSPRZifpdeMuSzyEsI/h5+SfA5f/pAjF
         80Q2GVsJWo9Zw8xouGrLwKRD4Xv/XzxBk5G7ku0d3PV5QtVgozeIe1+nBK9I+NHMCVmQ
         LxtQ==
X-Forwarded-Encrypted: i=1; AKwUvBzX1xjz6CHX1RfMfnABEglVtj/LbQTu/33GlgU6t9pmWvXBGU/q/9BVezfDZFYdC/3EY7Eh329Q8RxPLLg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKbDpQHsvY8IAC8bGYuYouvTXkNd1+2yu5fMqOaLr+nsF0Ie8TU
	2SvPW7zs+iHaxxT+Db1m00HMZrCA2fC7l7Fujklftfv0NOyOD05K2nY7
X-Gm-Gg: AYBFou1bkVSb5wM6iUVXlSjh5bgBdikIFAwFscG8hzG4ma1JYug3sf5VPmdqgeoUCI3
	N8UD2xv7KQjj9i3XpufEVLItJQKG9XXLDHOgB5Lnmcqf6V8deQ5wvbBIIQbmKcTeUoV7vWocWX5
	+JRG7CGxyvb9kIJu4XwyJ4UaKWkW/Zc6VISYC5gqpypDqnIKJJDPamF+R6soHKUVtixaQE+xvnc
	BTx63TCtsxH7RjF5QBR4+Cznx682andoowpromjmEdFNUKsJNI2BpI0IIj6aOdShHPwqCeoHVkx
	c8ZwTt39IbCsBEW4ymxcYS++hewbvliKRCota/dvt7KMDlL/tUxbb+Gnb0YA5JYAJpsPeZ4svZv
	LTp9DemwRVaZQsun60KwpVZYqSLWzF/6nBYI3KMC0LwrUEsR9WRqlv8fr6Mezi4jKRZNsFpB54u
	SIGWa++UBGyg5d+EqEvEzoXwxMW9k7Ru8ymT0nqVZwTDIue8mHbbJlvTACw3fLg6GSVMiPB8M99
	Ceog+iorLEYqWqM1OtYGHDuH4a+CAmqLpjIh47U3/A6DPptQ675HchYPobNyPk5hudPvnGp/RhK
	nc7gjJlOJT4MZ388h+ZYTYtZVfmQ5TMnHAjT/vMTtznU/8PAmxbsFyk9Am9d6Kqah0o=
X-Received: by 2002:a17:90b:4b84:b0:3ab:884b:65b4 with SMTP id 98e67ed59e1d1-3adce154993mr460193a91.59.1792715829881;
        Thu, 22 Oct 2026 17:37:09 -0700 (PDT)
Received: from monk.wireless.sfu.ca (border-p1.nat.sfu.ca. [192.75.244.1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adcb0a28f3sm964360a91.3.2026.10.22.17.37.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 17:37:09 -0700 (PDT)
From: ma.mandourr@gmail.com
To: Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ma.mandourr@gmail.com
Subject: [PATCH v2 0/3] KVM: nVMX: Don't clobber VM-Entry instruction length on soft INTn exits
Date: Thu, 22 Oct 2026 17:37:00 -0700
Message-ID: <20261023003703.450577-1-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mahmoud Abumandour <ma.mandourr@gmail.com>

KVM writes the length of a soft INTn that L2 was vectoring at the time of a
nested VM-Exit into vmcs12's VM-Entrty instruction length instead of the VM-Exit
instruction length.

Patch 1 did not exist in v1, but Sashiko pointed out that prepare_vmcs12()
overwrites the VM-exit instruction length that vmcs12_save_pending_event() saves
for soft events.

The selftest patch was written with the help of an LLM (Claude Opus 5.5).

v2:
 - New Patch 1
 - Same Patch 2 from v1 (with commit message changes)
 - Patch 3 now extends nested_exceptions_test instead of adding a new test
   (suggested by Sashiko).

v1: https://lore.kernel.org/all/20261021042603.608292-1-ma.mandourr@gmail.com

Mahmoud Abumandour (3):
  KVM: nVMX: Fill VM-Exit instruction length before saving pending event
  KVM: nVMX: Don't clobber VM-Entry instruction length when saving soft
    INTn
  KVM: selftests: Verify nested VM-Exits while vectoring INT3 and INTn

 arch/x86/kvm/vmx/nested.c                     |  6 ++-
 .../kvm/x86/nested_exceptions_test.c          | 39 +++++++++++++++++++
 2 files changed, 43 insertions(+), 2 deletions(-)

-- 
2.43.0

