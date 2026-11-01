Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793544418;
	b=thrA9bhBpE3WCMmbiuK3dkWGtRoaJYIpFzsxK4MkyA3ZT318n3/VZF/GagB+13bJKxSF
	 4Aoh52VCSkQ1+GciyVmXfNrV7RPocpSagCbymGmJJHg1p9hi27f2HJsyeHYzkmrQLDcjf
	 R8q3lCQMJ6r53jlf8WtpivDg5QAxw1/U04CpsohQqB1bF+6nIiSpvFq2YEKkKBTTPxgj8
	 GbXBQD8ZTCl+PYWmijGvj4BzbjgHyX9Zntt2OZstxe0reKnnHOZ0TSvs3xxycMVpkCBTw
	 mCrcVSe3YlNtImtNoxXOInLEKQWL7DsjXDCg/tQD0Nmez5bHQt0Yh1v2Mj2Jp92cYtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793544418;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RxWoIhpJjuj2outZeAOWH2ZFPlszOZNa+qnxn1FwicE=;
	b=ECHWwMbZWjj/qoUMe+l6MiZL3smSGaS9rH6/CnbSumUGuGnXWpgwBNBp0XCIWiQLCIni
	 R5otez6/H0pnCj9pC2voiARrJEfAaXOZ2wKLqnXjj/KmjD6Bc4i510uxmmXfnO5fDijiI
	 ecZVQhuoStZNAUf8KxnQQh2or+l0H+jxiCri3ZrH7l9gS5ekImJwsFXDzk6EguIrKHTxk
	 jbmSZBO6vTMUbBzTrdVwwRHEm+H5fRC8Zpja1/em/KjPxdV9ikomwV+AkEjNHqqo/xhmM
	 A7nh9UfCrjN/wPA8S3/JLvjK74yGxNGADpdu1zbIp1Yqf1RO+QRp/jI7wvMDFdUaIqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pzxaxrxu;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8CB1606A330
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 14:46:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8CB1606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pzxaxrxu
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-353804b591eso3851761eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 06:46:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793544417; x=1794149217; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RxWoIhpJjuj2outZeAOWH2ZFPlszOZNa+qnxn1FwicE=;
        b=pzxaxrxuEpl7w2cfAkfUmjHhWik/DLGXnibNG/mFSk/Ex5bKSgkprIWXlqZ6U4ErRl
         rOKWDgoBIRd1pg9zfPqWwa2J1MSdBBEjbfYd24EV0zFvSsPquu9IY0NLZRYhAbqR+nrP
         7Az1Xclnic/EFIuPtnN1Cf/exdiN7QwOJU+G8DE+vY03wZrRsUcLWNCHDIQjussF5TcV
         oJsHQmpQAhSO/rG4umMX1Xs0i6s0aCK66nQZXODKJQhd9d4wOGI7yO9kUY6loj0YpS95
         bq/xh1jcDu4lH3bZp5VEaOgeivLiVuueFKF3LGCfPgQ1uZZSncOW6wiJu5LPE456obmC
         WrMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793544417; x=1794149217;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RxWoIhpJjuj2outZeAOWH2ZFPlszOZNa+qnxn1FwicE=;
        b=R4XsiLBNXqPdzlczCj1Yu+rCcGS5Pmn5ZRPtrtW3jFrlnhy0BR1tGYkL0qZ8Mj0eBd
         sWE0/Ma/tGBf+whDuPSKsB2oRnDXedlaaNaWVSvgHh3+5NuBU+me9CD7RkE8BEaHD9PG
         OAlJaX3+/ctdieXNItlT7nFGS5dhr8p9ve86nCX5wV4QerWYQWrUFM1u7cCfV2qmiIoC
         Gmny5AdedEvJ58P5LQAaZ7CJKGEZEbpqWp9ZCBsJxPjpQ7QEltBa0ADOBfRBPLge2lSh
         23nnKGsryBc3p+WButZDKOdN/OU+2hh4tTzp6IeM+zb7x217hIEBXeT6Cjv+IsYSePtv
         5vEg==
X-Forwarded-Encrypted: i=1; AKwUvByeBkWyodT1cd14bbq72upp6U/zoX07FdywAgs+Lyz/HT1dScP64MWIPuAxrRzsSdV0BZ8+O2OT3Ji1PLE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJdYBijYh2iefzi0zHgwkcH8b30yyVzbKOkqActSwTW2PR0cDeZ
	UbJ2gEVxDvTaoTx6Zf4xxJHlPFEZreEVYYlikMsIz/VPNQzvBu6pSSLZ
X-Gm-Gg: AYBFou3QShTakLord12gJZg8wb6+ZZQxJl/HZprPizFK7ZQ4ayGFfIuSaGEynNZyFoI
	Fh2p8g2OoyV0t/voBTgbGzT/NttyTBBO2cLpDXiXFl46GmChgpQJmjuoFzhDX/mNjp2OenyJzFp
	F6FJku9I40sa4ruSZ5EYowyKbPvqKYgN2iwHcSvGRxRSj6h6WGK0ARr+RMsHXFShIz4mV2Rn46e
	l9zN8u4NpWCsGIcPTGethq93fx81+CaDUwL9aTjqlRBFdl48Ag9R+ibaKEND4+17tO46tre43YP
	Vvbxqpx9wmybdPbKy2e5wGcDNe9H59Q3OpbJqKf+2HVurgVUkT6sL4mHSlEt3q8oZ75B59Vi2Gi
	BSI5tCPJcrnikfXhpzynAO1gtfPjq0UMl7WNytJQK7H7zt5ffhrDPCkcmtI7hK1o/qe5sLDu033
	iK190Cc3+0lDGzWRHMI1P3YfDm9OWT2JJAc0CFMQF+qXEi+JKud4D8yiwMCMT3Q+SNy+gz2kHuF
	isGL/hJNyl5rAhaH1VGvfOLDOjDHix4DSaMhenoxsBQtTthEC4c84t7Ff5OxzNWfCPvGoyi2S/Z
	aWrmbLI82tyNQf7BocdnpsFjDbS6xmJIDNg=
X-Received: by 2002:a05:693c:88c8:10b0:36a:1f:9b74 with SMTP id 5a478bee46e88-36a423bf83emr11475457eec.27.1793544416826;
        Sun, 01 Nov 2026 06:46:56 -0800 (PST)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a6f7f9sm32747545eec.25.2026.11.01.06.46.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 06:46:56 -0800 (PST)
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
Subject: [PATCHv2 2/7] KVM: PPC: Book3S: Don't call __ffs() on an empty pending_exceptions bitmap
Date: Sun,  1 Nov 2026 20:16:27 +0530
Message-Id: <b985cc12b0ed62599815ddf87e612bc8b6b2813c.1793543627.git.ritesh.list@gmail.com>
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

This problem was caught when running KVM PPC selftests on big-endian.
__ffs() doc clearly says:
  "Undefined if no bit exists, so code should check against 0 first"

This cause KVM to deliever an arbitrary interrupt to the guest and was
causing guest to hang up while running these selftests.

On checking further - GCC was emitting 0 in this case, which caused
System Reset in guest while running kvm selftests.

Use find_first_bit() instead, which reads the word once and returns the
bitmap size when no bit is set, instead of reading *pending twice
thereby causing TOCTOU as pointed by Sashiko.

Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/kvm/book3s.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kvm/book3s.c b/arch/powerpc/kvm/book3s.c
index 2efbe05caed7..38816578d002 100644
--- a/arch/powerpc/kvm/book3s.c
+++ b/arch/powerpc/kvm/book3s.c
@@ -401,7 +401,7 @@ int kvmppc_core_prepare_to_enter(struct kvm_vcpu *vcpu)
 	if (vcpu->arch.pending_exceptions)
 		printk(KERN_EMERG "KVM: Check pending: %lx\n", vcpu->arch.pending_exceptions);
 #endif
-	priority = __ffs(*pending);
+	priority = find_first_bit(pending, BITS_PER_LONG * sizeof(*pending));
 	while (priority < BOOK3S_IRQPRIO_MAX) {
 		if (kvmppc_book3s_irqprio_deliver(vcpu, priority) &&
 		    clear_irqprio(vcpu, priority)) {
--
2.39.5

