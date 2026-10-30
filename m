Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.230.115
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793330388;
	b=FM84FSwseHcEYr+PLTX885ts8j+IJ0Om+mmQ4mE1WYzJhlxWW983PbbiF+39KhDfj9cy
	 G1aqPKlxPwdbwdssHJRUshdMi+H52Uv5UErOwkh4ZFA73Ex/yjiAC9osQ80ywZY41iGlI
	 WAo+1hQ9AD4mjSxDiOnYZQ0SaQ+Rm3AetqBV5T+g5M4w8ySDpmpz3C6YewG8XpqEN0iS/
	 97dLXJPK4O7AYv358T92jvfpxovmTTgvNbbEEb3tpEgXkz5mS5e9wC4MPzVozxQJhwW6d
	 VIxZnlClnwXc3QfLnDPIO+llyz9wDuYMPg1W9zFBCLc98dnVfr/d4nlGxA7TbKhs/Dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793330388;
	h=DMARC-Filter:DKIM-Signature:Subject:Date:Message-Id:
	 Content-Transfer-Encoding:In-Reply-To:To:Content-Type:Cc:Mime-Version:
	 X-Original-From:From:References:X-Lms-Return-Path:User-Agent;
	bh=Aq9v+lR+69tefJzwDk3e5NEUrfsI19OpP1La3FWUUsQ=;
	b=3FUrvTQiBuHAdqw1svoNX7+YHBx5JLexIiqTndRo3CvOFbjhpT3e4oSJfmCWmE6hhetr
	 uWXYAHqgdyOk9L/kUCiuTBNur7P7+RbniZsacWrmw/5Yuk2/rpAu7bYmEqro0t3xpV2Vm
	 8f3RgQ2XsuQxx40vqsU/ICohCFJxI/heqw81G6bA48TsRHPE/ufDK+B8tIn4VUJjyyPpI
	 Kbi5+h5R8uysskcQ3piL2qww7ApZlYkFrBBbTPBxa6UzMszpDSu9jPfQ5snNBjJjyvQNP
	 Kw5y43FHIJZYakTLnVqAe05Blg4uHauUbzXghd7pMQhyWLbn7zcbe/wLqEJdnj7w+UA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=aG296nZc;
	arc=none smtp.remote-ip=209.127.230.115
Received: from va-1-115.ptr.blmpb.com (va-1-115.ptr.blmpb.com [209.127.230.115])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67631606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 03:19:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67631606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=aG296nZc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1793330381; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=Aq9v+lR+69tefJzwDk3e5NEUrfsI19OpP1La3FWUUsQ=;
 b=aG296nZcS8xM5SqFXaLXGJ5NDgsOvHtMk7swfpcSt8WDDCpYKJf4PKaSgZlcjClBiqu1nj
 H6NT5BM58GVmu2/ne0HP67D/a3BnwG0L3oS26GqD8/hiRrV/7/eEWs1XUAtoD+x5QjSeZ/
 HZvRIeWvrO/I1J2/zgbK/SqDqhv7vsNcZHDARExOIIIa3opwY59Fr3zdrohb+b1NocAZOo
 SivHmWpb58MNIBax31MsRVuEYtm7Ftli8OhPgtdfM3c42uksiG79eHpMs1sPVZZ5PHIzhQ
 0nhdVSwgWKl3xmznwJY+Mrq44Fvw76GUcwpYBnYQ2901bt7Eyvy2/hN6Gp135g==
Subject: Re: [PATCH v2] ata: libata-scsi: reject data-in commands with a data-out buffer
Date: Fri, 30 Oct 2026 11:19:28 +0800
Message-Id: <0a4822fe-f283-4cac-8ca3-91f4e8f017e2@bytedance.com>
Content-Transfer-Encoding: 7bit
In-Reply-To: <2def2444-0b73-4371-9ba2-78af235e64cb@kernel.org>
To: "Damien Le Moal" <dlemoal@kernel.org>, 
	"Niklas Cassel" <cassel@kernel.org>
Content-Type: text/plain; charset=UTF-8
Cc: <linux-ide@vger.kernel.org>, <linux-kernel@vger.kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Original-From: Zhao Gongyi <zhaogongyi@bytedance.com>
From: "Zhao Gongyi" <zhaogongyi@bytedance.com>
References: <20261027090809.94126-1-zhaogongyi@bytedance.com> <20261028113903.19569-1-zhaogongyi@bytedance.com> <8ec9e401-4c00-42fe-b997-228e05ed9c2a@kernel.org> <36648b88-c295-4acb-8b6e-25d742d50946@bytedance.com> <2def2444-0b73-4371-9ba2-78af235e64cb@kernel.org>
X-Lms-Return-Path: <lba+26ae40ccb+7d6144+vger.kernel.org+zhaogongyi@bytedance.com>
User-Agent: Mozilla Thunderbird

On 10/30/26 9:18 AM, Damien Le Moal wrote:
> Yep, these are the only ones we can catch easily. Other commands we do not look
> at/know about will keep potentially triggering iommu page faults, but that is
> fine as that is not a crash. However, ideally, that should lead to the command
> being failed, which it seems we are unable to do... Did you check if we can
> propagate the fault into a the request to indicate a failure?
> 

Hi Damien,

I checked the DMA mapping and IOMMU fault paths.

For DMA commands, ata_sg_setup() calls dma_map_sg() using qc->dma_dir,
which is derived from the direction supplied with the SG_IO request.
Therefore, for a request declared as DMA_TO_DEVICE, the mapping itself
succeeds with device-read permissions.

If the device subsequently attempts to write through that mapping, the
permission violation is reported asynchronously by the IOMMU. I could
not find a generic mechanism that associates such a fault with the
corresponding ata_queued_cmd or scsi_cmnd and turns it into a
per-command failure.

Some host controllers may also report a host-bus or interface error for
the command, but that appears to be controller-specific and cannot be
relied upon by libata.

Therefore, for the mismatches that libata can identify, rejecting the
command before issuing it still seems necessary. For arbitrary ATAPI or
vendor-specific CDBs whose actual direction libata does not know, I do
not think the generic IOMMU fault can be reliably propagated to the
request.

I will wait for your guidance on the appropriate sense code before
posting v3.

Thanks,
Gongyi
