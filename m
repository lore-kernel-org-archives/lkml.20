Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794538288;
	b=FW/GXh/frNK9y+sHPDCSYtl6lIKf76htH5msbg6GCC5PU5IW+sZ2EcdoPD6NcEN0gHC8
	 Cpn9eQ67u/e7jWQyCdiWM+4qHALw4uv1sW9q/4gRvBfbJ6Q3CJ9CU60DLGy4t2T/rdD+S
	 5Z5cDEjU9Rp1WTlobuyPpsBR5PAr27RKzXi5sXaWYnX8hJfZo+AmkKvCBZc40waxKNSgg
	 ITUwStX7uIc2V9llYlg9/R+h6ZacBwgtQYv9xn7RIiHHwg0a4QmQ35Cvl7SdhaQvSXYOd
	 BiewDVfheyeCNoWv7ZnVbgcbEuy0zwWoV+9pNrLxdVoR+dpMYPjJXmJ5OVPE/w/wjqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794538288;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BEjGpvcrNvlHhAnch5bFQ1ZwAUgnUCLZ3mkaXsk+SiU=;
	b=p8vrDIjWyVP8Q3kO54vH8sW+g/Z9BrJmvay30yOLTPF8CKqk+/IKIHB584E8YveVhtKO
	 WQBMCn6PdLPRQwZf8sZxK8ZRskY31Hn6d0mF9hz3ofzWHgoo1PlC/IoaYPiqLCRMQHoCh
	 HuNte4A38w/glRaZOsWMfDqZs43Nqlu75U0s5xFdeg3p6AprtoScnwbL4nqJyRFmy+BfC
	 81VbG8kVKFWyKjusZiEPPAteoASJ8izDvPc1PDCieZMhQaBnMb1l2W4Phx3GMvHTxd5TD
	 oVMJ23NELOO/aWNZulu+4mli1gCEd4GMGpbtiVRpE4DF3rFw7pK2t35gedvJOMv+pvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i2G7ukno;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C89F1606A327
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 02:51:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C89F1606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i2G7ukno
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-15dd124bbe7so324227c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 18:51:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794538287; x=1795143087; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BEjGpvcrNvlHhAnch5bFQ1ZwAUgnUCLZ3mkaXsk+SiU=;
        b=i2G7uknoqdBWgjPDKz8y/PNjonAjgtkQO6fGdqmFKG3sItcnMUBcDAVrVGW91JHH1v
         HFzRTlfDGoXH9AyBj+T9D0RQR73oRer267APAHEwciAUMZTARG7DXlniJ35IXE9WL8Eg
         iUZoRRfcqs37i+qZ538s/pUf12a9kP73XNBFML6foTnfddIWXS//3ZDNtzPORZI8hTrY
         Xmg644fZelbMyUX9doOFUQVxntsymrqwfrWUKbfztvX7HCcJ+xWJrsmkCr12zOUidgjY
         wtMRi8Z6FFGoOIxHugp64dl+uBogkJpUSsKvj5WM6esXghsTrly1YE/gk0Eg76QYn1Uu
         ryyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794538287; x=1795143087;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BEjGpvcrNvlHhAnch5bFQ1ZwAUgnUCLZ3mkaXsk+SiU=;
        b=qNxXhaPbA0CXP4h3VYpCVmDdS3KzKv6MV6y/u4uTIHw4s6v3co+751lDsMVux/WVIq
         lWrzGG9c0BZECygL0haMKKrx5z828ntQmdWTKI9qBkzbgIz7kSVZynYK5l+h5QThqiMz
         z/H3ahS+o1jffZLsGggFMi7TaPknhsyBPSzBTNqIdzt0yunwusjMl9F1W14H94yRNpVh
         CSxqnCTVP9NGOFo5Gr7P1dMDJBFNHV+lC2bRivtgH8GVUgA7Xv2Ck0Bjg8lhEBhe2iAH
         IFUdo+0Jw3prH0xTAj11AUNat0CU+6sDzxNfyDSQDvBnrABWNt0bTBc85FNi5Ay1GAn+
         85Cw==
X-Forwarded-Encrypted: i=1; AL+hErHPezZZF6fN14g1pvFXoXdT2Y6JBSALBdxTfErjJAUCmJSCo4pgSwG4fJNSYyirxU2xfNPx9MpHkqUO0X0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9nYsO/EiIZQUp3uJaWh0nFL4fNxu8y0tUa3RarTLAGkmz/eFJz
	vjgR96tB/9TK2ioakGD8C8WNUBROfBdyCv18/2pjTIVtPqpYslQhL2gp
X-Gm-Gg: AYBFou0QFucHrgVxefGd6xe7zKV/QLM2a50HEMffWIfdExcnxytYCrU9g+i+313G1SF
	7nfkk3PJw9H4MQLrtdHHJCfB0HLga2qw6OuG1leUVy9zrG08nGPkdDKurtwZ3RbTZMQ/C8OYbkQ
	VnzQjblsHDM1iS4S8i+DFXd7bJics5JLzuD3F9zIYli8so5YzGfwDDSyL6dtK+pNrqdvtjWh8kg
	XvYXua6X11SLpQUFATHqc4jL9HIAbGgywhdYdrUTUiD62lEJvg75/bPuBQkKovdKAmqUsJt1UZZ
	mCzTaOE1vcRlwLsovJZ9CFjyJ9xIJWlvhCMPFb0AOr6+nCZYFGT2+Gol5iNLu3KChvK/6ReS/Kc
	2CVzIdsNjBtdW7zXseixbvx7g6DODEXh50iXnTffSxoPjcme0K1JmJlH/i3l9kdYQTqyLs3BAQ0
	F29+8By48wFLP7Ru2qj6oII4UEHHEXFhdUI24CKNuyuUPuGFmbfBJjt2CmXv6yFD5NGY7YRL3fW
	aSCngvs4T/6OGiJ3N4u4m/WJGSD+b9FrO4RCBVMyK4kSYfGIf9Igq9bhDpElS5syprVtXb6uHqQ
	f36MYj/PNKbOlxUYlYpSDOeZaoMWUpun1A==
X-Received: by 2002:a05:7023:a4b:20b0:1b2:4e2c:6838 with SMTP id a92af1059eb24-1b50314bed1mr1240666c88.15.1794538286798;
        Thu, 12 Nov 2026 18:51:26 -0800 (PST)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50319d40asm2853771c88.11.2026.11.12.18.51.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 18:51:25 -0800 (PST)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	linux-kernel@vger.kernel.org,
	chleroy@kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	linux-mm@kvack.org,
	kvm@vger.kernel.org,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [PATCH 1/2] KVM: PPC: BOOK4S HV: Fix memslot rollback in H_SVM_INIT_START
Date: Fri, 13 Nov 2026 08:21:13 +0530
Message-Id: <7510ddb55a34e8a669eb7c2624d652264701bfba.1794537345.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.39.5
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

If registering a memslot with the ultravisor fails,
kvmppc_h_svm_init_start() is supposed to undo the memslots it has
already registered. The loop walks them with "m", however it wrongly
passes "memslot" instead (which failed to get registered).

Fix the loop by passing "m" instead, the memslot which was registered
successfully, for rollback from the beginning.

Fixes: 2027a24a75ce ("KVM: PPC: Book3S HV: Disable page merging in H_SVM_INIT_START")
Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/kvm/book3s_hv_uvmem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
index 463aef870c4e..190f64d992d8 100644
--- a/arch/powerpc/kvm/book3s_hv_uvmem.c
+++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
@@ -497,7 +497,7 @@ unsigned long kvmppc_h_svm_init_start(struct kvm *kvm)
 		kvm_for_each_memslot(m, bkt, slots) {
 			if (m == memslot)
 				break;
-			__kvmppc_uvmem_memslot_delete(kvm, memslot);
+			__kvmppc_uvmem_memslot_delete(kvm, m);
 		}
 	}

--
2.39.5

