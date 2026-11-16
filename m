Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794868246;
	b=0EFYQws8+1uER9fUT6UGYljK5lAd6dbves9pUxEGQHxWbcvKeCl8OJvDBs50egAqWH0P
	 Thed9T/D2kcsyQ6fd3RF9UcyeeZFiObQTy2CfuWa9jlzu1832HeHkfS03DPY2R1vzzWk5
	 JXsOXp9+oxddzLiYY9Xl+M0jq2xw5pA2GXLWPmCnqYlfWw4f82LE9a2oalo5WMhYrMKKr
	 YhBxuU4l5RTDlQfJb0rvW3qF8QIa41txQjxs2DlD4ha6vDRO6rWh9T3stWW8EWCVXFgw3
	 J9o4z5TGjuJCj+CJ3hpeF02f5an5ZhyVX0eP+HARm98/n0TYhm5CluNGeuJfJAmMZ9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794868246;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=B1pgJpHZxzaIzXBsZ+Z4vsnOXSIkO8E4tFap1dSVVuQ=;
	b=rq3efC3lPgaj8yvHb7MaG0dNkg62D8TO4dSh4cSPjwQCyTCFsNTDJSgNkIrPP6bm761V
	 Lyrkx9TrZyug/+FN/4dQ21QwnXWvI2JQpk5FYbdM9Ye9YvPdcA64FEEIno+YGiZ5Z4MmY
	 z5vnPssq+hMMXpSZ0Ls5dwadlr7vcbkYouw0gCygs2FHDeWwyIm6Ajhe93OsJlXOUVbYo
	 hzs3dO/LO00goNgVGP656mGQmjRdJ782RBTojiFClPhGbvt4nrB5S75sVDQ94L3tqYQJH
	 1q+K+0yt1paXrPpOWq2ym8JItZ2KYM4N873u0DsE2qI/BDkorBqgRnL/FG+UkS0BgmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="kus/1aZu";
	arc=none smtp.remote-ip=209.85.215.177
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82306606A899
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 22:30:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82306606A899
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kus/1aZu
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cd6028ff33fso2211594a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 14:30:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794868240; x=1795473040; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B1pgJpHZxzaIzXBsZ+Z4vsnOXSIkO8E4tFap1dSVVuQ=;
        b=kus/1aZukfsg70PNmTubeHsCUwpl3XDe0PNmK2yfumVvtCw1uxFs1sGc61sevvdntc
         uHeM9eREIbnoc2nAMukx5ay+tZIeDA47lOq0EFZk4VdnOPzfk/8DQqHuklgiFDXDVZeG
         PdRwPxC5ALuopi7lImBfPXTJCfokmdjEcc0xxqG1pz6ZY9zjjH/5Lq6xQp+GS/W0GTef
         R6SJusVqqwaxbFynnKeF9Q2zxTyGxL2WgVEpLJoLr7sE+8bUdiP4AtDJQcz9bFo23rlN
         +8l0fFBe2RYUQXKanY8qRwnupODs4umq3LHMP60Fnpr19u0ZZZPeTVE6N1A7/Jgh545a
         RszQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794868240; x=1795473040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=B1pgJpHZxzaIzXBsZ+Z4vsnOXSIkO8E4tFap1dSVVuQ=;
        b=kxfv3Q9i1I4SjRmBC/10RiW9OT2uS/Z5xIKwcfmN97eABjNm1hIkCrAoNkRxo4G5ft
         2pzRuuhpO4RvN36Wbod31oZd2rija5AnwTwkpQprGU4HEc5MZPmAudbuFTNHN+aWzzzw
         Yx9NZi0msmY4z2LjZD3cgeU4JTEEIP/RcXhe8y6jOiMW7w1oPoFOzwgabZND/eWdW+FG
         jrbkyDQWGjF8Md9s2wThXWZT235skSHCpf4gx8I4qzJok+kmGAaSw9JSu7x68m57vV66
         9IjOVQgkenHNbOCefUk5VfMsN53dt9quwbglLV4GJO/bfFIbJ0KUId+vjkld9PY++bYx
         RJoA==
X-Forwarded-Encrypted: i=1; AL+hErHnJ6/1XbiWr/9orHfudEwBuS1Uw7Bn0V3G2F4w/uay9R9mIGDnI2XZa7jNYajR3dO4MXhQqLFJ+pYW4BE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/b1OCMHk5vbT8QdmXVn2E1F01RDTGho+/zvloCqv8zTwhWG5Je
	GvgcTF9J4dvYpirg3oBxtME5Z3g35+ep+X4QGzbFqY3F/0oEmY2yIUxbBhtS7A==
X-Gm-Gg: AZFdTZeW/vMrIvj1zL4NotSjUQdMvKD5ZoQ+59UiwZEMha8AElPqk6KTdLxe9S1RVuP
	meBzdmH4AYtVIdrC+2qmHllgVXeK8d8hE3TLM0XpCXMBfBPBlYzQGoe4iQzudSe/KokIC9l3lG7
	VF8NcFJDG6wo+UY0qDmWU8bMIROF3QnJFaRoOQbdMqOVpQkxd6RnwpEYo3mso97Joz6GW9Prxpg
	jzJUfmVnY1Vj2cuTf3s63mK4nAjndgN0sdIykRBQwnJIMaFvrzBy5kfl+BNN0iX2yJDN9hIJW2u
	0RM5v2dGIE/zpdKA4ozy5dvxGC5FAwaOtzxg25sS46eRYZaG3nS4iKpdmdj7bG8EmCh/0RnOTou
	J+Z6wi5imP3d6SskC7tAuPSIwIuvycKDmoDEtY4TLGX5AShast8aNAP8f3Y6r5y6o3EFTcZDpSb
	euN7xVa77YzCG21PMUbGnM5JHfYZtfok5pyC/e/3h5XBJMKaAdyuXs2Kmr48/bn8MJHG6nujlIV
	wyziRcBlRV3fn+FxMqiip7fGHNPa3nniDaQYgi12ZQsg90OekEZMK7+qtFi1FVLi36+iABImiks
	AN+sUE2iUa+/Ts4wnfLzV9LCuTChQq8Z9koDBTmK4EkzGNOkdZTJ1eQl9J2G5OPqACRo7pJ9f8D
	41o7qwAayOgIQ9u+MrJKdeCLKlqHBoopmocA9t3Mg9Ggfx9SPS23pURjKxPvRj0P/WIE5GTSn34
	vUKTAoP1LQUQ==
X-Received: by 2002:a17:90b:1c81:b0:3b1:7329:a127 with SMTP id 98e67ed59e1d1-3b1b09f60bemr10600304a91.20.1794868239703;
        Mon, 16 Nov 2026 14:30:39 -0800 (PST)
Received: from cs-arch-srv04.cmpt.sfu.ca (cs-arch-srv04.cmpt.sfu.ca. [142.58.10.48])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac255634sm944375a91.5.2026.11.16.14.30.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 14:30:38 -0800 (PST)
From: Mahmoud Abumandour <ma.mandourr@gmail.com>
To: Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mahmoud Abumandour <ma.mandourr@gmail.com>
Subject: [PATCH v3 2/3] KVM: nVMX: Don't clobber VM-Entry instruction length when saving soft INTn
Date: Mon, 16 Nov 2026 14:30:32 -0800
Message-Id: <20261116223033.3866283-3-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261116223033.3866283-1-ma.mandourr@gmail.com>
References: <20261116223033.3866283-1-ma.mandourr@gmail.com>
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

When a nested VM-Exit occurs while L2 is vectoring a software interrupt,
save the INTn's length in vmcs12's VM-Exit instruction length, as is
done for software exceptions, instead of VM-Entry instruction length.

Fixes: 5f3d5799974b ("KVM: nVMX: Rework event injection and recovery")
Signed-off-by: Mahmoud Abumandour <ma.mandourr@gmail.com>
---
 arch/x86/kvm/vmx/nested.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kvm/vmx/nested.c b/arch/x86/kvm/vmx/nested.c
index e8cc0fb308..2bf38db8e3 100644
--- a/arch/x86/kvm/vmx/nested.c
+++ b/arch/x86/kvm/vmx/nested.c
@@ -3993,7 +3993,7 @@ static void vmcs12_save_pending_event(struct kvm_vcpu *vcpu,
 
 		if (vcpu->arch.interrupt.soft) {
 			idt_vectoring |= INTR_TYPE_SOFT_INTR;
-			vmcs12->vm_entry_instruction_len =
+			vmcs12->vm_exit_instruction_len =
 				vcpu->arch.event_exit_inst_len;
 		} else
 			idt_vectoring |= INTR_TYPE_EXT_INTR;
-- 
2.25.1

