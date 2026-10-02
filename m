Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F0703290AA
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 15:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790955991; cv=none; b=Yd8qk+nTkEVCNrxOUnKIdcnlC6Y3XjNaig0GZTfM+JQZvmp/Df7wzdWRylE9M0OpvfQQTO4v+QkyYsgGYjXcA6twHcodQsVkwxqm3z8S3VSpNe5ucMvPqnFbd133KTlyfRLrtdXfyi6iUac9WaNs/RfVs0gjMdZhVAk7twsLZqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790955991; c=relaxed/simple;
	bh=h28xSIp17OKs/AgiIrNq+DdSPKZiP/ZhWr17OJaw6v0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=iXz1aePJ/RXQyWoTen7/cs8GfWO0RqXf7SkiptJ1da8nWiUI6rVLF8mpVioIAFQKvHE76yLZ5tOX5ckNsPE1L2hzqpjzYVa2iuaf2kmag8Vf5ia6TtGYHRFhScZuSZIdoHJXfFaP7Qh2tJHfnZJEaStuZUnwIwF/wSdmqpgyFeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=boSRXA0u; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=eopCkTTT; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="boSRXA0u";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="eopCkTTT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790955989;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dkAUcAmviJBE+AfFgIHguRjot4BcqQHezlPnJllPFWc=;
	b=boSRXA0uww2VevY/aVLg9v4AFUOOzUCGmolfLvfnq+FOJrGXiTQXexejCYMSHKsAFJsGmn
	XDooiy1VP08H2BzSSb5BmCVuWx6dez890OkGDwbHhxv6CQb2r94iwiD85F48MMpiQHKc/7
	gesjC/rcFrriTGYnv+ef0oxGCy+d+18=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-411-EovuMbl2Nse4XQw0u3wcUg-1; Fri, 02 Oct 2026 11:46:27 -0400
X-MC-Unique: EovuMbl2Nse4XQw0u3wcUg-1
X-Mimecast-MFC-AGG-ID: EovuMbl2Nse4XQw0u3wcUg_1790955987
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93caf7856ffso553579785a.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 08:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790955987; x=1791560787; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dkAUcAmviJBE+AfFgIHguRjot4BcqQHezlPnJllPFWc=;
        b=eopCkTTTIgHgygBF57ZjL8jbqnAWngZ5pqqHQ5zV356I7kTlMUzwLDF+KIlr6lQqpc
         6V3/ndlGDkbs5YDeOWZQ/FR2cTV3pKDdUatOXUIYUrgBOsSwOOlVW7CuW6cuvIrWRexP
         XJSG+AR3eKWRVOuniShBV/SnRlBfrADRNxKY/bu3J1c9DF+H8mDSXXpYGt6WSRwIkfWd
         pCsKf2oE2gYbKstCqM5zwLIywg1iBnxDtWiwEf6RbcUt8/xPAbd62Hn04bNaVLGnzy8P
         rdgUxd4tKKSpLhvr0ATRVvKzZjpQGpJUEI79pqENg5i3veVKpke+oxA251flaXSgysrP
         P+dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790955987; x=1791560787;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dkAUcAmviJBE+AfFgIHguRjot4BcqQHezlPnJllPFWc=;
        b=lvRCatg8RWleIz3x0lzz/u93tOoxbLDpjXwFgBXNc7YMGMPf9Ks45V7v5pNPvFrhKh
         DT6At0n7C/l/IuKimtS3/6wgjcTjoSILR9LQZSpeRx97+L1NPSDMQ52shSUmhaWgd3JX
         /XM3BwIzITFoeEgRAHb/pA2bXmV2ASgiWMJOmVBkG/5RXP659TCC3CJ90V/PpiyN6o2E
         dWq0xL9NwaATFZ/W9Zj26N1WWHQDPbxgKySlcVHFeGwOcfFN0WOzkxT2TSA0+XpxXFj/
         T0h85645HQiLWSYNTVke2AuldX36E3midYMyIW06SquTA0aqn7ptt8nR/pPYj/bJ8tmB
         1LfQ==
X-Forwarded-Encrypted: i=1; AKwUvBxsS5K+tAgIWJw0Lbk9bEoKXNS/V+/Bx49YGzOPsZNPPIZdHioqy1i04J/sP5yX/sGAOVuDbn4Zhfj3IYg=@vger.kernel.org
X-Gm-Message-State: AFuF++lGVVGKekNp4Zmj18P5gAEoj/lI/fNG0F9kSzEiLFlvDsK3jHuC
	wDziluqK+QHhJYJpg9ml318HGMn8Hj5dLIFWdSgsE1MsGx8u4bYz/2N3DX6wli6anUHQXOjIN60
	joDy2YZ1522kII901ANQjhXN2P08NO7YzXoXxArRjmOGrykLQyF2/VFgjKmiiUcnpZw==
X-Gm-Gg: AYBFou0RvEWIak5Bmgrmw/8ldxQPkjDnaGMdXJRi5kNdDdVfUsFvLytFB1WTe5ToDyf
	UxrpPhlvUtrReo4rE2oP8BosExi0R6or9+sYTD1Jj8NMZg52wgRco7QMEwq8zrzo4jkQ3JbimuF
	Mk9syQ+tLPOvHalIVS0i3IBTtSp/nKd8RYE3ts9XIE9c44XDyzCLraqjV6HNUqO6lbaq/+r+9FQ
	txLm9mJlbGKLJ8RpOjAKUrOAfvxznF182XyCu3KegoN8rICIyFCYmvxNzJbv17+rBsUoQCgDYtr
	/Z69jDzFNxOw7QHMQiT7m6t0jCo8wq248e3vPUp0B3570ZT9C1D0Xk68dFMx6upQi9uamKcKdmH
	h0RWcD5VYL/5AtGEotyOo0vZbydd0gBXyOyrmZerdXMIb07cKIYw=
X-Received: by 2002:a05:620a:1a13:b0:93c:c98d:e1b6 with SMTP id af79cd13be357-93cf178a238mr541163085a.48.1790955987050;
        Fri, 02 Oct 2026 08:46:27 -0700 (PDT)
X-Received: by 2002:a05:620a:1a13:b0:93c:c98d:e1b6 with SMTP id af79cd13be357-93cf178a238mr541159185a.48.1790955986487;
        Fri, 02 Oct 2026 08:46:26 -0700 (PDT)
Received: from bmasney-x1.rmtuswv.csb (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93cca209601sm250629285a.20.2026.10.02.08.46.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 08:46:25 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: linux-clk@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Prashant Gaikwad <pgaikwad@nvidia.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
In-Reply-To: <20261001054701.39160-1-rosenp@gmail.com>
References: <20261001054701.39160-1-rosenp@gmail.com>
Subject: Re: [PATCH v2] clk: tegra: bpmp: remove kcalloc
Message-Id: <179095597991.810253.6056329084530494982.b4-ty@b4>
Date: Fri, 02 Oct 2026 11:46:19 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=267; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=p9s0POduzL50uWCzmc8L//0zD1FZFy8osEfnLmwPpCE=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLL2X7xwlD3q0Mk3N81nbOcpuVDJ4shx5VqkofuNK0t8q
 5zkd/vXd5SyMIhxMciKKbIsyTUqiEhdZXvvjiYLzBxWJpAhDFycAjCRac0M/7NLc2IttmQFTU5a
 uPWu9kv/HRz/0lkjLru9WDHz87aLs/4xMlwpS5q7a8bS/AVXHn6vDbqh6rXRLriQfRnnxPz6rHz
 lB4wA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087


On Wed, 30 Sep 2026 22:47:01 -0700, Rosen Penev wrote:
> clk: tegra: bpmp: remove kcalloc

Applied, thanks!

[1/1] clk: tegra: bpmp: remove kcalloc
      commit: 2fdfb2abce2fcc157de840949fa3e6af9e915363

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

