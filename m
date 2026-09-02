Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 912243E7BAD
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 22:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788388844; cv=none; b=YjRgz0erUJbaalPRZdu9Acb3/bseLzAXNppCJ2qjSSiMxhml6vUFFbHsQG1/77y9wQ57BEnTeyZcJvyb/kR9PTic7BBz2WpSG0P5jcTMNVxz4SVp6+mR5MZeX2tojf+mKgmPjQ19QpsE1k/j22W4MYFPW6hfm4puU5ieIaKxBHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788388844; c=relaxed/simple;
	bh=nB9MtG/jZH/uKfPVqmTLfUSN14X89SFk7Mqq+TvM9Gs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=RRcz/IouetHss1CO8iMeAad/AhvgwU47c0+8kT5DqcUenbTDyeWBC1F4AiYhpYwShq/3ewke/ZVzweZ01yT0eLxgXlo9hjZiDc8BNQDo8GwCvfpmmDinwzHtf6ETpv4BVH3Qc5w8HLSDRW7aRNG/nWBCwXxt7h6pcOy/qtdovOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dih0RLJ1; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=jA8k7jCI; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dih0RLJ1";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="jA8k7jCI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788388833;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wNcn++DDYySJZokz8/3409CMhSq8WdyhJVAopZOy+GM=;
	b=dih0RLJ1KB0O87kJuuyG+ge31C5JzDR6Ux0hZnlUe6PzK2aQiebDrLXe0pSaOg1xeVtxFW
	e4XYEGqpGM4vKBblyBczo369LkcJF9xyD6jh+gWzq/t/LHcGWRNKudf2HTOxnERt57qfn7
	+eItnp4S76Jp0UkSvq5du1waJ23KOxM=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-628-SIUH6j7HPziEMeY4kNg_gA-1; Wed, 02 Sep 2026 18:40:32 -0400
X-MC-Unique: SIUH6j7HPziEMeY4kNg_gA-1
X-Mimecast-MFC-AGG-ID: SIUH6j7HPziEMeY4kNg_gA_1788388832
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-938153538caso334015985a.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 15:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788388832; x=1788993632; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wNcn++DDYySJZokz8/3409CMhSq8WdyhJVAopZOy+GM=;
        b=jA8k7jCIqblZVvwWTgOER5ByvxjceImXPYmnCzO9IQ2siUd4cikAdb+ytX16HEqP7u
         7pMTHAwSr1KyWWuTdTlXL6Aj0rP3giXWymYFjsGPorPFI2jIDB1SppjTe/zCbEqsUd1T
         Yt3llcqFhZ2js1j5JMwvs90oRfBQlSLh74IdkBFp9V+EC6m+laGRFDzndtMNLstAmQiX
         VjsZZNWSjxt4uI/fjwrbzN+TNIgarv1bkzCwuNS9ShzUz0XUTgBCJyNCCOpUNm/cLo1F
         pc18nRtC/5xmCnVLmHaDLAxMi3Re8oGf5nP9N4mjZ1UB3yp0dUahzNtd033vd0c0wOJ7
         4rsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788388832; x=1788993632;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wNcn++DDYySJZokz8/3409CMhSq8WdyhJVAopZOy+GM=;
        b=chGHFG6WB1lOVn5cC3P3YFDIIdrp55o00dcITGualWt/0Ge61eCLPFCOPZsReC6KkV
         yQnR164kHeYcyZolaJIgpK9JU8lZqkKD4TA2st+nL6UxhSVg+VjTyXL4nLhQewc71Za2
         hJjhYcO4n6yLJqQJSWLLtukPBdYnycMLR5IX4z7YkBog1Vj3hO5+aj622f+sR1nquSSL
         HXfjNmBFzwFDtV+4ah0RiJoal/NBsqKw4+PWsr9xyArqQ/JMtq4sQ7tnRp1GNoguyl3h
         BU4ZlrDzXmtvGbO8b0v/lofHYLfIXq3ychpJSWGpAnDF5b1H1yl2Jx8NdcePS4COmsqQ
         ISTg==
X-Forwarded-Encrypted: i=1; AKwUvBwqZIwJqbLEWMdXApg7P+o10CtQZp7AWItUiRrXhCBOhjK9ELCC20Wd9jRBDWuBJSUkPnW2XHY7TbK2fn8=@vger.kernel.org
X-Gm-Message-State: AFuF++lQgwCvSJP1o9/trpIwiYS5KnWMjt9JjMKYXfnU+yANCECQX95X
	5h4vMouq6hTT9X/tMpCpC8/HpoLzHjd9w+02/sftTxDrmhLDNUlV8Iqz1pPaM+GH1IocYZn/c3d
	D5yyawx/j0MbeFz0M8jRL7fKO6h3CbHOAI+FgaHRRAlBUfV2MjZdzT5+3D3vYzk7B5Q==
X-Gm-Gg: AYBFou3grvOAgb76p1SSyjzrrck+x/sRXlqHibmoTmwTy35WjCX84Qc/PCXOGhtwkgm
	yHV2vFo0j97acrafPHWqsR1TJLzw5AfC/5pp42EECQL03b41ktWKXAPfqfD10EQzrwz2Vkwgd2u
	ltUB8NQT1SzQbJ09g5BGJj4veApWXQ+oBSvUC4myW3nvFbor8ngPCJyhqRTkQSP58g5CQfL9OXO
	mxLbSsVTzvw0iCGOV7NmsAnuRBq0yd9mNat7PaM3JmdlFhmd5PV1EIHkV4MpzdGmHCckWESD+Df
	CYNybgkZ774Q+x4NQVk1A5+4aQr96Q3IddpVAsC50v22+pv1TjgfPidMky2E10l6Sjk7iFHAhp1
	SZw==
X-Received: by 2002:a05:620a:5ee1:b0:939:6de9:4cff with SMTP id af79cd13be357-9396de96ebbmr234854385a.45.1788388829989;
        Wed, 02 Sep 2026 15:40:29 -0700 (PDT)
X-Received: by 2002:a05:620a:5ee1:b0:939:6de9:4cff with SMTP id af79cd13be357-9396de96ebbmr234852385a.45.1788388829633;
        Wed, 02 Sep 2026 15:40:29 -0700 (PDT)
Received: from [10.239.101.46] ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9395f157ec6sm325731685a.7.2026.09.02.15.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 15:40:29 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: mturquette@baylibre.com, Triet Hoang <triet.hoang.dev@gmail.com>
Cc: sboyd@kernel.org, luca.ceresoli@bootlin.com, krzk@kernel.org, 
 s.nawrocki@samsung.com, cw00.choi@samsung.com, peter.griffin@linaro.org, 
 alim.akhtar@samsung.com, michal.simek@amd.com, shubhrajyoti.datta@amd.com, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260820065904.2032536-1-triet.hoang.dev@gmail.com>
References: <20260820065904.2032536-1-triet.hoang.dev@gmail.com>
Subject: Re: [PATCH] drivers/clk: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
Message-Id: <178838882032.2062832.5940694093369397743.b4-ty@b4>
Date: Wed, 02 Sep 2026 18:40:20 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=303; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=zL0boMPnZXSvjvuLkbS1bHkmEeflCn7eOnBIJo/+CW4=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLJmLL0VV+h7R0zPm9dX9HPSGX61EsfIdw9vtRTN/i5/t
 j/WaLZpRykLgxgXg6yYIsuSXKOCiNRVtvfuaLLAzGFlAhnCwMUpABMJW8fIsH36qdUPmP4Wzj0q
 rGyUEmQd/uuT83qbiGs/py98ZH52/wlGhteCFQ9jr3uHZX69fKc99RrbBgm9fRUeH5YsUXdtrLG
 6xA4A
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087


On Thu, 20 Aug 2026 13:59:04 +0700, Triet Hoang wrote:
> drivers/clk: Convert to DEFINE_SIMPLE_DEV_PM_OPS()

Applied, thanks!

[1/1] drivers/clk: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
      commit: 48bec6fd8ec32ffdf65a5ccf268428a9f79ea210

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

