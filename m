Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.196
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793028404;
	b=QKLFr3MjO0crcPyu9qGFz6oQnq8Ufs4hVMg0CTvDIkXjFh6NG2g1NtMI65MhzGYPGdJX
	 3zUDgP7+IkIDqDXEH+8tejpParCceoOabWlicXiP+C1easrNcCkVsFUK1e2eBvTpuZAP5
	 VTppoA6/47wiaVyTSP20qMAyUXRF9gAKG7TmAY5WRjFYJwSMTwv8hTIWHlf1wRgj2DkmB
	 Zm+N+tnHLvAC+Dr5a8OSS/0iqTxTmxebn1cgJu/IncVXdGDA/E5g+Ou8OUIoVugKyirUt
	 zovGWcM9qNYyQ9P8xj7X+4zyicSnUnzbXa6+divJxcUPwUfDhLLuw43Nzsips9modeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793028404;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=6sX1ckCkCo0C9crGPLuXV3itI4WluLyfMysqHfXOIc8=;
	b=3qUbc/ENeGh/HhKqOFJT16daSNXX7aD3lbEb4gu0i+6zVP5Gbik0eKFHYKSFGGonJVkV
	 e94HuZptWi/xWXGxtEnPKgQYavujJFbk/yXJtzXoUlvnQM+wp9IFNExE4pYlWPnRLV+5+
	 gR2j3Cf9fcNmbCI1GDCiyZK08nQYiQphj4/Y4Gbi7T3bHRB6/5E3rmJKUwEJWR5lYiGXR
	 txj5PyXXmdGpfXQ490DbTsMpCcab+bIo1r3FYGVUZMtEksvwvzV80dbpfRd/9CztNW4zu
	 jnCqsq0HwYqR4meYXw/md2CbZ0g6uLt/I1k7VxvP8D2+QMgLm5JsZrovqcZefDy+LdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Yug95bfy;
	arc=none smtp.remote-ip=91.218.175.196
Received: from mta0.migadu.com (out-196.mta0.migadu.com [91.218.175.196])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A46F606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 15:26:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A46F606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Yug95bfy
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=s46YFljZH4peYcKfdSw0ukYEvKh0IVavDFv9NTBlyqg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793028402; v=1; x=1793633202;
 b=Yug95bfyhInIBBLxd8u3eOeUaRUZqKDFTlAV245v9MCfpVidsG9MXF15Tx24oWy50Mg1BJkh
 V0TMFYqROCTeGQCVJ3V0OBA0bbduJ0VkrglxqpiOGhozxi1/5kfGZmon83H6SE8PJdBGObF1qqY
 1cJJ1un2J85n79Im7RnTVi8s=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id c79fc02862921bcd;
	Mon, 26 Oct 2026 15:26:42 +0000
X-Mizu-Trace-ID: c79fc02862921bcd
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Eric Auger <eric.auger@redhat.com>,
	Will Deacon <will@kernel.org>,
	Fuad Tabba <tabba@google.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] KVM: arm64: vgic-v4: Don't allocate vPEs that a VM can't use
Date: Mon, 26 Oct 2026 15:26:37 +0000
Message-ID: <20261026152639.3926498-1-fuad.tabba@linux.dev>
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

Two fixes for vgic_its_create() allocating vPEs for a VM that never
uses them. Nothing frees them when the VM is destroyed, and each
doorbell handler stays registered with a freed vCPU.

The first is for a GICv2 VM, which KVM can run on a GICv4.0 host whose
CPU interface supports legacy operation. The second is for a GICv3 VM
whose VMM cleared nASSGIcap on a GICv4.1 host with vSGIs.

Tested on AEM FVP, with has-gicv4.1=0 for the GICv2 case and =1 for the
other. With my reproducer (clear nASSGIcap for the second case,
initialise the vgic, create an ITS, destroy the VM), the kernel without
the fix leaves four "vcpu" doorbells in /proc/interrupts in each case,
and the fixed one doesn't leave any.

It doesn't conflict with my vgic init error-path series [1].

Based on Linux 7.3-rc3 (fd73f4a665989; also applies to kvmarm-7.4).

Cheers,
/fuad

[1] https://lore.kernel.org/all/20260921072958.2918477-1-fuad.tabba@linux.dev/

Fuad Tabba (2):
  KVM: arm64: vgic-v4: Don't allocate vPEs for a GICv2 VM
  KVM: arm64: vgic-v4: Don't allocate vPEs when userspace clears
    nASSGIcap

 arch/arm64/kvm/vgic/vgic-v4.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)


base-commit: fd73f4a6659897191fa0d40695fe370925dd3780
-- 
2.47.3

