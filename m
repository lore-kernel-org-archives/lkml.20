Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793544432;
	b=1mP+jIG82R/w8o5L6ek2HSC95VzPqu3eR9cV+auEoyLWTDgf8sTiKlakOVCykENeQQwn
	 MWkNE3rhaKoEHQfuiEeJSj0bAOPij3fY3oCObJI1I8r2aQvXU9EaLvAUBUwzxEsk6JueD
	 FTxbrBJhBxI/fjqPEc5+NDZ2irwdITlRmK71AIWS9zg5dNA3KpKcV3gKo7G4af07Gip5q
	 aPTrRmBhSN9aTE4E5bQZqL0D3WKqAJJDCHCpTHIJO7voONpudswTzbi08SqJoC8U0zhJk
	 zmuFJlsQIDB0lJJHE6GwkmEhZytdzvikoRucBY1do01FwPU7o6CzycrX6JHLu3LY3lQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793544432;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qduAH+VDk53vSkstbY9xaGv+g9KfxKxHxkbXDOSNrm4=;
	b=bylsn0HeM4YCHAS5A84zzVS73OtZWTdw9ynB+tZumvmay8n5QAyWJ5vkPqSyZQi7pb6W
	 uXw+MPuXixUluP38rvC9ipZiU4GbtOAWZA8kYoIYVTv/4+X4mNVU9Nly3AvdjvtNHXTNS
	 tQZYmscgnzt3++RE3PpGSrmgBDAwW3hUde2w7fI0cDf2MdqYTLRv4ZvWBrURdbVDtfrUE
	 V9+ghiX3YtYgnXu+0+BDWiWCcvSERtpSklC1vEj4TOjQpu6Q/uVigdtbupQKKH9Z4eEAn
	 m+AgQUfotzGHTenOz0tOYNuDzK567x5R1PgozWhrOBf41A7itrQSYY3rDEDxFdDNaNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Ik/VRERy";
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64087606A333
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 14:47:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64087606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ik/VRERy
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-36a17a332ecso3643233eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 06:47:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793544431; x=1794149231; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qduAH+VDk53vSkstbY9xaGv+g9KfxKxHxkbXDOSNrm4=;
        b=Ik/VRERyq2Pi8C5N6JrPgt0gUjER35IiFV8EDZLJV0b5clyVOD4bnPTJX+EVUmQsxx
         3ui5NJBOPxnZVjpNemv3TfywG00kn/EGX8Yh54DYpJkm/L+G1Nd1mXJ1tNh20fVf8LcE
         XkywzaV4M1AXV0pTj2dQnmSq0VYdWvaNw53b6jaTtWIZB1gf82zQKodRov9TaVqsMOqe
         ACeojoh1v4K5UlqsG3GNUupePXDWbae0xMAR8+hOYc802n078+Bd2On+o9KhqwWum6al
         2lLFXv6nFZ5ibnnYSuHCNZjMd/V6rcSj0D9oTkqOnM0/oQMFnGXhNVVcZnZiM8dqAPoY
         WXNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793544431; x=1794149231;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qduAH+VDk53vSkstbY9xaGv+g9KfxKxHxkbXDOSNrm4=;
        b=kGdRbeWkgtFGDW7uF0yWFrS7wV41nZUqscXeVdbeG0KFltlN6vRAi1ry7ARtSVGnIf
         q41xRE8J8iNtyFZlCASjcol2uWz36LOZnJL8f3EWOXTy8S2XeYv43Zsxg05ZznZmLfqC
         45FQGVubgJHFO3b1eKV7RXk4VHa0C9g37WlSow+soPJJjlMNGy7oNUYFjN5qxhEL8+Um
         34MRm9i5NG077s8N+rlkfZrtoQi05X/uvrGSRFe+gPTm/l5tS7CUYt12OTgI5bQPzFVu
         5yeYCJaAJyWCtRsTaLlFMbaj/fS1yNxJ32YvWmBcLgSMo1m3WJrCq8pmnL9YD33As5X6
         Mc2Q==
X-Forwarded-Encrypted: i=1; AKwUvBy1hRQM+nkChWf0TYjQ76KCR9H0Hgv6z8afSsVJT0s/+cEPtqEKhYu8yGYaol6QeQsE1GVbyEB2joS+Kz0=@vger.kernel.org
X-Gm-Message-State: APuU4Z98C6qKGYvM6cj/C5MOYdqynK5iz7iux3ffgS/I49iQOOVdQRHU
	6uoeU5skFmsZUNjnmP2vGbScwR/DWY7G6gmH2TZjVeBkL8fnrIctXd03
X-Gm-Gg: AYBFou38rn5JKm/n4SnqVyhhRqaBtwLCHohNCNziCU8mDE7AQBHu//QGaDK5/JiEIS0
	D52B+mPwtsGnerPOVgl2Lo+mMnIj8FsbGF4zlBQWDCbyA9uN8fLSCd5s+cV/X+p+hvItmyQ6PrV
	8mxkyjAQRd+PWVfGY7Rp9Lz3iD5JrDTD70atz3FxWIciBjXGOF/B8drvlscDn3RREJt24Fxzg/W
	KYouzbE9Blqu3dkQL+JDXgJ4aK2AUMiUDYSL9B61HtfZA0Sx9HdTMy+rX3yfmicnhNd3yr3y8VT
	XJHnJEh2sLNbZmhklAySFwZsYFERw9tJcoUm1o0HwJ2LqkA7//5D1qCLLX31HZ4GJWWa9qVXwa6
	KHJ+MhBS34+M1YlSi5iEuSftUwfut42URug8AieTL7BLyEgLZ3Ysg+GvXvlDMUqBXiWg/25f4Mi
	cGQGWVpg6TmzO9jSUCCnupesBErpPi5HZpoKsMG0s66O3+BMoGIGIOylNkLVk/K1a+EpD/oZDfp
	trrwH/eKYQrppRaOzKUWQjSguVewYvGDn1aXojCLF7iztWGn8IJNz/u0DKnpdcaKDFlxoU1G4Fh
	9A2eZWKCo1TX9Pft9S89/S6VUAnnsbbEyg==
X-Received: by 2002:a05:7301:4b0a:b0:369:9af5:7bc9 with SMTP id 5a478bee46e88-36a424199eamr11896233eec.23.1793544431471;
        Sun, 01 Nov 2026 06:47:11 -0800 (PST)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a6f7f9sm32747545eec.25.2026.11.01.06.47.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 06:47:10 -0800 (PST)
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
Subject: [PATCHv2 5/7] KVM: PPC: Book3S HV nestedv2: reject vCPU ids beyond the PAPR limit
Date: Sun,  1 Nov 2026 20:16:30 +0530
Message-Id: <183d9a0e755f3735ebd531accb9c193cb40317ce.1793543627.git.ritesh.list@gmail.com>
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

The previous patch caps KVM_CAP_MAX_VCPU_ID at 2048 on nestedv2 but
nothing actually enforces it. The generic KVM_CREATE_VCPU path only
checks the id against KVM_MAX_VCPU_IDS, which is 8 * NR_CPUS on HV.
That means a VMM that ignores the capability can still pass a larger id.
That id goes all the way down to H_GUEST_CREATE_VCPU, where the L0
rejects it and prints, ...

        KVM: Create Guest vcpu hcall failed, rc=-56

...for every such attempt before failing the ioctl with -EINVAL anyway.

Check the id in kvm_arch_vcpu_precreate() instead so it fails early with
the same -EINVAL. Note that PowerNV and nestedv1 are not affected.

Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/kvm/powerpc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
index cf620b6534de..5f9cfc34bec2 100644
--- a/arch/powerpc/kvm/powerpc.c
+++ b/arch/powerpc/kvm/powerpc.c
@@ -778,6 +778,9 @@ void kvm_arch_flush_shadow_memslot(struct kvm *kvm,

 int kvm_arch_vcpu_precreate(struct kvm *kvm, unsigned int id)
 {
+	if (kvmhv_is_nestedv2() && id >= KVM_MAX_VCPU_IDS_NESTEDv2)
+		return -EINVAL;
+
 	return 0;
 }

--
2.39.5

