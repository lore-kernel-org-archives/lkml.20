Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792959553;
	b=UOjoqpLVgsMnlrbdJdJuL5whuuFVIrR009puU9yeiXR8NfEySLF9ket8scg9xqEN3z+0
	 zxj8GTRchYw8QQ15ufGA4QGfFyGZbOD4Zy19oL6gnXgtNOC3TUuqofgLAXkD6VfA3Jxpm
	 a5g6G7U+7MQl0vY+9wCjEYZ3TmMNp1wwWUngjc+qAeUo6hGif7S6+GY0XcWs5qOylXO+5
	 H4uRsKzcstqPax+HJu/WMZiKUSCxR0pxO0u36W2QVuZa7OP9AvvCpINxwWjbQJRt7wNsg
	 /5FZLJScR8ojDqy2TNgOimSxp5eVGnssPmQk+T9UrqQtQZvB+NFHN9aK8WHUlINjFkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792959553;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jtzC8GOmAvHT3XfNpHE4tG+IxT92XswAdGYofHiX++Q=;
	b=GaoycuO2uRN8NEkzsMk9qayPLm6IJVIGIaB7it8AGJAzlZi0QwV3RPzA6NnCXot1KxdV
	 Bpzee8OJtGwSGjcaCuWvJ0aDwTNCUYQwbyc9bB+s71gqw1I6gaLti47+eskYIdgni/rdg
	 bj//toe13JZUhDlToKJj1H+2HfY/aVDwjBwrSaIxKcmA04a6IC2GviDtjGedPnCmBv1tj
	 wBTD3APqEgkFxirEQl9FGLmtHBQfYxNi1jHSnnfQyMvOCYvNpzAaZEmGc+Z1OnA26/TB6
	 sBODmcJzEBfb1bgU4piP3gQ0IltFFSyvBDM/7QpvntX1fLud/dFKATbwxC28HkSFEOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WM8O03fA;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=VUOjKEPd;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 955FC606A326
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 20:19:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 955FC606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WM8O03fA;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=VUOjKEPd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792959551;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jtzC8GOmAvHT3XfNpHE4tG+IxT92XswAdGYofHiX++Q=;
	b=WM8O03fAlyploiq6vl1QIDFooK4igl7hHOdjKu0X6XccNQRX6uwNTtZOYpNzq9sAqrjZo8
	y1LLsbq0Wb4UQ4KuCGhe6zozJvu8gYn5MgpVM0kd31keSaJg0TZQLkGXeoPjjB3Li6d0HX
	U7MTrMfGriXyPJ7ceTyCEUIbYQHFAAQ=
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com
 [74.125.82.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-252-MhAz15OxNx2gQzYqDrdFGA-1; Sun, 25 Oct 2026 16:19:10 -0400
X-MC-Unique: MhAz15OxNx2gQzYqDrdFGA-1
X-Mimecast-MFC-AGG-ID: MhAz15OxNx2gQzYqDrdFGA_1792959549
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-193b5eb133eso3299148c88.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 13:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792959549; x=1793564349; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jtzC8GOmAvHT3XfNpHE4tG+IxT92XswAdGYofHiX++Q=;
        b=VUOjKEPdZjHCRl1eosDhwWnd7HgWKXSbWry5XZhowBHeTzbAEXyiQR0P7DK/h7oCG+
         xV5etLjgn485u4IDz7HaTPtqoYUwnKnz9BuNOxGmqHI3vGWlWZWDQiljIbDhvQVX4Mqg
         NmNBRrqxUDKDba2kHcxW+3cydRaG/wVBALP/Iwy6DUdwy38SwQv+RTxAC14LgqQoHvzh
         9CBuMVgOBnJTrYT4EtSNYKDm+O5fiXBIaVBwKo0pRtMKOnjbdV76nITdD66sHvTeUkln
         leAOJUvcw760TeLyy+RCC7NaSj1KACCE7mBvzyT56q6wkepmTOctwEUPkPkuwYUqxLaM
         jHqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792959549; x=1793564349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jtzC8GOmAvHT3XfNpHE4tG+IxT92XswAdGYofHiX++Q=;
        b=0zG/+kbc4N3D/Jc+O4OVkOVzDUcCimqIUxag4Pg/fVM067OmmEAwWAWyIPJK3FhPSB
         Xawy94xvE47+9lnQ9N9C9kz9N9yItF3KKb7IX/zUDyNpfi7QLYvc3rs+Me1hR+Xdm2dY
         3qp+I9G6KxCR6NGskP6qsXDBjm33LzgkfOmH6SrKOhgPbteWq/Nlbs62AICZFPOensuk
         fYnK/rkoKPTHF3rHa7VogBNbPBpZQP9dJ8Z5e6sAmWTXSbDMXhzqLmmSXCaGmwYjCVOQ
         2j+eZquekCLQpQ6p7N914PxN0vA1kCDs0/4zQQKS/ogHmG3fi2vFCoX8FcmwvaliK8qv
         Z48Q==
X-Gm-Message-State: AFq9FYJiH6jCqob6LLwHAPXo5DLi9l5ae0RISu+Rw3VsLHFDeg0lJWOH
	WMz9K3LLdlL8Bnhm74gJaRtzo+nWRRxMXJR583SLlUKw+S/ojnU6dDr+6Wf4ctjboc6r4I4dKY9
	Ozgyn8SHG5Iew7Z/EOCOfVeJhHPkIOK/+MuVkjvqYZAhclvV3LvKxGzo8B35CjSGWKOW9voNxvK
	1FkVt6uB/k9Bw3FgLoQ4B+Rr45Lp7K95L2J4FQU+cz8a7gY+Ek
X-Gm-Gg: AYBFou2g/WmAEMVjU9Snt8AITh7UpX/TmE5gHoZl9478KT9gNlyO7yDn1Em2QTOtlyQ
	9TzQ5FKtF3sYqcvSFpCCOyvWTMcf2THOK1GCOGbWwN3okOQkMI/mVvC4GCA33Ss2np4AaXDF9Qt
	C4iMadkln/0KVVKRfftI3jn1VNbT+9pkZd1eaV5helmd4G9S+yit6DcejFRwBSPK2j2ekOYcCsi
	jc7oCNVHYIvdstmGJi8xUXZm+WTk9XzXbHQiShLGANEwIfjiBZrL9owf+Nj605b5W1ir6C//EsM
	bFMvZDNVcyOSyNAO2e1SzkD9pla3vPz1szTqhdn6safHI30uP1I+A4xjuVF2hU+zr9fdAB1aSJe
	etWK+iwPos40vu/edY5zBRYJ96sq3FqNgoOXCCpKw
X-Received: by 2002:a05:7022:c43:b0:16c:6459:35b1 with SMTP id a92af1059eb24-19935fcbbfdmr6156285c88.28.1792959549113;
        Sun, 25 Oct 2026 13:19:09 -0700 (PDT)
X-Received: by 2002:a05:7022:c43:b0:16c:6459:35b1 with SMTP id a92af1059eb24-19935fcbbfdmr6156258c88.28.1792959548453;
        Sun, 25 Oct 2026 13:19:08 -0700 (PDT)
Received: from fedora.armenon-thinkpadp16vgen1.bengluru.csb ([49.47.195.13])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19894d59f90sm17656169c88.3.2026.10.25.13.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 13:19:08 -0700 (PDT)
From: Arun Menon <armenon@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Jarkko Sakkinen <jarkko@kernel.org>,
	linux-integrity@vger.kernel.org,
	Peter Huewe <peterhuewe@gmx.de>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Arun Menon <armenon@redhat.com>
Subject: [PATCH v4 1/6] tpm_crb: Add register definitions of TPM CRB chunking fields
Date: Mon, 26 Oct 2026 01:48:53 +0530
Message-ID: <20261025201859.221991-2-armenon@redhat.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261025201859.221991-1-armenon@redhat.com>
References: <20261025201859.221991-1-armenon@redhat.com>
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
2.54.0

