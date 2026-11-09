Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=218.76.62.146
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794191892;
	b=uxof21ioYHWXbpv09a5JhxsYIdgk0ftMnxqLnfiR/OllppGHZhvEuTa0vmwYpQlEPceE
	 3NgQdD8HsCRMOr1Z/6j85jEfPKZZeVjS08OfcpmxxhU5yzG80x4nU2YYik9eCqZgzk2bS
	 Z73eqUvLSBe8O5c5rp6GAWywlL7wzzjr6sYD//v6Oh49DlIyugXy/A0UTzGKAxl4u/+Fq
	 VNbStnhQ+/pZRYVHvvMDl2GTYpyzAGT1eSLCUTmAaROYed+SDrsD0Jtx8LWEd8+wQstJm
	 0ivhAVjixwsQ+q06gbsaflclXQg+PSYvVj2KOoaPxNZPC0Ya61hDQ77dHiIG3IVKpWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794191892;
	h=DMARC-Filter:DKIM-Signature:Received:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=62e392DU1DrlXWGc+bil/alPKZVCZVrzv976HNSepMA=;
	b=yabeUQgIt4MPe6vGxITrFpPx1aiuj9YXDwITviNi8SqyoY8tZ3FNkjS30bpVnVlqWcF7
	 J1ggoVroqUu0bOsUSaWdFWuhjcikmUSkvLTPMmqJbfe9DjA1qFU9mmfyt43bVCIXI3Rcx
	 B1NPc9IXi2gv6ZclQuQqTceh6q195+VMGkqcwYHw22Gj3wwnQjAQ0RD7AjkSzdA4d8nt6
	 RrnAe/j9vt44RH4ekxnLR/sB/7IQDUU7q1O3u8T0zOJl/9B2fxUomMnBPNwKkG8kVAUkY
	 IlF/G06nEic/GT8NQc2GG4xSkVvInsnx08cpO2ZK80AcPHntIzoumqs+7VaLum0IbvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ultrarisc.com;
	spf=pass smtp.mailfrom=ultrarisc.com;
	dkim=pass header.d=ultrarisc.com header.i=@ultrarisc.com header.a=rsa-sha256 header.s=dkim header.b=Px2vhO8F;
	arc=none smtp.remote-ip=218.76.62.146
Received: from ultrarisc.com (unknown [218.76.62.146])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C66B606A31C;
	Mon,  9 Nov 2026 02:38:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C66B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ultrarisc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ultrarisc.com header.i=@ultrarisc.com header.a=rsa-sha256 header.s=dkim header.b=Px2vhO8F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	References:Date:Message-Id; bh=62e392DU1DrlXWGc+bil/alPKZVCZVrzv
	976HNSepMA=; b=Px2vhO8FXHHr1QlFO973/QQANWpEe4IAD/gF7DMuHn4a7vONw
	oVPic8PtO8TBwagdKzIgwSrkZWKPaaICe+9l2OlmqEXGzv9NJfCzbTRJjbSq7LHm
	cMPuyseC7EofnQpSU4+xAhXwoQdySMgIg3F2c3j3Zzt6Rdbmz0k9BpA2kY=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwDnrwbVMfFqCawDAA--.1441S2;
	Mon, 09 Nov 2026 10:37:15 +0800 (CST)
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
To: Xincheng Ji <jixincheng@ultrarisc.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Andrew Lunn <andrew@lunn.ch>, 
 Jia Wang <wangjia@ultrarisc.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Anup Patel <anup@brainfault.org>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 linux-riscv@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>
In-Reply-To: <20261025-ultrarisc-dts-v7-0-621eca2b8790@ultrarisc.com>
References: <20261025-ultrarisc-dts-v7-0-621eca2b8790@ultrarisc.com>
Date: Mon, 09 Nov 2026 10:37:13 +0800
Message-Id: <179419183382.2791817.17305257804227954338.b4-reply@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794191834; l=353;
 i=jixincheng@ultrarisc.com; s=20260922; h=from:subject:message-id;
 bh=RT6SE3Lf2ZsuoPOTBdd55N72LgL+cuUbZ1aU9KTXVIQ=;
 b=d3YO63Kc7223iJpymiMjOHrM2CsJ/6HY+c/2ndCo0DfQBhfFXkdTAVK+vuVOh8zvIvMoep0Js
 jrROUzMyFN+A5Y3H6aGA4DCFZaKAg45OzAIcbhqr2/qLhSd9y1XM5eR
X-Developer-Key: i=jixincheng@ultrarisc.com; a=ed25519;
 pk=n848dcS5D6g0vLad/rjp4Gf/1eedTe1a3pYUrkt2260=
X-CM-TRANSID:AQAAfwDnrwbVMfFqCawDAA--.1441S2
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUO17AC8VAFwI0_Xr0_Wr1l1xkIjI8I6I8E
	6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28Cjx
	kF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8I
	cVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r1j6r4UM28EF7xvwVC2z280aV
	CY1x0267AKxVW8JVW8Jr1l0xvY67AC8VAFwI0_Jr0_Jr4le2I262IYc4CY6c8Ij28IcVAa
	Y2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4
	A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F
	5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc2xSY4AK6svPMxAIw2
	8IcxkI7VAKI48JMxAqzxv26xkF7I0En4kS14v26r4a6rW5MxC20s026xCaFVCjc4AY6r1j
	6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7
	AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE
	2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcV
	C2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2Kfnx
	nUUI43ZEXa7VUUq-e7UUUUU==
X-CM-SenderInfo: pml0x0xfkh0wg6xo325dul2uoofrz/1tbiAQATDmrm4a4ABAATsI

On 2026-10-25 20:24 +0800, Xincheng Ji wrote:
Hi all,

A gentle ping on this series adding device tree support for the
UltraRISC DP1000 SoC and the Shenzhen Rongda M0 and Milk-V Titan boards.

Are there any remaining issues I should address before the series can
be picked up?

Thanks,
Xincheng

-- 
Xincheng Ji <jixincheng@ultrarisc.com>

