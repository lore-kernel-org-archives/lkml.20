Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793390824;
	b=rG9rOhmIJk8K0+96TmjmZ7ijWCtnAH2vxjRC3vFpaur6SyBhrn2G34jvq3WZ820TIO0q
	 G7/L2K85udfbDq3Wi0nQhIV00gnUx0D2c2gqLn6t2h74KeKYK9y3U6N2GHJjSM7nuhT80
	 too4TPnIqoDRmMlymvv3LbRQyFy4AWll+1vS5Xr5cLEN9/bo5XjXryFxRqz4LHRl/wgAU
	 iwYueuruYBknT45YjxSjcj2ksJ1vp4kMZY/lC0G2+7gnECTRKs8XDrtlUbxDOqKFPjmq6
	 dYKJWWh0aYS5Hxm8K+FZQ96JyIjHDAQfwoo4y4KfvPLX9/bvGmRFennTNyn/uHPukZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793390824;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=G+u0MMaB0Chjq0cRmNk+9/pu3PKAcwfxS8n0Z1mbg/8=;
	b=KiCCODK0J5nloS47gl2y82rGLFS2gDQT65I5/5LefZ3jekqmS0mKPjUo1sjqdpQzoNp1
	 eUISVJKvI34NYMQ4PsmvlP+degauY67Hxzff4t8QvOuld7XKDMgB0Kh4mm4j0nCbJ8TNO
	 GmaHreOfjoY/9oR83FtqUdD1jpzG+PbcjeOXJ7LbdMVGpHGX3wwDjjG8TU1yVppmcnGIz
	 jSBUwoQC0c3iON1mlDjm5cfTxETmVFOmjLZdqsQ+gYW/5G3bgQYMOQPZ5b4jYoGTVUjYh
	 0D/YecesZNRo4NJbKhs6WGlmjjLi5iW+WA/nJgunpb4kAtfDkEKEgrxgcURXUydqAFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dEbHn7cq;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=jrRAVdK4;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39632606A324
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 20:07:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39632606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dEbHn7cq;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=jrRAVdK4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793390823;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G+u0MMaB0Chjq0cRmNk+9/pu3PKAcwfxS8n0Z1mbg/8=;
	b=dEbHn7cqezKSC7Dsa+miiZLUKrBnP+3uVIwGxaAULsPsB3xdIaZ/Mlcn/NlkyUH8X5Lcp3
	v/TeQN7SsPh3LGHjwBHseWgqLrvYFSOE1ttqjpnP6XSx5ChhJIizw7pQe51vF8cyB6ONJu
	u5LWSNjnx9ZEsRQQJrYzQIP09WvK1Mw=
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com
 [74.125.82.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-235-XGvBVubxNXm0kX0mQcgarA-1; Fri, 30 Oct 2026 16:07:02 -0400
X-MC-Unique: XGvBVubxNXm0kX0mQcgarA-1
X-Mimecast-MFC-AGG-ID: XGvBVubxNXm0kX0mQcgarA_1793390821
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35c3c370b17so1834525eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 13:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793390821; x=1793995621; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G+u0MMaB0Chjq0cRmNk+9/pu3PKAcwfxS8n0Z1mbg/8=;
        b=jrRAVdK4kF8jFVQHu0o+gbki/HjMiIW29/yb/o8axh4CVvcL6pFXKzpmdctJ8ivGcT
         B2RNkNK7LT9E0c8PT/StfDLytIoeckaHbY0IyzwPyMAo61qGRRADUYNVlJxm/1JuyAmG
         b5PNDyHKLG4YRS3KToSClcAKdpQJaxcpqJ//+9ulSzcUZo62wN4vsnQdrqbuAZOge0vg
         gGu8bMsL0xO3JA8XJ1WVvuXk+3r7i1rML5F63+kgv+hesyElSMwxieJAob7uuDwORbTI
         GaX2u/FiWs0H3V5WReuAG8LCjKbxFy75EmsiFX1uG1tWit/+N0Q6MToVXDYFJMIb1ciU
         oXYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793390821; x=1793995621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=G+u0MMaB0Chjq0cRmNk+9/pu3PKAcwfxS8n0Z1mbg/8=;
        b=0vvlsxN+tz0fSBlhIU70YRBSRHCAYpXpzCfeYTLZAMprBcCThbhBwYgt985mTbv5ty
         h2Gd1FRczDArXtsAJrJ8cQv8Dpjs4BBaFhpyOdl24GZpyXtvtvLuiGFOeLVpNdEYPLy4
         a43oPdoq1zMmndDWY2OaN9DE2DwetUSwCdSkbegKrFpqXnAa4rQWM/Q/MgYWW3nJ0wfg
         tTE6CzOt/GLqvYL9uxFFq7HfFO9cB70RCXIHF1RyGsDc6I1GCigFJxzyvfth+s8DPqiO
         2cvE4R2dAs40SEb2a6vHQ6wuf/PA48IWEChMnYB1i3meZZCDEvUqmq4vVJefUGgwdo5o
         ZOhg==
X-Gm-Message-State: AFq9FYI38IuhYOICgyb+7+04739S6A/FGc8G3+29Ro7nzhFqgH1HppbD
	Faa4JlU+ngQ1HgHqHSS+OzKtFFTBcippQBb4EdBA6yYPUKR7SlfImTFaPGsIGqbPuCqrIvZuj/Y
	+saTHXVSHujf7I4xCQ6gEoxdK4cpJIxLy1lixmBX+UpEfFcLYjJzhsjF+p8hmGa4YBtu+N16uCj
	ubfKQvc2VSo3AvPe4IzU+WMPPgEDfWjnVW+JjncGtE7NVbpOeE
X-Gm-Gg: AYBFou2DDEuMvbvGkmw/4/mY5+Q4MQsERNtR+DAP9802BhU72ViDOb+YZor7ha7zJQq
	Cvyjo633hmJLWIdfJNy1caK/gMg0ykjfyf7jq32nVk89g4NdSSe+RRTPaoyE1JlmloBShRK03az
	2uJYBSzQWFXMPKCSvZGS3Q0bN6fwQKslp0CfrDlvE3l1tJb6RHczZDQX29el1UCz6cVzhz8TnN4
	NZvoGByujKZijuXVi726fmbFKbPvahT4uzM0Vd3ukBAbI99XHxRr6r3m+p2jTSs/7RiUC61Nkgu
	7iTmzD0Xk34eRD9vT94+dQe79IplCo3bu2Nn+tjQYVvBwSt97AueuRJKyoXg3e4dPseTQC8uL0w
	jI97r9cL5/aDVO5QqcmEGpfw6O/+iubOES/1a5MRB/+MLx2Z1AmV1or0zfPmOe5qOiYz2w6QHVQ
	e7rQjLXHgCFKL3jg==
X-Received: by 2002:a05:7301:618a:b0:351:68e8:4646 with SMTP id 5a478bee46e88-36a424199bemr4511599eec.37.1793390820614;
        Fri, 30 Oct 2026 13:07:00 -0700 (PDT)
X-Received: by 2002:a05:7301:618a:b0:351:68e8:4646 with SMTP id 5a478bee46e88-36a424199bemr4511552eec.37.1793390819849;
        Fri, 30 Oct 2026 13:06:59 -0700 (PDT)
Received: from fedora.armenon-thinkpadp16vgen1.bengluru.csb ([49.47.195.13])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42aa8999sm10581834eec.29.2026.10.30.13.06.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 13:06:59 -0700 (PDT)
From: Arun Menon <armenon@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Peter Huewe <peterhuewe@gmx.de>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	linux-integrity@vger.kernel.org,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Arun Menon <armenon@redhat.com>
Subject: [PATCH v6 1/7] tpm_crb: Add register definitions of TPM CRB chunking fields
Date: Sat, 31 Oct 2026 01:36:43 +0530
Message-ID: <20261030200649.357508-2-armenon@redhat.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261030200649.357508-1-armenon@redhat.com>
References: <20261030200649.357508-1-armenon@redhat.com>
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

From: Arun Menon <armenon@redhat.com>

Post-quantum cryptographic (PQC) algorithms can require buffer sizes that
exceed the physical capacity of the TPM's Command/Response Buffer (CRB).
To support these larger payloads, the TPM 2.0 CRB specification [1]
allows for data chunking when the physical MMIO window is smaller than
the required buffer size.

To support this protocol, the TPM driver must be able to detect the
chunking capability, and signal the backend using specific start
method flags, also known as the control area start register bits.

As per sections 6.4.2.2 and 6.5.3.9 of the specification document [1]
Add 2 new bit flags to the existing enum crb_start and add the
capability bit.
- CRB_INTF_CAP_CRB_CHUNK: A capability bit used to detect if the backend
  supports chunking.
- CRB_START_NEXT_CHUNK: A control bit to signal the TPM to consume the
  current command buffer, or to get the next chunk from the response
  buffer.
- CRB_START_RESP_RETRY: A control bit to signal retransmission of a
  response buffer.

[1] https://trustedcomputinggroup.org/wp-content/uploads/PC-Client-Specific-Platform-TPM-Profile-for-TPM-2p0-v1p07_rc1_121225.pdf

Signed-off-by: Arun Menon <armenon@redhat.com>
Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
Link: https://lore.kernel.org/r/20261029181541.99505-2-armenon@redhat.com
Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
---
 drivers/char/tpm/tpm_crb.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/char/tpm/tpm_crb.c b/drivers/char/tpm/tpm_crb.c
index ceb4100ba400..d76f9e30f036 100644
--- a/drivers/char/tpm/tpm_crb.c
+++ b/drivers/char/tpm/tpm_crb.c
@@ -57,12 +57,18 @@ enum crb_ctrl_sts {
 
 enum crb_start {
 	CRB_START_INVOKE	= BIT(0),
+	CRB_START_RESP_RETRY = BIT(1),
+	CRB_START_NEXT_CHUNK = BIT(2),
 };
 
 enum crb_cancel {
 	CRB_CANCEL_INVOKE	= BIT(0),
 };
 
+enum crb_intf {
+	CRB_INTF_CAP_CRB_CHUNK = BIT(10),
+};
+
 struct crb_regs_head {
 	u32 loc_state;
 	u32 reserved1;
-- 
2.56.0

