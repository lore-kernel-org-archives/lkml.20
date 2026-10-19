Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5059A364934;
	Mon, 19 Oct 2026 08:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792398494; cv=none; b=ZSHfe/eD2vmoKL7B+tKsjbJ2hESCNeM/EF7geNMNTSH+L4KYiCZhr32TqlyRYV2l05gShImWQglNvslYxsD5e+eUDyYEvb+tASlhZX9ihXd88GQkMFZg8WdctYM9CCjKw6+wCQ+zN5KJqKELkQGLwPaUxPEa3f+dZRLNfAJGywk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792398494; c=relaxed/simple;
	bh=5FOCCrPTKhC8zbp0t5lSt4Ld4zK4DSviiDAMn3zLDIU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=LCD0CI8hrHhwK3RII8nN1TwXlxhjzDBSSUB3jIWAGy2QKbr+M1Gx6MOO+bC8n/EBNuzKuM9E96lMGNknSikCFUvGi1v9P0MrMOZFK8/aYw2zvFG5PoFADfIr554XFf3CN5WzM43qZzj1j9HWW23BHTefM++0KufMtD8eaE5nHBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Zh+zSwWm; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Zh+zSwWm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=MT
	Pv5yHBvNvCh2ll7XQ8lzCfFvg7LEM3bzuL+/wpiMc=; b=Zh+zSwWmTC1J1ZJ+uI
	NR5cn7nqfs0/izTsrXQgwtbwE8Rtrm20yV6rVODKPIqabWc9DWU9tltvJfuyBFFn
	uim7lLwjIixsWIQrG6o8nUkYwX73N25JoSlXiS6HKl5wTDS0aooNQkCCa+L5I3jQ
	d4dxTofi1BPIWS15vYLXbZ3Bc=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wD3H8GM1NVqEBsIBQ--.60267S2;
	Mon, 19 Oct 2026 16:27:57 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Ming Qian <ming.qian@nxp.com>,
	Zhou Peng <eagle.zhou@nxp.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH 0/2] media: amphion: handle runtime resume failures
Date: Mon, 19 Oct 2026 16:27:52 +0800
Message-Id: <20261019082754.1806443-1-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3H8GM1NVqEBsIBQ--.60267S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKF17Xr17GrWfJF48tr48tFb_yoW3Crb_W3
	4FqrZrXw1kJF9rCa47GFnxZa42grWkCF18Xa4Yqr1avFyfZFWUJr1Ygrn5u3W7Ja1Yvas5
	GrZxtFy8XrsxGjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRKc_-5UUUUU==
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzg1oomrV1I3dZgAA3U

The Amphion core request, resume, and debugfs write paths assume that
pm_runtime_resume_and_get() always succeeds. If runtime resume fails,
these paths access VPU state or hardware while the device is unavailable
and later drop a runtime PM reference that was not acquired.

Check the resume result before taking the dependent path. The core patch
unwinds its lock and avoids VPU access, while the debugfs write handler
returns the error before accessing the core.

Jiale Yao (2):
  media: amphion: handle core runtime resume failures
  media: amphion: handle debug runtime resume failure

 drivers/media/platform/amphion/vpu_core.c | 13 +++++++++++--
 drivers/media/platform/amphion/vpu_dbg.c  |  6 +++++-
 2 files changed, 16 insertions(+), 3 deletions(-)

-- 
2.34.1

