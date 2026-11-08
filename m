Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.226.251.25
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794140559;
	b=y8OZfzqWU04O5Ah7mQYh5fAp8b/PuepOwTC6e2oEhu7Likiin4njaS6xYFKhADqn53U0
	 R/hF0upVAgES02h3Avr2gf7KeKltVt1mw+cOVA4Yv9IDpRE9pdG4JFupuc21+9qzoA0c7
	 vZ9WUAVhd7yMSQClBir1gfohxZNhjQOhTNUEh0q+JRGXVxeXkjNdjceAaHU7oaZf0eZpg
	 2LKNvzn4O5WxMt1b6sROBcEaJpgEj/5Jc/1or3sDTL2Ri/ZRc6DdxOjNF8LSgQ5cb7Cw4
	 ceheKjr32k6MP0LHJXQ/NuJNdPxw62rfHNqN2XUdaXuT311kqyVIPpz79JdVrwK55Vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794140559;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=1w/+zxadcdaplVrywoHB9I3O0CbHSzdEDvT3XdVCLzA=;
	b=IFqA5Ptq9y81zOsNSUPLYoFj+jjo18OBWljPC8yeAcWNNJ4MqPTdalpW0gWSjie86NIX
	 cXmoZ93GKG+2nlzTDDcc9DcLij49+M7eM/O2pszqf9k9SStVmTeqEfAeCyV63NIPG+nTj
	 8BsgoCfmRpvwtrsO+zeJ7MtRoB3PgtJsZP8tQlEhWAe3/u49bGUdTvfx2kIq7dRVi4B7g
	 XQKctH4/IbYWkilr7SJpv4+jGH0nx2zKODHx1Qhkm7lWoASAtQCebCyEUC+/AIMwWzK3C
	 OiXphGIgEaE2aAlPL3PJy3OkJ+wxaVJnT+q02y4jf9OSyN7GYJVg2cqKQR8rzSvFlsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iscas.ac.cn;
	spf=pass smtp.mailfrom=iscas.ac.cn;
	arc=none smtp.remote-ip=159.226.251.25
Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E47B606A31C;
	Sun,  8 Nov 2026 12:22:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E47B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from [172.100.0.8] (unknown [36.110.52.2])
	by APP-05 (Coremail) with SMTP id zQCowADnfbOGafBqDjmbAA--.19953S2;
	Sun, 08 Nov 2026 20:22:31 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: Takashi Iwai <tiwai@suse.de>
Cc: baojun.xu@ti.com,
 perex@perex.cz,
 tiwai@suse.com,
 linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org,
 vulab@iscas.ac.cn
Subject: Re: [PATCH] ALSA: hda/tas2781: Fix ACPI device double put in
 tas2781_read_acpi()
Date: Sun, 08 Nov 2026 11:42:36 +0000
Message-ID: <20261108114236.3185000-1-vulab@iscas.ac.cn>
In-Reply-To: <87eced7hyk.wl-tiwai@suse.de>
References: <20260917164520.2163024-1-vulab@iscas.ac.cn>
 <87eced7hyk.wl-tiwai@suse.de>
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
X-CM-TRANSID:zQCowADnfbOGafBqDjmbAA--.19953S2
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUYS7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1q6rW5McIj6I8E87Iv67AKxVWxJr0_GcWlOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCF04k20xvY0x0EwIxGrwCF
	04k20xvE74AGY7Cv6cx26r48ZrWUJr1UMxAqzxv26xkF7I0En4kS14v26r126r1DMxC20s
	026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_
	JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14
	v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xva
	j40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr
	0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x0JjUgAwUUUUU=
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiDAIFA2rv4qjTQAAAsU

Hi Takashi,

Sorry for the very late reply.

You are right, the double put was already fixed by commit 8bec01c80e79,
and in current mainline (7.4-rc1) tas2781_read_acpi() no longer releases
adev in its error path at all, so there is nothing left to fix. Please
disregard my patch and feel free to mark it as superseded.

Thanks for the pointer and for your patience.

Wentao

