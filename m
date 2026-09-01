Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 796AC59B56
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 11:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788261120; cv=none; b=J81bg4vpnRhNFXOUNGwxGxH4bI7UrMdTGzkOQQFj/691vWov2M2sB5SeBTaxsdk0hvOw8oaYeWzDvpGwMNjn41JVpN0FSCfgjlmmuJG/WhXjucOBb+9MiU1iaOSCmQ37cMkDiI50FAsKmXlLpdYdNcjDCT0nWko9yq8FFPG1VdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788261120; c=relaxed/simple;
	bh=I0WjaWZlyCjT73mvK6eAJL0c4Q/k/gh1DgLDlEdtyco=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=YF1Brran7gUgKzWxB9XFQsua5dOgSG31p3fMHjW85BZY1daExxUuxQpXv+ttbDAlMCFYYiiRFse8Fx1qaNZ+x+2AB9h6ty18tXl76u3wVI31OnOy1HGSawvbe4gTJKn3g+W69KMzQj1Eq54qeQoXFqbii9mnVIGQ2MPtEJ/pGaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EyfocO7f; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=O7msTL4W; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EyfocO7f";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="O7msTL4W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788261118;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gi8zlUNdWCzsqZSiJ6mOTo+NkAOh4pwQ7EWq01VYbQA=;
	b=EyfocO7fbRJPAAp/vHuLLmFFNcgy4bcr0FuHBYRb/viC0h1S+eYI9X8wHiWKUAgj/kLsf/
	xNMzfV3a0TdjtAKu2BdHpvru8Ek8aa20x+cvaMvnZIZnLkCMAk5zg4FoY9pZxOM25BI3tU
	s26fpZ3ZnFx/Jjp4UK610NIm+PFf+vs=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-639-3c6GtOc-NnWbYtewS6gXtA-1; Tue, 01 Sept 2026 07:11:56 -0400
X-MC-Unique: 3c6GtOc-NnWbYtewS6gXtA-1
X-Mimecast-MFC-AGG-ID: 3c6GtOc-NnWbYtewS6gXtA_1788261116
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-939281526e1so81218785a.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 04:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788261116; x=1788865916; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gi8zlUNdWCzsqZSiJ6mOTo+NkAOh4pwQ7EWq01VYbQA=;
        b=O7msTL4W1LOKUu2FWkb/oSUp+h3t1N4f+8+HPtAjXVprwQgHsYYTlbnkI4AkAse6J9
         V8WQNMrscM8IQ3T3an9DStP5MUuQhCXxPq0pE70HOy8ehW3Er3jadGj9tjcjo94ZJeiU
         QaYZtJ8BdPvHgAsdQXzxgsuytL4aticjbLG397DZV9D7mxMHWI1njnXnGnY3IgvGEQJW
         cXiUcG4SWMElj46kdHJG7nvQxpEvo76wjbuMNA6d4Ip0LzJUBsSIFF43gYBZDmVbVSOn
         Mb6x3+Vl4PfFalbPi8MVGrVlVc04cU9+Dw+fLMEdT7rc+U2dOsaQ1Rmqasl9Oil6L2Ct
         GfGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788261116; x=1788865916;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gi8zlUNdWCzsqZSiJ6mOTo+NkAOh4pwQ7EWq01VYbQA=;
        b=oQwWFCooIG2r9DeBCcAj46bxG3lmonRvQwigNMeypltahTIfrwTJFQ+o5/6A0eFNgA
         rVc3+odiFAb07qa03wBnUj1+oNmjcpTaH9Zx9F0Zr6o8zbv1qcempLaL/znvj6a8lwvs
         +gqSjL42IjQ6t+TC0mni7wdntXnspuIYu1qOz6UP3zy+Mp324StQd6lOgNc3BQsT2Z+h
         nrxjLAPl9lTegkT9z+BqfrAWM9TcmSOLfu3jzgAflqz1hURYOIrG0UvUYcGJYGoDkkG+
         oBX+kJYNHYuns0LGV2yZHcFk0xC7+n6N9P+zc4iQ2yjdr3RMrCgYjvzVt3DiNbvIGiyf
         Q6Bg==
X-Forwarded-Encrypted: i=1; AHgh+RoZbHVYKiZ4elyiLNSqcy+/UuDcmC1HHQPPR9YVziLycaWhHsckq3VUhkssE+mYPPMNxIRHh9X6l5skj9A=@vger.kernel.org
X-Gm-Message-State: AFuF++mghxtAc51fw/5JqQ1clqlk9RUoAOxPHrQSKgmUR2aBQT7ORIMN
	5fki0lfDcCXangjAP0q1ZPXsNZ7Vc51N/c5Gh6TgwXi77q5EuRSBzabwVuM4kgKvCKQ13ksTWiE
	zEgrBAAURbydfCMemmKDWOL4eFC2SqB5Ok8zKVkgm7eBASedbPvHYftBhItVYkib9Qg==
X-Gm-Gg: AR+sD13GOplc/Xx5EzsKMbRZyP2g7tS7Po5tfqmTCCSgyHSTfmaEQUfPbGgJonH9SyL
	fedtirun0rvTx0IMJ5RdwTc1GqI8wO+Ggq/eLbwGQgOgUAEeMP2D4CCWg2CdVShbKX4z30z2Gzd
	bWIJm/9jLmw5aJ+areW8ZNThmPBo1iW2wDYo0obyDUsdpIpws9YkFn+O9vl36GVRnL6K+hahiV3
	4MgT6lOQ6D/IhfZuc/qbYvw2N/dwGFsTZ5W5WLCKn7nMzgqnYhHZW4zvURSYMt/vsHAS97P0iyq
	uHBdjMeqT8ialbhgAXlU2sWoJhhlgSnbNZOSWPt0mdbWhJPm5s/YgTMYahFlqIlM63IXvWoCUbH
	Tt3aRqTu9WWqnZ6NSDcrpx9h02yto65Dev+E4QfKj
X-Received: by 2002:a05:620a:6187:b0:934:97c1:ca5c with SMTP id af79cd13be357-939137d09eamr4145044685a.16.1788261116368;
        Tue, 01 Sep 2026 04:11:56 -0700 (PDT)
X-Received: by 2002:a05:620a:6187:b0:934:97c1:ca5c with SMTP id af79cd13be357-939137d09eamr4145038485a.16.1788261115913;
        Tue, 01 Sep 2026 04:11:55 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939173a734dsm1005142785a.26.2026.09.01.04.11.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 04:11:55 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Jerome Brunet <jbrunet@baylibre.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260723-clk-provider-pinning-v2-1-8dad72eb79f0@baylibre.com>
References: <20260723-clk-provider-pinning-v2-1-8dad72eb79f0@baylibre.com>
Subject: Re: [PATCH v2] clk: fix self-consuming provider module pinning
Message-Id: <178826109921.1923810.15249958200247349694.b4-ty@b4>
Date: Tue, 01 Sep 2026 07:11:39 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=299; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=O3JvY97otagHytxcUyGsTeDj2UPUf0B409ucB+po9zg=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLKmbfrqJ77ytoHk8SkPfgZsr3zSll1TzPhn29aw5bzHH
 mglSyYWdpSyMIhxMciKKbIsyTUqiEhdZXvvjiYLzBxWJpAhDFycAjAR98cM/8znH9/ygXXevcvn
 P6jqxnNVri5atM8i+vHb4Mn/Ap68WrmM4Q9f+R7NJDWJGQXse6/8aI8wZpEyD1xj7hfj236L5Wu
 fOg8A
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087


On Thu, 23 Jul 2026 15:00:51 +0200, Jerome Brunet wrote:
> clk: fix self-consuming provider module pinning

Applied, thanks!

[1/1] clk: fix self-consuming provider module pinning
      commit: 5d334928586b7071bf7b3db19b04a2c0e8f4efe3

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

