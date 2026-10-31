Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793477717;
	b=XBKMYzGkWr5CilWWHDF6/Na5c8gPhb3/HmXHdWPTrQtvoLBouN9DEhtSDGnBpzOH0Toe
	 H8G3lkDv32uytaXvCF3qQ4PMyJh55hMraXEGiTLDNPg6sHHJ5/SeUAPX7nbPFnFUNy5bD
	 FDwPq403O9mQMYc7awf4GOa4GzlQAkDy002dDdPU4KXUy9JKjWjkE4d0xu5h3r3E5EMUa
	 gHk6clgy6hN/9IoKbF/h5paaRSvX/IRY57zLLfa62fT/ev2CZ1cFtqIb9wUaZjiDLFZjS
	 LLaQK68Psz/pH7YHIU1lAHs6yM4DmsUKiZZqoyymh9TAK0V5GFNtrWqaNu8xJUV7GPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793477717;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Y4H0janAHz/FjqAOb3NDIIhhmYGm+fqW5H2UAm3565c=;
	b=B/m+goij7GdcYXvn98e/dL7ABb/1/oR9by1k2CcPSe0rz5EB0Ce0GBZHt6Yx2oySV3jf
	 YQY51JEVSFxg/UZBbPUK0hgXCd/YPGGukcwrTO6gk+IrwDwGldOiQG9C60yltrXM1+qDk
	 BX4Ii6c2jI9a1XaH7iD1zZ+nNQPNyd6VTlYP71uKQl/zeNd11M7NKXgphhc7kTEDv1L0W
	 B94cYCuCMTcfAR2BYYgCh7h8VXj9TjKWKn4aMDPdq6MdCA8uU5ZN8TcS9D3cpRluoNs2p
	 B+7MPulrSRZkyF36AodjML9htSSrJtHoLPE6vL8wXDsBwq8iXs95Mfijrot8afHO27w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OMoBDEdb;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07BE3606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 20:15:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07BE3606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OMoBDEdb
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so11153545e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 13:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793477715; x=1794082515; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y4H0janAHz/FjqAOb3NDIIhhmYGm+fqW5H2UAm3565c=;
        b=OMoBDEdbcNmGpiK6+iOnRlDN5b+2sB2MEhbRIIgpnJtbDKTLbYp54WpwI7JJ4PXI/w
         bZubMReX0NJVNmbDAoCKxsGhTLw372BS8QtUnt6xwbDbtRjnaV4hUdJ6pxieg86uSLT0
         Ycnxg+19GPc63PEvxGzN68sN26PbnAR+HOlgfu37jAze+dHJykmnkZX7ijGnJAd0g3m1
         CNKewcF1/ErLomUy0Dlk7L3zLkXhoCen11M83ouDHpgzmNfEma/Q4DPLMNnjVe/a8pWM
         Lq3ZUBOYn83xIwdjuogIKlcaupUl0cxaCN41lpRaWfQlPg+lKR3ixSBr45NigNROu8VI
         1J+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793477715; x=1794082515;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y4H0janAHz/FjqAOb3NDIIhhmYGm+fqW5H2UAm3565c=;
        b=2CRkNOumxJDEJtn4oTeg6Gm3yhJaqn3JxPYlVi5c1YLEBoio6dNG6fdpV68R5GRSpH
         ldj9/RoKVsmQ5Dl1jW4B/BwK4PHjkW3WoUfRIwNMS8bezMvYOjjZv/yqSc94KoLrhBIH
         YHfoCH179UGV+WVgfBK28bG96neD53LGvxp6PC6sCuOf1uqbH40DxvaUosZ05eAEmZ9e
         M/3i1Qc5hgnxRWbntRjmEfopP/7GINCLHR5LREX8Sb5lEtzZyTVqOC4azBrFKUpw9hTS
         xHfRRFETwJqHV6OyA1ia6CUO3ggJSJ3dJLpJwT0pp9Csz2pZheXpkOEjP8jkyqXYBYqE
         Pl2A==
X-Forwarded-Encrypted: i=1; AKwUvByOdRl51Fat8LJ25GCsxzpqIdkfAs6wI0kfF2cHEYB9oh1R+SSDySqmtqLIYJQDyzsVZnjEVTcLOyd5/e0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIiMBd1b2sQGwfOnahFIVTRXgXcFSZmCAGshdaBA7IRH5M1MDaZ
	5Nl3FnA2qUNPrE9G9yALR1T5Lw3cx1fXKcYHrKmRaJeGkri8EVwXZuj5
X-Gm-Gg: AYBFou0nxKyfVHUghHBRC/MtqiONN8PAOAX92G6Yz50qRv/AxVoH8DvaUApQN5zStPk
	c60IYcXOJR8pzJzVymZ1fo1D1WHfhpUXESpjaKTCKUBLRhqBSTLcH+iOU2zIODBQRg6+vqZVbgu
	wzdHY0urqGtoJUJceXg1q0NS9ywWz54tZ5bRk0HZPKSJ8pKoipgtFvHBUe+J1WRbu8cE/Ratb0p
	gagujpejpV78dqrImBHRSiRzRzkU2MJmgML9RikCgkhRxVfAOrSf15CGZ76936SbjK8skGMbpb2
	PRPPUTJ6+gleR+Gq/o4QvsmEa7zeLqkR49LymMIOYAZUtwCSQCagjGnwZXlysdtyyR3iVzd50fE
	gj2WcpVZiFu9MJ/0dyfNsEAuSDOsNARLlxeX7gscUPbcUHtmboVb/K+2guA31xb/ZbR9PJY4uNS
	5GBHxbVpVkVYjB9LtvBsiGvWsRQv5YcfAQXrV6Y/7xfUQ+TrLidgqsonTRD/QrbSBJrYOk/VZ4Q
	YOxc0PXoYIGmXjt0auxF0KSkqVj4ifmwQm5Ltj79Vu0kbw3RmlpzZ8i9s99Varr9oRDP/J93fl2
	aDh30LrgcA7ye6ukRW/I4Ke57D86YuSoK86CZ831Q6A=
X-Received: by 2002:a05:600c:3f0a:b0:4a3:7344:13b4 with SMTP id 5b1f17b1804b1-4ac1709a2d0mr141157525e9.14.1793477715196;
        Sat, 31 Oct 2026 13:15:15 -0700 (PDT)
Received: from localhost.localdomain ([2a06:c701:4773:6f00:661d:f91:664:493c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf60f1114sm162706305e9.7.2026.10.31.13.15.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 13:15:14 -0700 (PDT)
From: Avi Weiss <thnkslprpt@gmail.com>
To: tglx@kernel.org
Cc: radu@rendec.net,
	maz@kernel.org,
	linux-kernel@vger.kernel.org,
	Avi Weiss <thnkslprpt@gmail.com>
Subject: [PATCH] irqdomain: Count mappings when pushing and popping domains
Date: Sat, 31 Oct 2026 22:15:11 +0200
Message-ID: <20261031201510.4188963-2-thnkslprpt@gmail.com>
X-Mailer: git-send-email 2.43.0
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

irq_domain_push_irq() installs a mapping in the pushed domain without
incrementing its mapcount, so debugfs reports no mapped interrupts for
a domain that has active mappings.

Increment mapcount after a successful push and decrement it when the
domain is popped, as done by the normal hierarchy mapping paths.

Fixes: 495c38d3001f ("irqdomain: Add irq_domain_{push,pop}_irq() functions")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
 kernel/irq/irqdomain.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
index 4fdcb6df5306..fd71ce24fca4 100644
--- a/kernel/irq/irqdomain.c
+++ b/kernel/irq/irqdomain.c
@@ -1816,6 +1816,7 @@ int irq_domain_push_irq(struct irq_domain *domain, int virq, void *arg)
 	}
 
 	irq_domain_fix_revmap(parent_irq_data);
+	domain->mapcount++;
 	irq_domain_set_mapping(domain, irq_data->hwirq, irq_data);
 error:
 	mutex_unlock(&domain->root->mutex);
@@ -1877,6 +1878,7 @@ int irq_domain_pop_irq(struct irq_domain *domain, int virq)
 
 	irq_data->parent_data = NULL;
 
+	domain->mapcount--;
 	irq_domain_clear_mapping(domain, irq_data->hwirq);
 	irq_domain_free_irqs_hierarchy(domain, virq, 1);
 

base-commit: 36aad21d50d1af3f6954bb0c988257a908202477
-- 
2.43.0

