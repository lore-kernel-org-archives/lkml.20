Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.226.251.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794066543;
	b=F/gK5ut3s1lLrhcHQwkbKAhq1oLXn3UcSCwPug95Tjqd5OlCViGGKgB+mzefJPQB71TG
	 bXeL7aUVhSSZiHSDYRK7b2tadb8LDOesvahphbSykc6hZdQMP+mlIMdTE5LINui3bET45
	 iINSHDFzjFd5wgCNRj2qCGH+xKcXQsISCBpZJP5Sv7Wa4q8NoWzkLmdkYsyiscVJM7iky
	 co726IePDOj80f+WSPCoXfEfYx1js4XsBXlPWXPP4fMmLvWQVZIhaRts2ooMb6mdSWpXf
	 Nepu5HVD7E6M3AAbQYomqZmb6bjSH/3cVezD9iGKPEkasYeFmU8WW/llm01b0/XNz+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794066543;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:MIME-Version:
	 X-CM-TRANSID:X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=fahaI6OQq9x7YGfJC2HqAOOcI8dBCMqnxeW+48drme8=;
	b=Jua6AjRA2LkRaIzbeA6/Wo0yDnqEY4rNDjDicyLovptn1Oe2ZDflUrtFIND3njkA7U4H
	 qvXleqA1skaRkMDGzM0xokx+EYa6dulVE2pbWOoslLIzjRDVIL8VRUzd6DH3T03CngP1E
	 CE66kMLyM442pVJqAgTafCLuP3gQH/4Kbx6BM1HCF8KsKDQiRITpS5WPXGllHb2Jv22Si
	 8fNuv85am3MJwoRjS7sy6aqKwYvz8PczidscojNav0GyFPX0z2/FO6JP9hfxRon+xitks
	 OVhtLUgLRqlyFx7mbZO8979jAzZUO49xYzeHr1aXFPp/xc4Gx6wrX/G2HjZQNFU4L2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iscas.ac.cn;
	spf=pass smtp.mailfrom=iscas.ac.cn;
	arc=none smtp.remote-ip=159.226.251.81
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ED56606EE97;
	Sat,  7 Nov 2026 15:49:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0ED56606EE97
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from [172.100.0.8] (unknown [36.110.52.2])
	by APP-03 (Coremail) with SMTP id rQCowAAnLI1oSO9qDTeBAA--.3305S2;
	Sat, 07 Nov 2026 23:48:56 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH] usb: host: Fix companion leak in usb_enable_intel_xhci_ports()
Date: Sat, 07 Nov 2026 15:49:07 +0000
Message-ID: <179406654707.2627727.1039519639342632226@iscas.ac.cn>
In-Reply-To: <57369b29-27ce-432d-aac3-b86c71a08330@linux.intel.com>
References: <20260916164840.2085101-1-vulab@iscas.ac.cn>
 <57369b29-27ce-432d-aac3-b86c71a08330@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-CM-TRANSID:rQCowAAnLI1oSO9qDTeBAA--.3305S2
X-Coremail-Antispam: 1UD129KBjvdXoWrKrWDZFW3JFyDGw18WFyxuFg_yoW3Jwc_Ga
	yqkryqqa1vgFWkJF1Fkr1Yy39xGFnF9r9rJrW0v3s2krWFyr1jqas8K3s3Xw17W3yIgw15
	tF1FkayagryjvjkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbxxYjsxI4VWkCwAYFVCjjxCrM7CY07I20VC2zVCF04k26cxKx2IY
	s7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4
	kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_
	Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE14v26F4UJVW0owAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IY64vIr41lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vIr41l42xK
	82IY6x8ErcxFaVAv8VW8GFyrJr1UJwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F4
	0E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1l
	IxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxV
	AFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j
	6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjxUwt
	xhDUUUU
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiDAEEA2rvPp4OcgAAsT

Hi Mathias,

Sorry for the very late reply.

You are right: pci_dev_put() should only be called when the loop is left
with ehci_found set, so it belongs after the !ehci_found check or in the
match branch before the break. My version released the reference
unconditionally after the loop.

While checking mainline before preparing a v2, I found that the same fix
is already merged:

  e93731c29f74 ("USB: pci-quirks: Release EHCI device reference")

It calls pci_dev_put(companion) in the match branch before the break,
which is equivalent to your suggestion. The patch is therefore redundant,
so please drop it. I will not send a v2, since adding the put again on
top of the merged fix would release the reference twice.

Thanks,
Wentao

