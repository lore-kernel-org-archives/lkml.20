Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793419922;
	b=w2ncoGbbVo3/BCR5SXRCFckR4sFTuUrOVkznQt9AyC594T3h1dmGR5cygXgSeAN7DQus
	 45yk4FPUnYRwZ2ElZb2Q9rmr0nn4c7NMPyw7x3TzYHop/o9M1qfKtTjvfP2KoSXoqWARu
	 X3YFDl/TF055s2Z6t2mykxKZZuGuCSJ8f5QQzEUgwTii64W046+nYP7cxgZnLYSwxdxke
	 jcJjrXcTsyrUmbbcePfsN57Q8kcZg/OKC5U6EP50qDZlnIHHLlTjmQMcLfr9LltTt1tAW
	 y2hakHy0b33TKz8kQeD3sGkyAIuiRlfD8SyBH11iu6z6oH1SlUr31p7sJDt4ItpeRvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793419922;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=rR1+nm0py6enesUK1Eed+cMszAijCZyZdxvva72C6Yg=;
	b=0BcnqCm5T754B0DwluYMb1aN1PWCFlQdQQFsVeq2jhXfIar2X5NqCIclU7N2HXYZJN9a
	 gWeMs2P2KDKkVLXYDruk7VBEbzZZNQm6pfukiGlfgUg1lORB+O9aHTVjiNWfJoQhigBiV
	 p/mmiZ2GygkIR+h2a9Iknc0xUvpNCl7cg+G2Oj1d0Fv4tbiGsKVBFGa0ilwyts0y+JLzI
	 VDK64Tz2iIQka4WgiT9gUxaqwRbaIQiZpogdtNNDvFyLP8WlSrbhE9lSxlCvh6IStjpYU
	 AJ9qjpnbC+f0UWc3HmRqpdm4P6uKyBTk3vsHq/cUcdcbkmaYDqL/4/Eu+CfCg8Iu9rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b="B/o+imp2";
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 387F5606A31D;
	Sat, 31 Oct 2026 04:11:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 387F5606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=B/o+imp2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding; bh=rR1+nm0py6enesUK1Eed+cMszAijCZyZdx
	vva72C6Yg=; b=B/o+imp2RkBhAGjXDzqb7UdYHjA1z/rx1iERPkhNToi8qhhsD/
	6kEMy2fVEvpldX2lxyaT7EkaJzihEBsxHgco5SwvtpxrwXjtJ089/yowyCcjmRMB
	erKOL/S9NIMx3wvK0BBX0eJGg3vYO0I7yRWvHSXUYjE72qulvQ2pelEw4=
Received: from xuqianhui.ustc.edu.cn (unknown [114.214.177.113])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgAHjUGKauVqawFtAA--.1802S3;
	Sat, 31 Oct 2026 12:11:54 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-media@vger.kernel.org
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] media: camss: csid: unwind the power-on path through a single error label
Date: Sat, 31 Oct 2026 12:11:53 +0800
Message-ID: <20261031041154.308030-2-xiaqinghuan@mail.ustc.edu.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261031041154.308030-1-xiaqinghuan@mail.ustc.edu.cn>
References: <20261029123107.28705-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261031041154.308030-1-xiaqinghuan@mail.ustc.edu.cn>
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
X-CM-TRANSID:3pYKCgAHjUGKauVqawFtAA--.1802S3
X-Coremail-Antispam: 1UD129KBjvJXoWxZFyDXr18ur18XF1rJw1kKrg_yoW5GF4kpr
	W5XrW7Ar4FqF409rs2ya12qFy5GrZ5Wa4xJF17Ca4Ivw1Fka4ftr48GryYgFykKrZ8Aa1a
	vrZxtFWUZF1YqaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPFb7Iv0xC_tr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
	8067AKxVWUGwA2048vs2IY020Ec7CjxVAFwI0_JFI_Gr1l8cAvFVAK0II2c7xJM28CjxkF
	64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcV
	CY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIE
	c7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I
	8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCF
	s4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY1x0262kKe7AKxVWUAVWUtwCY02Avz4
	vE14v_Gryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG
	67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMI
	IYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E
	14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJV
	W8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUIUUU
	UUUUU
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiAREQB2rk8FYCLwAnsl

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
-- 
2.53.0

