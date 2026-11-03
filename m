Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.137.202.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793671376;
	b=TH3WdSjUZXNU46QajSMXmaVkEHWWIrlD5++dByq/hD+RVW9pOHJx31UFOxAqr7i27hMX
	 EZ9OlwT0wq2sr3D5+zojyfOk6JNgZCpItsOrv2BLDVdt66RfBcTf06TIXwxrk7pYljYkO
	 gi/omfsMKjwrl8O1jxTstiWELmKA0SxK2B8MtPNObgwrRYFkTsAGLrndXdJL1wad0fXU9
	 6jOgFHPuA9mujxerHwVTgvOWDpLuXlvpneIdfk8vnb2B5bScX+nHTLtTok1uaC9dL/b87
	 BkliH2ZoSefH5KtN8tAwLBXVztOfjQLZZpbpn0WRsdZYRiIQe7SaUrdki1IIa8ZuOEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793671376;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=I6clnDvf+pQ6GdcW33LHaGdN8K3c0qv2ixxAW0EE458=;
	b=Arq54oOQhEWi/NVFcmn5za+7ccrXI3X7Dc5wFOTYT6cT+KWyqwmFKCdW4wnQNW4asdUy
	 UJ4AQwL6mUst0YAnumGsla8Lea2WBgYtZeld1L7fCj0EI9x7V46Ikna9s4bHwRjuiPqQ3
	 W6GMgGew8Jou3LKyM8z/s5BRD9yhJaH6lzuEOwmnYlQSlyTROrWwHrj92uNWXMmmg2MAZ
	 N1mFsLjz+HNTUnHgkytUasMg2XQdn8ZQQOXP5zrrM1pcdM/pBPNiKUfFNlUcca8r8lFFk
	 tgXK0jm8HDi6PdHr/fPH26hmcnPirvJi3z811NxmvoYGYqJs0uu/4+scXYnt7kwSNgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DmTebpPN;
	arc=none smtp.remote-ip=198.137.202.133
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35367606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 02:02:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35367606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DmTebpPN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=I6clnDvf+pQ6GdcW33LHaGdN8K3c0qv2ixxAW0EE458=; b=DmTebpPN29pwHq0l5moSH8RpYs
	F+Cicwx0/dNZSMeXmsY0+Im7Lf8/KsKSo5qQmyE4cXFhSWBr9DKo+6pGuXm4OcJOCdZPgOKjqEAD8
	KaUcrCqz9MwrgzHSTr1GAu+sr4ewAOLCtD392WsCacZkoYAikaLnpCcsEDaj8CzOy4RQE3gjxpUnI
	92TMGi78kFOcTXVHNG2YnRSnhscSE9LY+4Vvz0A9Yq2KJOS0b8jR03gJ/Glbscy9cpS0130roqs//
	M4APMfdUrPztgQfCkLakCConKcNtNRqFtf4Wya5NMqtcgQ1rcYoMOTe2CRyqQSnlyPjSybxD1FoFq
	hHZ4ml3g==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO3rT-00000000pgD-1zIE;
	Tue, 03 Nov 2026 02:02:55 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Jason Baron <jbaron@akamai.com>,
	Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v2] dyndbg: use correct function parameter names in kernel-doc
Date: Mon,  2 Nov 2026 18:02:54 -0800
Message-ID: <20261103020254.2491892-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.56.0
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

Avoid kernel-doc warnings by using the corrrect function parameter
names. 'classes' is part of the VA_ARGS so it should be specified
with '@...'.

Warning: include/linux/dynamic_debug.h:102 function parameter '_maptype' not described in 'DECLARE_DYNDBG_CLASSMAP'
Warning: include/linux/dynamic_debug.h:102 Excess function parameter '_type' description in 'DECLARE_DYNDBG_CLASSMAP' (did you mean one of: '_maptype')
Warning: include/linux/dynamic_debug.h:102 Excess function parameter 'classes' description in 'DECLARE_DYNDBG_CLASSMAP'

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
v2: rebase & resend

Cc: Jason Baron <jbaron@akamai.com>
Cc: Jim Cromie <jim.cromie@gmail.com>

 include/linux/dynamic_debug.h |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- linux-next-20261102.orig/include/linux/dynamic_debug.h
+++ linux-next-20261102/include/linux/dynamic_debug.h
@@ -96,9 +96,9 @@ struct ddebug_class_map {
 /**
  * DECLARE_DYNDBG_CLASSMAP - declare classnames known by a module
  * @_var:   a struct ddebug_class_map, passed to module_param_cb
- * @_type:  enum class_map_type, chooses bits/verbose, numeric/symbolic
+ * @_maptype:  enum class_map_type, chooses bits/verbose, numeric/symbolic
  * @_base:  offset of 1st class-name. splits .class_id space
- * @classes: class-names used to control class'd prdbgs
+ * @...: class-names used to control class'd prdbgs
  */
 #define DECLARE_DYNDBG_CLASSMAP(_var, _maptype, _base, ...)		\
 	static const char *_var##_classnames[] = { __VA_ARGS__ };	\
