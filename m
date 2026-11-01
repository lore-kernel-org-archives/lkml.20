Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793546934;
	b=VSYcHmDcYAijS36G3227yZI8uaoJXjm9zjRyPWUCBIX4+IRrCLPj0fIU5TkX8KOKShNk
	 o/LW2wmz+SyA+6jkgMgrKCIGta09OGazZWCGkmTkH27HLb/yJ1o5bqUYGbzjYoygO0CVU
	 vIcAiBSsIQb9P3vl1pwGqj1mfZ2bIkXPco1FCQoqbOhk8S0pPTXHgKGLGyViVvOqpZjO0
	 y1mgbu48Cq/42PalK/cVpuFclo8rlCv1v76NsLKe4VKjWqKvWNfGvatGgiFxVTeq9hvOJ
	 5vO2poIYBqmGn+lbrPhx9AGsdfGOUrghf6QN7cG/RWLh0xOtYibQAuJ9RfXiiF7HJKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793546934;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=8U+w5fTrGO1h6dmc4Lc7LqvLyaXO5MtfIamT3kiNq3A=;
	b=p0nndUQlBhQe76CTAwRSpIwEx8jAYEGonTHPiX7lKYrpx19V0XjKZ8olsrMmR/tCS70h
	 Jl5tWbbVYuzBrK+mof6mfQjcub9ZhrcN2EMKAB8oS7DW1IVyReqrFeJm020jFdidoxIK3
	 qvX1wxkNBxlstctpulAe7V7CczYjyQGnBVShtvm6XIORJkN1aMUrsn3AZfGjmT+kPwepH
	 CvWCnLd7Imxj/Rez1Mkehxq102Eqe8UhK0qfX9K3Kz6+/0std10fdFsTrLALOjQBsYC5V
	 y2mR6m3tvSDqHT1YMpczmjwRwNNfoVoH3L1xn/vr5NqkrxU75noZf5c6IUghe6xrRhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ybqnyvdm;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02881606A32E
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 15:28:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02881606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ybqnyvdm
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1438d9363fbso1648099c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 07:28:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793546933; x=1794151733; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8U+w5fTrGO1h6dmc4Lc7LqvLyaXO5MtfIamT3kiNq3A=;
        b=ybqnyvdmX+JT+N9Z4qS5kDP9PZ+WEzSsrDRXBhesh/kajYk+CA5jjrdShNzmZJyAM0
         DI+uTYHJ9VsZ8o4+zieEhjFQHBlH3aW7lULFqi2CEib61jDXtCg3yoP4FsGBLvuKUB1B
         EcD1RbSk9KsbTIyBNtdG8YpsQ40xKOnsiqlUxP+k2vhJC8KA46EivQSrukg0eRJpq1fn
         6yzEG0we2CnB47bJc2PH6ITwQRkreMj6hWAcgSkHjzRDxw4HEQqIbuWrxCUQQqjr2PQ/
         wCUU0Cb5vqdMcqgZ59J4ptBXzu/6T57XY1C7/R2guibScY+vis9jCPpkGKRn1fpA8kRD
         NlHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793546933; x=1794151733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8U+w5fTrGO1h6dmc4Lc7LqvLyaXO5MtfIamT3kiNq3A=;
        b=ccOprd05cw48E00xCwb0+b8OXtSJO9tOPARyG681j4EwjtlAqAFTPbzqLYYUW6X2lH
         oNrsWIcGNFYnA+4ONnbVt6k1n1a3fHUSxYa4DFpsri51ZZlZZouJpFwyRyBA71O+eEba
         Rn13PI8ZxfX95ifmUkyOKk/WOoytNsG59m6O+ls1Y1Oq5rUc9ttDWCB35beK4m1BfMRb
         YrhXvOZ33olz2zj+uDICRoS8nv9gTnJcwmSzdEp2p3qIE/x80bt214PuyrzCsiQWuSvU
         tL8oorWrkDKWndgpp7NL9rW2/lSPS/kxFhuPqbp6C5FVhNQx0fJDXDEkyfmpgyvk4t82
         li1A==
X-Forwarded-Encrypted: i=1; AKwUvBw0+dEUWz5RelFvbcLrwM3wtYbrHzzAszF20xz8WDTiNXyJD4rue+3ZBq+YttMbkJsW4RQeG5xlU3ESP7Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYK5lnSfJt84mnw92ulv6wfngt8a1WgXklIWv0pai0E39WXCql4A
	2XJUb2Q4ttY0qvTZCagjkfkpgLkgbJX7Cpo8XvHqzoui/tVKsP94gi84
X-Gm-Gg: AYBFou0HF+l6e92KfnDwiQzFK1aiOXncXQB+fQyGAYBdgTI1YKRD4kP07jMG9AfrmUI
	lMacTSKiA0DQAobJs8omcqm4OwcXLbjw+GZ4j+cHsM7xsF/+iu8HqsS4wmIo6s++pkkskaD84HG
	EbSSMmRI7ROcPonw78vdqVyygyMSs5WhT4/nDZ7lYbcdCwfUiXQJR40MAgza0TYlPxurPzJKjRk
	MCaYd7fFE5OkLiKrNdJi7aDv4a/6f8FYWNX+Vj5iouno521gNwso8lbymLrumbdW1DSoW9qPyXr
	QR4HvalM4SlJb6qRutZPwrr4Ye7qUWZeUjjbYFhYhePhXON9RZOAbwTZ/H99MWKIDEEbcvHm86S
	5cN605BgXlRW3NbiKwzvMn2ENH5NLQRXInyz9ksL99XAqYQX5ZU3mlF+uDAP+zaxzbPQ815UqND
	AecbpvevKKkX6NBYWr7+uiza45xseAGxFej1DDc9osx2qlxHAnqPxrR71bBn1/gWi8VfVfwYDzu
	1Qyo1Sf/chmjWwDkT5JalzB1R04DlJHuyC0D1ribavyD+dQ81n3Raj48n5lXlvrFmL5JDNQpSj7
	s5VE2GLKnVkumqYjXVtLM+Dt67TijnBIWtPqebLfxHsRpdYC6xD5Pac=
X-Received: by 2002:a05:7022:258f:b0:19e:78fe:9d67 with SMTP id a92af1059eb24-1ac5a680801mr14363449c88.9.1793546933035;
        Sun, 01 Nov 2026 07:28:53 -0800 (PST)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac18458e07sm24862665c88.8.2026.11.01.07.28.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 07:28:52 -0800 (PST)
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
Subject: [PATCHv3 7/7] KVM: PPC: Book3s: nestedv2: Free the guest state buffers if vcpu create fails
Date: Sun,  1 Nov 2026 20:58:12 +0530
Message-Id: <082c338c69773a73a48cd4e0d0885ee0f6ef5326.1793546707.git.ritesh.list@gmail.com>
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
index e39491dfb975..8de753e302c4 100644
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

