Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A6BD3BBFD3
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 07:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789975587; cv=none; b=XOk0tBASBZwpGQ6oejZZCZHM5h5eANxSUOhi1M9+yLsBUVrimBshFcxfpIHFq2oIOlJ42IwCl4A8vM08O1Yt2V5fxpElboXsLd9EEXNP1/+z8NdtEO5s7l/EYvNYNbkubXs5XqOPw20T0hueNSo9YQZNd96CynVTPoMegYhrqTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789975587; c=relaxed/simple;
	bh=gW55VTjWUuunKKnZgwpBGAw0rI+OMXqcYsXoyr3Oru4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rewMGk1+EaEXsrk/NDrwwo2UL0Fnpa12it5eKgdmF7dj03DF64NPePOkek/adVYSlMqLGAPk86Dyu+6sOF+hRWFszJeVAEfaxFvak/NjT7tpdlXaNGkIeTDbvpT5pxbHl/WIFRkEzStgD2m+gPk9baXI4Sp4C+N9ErBPrBYz21M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b+eKuNqP; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b+eKuNqP"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6350f91so1447847f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 00:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789975581; x=1790580381; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PHCVXbJMono6zgpoiLWH/wQz7nGIA/Qw6pE70VU+b8M=;
        b=b+eKuNqP4pXznfHZM+k7ZBDjArzNhrMmm0wC3EHqFWbAu9WjiR1X1IBJW+gP+/D1UE
         8buV/y6VHvYK2tQahELlYRSTrQCghAtypGlDkXLe+Pg5CZ3Is/uAv9FgFt+07w2XwM4N
         dhXY+HF6UXQQzK1R44L7kN3zkEEhsa2cNnx2Y52mNdoP34wKmBb0GxVDwUxHlYrRnBu0
         btLg6XM9U3farHvgmYmFxkrrHeKbjYw4PZY8v7o2qvGE/xNogGi1STN1MHhHoyudXVAu
         Z/hwdNAMbnClEXj/eTXkh2Q3bXXsapLpkODgOoaetf5yuxU/1m1N7X9TEWUadtDlCNz5
         XD7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789975581; x=1790580381;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PHCVXbJMono6zgpoiLWH/wQz7nGIA/Qw6pE70VU+b8M=;
        b=zeo9tXQuYX8IfE/P7yUnwYNyVfM15nzO9J/k//mhb6fKmLndR/e6tPS4nl+C1Qszsd
         42NWt3iKilTTbID8lUIf7r3Hvbwndh3uAF1bK/QajzaoHuWGyMcxa1ShEaLJULX6UM8S
         eImGtt4WPMNy1JpNigJEWmQ+iu1nEsvnk7PHyiiara2UK8CYIvnpmMFqAsoyb+EBtZO0
         r+0uXx0JTw5GLllkSzoKzk4Ep84aK3JHgkfPJub5INtmhbRnpxbhVTrp7GjX/pg3yvD2
         4v3fn3HPKRvVDmU/7BTuQgG/6Tel5PLUjCzQ6DJxyrYp69/gXhBh/+HGA2GhHuQBbjNB
         bKSw==
X-Forwarded-Encrypted: i=1; AKwUvBwUFHDVRMK/iMFi7VTVD5o2zOfYS2c/Kj7Fzbn2DD2rMu5Y5Ygd7SJ2wMpAeQUUic4p/xFaMVT3H3jp5pA=@vger.kernel.org
X-Gm-Message-State: AFuF++k1XUnnMFvPWndq7dzgNyuwXTtEy8beV5nHoD6WQL5r8ZXeRdXY
	Zxc7WPQFrdZH9W6qkfyFbANmsWnATZF+NChOMV0+S8ZsyuMJieiK05lw
X-Gm-Gg: AYBFou3xgLkQ21arFZ/GgMzlR9MmLFjw6lW5z2n+XiEvXWQK88yfcslLWOxBzqWoAPK
	Lif23QKKUxKQt7ysyTuFGlixGBxULQxQ7rTPDBCZ/tFIVsVPeBddSoz8CAi9i5chfCJbVH1x+x0
	GQpP4JRVvLH7bIw9qX9eV6cdRwk4goCu+87tq26e63fIxaF/LFtxjj0QBWnyW6NfX0bUfWIscDU
	VGg8Xa/UdTdZSy0iUiCVZbH9WBGoWDnQeo5+cgSkG3JFGnBZTcon4pfa+5T7CEMRb9JHe1OZO56
	ch/hfZC+BvXuMBemEATdr8LJDP9WfQT6xYWjxzhEggCoGg1TzaGePeqNF4HgGLWM1xIHeiQq/Wd
	l0bbOh1V32X1bo01n3WxHd54uSZ1vmQ2VAES3jM7Ul02bmSAOFTWQbFjEFpnsvDpnRQ0ur8eVIr
	TfeDyqx5R2O0Xlt0Z9b2Q7wTRBKQhfh2yAG09LVi2sS2JssiuukEwyn1S1ISQF/xNvUSAdwXsh+
	d7d9FBm/g==
X-Received: by 2002:a05:600c:4e8f:b0:49e:7cc2:e6c2 with SMTP id 5b1f17b1804b1-49fc584dc37mr136609695e9.27.1789975580468;
        Mon, 21 Sep 2026 00:26:20 -0700 (PDT)
Received: from foxbook (bez152.neoplus.adsl.tpnet.pl. [83.28.37.152])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc585920fsm575537715e9.4.2026.09.21.00.26.19
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 21 Sep 2026 00:26:20 -0700 (PDT)
Date: Mon, 21 Sep 2026 09:26:15 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Jiayi Li <lijiayi@kylinos.cn>
Cc: Oliver Neukum <oneukum@suse.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Alan Stern <stern@rowland.harvard.edu>,
 linux-usb@vger.kernel.org, linux-scsi@vger.kernel.org,
 usb-storage@lists.one-eyed-alien.net, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] usb: uas: quiesce SCSI before stopping endpoints on
 driver unbind
Message-ID: <20260921092615.7402711d.michal.pecio@gmail.com>
In-Reply-To: <20260920012358.3362053-1-lijiayi@kylinos.cn>
References: <20260920012358.3362053-1-lijiayi@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 20 Sep 2026 09:23:58 +0800, Jiayi Li wrote:
> A driver-only unbind of uas while reads are in flight can leave the
> storage device unusable after the driver is rebound.

Question to people who have the UAS spec (seems to be paywalled?):
is there any chance that Linux fails to perform some UAS-level reset
that devices expect?

This seems to be the second case where some bad UAS state persists in
a device after USB reset (in the other case: even after reconnection). 

>   [ 5138.886447] sd 0:0:0:0: [sda] tag#0 uas_zap_pending 0 uas-tag 1 inflight: CMD
>   [ 5138.886674] sd 0:0:0:0: [sda] tag#0 FAILED Result: hostbyte=DID_NO_CONNECT driverbyte=DRIVER_OK cmd_age=0s
>   [ 5138.886682] I/O error, dev sda, sector 75497472 op 0x0:(READ) flags 0x4800 phys_seg 128 prio class 2
>   [ 5139.077259] sd 0:0:0:0: [sda] Synchronize Cache(10) failed: Result: hostbyte=DID_ERROR driverbyte=DRIVER_OK
>   [ 5141.100631] scsi host0: uas
>   [ 5141.103134] scsi 0:0:0:0: tag#12 data cmplt err -75 uas-tag 1 inflight: CMD
>   [ 5141.103160] scsi 0:0:0:0: tag#12 CDB: Inquiry 12 00 00 00 24 00
>   [ 5161.649075] scsi 0:0:0:0: tag#12 uas_eh_abort_handler 0 uas-tag 1 inflight: CMD
>   [ 5161.653963] xhci_hcd 0000:00:12.0: Transfer event 26 for unknown stream ring slot 4 ep 14

This is actually an anomaly, transfer events should always point
to valid rings. Device sendig bogus Stream ID would be code 34:
Invalid Stream ID Error.

Is this an ASMedia host controller? PCI ID doesn't looke like one...

Regards,
Michal
