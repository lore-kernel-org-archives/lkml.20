Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.73
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794584746;
	b=kFUbKAxQiVE5E4iSIrnaatu6mo5OfXOPc90oCJsI+pGzithNYFx9MwASWPphLXLa2efD
	 I13AMurP8HSVVAMpzkjo7n3BQcGLCQEz/57EuCnDwtlA2mZcLa/1ib1kkoZHwVoWc7YJ+
	 Y6xKk/SBqDUhGr/hYHV/8a7Fjgk7CUXFIktTRGZHFNfCCzoXX4sbpFOSNYAwqJAciPkus
	 9QP2zJN/mxUrwpfoQnYisOI2D3GEmcH92lcrBeu+rD5GwbTai+AzlJ4rIkUDUsTjKFyli
	 8a90gzikwLyDKCL/Zzullh3qCVKr3AOhAQwDJCFOdcwvjcWrp6UEXT3DvuCc1xpDtFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794584746;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=y34I2ATuDuqJJKvhASuizFpK6pXycmcJmCmRRkzym2M=;
	b=1XMWCuYslWJEOPEcdvcl9uTuS1k4iTvHVnVjOwvcIjwwLALNo2W/3DoxjksZGzhyOQLH
	 35NxNxryYmbZVkeHY+sXRTWjDzYLsgCCaVGP/wYwcw77GW+RhPrCTl4d8LqtPcNdZwfww
	 R0KT3D8C2gSXIYcuURbKQAP0jx6J7RInIf/xUK4++VdHDdDH509LV0xYP9aeUv8CJPZPW
	 KuNhIIT7LnzGn6vWrOHCLjhGm1c790hZjOGiRtwv3ZtjrgQLyMqbMWRX30wS77Ho1cLBZ
	 nQPyfptypG472OTl4g+jv2Hxb0VBKQh5hYO++p+ydkBpSikBnHRhJuo33QIUxT9qIDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=TAMffjP2;
	arc=none smtp.remote-ip=91.218.175.73
Received: from mta0.migadu.com (out-73.mta0.migadu.com [91.218.175.73])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08E32606A323
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:45:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08E32606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=TAMffjP2
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Xshu7QeiQY43ThyfN1Pd7Aa9iz0mh04brwojMRvsg0U=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794584743; v=1; x=1795189543;
 b=TAMffjP2+El/WQCksjWec73bhk1/2KKa6UlwDzv5ckB5NRF3XZi1ljORNfhfXOUbd+WtN8DU
 MPWlxpNptu09x9D/uDy8eZC7XST7sRKeytxn+OgcynrLNgIrPylGnb4g1rTfY5wU82FFL7/KPKc
 PcqcF7GlB0lssGweTiVYaEs0=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id cd2cf3bed93b4255;
	Fri, 13 Nov 2026 15:45:42 +0000
X-Mizu-Trace-ID: cd2cf3bed93b4255
X-Migadu-Flow: FLOW_OUT
Date: Fri, 13 Nov 2026 15:45:38 +0000
From: Bradley Morgan <bradley.morgan@linux.dev>
To: farbere@amazon.com
CC: W_Armin@gmx.de, akpm@linux-foundation.org, blbllhy@gmail.com,
 brads@mainlining.org, dmitry.torokhov@gmail.com, eadavis@sina.com,
 hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
 laurent.pinchart@ideasonboard.com, linux-kernel@vger.kernel.org,
 oleg@redhat.com, petr.pavlu@suse.com, pmladek@suse.com,
 ptikhomirov@virtuozzo.com, rafael@kernel.org, sre@kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v6_6/7=5D_reboot=3A_use_devm?=
 =?US-ASCII?Q?=5Fblocking=5Fnotifier=5Fchain=5Fregister=28=29?=
In-Reply-To: <20261113104459.35839-2-farbere@amazon.com>
Message-ID: <C286E930-6AF0-465B-8901-B3CBFA94996B@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 13 November 2026 10:44:54 GMT, Eliav Farber <farbere@amazon.com> wrote:
>Replace the manual devres_alloc() + register_reboot_notifier() pattern
>with a single call to devm_blocking_notifier_chain_register(), removing
>the devm_unregister_reboot_notifier() callback.
>
>The removed callback wrapped unregister_reboot_notifier() in WARN_ON().
>The generic helper ignores the unregister return value, so that warning
>is gone. It could only fire if a caller had already unregistered the
>notifier itself, which no in-tree user does.

Good. Cleanup well needed 

Reviewed-by: Bradley Morgan <bradley.morgan@linux.dev>


>
>Signed-off-by: Eliav Farber <farbere@amazon.com>
>---
>Changes in v6:
>- Rebased onto v7.4-rc1.
>- Commit message: record that the removed callback's WARN_ON() on a
>  failed unregister goes away, because
>  devm_blocking_notifier_chain_register() ignores the unregister return
>  value. No change to the code.
>
>Changes in v3:
>- Fix commit message to accurately describe the old code as using
>  devres_alloc() + register_reboot_notifier() (Sashiko)
>
> kernel/reboot.c | 24 ++----------------------
> 1 file changed, 2 insertions(+), 22 deletions(-)
>
>diff --git a/kernel/reboot.c b/kernel/reboot.c
>index 9a84401adde5..2fb8700c726d 100644
>--- a/kernel/reboot.c
>+++ b/kernel/reboot.c
>@@ -146,30 +146,10 @@ int unregister_reboot_notifier(struct notifier_block *nb)
> }
> EXPORT_SYMBOL(unregister_reboot_notifier);
> 
>-static void devm_unregister_reboot_notifier(struct device *dev, void *res)
>-{
>-	WARN_ON(unregister_reboot_notifier(*(struct notifier_block **)res));
>-}
>-
> int devm_register_reboot_notifier(struct device *dev, struct
> notifier_block *nb)
> {
>-	struct notifier_block **rcnb;
>-	int ret;
>-
>-	rcnb = devres_alloc(devm_unregister_reboot_notifier,
>-			    sizeof(*rcnb), GFP_KERNEL);
>-	if (!rcnb)
>-		return -ENOMEM;
>-
>-	ret = register_reboot_notifier(nb);
>-	if (!ret) {
>-		*rcnb = nb;
>-		devres_add(dev, rcnb);
>-	} else {
>-		devres_free(rcnb);
>-	}
>-
>-	return ret;
>+	return devm_blocking_notifier_chain_register(dev,
>+						     &reboot_notifier_list, nb);
> }
> EXPORT_SYMBOL(devm_register_reboot_notifier);
> 
>

--- Thanks!
