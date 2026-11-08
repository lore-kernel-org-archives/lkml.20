Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.226.251.25
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794138499;
	b=D0KQCz8Z+mYCScPFcZDjYZAuWIgBnaa1ixE1mIOgegZdUmp5//xeLdpkI1OZmAz/CrLW
	 ILRE/zR3+nORbobSZwAlBODfZ36p6NT8Rkx83DFQJNL6fY7ExmmLygpwOmrEQoKF6yLku
	 K/8oOKfQhPluN8y5OXciNoRnBI5FDjOID1D49TnS2Cw67peT8urtEpwx2X3avDXZ5eKMu
	 RgspGYUxxuZRWQZjGxpLKD5dD48HK++Wj6JRwd43D9ALcXxC+ikNpAE8BqZAN0iTKC8YP
	 wEuMbNO/+vOXi1qUoPQp3ZYjQf2y5Gd5ufpy+AD1o8GQVlyE6la/oSTeBURB5O0t9iQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794138499;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=1btocioKbkwM7VGUAyhGhEvZLV2FWL6cjVe3wd3wUkc=;
	b=G2lwrcLjutezMXB4skYFI4Jgdg43Ry9hunZkvJqWEknCNCK1vIJOr/lFxOTuDjnMhGcr
	 tPVamrUYtjTok9XEMgAA3HWjcu92QgRO7/DOFSi8AC1A4Ssje4jV2ar60nAfSafCYbpTs
	 FsDvY75CIsPdizzU6jbeEVlknay1xDx6Kxk07S2Dl82GxDMRN+ATXOLP5HUKIoSZD0WB6
	 YD8M3QvEgupVCbesJ+YwqvpBCx5oZTVWCd4vq+LNYNnNyM3N41+1KPfcJKuz45drbKOdE
	 HYGAqoS1OJx+UVylYdk9kVwPg8CmyKkT8FSG8y70x1NeRx+Rh/09qoOsFTe+BwKlRWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iscas.ac.cn;
	spf=pass smtp.mailfrom=iscas.ac.cn;
	arc=none smtp.remote-ip=159.226.251.25
Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B89A606A31C;
	Sun,  8 Nov 2026 11:48:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B89A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from [172.100.0.8] (unknown [36.110.52.2])
	by APP-05 (Coremail) with SMTP id zQCowAB3DrR4YfBqerGaAA--.22369S2;
	Sun, 08 Nov 2026 19:48:08 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Mark Brown <broonie@kernel.org>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 patches@opensource.cirrus.com,
 linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 vulab@iscas.ac.cn
Subject: Re: [PATCH] ASoC: arizona-jack: Fix runtime PM leak in
 arizona_start_mic()
Date: Sun, 08 Nov 2026 11:46:29 +0000
Message-ID: <20261108114629.3205150-1-vulab@iscas.ac.cn>
In-Reply-To: <aq1TUA77ukvvBjso@opensource.cirrus.com>
References: <20260917164625.2163097-1-vulab@iscas.ac.cn>
 <aq1TUA77ukvvBjso@opensource.cirrus.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:zQCowAB3DrR4YfBqerGaAA--.22369S2
X-Coremail-Antispam: 1UD129KBjvdXoWrurWxuF1DGFyUJr13Xr4xZwb_yoWfJwc_u3
	ykJ397K3WUWF4rtFn8GF1ayr12gFWvg34xZ3yjqw43trWUtw4DGw45t3sIya4xW3y8Jrn0
	vw43Aw45Zw129jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbT8Fc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AK
	wVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20x
	vE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2z280
	aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52
	x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUtVWr
	XwAv7VC2z280aVAFwI0_Cr1j6rxdMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrw
	ACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAaw2AF
	wI0_Jw0_GFyl42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv8VW8GFyrJr1UJwCFx2
	IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v2
	6r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67
	AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IY
	s7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr
	1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjfU7nmRUUUUU
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiCRUFA2rv4ki9GgACsQ

Hi Charles,

Sorry for the very late reply, and for the time you spent on a patch
that should not have been sent.

You are right, and I am withdrawing it. By that point the function has
already taken the runtime PM reference, enabled MICVDD and pulsed
micbias, so a bare put would drop the reference without the rest of the
teardown; and as you say, a failed MICD enable most likely only means
the headset buttons are dead while the mic still records. Tearing all
of that down properly would need the regulator and DAPM side too, which
I cannot validate without hardware. Please disregard the patch; I will
not send a v2.

I take the general point about these HPDET and MIC sequences, and I will
not touch them again until I can test on hardware. I am also going
through the outstanding review comments by hand, and I will not send
patches in bulk any more.

Thanks,
Wentao

