Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.226.251.25
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794077350;
	b=GD6fze9UtjV3Z44tyS7WWNF/KDFoauGpTti7mak59owI6juGUYemo/3QvSJ8kv865SPG
	 LOsSyvEA0/WUElsV5Fu9JJYf2lARTXx4f1S0/nc0ITHDBTsHQlKzl4F/nuaRWfuIvwelo
	 q3Z8oLAIrTbVoN53nedRDspWShfG9Z//LjJihCzUDGHjjL5lB/ycUMA1CDSNRB3XrHIhX
	 qJj7uxS5LOt3wtAXL6tsYNMgSnmu9nmZFQdsgeSLc0KnnFgELAsE83jbz104PRRpsX81F
	 9poJk9G7H7YRVuGNaZKuR+dRmEXDD0pDgd49IabHH6XvX1WjcmgWWq6r74jCr4UydOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794077350;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=VbE6fNG/JLjKMnL2t3Gm7etnCGwM0ggtDpCIoSbavDw=;
	b=xY6j4LHkO+Rm8Xbba7QQ45YUQDYUhJqwfbzcDAtrvY7FVIzEosdNxoekLAiwW7GxVGhi
	 s/Bak+lXTxWKLvpyQo12+odbNYRvq0gmxFYp44aiMQdFIE/NVi641sWlLRKeumhRYE7im
	 ahtC/LIbfEcr8RQIq07jUguecsWAxzDlSframDD6RRSuyur0YrbxYJtfnd3RHpjuZ97fz
	 x31dGXBT4pO1txAMA6A3fSbMZpTbqN6X+0YXpAwd0yEtCmfR5c/YCQbGd0g2QkUhnyNhP
	 cuXrh7z42HEIfM1tUMVOrbELQH35oIddd0dQbGA6ZtBnr6/ILHGc0LNXbac7EeI2D6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iscas.ac.cn;
	spf=pass smtp.mailfrom=iscas.ac.cn;
	arc=none smtp.remote-ip=159.226.251.25
Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E06CF606A32F
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 18:49:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E06CF606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from [172.100.0.8] (unknown [36.110.52.2])
	by APP-05 (Coremail) with SMTP id zQCowADnfrSfcu9qVXiKAA--.6854S2;
	Sun, 08 Nov 2026 02:49:03 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>
Cc: David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Matthew D Roper <matthew.d.roper@intel.com>,
 Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>,
 intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/i915/selftests: Release GT VM reference on mock device
 teardown
Date: Sat, 07 Nov 2026 17:10:00 +0000
Message-ID: <1794071400.2684480.vulab@iscas.ac.cn>
In-Reply-To: <178962823827.28653.5098493516220452854@jlahtine-mobl>
References: <20260916171935.2087305-1-vulab@iscas.ac.cn>
 <178962823827.28653.5098493516220452854@jlahtine-mobl>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowADnfrSfcu9qVXiKAA--.6854S2
X-Coremail-Antispam: 1UD129KBjvJXoWxAw13ZryDtr1UZF1UJw18Krg_yoW5Gw4Dpa
	1rJayUKrWrGFWIga9rAr1UZryfG3ZYya4rGw17GwnI9r15Za4vqFWIyFWjq34YyFZ7XF1S
	yFy7KayIgr1jk3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9mb7Iv0xC_Kw4lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2
	AK021l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v2
	6r4j6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI
	0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80
	ewAv7VC0I7IYx2IY67AKxVWUtVWrXwAv7VC2z280aVAFwI0_Cr0_Gr1UMcvjeVCFs4IE7x
	kEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kIc2xKxwCY1x0262kKe7AK
	xVWUtVW8ZwCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26r48ZrWUJr1UMxC20s
	026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_
	JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14
	v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xva
	j40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr
	0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x07b0DGrUUUUU=
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiCRIEA2rvPctHVAABs9

mock_gem_device() takes an additional reference to the GGTT VM when
initializing gt->vm. However, the mock device cleanup does not release
this reference, either during normal teardown or when initialization
fails.

The regular i915 driver releases gt->vm through
intel_gt_driver_release(), but the mock device does not use that
teardown path. As a result, the additional VM reference can remain
held after the mock device has been cleaned up.

Release the reference during normal teardown after draining the GEM
workqueue and before finalizing the mock GGTT. Also release it during
initialization error unwinding, before destroying the workqueues.

This change is limited to the mock device used by the i915 selftests
and does not affect normal driver operation.

The issue was identified through static analysis, with AI assistance
used to examine the finding and prepare the fix. The resulting change
was manually reviewed and build-tested with
CONFIG_DRM_I915_SELFTEST=y.

Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
Changes in v2:
- Remove the Fixes and Cc: stable tags, as this is a selftest-only
  cleanup rather than a fix requiring stable backporting.
- Correct the subject prefix to drm/i915/selftests.
- Adjust the error-path cleanup ordering so the VM reference is
  released before the workqueues are destroyed.
- Clarify the scope of the change and document the use of AI tools.

 drivers/gpu/drm/i915/selftests/mock_gem_device.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/i915/selftests/mock_gem_device.c b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
index 796c9b070e41..88cd83f28586 100644
--- a/drivers/gpu/drm/i915/selftests/mock_gem_device.c
+++ b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
@@ -71,6 +71,7 @@ static void mock_device_release(struct drm_device *dev)
 
 	i915_gem_drain_workqueue(i915);
 
+	i915_vm_put(fetch_and_zero(&to_gt(i915)->vm));
 	mock_fini_ggtt(to_gt(i915)->ggtt);
 	destroy_workqueue(i915->unordered_wq);
 	destroy_workqueue(i915->wq);
@@ -145,6 +146,7 @@ struct drm_i915_private *mock_gem_device(void)
 #endif
 	struct drm_i915_private *i915;
 	struct intel_display *display;
+	struct i915_address_space *vm;
 	struct pci_dev *pdev;
 	int ret;
 
@@ -257,6 +259,9 @@ struct drm_i915_private *mock_gem_device(void)
 err_context:
 	intel_gt_driver_remove(to_gt(i915));
 err_unlock:
+	vm = fetch_and_zero(&to_gt(i915)->vm);
+	if (vm)
+		i915_vm_put(vm);
 	destroy_workqueue(i915->unordered_wq);
 err_wq:
 	destroy_workqueue(i915->wq);
-- 
2.34.1

