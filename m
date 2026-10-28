Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793158881;
	b=IaRTlBRTFpzk7M+RdnYL0X4Ia7x0jDRAx343cCjEguixjWDkcXeflmsgYXw1XoHCntIm
	 yBM5lE+khAj7AjMl+UwdA9+VKQHgc21QwmeeP9qJXCrTDOqtLMPhK5pcC9tBx4h66U02j
	 wuKf6CUteaXJPWZab0JwqD7Hm4+2yPsIfYkuPwAeUvkqEKzdwUkvcXdQcyv+qqSYmyCmG
	 227jMfPwsiXURirBv0hfCiyK7ZAexQJPIgjg1EhdzBm0wewitfSpaqjtDwxjLKBmG/SoH
	 JTt7KLDc0uOAUXpbqRIIdS3EbJzf5pRPK9pAmXt2FWzOnUCewMYa7nb1eOAOs9tOt2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793158881;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=iNT64UFrECXOpKzAsnWQFADTzrZ6WwoW3h+KEtTPrrU=;
	b=MLdaHh/LwF8TQh0YqHn/sBIaPiPyO2tPjP9YXZ72s3NbAAa3chveHoJw1Sg3SQfDj0P2
	 VBcaov+3CgM3n4CYeQeebBAnpIlnhWhcNKzxfn5o70iMuPBqMcvKSPly5HdnEUWM5SMRM
	 qxTlV48AUmmSo/w8h4hEyAiXZl3hpRfDDkvD9WLvJe6knoUqBuX/JbLqhC/t+x4iPibaB
	 87ZvHUr10Rlq8fbUIrytj8ygsMlclfROsK8y6WMhn5LUGMCb/j9d65DKUSbp4zvns74O6
	 RqgMM4RANMFsbh4YTvPrcboP5I9/vg1T8VTBuYuSTLQZzbPOt1KluncwGxhtMCy7bdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F75F606A31F;
	Wed, 28 Oct 2026 03:41:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F75F606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding; bh=iNT64UFrECXOpKzAsnWQFADTzrZ6WwoW3h
	+KEtTPrrU=; b=xwMxOjUqR1AnTXxiqQTQTJMaxrpvIyDNp2xP3PiSv6K+gIdVzC
	iWVgaLOV8Fm4K9RVAp3RzTWCoqvI4edug05LFaDup05cBe7ACi+mRdFidKAdR8Q1
	eFTtjH92pbz1Q07LUdpc+or+LF2SSm4bLBuS04AewTNUfjbat5TJUK4hY=
Received: from xuqianhui.ustc.edu.cn (unknown [114.214.180.23])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgA3szfSbuFqyQlWAA--.2887S5;
	Wed, 28 Oct 2026 11:41:08 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: 'Bryan O'Donoghue' <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/9] media: camss: csid: unwind the power-on path through a single error label
Date: Wed, 28 Oct 2026 11:40:59 +0800
Message-ID: <20261028034105.326535-4-xiaqinghuan@mail.ustc.edu.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261028034105.326535-1-xiaqinghuan@mail.ustc.edu.cn>
References: <20261028034105.326535-1-xiaqinghuan@mail.ustc.edu.cn>
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
X-CM-TRANSID:3pYKCgA3szfSbuFqyQlWAA--.2887S5
X-Coremail-Antispam: 1UD129KBjvJXoWxZFyDXr18ur18Gry7tF43Wrg_yoW5GF1kpr
	W5JrW7Ar4FqF109rs2ya12qFy5GrZ5Wa47JF17Ca4Ivw1Fka4xtr48GryYgFykKrZ8Aa1a
	vrZxtF4UZF1YqaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmvb7Iv0xC_tr1lb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
	8067AKxVWUWwA2048vs2IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF
	64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcV
	CY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv
	6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c
	02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE
	4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7
	CjxVAaw2AFwI0_Jw0_GFylc2xSY4AK67AK6r48MxAIw28IcxkI7VAKI48JMxC20s026xCa
	FVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_Jr
	Wlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j
	6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr
	0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUv
	cSsGvfC2KfnxnUUI43ZEXa7IU8tCztUUUUU==
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiARENB2rg+9YEMABHsO

csid_set_power() repeats the same cleanup sequence in every error branch
and gets it wrong in the first one: when pm_runtime_resume_and_get()
fails, the parent device reference taken by parent_dev_ops->get() is
never dropped, so a failing power-on leaks it and the matching VFE stays
powered.

Replace the four open-coded unwind blocks with gotos to a shared label
chain and route the pm_runtime failure through the parent put as well.
No functional change on the success path.

Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
---
 .../media/platform/qcom/camss/camss-csid.c    | 45 +++++++++----------
 1 file changed, 20 insertions(+), 25 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
index 48459b46a..592c1dfc9 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.c
+++ b/drivers/media/platform/qcom/camss/camss-csid.c
@@ -696,44 +696,28 @@ static int csid_set_power(struct v4l2_subdev *sd, int on)
 
 		ret = pm_runtime_resume_and_get(dev);
 		if (ret < 0)
-			return ret;
+			goto put_parent;
 
 		ret = regulator_bulk_enable(csid->num_supplies,
 					    csid->supplies);
-		if (ret < 0) {
-			pm_runtime_put_sync(dev);
-			return ret;
-		}
+		if (ret < 0)
+			goto put_pm;
 
 		ret = csid_set_clock_rates(csid);
-		if (ret < 0) {
-			regulator_bulk_disable(csid->num_supplies,
-					       csid->supplies);
-			pm_runtime_put_sync(dev);
-			return ret;
-		}
+		if (ret < 0)
+			goto disable_regulators;
 
 		ret = camss_enable_clocks(csid->nclocks, csid->clock, dev);
-		if (ret < 0) {
-			regulator_bulk_disable(csid->num_supplies,
-					       csid->supplies);
-			pm_runtime_put_sync(dev);
-			return ret;
-		}
+		if (ret < 0)
+			goto disable_regulators;
 
 		csid->phy.need_vc_update = true;
 
 		enable_irq(csid->irq);
 
 		ret = csid->res->hw_ops->reset(csid);
-		if (ret < 0) {
-			disable_irq(csid->irq);
-			camss_disable_clocks(csid->nclocks, csid->clock);
-			regulator_bulk_disable(csid->num_supplies,
-					       csid->supplies);
-			pm_runtime_put_sync(dev);
-			return ret;
-		}
+		if (ret < 0)
+			goto disable_clocks;
 
 		csid->res->hw_ops->hw_version(csid);
 	} else {
@@ -746,6 +730,17 @@ static int csid_set_power(struct v4l2_subdev *sd, int on)
 	}
 
 	return ret;
+
+disable_clocks:
+	disable_irq(csid->irq);
+	camss_disable_clocks(csid->nclocks, csid->clock);
+disable_regulators:
+	regulator_bulk_disable(csid->num_supplies, csid->supplies);
+put_pm:
+	pm_runtime_put_sync(dev);
+put_parent:
+	csid->res->parent_dev_ops->put(camss, csid->id);
+	return ret;
 }
 
 /*

