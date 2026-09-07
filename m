Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 950A03655D9
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 03:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788752792; cv=none; b=GQWlHBc4bxHNO34BhI5TKUnzqKeVG0lk0oEnTZd12f9ImfXpk08RDWrEHhlo8TJR9TF3AcexlheZb0GCtE/q/UVwYC24ycP7aUAmoiqrTEwFaUb2YAQGppX9FFr+gRDIEdwfoPihuowsFowWcb1aA7ceS23l8IfeuxbArW+sW7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788752792; c=relaxed/simple;
	bh=Gs0OP8cN+lCOGkgQ2WUYinOWYGiwVJPpLXsduPSPtTA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=elmY4bZpxj+k8oAi6z9Sshfdcfvhx1c8W291iIGWVvOEdB+5F76kryhhHzOJhqbCHzY2dDxB6iVQow7EWAoTjyyzPXwnPn5h0PR5iZqTjmXYpiOgDQkKs4ItgwlCfxPeQDqAZ6MchRxUv/kv54GV20vNmvedE3WYkeUX/3wLKOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=xiaomi.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=MPu8EY6q; arc=none smtp.client-ip=220.197.31.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=xiaomi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="MPu8EY6q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Gs
	0OP8cN+lCOGkgQ2WUYinOWYGiwVJPpLXsduPSPtTA=; b=MPu8EY6q4Menu0S0rH
	PBneF7qsi8Yoq2StecJrq5weDrJlDEMJ3ycn5ORprONHdgYqSZyozi8G73mwekMT
	nmEMr3u2O1zx98G60K+bXTXX1Y5PeYWRikNLNcZcoxKjG4n9h7j2sh4J3DZ/Ax8h
	y6TLRIPMrDw3te0LsDMmKeHTE=
Received: from nzzhao-ThinkCentre-M760t.mioffice.cn (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wDX_2FnM55q95+qAg--.5006S2;
	Mon, 07 Sep 2026 11:45:44 +0800 (CST)
From: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
To: daeho43@gmail.com
Cc: David.Hildenbrand@arm.com,
	Dev.Jain@arm.com,
	Ryan.Roberts@arm.com,
	baohua@kernel.org,
	chao@kernel.org,
	jaegeuk@kernel.org,
	jyescas@google.com,
	kaleshsingh@google.com,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	lipengfei28@xiaomi.com,
	nzzhao@126.com,
	zhangbo56@xiaomi.com,
	zhaonanzhe@xiaomi.com
Subject: Re: [f2fs-dev] [PATCH 14/14] f2fs: make compressed files compatible with large folio
Date: Mon,  7 Sep 2026 11:45:35 +0800
Message-ID: <20260907034536.2169657-1-zhaonanzhe@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CACOAw_xyveu1Dt-UwWFKtEtf0LOZn2TOwqNyXh_DKRs=gCVY9A@mail.gmail.com>
References: <CACOAw_xyveu1Dt-UwWFKtEtf0LOZn2TOwqNyXh_DKRs=gCVY9A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDX_2FnM55q95+qAg--.5006S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUnuWLUUUUU
Sender: nzzhao@126.com
X-CM-SenderInfo: xq22xtbr6rjloofrz/xtbBowgp+GqeM2i3hQAA3n

Hi Daeho,

Thanks for review.

> However, if a file already contains existing compressed clusters on
> disk (e.g. from earlier writes before large folios or created without
> large folios), 'f2fs_read_data_large_folio()' will issue regular bio
> reads without decompressing them.

Actually, I think such files should already be excluded from the large folio
path, f2fs_mapping_set_large_folio will block compressed file to enable large
folio mapping. Or do I miss something?

Thanks,
Nanzhe

