Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794559001;
	b=0xkJHaGrOilWxVaN+CfLZu+8ZlqEvTLBiVeWFZH5sJ9dR/eZpMyptf5bYVwrDc/fVLmS
	 x0A4bRJfoUhOFEAsGOKtocWaeO+nR9flC9e9DwKy8LCMzbU516KhdZl2jfFf5Z6+DvNMB
	 Zp7JNCPGHG7xxcEbNsxizgvwTKuzZwIrAr19WYXpEAjZcIeaYfpTv1j6AcCiKb7wuFnOX
	 5QMOL00EySHJdQ2inIwOE7lGZ7Nfhl6scyvrVoruekU/1a/11Fgg6DO8vlpxGwu4AvJLZ
	 ffHTjIRx7l/N1EytkG9PyJuWo9bZelrGzLpEhXWb3OcVMk9vPgohw7JG5tj4jBUY8CA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794559001;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=E3lHodQg1lTjOF3LmJS9PRbvpb2azBjAi+ojVts58nc=;
	b=leJAfMmBtZQuSncHH4WbyZIJadAORft9xvuaQNo0yg+trgVyZupm3LVJCWigRsyEy9yF
	 axrBlulQp5v1aHGVETRSbYUx4X7NsoXrEYjY1Ra2KnGDnj1cqR2Qbt8Ocmf6z9werQRqZ
	 fiSa8ckwLMGnaN9qHaerEpA3HW5of/hkasCv3VecWro768f8B/gHjZ/mk2Z54522HQGGS
	 mxoiZiDeoT9b82KIi/3T7jWzngwg9cPhpQa2LlPZ5TKngwursUOwIwClWs8v8B8kbeyca
	 QgQKPWnZTtJtBtfRXl+ghAYnt1DR64b+ww82upNeC/+SZAgPMR+GIH6SpooiOYElzMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=YgTLFPoz;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4208606A890;
	Fri, 13 Nov 2026 08:36:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4208606A890
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=YgTLFPoz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding; bh=E3lHodQg1lTjOF3LmJS9PRbvpb2azBjAi+
	ojVts58nc=; b=YgTLFPozytEYjXcVIhR3ENpkZFqkUJFBz/4TMIsPYTKWC0rIQI
	gauGpMJCqHujBv+sLjU7K3XShhYKUmVkh1jFnwN+NUeVOs5OlGZSxVMD2vaP2LAH
	NyhqlDXTvP8hZRYtrMjDFVwF8nLoLVH3qhG18Qcr+PwaUklNnGVoZUa2c=
Received: from xuqianhui.ustc.edu.cn (unknown [114.214.188.15])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgD3g0j_y_Zq+ze4AA--.520S5;
	Fri, 13 Nov 2026 16:36:21 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	konrad.dybcio@oss.qualcomm.com,
	dmitry.baryshkov@oss.qualcomm.com,
	abhinav.kumar@linux.dev,
	jesszhan0024@gmail.com,
	taniya.das@oss.qualcomm.com,
	andersson@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH v4 3/3] arm64: dts: qcom: sm8750: describe all MDSS block resets
Date: Fri, 13 Nov 2026 16:36:15 +0800
Message-ID: <8a0c75949fcf428a2163a2e63b27fcf08d3b4f9c.1794558882.git.xiaqinghuan@mail.ustc.edu.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1794558882.git.xiaqinghuan@mail.ustc.edu.cn>
References: <cover.1794558882.git.xiaqinghuan@mail.ustc.edu.cn>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:3pYKCgD3g0j_y_Zq+ze4AA--.520S5
X-Coremail-Antispam: 1UD129KBjvJXoW7Ww18CrWUAF4xJryfKry8Krg_yoW8GF4xpF
	1DCa17Ww1v9a4F9ryjqrWYgw4rG3Z5try5G39xG3yUK3ZxJwnagrn3tFsagFyDCFs7Wan5
	WrW29FWIqF1kA3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPCb7Iv0xC_Cr1lb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
	8067AKxVWUWwA2048vs2IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF
	64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcV
	CY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv
	6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c
	02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE
	4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7
	CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l
	x2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14
	v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IY
	x2IY6xkF7I0E14v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z2
	80aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI
	43ZEXa7IU1CeHDUUUUU==
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiAREJB2r0wlk29gAosz

The SM8750 display clock controller provides, beside the MDSS core
reset, a block reset for the MDSS core INT2 interrupt controller.  The
MDSS node is an interrupt controller in DT and the DPU takes its IRQ
from it, so INT2 is part of the same block, not a separate device.

Bootloaders hand over with the display block still running, so describe
both block resets and let the MDSS reset return the whole group to a
known state before any display hardware is programmed.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index dd738d13df8..e8e2832f918 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -3071,7 +3071,8 @@ mdss: display-subsystem@ae00000 {
 				 <&gcc GCC_DISP_HF_AXI_CLK>,
 				 <&dispcc DISP_CC_MDSS_MDP_CLK>;
 
-			resets = <&dispcc DISP_CC_MDSS_CORE_BCR>;
+			resets = <&dispcc DISP_CC_MDSS_CORE_BCR>,
+				 <&dispcc DISP_CC_MDSS_CORE_INT2_BCR>;
 
 			interconnects = <&mmss_noc MASTER_MDP QCOM_ICC_TAG_ALWAYS
 					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
-- 
2.53.0

