Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 126E13E7BD5
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 19:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790277956; cv=none; b=cnMR9CmB6R3yi2iNDG6UsUnDm+PjoxyCA5Gh8a+Rx9Osb2/q59u/yJkNKMuJAtAJA/80AO2an5BlaIMgiIl3rIYQA3PgCHADp9mXx6+XKfRpQ/HKLaFwmZHIwqJ9H8FYKmk182NVvbtf9cRnHgvV4EQVAa9GPEIINIzURMWYEg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790277956; c=relaxed/simple;
	bh=yl7byw9V/8EXNs2araC6QFRi1x86VMjG7XO2NiJSzk4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=R7IYSpSnWqqhPfawCL1FsZb0+hmvxssSlBR9ZpuPLSqIymZQ3jN8iN+BdySf/6BFjDZ1F6kkgxS/Mm8eAXOhc+pxwfxQy3pjZT4Bclay0k4gA5fdSXr16mFMqQ4AYwoenl3tvghkrINSK78VRVQziwOj5fRjhvPyuqQJL0mXqP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JeIJ+BMZ; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=TGKsAV9f; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JeIJ+BMZ";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="TGKsAV9f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790277940;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nvu4jmSjpEKtUCT3yeOXCWZTbIcGf9M3fr7tv012qzc=;
	b=JeIJ+BMZE7GECXiRita4G1m1Gz9PJvhEVzUj0vAS8BPtOzLXzuLcLcTUM53gpUzPMQntbl
	DK7EsB5VdwxaaWPwFdJf+oIx0IA3qZ+eUEXn2Edi8nFn4ufJSEJkv+s7sgqLBEAoKkTFfl
	mwNnaaysMNv0FOQSaF46wEXtmBhGQ/I=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-152-MGUunzy9PMugAzOd1iWIIA-1; Thu, 24 Sep 2026 15:25:39 -0400
X-MC-Unique: MGUunzy9PMugAzOd1iWIIA-1
X-Mimecast-MFC-AGG-ID: MGUunzy9PMugAzOd1iWIIA_1790277938
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-86617faa2b2so2209527b3.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790277938; x=1790882738; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nvu4jmSjpEKtUCT3yeOXCWZTbIcGf9M3fr7tv012qzc=;
        b=TGKsAV9fi+DLWxN09as3YJADsveqqIn8KJhoPq2noPQsugKWnTvjX/M66N4Zea9eQ5
         xXGv8uGRvAg9fofn534kdy18SAECxVpqer2El30lR6n06mUZChUDvrJuj6M4YqbKZVJT
         ehzjGSmAoV32N7kHP+6mzhZNYC0Wfx4rkaJLd2hiBLqd0IH4ttaUzXI64tifLL5JxuP0
         AS1lxVjxsLryNM+VgYsBuRclP8vqVSaJLhhLfdcGxk2CF6rmla1+j5cB8kS9boTAFpr+
         Z2EFLV9mnFYHgo450rKgr6Tqw2P4unYg462rbz+PzMItMQItypb1NMPDDEroXQJC/Kuu
         6O6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790277938; x=1790882738;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nvu4jmSjpEKtUCT3yeOXCWZTbIcGf9M3fr7tv012qzc=;
        b=OvMMnLm4C4PQWVob2eKTHfsUm22EvvD7rPLjP1aK3ZZsLUv6JBLaGtE9acHZ+1STfy
         olD4+yfaXTSTGrBxj56JVSGTKNpMmlpHKfwZMvjz04ve+rJYA0joNI0vrAmubFmREgeB
         4Y6DskqMTMBNt9jqooItBHlw9A/MtM7NYd94TKUKUJyMEzK2i3kJeFvMYO5XrHrp72rP
         Ylkm3/IKWyrnAEnZgpOHYn4hG1srOD+UvMkJHSNQ16DuffJBtEQHRBXpEOJnYSyRUr7V
         lJKX0M94kilT9viRKon74ibuREYb6jXFLRhEoAvJAnsC1eyDfDU+Yc3ERn2nxdHLUt5A
         eQ0Q==
X-Forwarded-Encrypted: i=1; AKwUvBwza7NDnh6k4YVUYeVZuNMRUA29L4xDQJ6JUebe21uKKTjp7g/skJp23m6QHfKVFVdlmPMQ9vd1JyuB0Z0=@vger.kernel.org
X-Gm-Message-State: AFuF++necLAEn7CIqqIiuTExfRqEXl9s9+MvXnTWF8ZppQiSB0EdtpgV
	J8N9ZSAyi0K1RDqxmSAb7lvx+HXtHd+4vHsT23NzFdrere6weMx9zkAqc/jH7buQa+cJV8O3gPO
	XBMju4lr4Iy2jiRiF4u9370TGgtU4HzaAm7a++dGtd7L5J/66oK2pdDss1E4rUX1rpFRCs3wWoi
	9nbI48N3lNw8Zr8VdVmts6oSXJi2fMv4G7tSwqf3Hn3SHJWicM
X-Gm-Gg: AYBFou0Q9WRG3JUfeTVDwy2WkNz9E/UmP1a950rqxcHmDFoRA3AA715Jc0dn0TTeXRD
	It+6btwAmucHTQuC5cm8CeH78sR+ijKmJBV0ZnRxZORgjbBE+ulIZMbo7x1Dh60vB068IML6XyP
	UflnS+loFf0gdNxNoftPM4CpKAx7gcgb/8HkAqHV0Eer/j/oaW5I87+SoP5tRjbpGVivuquab2R
	Geu32FYhT4d3DunwLdfZE1nMuj4HhC/IUX+2DFO74Yt0QNFEXYV9qliQl8i+vk0ZczDgLM9W+yn
	WlCtZ1Je0viqcTkOKpbQjMdow9xMN7zr/aV2oE/CXA+pMdUTgX1N7uFLA/vDdyJ5RkNt2fAXpdn
	seDjhjck=
X-Received: by 2002:a05:690c:6607:b0:868:505e:b935 with SMTP id 00721157ae682-8a64bb008c0mr22054807b3.13.1790277938350;
        Thu, 24 Sep 2026 12:25:38 -0700 (PDT)
X-Received: by 2002:a05:690c:6607:b0:868:505e:b935 with SMTP id 00721157ae682-8a64bb008c0mr22054527b3.13.1790277937833;
        Thu, 24 Sep 2026 12:25:37 -0700 (PDT)
Received: from [192.168.134.224] ([2600:382:8501:4f43:e566:7498:c7c8:a7ec])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a860e5a5e9sm1031967b3.17.2026.09.24.12.25.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 12:25:36 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Bill Wendling <morbo@google.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-clk@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hardening@vger.kernel.org, codemender-patching+linux@google.com
In-Reply-To: <20260922110601.1959213-1-morbo@google.com>
References: <20260922110601.1959213-1-morbo@google.com>
Subject: Re: [PATCH] clk: tegra: annotate struct tegra210_clk_emc_provider
 with __counted_by_ptr
Message-Id: <179027789851.211017.14017390990337858574.b4-ty@b4>
Date: Thu, 24 Sep 2026 15:24:58 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=355; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=yuS8PUHpyjlmxe/bLBUuHCrQMMO3MXVmrvfWzdbYyP8=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLK2VmpOuG07yfjjy7Z1G4vOC1trzMrY6ObP/vv2JuZHR
 1dIrmqQ7ihlYRDjYpAVU2RZkmtUEJG6yvbeHU0WmDmsTCBDGLg4BWAiIiaMDLuWajPG8J80S8wz
 m8g+ide+/k6w7+bZm3mkDlhaRVzK3sPIsO52hPCLV16fpLdfu2EgPPVex0GRoEtfZ5TKizPxXPB
 4xA4A
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087


On Tue, 22 Sep 2026 11:06:01 +0000, Bill Wendling wrote:
> clk: tegra: annotate struct tegra210_clk_emc_provider with __counted_by_ptr

Applied, thanks!

[1/1] clk: tegra: annotate struct tegra210_clk_emc_provider with __counted_by_ptr
      commit: a1f2029b89ccd7bef54e187384417db4d72d0a11

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

