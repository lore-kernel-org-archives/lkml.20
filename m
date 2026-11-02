Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793641528;
	b=PvxDJnnaPvC5/u1V522OyHgL2o+Hn7BWWZp9GfOtN2J//LH7Y9s32CA2YdgcHGIjFYuX
	 7SaD/mamfgrd+0yB/093wqWMSnNIyuZIQKEl7yCjRb5fceROFy55zNr5TpCvjoqhwwKlB
	 c2kLKtAwQyeSSb8r34Y6NEAY5NnqSPWfFF57jdPGvbFBuRuaaVTMIaYsmTKYrnx1HC8no
	 bmfUmqw4r3Fb6soJ9SWA20kAzHzaZsF1xqUjLlbF66oQY7GNPPC8WORtwuwt0wfM8IqHo
	 g0dBdfiERkz4v24vi7ioNeUxfORA68f6MbprVf2uGX0EJA2Chnxyk4kaAPanECAurGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793641528;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=PYwT8C8YBZBl9jtyu1J67hJllZibYxUPZTWxJc2Safw=;
	b=ggcFenpkLjesaIAvQGigMdSfhvUpN7jCWuxJow1eIMjmtbyvx/TZKSo1leZJh/HDzwB4
	 vNe8QlL714qjdBRdy2jGftA6ARjnw4S3s1IGKKxUIx0PCYFIBFoTqllGyPTeoI8uc7ZLV
	 DQIj/6ixKgiZGmUR8/F2yb1ke9I7w5c6Sv5qHXxXq4ImW4h/9cuyv/2DQGS1UfIYcYNw3
	 ox36Zhma70GWUbV00sDkog7XFcFMQzJSJC3Ev4s9YX4Ry3wMPeOdiaxX8gqPIf6nNOd+2
	 Ph854j/wMMRwa+HG+XMGKA6wuuVjlwcKgBYXeNfySLswpGTwxnq/s0zKPaLl23MvWBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DXzhGS6M;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E787B60A5BC4
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 17:45:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E787B60A5BC4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DXzhGS6M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793641527;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PYwT8C8YBZBl9jtyu1J67hJllZibYxUPZTWxJc2Safw=;
	b=DXzhGS6MlzUfEPNRh7iylntAbvAbneJRKlnHohDc8T0LDQoXVIJzdPcc37E528QezjVX1V
	DZx48vfVfWyGUKonUO1pL5grd78N1W1ak7/qOzH1dvPtf7NypKQDgG6KQNnDRjlYm0REe1
	oFx9Yw/eOGAonpJ0RxJBmrjytlSeXWk=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-633-pBdrkj1hOIKS-YLizBpQGg-1; Mon,
 02 Nov 2026 12:45:22 -0500
X-MC-Unique: pBdrkj1hOIKS-YLizBpQGg-1
X-Mimecast-MFC-AGG-ID: pBdrkj1hOIKS-YLizBpQGg_1793641522
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DA4D0195606D;
	Mon,  2 Nov 2026 17:45:21 +0000 (UTC)
Received: from virtlab1023.virt.eng.rdu2.dc.redhat.com (virtlab1023.virt.eng.rdu2.dc.redhat.com [10.18.48.26])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 68356433;
	Mon,  2 Nov 2026 17:45:21 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org
Cc: Nicolas Saenz Julienne <nsaenz@amazon.com>
Subject: [PATCH 29/45] KVM: x86/emulate: change return value of emulator_io_permitted to int
Date: Mon,  2 Nov 2026 12:44:56 -0500
Message-ID: <20261102174512.8903-13-pbonzini@redhat.com>
In-Reply-To: <20261102174130.8779-1-pbonzini@redhat.com>
References: <20261102174130.8779-1-pbonzini@redhat.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95

Allow emulator_io_permitted to distinguish memory attribute faults
from disallowed I/O ports.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 arch/x86/kvm/emulate.c | 50 +++++++++++++++++++++++++-----------------
 1 file changed, 30 insertions(+), 20 deletions(-)

diff --git a/arch/x86/kvm/emulate.c b/arch/x86/kvm/emulate.c
index 711794592c2c..8464816349b5 100644
--- a/arch/x86/kvm/emulate.c
+++ b/arch/x86/kvm/emulate.c
@@ -2526,8 +2526,8 @@ static bool emulator_bad_iopl(struct x86_emulate_ctxt *ctxt)
 #define VMWARE_PORT_VMPORT	(0x5658)
 #define VMWARE_PORT_VMRPC	(0x5659)
 
-static bool emulator_io_port_access_allowed(struct x86_emulate_ctxt *ctxt,
-					    u16 port, u16 len)
+static int emulator_io_port_access_allowed(struct x86_emulate_ctxt *ctxt,
+					   u16 port, u16 len)
 {
 	const struct x86_emulate_ops *ops = ctxt->ops;
 	struct desc_struct tr_seg;
@@ -2543,43 +2543,47 @@ static bool emulator_io_port_access_allowed(struct x86_emulate_ctxt *ctxt,
 	 */
 	if (enable_vmware_backdoor &&
 	    ((port == VMWARE_PORT_VMPORT) || (port == VMWARE_PORT_VMRPC)))
-		return true;
+		return 0;
 
 	ops->get_segment(ctxt, &tr, &tr_seg, &base3, VCPU_SREG_TR);
 	if (!tr_seg.p)
-		return false;
+		return -EACCES;
 	if (desc_limit_scaled(&tr_seg) < 103)
-		return false;
+		return -EACCES;
 	base = get_desc_base(&tr_seg);
 #ifdef CONFIG_X86_64
 	base |= ((u64)base3) << 32;
 #endif
 	r = ops->read_std(ctxt, base + 102, &io_bitmap_ptr, 2, NULL, true);
 	if (r != X86EMUL_CONTINUE)
-		return false;
+		return -EACCES;
 	if (io_bitmap_ptr + port/8 > desc_limit_scaled(&tr_seg))
-		return false;
+		return -EACCES;
 	r = ops->read_std(ctxt, base + io_bitmap_ptr + port/8, &perm, 2, NULL, true);
 	if (r != X86EMUL_CONTINUE)
-		return false;
+		return -EACCES;
 	if ((perm >> bit_idx) & mask)
-		return false;
-	return true;
+		return -EACCES;
+	return 0;
 }
 
-static bool emulator_io_permitted(struct x86_emulate_ctxt *ctxt,
-				  u16 port, u16 len)
+static int emulator_io_permitted(struct x86_emulate_ctxt *ctxt,
+				 u16 port, u16 len)
 {
-	if (ctxt->perm_ok)
-		return true;
+	int r;
 
-	if (emulator_bad_iopl(ctxt))
-		if (!emulator_io_port_access_allowed(ctxt, port, len))
-			return false;
+	if (ctxt->perm_ok)
+		return 0;
+
+	if (emulator_bad_iopl(ctxt)) {
+		r = emulator_io_port_access_allowed(ctxt, port, len);
+		if (r)
+			return r;
+	}
 
 	ctxt->perm_ok = true;
 
-	return true;
+	return 0;
 }
 
 static void string_registers_quirk(struct x86_emulate_ctxt *ctxt)
@@ -3931,8 +3935,11 @@ static int check_rdpmc(struct x86_emulate_ctxt *ctxt)
 
 static int check_perm_in(struct x86_emulate_ctxt *ctxt)
 {
+	int r;
+
 	ctxt->dst.bytes = min(ctxt->dst.bytes, 4u);
-	if (!emulator_io_permitted(ctxt, ctxt->src.val, ctxt->dst.bytes))
+	r = emulator_io_permitted(ctxt, ctxt->src.val, ctxt->dst.bytes);
+	if (r)
 		return emulate_gp(ctxt, 0);
 
 	return X86EMUL_CONTINUE;
@@ -3940,8 +3947,11 @@ static int check_perm_in(struct x86_emulate_ctxt *ctxt)
 
 static int check_perm_out(struct x86_emulate_ctxt *ctxt)
 {
+	int r;
+
 	ctxt->src.bytes = min(ctxt->src.bytes, 4u);
-	if (!emulator_io_permitted(ctxt, ctxt->dst.val, ctxt->src.bytes))
+	r = emulator_io_permitted(ctxt, ctxt->dst.val, ctxt->src.bytes);
+	if (r)
 		return emulate_gp(ctxt, 0);
 
 	return X86EMUL_CONTINUE;
-- 
2.52.0


