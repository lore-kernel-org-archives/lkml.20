Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792752043;
	b=y080J3SwVDTwAcyJPrOEbKPxUlfSXEQ3at9gpCE52BIcUrxR0VbN8SUAP54HF6dnN6pq
	 4lWpZ4td1WlYZjRf5VAcJaUzT2n+ORB+R1otunwrN6WkTAxpeN/qVXqu1OHicTtw5Kubq
	 tPkj4pdbNKwZ+9YmJufIdvVbY1pLrqNXlO4UTnLbr6wryk2iZ6pugREgW3GSn3HAdtWML
	 BP4OeYMjH3YMjtUVc9pBcDlzikKko9f43L5jrQOEajlN+o3mRuoPf4C1aw4+cAOIQVlOX
	 /qxS7EJLeyO4eUl6AGloQQVHqbtTgTxCh59UonxsCmJaLXZIVtAY1n3mAmb7rWN99DQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792752043;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3fn/qeSOMh17ArAGKi+SkWfmCErKg3ju5QLNHCwzqmI=;
	b=eAMcKoEQu3hYkDPIcwCkNVKI4dcFlI3jDbMnHN3q3Oe+vbITj8GH+QKzosj6tr0/1zFx
	 gAHj8HVDLUiErgI8q6OWP9iEIQnxZOT3lS9AdBh7ZTUYKDKXv0mpbqkMdLU5uCPfcYMEc
	 O3dpxvcpD+EmTDPtbgGVMxQq7cBMoETw7risqfh7Kc7pQnVN9YVozLF+0b13NM428iS4Q
	 qD0WcpI0QiaAgO4zqStxYBpjZjzN36ywgvenGfr0hvSImA6KxegYuNxseKuEJeWYf5GBc
	 rSSs+2UESjA9TAKa9+SeGCoFHg+Ks0b0zhea5eoOP0OL2llrin7tSVKOSFvjacqGmCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=N6s2C5Vu;
	arc=none smtp.remote-ip=209.85.215.178
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1FEA606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:40:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1FEA606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=N6s2C5Vu
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cc4aa18f9afso334408a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 03:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792752042; x=1793356842; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3fn/qeSOMh17ArAGKi+SkWfmCErKg3ju5QLNHCwzqmI=;
        b=N6s2C5VuIa6TtEuPqdllmx/G8ra3m0faGDWBnZw+fj5k3NmLUHlKGpmIL+QIo5BHXN
         kgokd0TzFnYZ2jnTj+4ee1OPSRoEpOIiiz7VgqNG6pg1z90cMaU8QaNEe2IIwIVV1RCp
         z4kvIUFCc++Aq1QYnEDvIVpNJHdygjE5QS9f8yzm0K1t4p9XrMvZuVVw/VVKBQgMoQB7
         nBBaxWeuG0wMQyw1hROWVHjQf+SLTD1wL4GD4+GqNRrpG39oxp73f3XCVrN1hQYhP7Jv
         5K0x/GIBnJDf11j10qYrzExDKCYROoLMtUakyXZBsr3Z7sIZby6j3p2zOaQ+NqZq0n0H
         gXiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792752042; x=1793356842;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3fn/qeSOMh17ArAGKi+SkWfmCErKg3ju5QLNHCwzqmI=;
        b=YY7i1hjPxifqPCPh+6feSXRq86ckkkVRmKHBaXwFUEpXgKy60smwVTn/Dfa0XHIRv1
         Q6H3FkjcnliElW4DsJLmaQVnMPBTlnnqbsJPsBPZKkfnJLquBDYld+vrW/pPuWiTIvJF
         Vn55T+jJfep/jYTYy6bVw5VW4+R0oCObcEXwo3k9mPeoYAymmt40TqXI8nA7x/l9YIxy
         CemxA5pFayfQvOEJgcvHOSMHmDl2eckqchZZLWPnUG5Vja47YcsMNxIfMM49WjQJ3788
         MYaaF1gMSs78HTFph/rMUmHTzlMedK14ABxcoDMASWvyi7jS5giGaVozANsBKuSJUdIn
         c3tw==
X-Forwarded-Encrypted: i=1; AKwUvBzrKDTOo2AQic9za5LueT0vUqMFZ4BKxSax2CQMC6z+UeDsesmf1ovyla5WuTkITFUgu2azEKhXA8L7f90=@vger.kernel.org
X-Gm-Message-State: AFq9FYLEa32ctr0S7njgGcJbrhJZd5rqWx19kVHFx6JS8l2iVROvWBHa
	vpbOkAG2pbcAFH15oqKjWOfIoM651wJK/jK49lgXghr47xQCtmxz5zDz
X-Gm-Gg: AYBFou1tb4K96UkU3HuiYgIUZKu2r0jacBCq2ycNNG9c2lEppLlTq1I79Pv5AGpRHHv
	ANgVZCgOFJDj+9KD1jCFxGwkLRR5sZf7ntNQ5GGRCK7IeFLrfL5kyDvPMVPF+t2jWDDnpfbi+k2
	6W8GSBeXUyqiJCHPLo3/uypzkjYE9h9aAU1+EY40qDiQlUesp4KJiVZEU+Md4VsKrW3mU/R8Ys1
	D4NE1wTDecAkF99gCqXBwOt1L0kg/CVLFlLODPFA3gGArtxZ012INd5/xqD/DXQUHZ1nfvo37rJ
	/40p/rJOFNq2pXGeVq+7PeZZKnhcsBqbnoFvkZZaxNQW0kw8DnQcLK5Fwr7Hz+kd+Hk3jg08nMb
	gmA+Jm277P/DbMg894xeHvFVfKB9oPdQn814gU5n5i2PtxWsDbDogKilI5QP2fiAkfxt4H1fHMI
	Q1a5nr/4Ivm3qqibRJAYehzV5ftY0sflmV+1BMVAM/PYoC7zAFdRwUOfnjQQ9jBvFFwapp/x3Nz
	6AEeEPjN2S+gKJN8tDt7oyaVlAlWrPKQxoOtbKPWU8tDUEdSchTnwTDVA==
X-Received: by 2002:a17:90b:2543:b0:3ac:b08a:ed2c with SMTP id 98e67ed59e1d1-3adce08327fmr1475446a91.40.1792752041791;
        Fri, 23 Oct 2026 03:40:41 -0700 (PDT)
Received: from gmail.com ([185.220.236.117])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adcb1b133dsm3300636a91.7.2026.10.23.03.40.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 03:40:41 -0700 (PDT)
From: Jia Jia <physicalmtea@gmail.com>
To: Mike Christie <michael.christie@oracle.com>
Cc: "Michael S . Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowangio@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	virtualization@lists.linux.dev,
	kvm@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] vhost-scsi: fix page reference leak in misaligned I/O fallback
Date: Fri, 23 Oct 2026 18:40:35 +0800
Message-Id: <20261023104035.6686-1-physicalmtea@gmail.com>
X-Mailer: git-send-email 2.34.1
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

iov_iter_get_pages2() returns a byte count that excludes the offset into
the first page, but also returns a reference to that page in pages[].

On the misaligned-I/O fallback, vhost_scsi_revert_map_iov_to_sgl() puts
pages already added to the SG list. The cleanup loop starts at
pages[npages], but accounts for its first page as PAGE_SIZE bytes
rather than PAGE_SIZE - offset. If the remaining data starts at a
non-zero offset, it can finish one page early and leave a page reference
behind.

Use PAGE_SIZE - offset for the first remaining page and clear offset for
later pages, as in the mapping loop. Without this, each affected request
leaks one page reference.

Fixes: bca939d5bcd0 ("vhost-scsi: Dynamically allocate scatterlists")
Reviewed-by: Mike Christie <michael.christie@oracle.com>
Signed-off-by: Jia Jia <physicalmtea@gmail.com>
---
Testing:

- Four fileio vhost-scsi test instances repeatedly issued affected writes
  using recycled backing pages. After about 1.33 million requests,
  MemAvailable fell from 5.3 GB to 13 MB and swap was nearly exhausted.

The affected fallback is reachable from guest-issued virtio-scsi I/O.

 drivers/vhost/scsi.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/vhost/scsi.c b/drivers/vhost/scsi.c
index 4f8c0260bc9e..b0a536fbc69a 100644
--- a/drivers/vhost/scsi.c
+++ b/drivers/vhost/scsi.c
@@ -883,11 +883,16 @@ vhost_scsi_map_to_sgl(struct vhost_scsi_cmd *cmd,
 	vhost_scsi_revert_map_iov_to_sgl(iter, *sgl, sg);
 
 	iov_iter_revert(iter, bytes);
+	/*
+	 * pages[npages] is the first page not added to the SG list.
+	 * The remaining data starts at offset in that page.
+	 */
 	while (bytes) {
-		n = min_t(unsigned int, PAGE_SIZE, bytes);
+		n = min_t(unsigned int, PAGE_SIZE - offset, bytes);
 
 		put_page(pages[npages++]);
 		bytes -= n;
+		offset = 0;
 	}
 
 	return -EINVAL;
-- 
2.34.1
