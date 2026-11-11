Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=218.76.62.146
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794367768;
	b=rGu6afYu7LxG+1mhqeF8b3oywg6sW1ucDtfXeqIsd1f/B8HQWn6uaJeG5FXvkYsM1H7n
	 u8VkzmRWyHjm+CxET9eMsG9kOdG6exxJ/cd26/HaHGm3Enwx+4faTD11+FojgT316kMqq
	 HYSqREUKTmRaLL6bCk9ipTItzedJ1qOsqw01Rkan4OcQe8px7+aYkuSVCiahj3fOmC1hp
	 6cmyGQSKoTfELG4Kns4pzCzW92JnbSP9zMARZIBmWup51wHoQjsterh5xcDiFpSNqn/DU
	 LSLRAFg0xGBpb7asNC8oXy8C+/4gqUuaTrL4eLMFGfaCDXqSUiuph7/2U0JyQBwuIqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794367768;
	h=DMARC-Filter:DKIM-Signature:Received:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=63zja+L/Zy4k27NBr3ncpDsv78yUrecMVA9G5WJb/kI=;
	b=bT6EgBEjqbSsuthvi2KB9mmd5Cn2PUSTnkGsp2Ke1X7YSP47iFC6KmuRlA209LmnIho3
	 eq4CNFYClszXk0obRgpLUcd+Gnrc+rGVjrpzVPn0qBTPUkm3Mb6f3/920tYbXJNiWrYjC
	 D/GLKNAm/gVfZ+AjJ5bpl9c3WYqQxuG07QpyywJGsSdBhsGY5VxricpIclrAiICk/hHhO
	 YL4Muk5euAqXckzZ0Eq8YcvrFasqS0yjBRoYwBHd6iwX5nx3Y8e5ogSnpLgRGCPv5AyCZ
	 MH+rTdk5c3788bx6CqfkpAIGe3axq1OM0eIAvr2yV9MhTE6+bqqgXIxMNFqJHfOYRtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ultrarisc.com;
	spf=pass smtp.mailfrom=ultrarisc.com;
	dkim=pass header.d=ultrarisc.com header.i=@ultrarisc.com header.a=rsa-sha256 header.s=dkim header.b=I7Cn0PHQ;
	arc=none smtp.remote-ip=218.76.62.146
Received: from ultrarisc.com (unknown [218.76.62.146])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D12B1606A320;
	Wed, 11 Nov 2026 03:29:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D12B1606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ultrarisc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ultrarisc.com header.i=@ultrarisc.com header.a=rsa-sha256 header.s=dkim header.b=I7Cn0PHQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	References:Date:Message-Id; bh=63zja+L/Zy4k27NBr3ncpDsv78yUrecMV
	A9G5WJb/kI=; b=I7Cn0PHQVkPhjY5CtZ1CqhgDvxD2nlQ/lvN8oDMnjC+3creiz
	n0TUH4I4Y2LVToxxij0aHrRVfM1OJ9uN+ErlVmZvQY7xN6ksd98kK3y8ZZuve17P
	61YV62eJyMuWyX4O7Muoz9iG8f07K3q8UD+acEVcp3VmP3eFj5U50I5ZVw=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwC3cwXp4PNqsMYDAA--.1209S2;
	Wed, 11 Nov 2026 11:28:46 +0800 (CST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v7 0/7] riscv: Add device tree support for UltraRISC
 DP1000
From: Xincheng Ji <jixincheng@ultrarisc.com>
To: Conor Dooley <conor@kernel.org>
Cc: Xincheng Ji <jixincheng@ultrarisc.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Andrew Lunn <andrew@lunn.ch>, 
 Jia Wang <wangjia@ultrarisc.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Anup Patel <anup@brainfault.org>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@sifive.com>, linux-riscv@lists.infradead.org, 
 Conor Dooley <conor.dooley@microchip.com>
In-Reply-To: <20261110-amused-strobe-d6cf2bf24861@spud>
References: <20261025-ultrarisc-dts-v7-0-621eca2b8790@ultrarisc.com>
 <179419183382.2791817.17305257804227954338.b4-reply@b4>
 <20261109-december-oil-cb6524baf274@spud>
 <179427984780.3452989.12543035151641565906.b4-reply@b4>
 <20261110-amused-strobe-d6cf2bf24861@spud>
Date: Wed, 11 Nov 2026 11:28:46 +0800
Message-Id: <179436772613.807980.10142857721315033398.b4-reply@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794367726; l=395;
 i=jixincheng@ultrarisc.com; s=20260922; h=from:subject:message-id;
 bh=0SLf2nrrfMV2vgx/6JNw0ABQWLCUVi/sJj65uSmx73I=;
 b=RFs5OaD1kZIBTupWsAhefRjCEbpw/lYIweCHEWGWuBJKCN8xqcuxmtCZVTy9rdKK8VSydaR5A
 CDNSLgnRoIZDTJGgvHik5QHd6K4OnlcqFIs43D0xrpdU79O3ck56E9V
X-Developer-Key: i=jixincheng@ultrarisc.com; a=ed25519;
 pk=n848dcS5D6g0vLad/rjp4Gf/1eedTe1a3pYUrkt2260=
X-CM-TRANSID:AQAAfwC3cwXp4PNqsMYDAA--.1209S2
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUYG7AC8VAFwI0_Xr0_Wr1l1xkIjI8I6I8E
	6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28Cjx
	kF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8I
	cVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r1j6r4UM28EF7xvwVC2z280aV
	CY1x0267AKxVW8JVW8Jr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE
	5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeV
	CFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1l
	FIxGxcIEc7CjxVA2Y2ka0xkIwI1lc2xSY4AK6svPMxAIw28IcxkI7VAKI48JMxAqzxv26x
	kF7I0En4kS14v26r4a6rW5MxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_
	Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x
	0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8
	JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIx
	AIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbQVy7UUUUU=
	=
X-CM-SenderInfo: pml0x0xfkh0wg6xo325dul2uoofrz/1tbiAQAIDmryvzAAHwAAsP

> I suppose I can. Send a new version with your name instead of Jia, and
> add my git tree to the entry for now:
> https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/

Hi Conor,

Thanks for picking this up. I'll send v8 with myself listed as the
platform maintainer and your tree in the MAINTAINERS entry.

Thanks,
Xincheng

-- 
Xincheng Ji <jixincheng@ultrarisc.com>

