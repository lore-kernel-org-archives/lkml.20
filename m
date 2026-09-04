Received: from out30-118.freemail.mail.aliyun.com (out30-118.freemail.mail.aliyun.com [115.124.30.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E601E37DAD0
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 05:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788499873; cv=none; b=F4h6ZVc3QYeGgPBkWVqroQa4WLXg5wb3E2gXv02ceB3b6MwmNGrkZE8zwpQHKxl4m4agkrAT7On7mB5CX3V12UimErlsaB7OWBQrv56o2wkMB0lM6qMpOZFzL5kzW8wDpsnyjjVFH8Wmqvnw5G61Sn+976vFihbrl1NxArwI46w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788499873; c=relaxed/simple;
	bh=DZapxDY1cyYmduO/VJG4jlO4pddSKurX62xSjnJT+ws=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oiuRUXbZkbyTlvgv3rQfH+pTxelsGl7PGpknP1XO8b5a0tcSKudSYnu8aodiv/b8jH+J7mOo1M+3uzo/LxaaVKT6FThCP8NYh8kLXIQCtzS+SiEGAxMTrBdtpo15LWPtD1mbCnfn6z1zC46iFEf9UyX3grsDMG2fMv6m+6a/r7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=RxvUnzHc; arc=none smtp.client-ip=115.124.30.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="RxvUnzHc"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1788499867; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=Tmdv1e6AvKbxyruleKHK2qwK0Mc5PcTX/f0LkoXpwqc=;
	b=RxvUnzHcjBPdxrmO/6t42X9GATG2U6gw1AJ8UbAVilJ4Aw6pKqrNw27HCDc1Gc0RrzjesKWa7c/cFOVAsO2edomLqZUJjKwLaV/3vX9Nzcsbc20jUArzhkbO3k6VG2jnKhXeDrJZ/QgGIoHJR5K7gbKTAP5SGXxt5BBsG1BYpE4=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R841e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=qinyuntan@linux.alibaba.com;NM=1;PH=DS;RN=16;SR=0;TI=SMTPD_---0XAHmlRu_1788499865;
Received: from 30.178.82.219(mailfrom:qinyuntan@linux.alibaba.com fp:SMTPD_---0XAHmlRu_1788499865 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 04 Sep 2026 13:31:06 +0800
Message-ID: <74124ddb-a725-422d-8e3a-c6cd6b4e1a09@linux.alibaba.com>
Date: Fri, 4 Sep 2026 13:31:04 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] drm/ast: create blend mode property on cursor
 plane
To: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Cc: airlied@redhat.com, jfalempe@redhat.com, kraxel@redhat.com,
 dmitry.osipenko@collabora.com, hansg@kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, simona@ffwll.ch,
 leandro.ribeiro@collabora.com, daniels@collabora.com,
 pekka.paalanen@collabora.com, virtualization@lists.linux.dev,
 spice-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260901083234.1828755-1-qinyuntan@linux.alibaba.com>
 <20260901083234.1828755-2-qinyuntan@linux.alibaba.com>
 <1f7a2056-825b-4b18-ac60-94f13ee40212@suse.de>
 <15f87b4e-3da8-4ce9-9cde-b4c8cefe1d80@suse.de>
 <8c6ef5d2-1f85-4dad-b426-143d490e1114@linux.alibaba.com>
 <153a2ba3-0dfc-45a0-ac48-04842da970f3@suse.de>
From: Qinyun Tan <qinyuntan@linux.alibaba.com>
In-Reply-To: <153a2ba3-0dfc-45a0-ac48-04842da970f3@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,Thomas.

On 9/3/26 3:05 PM, Thomas Zimmermann wrote:
> 
> Another patch just landed that fixes the problem:
> 
> https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/c3080b58d81d3699cbf4dfd5ba860630fca96f4a
> 
> So I acked the rest of your series and I'll merge it in a few days. Thanks again for taking care of these drivers.
> 

Great, that resolves the blend mode default concern.

Thanks for the reviews and for picking up the series! Glad I could
contribute a little to these drivers -- happy to help again next time
something comes up.

Best regards,
Qinyun

> Best regards
> Thomas
> 
>
