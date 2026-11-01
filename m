Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793544442;
	b=kkLUJpkxhkmNQ5mtKgYDAyW8GfZSzliV9sOkDgpGNmhiFKa7tv0RXuagYoQdhtdZaPxb
	 pfOQTW90EJRdka1h2c6azgraIH6Z+rcE21NTFKy4TStLTPmJa1CakAPxA5hXb8e5ZV5nd
	 Y1hIWeptbpCw9kqFX40E+/Yi6anYxZJQrLZb3Q/T7hG06IvTuY5O/IdtNJXiYAmD08Nh7
	 NqJqzh+rYS4nBHUViTIzWbfWPNvaa0PSaZYpABqO+ItFEf9Myc4XB+rD3uvnguU/4yMlg
	 XBElFdox8enI2Mmb3/MZdF/4oFllfya3wBoj1fMs0P8y7JiXbAqAuQnsFvlIZuqpXhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793544442;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=UGcwHzUCP4ZDgaGEqf3mJTvGTZTE+h3JfZ8GLOdbBG0=;
	b=PCYZYoGeSFBnj3mvcfBIEy1rmHvizQpr/zZqZlPlMK9+r6efjIPJq/RGUDfre9aQ7yLZ
	 KZ5dGj+4ikhPjK/FSzwcBBZUPqt/YElyJzZJbfwuh0UYcMkjuowQn0ySkzm5vWForJF5+
	 AsZ+rU50BovCvvcE5TMIBoYecNzlM4Q2prln+7sQZu0Xaj9ihviWuIsL33ohPLunR1fzH
	 iYxu5Jf0Wo8T6gvIREsUV9R9frqF/dIfNY8MCXFCfTP2N4bzwrIRxfCnIj4TE5wbH/VcT
	 ivhmT2AlLEnEMdwW25cQQqP2OBqc8RGDoTe3prpe6eDcgSYD5sQpp4XLqoU58XnZAOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PKD7BFNI;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C99CB606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 14:47:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C99CB606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PKD7BFNI
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-369f3e9e431so1548455eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 06:47:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793544441; x=1794149241; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UGcwHzUCP4ZDgaGEqf3mJTvGTZTE+h3JfZ8GLOdbBG0=;
        b=PKD7BFNI4DNeis1dgdg478g+scUCiXpDmUnntj9VD1vWUizYpKRmzuu+wO7bGGBxjz
         v5HK/S7HFJs70Ff2txmHYCXi1H/CrgEwtwdWoLLCvT1llsTX6Yv5eCuhe1xW3BmQBl6A
         bKzgM8GDSVh5bN8ZmouOTE546aRdkJnO2hKx2xT5OOwk2BgKjRApyhVarjAO4MfbjDDG
         58koMXA5VRgxjo2DSQ1RTIm3Pek49/8M6CUggDc5u1RhsucaO7/e1RMjf6G5OrQVyJZd
         /cHnguz8c8pTRYwiw+x800hOBIiQnWyTgpnuXsbso9sm2SEkI4qqYbTeIaeb6xRbmAKH
         YEQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793544441; x=1794149241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UGcwHzUCP4ZDgaGEqf3mJTvGTZTE+h3JfZ8GLOdbBG0=;
        b=sa61inNTW6LkYE+l685mKZDYHp5JMRWxscQN8nF0751f9S9ZUjIpWb8mMSu70Nv9VG
         Wt6CzVmLG9XNCRWC16n2wRgJ7GCtMGfFXW7RnFRom4kvlGCSQvmeIJY/5YAPIKz2eQJM
         aY5Dqa2B2Kk8tEYgS99LxgEWW6rf7hF9URh2m1pJtBTgHci2hwEc8ax9ClDFuozZw5EY
         BzxS8hOAhBUggP6ChfsqlkpEbYbxknTE5OYtU/1WRtVxxJIxbHgJutWz33nu+gWLNYLT
         rASRbBvh1WE6Dp/7wtEKlwLyOb2v4HbJT71uiHlFWguJd0DSpS9Oc34xEu7y2rGqE18n
         o8MQ==
X-Forwarded-Encrypted: i=1; AKwUvByiLZWcss0CNYlRhX6pUES+COqEtVSvkUtWA28FpVFmZvR6ag5F2L8JiGhl5xsZksyUkGLo85A0DqHTs2c=@vger.kernel.org
X-Gm-Message-State: AFq9FYLUsc9npHaC/51HV5khQ85rm0xsDKq6C/AcVAZlzGXVqoconoym
	ZissrhrDFA6tLrqrft2OJ4TP6ce9tlfde/yLTKmHY61gb0zYGqVBKix6
X-Gm-Gg: AYBFou2RmawUm19F4rjJtHWuiR3lX6cosdAtj5ko4N92MvlxBcuctg85Shqmei8dy/p
	+awG8QRjmC08i8u7DhV4el3Ru701boSjcVqaW5lc94ZRRkg1I6HIP6sRdW+P198zEKJLKKEIAPh
	iVC1GfM60SFp3n8yCRsdrJB6GSxmcMH5ckxsH5ycgGct6TNDfRZXRRwhzwI1gTdsMXlb8trm5t3
	IR3THcDm23UFIhmrAV2LRwVVxt0XB2LzliJHYK8V753hR9p+1cYq2+dLSYrM7E29gFDT5a9spOC
	+A0E5TvvG44a3hFdg2khQitwXWAJgIeWFUBoiRDEuyrYikp+r3vrsuAlUSeIt0U2KLlnB4Jm4FY
	jyeqAy5ql39Vu/JDvAh4DmQMsmojjOU5kOfYVN36f8HVbNt1ab9gzwqTlCPDQOpi3qf91XjTzCD
	uJ0KjhrTLiT7uDiR7O928UHhHH9k53DCV0mYgtsPkq7curH3CFICmdikVAqx/N9BcKqcdSRBkTb
	/n31LKq23poNxzNv3cX6SEzEBd2gejHFzquRbo+oLrvVofQOIM7xKkCch9ixxS8V0JzmN+4jRCw
	/7a0yZGJ7q0BDv6RLhCd7g5aiVK1FqOo6g==
X-Received: by 2002:a05:693c:8211:b0:369:f3a3:fad6 with SMTP id 5a478bee46e88-36a42340d04mr11570265eec.4.1793544440908;
        Sun, 01 Nov 2026 06:47:20 -0800 (PST)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a6f7f9sm32747545eec.25.2026.11.01.06.47.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 06:47:20 -0800 (PST)
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
Subject: [PATCHv2 7/7] KVM: PPC: Book3s: nestedv2: Free the guest state buffers if vcpu create fails
Date: Sun,  1 Nov 2026 20:16:32 +0530
Message-Id: <2c9913c7051ddc867439d2b6d2d485d3df83a31f.1793543627.git.ritesh.list@gmail.com>
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

On a nestedv2 host, kvmppc_core_vcpu_create_hv() first creates the vCPU
in the L0 with kvmhv_nestedv2_vcpu_create(), which also allocates the
guest state messages and the run input/output buffers. Only after that
it picks a vcore for the vCPU - which can actually fail.

This patch therefore takes care of freeing the GSM abd GSB for nestedv2
if an error occurs later as part of the cleanup routine.

Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 7975e5de89d0..a242abaea357 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -3099,8 +3099,11 @@ static int kvmppc_core_vcpu_create_hv(struct kvm_vcpu *vcpu)
 		}
 	}
 
-	if (!vcore)
+	if (!vcore) {
+		if (kvmhv_is_nestedv2())
+			kvmhv_nestedv2_vcpu_free(vcpu, &vcpu->arch.nestedv2_io);
 		return err;
+	}
 
 	spin_lock(&vcore->lock);
 	++vcore->num_threads;
-- 
2.39.5

