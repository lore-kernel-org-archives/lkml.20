Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793546929;
	b=VPemcp0pKaLzXNfQbjuVPJX3XzWoPdWv0Ti5r2G+M22OCOArHe+QyIOj79WIDz5xfKry
	 g+judXorpioz09WNr4FoIToYCbGxOko3Ank2nTM6uW9kzXlz+LKvH7n33F4b7Hj+ptFmR
	 NBhh3Fr67XoDoLzU2cR1zFQRXDCMrK3C2ZJYyyl+/Ys4v01vMlVbNO22gLjD8w5qQlHbH
	 D1BwvnphOe8paObikw7AfMIh5aJbiC4D5Qcprz2twM/p2E/MiPn1cxqvFAPuQIzopCVUt
	 Psw3wyxvjeTIB4isv/kqQc+8wtxOyaOlniyn4MSN8b9b8NwzTObHevGPd3fFoMASSBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793546929;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Wo5qks5C3zcSg6+J9xriS5NqBQe487mSK7feaSBUdzU=;
	b=Whfwda47WntwbpvqOkrErTNA0fKpDXu0++mK+etK6yWkO7GDQTjvtIN/DMinlU5/idKn
	 o4bCH9BM8drFvCQF9anDfGFbM6Vqz2w8WTKX52idsNxfEql+CW/oZLydlYfInHdQINgJe
	 lxZbC3FedyWzgxm9x7Fz/n9v3AeVSa7hwBfuh1JhovxwQrUINs3Qmj+xMGGQf87YKxSDB
	 SKVPJwXhXSl+bAKkMP/r4ps32er98ImW8imc4iX2mesXfQeNi7aEW+v2bHCkwoMcQV2bp
	 TofRW/ZLWDhEh37lZ++Rj93FXf35KLiPTKjRD2nDEg5U37fLf1xZcSUcJcP6y1R9ppQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R5OkVN2I;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87ADF606A325
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 15:28:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87ADF606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R5OkVN2I
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-3514b90bb89so4473118eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 07:28:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793546929; x=1794151729; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wo5qks5C3zcSg6+J9xriS5NqBQe487mSK7feaSBUdzU=;
        b=R5OkVN2I0IUxH5Y9qeUnEXX/R7tyZMS+OXoPxprUsKEY9FB3eda+LIkMegmKWR8U2b
         BAgLW2I66E5A8Gj3JGlLEdzTfKTwijMM4ELH9nBwfGA6/POBGKDguEBD598T8zvKGqeo
         mTFVKkMt7+gH+/WRlU3rDXtt0VGs2kWFB22oW3hhWuVr9wOZkiW9EZWofvJX0j3HWXec
         bCN2igKIbBTKUoISMZUydRLwf8EOVXjai0sgCIxZvvy90IaRpF90Y8eY7+sRGsjXVBUs
         AMwC3TGq0fc4CoOsFpTk7tTujRzeYZEumpRLPN7enfaM7z5XO3Z2R1ajODx1/phQj+Xw
         41Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793546929; x=1794151729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Wo5qks5C3zcSg6+J9xriS5NqBQe487mSK7feaSBUdzU=;
        b=v5qqXMcHwrivLp/MJByGscl1RbjKZ5FF8vTvg2T0ibMP8YhWNxD4JXykpY4it15EbD
         oWMiGJpxajPzq79mmbgp1/uUhnHXBYX2tzfB/fwkDN80tAd8YX0DI0qLVMH2hRZg7Ple
         yQkLwsfZa1xxC/LnASUXfwxxlCw4/fYIn43iWgfUoO+M0H88+STII++nYmE+6wvMTuaZ
         7QzIppYzIIWKgr2d6kgP2jRDeauwX4UEDIguFYyLLf4cUyH5dF2xkouDYulxVf1cABym
         hBMeBcaDBzO4KzYLwmTXYFiba3GMwLOdPA8tax/W7WA5wtXinyENcxD5OWzLvsjU4Mfk
         cEsA==
X-Forwarded-Encrypted: i=1; AKwUvBzul95IqUwPj9EJ6vY8ABaGFUsWWoOE9uo44OmI8f3QD9vlM7WkTEEWw/2Jp6wlxUA+yhXdKf3un7HJI78=@vger.kernel.org
X-Gm-Message-State: AFq9FYKM8c56adBQP/zwOWFPwH5gab0Wav6NqrwukpyQiHAflkGdpUa5
	6dXV2r0NvU2Ret4geL+mfOTfyj4evEWsG6Z713QwZhS5Q0IFVF6ufxEB
X-Gm-Gg: AYBFou0NrieWhSWmBYM59XHbNduIlBb9gzDX1GILrmQOkDfQwb60mb1TK/4QDbO/sDI
	/2wGTUC7P5DpCXSTR6M9ozA6tiSQpe/QKVIIHFZIISzOueGTTC3dxNT2jNNa0/JGagaBB20kE3k
	y2kPTQM7AIw71MUaY4rR7f1ceowWMWJY2lLiE6L00KaPjBhQ+f6bfQssx7uT9XpQ4f4UNy/wVbj
	U+LFpM3UT+mOoY2JjuTsebW8BzxNquQ2JxbRRCiqmgRAho0SUy3eggFxAcj5f089oJPHPe6sy5O
	j+GKazQ335uW329EJ4HjbZPwdJ1boMc8vTudfg6ral8x1Jvcib+0aa+RI0p/aGeOdJVfNHfQk5M
	h9YcP6rL0aRtKK2rd1HQdlPxcdlX+5Dh5roVklkJKZydXR3LsEZ83G2cguS+96UPDwtiRz/RYuP
	+NkeeCtvNprm10vMonatJrVehMNZBwOFs/aCIJcfGX1VrHrfLyryy0VGt7TJD0ixd5cXJuVmSYL
	mb4qc7yZbI8Q11mmw5RIyZ6RXGdEeGqMWEDT+CvcYnNTD8kgNwSrJGpr5p1wEIFNX+2rq01xmLU
	uo0UAca8VW4/mzXILJDcbPfBu/Goec0vdA==
X-Received: by 2002:a05:7022:5f15:b0:1af:d691:1b4f with SMTP id a92af1059eb24-1afd6911cf7mr4708978c88.42.1793546928542;
        Sun, 01 Nov 2026 07:28:48 -0800 (PST)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac18458e07sm24862665c88.8.2026.11.01.07.28.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 07:28:47 -0800 (PST)
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
Subject: [PATCHv3 6/7] KVM: PPC: Book3S HV: Fix error handling during vcore create
Date: Sun,  1 Nov 2026 20:58:11 +0530
Message-Id: <20f3d8cc8d5dc36872873cec4c8cb48a68e46354.1793546707.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1793546707.git.ritesh.list@gmail.com>
References: <cover.1793546707.git.ritesh.list@gmail.com>
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
index 22283d46e8fe..e39491dfb975 100644
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
+			if (vcore) {
+				mutex_lock(&kvm->arch.mmu_setup_lock);
+				kvm->arch.vcores[core] = vcore;
+				kvm->arch.online_vcores++;
+				mutex_unlock(&kvm->arch.mmu_setup_lock);
+			}
 		}
 	}
 
-- 
2.39.5

