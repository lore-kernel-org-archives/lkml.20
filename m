Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5294E47729B;
	Sat, 26 Sep 2026 14:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790431826; cv=none; b=PlTN9GuD7meM+g2sJRYJz7tKHB6YeLBc1ufwSTbLIF325MV07VW1+PsMaLN8PWgyT6+Wp9BUe4noZNV7MrFD0hEAV9elQqTFsrJWXJI77SviTg6QH36XPqDjKSj3tYCvw7v/RVSyZBujj+ZKEtTLXbdtU6QQNkwEbqxx2vJue8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790431826; c=relaxed/simple;
	bh=JbDw+MUBwd1NuaHHbIXA89TRUzB3TM4Iy66hoxwmdYA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Qlw6RJCaoq40N1kQRWd37CvGJw25JosMs66Zp6+aPCATsa0RkQFN3/q23DSyomq6QYnnBbRrExiKgKvs+oC9FMJZMp9d7R1CfagtYL/SlY4p8b8civq2yzFfuoClUGLDD+VNorE3hxkJPAHxZBAsUH8V4rmv790dDjGBI5+60EA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn; spf=pass smtp.mailfrom=seu.edu.cn; dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b=nx2rAX/f; arc=none smtp.client-ip=101.71.155.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b="nx2rAX/f"
Received: from seu.edu.cn (unknown [58.241.16.34])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4f321466a;
	Sat, 26 Sep 2026 22:10:12 +0800 (GMT+08:00)
From: Slavin Liu <bolin.liu@seu.edu.cn>
To: error27@gmail.com
Cc: shengjiu.wang@gmail.com,
	xiubo.lee@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	bolin.liu@seu.edu.cn
Subject: Re: [PATCH] ASoC: fsl_asrc: check the second front-end DMA channel
Date: Sat, 26 Sep 2026 22:10:11 +0800
Message-Id: <20260926141011.451552-1-bolin.liu@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <arfGajXmMUeew0fr@stanley.mountain>
References: <20260913125147.109920-1-bolin.liu@seu.edu.cn> <arfGajXmMUeew0fr@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa0de0d5af503a1kunm7bc9a132185a52
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZH0IfVkhCHUJIGE1PSE5MGlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlOQ1VJT0pVSk1VSE9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhOQ0
	NVSktLVUtZBg++
DKIM-Signature: a=rsa-sha256;
	b=nx2rAX/fYSaniaSuVhhX5H2iMYMQeNlAyPksRDdNVsEBeimgggPGhO8A8sDBPOXsOCk6JzAmbv6lOT/bjyhI+/A4IcMKEwAf1zZ8S7l/YpJeY9ccwaVHr5HRCq7ZENpkcB/FQ2UsXlEGbYK5CPMFLa72IWMAFnZirDrK/siPYjE=; c=relaxed/relaxed; s=default; d=seu.edu.cn; v=1;
	bh=tn+AKePJ/UjAryEvi5oaTWRovtAQRbYO7Jysf+KDOFs=;
	h=date:mime-version:subject:message-id:from;

Hi Dan,

On Sat, Sep 26, 2026 at 04:19:38PM +0300, Dan Carpenter wrote:
> The ->get_dma_channel() function pointer returns error pointers not
> NULL.
>
>     sound/soc/fsl/fsl_asrc_dma.c:254 fsl_asrc_dma_hw_params()
>     warn: 'tmp_chan' is an error pointer or valid
>
> sound/soc/fsl/fsl_easrc.c | (struct fsl_asrc)->get_dma_channel | fsl_easrc_get_dma_channel | 1
> sound/soc/fsl/fsl_asrc.c | (struct fsl_asrc)->get_dma_channel | fsl_asrc_get_dma_channel | 1

Is this a false positive?: both implementations return
dma_request_slave_channel(), which is an inline wrapper converting the
ERR_PTR from dma_request_chan() to NULL before returning:

	static inline struct dma_chan * __deprecated
	dma_request_slave_channel(struct device *dev, const char *name)
	{
		struct dma_chan *ch = dma_request_chan(dev, name);

		return IS_ERR(ch) ? NULL : ch;
	}

So ->get_dma_channel() return NULL or a valid pointer.

The same function backs this up: the persistent Front-End channel a
few lines above comes from the same function pointer and is checked
with !pair->dma_chan[!dir], while the Back-End channel is requested
with dma_request_chan() directly and uses IS_ERR() -- the two check
styles in one function match the two APIs.

Best regards,
Slavin Liu
