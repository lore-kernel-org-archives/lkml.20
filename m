Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793949972;
	b=ZtQojeIBQNoh8FWL/gkuUaRkj6+Sm+TzjSeVjJkwhZfY0ntypkz8mVjvQMQNOH/MZGBs
	 cnTkh1RRNgP+GutWGEGf6MWUKRxoTAUEgTcIJvCbNdUQxZr+17obCSqzwZY9ZxA4GLROR
	 ZMyJtMavFROzifaA0bhQpVdRXrLlMb7Dg1ByJCij+jTpT37mdx9F12vCckUbRO2ZHafVJ
	 7MyDqZAgH8e7C31BAgljolS4VhuILbSWBsORA1frAbc69DIR5Eeb49CRC1vcAyKfcSGf5
	 Ngiba0BETpJvdqSQsDhEqHczScMBuc/4WIO5Qf2eH+QPgggylrTa+lEHi0czkcgZe8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793949972;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=h6iC1BFKziQSdkT7Y3Z7o7DDpetOO4YQdmgmOckELCw=;
	b=ES1DNw4JG6QnPb93d63LoYggTAoI5FP0WoQuDr5+p8eOUmqq7Abf7OiJiZvhK2G31ohB
	 AVqON2BHEayQnmKcGdbjin0LL97Xk31856L+pO5gsLPDxTivi9rYdUprvpFIM+wj41VuD
	 UaadP0AJHHr1L57LSXdkb9t8iPcJAfqxLnOOL6AHn1fUdBpit/Nuk5LFEjoL9UP9G2J7D
	 ibyZvvnozjDeSQjRsClXLKf5SsA1iftmbe4vLkni8EtBM7kZm/XjDhQsv4R3CeFKSIwzJ
	 mW1tkC8AW9/noxTfMGiP6uZURgLL4d6LPTM633khk4CJ2o3ATQDmf1NNj4hfYEybG1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MemkxiN8;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8828606A335
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 07:26:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8828606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MemkxiN8
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ed1e9ae5a8so1151115ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 23:26:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793949971; x=1794554771; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=h6iC1BFKziQSdkT7Y3Z7o7DDpetOO4YQdmgmOckELCw=;
        b=MemkxiN8/ymp8wHEishBUH1i7zVz0CW1FMzpMHzBbgM9Ip93h/prcUolyjq8y7f/pk
         KcKzls839oqBARMiSLwn2NpM1qrjKTeIRP+kZ0GeGuK8NisutI7qItJ7PPt7RumuIbtS
         pj9cgd6cn+/iK0kW8K/37J7JiKGMIXGzngWaoRz/piRe4/zmFdUl3+ECJCmFJ7wPzXIY
         svOEJQ9mAHayTHEuF5opvpSLIEM4a/En3uaKJGzs3pJzRakN3JBebvqvccQ8gFAlphxc
         05UcUwLXsV/Beu9UTXO2Ps/Ktt64HI3+FPKGxQJjwk2Vv8xSZF0V3rOZREopuaX+r+tp
         1w7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793949971; x=1794554771;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h6iC1BFKziQSdkT7Y3Z7o7DDpetOO4YQdmgmOckELCw=;
        b=2bYPQZUX7ef991nqGTc++tZubbyqQD38d5Wjfd/xUHDQjCZSR++2O/nYiADXaKAV3N
         r58NG3goKiQNl0bFalCsHcjCN6KhQNga53gWbB831g4B8eZwJ2xPdhylCxOLPS/JM2zF
         c7+0yf+PQamC5tYSzDg4kF+qF7Jvwxv6QhslgW+7crfq2SxWoPB3E5MpdtYW+R9Vo33C
         tw+eu6b8R5bcTlSmGRLnjWmM2eqZ2LI2Dk4BZz0K97dMT3tc96wy3r5xVAv0AHpW/lZJ
         ljD9P7nPMdbWZEanvWVoj0wUFrChyJOPXoS2SN4EDqCtepV6CYRC5gnkuXyWY4rb7wG8
         1scQ==
X-Forwarded-Encrypted: i=1; AL+hErEBTOeJn0KJFxazfhXR2/6GQfd8CuFjLw6Dzj1kBigfu33bZ1tzlMaCuq9VzRHow+aphhKLzZ6sE90n+0s=@vger.kernel.org
X-Gm-Message-State: APuU4Z8m7ixdaHU43z/BSDgGVm0w/JALSh+VE/THdYELxlMgiqIuJvrE
	ogbnTZqGljQZeAtE0ZUg05zl8G1XzqqbyQ2+5y1l9gKFtNYCWFAGWayZ
X-Gm-Gg: AYBFou1lQZXN30oWGmx9z9oHUG5J3mTmriQOO/ANonzfYJ+QdOwz/Tcm+XvMK13xRs5
	6lsmmiyFFWbKJSZLUE78oFqbwjmgPXM/+nlbbPCmQUpftZ09G4dXd9r+ptW5DcQOFZRyVmH00UF
	boFojceLWD7+7w64i5PntlNJqD35Gx309iE85jQCUjLGqJQ+6REw8vhM2hA75bI/IXhtPCocHiH
	zz7E8bmq9XRgoBVDmvu424kGRt+Ta+0Uf6Ik0TbRRai6nk/7re3lEBuljnZ6azbixWhxDVJx4F2
	o8IQ30AWCSdSWj6xT2P6z3UybWoVGknmkYyj/LuMEhlBqsd4e4G0AA2twI26ZXLrfPvNwY1wgqp
	KDAYSvct7P7oO/yfPVexrfasb4TNuOTQ5SjvGuN5DIe2KRcCdbSVkJxuyBu2eiEYi1Gs1VLjRSa
	ZGovEDhISaZRpK9opxWd2whZ5v9tABLw6KhlACCKBNh1BARpv2PrBSdgEqpfYpwlAJRc8yG6xC3
	In6xqWB78SDe9st5KOVswAIlG4SzNeasApdj+yc0sRW44RPjlLyFYg9D1OjxLgk/xbnk5Vh2pts
	KsvWXkhgxcNYtN6DNgz+W0ZZIQcuAQcia3B2wn3O0HYr67ptomMq
X-Received: by 2002:a17:902:e5c3:b0:2e9:5d1f:dffe with SMTP id d9443c01a7336-2ed40dec190mr22310705ad.57.1793949971038;
        Thu, 05 Nov 2026 23:26:11 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:7680:28::4:396])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed47d89976sm2633715ad.66.2026.11.05.23.26.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 23:26:10 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: dmaengine@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] dmaengine: pl08x: Support the Hi3798MV100 PL080 variant
Date: Fri,  6 Nov 2026 15:25:57 +0800
Message-ID: <20261106072602.77560-1-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Hi3798MV100 (HiSilicon HiSTB) carries a PL080-class DMAC. The block
reports 0x0a141080 -- the ID reserved for Samsung's PL080S -- while its
register map is plain PL080 and the instance has 4 channels instead of
the 8 the plain PL080 entry claims.

Set the DT node to arm,primecell-periphid = <0x00041080> and
dma-channels = <4>, and apply the two patches to add that support.

Tested on Hi3798MV100 hardware.

v2:
 - fix for shared reset
 - use local copy of vendor_data
v1: https://lore.kernel.org/r/20261104154542.3131916-1-mmyangfl@gmail.com/

David Yang (2):
  dmaengine: pl08x: Release the reset before reading registers
  dmaengine: pl08x: Use the channel count from the device tree

 drivers/dma/amba-pl08x.c | 34 ++++++++++++++++++++++++++++++++--
 1 file changed, 32 insertions(+), 2 deletions(-)

-- 
2.53.0

