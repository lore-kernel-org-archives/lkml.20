Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=218.76.62.146
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794279878;
	b=zJiXavNhQBaa770ISSAmeBlMh3L0rEEvMrXYH35GDBu7MUf8EFP1jrJ4TWJzdQfxj5Y7
	 fU4zZ3vprsBPvJ+YOZT7ePcbQbaoqAFimtdnQGXv8ke+qJDfXU3N7QLS8/ZmmX05jWjqG
	 +ZKjVQifElPTz4rCT5fYaY5VAzcZlNmXTVRUR/lZ2aXbLBGUVA85Gquw3KOvzxGXDi6Ic
	 5e95fm0BuoDAuWPXGWMJZN8fvYQe6Fhk8dRDEbl5s9u/ydJn7mRLCHvrpcLNjQ1I1bvNd
	 m49sLnfS221+x7gH/lT0P2Ap8LPX77ZIWeF1vKFdvw2a6b8+HywWoT/ZEuXtJED3sDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794279878;
	h=DMARC-Filter:DKIM-Signature:Received:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=4xiQhXRH8z/0o/LHnQmce5UJlHs8s87KBdTsEMBYeSg=;
	b=cK1Sena0FTKQIboZIs+Fj7KKGk5tZf5qSI+aAFMuBIspuyboTAeqDQudGqwjyG+RN5fB
	 VHC8u7wz6Pefc0EVr30QBl0OjRv7DINtn7ePIJyu/peRNiSE9Hm+Em/P6wskWgVTcCd++
	 vLR1++5lmPk026VKXI4rP16hNMqyLiK/WZ2k12T4UEqn8l84eUp74cTUQLqKnx0zEbefx
	 dgZjgzI3N9MUhI/NCIoutXO0VJemoN7cYSoDH0Bwkuxm4Cv74Y3KO45zRHASzpPsaAoBd
	 CeVaCcPEuSJqUuWi90dqcITv4Ean/898dY5SO8cTTEn/PWaI9aMxveYOg9UsWa2Iv/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ultrarisc.com;
	spf=pass smtp.mailfrom=ultrarisc.com;
	dkim=pass header.d=ultrarisc.com header.i=@ultrarisc.com header.a=rsa-sha256 header.s=dkim header.b=X4Fb+ra1;
	arc=none smtp.remote-ip=218.76.62.146
Received: from ultrarisc.com (unknown [218.76.62.146])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58D79606A31C;
	Tue, 10 Nov 2026 03:04:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58D79606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ultrarisc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ultrarisc.com header.i=@ultrarisc.com header.a=rsa-sha256 header.s=dkim header.b=X4Fb+ra1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	References:Date:Message-Id; bh=4xiQhXRH8z/0o/LHnQmce5UJlHs8s87KB
	dTsEMBYeSg=; b=X4Fb+ra1YJ1IDHPmdpdWNboPB3Q/AN+E69Vx2cbabTS/TK9Dz
	6sTh3/ENxz+1R2SGwDR2jK0wv9b4KWeX1rNJjbwulkRemxd9DFbbxSgsXoZ9HcLp
	Kp13uZGs1yhYtFXUkZZKq/oSDqQIAj+TcezFhAuo8lqjrtdDOCFNcpC56Q=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwC3cwWjifJqdbQDAA--.1137S2;
	Tue, 10 Nov 2026 11:04:03 +0800 (CST)
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
In-Reply-To: <20261109-december-oil-cb6524baf274@spud>
References: <20261025-ultrarisc-dts-v7-0-621eca2b8790@ultrarisc.com>
 <179419183382.2791817.17305257804227954338.b4-reply@b4>
 <20261109-december-oil-cb6524baf274@spud>
Date: Tue, 10 Nov 2026 11:04:07 +0800
Message-Id: <179427984780.3452989.12543035151641565906.b4-reply@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794279848; l=453;
 i=jixincheng@ultrarisc.com; s=20260922; h=from:subject:message-id;
 bh=AKmP8RKXVTpdxPdWVhnoAlrhLYhNlPvdKpQ6BfqIlWs=;
 b=x23kKOdwmsjgrKabUH1vUED8rhWivG6x8fw5ZWFFnwQOZiCXqye4K7J9v03fkW1Shsrmy+u8O
 MgNUBf6f9UIBHMsDFZrW48vLturGcuWO5EIeJr+WykDax/CPsMO2Duo
X-Developer-Key: i=jixincheng@ultrarisc.com; a=ed25519;
 pk=n848dcS5D6g0vLad/rjp4Gf/1eedTe1a3pYUrkt2260=
X-CM-TRANSID:AQAAfwC3cwWjifJqdbQDAA--.1137S2
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
X-CM-SenderInfo: pml0x0xfkh0wg6xo325dul2uoofrz/1tbiAQATDmrm4a4ABAAZsC

Hi Conor,

Jia has left UltraRISC, but the platform maintenance handover was
unfortunately missed. I would like to take over maintenance of the
UltraRISC platform and will send a MAINTAINERS patch adding myself.
The existing repository URL will remain unchanged.

For this series, yes, I was hoping you could pick it up while we
complete the handover. Would that be possible?

Thanks,
Xincheng

-- 
Xincheng Ji <jixincheng@ultrarisc.com>

