Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6461739524D
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 17:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790701877; cv=none; b=fKFT794/f16rF6itvHU6vp1ocjnGABCP7uAZU4GcJawAgi3pwz/QP0gHbmiCi6mlJBztnncYLE8AnuKyHYywZnSLLDxZU7qxZ/3iqWN/cu4C3sA/nogum79QfSRapXg9/Xa0yZekj5zpPPrDczSPZ0S9IZ5sPVZwAMXesqVxknY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790701877; c=relaxed/simple;
	bh=u4SRmlcilS5Q15H4klz5bfEhtq5Qf7+ZsgM6eMFI8rk=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=CHNThnBEbYHVpHORFxTRfhpNxlRPv++4VYlBy3kBHGHTkKf/biLW0F0TzsZLJoF4wyk+qJc4oOaaSGEY02U75+QVxDKpnTBQxcW1/nfGJOw43UTrRJP+pAMaoIY6uyJgnyhbWyScVbfA1M1HiwNUlgTr/sEV4T/eyzJsj+vnjLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PAtrwYXq; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=mQjybdEc; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PAtrwYXq";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="mQjybdEc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790701874;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=InpVDEJ0Zf6t0g63w3tMQgbC1FuEaClDXGKLkVndD9s=;
	b=PAtrwYXq4gDpS8ro/0GtgWbMprGmt/f3/InmLI8StLTiibmy9Gpkll0TO2mE2UG6Jgvwqv
	pbfnOQSpe7zHssAipOYzbtq6DRU/k0EKJ+QdV7NrTsPRsDMWeUqqQ1f/S2f2vtZfeaZpZl
	cvVXJXeXdBaYGlj+tu/esJEqLLX8Cjk=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-624-FY3-siN-PKaUbpfaTQOMvQ-1; Tue, 29 Sep 2026 13:11:13 -0400
X-MC-Unique: FY3-siN-PKaUbpfaTQOMvQ-1
X-Mimecast-MFC-AGG-ID: FY3-siN-PKaUbpfaTQOMvQ_1790701873
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93c444b438aso950875885a.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 10:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790701873; x=1791306673; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=InpVDEJ0Zf6t0g63w3tMQgbC1FuEaClDXGKLkVndD9s=;
        b=mQjybdEce9OTLNxdU5604vXTRItaUWlOeWhx5y6oStUheeMPWlTvED1JVDjMehw4no
         vOYVBxqlM0bkRCJ5IFHGiMfsJDDsguW0IMZtRxHo0juPmAfdR7iRfxqOC2eniv+Gv0C3
         I3qSN5Fc5VbUmBYE0oOxlsdQvDk/WJ7LypqsyXKbGFY0tG6PFSdUFb5Dim3e/CyC4Qrm
         FN53f3rhbNujgNoWTDCMShCTTyai+jyY74DdfOkdmj5v2OMEOOakjfrStsbXkAwnEJag
         U/6+rxSLP+BNRKywuhacQUinWS0M64h20PioSe6ub8L+XJbkxMt6fUza8KoPqki7Qbvp
         Ygmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790701873; x=1791306673;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=InpVDEJ0Zf6t0g63w3tMQgbC1FuEaClDXGKLkVndD9s=;
        b=udcEXsigQM65Uo7h0tTIm8+WQVQ3nRCq7pok7uymOqnXxI+kpIFX/ukwjUh/jn0tLV
         Tyo15iuOFO7RReuvMrp2keVSnolhtIDJ/hsDem7pySMV5+SB/UN6wjxuoLzEtIWqBXos
         yawjfouv1tDnQbKRcc/fx6WBjAuEFn+rlhU6qVMeFW8db5qCCUFHxqgYcTZpSTRYO+GY
         ReUzQeQMFBqKgZ1t+kEqAMFwP8F5q0v23ThbkUMeNOr7jRPXK2Vs4wQ7mU1UEsxnFR9u
         ALp6oFJeFuKS9di2fNDyvfiI+SbZ3kPR60IAMEgN0v+CiEpfK7+xAZhhuuiRr6XsQItM
         AdgA==
X-Forwarded-Encrypted: i=1; AKwUvBzfKouUptxc8LPZkD1o6xO4f8utSpfD3PcgMVA8w4rECWOUJaYfLBVOS7o61Pw7qitXvxt9g83BVnHiEKM=@vger.kernel.org
X-Gm-Message-State: AFuF++nbGsjXmYNsttLdYxzm1oIXhqIEs+gUwH6O4u6pBeD/SoL4XvCz
	pQmefk2JfBIJobRY3hM/obhGO0/c8c8QM55/zAiDRVTWA/yscOp3e58WkyfBel1+oaqRWJwDg7m
	JFqT4KuTkMALJdKKQkhTZhhEABoOvxLTXSDQxmlPMObvpQ0m3WZhux4Nm5XlM0JgHXg==
X-Gm-Gg: AYBFou0FOxwrzMQPG5qmu9NlF35cnharKPoz8kH0I2uUw//MOoeYO9kST7ZGVUWyhmr
	BVVstbJ3ws+XSy2hcoUetxsb9TShn7QaTcAOfsPUlQrtJ8GO8nCWmXOnYhQ0GYaChWCjKrELhQm
	KBNSwJqixlRlqoWBJ3IyYy+72OEr4kuicvc6sMTaetZ7YQMOb1VITx9nXYaS0qfhHrTIVTKdCy5
	z3rZECnL19taJplUEnk7Gt0dp95om3HQSJVUJJnqRVi+HNndeD3C/4KCbn5CnseY5f2qYLeWYsh
	2sLR1pRU6svORs77fPAISXRp5HGRir+AfEWN9u5yABxPkfWTlJXc5iXQVJ4SG6RXeIzhRNCz3sc
	iPGf/im/2rt8LOhing1orgRkhRUL44RJKhLSyUBI6QeZ3S0CM7YQ=
X-Received: by 2002:a05:620a:6193:b0:93b:e82b:a584 with SMTP id af79cd13be357-93c9f8a415cmr39165985a.35.1790701872656;
        Tue, 29 Sep 2026 10:11:12 -0700 (PDT)
X-Received: by 2002:a05:620a:6193:b0:93b:e82b:a584 with SMTP id af79cd13be357-93c9f8a415cmr39159185a.35.1790701872042;
        Tue, 29 Sep 2026 10:11:12 -0700 (PDT)
Received: from bmasney-x1.rmtuswv.csb (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c9f561a6bsm15271185a.41.2026.09.29.10.11.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 10:11:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] clk: starfive: jh7110-isp: fix pm_runtime error
 handling
From: Brian Masney <bmasney@redhat.com>
To: phucduc.bui@gmail.com
Cc: Emil Renner Berthing <kernel@esmil.dk>, 
 Hal Feng <hal.feng@starfivetech.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Palmer Dabbelt <palmer@rivosinc.com>, 
 Xingyu Wu <xingyu.wu@starfivetech.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260918050051.14986-1-phucduc.bui@gmail.com>
References: <20260918050051.14986-1-phucduc.bui@gmail.com>
Date: Tue, 29 Sep 2026 13:11:06 -0400
Message-Id: <179070186697.213266.8534133348671524620.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=826; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=u4SRmlcilS5Q15H4klz5bfEhtq5Qf7+ZsgM6eMFI8rk=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLJ2f9T9ybLnwdndSb1pu1gZI59kzbe8Er1/ait38eFbS
 Tl+abZfOkpZGMS4GGTFFFmW5BoVRKSusr13R5MFZg4rE8gQBi5OAZjIdGOG/+U7rZwSzyme5/9a
 /oB7/ynHr3qJL458jWntOvne5tl5QW2G/7XRFz7sZyqcUNAWan6ya37HyRe73tVPEhWckdkbuE5
 PnAEA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Hi bui,

On 2026-09-18 12:00 +0700, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> pm_runtime_get_sync() leaves the runtime PM usage counter incremented even
> when it fails, but the error path in jh7110_ispcrg_probe() does not call
> pm_runtime_put_noidle() to balance it, leaking a reference each time
> resume fails.
> 
> Use pm_runtime_resume_and_get() instead, which automatically drops the
> usage counter on failure, fixing the leak.
> 
> Also disable runtime PM before returning from the error path to balance
> the pm_runtime_enable() call.
> 
> Fixes: 81279f5d0812 ("clk: starfive: Add StarFive JH7110 Image-Signal-Process clock driver")
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

There's a separate fix for this that I applied earlier today.

Brian

