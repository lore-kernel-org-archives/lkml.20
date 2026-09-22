Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD922D6E64;
	Tue, 22 Sep 2026 07:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790060811; cv=none; b=or+ob1/1II8mIwYxHOZ9r0rd7retIpHaQi130gguWgN4rJ15SdAiFuZA4682YNlACRHC7NG71Bcmy6z8PuB9pr/4vVEm24LOOrUV0GbkdVlrySpUUrIIlh7aWvGiVi3UXXsYZo/ZpMgRetvlcR5kvDqn7YuCB+X/NgLV9kScs3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790060811; c=relaxed/simple;
	bh=8gHBrfUpuxlzN8RzPMywN52CN2og3obj5+67Nm9J6xo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jEi9njVDOTpzkHEiSIigMb191uiWGJTENjikLLTQqGW00yYZL1LAwusGAX3bk65RfbYi1SH6ZNLzVq2WHXrMP8S3zFRwM7m2gM5/bHmRLkAChC+cfDimwcALlwTmPDX82Rnu12WR+dpOqh7TRyZo2NIKIqpxjDSqKTCpjMvkVqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=N8IA7UN+; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="N8IA7UN+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=65
	2+tJNbWYlknjwriR8X/YtNO7E4f2P6OvwJy7vpsFA=; b=N8IA7UN+OPDZPai0CU
	m6bM0TFT2mQ7R2MRRZcnH1Px8IghzN2VW8wCUeuGYTNADtkWfqAmTFJwjzrweIrn
	LRnt6lhBRMLwBST6btcjy16OmvLupN2Idtvh21BaaEy20iYhxKi9SjWyYOhiy8Qs
	CdhjE+p1czoQrOf4kOWiMDXLI=
Received: from chaosheng-ASUS-TUF-Gaming-F16-FX607JV-FX607JV.lan (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wD3V8v1KLJqX01EAA--.19969S2;
	Tue, 22 Sep 2026 15:06:30 +0800 (CST)
From: Quchaosheng <quchaosheng000406@163.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	quchaosheng000406@163.com
Subject: Re: [PATCH 2/2] docs: kernel-parameters: fix a truncated sentence for preempt=lazy
Date: Tue, 22 Sep 2026 15:06:20 +0800
Message-ID: <20260922070620.70180-1-quchaosheng000406@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260921113326.MTXJ89aP@linutronix.de>
References: <20260921113326.MTXJ89aP@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3V8v1KLJqX01EAA--.19969S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjfUjUDJDUUUU
X-CM-SenderInfo: xtxfxtprvkv0bjqqikiqw6il2tof0z/xtbC5BaOBGqyKPbqMAAA3k

On 2026-09-21 11:33:26 [+0200], Sebastian Andrzej Siewior wrote:

> I think if you do "preemption point" the sentence becomes English again.

You are right, and it is a better fix than mine. "One preemption is when
the task returns to user space" becomes:

  One such preemption point is when the task returns to user space.

I will use that if I resend. Holding the patch with the other one in the
series for now.

Quchaosheng

