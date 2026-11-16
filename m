Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794868238;
	b=b8bEg0asgnVhBiRUu+3/CWADFdvAioBaNm7/Gjqu1VSe9z2vFufZo3hchLkJYn3S+Niv
	 SAub0s7jdWifYqTy0DLQzuNSf1Gh6SToYwOpqn4hcNYwgk8CxSdffLwAUi339Y55saOV5
	 mLEB6GB7qKNlpg5mVljZEoMzLTrkIjRr5JMG2nbfsCYgYvcpLKNarfLjJNMIPfTwA6FBT
	 uPrSDDg8VMCjcqbxWuEy64KK1aFzw67AycYYnDyZD6pPxsKs7+TYPl164qhchKgtyMBSn
	 qYTNAuoRBLQ62gWDtsyG4/w7BrMJfbRcR8Udo8WewO38u1rkBFZgnNd9gCV/3e2UzUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794868238;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=C0gexXoY+SLiE6S59pTDegfKVc6UD8M7O/wbYmXheC0=;
	b=EOCer8HHwu6BlktiL20CQ91IqxGyMeFC/SggFNm42l2PJCkcvotjoJY0qNoDbsufjYHb
	 2nS8YbOp3UmZUjZzSjZ1uNtugWU+nMh5uxardg4hXiF4Hk73jAyhC1SodLdUcK+xsSbIm
	 T3SzbnQvV5nMT55URhntZVeNHA8NORbsCU0dJQ+o6dPKB0LjF9/+myMH0V7slZD7vghaV
	 QRvhCEmnqtsPiwK+GA0bww5EwJ1dDF8WfEFHnM09bYjUOrTNtvFuhGa/WAS8ERQkRuJ9s
	 gbO00ElbHdJkoYMynPJThYRvPvXZOlYGJhroNENvBdPxl1ddqV+8as1Yh084kC6kk9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0X+VEt9v;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38837606A88F
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 22:30:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38837606A88F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0X+VEt9v
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3b08a162d4bso2204942a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 14:30:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794868236; x=1795473036; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=C0gexXoY+SLiE6S59pTDegfKVc6UD8M7O/wbYmXheC0=;
        b=0X+VEt9v3lkfg3CTHkk2K5why3V7N8328n8SLfJtO+t27n3Wy9a2BTqHYU2qiWfdV0
         oiL+xNWie+Tb/c2TCRzMb3wsfHnvom1+RuaNxKF0mUMHCG90X6ygaysAkRehBOX8l6ic
         x/+GcVGvadXmaQ/YANAoesBcRlABXBGFCiqWq+J/63NFkqnHHTtLnHTJP6AvWCR1nLZt
         2jQyur6uHqsFCXV29VDfGNaBcBSN/vw+qoH/GsFQJ176UBsE4qorWl8gjTJjZRqoLZiB
         hVcS1e8l7bjoo0WUsyscy9GdwsG7ht+d3EmeJFtelhg9Ay4jTMAfWppT2k7evyK2t4OE
         PFuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794868236; x=1795473036;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C0gexXoY+SLiE6S59pTDegfKVc6UD8M7O/wbYmXheC0=;
        b=s3WcVV7L0jXC5NHQc+cVHQKkPkAiANxoHIgaRGGbM8Xsaj1fvKWepRbvkaZba3xKum
         znPFAyssUbO/YJuFRTnB0DP2Vj9vlUKqFuTJ0n/9nldgARRKD1uGFByTyYWJCys4qfU4
         UIIgW41GVkGewsAK+rwSLvZeqhxnlXE2Nm2HsWGcsLLvGuiZ1n7TjAALJbJ9PDJCrHBN
         Ce66DBCJ6i0ZvKxVgxZRAezPUVw8ovUwPEe1l1bp2fcswoZbv7aI0eJjjR2uMbD82G8Y
         v6XzGnFhVUZcYkB/xGJlf6vwxSA+YyPn0D7zfrVNCZIT2pUJq7DGal6d/G27vHOWoFoE
         N54g==
X-Forwarded-Encrypted: i=1; AL+hErFLXpuY+M5V7u2fhT2ca9pJPWEJV18/jRKqpyS0v2TTUf2GdAvaThVAXrgM62JL1uM+q6FNJs7wETZntCM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/b30mElnhabkkcbHOhUvbEf3887kYOMynx3Aymra4cox2v5bH/
	XhfR9SS4oUDbuTHuOmdE8O+7wvScKsJs1JkDtTbFccAoIkADq/b2AKeQ
X-Gm-Gg: AZFdTZcvKnon7hVLH7R3TRELIV7wIWRuiz0IX2/avigiJdGW5ll51RPEIO/JbzYr89p
	Iaxv7upzEOVxktZm435nF8pB3Lsdgf9CjaS5o1/s9Em8kFNp8uDpkEnZ9pSKEIsUnLmOqVqPJPV
	WfNFSv8FiW6Ld6q5O6F0jD8psE2GJ0eq0Ox20dL2iv44TWWLnfMQRGkB/MDnJ1BEn+qw3MEpXkW
	Ju5Xadi692vJuhlFIkqrkeA3Zf5x29HRkqWI0oK5UbV4jSU3U7dld6D/ZGOUk/EwgN655Vqqc8f
	IpvhmBWiOPDhcujQ46NZitvW7erEDn0Lgxu8hYXu9CxRGhyxU6gqQbaQGpWqu4hImZ3CemiuJ7w
	F085DnyYT5jtWAN7vdiPNXhp7hpPOnefaKAgdr7XhT8ArF6NwfzYtdrY0wqoYjh+LNVC0HxZZEQ
	IXYk5D7OA/3g9vAuuQU6eXNEnpouAghotfkvo1UlUnyJ+QdHj6c5/L4Z4MDD5GnAcJhkCtBkk/x
	7MgL54nxgbFG+P+/IwTPSZulXK36TFLqgT21LAzTpmvJy+NvdDJNRR1I5oYixLRSQSnIg18sSjA
	6kKq5sgKEh4NFXRlSN99oqCnugihOUOhIC2NGatFrEwNhS0ixpz68ELipO0aJHa+yoO9KsqEYdG
	WfjrH/oyPlcK/TLNQr+cH+mW5jP55aAp8HBXZeCKdgFKPBmthTUwyq88Wd3fTqafoaVtNsWUlj7
	IaHE1ofvQF5Q==
X-Received: by 2002:a17:90a:c110:b0:3ad:93b4:718f with SMTP id 98e67ed59e1d1-3b1b0ccda1emr9629636a91.65.1794868236231;
        Mon, 16 Nov 2026 14:30:36 -0800 (PST)
Received: from cs-arch-srv04.cmpt.sfu.ca (cs-arch-srv04.cmpt.sfu.ca. [142.58.10.48])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac255634sm944375a91.5.2026.11.16.14.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 14:30:35 -0800 (PST)
From: Mahmoud Abumandour <ma.mandourr@gmail.com>
To: Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mahmoud Abumandour <ma.mandourr@gmail.com>
Subject: [PATCH v3 0/3] KVM: nVMX: Don't clobber VM-Entry instruction length on soft INTn exits
Date: Mon, 16 Nov 2026 14:30:30 -0800
Message-Id: <20261116223033.3866283-1-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
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

KVM writes the length of a soft INTn that L2 was vectoring at the time of a
nested VM-Exit into vmcs12's VM-Entry instruction length instead of the VM-Exit
instruction length.

Patch 1 is there because Sashiko pointed out that prepare_vmcs12() overwrites
the VM-exit instruction length that vmcs12_save_pending_event() saves for soft
events.

v3:
 - Rebased onto kvm-x86/next.

v2:
 - New Patch 1
 - Same Patch 2 from v1 (with commit message changes)
 - Patch 3 now extends nested_exceptions_test instead of adding a new test
   (suggested by Sashiko).

Mahmoud Abumandour (3):
  KVM: nVMX: Fill VM-Exit instruction length before saving pending event
  KVM: nVMX: Don't clobber VM-Entry instruction length when saving soft
    INTn
  KVM: selftests: Verify nested VM-Exits while vectoring INT3 and INTn

 arch/x86/kvm/vmx/nested.c                     |  6 ++-
 .../kvm/x86/nested_exceptions_test.c          | 39 +++++++++++++++++++
 2 files changed, 43 insertions(+), 2 deletions(-)


base-commit: cbe54fc3462b3949ab27b9ae81fb9ddb509040c7
-- 
2.25.1

