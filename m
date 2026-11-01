Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793544437;
	b=Ml+m/b+htL8h0+oqepqJr3g2+CGbNyi080LnvuK1gw88toF2QttCAOLRu0fuO5Pdr3nR
	 p28oqM4bD8KVTYjg0/nEUq5grXGwcmtCr6HMtdttk+W1p76CIP6SEedxEYg66ETFHKNsf
	 Ilhf2MiJ/41WQAPKrFbpz9KHTes/oJJNU4TYlyItCA097Jrc0mKhYeS2zZsiA6fOgqYu7
	 1pBo6+dKJRo80SaBY8zFFloC34SH4CuxE3axbwVX/PSQrYelEsHLTgz8BVa9z7sJYVTbQ
	 wscQvjUzV7SU34haWP2rsucQCncw5olPPoduDw4qv8A1XNINrgZeuAEjxCLqaESjG6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793544437;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=V2lcCV5azjsGrWatUG1LtEdItX9x2QFl+QgQazoBrAk=;
	b=4V+UqXpZOjNaPU/cH3zcltgEUUNSo6yxefc0YAk6su3LBVgiyiIGFmKYnosNYxF5iIHR
	 BsPofCLg0d2QBdgq/3cAqUOtqM6+n62telbvxqCHpjF5zYcmmfLRkV/+zTqTS8NkMixmg
	 10Z5+uRGX4/rc1FbOOohu35HyGE/LTj6P+tWIK16F/nqe+R8Z5VNAp6C+bF0hRXz1Vmoq
	 vqngysHYXW8A0/kg9MCuhjuPcwEILLkABMPBYqVXRgkNjhmOvoe8dtBIBZgJ0FNK8NXM2
	 nsQBOJAAJEyHiZBkE4Lbzy2hb6rEc0SVuUDAkG0irf3udQ2m4R7XYdx6qtLOL+zKjdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fd8w8b0f;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63321606A32D
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 14:47:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63321606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fd8w8b0f
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-36661f953e4so3443077eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 06:47:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793544436; x=1794149236; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V2lcCV5azjsGrWatUG1LtEdItX9x2QFl+QgQazoBrAk=;
        b=fd8w8b0f7MOG8V/KrCeyk2gPvDBJKhVBEko1EZ8P5BYIWiFtm2yuYLz5hRWEDo1sJE
         EIA2MTmfG6kGDtiMmzlu+c52/v0tAdr2jiISuzyKSTcid/GDQRklXW9FOJ8y+zOBIZR8
         t/3PZAwKD2rusBW/eYOqTnf4j8F3fYXxc1LPdrGnNG2YWU6qlSKnsl2l9O7qwWWksfps
         B+IG4QtMP/7YILwhroJWwj3xbmHCO5dqdpvPdpgawnwJqrCul7qERwy+RXZCjniVINru
         My41J5+gMdIWgw00a1HCytVSDcuxNq/9L3iCDV5TPX12w6F/fkjLt5Qu3+PW1fyf3Ej/
         k0YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793544436; x=1794149236;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=V2lcCV5azjsGrWatUG1LtEdItX9x2QFl+QgQazoBrAk=;
        b=vfbyxZHaZ7maoE6eU8ULBP1BaFWgJrJbDdpf4pSD7OjoMu1VKW7e87w5Qm0avwVouK
         KMc42ehBpnr5Flxr0y9G0TyIMiXqkaAm/jb420LHRZMITdfleGinUFbEn9N4BvRwhiF7
         bXzYW3h6gLr1VT9IsnvqLd/Aga15x4C0Rt8Tb2JNCHFLqlallEIJ8iPMUYKM3dQif6W8
         lVYUl8FuwOGnATRYUml6jTAl+XtWn/lsqUZ3a0F6wr4nD7bkDILnILxJyIAN0MAujXLl
         48FyFTcb6JaPfdLlnQtH64bcwvWzEegtjk+d9uPPOu9v5NoPChZE5c+Eh8B53f/nvkmk
         AdNg==
X-Forwarded-Encrypted: i=1; AKwUvBy6HujPXD53J64/daI2gj1aTw/b+pt2CBk0XygSh0z0xtrQk+U8O1fXy3bQ7IkepRnawJ5ojWTx/uwJkG4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIr+pDUejtcYiWsaW2iib0YadtjgHuLRFynTEVINnMph8GxNjxy
	8SgWdBz2AqEHpdi/jnNzgToA4kJvUCL6/oeIbeh5pS0y40aUfvwfVmUS
X-Gm-Gg: AYBFou1iCuTskqxAaBDSdmgOLqb356lYkBLPs2rQ36SPE7p2ofNMSedkSNy71rPmpsR
	542nKCw4tsXGgAA7iCApORoVLBlNUt8z0V6kg5QOMDNk2DuWSJ4NcCSyFSaWNT4OU5A7OhE/Hp4
	sR7CbzfAkVFxTylB6+qMYIfSV0fCPo/yAsEJXO0synRBdmpOiAz7UCytfI2nOQ67YOYyOfHSCjS
	ho60+Ck44UqhKEY4K+QzdDhKTKSH52zASGlqOPv3InQuCU4wNvOHtwvsQwlRvi4cCsxTR65WKJ3
	CuouUJ9ntlDUfLBMyU5S9JeRuCwOf9QYxH9ygrutNACz2V4tIHZGQyJLPi1YedwesfgEy6AxQax
	1NVZ7JPlom3gNntZ3+0kPJdGrrh5zAWHFnCgBICwhRAnNJRIpigiOQRPlzeiUb20yBiNoZmAvL3
	hw9dosWKsNv+XymH2KadaUjznUyofkedGzcl6eB4LiYPaMAp8nBtZmNnxq3NJ0mWKYJQvnbCRFi
	NiEX3a90+5M/Tw1ldgqltJk1rp78ORKMdMi9qosU+a3ZZUbHobPKXs7REJTpsDPUB0QDtRBfEaO
	N17j6E8cyUQ6wbQ8LJQhnb5zFVY06WrR0w==
X-Received: by 2002:a05:693c:639a:20b0:359:1b05:ed30 with SMTP id 5a478bee46e88-36a42203bc1mr11532986eec.4.1793544436256;
        Sun, 01 Nov 2026 06:47:16 -0800 (PST)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a6f7f9sm32747545eec.25.2026.11.01.06.47.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 06:47:15 -0800 (PST)
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
Subject: [PATCHv2 6/7] KVM: PPC: Book3S HV: Fix error handling during vcore create
Date: Sun,  1 Nov 2026 20:16:31 +0530
Message-Id: <ca419693358e3af49b1dfa7887b34b8ef91a5daf.1793543627.git.ritesh.list@gmail.com>
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

kvmppc_vcore_create() can fail and return NULL, this patch fixes the
error handling when this happens.

vcore and online_vcores count should only be updated when vcore was
actually created, otherwise it's state gets messed up for the VM run.

Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 22283d46e8fe..7975e5de89d0 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -3090,10 +3090,12 @@ static int kvmppc_core_vcpu_create_hv(struct kvm_vcpu *vcpu)
 			err = -ENOMEM;
 			vcore = kvmppc_vcore_create(kvm,
 					id & ~(kvm->arch.smt_mode - 1));
-			mutex_lock(&kvm->arch.mmu_setup_lock);
-			kvm->arch.vcores[core] = vcore;
-			kvm->arch.online_vcores++;
-			mutex_unlock(&kvm->arch.mmu_setup_lock);
+			if (!vcore) {
+				mutex_lock(&kvm->arch.mmu_setup_lock);
+				kvm->arch.vcores[core] = vcore;
+				kvm->arch.online_vcores++;
+				mutex_unlock(&kvm->arch.mmu_setup_lock);
+			}
 		}
 	}
 
-- 
2.39.5

