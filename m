Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.230.112
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793248659;
	b=hc+ZuRs6Pid2KRtqgqhk5WXxfY4EHyxjUNQXECaWF5EaZ0qSU6rTdBuSrxb0b3mJH4gR
	 +FeUo3Gdnr1fwKgyWRgCHgg5MEfUX5BhP4Z+KyyZrBggV++nIflq4Lh9edhVk4xffVxK8
	 U+IvTqh5n7ctwtcvVU3h8hv+h6+fmfzsRqzavIYxnijwPmvYqLEIUZqUODnKZgv2UNOdm
	 xIZ6Jh7xRNQM0ZlvVaSeJ9GTeG2XmW27JmIIYQ9c+TAAQfxf4pyHK06HteuWNaFpnYMYC
	 Q0lrOV/EWTRAPGLL7vZ6WB9Mu0IiOvyvAZ5WfDwn+vYYnGWzrC1pK+vah+dJj0g8cWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793248659;
	h=DMARC-Filter:DKIM-Signature:User-Agent:Message-Id:X-Original-From:
	 Content-Type:X-Lms-Return-Path:Cc:From:Subject:In-Reply-To:To:Date:
	 References:Mime-Version:Content-Transfer-Encoding;
	bh=pxx2va2K2g7IdMw0G+rSebc/KMLdkp6PwljQLQMAqII=;
	b=kEoU7E1TUWaLXNW8LjjLEgeq0rXOwf4iJdRV8xRf8VUMueY2rzBtZLUCTkhGj6NZW0sd
	 YQJ4Tuv+cSyEWdtpGHoAJ49YoHqg7Nt02zkXE8G7R9S9biij9wgnBiWdAAMo+XjKs/8sx
	 YU2qUflYhYwuiUNhuqsvdzAl0gRCQ1GAPo4iXvVIHfUrEznQ8Ib7Vy2yp3k6XClbahvbi
	 0zNM9zcnd61ilqAUAfEFLBTyj6eE7qodRdPfVyZxLsG6FaKNLd5JtavXNVg1oY3JYTg5n
	 VkSPm035+b6QiCCHH6Fi1kLruY3vNt/K6M6CKUjd/QFNGGL5hY51ZZzdyVoFsw6NaZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b="oT3z1/88";
	arc=none smtp.remote-ip=209.127.230.112
Received: from va-1-112.ptr.blmpb.com (va-1-112.ptr.blmpb.com [209.127.230.112])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F207E606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 04:37:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F207E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=oT3z1/88
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1793248652; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=pxx2va2K2g7IdMw0G+rSebc/KMLdkp6PwljQLQMAqII=;
 b=oT3z1/88/GKVKEFm+hzibl3+panUZQfdrGd2+tnFYXthn4d8TkUDCWK4edOVPCUOch6pKH
 wTTPdtUJjkcFPYFjaofOe6n6c9m6YMfzYl1SmzWJwCVv6ZnCeyZWmtPIWTj42qGswMGZc1
 82hUy8kSTAoueW0mb+teYd6jcQR1JPFMYcvED9qN8okyLOjJraC5p7VzLR+W7UDa1hvzUS
 I/ORUgLWfkH5Q1O5uTcjwEp35OxiFydoOZVjNLW9L+G4BnWMzg5u9zUsRlgazbfOIqEIIa
 o9KRqK3i72PbHoNcg5r9uwZ13UoBDlpX0euvznJuDDE1j19wmV4DnFLwPEowPQ==
User-Agent: Mozilla Thunderbird
Message-Id: <36648b88-c295-4acb-8b6e-25d742d50946@bytedance.com>
X-Original-From: Zhao Gongyi <zhaogongyi@bytedance.com>
Content-Type: text/plain; charset=UTF-8
X-Lms-Return-Path: <lba+26ae2cd8a+b99e4a+vger.kernel.org+zhaogongyi@bytedance.com>
Cc: <linux-ide@vger.kernel.org>, <linux-kernel@vger.kernel.org>, 
	<stable@vger.kernel.org>
From: "Zhao Gongyi" <zhaogongyi@bytedance.com>
Subject: Re: [PATCH v2] ata: libata-scsi: reject data-in commands with a data-out buffer
In-Reply-To: <8ec9e401-4c00-42fe-b997-228e05ed9c2a@kernel.org>
To: "Damien Le Moal" <dlemoal@kernel.org>, 
	"Niklas Cassel" <cassel@kernel.org>
Date: Thu, 29 Oct 2026 12:37:16 +0800
References: <20261027090809.94126-1-zhaogongyi@bytedance.com> <20261028113903.19569-1-zhaogongyi@bytedance.com> <8ec9e401-4c00-42fe-b997-228e05ed9c2a@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit

Hi Damien,

Thanks for the review.

On 10/28/26 9:59 PM, Damien Le Moal wrote:
> On 2026/10/28 18:39, Zhao Gongyi wrote:
> 
> No they cannot, as long as the kernel is correct for internally issued commands.
> But t is not clear here if you are still talking about commands passed through
> SG_IO.
> 

Yes, by "translated commands" I meant commands submitted through SG_IO
and subsequently translated by libata, not commands issued internally
by the kernel. I will make that explicit and narrow the description to
the affected ZBC IN and GET PHYSICAL ELEMENT STATUS paths.

> 
> Why is this being checked here and not in the SCSI layer (sg driver and bsg)? It
> seems sensible to check this there.
> 

I checked the SG and BSG submission paths. For data-direction purposes,
they derive the request direction from the SG_IO descriptor and otherwise
treat the CDB as opaque. I could not find a generic helper that derives
the transfer direction of arbitrary standard, service-action, ATA
pass-through, and vendor-specific CDBs.

For simulated commands, libata itself performs the CPU-side write. For
the ZBC IN and GET PHYSICAL ELEMENT STATUS translation paths, the actual
ATA data direction is known after xlat_func() has built qc->tf, and their
completion handlers may modify the receive buffer.

This is why I currently think that checking these paths in libata is the
smallest fix suitable for stable. A broader SG/BSG direction-validation
policy may also be useful, but would likely be a separate change.

> 
> Test details are not needed in the commit message.
> 

Agreed. I will remove the detailed validation results from the commit
message and keep them below the --- separator.

> 
> The CDB may be perfectly correct. The error is in the SG_IO descriptor setup,
> NOT in the CDB. So returning invalid field in CDB seems very misleading.
> This is not something that SAT defines as far as I know, so we need to find a
> sense code that is more informative. Please have a loo at
> include/scsi/scsi_sense.h to see if something better exist.
> 

Agreed. INVALID FIELD IN CDB is misleading here. I propose returning
ABORTED COMMAND / DATA PHASE ERROR (4b/00) instead.

Would this approach be acceptable? If so, I will send a v3 with the
clarified description, the shorter commit message, and the updated sense
data.

Thanks,
Gongyi
