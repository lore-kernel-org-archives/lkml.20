Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A40A314D1A;
	Wed,  2 Sep 2026 07:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788333658; cv=none; b=BjA2Ls2khuPjHhh+16H+De5Nx8hvGfi5tC6w8OmsdcU8plm+pLhRmFJ9SiEA9lMzFnFe/DVZ75Jry9VmTbkCW7vs+DkaABH6PM8/3Lmk2qDY1paQGsDlD5silaNBYCx1JZnuMZ7++9I/339MXx3lWuF4+o2RIRjwKofS1x5oBSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788333658; c=relaxed/simple;
	bh=/D36qVa1w8LjKCyvdYOxR+EYq1+D05cx9lP9Cjekp7s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nGZU/3qvJmSxZjo/BIw9TWxQrvmJDWsF0XOkpK/0FwFG7ovcFEHOGYZ4JcMzK1YkyCj4ojdfEmfOId988r18VJXW1lrI/8UHj/WOtvflNvoUNPO3+wqxZW5fCO1Ib7/Keh/b/JUeZjdvGLmyF5NkzqWcdkc+PsyM/vr5XByKVXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=npfTwp6e; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="npfTwp6e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=3f
	K3VdKNVXJvWoOP7f+9oY2Fa6VvBCVybss9wJNWZ8M=; b=npfTwp6eYdc5tZwSq6
	sXZ+Z9wxCNrvKKN3cNzb1jlGYdV3pXu5pgR9NoAo89jyTLAoqM1PK7Nr0a2Mgo+i
	/5sJgPQCXKwCXUIGnjSuPnFRzOQbxcy7HBXsUivcmQ2n+ldk3O1pcBBm1FKI1USn
	iRz5iqWoxPVJsA/fKgqmKlrlk=
Received: from localhost.localdomain (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCgvCgBnP6UuzpdqMkg2NQ--.54267S4;
	Wed, 02 Sep 2026 15:20:18 +0800 (CST)
From: wangdich9700@163.com
To: srini@kernel.org,
	broonie@kernel.org,
	tiwai@suse.com,
	wangdich9700@163.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	wangdicheng@kylinos.cn
Subject: [PATCH 2/3] ASoC: qcom: lpass-hdmi: fix invalid rate error message
Date: Wed,  2 Sep 2026 15:19:42 +0800
Message-Id: <20260902071943.522194-3-wangdich9700@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260902071943.522194-1-wangdich9700@163.com>
References: <20260902071943.522194-1-wangdich9700@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PCgvCgBnP6UuzpdqMkg2NQ--.54267S4
X-Coremail-Antispam: 1Uf129KBjvdXoW7Gr47tFy7Cw4DJFyDCFy7Awb_yoWfKFgEv3
	WS9w48Z34UWF4Iyw18Gr4rZr4q9r42gFW7u3y5trnrtryUZr98CF1ktFZ3WrZaqan5AFyY
	gFZY9r1UAa4DGjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRE3xhJUUUUU==
X-CM-SenderInfo: pzdqwv5lfkmliqq6il2tof0z/xtbC5xJAj2qXzjKk1wAA3I

From: wangdicheng <wangdicheng@kylinos.cn>

The sampling rate switch reused the bitwidth error path, so an
unsupported rate logged "invalid bit width" with the bitwidth value.
Print the rate instead.

Signed-off-by: wangdicheng <wangdicheng@kylinos.cn>
---
 sound/soc/qcom/lpass-hdmi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/lpass-hdmi.c b/sound/soc/qcom/lpass-hdmi.c
index 8bbe43facdc1..dd0ae4fbc841 100644
--- a/sound/soc/qcom/lpass-hdmi.c
+++ b/sound/soc/qcom/lpass-hdmi.c
@@ -64,8 +64,8 @@ static int lpass_hdmi_daiops_hw_params(struct snd_pcm_substream *substream,
 		sampling_freq = LPASS_SAMPLING_FREQ48;
 		break;
 	default:
-		dev_err(dai->dev, "%s invalid bit width given : %d\n",
-					__func__, bitwidth);
+		dev_err(dai->dev, "%s invalid sampling rate given : %d\n",
+					__func__, rate);
 		return -EINVAL;
 	}
 	data_format = LPASS_DATA_FORMAT_LINEAR;
-- 
2.25.1

