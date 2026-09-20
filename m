Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151903655E7
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 10:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789901985; cv=none; b=sujCEdVMPg7G7kaBkqeg4hwdCEq7vKSyf5dNiiugPyRjXN5TuuAghb+Wq95526UB8auujS0KXjz2sc4yMt3M128/COzdoj/dlCCEvN7/6B9hC3oH+1WcUOjUNX3UbnVzrm8tGtz99YcH0DqfeF7krtsdj8kAL+uoJ4M5hoUvWo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789901985; c=relaxed/simple;
	bh=qP7BZyqYOdBQ65RcQ4iiHNxUFpSD4qzk8uvRGQo2bdg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=op8tkc9lf2g/E0ih8ZnTc9lDIval2mcEetOt50TwKqbsYaiJUOc57Ie6x7j/k6q7jVKMvP66qMOAyq/JFGeTu6XkUpVF5rnn8xgszdJUryxH8ENzhecCebHsD28YaNSaCAVhc14V4LFXbwalgI5TDAFswO3mwxR8/lQ3xdx2nl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Rcw76BGi; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Rcw76BGi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:Content-Type:
	MIME-Version; bh=qP7BZyqYOdBQ65RcQ4iiHNxUFpSD4qzk8uvRGQo2bdg=;
	b=Rcw76BGi1nVNBTMvFjb01jgi3+CZ0Gkx207i3iKNEpI25/7C5vXAuVoKAysfuE
	okmKVtqRWwdyEOvU0g2OUWEbZimCzYJRczfrPUHphigFcZyrCuLDlY+Wa/XEePLS
	91GCVLvDx3752BBw+S7FifQKKvV1b6c+BfaxUyp7KpvHE=
Received: from LAPTOP-EGO65D59.localdomain (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wAXnqmQvK9qJDq2Bg--.514S2;
	Sun, 20 Sep 2026 18:59:29 +0800 (CST)
From: =?utf-8?b?5p6X5r+s5ZOy?= <m18667909625@163.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, m18667909625@163.com
Subject: Re: [PATCH] kernel: add system_energy_efficiency syscall (nr 337)
Date: Sun, 20 Sep 2026 10:59:24 -0000
Message-ID: <178990196466.46951.9233256191978707743@163.com>
In-Reply-To: <20260920100714.46206-1-m18667909625@163.com>
References: <20260920100714.46206-1-m18667909625@163.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID:_____wAXnqmQvK9qJDq2Bg--.514S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjfU4LIDUUUUU
X-CM-SenderInfo: bpryllixzqmlisv6il2tof0z/xtbC4hLZ32qvvJIVaAAA3g

Hi Greg,

Thanks for the quick review!

You are right: GPU power readings are already available from userspace
via /sys/class/hwmon/*/power1_input, and display devices can be
enumerated through /sys/bus/pci/devices. I do not have a use case that
requires gathering this data from within the kernel, so please drop
this patch.

Thanks again for taking the time to review it.

Best regards,
林濬哲

