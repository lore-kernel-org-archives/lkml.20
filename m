Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D30BE486E46
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 11:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792324361; cv=none; b=dFqcda9TMoUo1aKFYbX2m5KThk4RP/vGV1xaZUuhrb69SEpPXphzZF6cRkGSVUntTVIYX4Q7GOElIHvXccgrp37pJn2UIAId4dZ4YdZ6qleiddC8xB/zVG1XcEm8NQOFSqGtHfIbCtqIM5mRZ/ZRClYTCLhbzik9M9hswYaVtIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792324361; c=relaxed/simple;
	bh=zlzDZ4QVexn+gJWuPsMt6yyp+RIDGLTBxGTrkJHBfTM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IylNUTKpzvNZuWHut1NW7xAovk4RGa8jZECqPhbWy24fRNWtDalcmgu96QQNnE+4+rGYA8via55IoQZyXsqpicTYEYn3j6xMvLfUwukTN0rUBjarlAUQDLSTC83gGuD2OU68VT3Gbstoy2excvZp9NaBB08iVkK9oDdVd7AjD8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=syK2D6Re; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="syK2D6Re"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a1d484b4a9so17341315e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 04:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792324357; x=1792929157; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VOvtpeBhbTa2IsJhqs4AYerg0y8pdKV2Hefh53RZuO4=;
        b=syK2D6ReV+rDITG838XBxpfaov5Tw8Fy6SHv4h3ayJs2yZpn/njWD2bIkXLTYzJ8oE
         Rbb/Ukel6n1RwrZtYecYMCvZl9SJLcfgtJpr3ZjDZV6WH1wHU2mWplLV2AwD+CcHrTzD
         M8qvWxvk+E5py0dDTHqkD4usi/CoJAskNP9ufh0vFYjwNHnERoA+dtGZlTEcrglD8yl6
         ceVCbg0qkjaI6mdQ7Tn3YtdQ0PN7u/XI56kp0+MCsk+05xwH8+9bWnA3CEvnMkLh+W8p
         bn7iru1yb+soNNGK+UiEreKd+s7d9jAJJoqssKGWBAfuOkJFW5b/WkGvePoL516zDp2s
         3PKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792324357; x=1792929157;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VOvtpeBhbTa2IsJhqs4AYerg0y8pdKV2Hefh53RZuO4=;
        b=ubfuC9HaXwUXwxise6CohHE0r192ykK+GzKpBsoOJdw1OwfyifgvB6jt9Luwc1a1Tr
         w1OdjocYnvyRdpsqNwafMDBHcP3nCKx/re31KafBkbc4R9xqszm8Z6Vj+QjN3Lfeq3kF
         kGYoiPuZ/+125KJ189imqa5XAJxjLCaoK+K7McKCWvNlNGfxJe+mX8WfYZgEs8VPQbMR
         5H45IAjrUb+cZgbOLZMd3ZO41ntL9hUdtUiUpXOp2kIprA74KBxFUJiv6LBnMfJo0dzG
         AHFW+Xtdu7XHab3m8/21c7UYnqr4NcUKCBIXylGk0agZko/2s0GWBO8M6N0a4vG9mN//
         KIFQ==
X-Forwarded-Encrypted: i=1; AKwUvBzOL2ngthffs25dsqGa6R56abaGOAiV0qZ09Gv0s5SV7O0lTddMRBKNRn/3jN2Cltn6NK+ZTS4dBxQph5g=@vger.kernel.org
X-Gm-Message-State: AFq9FYII0rqe+TsO1Gz0KcddW97fg9adgZsWKtBZJ2PBf4uXn/fBwQwR
	FHRR5UgpaPJ8KmJHfa/olQoc6r4B+NZLgIZqDvTYz1Yxogc4n+YFXVqNz9K2WMg5HCc=
X-Gm-Gg: AYBFou3BUN105GzOnKwRXTDMv+KQGlXjDSy93DxKlbrDbWU8NHoRBE3U37O4dG0JIWR
	7ATBxSAb6JEOoDwl8ar7BUL0fdAZubamNJBlVuLVYfTapjz87SSSMaWZhfCD64O8k3UDrEnnixB
	l4lkfW7wpCNFNi3xkoFfylcvZo9qee9gM5nb4AYR+MBr8LmTAFU3CH1BOQ0J0xPjxEAypynDSq9
	H81ynxyoCdZWera/oCIMDcAzAmi+DYd5GHI0S0lUcqTao0Gr+uttm0n5JV/whlqUfYCvxPBQRUn
	nZNlbHpF8hxKjpGeUMZlTqdGUOoCboItHPMnptP6ktw+gU8gFNOEYJM8Uu22I/He/+mZeCrPGyv
	irE93/Ase+ap7n0ke63v9IZwMjPXcGwqSiPs9A0z1ULA9NfBp60jcGDafMJUJFH2FIuFsGWw+uC
	Pyl/vaSEr57gE0bVbzrupWMfmvU907c2YjVpkZ5+haePVCnxBzrdgr1eYFhd/eZ3Z1FEV8b+Ufh
	HVYqHqMbYiyFqWoOO25D19jQsLwZ2QDIhBm2hrsJ23qzTkK6RAQqWAm5TA6WzgKgN45Afzfsnoe
	AGyCf5cO7GLJoTrRTtLeCSTqhm2vbT58ggtQJWcFRs26hqKMTWjyLpG0MGSDJE7tJWr+j7yjvUy
	pLN8DFpMlJ04GzekpKx/F1EvYJXA2tnHjtl0aNQbj2Dj2SGW0ZhVkctOyJJ4=
X-Received: by 2002:a05:600c:3b22:b0:4a1:7690:d878 with SMTP id 5b1f17b1804b1-4a1d7615cb9mr96775045e9.17.1792324356624;
        Sun, 18 Oct 2026 04:52:36 -0700 (PDT)
Received: from DESKTOP-42GVE6E.localdomain (206.red-88-16-64.dynamicip.rima-tde.net. [88.16.64.206])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1d756ce69sm123877385e9.4.2026.10.18.04.52.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 04:52:36 -0700 (PDT)
From: Pablo Azuaje <pablo45154@gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marcelo Tosatti <mtosatti@redhat.com>
Subject: [PATCH] KVM: x86: Initialize the PIO bounce buffer on PIT control-port reads
Date: Sun, 18 Oct 2026 13:52:29 +0200
Message-ID: <20261018115229.315110-1-pablo45154@gmail.com>
X-Mailer: git-send-email @GIT_VERSION@
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pit_ioport_read() bails out for reads of the control word register
(port 0x43) without writing to the PIO bounce buffer.  The read is
nevertheless reported as successful, so the guest receives whatever the
buffer happens to hold -- typically its own bytes from a previous OUT
or IN on the same port -- as the readback value.

Real hardware returns undefined data for reads of the control word
register, so keep KVM's behavior well-defined and predictable: zero the
bounce buffer before returning.  The read is still reported as
successful, and returning the guest's own prior IO bytes as a
pseudo-readback is observable state with no architectural meaning;
zeroing is the least-surprise choice.  This is also hardening rather
than a security fix: the leaked bytes belong to the guest itself, never
to the host.

Fixes: ee73f656a604 ("KVM: PIT: control word is write-only")
Signed-off-by: Pablo Azuaje <pablo45154@gmail.com>
---
 arch/x86/kvm/i8254.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kvm/i8254.c b/arch/x86/kvm/i8254.c
index 1982b0077ddd..a4c23962f161 100644
--- a/arch/x86/kvm/i8254.c
+++ b/arch/x86/kvm/i8254.c
@@ -522,8 +522,16 @@ static int pit_ioport_read(struct kvm_vcpu *vcpu,
 		return -EOPNOTSUPP;
 
 	addr &= KVM_PIT_CHANNEL_MASK;
-	if (addr == 3)
+	if (addr == 3) {
+		/*
+		 * The control word register is write-only.  Zero the PIO
+		 * bounce buffer instead of leaving it untouched, which
+		 * would feed the guest whatever it last wrote (via OUT or a
+		 * previous IN) as the readback value.
+		 */
+		memset(data, 0, len);
 		return 0;
+	}
 
 	s = &pit_state->channels[addr];
 
-- 
2.53.0

