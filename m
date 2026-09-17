Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D45F59D611
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 14:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789655998; cv=none; b=uJi396435rWiqWkvsVxQOagixCLsZI5c8VTlajHofNSE+31KVjPxNZikDqTdQv+jTqdc1t20kJD91pD5kH72yQ2D/Q0wzmT2cR/0vWjJlbSvWunpqnWLnU/5d49p7nWyOL6YskSoFcNt9tScG1DbreJ9xBvU4T9c2THBgPjegM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789655998; c=relaxed/simple;
	bh=e1nEcm+47VRM3YuQ3OIfZ1Eloo/rMsg4M8gV3g0+0Jk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=MLOOuDwILLRp8+RmTPGEEMq1yddy3hfW6mOD5mrl9iAp89v2r7bTe4Sc0Hxi/nHtb/ysWL42K9WZ/sJKky7PCGfWo7R/PGfa0NZqF72SNOpz9wOmEXYAQYldFJlT+hSB//uwdsPUtj1Ok0FpxmOKT0SOZFfV3KxHq2+L+GVO/sY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IvpL4hVB; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=L7EpXpel; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IvpL4hVB";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="L7EpXpel"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789655980;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8KGR+CeC95ZWBixGwVA0LL51D5yK2uYqoswbmkSb/ZA=;
	b=IvpL4hVBvCynmqlsMqWFCw0Gz0lAbOGa29xeSfAPKw/B9DsipVi6D/RHJpdmJS2EjBh/NL
	WesU972Y7pnQI/j6fsQ4qS114Xst2tjSvHVJUr0gmhH02O1uEL/l7dgDNdnKSkcKANDCaP
	GOwCBCh3rm3Rj5CFQZtioGbI2ODeG0Q=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-321-dWavy1UCMJq9MbGxZdgDLg-1; Thu, 17 Sep 2026 10:39:39 -0400
X-MC-Unique: dWavy1UCMJq9MbGxZdgDLg-1
X-Mimecast-MFC-AGG-ID: dWavy1UCMJq9MbGxZdgDLg_1789655978
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-53124d6a362so30639751cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 07:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789655978; x=1790260778; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8KGR+CeC95ZWBixGwVA0LL51D5yK2uYqoswbmkSb/ZA=;
        b=L7EpXpelvoFaFcpieOxOPxuFCsY2xb+zIBxMoT5r5JRIfrFMnOBf/PY9tKrET9yeGa
         efF6y45/UMC771RGAXoGt6lYE5P0hQGk5AYnoU0kMHlJHeRbK+Qj7VHGxAjlDFONjUdE
         klwGmMRWUCkyTh9sNaSWKpRemBawXaDxaHIm+WcNYtPQwwHP3F9NCNd9Zz0629lBy0bJ
         XQH07BsyLsL7XnfwRuSF/N+RK6N1uiQj5fW1cWahMZGom9dIKIvcG+j3CP5Cz8tjb93g
         D9A8wUVRgbxFATDi1pHRUsSFyWhB3BHW0sXouAdVHikgQhvaXesQweu2ml1AjiP76HOQ
         NFPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789655978; x=1790260778;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8KGR+CeC95ZWBixGwVA0LL51D5yK2uYqoswbmkSb/ZA=;
        b=EDgDj8L4sUfF3+TPER5uQ8uT++TezBgY1Xc5qqoPgSc2SK6HcBahgZFr1cJUCEeU2R
         jgKnoYEZEFSn9e+kmmGLOpArpuULcruCa6f0RBHL/Q/9PRiqbXpcDI5O2I5qkktL2/HM
         JjSVyD/Rjzi1/TPWxM4D2X9YWfifvr1NtrG882IqsKNDfgq0EEEY6ElnrjviE+Oe5/OO
         nIytBHeTeMFe2QoQHYQFg3oOKCXN6xmb08k0t3y56QpYk4KlNJLh7kfb/ldwcUw9xJGa
         84+mOSYAr9O4jivoqVqKB6kv5hs10rpWDnQI6AeKRiXigXLZq5NyDllPc6Vk4Zh4e5TJ
         tw7A==
X-Forwarded-Encrypted: i=1; AKwUvByWXN7Rn0GQ3imgBbRjKoqAvfVFrv5QeAvjuesysCi5ZBhYZheJXFGBh9FIViexB+daAqr0xn47PU8d1GQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lABeyg6RaYZOlFU92rXkU2RuNHig8Zl7wF66fB5ssrg4rdu9nJ
	OOYP7zP9z3ZvdfJtaQOicAW//UmCbA5kNzH+AYNnSSysKAvRRXZhrOCWL+UrFiRyYUZhR+Hoc8t
	CpaPNCpZkWZ48VjTbz1IMtrpaeFPBrBlBVMixy1RHfknJRmHejIZFDcM9cVLar/aDCQ==
X-Gm-Gg: AYBFou3zzQKPaAtqRFdMLj3ku+1A+ZpzL4CWYYysl+kjOJNeMzPjVRYta1LN6DV/kG4
	wPs3ZHqclsuZpU6xM+cXQyaAiZO8gfUn7ol1Fav/FBgfiXmTJaQA6t0mE2HS5Lh7T9yTPKqzQIY
	a5Iq7S5bEZlrzclWSEBYDjBoFOqhiFhTXoSfwjK6z2v6BqHgv0+qqCUyrvtN2Fxi+Buu5IJ8ORe
	xSewagPEwIu8rKJ6WouQBAa/43LARtR4fYMxeBW4J+z9NxQHKkBGoOyDVdIwee5YAsXJVtK0R4E
	1cBPmnqhpUC4Pynv5X3M/iGx3FeWFGGXSRUO4WQHZQeBTD/8m1UmpDK7TU+/jSIPqXnUpOA5VHo
	3uRBJB5OkA2/U3UA9D9rDte3BZmdqrptkqxbF2H8=
X-Received: by 2002:ac8:59c8:0:b0:530:42e4:f000 with SMTP id d75a77b69052e-5327f1e4523mr119766891cf.45.1789655978528;
        Thu, 17 Sep 2026 07:39:38 -0700 (PDT)
X-Received: by 2002:ac8:59c8:0:b0:530:42e4:f000 with SMTP id d75a77b69052e-5327f1e4523mr119766521cf.45.1789655977993;
        Thu, 17 Sep 2026 07:39:37 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5326204cc73sm49839641cf.19.2026.09.17.07.39.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 07:39:37 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, linux-mips@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260916-clk-eyeq-res-v3-0-93a3b831a5d0@bootlin.com>
References: <20260916-clk-eyeq-res-v3-0-93a3b831a5d0@bootlin.com>
Subject: Re: [PATCH v3 0/2] clk: eyeq: Reserve OLB memory regions
Message-Id: <178965594692.360090.15483787518804021390.b4-ty@b4>
Date: Thu, 17 Sep 2026 10:39:06 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=803; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=zv5XFnjC/JAkcy5rF9GDLkUufKHGuN1RVfY0nq2leS8=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLJW/14UH6wc3bVp49s2u/TMCfGTAqenbfuz+D3zkltPn
 kxvT+4+1lHKwiDGxSArpsiyJNeoICJ1le29O5osMHNYmUCGMHBxCsBEJnIx/K9YfvnHstef539N
 1L9QuiNcq73JWUHBPGOxzjfnsLKsl48Z/rtty7LL3VTpW1acLDj7cvTty5YWW+/f/WjHOfOSusn
 +FjYA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087


On Wed, 16 Sep 2026 14:08:53 +0200, Benoît Monin wrote:
> clk: eyeq: Reserve OLB memory regions
> 
> The Other Logic Blocks of Mobileye SoCs are clock providers, and some of
> them are registered early with CLK_OF_DECLARE_DRIVER(). Their early init
> maps the registers with of_iomap(), which does not request the memory
> region. On the platform device side, eqc_probe() used a plain ioremap()
> too, so none of the OLB regions were reserved in the iomem_resource
> tree.
> 
> [...]

Applied, thanks!

[1/2] clk: eyeq: Use devm_platform_ioremap_resource()
      commit: b8bd186778e74492a2bbeaed7e00d87dbe46b6f2
[2/2] clk: eyeq: Add mobileye,eyeq6h-central-olb compatible
      commit: 07bdb358bc50f17442b6b685d18a6f141b6f276b

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

