Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793458991;
	b=EZMTn9GIDWnrpgxWfG1BYLkVWd+Yyh0N6/DWhv/JEAj/76PgESKg7VSOqaJcuxv0SRU7
	 uwxLe461KIUVrxQrwtfQv3MLYm6b7VR7/9/2RPx8j/0dKqlquBwLHZ/mWMjfZOf3yWwaK
	 TjJWVreeBP8pjpRcUB5W7re7GTSgET5hCbecDlBLI10dpk27UsVgiYrW04NH6rmfZeaOi
	 UczGMUtrOW0cC2u843CXzxuHntVHvlpwUKSL4YAk0vanoRXxqw7rfoQLXtIma6L/3mNgb
	 KAooG2RQkOIN+6bDp6AJZxGuSygLodCgY7EcHP7FGeHuA8oZR7RSBmJlpjZa0oU8HVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793458991;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=NwxbiKZt5M6bguLSwezvKHdUYiGPqH05PtmFGqFk5EE=;
	b=RXl9yFxqBof0SM9LZLd0zmxulRSChanLec4fLCXaiRr9G6VgtxCnBO0iKwL+LWVkyjfs
	 D3JzBjSylsHRHnuQ/0hHNF1c6WzkjaLgSfT4erIc6U84ChO6RP9rYPlXZQDJ3wEpIPrM0
	 AUnxhxs/BfmH5dDJE0MAfCWKwghAkZtD5U2QgVDx4Gj7PXoc1ft5u4Sa2BWNH7YRth4nO
	 +x/1pZfH/qt4S0QG5ki4Dbmr3VkLknPpkrtKKinONJTZcP9pK/zgmM+8nU9gl8hMJnh7s
	 Wz6BE0Uc35KowVOU+V9iyoC5fwv2ENxVTUk2ourx+5hflSnMkAE2pyUsSij8kwtmnzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=mr0XE0sE;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D204606A31C;
	Sat, 31 Oct 2026 15:03:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D204606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=mr0XE0sE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding; bh=NwxbiKZt5M6bguLSwezvKHdUYiGPqH05Pt
	mFGqFk5EE=; b=mr0XE0sEItzOPl7x19LcUZFi5gYUt7VgIhMkPpMfZUG3nYvody
	hbJHwMJywo7aWBrLgsdKWJfL3i1UcWb6SMw3b/0cOQVu/CxxNu2RBiwjjjN3WewD
	NiyAq03PZmLR19pMiA9emMYsMmdbc1Z4Orbzk9512af8lSA/GUxQoFxuI=
Received: from xuqianhui.ustc.edu.cn (unknown [114.214.177.113])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgDHS0ApA+ZqqSNvAA--.5005S3;
	Sat, 31 Oct 2026 23:03:06 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Rob Clark <robdclark@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] drm/msm/dsi: move bonded command failure flag into dsi manager state
Date: Sat, 31 Oct 2026 23:03:01 +0800
Message-ID: <20261031150305.1107572-2-xiaqinghuan@mail.ustc.edu.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261031150305.1107572-1-xiaqinghuan@mail.ustc.edu.cn>
References: <20261031150305.1107572-1-xiaqinghuan@mail.ustc.edu.cn>
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
X-CM-TRANSID:3pYKCgDHS0ApA+ZqqSNvAA--.5005S3
X-Coremail-Antispam: 1UD129KBjvJXoWxWw4xKr48Wr4fCry8Xw4xWFg_yoW5Gr48p3
	9rWw4jvFWqv3ZI9anIyFW5CF1fAFn3Gas7J3ZrWw4xAFs8t3W5ZrykXrW3KrySvFy8AF1j
	qa1DGFyFqF1xG3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPIb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
	8067AKxVWUGwA2048vs2IY020Ec7CjxVAFwI0_Jrv_JF4l8cAvFVAK0II2c7xJM28CjxkF
	64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcV
	CY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv
	6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c
	02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVW8JVWxJwAm72CE
	4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc7CjxVAaw2AFwI0_JF0_Jw1lc2xSY4
	AK67AK6ryrMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8C
	rVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtw
	CIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x02
	67AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr
	0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x07bw
	LvNUUUUU=
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiARERB2rk8FY0gwAGsf

The bonded-DSI command path kept a file-scoped `static bool
dsi_bonded_cmd_failed` next to the global manager instance, so bonded
state was split across two storage classes. Move the flag into
struct msm_dsi_manager (msm_dsim_glb) so the manager owns all of it and
nothing mutable stays file-scoped. READ_ONCE/WRITE_ONCE use is unchanged,
so behaviour is identical.

Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
---
 drivers/gpu/drm/msm/dsi/dsi_manager.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index 559c07a8b9..93d636220b 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -30,6 +30,7 @@ struct msm_dsi_manager {
 	bool is_bonded_dsi;
 	bool is_sync_needed;
 	bool is_sm8750;
+	bool bonded_cmd_failed;
 	int master_dsi_link_id;
 };
 
@@ -37,8 +38,10 @@ static struct msm_dsi_manager msm_dsim_glb = {
 	.master_dsi_link_id = -1,
 };
 
+/* Serialises bonded command transactions; the failure flag it guards lives in
+ * msm_dsim_glb so no bonded state is file-scoped.
+ */
 static DEFINE_MUTEX(dsi_bonded_cmd_lock);
-static bool dsi_bonded_cmd_failed;
 
 #define IS_BONDED_DSI()		(msm_dsim_glb.is_bonded_dsi)
 #define IS_SYNC_NEEDED()	(msm_dsim_glb.is_sync_needed)
@@ -51,7 +54,8 @@ static bool dsi_mgr_uses_bonded_cmd(void)
 
 bool msm_dsi_manager_cmd_failed(void)
 {
-	return dsi_mgr_uses_bonded_cmd() && READ_ONCE(dsi_bonded_cmd_failed);
+	return dsi_mgr_uses_bonded_cmd() &&
+	       READ_ONCE(msm_dsim_glb.bonded_cmd_failed);
 }
 
 static inline struct msm_dsi *dsi_mgr_get_dsi(int id)
@@ -374,7 +378,7 @@ static void dsi_mgr_bridge_enable(struct drm_bridge *bridge,
 	if (!panel->prepared) {
 		dev_err(&msm_dsi->pdev->dev,
 			"panel is not prepared; refusing video enable\n");
-		WRITE_ONCE(dsi_bonded_cmd_failed, true);
+		WRITE_ONCE(msm_dsim_glb.bonded_cmd_failed, true);
 		return;
 	}
 
@@ -646,7 +650,7 @@ static int dsi_mgr_bonded_cmd_xfer(const struct mipi_dsi_msg *msg)
 	ret = master_ret < 0 ? master_ret : slave_ret < 0 ? slave_ret : len;
 	if (ret < 0) {
 		/* Never reuse a packet buffer while either DMA engine is unresolved. */
-		WRITE_ONCE(dsi_bonded_cmd_failed, true);
+		WRITE_ONCE(msm_dsim_glb.bonded_cmd_failed, true);
 		dev_err(&master_dsi->pdev->dev,
 			"bonded command DMA failed: master=%d peer=%d\n",
 			master_ret, slave_ret);
-- 
2.53.0

