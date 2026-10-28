Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793208810;
	b=jV/a6NlKadLVh1sxrSg5Oc89XTikw+f/nw19APApSepTopskuwJyDhyvhKgTFot3lZuV
	 D7tEMg6pKWXLouvvQdNGSt9znXqsjlbnlVnNaPPC46E3kFVruIVZl8zMpfqR7UmRvwtmq
	 2CoZn0jQ1om2T+Jf2OXuxz/G9NhyqKDmM5jR3ZAV7fGe+DboTz04teiF4DfSNu9eEHXMq
	 HXDpJg6PDZ6FE2N4XU0lLOx1KgUa+5PEHWbnzZxccKqK6OMlBscTdLEoSe7UdQ8xcGkuv
	 GAyXeDHYTYARt3pP34vMtyGDeKkyeCKL+wouHFw3B/oiNk1+mh+uwxEsO60If8Gk0tQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793208810;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=O9rfZ0Jd16n3nkrrXaqreL+BHcitQpk1LeDPhsNkX+I=;
	b=Ki7XTqThxxspuWmGhjyTQTW49wqdEZlqlqXEYnYZuQx6fzSe0JQ6qNdRjKATdfcEpQ6L
	 lZlCgkTEwij45/yyOMOSXO/jJVt8RkR496Qpn0DptpQ3HWkfrzwlZkFG6+dUWjM+oU16r
	 oh36A+IXQ4KwamkNY2pj2JngjhDwztKuVsE+71rHk7jrh+NW4ZLZ6QxmLiz6ctcnc/h99
	 oBHSztg916qYyRq06UYZVfVHjw65loePW8ZgA5v/q5K5uOgkEQQtRJZEoWfOi4VeoL69V
	 qdWLKkSdTckkLsqFii9z80kc+Q78S2H9MLMdszhqr8rQqxdjTQH4oXVCeHIzFO3KnQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=YlQYXeA+;
	arc=none smtp.remote-ip=95.215.58.98
Received: from mta1.migadu.com (out-98.mta1.migadu.com [95.215.58.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8648A606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 17:33:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8648A606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=YlQYXeA+
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=yzH4AdgVGm2MfoIvt0cfXKSp7A6q9PsvkvtvOKVlIks=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793208805; v=1; x=1793813605;
 b=YlQYXeA+FXvQn5/0qo5wxwK/k+KnPMXUywJ4MFyb6BAqWttR1hy6yZgF5zoj/j89osbfrcs4
 zRbbaGPdVZFCoXMknnt/NmtLzy6b153fddpB9QRprhrcDKsOfgB2dzz5DVWOdVshuibQOFpCm+X
 auN1YCpLlsSNM+u4yf8UZDtI=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 6625fb773fa39b9a;
	Wed, 28 Oct 2026 17:33:25 +0000
X-Mizu-Trace-ID: 6625fb773fa39b9a
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Fuad Tabba <tabba@google.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] KVM: arm64: vgic-its: LPI pending-state fixes for DISCARD and CLEAR
Date: Wed, 28 Oct 2026 17:33:17 +0000
Message-ID: <20261028173319.1807811-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
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

Hi folks,

Two follow-ups to my DISCARD fix [1], for LPI pending state that KVM
keeps after the guest has removed it. Hopefully in time for the next
fixes pull.

The first closes a window in that fix in which the guest can still take
the LPI it discarded.

The second does for CLEAR what that fix did for DISCARD. Without it,
the guest can take an LPI that it has cleared, and a racing CLEAR can
trip the WARN_ON() in vgic_v3_compute_lr().

In my reproducer, the guest takes the LPI after the CLEAR in every run
without the second, and doesn't in any run with it.

Based on kvm-arm64/cross-vcpu-sync as merged in kvmarm/fixes, which both
patches build on (e99ff76f4a02b; also applies to kvmarm/fixes
79f3724ca8913).

Cheers,
/fuad

[1] https://lore.kernel.org/all/20261013081646.933312-3-fuad.tabba@linux.dev/

Fuad Tabba (2):
  KVM: arm64: vgic-its: Clear an unqueued LPI before dropping its lock
  KVM: arm64: vgic-its: Remove the pending state of a cleared LPI

 arch/arm64/kvm/vgic/vgic-its.c | 65 ++++++++++++++++++----------------
 1 file changed, 35 insertions(+), 30 deletions(-)


base-commit: e99ff76f4a02be8542e2c3ecc8843d7339a0200d
-- 
2.47.3

