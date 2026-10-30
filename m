Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793330992;
	b=gKbw1bPcC2UUashg0boAQgbqyqRs5nkVmvLCexjP/ZZ34tliwYIKaKLJAwZnJusNLV3g
	 bbLjxwF+tLq/co5Cw6jw4KB4wgnjmbRGg3rSymUe0dVJkgGoBpCiMkQdTkw27WDtXs61R
	 iR5n/lghdJRRGLZ06Te+YXpST0RcBwWEuyL7y2AZ1idoioyAeTC0IURo1hSFca/Q4S+1S
	 A2EAT9D45FPiBF1T+VsS4CfYYrk8vUm6QCcQdIozPPbdSOOY5eS6TNEKZUtOI+4jZ7IR+
	 Q0li40Mr9FYJFz/7Asn+Lvc7qSZ6M3AOPTyJKzBrvUjUYZsyn4DDnbMZpDl7jZy5cwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793330992;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=dahY9MpT6qRl250d4uUuF1qZsWTwuAAtLrsM4UyodQY=;
	b=NtDCe0qnrowk7X0soNp2BdzCVoSr+ygCeX6zawBKilUE0PODZ0vG22/GxA8YfJiwjt2R
	 S60firD2Krqkvgw+QbG2DlwLUEnqBchkLX7nUmouXhRdvdTNqv9Z1XxQkc0XvuFBkdDZP
	 SovlErn6nZ0I1J4hwa4E1Hlxeu4i1sAimJoZgqIhcPULi+TR19XpKHy7yeJB9HARTJaUT
	 oBF4O6BhlBeKq1nL4uhr4PWyIIms/Q+35iVutxOZDyWT2WdDDI/yRz5dAj4+AOU3fLa8f
	 qVu4P4O8OgcyXCJxRYj4wpc5m1FzKxPRDlBR+brhBMnfj7QhCCkM6Yl9T+JvtcqWSUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K+jOzsvZ;
	arc=none smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8543D606A32D
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 03:29:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8543D606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K+jOzsvZ
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-88cfa501c5cso61199b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 20:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793330992; x=1793935792; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dahY9MpT6qRl250d4uUuF1qZsWTwuAAtLrsM4UyodQY=;
        b=K+jOzsvZ8fin3aq2OVYoARcSRIp4cKZM1dLjFNCiPZB3P8CvDLZQvCxwfrpNUPqWll
         yPhzZGmnQBxLkEdTB6YTG1dRqgAMlV3yDUX2z7sLf4/A3lJs+fUj1Gjx0J8CzNSvjHa2
         /HJMIm5t1VpDT0X5dNFoGZKvXdJv6rcI7N0ayVH4viwXXpjWBQYW+kTlPyNEVURI92iR
         qYxXi6UENCEHwMJtubWtm5TrHBTzpDnKwZkjBd0P8mnHEUuIIM1qcOej6mBdk/ZKDMTT
         UkMerMaSwC8MmF6GhlSIcnfBv7ScFFacQdfwS7jQjwTwJyGoIP0yr3deSeFJha7k1Lli
         9xCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793330992; x=1793935792;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dahY9MpT6qRl250d4uUuF1qZsWTwuAAtLrsM4UyodQY=;
        b=R5G16K9YTyqxIbvZaYfIFnPCH82HXEppzAFIpNst4gouMCIsIEmSNlP32qyvcpx+6t
         52RtYQ2MmpPCRxruFAhZFcVhNdmZqEFpkcoiV7LswEwNv5ndJpvnnyxjr10is+9UmzKb
         zl2DJWAQJ+KmR8wZ9pGGD2UXXOf+DT/VO6llvwolGmRIWf82fRNn7TQr1OKoowC/NcZ2
         eUuHENh2/i+7MvXo9Fw/cmxoAx+wWojNsvOeBYaZ4W2Wpc5tcBaebaSI6pD9JwjC0rMu
         GMxlWlzveWzTJrABOg4gnNr1O/dRMwBqbrNEizA0+IkwKW3AgrA+idG3NDCxcYKBpgDn
         0Zeg==
X-Forwarded-Encrypted: i=1; AKwUvBywBmzdNxcmKOcDq0Ch9dGO08vgoeCHjW7dSmffSnOzWBBtxSarPzZWx/5ekUjZQJN4qo+l1NvumhyfBGY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIJKXJ7dA1yCF5SZlraeWXDcxRk4tHnYM4CV7JyGVvBftZ09zWk
	4SMXsxefZnilR0xaOlN4Po9VdgRo6bAC3d21qVO9PwrkKHo+PZUTEgrGBVYhTw==
X-Gm-Gg: AYBFou2675+ZfCsALEnzXyFtMBx6EU4yBsXOjOHBhMi1Lr6S6wSzx9F/4e/rj9Ebw4J
	P0Z3qG0059HuIwXCGg7XfuYTyE3jDKDa7g92IsPoABeEeL/fpBfKWwO/Vpg8i8HIKbAySKgYbAo
	hEVlYxYaCkCa+2ZubROC3Lc36+oce9/Tfe/XU1wHWq26jT7auIf6NyIfaE22kPct9vleLkqpJam
	Bcyk9BoD10HILU/gPQsu2gJz5wnpcRIFBUEZT+8bynKj6zNhiNqPjNTxCTbRbqXsP7sAW69c4Be
	wGjISlz7jMtzePDOuzBeKBETUew7UQvicqOebmGk/dtDas8zbVFfPd9qAi4xe0sszmPzvDG0U37
	f1An7LO8jBf1W5fRcfTZxDqIFAjjbix4U28q/tOOgUxkUVnNiFnCAZ1+34Mz+WB6QsRZCubV4Xm
	erbP77fxpGxJIm0wfkobyq7VEYIuU1wAHlZrAwIzlcll4N6eNtqpGByMbReoENSlqEKa5ibbPjB
	Px90+oRUt19D3DY99EpctoS+Zl9ICYgxtFzxQNeRtHUSA0HifQFCKze+lCBgtHHHuDLdMRkyuD7
	Bl1zf2LFLkYBGrFqVkRqW7gtjIy/aKX+ehN9lm9fKtc7lb1zizDprOdRIjP55hhPpsQ5jsP25CC
	Wjk+OKCMELXOozbri6IOrG/7mjw8MdTtiybz5YUGPK82ZCsSqqWDPnOoUsqWvNt6t7FI9ryMg
X-Received: by 2002:a05:6a21:39a:b0:3e2:8fdc:a6c8 with SMTP id adf61e73a8af0-3e9290fd040mr1054244637.72.1793330991760;
        Thu, 29 Oct 2026 20:29:51 -0700 (PDT)
Received: from localhost.localdomain (S0106e0dbd1c8af8c.vc.shawcable.net. [24.85.96.29])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb0981c5desm111713a12.27.2026.10.29.20.29.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 20:29:51 -0700 (PDT)
From: Mahmoud Abumandour <ma.mandourr@gmail.com>
To: Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mahmoud Abumandour <ma.mandourr@gmail.com>
Subject: [PATCH v2 0/2] KVM: nVMX: Don't let L2's LMSW modify CR0 bits owned by L1
Date: Thu, 29 Oct 2026 20:29:35 -0700
Message-Id: <20261030032937.2813-1-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.40.1.windows.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

When L2's LMSW exits to L0 but not to L1, KVM emulates it with=0D
kvm_lmsw(), which ignores vmcs12's CR0 guest/host mask, so L2 can change=0D
CR0 bits that L1 owns.=0D
=0D
v2:=0D
 - Patch 2: order the CR0 store before FNOP and check L2's whole CR0.=0D
=0D
v1: https://lore.kernel.org/all/20261029235040.12013-1-ma.mandourr@gmail.co=
m=0D
=0D
Mahmoud Abumandour (2):=0D
  KVM: nVMX: Don't let L2's LMSW modify CR0 bits owned by L1=0D
  KVM: selftests: Verify that L2's LMSW leaves L1-owned CR0 bits alone=0D
=0D
 arch/x86/kvm/vmx/vmx.c                        | 15 ++++++++=0D
 .../kvm/x86/nested_exceptions_test.c          | 36 +++++++++++++++++++=0D
 2 files changed, 51 insertions(+)=0D
=0D
=0D
base-commit: dea4f6380f4ec96e8f3b0aaf2343764bd0d25ef4=0D
-- =0D
2.25.1=0D
=0D
