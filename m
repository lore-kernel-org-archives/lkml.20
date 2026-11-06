Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.226.251.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793956816;
	b=gC+7K4313gnDnTk1abIr4RG4ioEPa1D3ymS8Vzl337T/BQv9vc0l1whU3yTMxDHMvBwJ
	 nI5muO4BCUzia5e1OmZSOrC4DU/rhBkoz7gH3NdTC/BcJUY6C43nMx+Rj2l6+qV3LwVxD
	 FGs/rOEkulY3s/P+BKuGxjQcYYmjU/AttcSQygIeOVJFqXbcmyqbjGetNR1gAqdk64bjl
	 6CB90H1WaMd88jFaFWmaBfP1BSq5VQh9KeUZ4IjGB5O/5v90aZPtHtCUAOVUxion5TJjQ
	 8NPb0BlfyWmfoVuKYgCLc4D87QzrEqZftR3nhmysVgtPqh+n/8w+A0PifvCY99/zrDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793956816;
	h=DMARC-Filter:Received:Subject:From:To:Cc:In-Reply-To:References:Date:
	 Message-ID:Content-Type:Content-Transfer-Encoding:MIME-Version:
	 X-CM-TRANSID:X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=5YKPpxBvuB/wjS0rPWpzRzEXpBYlxb6a3DbvG41k03g=;
	b=xNFmMSwFM96MgU6cVyOkm4rsmFzdvEoGJ7EdUKUbnHvJevL5UvGx8WAYjHEfO51XSQw0
	 gWmBneZUaH6skVeX4CKZqF22zkKyQN5KmqsacA/4puRKEZJenksyBf6NpPPMxDzo9JLhH
	 HKda39m1LFOltVOyDIkL6snW9Ziz7gMqc1XgVB5gjsNZyG/2DezKXGvvYW9nGYlngSQHq
	 a4TIE553QsmimGRheyE5zmN3apAgcS/dKZzQYmwFCFnqZxPQ0PQLEb5Kzlv6dPyqkBp7w
	 yXVQW1j28FIIS4JbUlJCrS3pbRiM5yeFa2mEP//JSUXp+rFJSeGGeJsFctWTKilGEZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iscas.ac.cn;
	spf=pass smtp.mailfrom=iscas.ac.cn;
	arc=none smtp.remote-ip=159.226.251.81
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37946606EEA3
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 09:20:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37946606EEA3
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from [172.100.0.8] (unknown [36.110.52.2])
	by APP-03 (Coremail) with SMTP id rQCowAA3QZLDm+1qczlrAA--.4926S2;
	Fri, 06 Nov 2026 17:20:03 +0800 (CST)
Subject: Re: [PATCH] drm/vc4: Fix firmware reference leak in vc4_hvs_bind()
From: Wentao Liang <vulab@iscas.ac.cn>
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Cc: David Airlie <airlied@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, kernel-list@raspberrypi.com,
 linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <5f80ac77-c1f4-42cc-bdcd-e4222f72d853@igalia.com>
References: <20260916154137.2058618-1-vulab@iscas.ac.cn>
 <5f80ac77-c1f4-42cc-bdcd-e4222f72d853@igalia.com>
Date: Fri, 06 Nov 2026 09:12:00 -0000
Message-ID: <1793956320.2120331.7714293051882437691@iscas.ac.cn>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-CM-TRANSID:rQCowAA3QZLDm+1qczlrAA--.4926S2
X-Coremail-Antispam: 1UD129KBjvdXoW7XFW5Jw43ur47JFWrXFW5Wrg_yoWftrg_Cr
	yvk3srCw18WrWv9FZxGrsFvry3GayDuFW8ZrZ7A348XrW8JF47Wrs5t393Xr1xJ3yjvF1D
	ZFnrKrW3twnrWjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbakYjsxI4VWkKwAYFVCjjxCrM7CY07I20VC2zVCF04k26cxKx2IY
	s7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4
	kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_
	Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26r
	xl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
	6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv67AKxVWxJr0_GcWlOx8S6xCaFVCjc4AY6r
	1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0En4kS14v26r1q
	6r43MxAIw28IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY20_Gr43Wr1UJr1l4I8I3I0E4I
	kC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWU
	WwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr
	0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWU
	JVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJb
	IYCTnIWIevJa73UjIFyTuYvjxUDdgADUUUU
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBwgDA2rtlHkcpQAAsc

Hi Maíra,

Sorry for the very late reply, and thanks for the review.

You are right, and your suggestion is better than what I had.  Moving
the firmware lookup below the clock lookups keeps the reference close to
its use, and the two rpi_firmware_put() calls in the error paths are not
needed anymore.  The rpi_firmware_find_node() call moves with it, since
the device node reference it returns would otherwise be leaked by those
same error paths.  I am sending v2 with that change.

About the other patch, "drm/vc4: Fix firmware reference leak in
vc4_drm_bind()": the same change would work there, since the only thing
between the firmware lookup and rpi_firmware_property() is
aperture_remove_all_conflicting_devices(), which does not use the
reference.  That patch was already applied as b816da5d5df1 before this
comment, so it is in the tree as posted, with the extra
rpi_firmware_put() in the aperture error path.

Thanks,
Wentao

