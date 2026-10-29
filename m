Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793277079;
	b=Mii/M5cKQijwIJ70y+8WfrAhs6hHRNRLR5NkYimZG6l9iJO/DGXTfD9MmimNHrqv9Coj
	 KFb00nVRPjB2QVFGz8COTO9S3TkOY/ffX6XSX816+a6kngAIb44xwwbbcRLsrNdDmemsv
	 x/+ewszUzxNG61awbDhTpavxZ8dyn6N8nSfBkTs3iIeODj/yriBdPx4btpY6CQomODWbS
	 fTE7/5m9ViY8d5neljBgBZKhlO2yB1PmWs5EuxYn+cPwhN1MGDduSJLvSQt+mf3gOCEah
	 yPaPx+jGurdn8VQEXHWzDECq8cBc3owPJ6JGm8ljY7jecZJLoRD5mcBtHdG8A7W0wAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793277079;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=cczABSL5zMN0Y81syn12EnZDUTE+vH/9aAo6wAF3z+c=;
	b=F00rt+uD2HkV1izNVMDHBdKPitHWCYFFXdjpKlBzM2xrha3zsWH2IzhSHNjUFyqUYXQ3
	 qvRRhOZ/L2FlEiEFQn8Y+FOFRbh8SS+nDN/ZmSNN+kG4mM3FQPalz3QcBRTKOm3k0rjlf
	 bgng9OnU/P1sh/pX0QRADday/sx7zqRldGbrO6LS7+BlaxegZP+tm8l1LySEm4Yb6YW17
	 US1iOPdEEMUBJvZek91gCFqxccLzRKISt00gb4zsUrmYILS2QJNDOolJPx02J8uIRgVZ3
	 vTAVHonbUCWIjvauHnRE4XuBODmxu2zLn8YDKOXKDV5LWaprH8MlLGb+tvrDm217BLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=cq7pHj0p;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70865606A322;
	Thu, 29 Oct 2026 12:31:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70865606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=cq7pHj0p
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding; bh=cczABSL5zMN0Y81syn12EnZDUTE+vH/9aA
	o6wAF3z+c=; b=cq7pHj0pJw/PiJHDFRs+ow7bFpSuqAuyvUbU2WEx3ZaeTHTi3b
	qLKI3Xn0OLFAFX7hqzsJaxajHYIllFPRRBW+8pzIuG8r7UT3demhMdkefaJ/jLaw
	0h0MjnkVNhhwz43Eerxwv6FRGoumMBKEL+4jinRArq0V6ZNDzts1pwBUc=
Received: from xuqianhui.ustc.edu.cn (unknown [114.214.224.240])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgC3OD2LPONqnPVgAA--.841S3;
	Thu, 29 Oct 2026 20:31:09 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] media: camss: csid: unwind the power-on path through a single error label
Date: Thu, 29 Oct 2026 20:31:05 +0800
Message-ID: <20261029123107.28705-2-xiaqinghuan@mail.ustc.edu.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261029123107.28705-1-xiaqinghuan@mail.ustc.edu.cn>
References: <20261029123107.28705-1-xiaqinghuan@mail.ustc.edu.cn>
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
X-CM-TRANSID:3pYKCgC3OD2LPONqnPVgAA--.841S3
X-Coremail-Antispam: 1UD129KBjvJXoWxZFyDXr18ur18XF1rJw1kKrg_yoW5GF48pr
	W5JrW7Ar4FqF109rs2ya12qFy5GrZ5Wa4xJF17Ca4Ivw1Fka4ftr48GryYgFykKrZ8Aa1a
	vrZxtF4UZF1YqaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUP2b7Iv0xC_tr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
	8067AKxVWUGwA2048vs2IY020Ec7CjxVAFwI0_JFI_Gr1l8cAvFVAK0II2c7xJM28CjxkF
	64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcV
	CY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv
	6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c
	02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE
	4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc7CjxVAaw2AFwI0_JF0_Jw1lc2xSY4
	AK67AK6ryUMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8C
	rVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtw
	CIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x02
	67AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr
	0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8Wq
	2JUUUUU==
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiAREPB2riTVZTsQBMsl

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
index 48459b46a9..592c1dfc97 100644
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

