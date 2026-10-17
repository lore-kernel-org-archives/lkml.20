Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7286B3C4163
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 10:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792233375; cv=none; b=CppN7JLBt7FYSpOF+ZWIROqeTH/vwGEpk7DzFpbLhdc9t8ABAii3Ek0RdOWvIv0TC9qyMITgVRceeWCz/3nMEDYZi4X0yVtJy5Roux8Q/WKvi7X1w8NV4Fb0AR6judZ4csmJcOc2YmWKbPAvN914YAjY2B89+67XTwUR9TuwZIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792233375; c=relaxed/simple;
	bh=madghTK9ExBbBiA34VKdk4hXsj2aw7WBNeVH3eAy3bc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rW+pcdXItBUHqd2zpZo6wCUIL5XqKt7QyTNYdDvnMCWxMxA/aMprAXGogl5vvF6UZN3UY2DNEIlMXLNQsx5vZsFm5FfVwlidZ9O/jhAJGtMqwzFuGDfEa0/Szqaev+y2gpPJdGJXKpbXGb1NdvVc/ToDpr4iEAXIAFoGPUHSrXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=SBaZjvhy; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="SBaZjvhy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=ma
	dghTK9ExBbBiA34VKdk4hXsj2aw7WBNeVH3eAy3bc=; b=SBaZjvhytzxgH8ZZ9u
	QLnfMS+0kYDBQ12SoADUjBMxPEaYlXjNZOCAt+XkMO3M5Bcweo3uU7fbrhFOymob
	NNSeuz6QAHJc8YkaPf5uApH1m6IhACBoqpbKF29xYbT6NSVSMFVXziNdJ/Czj82W
	o9KArrHMMlu2dGddxNiWRgRlo=
Received: from localhost (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wDH7xmIT9Nq0_C7AQ--.2517S2;
	Sat, 17 Oct 2026 18:35:52 +0800 (CST)
From: Feiyu Wang <wangfeiyu_mc_code@163.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Feiyu Wang <wangfeiyu_mc_code@163.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: remove multiple blank lines
Date: Sat, 17 Oct 2026 18:35:45 +0800
Message-ID: <20261017103549.6555-1-wangfeiyu_mc_code@163.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261007104610.128178-1-wangfeiyu_mc_code@163.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDH7xmIT9Nq0_C7AQ--.2517S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvj4it80KDUUUU
X-CM-SenderInfo: pzdqww5hl13s5pfbu0lgh6il2tof0z/xtbC6wiFxGrTT4jMiwAA3b

Hi Greg,

A gentle ping on this patch. Please let me know if there is
anything that needs to be changed.

Thanks,
Feiyu

