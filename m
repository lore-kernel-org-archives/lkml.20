Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793277173;
	b=Q6twtnQF/ddPsrwwAsnTWPF2UUN2tJQ84jE6v/9ej/gtHMPIIthTjoXqDQPnjyXaD4ze
	 aX9Qef6Pc+qNL9LZ6yxD2bOOLwb1DB4ZVMhuZm+B/6kIbTp49/L2JBk7XTo56H8WK36Du
	 G16TzIlN+SBlEt4/SiBl0H+cdVNCyQ963rZjoUuDffHTTu8bLman6AF5wEkaOIsGYLHxr
	 jUCGJjzKoVJvpnrx6V/I/dubArxrNMJ5YACcTCEsqB0teTT7ZPMxwNmDPyc6ZVT0rd+iS
	 s3uPzagQiR+CIajzPFedgUT1x7YwxnVR8QZgXEtODUw/dSRFwCrMEiScz3iBCBaiG2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793277173;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=as59LYxN0aioePkU/4k32aNSSAEcvGxtqVu6grquYmM=;
	b=HZ/rX6DPMTvzoa5bF8zDRQkTqxkc8F4fapKuNNO9eAkCtkT8wx8n4t1HyMnt8l3oy/kP
	 Cu8H2fTugG4dI2gud40A0VQb6VOmCn+C/Cf3J1PL6G/8HwdLFTDGGCkx+2y1QpEZgSjFk
	 en+kR0lFzPWYC4V+6jaDDhy31qPNLgjT9Q5eO9C5qZ8ZFJfsumjd1LKQ9pS2YTaNizFFw
	 eJAZSxvFDb8XaIl4goCAxgMgcv2QEM+LhDY363SwHtBr+io1yUrbR1pZ4VMaaUqBmd4Yp
	 DDJfj5/2r3CcvF/++cfaxp7krapH5nHHUmnYeLgmiYUrzJa8Ai86tJJIg7YCpKZnZAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=E2ir9Yg5;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D88F606A31C;
	Thu, 29 Oct 2026 12:32:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D88F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=E2ir9Yg5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding; bh=as59LYxN0aioePkU/4k32aNSSAEcvGxtqV
	u6grquYmM=; b=E2ir9Yg5HkSi7+qM+w1CWrIRgMfKgV1Pvh+P2XLOLNDAW0iXVv
	b6VXSUotapkcBQ1FU5tViCS/4e4Jf4+EDs4WPZO/5GzMqHgK4I5asER3TTFkXpeY
	DN/EBAgPjUFRnjkYgoU3Jlelgz7kCRu+etQjmNtKM8mwe/AEXcDHwImNY=
Received: from xuqianhui.ustc.edu.cn (unknown [114.214.224.240])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgCnHjPmPONqmPdgAA--.889S5;
	Thu, 29 Oct 2026 20:32:39 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] arm64: dts: qcom: sm8750: describe all MDSS block resets
Date: Thu, 29 Oct 2026 20:32:38 +0800
Message-ID: <20261029123238.29877-4-xiaqinghuan@mail.ustc.edu.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261029123238.29877-1-xiaqinghuan@mail.ustc.edu.cn>
References: <20261029123238.29877-1-xiaqinghuan@mail.ustc.edu.cn>
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
X-CM-TRANSID:3pYKCgCnHjPmPONqmPdgAA--.889S5
X-Coremail-Antispam: 1UD129KBjvJXoW7ZF4DZr4kXFy5Jr4rtFW5ZFb_yoW8CF1rpF
	1xCFW7Ww4v93WFgFW7tr1j9r15Gwn5Kr15GF9xG34UCanxJrn3Krn8KFs2gFyjvFWxua1k
	Zr17WFWIqFnYy3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmmb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
	8067AKxVWUWwA2048vs2IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF
	64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcV
	CY1x0267AKxVWxJr0_GcWl84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIE
	c7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I
	8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCF
	s4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACI402YVCY1x02628vn2kIc2xKxwCY1x
	0262kKe7AKxVWUtVW8ZwCY02Avz4vE14v_Xr1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC
	6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWw
	C2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_
	Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_Jr
	0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1U
	YxBIdaVFxhVjvjDU0xZFpf9x07bO4SwUUUUU=
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiAREPB2riTVZTsQBSs7

The SM8750 display clock controller provides, beside the MDSS core
reset, block resets for the MDSS core INT2 interrupt controller and for
the MDSS RSC.  On devices whose bootloader hands over with the display
block still active (PLLs locked, MDSS core / INT2 / RSC out of reset),
the kernel so far reset only the MDSS core and left the INT2 and RSC
blocks in the state left behind by the bootloader; command-mode panel
initialisation then fails with command DMA timeouts and the display
comes up as backlight only, without a DRM device.

Describe all three block resets so that the MDSS reset returns the
whole display subsystem to a known state before any display hardware is
programmed.

The reset runs after the display clock controller has programmed its
PLLs (the clock controller supplies the MDSS clocks and power domain,
so it always probes first).  The block resets do not touch the PLL
registers and no display pipeline is active at this point, so the PLL
configuration survives the reset and nothing visible can glitch.

Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index dd738d13df..950c528bc4 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -3071,7 +3071,9 @@ mdss: display-subsystem@ae00000 {
 				 <&gcc GCC_DISP_HF_AXI_CLK>,
 				 <&dispcc DISP_CC_MDSS_MDP_CLK>;
 
-			resets = <&dispcc DISP_CC_MDSS_CORE_BCR>;
+			resets = <&dispcc DISP_CC_MDSS_CORE_BCR>,
+				 <&dispcc DISP_CC_MDSS_CORE_INT2_BCR>,
+				 <&dispcc DISP_CC_MDSS_RSCC_BCR>;
 
 			interconnects = <&mmss_noc MASTER_MDP QCOM_ICC_TAG_ALWAYS
 					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
-- 
2.53.0

