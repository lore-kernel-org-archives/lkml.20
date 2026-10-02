Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D060446851
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 07:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790927132; cv=none; b=ez+2hlxINz586Y587UsZPFPZiE6sCYTWQSZQ0eoaMspVq5PFGQ3xwta1HWG5ZUWQBT3Y5PTifLfoPaRBBOFijAQJtb+PVe9N6cCXoTzFSivG3UHDOBu7mZ9/zI8dDX02z5Nad/saiTKm9v70OOXLezpw2nr3n7kKIfbeRWTERtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790927132; c=relaxed/simple;
	bh=Fzw15Y5x165bcCyVvinBDXk6QphC4TaM6CESldYijLk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lgcAbVaQxj9UsFPIODEAuP+qlk5wEsuvWzLLZ7LRv/FRxFVV9ldtwJcmofvZ+JCHNa9ea6ckbbv7mXc4JHTPNR9POnyRM8HxCUrhvVGZB9tIkil1dmbxzuAkv0Q0eXL4i81hFCG0MD1qik8Eeg6Piey5oOMN23F++OdHKv6V6l4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=jSgo+/hL; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jSgo+/hL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790927130;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=O6plnk9qPrOk3PT1Kjt1wXSpGCArN3HQPizUlcU099U=;
	b=jSgo+/hLq0J2A6TpEm+NuuIbBZF3mOCTzoOu15VIhn9MyHf8cunD6qVTbQo/L4irBnpUjq
	GRaQrD0FVqAm9zdxQKs+F5z0SxaF6IOodUFSi4prpVHZnxoMyQ8aKhbaXMGL3dJFwroa75
	kVaQZol3cgUDOGSzm4YBKNZqP+lIn2g=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-589--_ZQpDH6OX-fEZ0qGmRkRA-1; Fri,
 02 Oct 2026 03:45:26 -0400
X-MC-Unique: -_ZQpDH6OX-fEZ0qGmRkRA-1
X-Mimecast-MFC-AGG-ID: -_ZQpDH6OX-fEZ0qGmRkRA_1790927125
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0E0201955F39;
	Fri,  2 Oct 2026 07:45:25 +0000 (UTC)
Received: from p16v.redhat.corp (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 5375C1800345;
	Fri,  2 Oct 2026 07:45:22 +0000 (UTC)
From: Ivan Vecera <ivecera@redhat.com>
To: netdev@vger.kernel.org
Cc: Min Li <min.li@microchip.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
	Jiri Pirko <jiri@resnulli.us>,
	Jakub Kicinski <kuba@kernel.org>,
	Prathosh Satish <Prathosh.Satish@microchip.com>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v2 0/2] dpll: zl3073x: fix output pin esync and sibling notifications
Date: Fri,  2 Oct 2026 09:45:18 +0200
Message-ID: <20261002074520.30048-1-ivecera@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

This series fixes two issues in the zl3073x output pin handling.

Patch 1 makes the embedded sync (eSync) configuration follow the output
carrier frequency. Changing an output pin's frequency did not update its
eSync period/width, so eSync ran at the wrong rate and, for a 1 Hz
carrier, could get stuck on because esync_get() hides it. This was hit
during development and confirmed on an oscilloscope.

Patch 2 notifies the sibling pin of an output pair when a shared HW
setting (divisor, clock type, eSync period/width, phase compensation) is
changed through one pin, so userspace is told the change happened.

Changes since v1:
- Patch 1: pass the actual output carrier (synth_freq / out.div) to
  zl3073x_out_esync_enable() in the frequency change path, matching
  esync_set(), instead of the raw requested frequency (no functional
  change, output frequencies always divide the synth frequency); drop
  the redundant "? true : false" in zl3073x_out_esync_is_enabled()
  reported by coccinelle (boolconv); fix a comment typo.
- No other functional changes; both commit messages now describe how the
  issues were found and whether they were triggered, as requested on the
  v1 thread.

v1: https://lore.kernel.org/netdev/20261001080648.1424172-1-ivecera@redhat.com/

Ivan Vecera (2):
  dpll: zl3073x: make embedded sync follow the output carrier frequency
  dpll: zl3073x: notify sibling pin when shared output config changes

 drivers/dpll/zl3073x/dpll.c | 196 ++++++++++++++++++++++++++----------
 drivers/dpll/zl3073x/out.h  |  34 +++++++
 2 files changed, 176 insertions(+), 54 deletions(-)

-- 
2.55.0

