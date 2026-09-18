Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE523D34B6
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 22:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789770573; cv=none; b=D/xfGxSdzM7gVLlnpvepAIW9Jebwqu+rYJ078hbk19h8DzV5tQSS7sMLvMVJIPk8zoupsLDhfBys5q1MB4alV+YPqy0e+EkB3BqUgOFjC+l/biWT+LFaLTjT+/oauOumZvbSIcLeC1frcddawNX122wf2OMn3XTAyZ4D3yzsND4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789770573; c=relaxed/simple;
	bh=qJfvIkWQLChcJURKBe1+9TQo1Vq/0W077vbNcPpsImo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=mUASKKUWGYsuuoo7CgClSv7qeowys2u5WdK3NPPiurd3v8Ge5u7t+WyRY3KmvHpWzSGtLbRPql6sl2Pa58fhmoJff7/2Ze4LPzzwuM3OSjAPTdhG4o8KCyHq4dUaGPQICqWBG7jnWVHV4sHPZ5CZzmytRXYMHkbxv2rYfJq/Aks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MDB0HSA8; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=q9Wd90Ys; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MDB0HSA8";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="q9Wd90Ys"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789770571;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p32LQHLzzMSNCQDrCQVRbQJDsxmVl9uccGFGyZXBagg=;
	b=MDB0HSA8Stfm3Ttqx4kS5NY3piXwYrxs6KKc+R3yViaNyR2kjT1tDVHUuEBXoZ2b4lOVX/
	93AF8LO4NIwAMsbrISYzbSX082YJY7yX/IDhTEk72iflu8Z92qBwI76tgx2osnOQVjW5Xd
	7c9pPEXGCYgdAokfl24bUtwEY3mkCDo=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-207-hfaQMCiIPlCWYpPASM3LSA-1; Fri, 18 Sep 2026 18:29:29 -0400
X-MC-Unique: hfaQMCiIPlCWYpPASM3LSA-1
X-Mimecast-MFC-AGG-ID: hfaQMCiIPlCWYpPASM3LSA_1789770569
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52dcf1bb6e9so48645961cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 15:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789770569; x=1790375369; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p32LQHLzzMSNCQDrCQVRbQJDsxmVl9uccGFGyZXBagg=;
        b=q9Wd90YsCrPSKBVhyijmaFSfZAHkzSpI+1krsOFFUejQqUreZFEo43pqiCHSmELpP5
         f41Mt2nE7DAzRKKmUb2woGdjAndq1qFE0S7jOaCPGMpzUonU2GdSJISZ6MYNxjN++cK7
         w9OGbr0gHefj6ENmMXWj4eB6dVImN5bA3n0LjoGU34P4yXq0w1nJeimbUeFs8xlUMLRO
         bWs1gjqYQojtuZz8+rAvjBBVrKbB8bDd5oii4hevyAppDWrk68UitZ79Fh9vguxK/FCw
         GnAZC4i7kSlooetYGaIJAZ5nWc7CRbJ55e5NGQjZ1eeJ9CurEYvx4zKzby1XZ8Nuswuj
         oeyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789770569; x=1790375369;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p32LQHLzzMSNCQDrCQVRbQJDsxmVl9uccGFGyZXBagg=;
        b=VKnpA89yU687KOU05yny+NMaIHhZuIJGn6GHMI29nvJoZnHe3Curbe0FaTkQEYThbL
         M51WtxReeNsIGbUULgdnEeQYqon26eK5cp4RnFxphWrU5B0a3TGN5iIRUSEhomczxn28
         xsfpezKpAspML/R8RuReAW1RB31gT/3V4HLRE3I9jfLq3+YMjzDp/yZtrhkjUspippFz
         t55lCjjEcVyptpZ6xVUNkXP78Z8XdC2RmrazMaKvM2zpXueookp7qSlBfHp7bQ0m//5o
         G8NsGc6W4pG2j5jreJzVG4+x9hhaAvgdbbL030FnJwDBWYlF4Nv08PZ1vBiydRpq9iV+
         l4iA==
X-Forwarded-Encrypted: i=1; AKwUvByhUy8bpV0YKeUqs8dgr2MNGTQBPHV0ToPzYGFiaUAn9FyEU5ph7cWTk35LsqhNLB1c/OZbIp5rCEVVq38=@vger.kernel.org
X-Gm-Message-State: AFuF++nyIt6/9WzTJi5B1vvxAu7ryKsV53a41ivDD0nYHG2U1GIhgH9U
	ClShyHA4kkQdKZhX6hoW83sN8tx0QlsIpLJBT47QJpo72Mei4SxJ5CtnrV5KuyZOrSzdh+lnU6B
	5TeOgK90XLVO8ZuwqaCiR8Afi7JoV77RZ+jFcUjLbhVgVEUcwZcwhD4YxsSWr42fmZQ==
X-Gm-Gg: AYBFou3cdedZFfOHt/LEM/DsgLmkjs8GG74cZ3lUItCsy0dwDwCDYXIes7V0OEMqGhn
	FulyrhQIg8gdDHOsPz9/ucFp4M3/+vCkh7KFwI+SOi9VCpOMp2gt7NP0Pg31Nl5E1m9kmHXIwKN
	Z74Mei6G51VkuP7qZ65cIfHEMBsoZM9FYhcpDzoWOdXWvkUD1tSp5BtOmNIjvT2KTiEt9qWoGDI
	epMdiSBgO3D3gq+CFg/6vSUm4MHlPW9BGB/M44Qp7VuY9rKJ+j5x2/QwQuBf9qb45UyRI6C8nxF
	ORlSrDzIhsHwfaFIIaSN9WE1WJ9ndBAyTFnegfQEOZQ7CGnHPO5xHPjlRdP9jpfq2cB5+Tlchwy
	5Ww==
X-Received: by 2002:a05:622a:1115:b0:531:1e4a:8eea with SMTP id d75a77b69052e-5328d0015d9mr129233891cf.32.1789770569012;
        Fri, 18 Sep 2026 15:29:29 -0700 (PDT)
X-Received: by 2002:a05:622a:1115:b0:531:1e4a:8eea with SMTP id d75a77b69052e-5328d0015d9mr129233621cf.32.1789770568655;
        Fri, 18 Sep 2026 15:29:28 -0700 (PDT)
Received: from [10.239.101.46] ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532ae758a61sm7260371cf.26.2026.09.18.15.29.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 15:29:28 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: linusw@kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 mturquette@baylibre.com, sboyd@kernel.org, stable@vger.kernel.org
In-Reply-To: <20260915070103.1733176-1-vulab@iscas.ac.cn>
References: <20260915070103.1733176-1-vulab@iscas.ac.cn>
Subject: Re: [PATCH] clk: versatile: clk-icst: Fix node reference leak in
 of_syscon_icst_setup()
Message-Id: <178977052357.517928.2775331133276610419.b4-ty@b4>
Date: Fri, 18 Sep 2026 18:28:43 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=354; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=C+KFUpRy04Zo8PlhMyOdpcWavq81OHmCgPld83aOHow=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLLW7na5kVq75sCanhIhw7Zm1+124rpM7lUH3BpVzy1c5
 HziXGV5RykLgxgXg6yYIsuSXKOCiNRVtvfuaLLAzGFlAhnCwMUpABOx/cPwV0rousCtVRntK5yW
 Ty8slf/jddblmuDt7MiJ7kyz/zOuk2P4X6H1c6ea39vL0XltLBNCmUP3SSqX8tmKqZbd+60afJe
 NGQA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087


On Tue, 15 Sep 2026 07:01:03 +0000, Wentao Liang wrote:
> clk: versatile: clk-icst: Fix node reference leak in of_syscon_icst_setup()

Applied, thanks!

[1/1] clk: versatile: clk-icst: Fix node reference leak in of_syscon_icst_setup()
      commit: c90a50d07f0c38c62ce13a60806ab5e3b841f70f

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

