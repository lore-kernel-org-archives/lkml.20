Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794585381;
	b=ejXrisE0P/B535os6UTgcgLAlyI7SMQkTrA9aVE9e/l8y3BMpi3r9oKGHmjD5YdiZIS+
	 MyBwYxdNNWEULAzh1RGFiHOYcEf9y8E2Lrg1UVuW0iB/ytgABOZp0RETfUhv0dJ4eKnk0
	 +et3N1FKjXBbfMODFHxmyAb0jwptyrRP71S8bAxOOy0fFvxyh3znV/4oTSCG57D0k2ttf
	 MsE9LbbWx2mkHFVf6QXzrf1jx9wfdLsl6UhosaS0qlkAZwLz7gY/FmDmkYnlAyQonCSno
	 4/XyAtUkvWLsnkjIpj7BjOlKv+iya5sluhjovFO2sjIOHWfXXJvwTxFU0+FWJrD8GJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794585381;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=O/C1Sngj/PBuWLi5GwZyVNwyXbkT3sPLrX9t731M1Ys=;
	b=l/RC7hFbSCqtj+R14Ud9o8xjMIfMsuOJX7kQyOtqpxuPcTx2E6OTeCgj5XgXl6Fi8GdW
	 BDyO0gg68YUigcVpnRL/crm9Gm9r/Wl5NNqc3XwDOYPiizyIzSel2KLobScgbk4838ZXj
	 D5mZrSfPLf3XLGPMIEV5V+/WNrf/Jaqe6zSUxJwGQiQlH9aEhPjv5QyVLcyh2ZJWZ8lD+
	 7Xv7phYEuw54vGscPwiFCCYT4y0buzwP4JL8iGfMANlHPlZ1wLMpeCTAxsnpCIyP+A1cd
	 SDr+k+a1WYoATbBA2nh12X0Ph4bzfmpU+HCWPO4MRqJ+zeGLrc8mDObSM/eklgqYRCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=Q6WlWWke;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4751606D46F;
	Fri, 13 Nov 2026 15:56:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4751606D46F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=Q6WlWWke
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding; bh=O/C1Sngj/PBuWLi5GwZyVNwyXbkT3sPLrX
	9t731M1Ys=; b=Q6WlWWkeMJWSte2kfQrwcGvGDnsR7ymcDNPBZNi1ASlUDw8bib
	ckxsoFC4fhkw53qGjdG6p1iV8QN5SJ3b+o+fO+rX8dzXlzxhG8bbEOH/MhjW/7zP
	Puk7C+VW4sQs9CSpJvVUC4BSi2JnjIhw7+mNW/Uk1Gfe3wIrhT5+1XRHY=
Received: from xuqianhui.ustc.edu.cn (unknown [114.214.188.15])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgC3KS4WM_dqbQ66AA--.937S5;
	Fri, 13 Nov 2026 23:56:12 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>
Subject: [PATCH 3/3] arm64: dts: qcom: sm8750: describe the second MDSS block reset
Date: Fri, 13 Nov 2026 23:56:06 +0800
Message-ID: <20261113155606.1677313-4-xiaqinghuan@mail.ustc.edu.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261113155606.1677313-1-xiaqinghuan@mail.ustc.edu.cn>
References: <20261113155606.1677313-1-xiaqinghuan@mail.ustc.edu.cn>
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
X-CM-TRANSID:3pYKCgC3KS4WM_dqbQ66AA--.937S5
X-Coremail-Antispam: 1UD129KBjvJXoW7KFy5Zw1DAw48XFyDZFW7CFg_yoW8uw18pa
	17Ca17Wr1v93WFgw17KrWjg3yrCwn5KryUGFZxK3yUCwsxtFnxXF93KFnagFyUAFs5ua1r
	WrWagr4IqF1kA3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBqb7Iv0xC_tr1lb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
	8067AKxVWUWwA2048vs2IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF
	64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcV
	CY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv
	6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c
	02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE
	4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82
	IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC2
	0s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMI
	IF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF
	0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87
	Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7IU8oSoJUUUUU==
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/

The SM8750 display clock controller provides two block resets for the
MDSS core area: DISP_CC_MDSS_CORE_BCR and DISP_CC_MDSS_CORE_INT2_BCR,
at 0x8000 and 0xa000.  The second one belongs to a domain that dispcc
describes with its own GDSC (mdss_int2_gdsc) and its own clock family
(disp_cc_mdss_mdp1_clk, disp_cc_mdss_ahb1_clk, ...).

Bootloaders hand over with the display hardware still running, so the
MDSS reset should return the whole group to a known state before any
display hardware is programmed.  Describe both resets so that the
array-API change in the previous patch asserts and releases the group
together.

On this board, resetting only DISP_CC_MDSS_CORE_BCR leaves the display
intermittently broken at cold boot (command DMA timeouts followed by a
panel init failure, 5 of 9 cold PORs), while asserting the group gave
15 clean boots out of 15.  That measurement used the three-reset shape
that also included RSCC; it has not been repeated for this two-reset
shape, and the second reset has not been isolated as a single variable.
What is observable is that resetting the group correlates with a working
display at cold boot.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index dd738d13df..e8e2832f91 100644
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

