Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794859461;
	b=GMKBbtYJvD0SDNaUP522u+RbZd00d6HoOE4BjE0jhW8OZplfATx5qAAhpSV1HjnD03+o
	 lKi62OkigZUGk5d5zf8QA+JE5JOrsVOtDLY7jNllHXyPzATKzFF81SRrX1PUQ5A54DldL
	 +uwm4t1wrhzEoYmMdVCKLZmxd4jJfSLPoS2xqMLrMTqium3dedpcGTr7yY95Q9aqIGMwJ
	 eI09UrVopl5CguXvoZM6SwK88tb5mIVi3znpjIvuSyw6XuT8Lyu/xMsmoyYz45BceaWAS
	 cZdunFM6GNBGcvMmyQPQLTxHv+ErGX7Sj1n38rvDyjEzxsSaVO7IUU42KNHjf9fZGog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794859461;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=9bIAYBNiz3NB6EQnZLvtp2y9CTLyvsz22fhiOVY49c0=;
	b=XGZ0dHqSKa7muRc5OuiXI5Wquk7zCbDApeC9qkQqcP6KkOsTn+ITBV65mkyNWk41tMWV
	 qfmnN36stVEo9ic3QHtWsTEV/dW7qy+XfSGMDjNOI6cgOOA3CnEgwjEzlBC+7kGkHQIC8
	 JL0thM+Jz2JIpL/y/D0U6Oc8XLPlXJgrSqSIZqm1cxLkPKqKP1yNXge4wIAvoLNfoBchL
	 YDN1vSmlje8YFtdWyYmwnpAso4TKjZ2q+w7IQ086w+7mCxgxito1EUELthdcHvwSLAM/8
	 4NRj0VpUlhq/eu1Ps7A/FhJa0okhSlTiNm9lU2oWERKCyrTSwv3g6iS/aEmmhZdA86Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=kFM0luVl;
	arc=none smtp.remote-ip=209.85.210.69
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A2B6606A339
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 20:04:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A2B6606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=kFM0luVl
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-862c4207de6so1947625a34.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:04:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794859460; x=1795464260; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9bIAYBNiz3NB6EQnZLvtp2y9CTLyvsz22fhiOVY49c0=;
        b=kFM0luVlAyaPnMpEWBHZHbtT9nQHMti5+YD7xXHIEjvpiSWGcR1jxqzmVRhcdQoL1H
         e1GTdSnKKtLt0AqjruwQN5b14Eb11WkzOsx/p+sxMTzAR69HjKRVVZfxfPURYC8pnUtD
         mx1H7nFJwodVXgiNqAsmmVA8WayS9g+TSZHQWIvitH6H4ZAp+1mRDVCS4Wl6pMj9lhR5
         D9BWXLBH3ubKPehBb/xjl54AfUd37KU+FwyKKLRjtkS0qHepXley/lT/hgpR9fl7BWkS
         4JeaUkut0V8u7x91IMLRMfTSzKQrZBEloSrIMIfnIYZq8K2qNBQQdplukIRLEOwigmlS
         Bb7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794859460; x=1795464260;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9bIAYBNiz3NB6EQnZLvtp2y9CTLyvsz22fhiOVY49c0=;
        b=2NuaOqaTOXjsKa8ciqDWF5J4chDnNflxsGqvp536uYgSOtp+tVw+9VQLZygVpZoi8c
         4lXCoPyAoR8XKdu9Y/iteNSFcGzl8eqDNeGqM27esMlGJePk6ZSaxFJ5Lr8Ah1QvgvpD
         4GVRaJ3t3rtG9MilidN9+CgGzMfF5zbSAZr+w+ufCLVsKaFQoCcIpJLx0JZk7Pf7m7tF
         yX/Y51Y7uxXlM5yVO/P1vfToyQuPk1CLa4oJnZ6otToqJxaFZxKs0UV3mcs3q8OWt6Cc
         O3B7mxYoXasDYQ15mhqt9uuZS3EXwYbUfQiYpU9LVPq6FdJUYVBXCLxJkU45VjGDYEQe
         iGTg==
X-Forwarded-Encrypted: i=1; AL+hErEeuNAHqQQQxmd6BuVijqMqxgm5mbvMgc3/xlmVBkd4hRhcbZDHmrFVesY+ZRiDgv0cRgx4ZxWbPUNNR3A=@vger.kernel.org
X-Gm-Message-State: APuU4Z+qI2lcPZuwZV5ua2Q0ufQ+w7wnoZtG7Q8eYfpH2AUOBtcOK/ca
	fKzD8CnYC1cNJRX7So2az60/lNQ2WaTk6GMj9cDQ7QTSF21ztZzSfm2vOMx53OytcYpuO3X2L3k
	yBbdcf9C8rxnpMSui5m05EToVWQ==
X-Received: from iodf4.prod.google.com ([2002:a05:6602:62c4:b0:9ca:727a:80b2])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:152b:b0:4e8:721f:2824 with SMTP id 5614622812f47-56e65625626mr9335826b6e.60.1794859459512;
 Mon, 16 Nov 2026 12:04:19 -0800 (PST)
Date: Mon, 16 Nov 2026 20:04:16 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261116200418.3535619-1-coltonlewis@google.com>
Subject: [PATCH v1 0/2] KVM: arm64: Fix inverted E2H0 check for HCR_EL2.NV1
From: Colton Lewis <coltonlewis@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Fuad Tabba <fuad.tabba@linux.dev>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"

When commit b2a324ff01fe ("KVM: arm64: Use HCR_EL2 feature map to drive
fixed-value bits") migrated HCR_EL2 fixed-bit masking to hcr_feat_map,
feat_nv2_e2h0_ni() was written as !kvm_has_feat(kvm, FEAT_E2H0). Because
ID_AA64MMFR4_EL1.E2H0 is a signed 4-bit field where IMP is 0, NI is -1,
and NI_NV1 is -2, !kvm_has_feat(kvm, FEAT_E2H0) tests E2H0 < 0 and
returns true for NI_NV1 (-2), leaving HCR_EL2.NV1 writable instead of
RES0 for VHE-only nested guests (and conversely treating HCR_EL2.NV1 as
RES0 when E2H0 is IMP).

Patch 1 restores the check in feat_nv2_e2h0_ni() to
kvm_has_feat(kvm, ID_AA64MMFR4_EL1, E2H0, NI) (E2H0 >= -1) so that
HCR_EL2.NV1 is implemented for IMP and NI and forced to RES0 for NI_NV1.
Patch 2 extends the arm64 hello_el2 selftest to verify that HCR_EL2.E2H
remains RES1 and HCR_EL2.NV1 remains RES0 across both guest EL2 writes
and userspace KVM_SET_ONE_REG writes when E2H0 is NI_NV1.

Colton Lewis (2):
  KVM: arm64: Fix inverted E2H0 check for HCR_EL2.NV1
  KVM: arm64: selftests: Verify HCR_EL2.NV1 is RES0 when E2H0 is NI_NV1

 arch/arm64/kvm/config.c                       |  3 +-
 tools/testing/selftests/kvm/arm64/hello_el2.c | 34 ++++++++++++++++---
 2 files changed, 31 insertions(+), 6 deletions(-)


base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
-- 
2.56.1.750.gf70dc682cf-goog

