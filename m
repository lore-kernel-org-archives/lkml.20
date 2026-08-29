Received: from mail-24425.protonmail.ch (mail-24425.protonmail.ch [109.224.244.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42C1F3B27C7
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 15:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788015695; cv=none; b=YfcDcr5G12vMsC2DZOFbl8UaWqOj0gQw5yPdHel9sCZaiL5QQnuZCRTNTHxCepz4eghZErWLT3Ny45DYrwcu3vUpNuYpuTlnWyqtiCE85NnnFtot6LEJ91uDvXZe58etqhy34ee5gUSLrjpvYr+qbkyOs+tgZb0IMP2BBKTbLs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788015695; c=relaxed/simple;
	bh=wmLBLfOvqqOvX8IpX1LbPB7Y3xzCdSzlq8N1pq0P6aM=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=sUxJA3jwuR9kQU5Nw0TbG6h7CcUYi9q8n++kOU8+vqBFKWzcB0B41wJpuUbJUVIMqG8A+kAI5my07Epji5VcfuVDx5+6hu8WMwnxwUo1/qtGv9b7PAjoQ7dfK60fjHL/qsnWPX8JRDm2/H2Sj+RzdRgx/kAKFdxiJVSX5AEATxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=YwNttSTm; arc=none smtp.client-ip=109.224.244.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="YwNttSTm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1788015682; x=1788274882;
	bh=wmLBLfOvqqOvX8IpX1LbPB7Y3xzCdSzlq8N1pq0P6aM=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=YwNttSTmnHIvALcMv3e2UyKPFptAsuKiKYv/0iy0fQP6C1AGXWpW6SZXYpqAZquWA
	 xsk4bo+Ljh0+idnDqvNxex8XTQpC7C3jn7Yaw6SGKgPHeZWu6ZCi5VmtV0siFfBP9c
	 dkXQ6+89xZ+FlmC8bpYI9kz/XUkUkGMWGkWQ5omHSIBwotMEOauXdOPD0usvorAnwc
	 encx7N8R9jNvRhBljulad6fkdyBg35aWxy0aFFUQ6xdBuNgm0xKAEZ5noavRDExhQo
	 Wuu0Ja5q4aeo8goh7CODwp+jud2jBvUz2VyEamv8lqa3TB5qQ0UB9KSL1C8Ge+eikz
	 fLDbXmnHPg5fw==
Date: Sat, 29 Aug 2026 15:01:19 +0000
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
From: Turritopsis Dohrnii Teo En Ming <teo.en.ming@protonmail.com>
Cc: "ceo@teo-en-ming-corp.com" <ceo@teo-en-ming-corp.com>
Subject: The Linux Kernel Is Approaching 2,000 CVEs Per Release
Message-ID: <QQCfrh9HTFg_4uH47GqHAtCEv0JjHF_BLEw6uwN07tFMZczWsnrEgzFF3sI_5JwFrJXZMwJpvWIDaio0ZMGLBR5-gs6fmg1HANCpo7M2e74=@protonmail.com>
Feedback-ID: 39510961:user:proton
X-Pm-Message-ID: 4ea67743f81a1d27f30b2ec027e6a514af29396f
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Subject: The Linux Kernel Is Approaching 2,000 CVEs Per Release

Good day from Singapore,

Here is an article which I would like to share.

Article: The Linux Kernel Is Approaching 2,000 CVEs Per Release
Link: https://www.phoronix.com/news/Linux-Kernel-CVEs-Nearly-2000
Date of article: 28 Aug 2026

Thank you.

Regards,

Mr. Turritopsis Dohrnii Teo En Ming
Targeted Individuals Singapore
Government-Induced Schizophrenia, Government-Induced Health and Medical Pro=
blems, and Government-Induced Extreme Poverty for the Past 20 Years (Govern=
ment Persecution)
29 Aug 2026 Saturday 11.00 pm Singapore Time





