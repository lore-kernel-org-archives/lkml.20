Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793544415;
	b=LlBQf2RCxAYkxD/BtL84AeHZoEvpq/Y7swRc/YDql3MVW4F3He1TE+nMRV1Do3a1T4r8
	 +oB1RDaywDdevupZmKYofH1CRw50bkWhx208Z/l8ch4zpcml6jHaBSERXFGdUymHfQbbq
	 820ak1nWgz7WStiotLkk/u0ZwfewOzgXJ/9Dfg15NHsZ4lXr6AJ4R9kYUHAX2i/OTikWs
	 TMi/UywUbvvj8IB8mcrEV8u9wy61UUZtaPqeCWjcdKgkgN5CiXUq8x1g92Oaz4AkdkkWY
	 ugSsCWdZlKDSe+tVEhUJCMnqKcM06PYYH837+sj/3DSw6IRC2vEDscDnset0f/QmSKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793544415;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=WmpZZXMsdqMV2V4eNDvwbvfcyiTszzMT6zcGXuns9Y8=;
	b=GERGar4zEkNMuo6K5p0kpqTVrmIvnFTMqe9m5Y/vYxhSlTgJk15Xi8CQ43cXiDBs3gAR
	 +E6IX+5FSjwx9n79CcKQHpActBaeSx2GZLvjueYb8Sk3pOWL6Sw9k0s7I+EUoaMgA5Aod
	 OIdhX6rpCfJD+/o8OWQ7kG1Q1RamYUqqxL5B7m3JH98qdRwX0FNLJqq1B7EJ8pQCo4dBo
	 0CG4bn8Z7EEdfOp6EZ1ZAIimJIiRCjYMLqT8tkbd9TvqUfK8/qF+zF4VUI0IuofL6b+nA
	 z2qzngveAofpw2WSzODxcvX0KSyTGfl+8d/nweuL3jOA3Jb0n+K9M5l42rupDLcExnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AdlQJXTq;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED386606A325
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 14:46:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED386606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AdlQJXTq
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-36a18fc7a38so3196496eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 06:46:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793544413; x=1794149213; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WmpZZXMsdqMV2V4eNDvwbvfcyiTszzMT6zcGXuns9Y8=;
        b=AdlQJXTqHZcJYc0nbA5UOeTFhl2elUhlC24a5TNcJT3XnBHIuQh5rozdmgoO7xQyCA
         oOKLswDynnrT1KVFXWgYdhq6ZuZr7gikrzSfW1Ka2i3SxM1lukjqi12+7fvI5driUnKH
         b/3rl0lZCvVksHnrORyURUcRZ07KzhQ8ubFSWY+wXwvMe6PdhGKCwQY0AakoZ0r5eYAc
         45IcTDHiuZZgd/D5eNwc+aVfUcCD0Mr/PpGyvP1ia1bAQiSX1ZI6sRDVJ6ZzqtLCwDdQ
         um2EmlIFqTvMlgcmMTfEPtRAoFDoi2w+9SOvNINoTPCH/dkN/aIms6d02ue1jVfmjnE5
         L12A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793544413; x=1794149213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WmpZZXMsdqMV2V4eNDvwbvfcyiTszzMT6zcGXuns9Y8=;
        b=mNjSyKm5/uTwio2G6c5gCL3/JmohijyqgX44M9QOCUn9JojieRsxd5hM9fk7ejF9cY
         apLH6nPXmOUGyGI4M0wLR0la1p0v5czuCKEkKhTpknKxhy9sYYKMdTA/uT8ql6jLXOJz
         jr8RDNnH+D/h91H+5TXqVRXqIY7pHelE2h02eI8zVo0J1gDQjQPl9n91xKVU45ZtiXcv
         3EJXN91KWAirgpFK4LioVSnqokHNwCHfFKmDySi/d96iYUVHNqZkh3/5C8OuYDNBoSvJ
         QQU4nVJ5JYD0hEQLgXoVde8oD+FF4+Nh4A8dVVNO+Yn6ttLBVkwS3Tj/Hl5gsOaGDQCY
         EXRg==
X-Forwarded-Encrypted: i=1; AKwUvByDJh1SwfM6dquJ7GkLP35Qimpq4xKFR9GZOyoaE7ZNXYS9SeTBj7KtmyI08HGUFM6gkHhpQo70yLRZtCM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLUgF+p/T9mEFK5x+k/bnqKwahMoeP9E85Y2NRvibKB5kb4pYod
	XuaL5lZnASGoA1GjT8j0NQZ5j+NT+i8NGkag/u8chlABdQf2biW4YZNB
X-Gm-Gg: AYBFou05o/R9SxeiyFspODP7O55kOL2hh9sWEjQ3rjGcqPwzo765fQkg3OVWFAZ0jni
	pyyxoiWmiUk20HPtusWdvGbL6Y5TrFy4AEH4mwO3oIpmzqM7eAAR++oOfh0pNd7Fub/3W3ulF/q
	ixh0boa0t1GHqeOhI1Wl9OL76YoQDYWctpQYjKwDEUkTvQwou9qtrBj573JELublNiVISYOL+6+
	NhVawHNsY9fY9eXLGMCAm8ioI+2W3Au2vbCbSUed+grXe/6hjclmlRfsq9TD9vTksYpr37JMZJl
	qFMRM8+R5gLGL5/KWpOMvPLcNSemVGK5d9EA/TLy1mSUUV+gBkvJ76DRSCbJcyvMlOXNOKqKtq6
	MRx9GtUIc1Ue4a3xM8EaB6flaIC+IfIMN5hdipabcR7LKAfKTa3T6JdgBcXnhjw4q1pkybF+mID
	uad5JfvKxjj8U/COk29LmYODG91VEbU37+oK3JRn6ep5Nyl3/taQGMMYvYOxiElgJPNlBjdHPoT
	IWq94BTHM8wrw/UZ1cwMGdfYoWZHgxU6Mov0JVo07k5HDdLlGRschaH79PCLcpqyiAzjDodMEHE
	1JdE3hf9ZImhdlTF9eTGnjXn5K4ZMS73wA==
X-Received: by 2002:a05:693c:6092:b0:361:7ab9:479d with SMTP id 5a478bee46e88-36a423ee70bmr14058549eec.27.1793544412069;
        Sun, 01 Nov 2026 06:46:52 -0800 (PST)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a6f7f9sm32747545eec.25.2026.11.01.06.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 06:46:51 -0800 (PST)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	linux-kernel@vger.kernel.org,
	chleroy@kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	kvm@vger.kernel.org,
	Anushree Mathur <anushree.mathur@linux.ibm.com>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [PATCHv2 1/7] KVM: PPC: Book3S HV: Read EX_DSISR as a 32-bit field on guest exit
Date: Sun,  1 Nov 2026 20:16:26 +0530
Message-Id: <4e883269c887f68f4d9d54f2675799df147a5db5.1793543627.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1793543627.git.ritesh.list@gmail.com>
References: <cover.1793543627.git.ritesh.list@gmail.com>
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

kvmhv_vcpu_entry_p9() recovers the guest fault state from the paca
exception save area with

	vcpu->arch.fault_dsisr = exsave[EX_DSISR/sizeof(u64)];

but EX_DSISR is not a doubleword. It is a 32-bit field at offset 48 that
shares a doubleword with EX_CCR at offset 52 and the exception entry in
exceptions-64s.S stores it accordingly. For e.g.

	stw	r10,IAREA+EX_DSISR(r13)

This issue was caught when running kvm selftests on big-endian, where
this read would land in the high half and the truncation yields EX_CCR
instead - KVM acts on the guest's condition register as if it were
HDSISR.

The result is that every HDSI on a big-endian host is evaluated against a
bogus fault status i.e. it fails with below error:

	KVM: Got radix HV page fault with DSISR=84004840

Let's fix this by reading this field at it's natural width.

Fixes: 89d35b239101 ("KVM: PPC: Book3S HV P9: Implement the rest of the P9 path in C")
Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/kvm/book3s_hv_p9_entry.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv_p9_entry.c b/arch/powerpc/kvm/book3s_hv_p9_entry.c
index 34bc0a8a1288..16aa8582b888 100644
--- a/arch/powerpc/kvm/book3s_hv_p9_entry.c
+++ b/arch/powerpc/kvm/book3s_hv_p9_entry.c
@@ -529,6 +529,15 @@ unsigned long kvmppc_msr_hard_disable_set_facilities(struct kvm_vcpu *vcpu, unsi
 }
 EXPORT_SYMBOL_GPL(kvmppc_msr_hard_disable_set_facilities);
 
+/*
+ * EX_DSISR is a 32-bit field that shares a doubleword with EX_CCR.
+ * Small helper for reading it back at its natural width.
+ */
+static u32 exsave_dsisr(u64 *exsave)
+{
+	return *(u32 *)((void *)exsave + EX_DSISR);
+}
+
 int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpcr, u64 *tb)
 {
 	struct p9_host_os_sprs host_os_sprs;
@@ -770,7 +779,7 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 
 	if (unlikely(trap == BOOK3S_INTERRUPT_MACHINE_CHECK)) {
 		vcpu->arch.fault_dar = exsave[EX_DAR/sizeof(u64)];
-		vcpu->arch.fault_dsisr = exsave[EX_DSISR/sizeof(u64)];
+		vcpu->arch.fault_dsisr = exsave_dsisr(exsave);
 		kvmppc_realmode_machine_check(vcpu);
 
 	} else if (unlikely(trap == BOOK3S_INTERRUPT_HMI)) {
@@ -781,7 +790,7 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 
 	} else if (trap == BOOK3S_INTERRUPT_H_DATA_STORAGE) {
 		vcpu->arch.fault_dar = exsave[EX_DAR/sizeof(u64)];
-		vcpu->arch.fault_dsisr = exsave[EX_DSISR/sizeof(u64)];
+		vcpu->arch.fault_dsisr = exsave_dsisr(exsave);
 		vcpu->arch.fault_gpa = mfspr(SPRN_ASDR);
 
 	} else if (trap == BOOK3S_INTERRUPT_H_INST_STORAGE) {
-- 
2.39.5

