Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B217338734A
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 16:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791475910; cv=none; b=DhGkRT0rjNL3xA0zRsKxSDHeYSH9eORnqrvtaU0lANUqOMzoT8qMa1v78wlHkJX6P2Tb9tO2aVbCBysd/IuUH9ypWW103EAlGs0UQUbMOd1Xtloc6eBEMrdahjhfVuDeBYtGMDDiL6Uc+8HjJY0Lps0eh//ksuyozrB5S1iSIZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791475910; c=relaxed/simple;
	bh=0TOnFU7ioteDnAxX157+69AVKm55wmDTzyv2R1AMdJg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=peokHsuM8nkeV+enklYQBcBSFWpUtSgFgF+5SQ45x9swOLhHdpCmRT4CN7LlETOEYguPa7DnEtPCW44puX7MKn8iQ42F5gpg8ZN90VcFucah5G5ApZp9oIq2Y51/RREkeemW0sFgDZ4hv+Mveu47ZCeTlEHl8iYfg+GjkUnqXHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from fc87d0ffb700.home.arpa (unknown [36.110.52.2])
	by APP-03 (Coremail) with SMTP id rQCowADn8T+9wMdqNcgNCg--.12558S2;
	Fri, 09 Oct 2026 00:11:42 +0800 (CST)
From: Haotian Zhang <vulab@iscas.ac.cn>
To: Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=83=C2=B6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	"Stanley.Yang" <Stanley.Yang@amd.com>,
	John Clements <john.clements@amd.com>
Cc: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amdgpu: fix NULL RAS context dereference in UMC page retirement
Date: Fri,  9 Oct 2026 00:11:44 +0800
Message-Id: <20261008161144.2671028-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowADn8T+9wMdqNcgNCg--.12558S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Cr1xCF1DJF1rtFWkWFyxGrg_yoW8ZFWxpF
	yrJFyDJr1DZF1YqFZrAF15ur9Iy340gFyfKr4jy34a93s8Jrn3tr18t3WavFyDArWUCFsx
	trWjv3yruF1qvrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkSb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8Jw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc7CjxVAaw2AFwI0_Jw0_GFyl
	42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJV
	WUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAK
	I48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F
	4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY
	6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUqVcEUUUUU
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiCRIOA2rHpDlO3gAAs2

amdgpu_umc_handle_bad_pages() and amdgpu_umc_do_page_retirement() take the
RAS context from amdgpu_ras_get_context() and dereference it without
checking for NULL.  That context is NULL whenever RAS is disabled: during
amdgpu_ras_init() the release_con path calls amdgpu_ras_set_context(adev,
NULL) and frees it when !adev->ras_enabled on non-VEGA20 hardware.  The
GFX11 KFD poison consumption interrupt (kfd_int_process_v11.c) is not
gated on RAS and reaches amdgpu_umc_pasid_poison_handler() ->
amdgpu_umc_do_page_retirement() -> amdgpu_umc_handle_bad_pages(), which
then crashes on mutex_lock(&con->page_retirement_lock) and
con->eeprom_control.

Return early from amdgpu_umc_handle_bad_pages() and
amdgpu_umc_do_page_retirement() when the RAS context is NULL.

Fixes: 513befa63446 ("drm/amdgpu: message smu to update hbm bad page number")
Assisted-by: DeepSeek-V4.1-Flash
Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_umc.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_umc.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_umc.c
index 71d34fd09385..832e9f64421d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_umc.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_umc.c
@@ -101,6 +101,10 @@ void amdgpu_umc_handle_bad_pages(struct amdgpu_device *adev,
 	int ret = 0;
 	unsigned long err_count;
 
+	/* RAS is disabled, nothing to retire. */
+	if (!con)
+		return;
+
 	amdgpu_ras_get_error_query_mode(adev, &error_query_mode);
 
 	err_data->err_addr =
@@ -216,6 +220,9 @@ static int amdgpu_umc_do_page_retirement(struct amdgpu_device *adev,
 	kgd2kfd_set_sram_ecc_flag(adev->kfd.dev);
 	amdgpu_umc_handle_bad_pages(adev, ras_error_status);
 
+	if (!con)
+		return AMDGPU_RAS_SUCCESS;
+
 	if ((err_data->ue_count || err_data->de_count) &&
 	    (reset || amdgpu_ras_is_rma(adev))) {
 		con->gpu_reset_flags |= reset;
-- 
2.25.1

