Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB3617993
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 02:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788314551; cv=none; b=KiXylH0q8qzwaGuTv5bHbm3J3q7/PDx3sdICq3WTnTchHBiXf8KIaf06SCoS6EDXQaJntWYJakNP+4NdTLfpj/K3w820CgsBCNBAqVVbDBrtBIU4uvu/evbzLpGtwPqEOms7Xp5/eJLhQChHHjFbQFP2K6/4pbEG5lncI9uTB9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788314551; c=relaxed/simple;
	bh=uBA2o+tRjVUDn9cEL518bm70ueIcO32MAZE5mkQCLyA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OynnBZsnWCf4bYv1GvLO8fv+EP6WfzlcehN0gSYFTNZAQQLE8C3PSZ93sOfYcJ+mJ4D/kruYDs7Gs2tNJbuYeBlmnD5jCl0g1bv/E691N8EOIWR3xQkxVwvNNIoLjr5wBFGM8cy1w5kzZUk3OFN5y0Uf+toDHYRXawECokZyvfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.241.250])
	by APP-01 (Coremail) with SMTP id qwCowACXa++lg5dqGpoHBw--.17299S2;
	Wed, 02 Sep 2026 10:02:14 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Anup Patel <anup@brainfault.org>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Thomas Gleixner <tglx@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Bjorn Topel <bjorn@rivosinc.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] irqchip/riscv-imsic: Use GENMASK for base address masks
Date: Wed,  2 Sep 2026 10:02:11 +0800
Message-ID: <20260902020211.10840-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <CAAhSdy35CocaJELiX=rMD3cuSsrsUo0wjF7xkoLGh-GXNca5wQ@mail.gmail.com>
References: <20260718040000.004.929c1ef2-caplitmus-rv@iscas.ac.cn> <CAAhSdy35CocaJELiX=rMD3cuSsrsUo0wjF7xkoLGh-GXNca5wQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowACXa++lg5dqGpoHBw--.17299S2
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUYd7AC8VAFwI0_Gr0_Xr1l1xkIjI8I6I8E
	6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28Cjx
	kF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8I
	cVCY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_Cr1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8Jw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAG
	YxC7M4IIrI8v6xkF7I0E8cxan2IY04v7MxAIw28IcxkI7VAKI48JMxAqzxv26xkF7I0En4
	kS14v26r1q6r43MxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4l
	x2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrw
	CI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI
	42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z2
	80aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUdHUDUUUUU=
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

Hi Anup,

This patch received your Reviewed-by on July 20. It is still marked New
in Patchwork, and I do not see it in the current tip/irq/core branch or
mainline.

Should I keep waiting, or would you prefer a resend rebased on the current
irq/core branch?

Thanks,
Pengpeng

