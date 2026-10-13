Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CFDD4825D4
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 22:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791931559; cv=none; b=I+NaPvXk70hNsdchdMxjLxyFLFcJiBJ6irqPmU+zb3ldz5oKroC4DHElwYyBKgEhLuAcbDam04Ew2VxOu+AxL8XVTsSku9DRsFQLKO2PW865ANMmJbX1++s8rg7RL9uCyqjMnF3qhjAIZOVmJzzU2H3JfCwCJgbJaezYHx6hSRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791931559; c=relaxed/simple;
	bh=7oUfc7/a0wQ7bLyNKzkXv/xXe7gJDQ6XuXtCaXQL7i4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=cL3P0pPPD8xq4STewuDvVCwzYyq6Jr3l49CWjX+Za4mbsnrr9Z0CJM1kWRfCV3TYZO83W8cdCMq3BBWaFDv6SHyXDMWcTfiIu0OSFudS4DFFRrAo5F0LdH3OR3wDNm2CVe2ZRqIpnuNTGRarMRFLMWzW3eje5XUa0dU/MkFcEyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--cmllamas.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AdUQq2n2; arc=none smtp.client-ip=74.125.82.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--cmllamas.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AdUQq2n2"
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-35c5aef2a74so1471376eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 15:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791931557; x=1792536357; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VaC5p7lBreXJFrDTlX//tAKrHbRA93HCXS6PgHHIrBY=;
        b=AdUQq2n2MgCnGOTR/w45BbSdlsFVJG3ic48vAbdefRPGWnaa138K+WbXZlNs8HYZGO
         n7KX7zQppUHwh9omch07hkoWnnkSkLfwCKy94nNh5VR0puxqLHGJ+/Zw6zKMq6qfx03l
         SFwqGApMoVCFHMa3hJX78STC4VajgaVHHGZ2EBPrB0WG7Rlk9B5b2RTw3oRxNUgdWvHp
         Dvuj3GqEyInQYVeuyIgYikntfhX6PZEfy60qrtWtHAhLKZdFzivwXPngKQL1p00zO+e7
         E1kNZCLcYctIHbofVPm2KzBZT5fFS8hNMtB0i2H8nDtROj3TJOsv9OjzpRwOkjhNT9Fy
         dgMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791931557; x=1792536357;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VaC5p7lBreXJFrDTlX//tAKrHbRA93HCXS6PgHHIrBY=;
        b=KId5FtRVeqk3Sghv9BHAWCyslHkxM5cwcE5gYOQK8LMY9Yad/kfwEUe+/b97zaDJnx
         4qRGkCE3euC4+s/WmJb5c+1chg8DeIAR0sDh1N2l2Y1KWZljfaosW7NYsYOnLudbpGE4
         sucz2blq0uYXZQV66Yvb3BJzdLbz6W16OwdBnI/trmgxHkQdfmPUU4KVeea9Oja0DjLq
         JL3bkCq9UQhArK7zNG3KPYafGPrXVVii+55rut9XUS+/csz8ZxhP8W4oslKtF+NfMBMI
         4JEibFL4zxiaFZOEoDfxnwnI6yFfrd9ZUYEao198i294T5c6r90XRxoQqZPZG2tgt+nx
         DtTQ==
X-Forwarded-Encrypted: i=1; AKwUvByh8rpYqb8no4B842l9LFsWaDjVPPwHlIwBD0ILnCQwMHUeMHT4nIcx52qZ8kUrpuatOGkP/+4jnvjNFUU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLVgS5dsNW+MfiuQP6zAoxj3a/+ROo4LV2il2yTnb44iYGEf08x
	eNpE1CvbntZedoM2cKPFxugyG5X9mWvmOo7glMWUZHzKEajOL/xNZXZbD3omTT7EakQdPkxust3
	hZj7228vqcDPNnQ==
X-Received: from dycph3.prod.google.com ([2002:a05:7300:dd43:b0:35a:5674:dda5])
 (user=cmllamas job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:693c:894c:10b0:351:78e9:944e with SMTP id 5a478bee46e88-3537e0945bamr21650637eec.41.1791931555233;
 Tue, 13 Oct 2026 15:45:55 -0700 (PDT)
Date: Tue, 13 Oct 2026 22:45:51 +0000
In-Reply-To: <8932791855928d9f12b7356648e2ebacfc126bee.camel@xry111.site>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <8932791855928d9f12b7356648e2ebacfc126bee.camel@xry111.site>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261013224552.557528-1-cmllamas@google.com>
Subject: [PATCH v3] certs: specify byte alignment
From: Carlos Llamas <cmllamas@google.com>
To: David Howells <dhowells@redhat.com>, David Woodhouse <dwmw2@infradead.org>
Cc: Sami Tolvanen <samitolvanen@google.com>, Nick Desaulniers <ndesaulniers@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, Xi Ruoyao <xry111@xry111.site>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Will Deacon <will@kernel.org>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, Giuliano Procida <gprocida@google.com>, 
	Carlos Llamas <cmllamas@google.com>, 
	"open list:CERTIFICATE HANDLING" <keyrings@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

From: Giuliano Procida <gprocida@google.com>

The alignments specified in system_certificates.S and
revocation_certificates.S are intended to be byte quantities.

However, the .align macro is architecture dependent and on arm64 it
behaves as .p2align. So use the .balign macro to avoid unnecessary
padding due to over-alignment.

Signed-off-by: Giuliano Procida <gprocida@google.com>
Acked-by: Will Deacon <will@kernel.org>
Tested-by: Carlos Llamas <cmllamas@google.com>
Signed-off-by: Carlos Llamas <cmllamas@google.com>
---
v3: tested, collected tags, rebased on top of mainline.

 certs/revocation_certificates.S | 4 ++--
 certs/system_certificates.S     | 8 ++++----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/certs/revocation_certificates.S b/certs/revocation_certificates.S
index f21aae8a8f0e..a53b49d49931 100644
--- a/certs/revocation_certificates.S
+++ b/certs/revocation_certificates.S
@@ -4,14 +4,14 @@
 
 	__INITRODATA
 
-	.align 8
+	.balign 8
 	.globl revocation_certificate_list
 revocation_certificate_list:
 __revocation_list_start:
 	.incbin "certs/x509_revocation_list"
 __revocation_list_end:
 
-	.align 8
+	.balign 8
 	.globl revocation_certificate_list_size
 revocation_certificate_list_size:
 #ifdef CONFIG_64BIT
diff --git a/certs/system_certificates.S b/certs/system_certificates.S
index 003e25d4a17e..ea6984b427c9 100644
--- a/certs/system_certificates.S
+++ b/certs/system_certificates.S
@@ -4,7 +4,7 @@
 
 	__INITRODATA
 
-	.align 8
+	.balign 8
 	.globl system_certificate_list
 system_certificate_list:
 __cert_list_start:
@@ -20,14 +20,14 @@ __cert_list_end:
 system_extra_cert:
 	.fill CONFIG_SYSTEM_EXTRA_CERTIFICATE_SIZE, 1, 0
 
-	.align 4
+	.balign 4
 	.globl system_extra_cert_used
 system_extra_cert_used:
 	.int 0
 
 #endif /* CONFIG_SYSTEM_EXTRA_CERTIFICATE */
 
-	.align 8
+	.balign 8
 	.globl system_certificate_list_size
 system_certificate_list_size:
 #ifdef CONFIG_64BIT
@@ -36,7 +36,7 @@ system_certificate_list_size:
 	.long __cert_list_end - __cert_list_start
 #endif
 
-	.align 8
+	.balign 8
 	.globl module_cert_size
 module_cert_size:
 #ifdef CONFIG_64BIT
-- 
2.56.0.385.gd3acb90ef8-goog

