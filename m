Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06C454FB9C6
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 18:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788458621; cv=none; b=jEfUlL9Vi6YbqTdPo2hoKAHZWIfNi+ob2/RWytCK2YY3mZRpKy7k6a53yMu3LK00jDJD7xOvORGa+1WO/kplfU7E1C3oX5bA0UveAHsWNP0jsLwaY4LEHcxIYqZd6EegzUplYwIcpHN51AQ1VxmniRKiO+gC9fW0e+sZgJSncro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788458621; c=relaxed/simple;
	bh=CwdE3Okoch7xrLK/qUNZUvKvP/5GRURsBtqJNWxxv0I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=UJ5VEkuypfGG0ik+IjdLjXi6vZ3tjnSq4lmeyXv79Xs2npktXSjGU3IGBDMZCuXhSYwsTkDmHoB3CJM7S2nSHzpbcX0XPbozmmHF1DUz/49KqRo+AWhDP002dHjKTtQfBwIwWIcwyESauWyhwancGy6XMLN92ntEBk5vZhLnaSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=jD7KuBLf; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=VTyveSWL; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jD7KuBLf";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="VTyveSWL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788458619;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3JoPfOCY29A3Y3qiUx94yvtnxEMXNVAH5t6LGehu/9c=;
	b=jD7KuBLffcygXfY2B3CX4IOfqnvYW8ie/WMAYoK5dRVUVmUH/aoqtnuU7FK4xvPcLoUHYv
	omclLFP7UeG7GwZoHjamWfOUHe5EbOqRtrVqoxKSF3dtJA6Cf3AyNB7pYzGpzoBW5yGaL9
	2eFG0wrNcqTu7N/fMjvGLn9sENRiLSI=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-511-Is05y19YN6ayTT2VPc0fxQ-1; Thu, 03 Sep 2026 14:03:37 -0400
X-MC-Unique: Is05y19YN6ayTT2VPc0fxQ-1
X-Mimecast-MFC-AGG-ID: Is05y19YN6ayTT2VPc0fxQ_1788458617
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52ffe24490bso4750251cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 11:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788458617; x=1789063417; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3JoPfOCY29A3Y3qiUx94yvtnxEMXNVAH5t6LGehu/9c=;
        b=VTyveSWLWjbQ6QdYu84DARMaIOe+pQTf0MEp6ochVbQ7zTq4DUe3fMEP47FxVFGcmX
         GdDW6JgqozXMoag/7aocGBOepFUsRHLOEmpsvkA/9V/v7RI9LYbhm/TgiWFCucrRi8P3
         0XyfWXQbekm1FHK6SdO20ZRDLzYZYGZJglnSj52i3ug5n9jaj161/5e/iPFr2QTJyG5I
         nSHZCKIBe8/UDUFD2qrmaLYM8BhH2guCbZNx/cpTfR52dyxiygvYCJHwbLumqZwf1fgh
         tiZME/2KfGN+yQi0mtsVcE1qIvwfPMXWo9EFBbo1HzmpxyRNau1QGLzBu+hdke2Hi7Bn
         vVoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788458617; x=1789063417;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3JoPfOCY29A3Y3qiUx94yvtnxEMXNVAH5t6LGehu/9c=;
        b=ZA7T9Fhf+pxBdi/kQbEIg1HHSK6QGmV/5HN5Ldb3CeuiRtwj13aVfY5456MIgSEmCX
         fUgS6Lfi/omQ+BUZnAP74yfRtf+njDteTv41SQMwU5HaRMManJq+zUP2H92SRsFADmln
         OindPyisPHD+cVC03gzIKZe9Rft4LQh/Iq2fErCPW6ImZiItfLMAsMQfL2SnOqbrht/o
         9RGJHmH7w/ONVVO63d37i/yQg/aOqYdW1AN1O6LQGOtnqECe8lG3LL+xcQtw8bJCxKwh
         4o5NkiNJxsDHq50J9NUBKC4eI6oQWyOHLwh9qS4MjkJFmpj5M1bEArWlCS+H6P2aX+Iz
         8Gqw==
X-Forwarded-Encrypted: i=1; AKwUvByEnHCTDFf6zHp7g2lrLtUQDK3xc1xO4vOMdutI73BNfacsFLcMWocPcbMTysvWgHyTUkkoAo0lJneKrK8=@vger.kernel.org
X-Gm-Message-State: AFuF++lSQtL5A2tnuVeXzZ/Njg6hrPCWSCLVuJNkTKYaqhjTUNAZa7Mx
	0Tz1WgOYuS3q2xipjUGBSS3kOX90cMJ/PZ3Y9WzDEymn5knGi2ff/uIFv/LBnfwiClZahRwUt8a
	0EQbzAOC2JSfSjWfgpUl+PYOBDXexPtK2x9p0cVn22X91kCq99rdFT0phg4m8lsA58Q==
X-Gm-Gg: AYBFou2vfOpqLfL6iO7uo9Tn0Gtq10nzvoxLRrSaw0cuEHXbl/E3AexAO04ICf8jKOO
	yAp2lYcT8rsxsSjOCP6Kv/wzH/liZbF8WnbwQ8Mqiojj5Q8yMmyYA2eKcW1gp2CjmUWFxvcwN7W
	yrZp8cpofXp3G0top593GvXZAwU2J6RURbm4SYyoX7F1coNNkZoURUX64CzIZgpLRewFejuB0aL
	T7d8uh80b2U9NDzlaszD9v7k2H0RsXI80cRZYtKUep26rVoCa6p+0AuoA3co74cJ08PMKvavyLU
	uL4rYeOeD8Y54PfFZwXU/FeWZzbHD5tp8Bo4+nUx0RbBzocluwboibpA3OUtHRgeXrCNqnVrzQ+
	E1be30dlxeMHExefh1+F3FeEoIx+Y3jfDqHoi6p4=
X-Received: by 2002:ac8:570f:0:b0:530:3526:9ad4 with SMTP id d75a77b69052e-53054944a04mr6121131cf.27.1788458611950;
        Thu, 03 Sep 2026 11:03:31 -0700 (PDT)
X-Received: by 2002:ac8:570f:0:b0:530:3526:9ad4 with SMTP id d75a77b69052e-53054944a04mr6119851cf.27.1788458611330;
        Thu, 03 Sep 2026 11:03:31 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5305418950fsm2243051cf.20.2026.09.03.11.03.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 11:03:30 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
 Rae Moar <raemoar63@gmail.com>, 
 "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Pascal EBERHARD <pascal.eberhard@se.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Fran Li <Frank.li@oss.nxp.com>, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 Frank Li <Frank.Li@nxp.com>, Herve Codina <herve.codina@bootlin.com>
In-Reply-To: <20260807-schneider-v7-2-rc1-eip201-upstream-v5-0-8785f9531cf0@bootlin.com>
References: <20260807-schneider-v7-2-rc1-eip201-upstream-v5-0-8785f9531cf0@bootlin.com>
Subject: Re: [PATCH v5 0/7] clk: Add support for clock nexus
Message-Id: <178845859345.51586.16050131783608017430.b4-ty@b4>
Date: Thu, 03 Sep 2026 14:03:13 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1234; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=8F+i4KUetkQ+0aPX5fdnN3d1y2UwrIbldYxHlQ8YsOA=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLJmbsvrsqsrqnh3r4VvUyAD82fFh/bmeQsLNe/Ir70bc
 c5hsuXajlIWBjEuBlkxRZYluUYFEamrbO/d0WSBmcPKBDKEgYtTACaS7sfI8KQ4oviW9cWfXiom
 6mJPO0VeXjjhVn5N4WtfTN/DKT3y3YwMkzx2fd6e/WTvlJATFjmTdp5wlr47od1tvURCaZt3a7I
 vCwA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087


On Fri, 07 Aug 2026 17:24:01 +0200, Miquel Raynal (Schneider Electric) wrote:
> clk: Add support for clock nexus
> 
> Adding support for clock nexus had some prerequisites requested by
> Stephen, such as adding new selftests, the initial discussions come
> from:
> 
> Link: https://lore.kernel.org/linux-clk/20260129201003.288605-1-miquel.raynal@bootlin.com/
> 
> [...]

Applied, thanks!

[1/7] dt-bindings: clock: Introduce nexus nodes
      commit: e0be7b4eedd3b7c6d1a3db0dd76babc35ff89bc6
[2/7] clk: tests: Add clk_parse_clkspec() Kunit testing
      commit: d0a15b827251de65bd39ce0555d656d5563c41dc
[3/7] clk: tests: Add Kunit testing for of_clk_get_parent_name()
      commit: 32d4598a48d63003e732f2de3608fcd184aa8061
[4/7] clk: Improve a couple of comments
      commit: 4ee1e9e1d614a6b3a6264bac5b070c67a89ce19a
[5/7] clk: Use the generic OF phandle parsing in only one place
      commit: 57d728b4ab15a8af890013bb0f302e7733f7c1c6
[6/7] clk: Add support for clock nexus dt bindings
      commit: aacc54c67869effe89c92c0d54bea40148c53475
[7/7] clk: tests: Add Kunit testing for nexus nodes
      commit: 91b1b8d437abe0cd83210d8f257b785a63047aa9

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

