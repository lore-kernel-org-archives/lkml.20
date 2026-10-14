Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2267363090
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 02:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791946156; cv=none; b=F5X9p3VBqo0Oe2Tj9YVHFzSyPJWIK4x6XbnWQKO7smIvcLWppeG/68fsyA6ZmuiQHoZZqjW1WgNi4z6eSLrl5j19FvRbOmLh4oaE0wA9KAKnn/A3ai8iEbJhs4zxC4Fsylyrpt2KOVzSNHP2Z1ndglYeQEFr8z41FNhF3dS/pms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791946156; c=relaxed/simple;
	bh=okdk8hxm0dW/XUwfuxYTgGwSE96/fYrUOqgmlQ1vuHs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C+YwOme9Gg7K7Ej0aW2QBoYfFTEiHGxk0dTBjIdVoU7RUIX7m+0VCjh+4Vea8FA6owq23E30EFF+bY3NoveGa2MZdZKbBl4IK+qsPtEPTdp6leHD8P5tIL5du/Kp4qwIT3BNcYHNXMVYSnvfZlXyoYllx4AWzGfkQwSzdP3yC+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=oIIglN6g; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="oIIglN6g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=ok
	dk8hxm0dW/XUwfuxYTgGwSE96/fYrUOqgmlQ1vuHs=; b=oIIglN6gPucGyfVL1t
	WwtCGfdfOtcbKWfbJKEEPpHZIKPJFLpLFh4JrWh/JJyLQnR3j1CuBlsU5Mr62nHf
	4FliQ9fVZrp1kd7rSINBIE/7lxu3cuHkQkACg+2T4DjKN/yWGPTjieSEhz/ozaLB
	YYrs9kuxCrE8yXv4UVqKrRh5c=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wD3f2Et7c5qnkk1Eg--.60824S2;
	Wed, 14 Oct 2026 10:47:10 +0800 (CST)
From: Pengpeng Hou <hppiscas@163.com>
To: david@lechnology.com
Cc: brgl@kernel.org,
	linux@armlinux.org.uk,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	hppiscas@163.com
Subject: Re: [PATCH v2] ARM: davinci_all_defconfig: enable the current ST7586 symbol
Date: Wed, 14 Oct 2026 10:47:07 +0800
Message-ID: <20261014024707.77051-1-hppiscas@163.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <c2dcc1be-ede4-4f80-83ed-3aeb0590f576@lechnology.com>
References: <20260814075624.16639-1-pengpeng@iscas.ac.cn> <c2dcc1be-ede4-4f80-83ed-3aeb0590f576@lechnology.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3f2Et7c5qnkk1Eg--.60824S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjfUeb18UUUUU
X-CM-SenderInfo: 5kssx2xfdvqiywtou0bp/xtbC7Q7UnWrO7S6BLgAA3i

Hi David,

Please add:

Fixes: 9b8f32002cdd ("drm/sitronix: move tiny Sitronix drivers to their own subdir")

That commit moved the driver to DRM_ST7586 and made TINYDRM_ST7586 a
promptless compatibility symbol defaulting to n. The old defconfig entry
therefore stopped enabling the driver at that point, before the broken
compatibility layer was subsequently removed.

Thanks for the review,
Pengpeng

