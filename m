Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 493D44AD4C0;
	Fri, 11 Sep 2026 18:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789152145; cv=none; b=u9mR0XRhrZ43Ag5vddnx2R0s+lorHpfLDRr2oNrKACfl6s4AS1Ge16NBl9TZoM9bHFwQi6rZD2QKIRPzcB5ISBMqleavuliL1fdvWI2CDKJ/OXiMmnHBFKID6w72GkBvs3e7+0O3PfeG1rWpmxINdP5yXqrmL1FP74RozC1QsCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789152145; c=relaxed/simple;
	bh=ihMGyu4AKoqzx1q+d8q8sRKA2C3Bt1JO/lZiwOwSlxs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NdhpGnaG8GMl0cmo7qDDRRtyrXKPrZseZx7KEZA1zesWxqL3boUf4qjGzAN78GwIXNQc5AdrKtiKMIWDvomzkLJA5ZErc9robEoogSStx382ozSoWUafpBRT5DczQhSEtEfDltmhrPg8ooOdFqbkRZ20z47QVla7HL2xAkBRkVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=E8DtdF6s; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="E8DtdF6s"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=YcpAc6qqPwuEax92VboOZd9C/1of2wC3v5yJo0jnMgk=; b=E8DtdF6sz6Czq70dT3y8USEYAe
	HnoHcnAggpFVhAiGh5vS+eMU6qRoFJ1r99kkXa99gVVObj5AQGSsT26du49WKcrWw3xaQ/ONfK8Lq
	Re/dZTOCkY9WPKYJHAQcNBHUmTsKY4/+0ehW+BA8BaevKNWO4V2KNBML59WW3Ndvxc5KRIwf96Ywb
	7NeAXzgtX1RIB2gtu+BfFyxPppql9BbtLH1dmhZFADJb4l0rvxtt3TAn9ee6ZTXfnN10AjN5Jj733
	udiuwC1BfmvdAQ/yq5K7EdydIWwldUzzYzRrFJ0VpYZxRoYt2bHsxbSxAwyEYvIEI3wonk7wEhX5E
	fOYd2cUA==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x56CV-0000000HSiG-44wj;
	Fri, 11 Sep 2026 18:42:16 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-doc@vger.kernel.org
Subject: [PATCH] docs: kernel-doc: inform that '@' applies to other fields
Date: Fri, 11 Sep 2026 11:42:13 -0700
Message-ID: <20260911184213.4143776-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The '@' sign applies to struct members, union members, and enum
values as well as function parameters. Document that.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-doc@vger.kernel.org

 Documentation/doc-guide/kernel-doc.rst |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

--- linux-next-20260911.orig/Documentation/doc-guide/kernel-doc.rst
+++ linux-next-20260911/Documentation/doc-guide/kernel-doc.rst
@@ -422,7 +422,8 @@ Domain`_ references.
   Function reference.
 
 ``@parameter``
-  Name of a function parameter. (No cross-referencing, just formatting.)
+  Name of a function parameter, struct member, union member, or
+  enum value. (No cross-referencing, just formatting.)
 
 ``%CONST``
   Name of a constant. (No cross-referencing, just formatting.)
