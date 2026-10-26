Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792976314;
	b=H8ra1NwmqyX2LOzOjPXVYibbC+pV+LKmRqFxevWdHCOx4hYfoU6h8IOiDb+mUaPZwS73
	 ONMt8C0Xf9OD5QXiG0daf4K3sFsOspfEUPlDIk1oXbedTs6rGugqe//LHOuYcu0eMCEGz
	 hWvUZGd0ayD4eHlRRBC/AToY9Jy6TnAPtBg20z+tpJCFwAozSA9nv/gw0g00466aKWnfK
	 zlvRBRbaa2tddRuwowdwekt/AOT85CM+EIaiAWLPS5HYry8+A0ThyLppLPoOjtN6Qjw4g
	 v8W2dTlsTtBS9ainm7XymUqB0Z5Mdgr6+5hAkF52EVZ7Dvaf7PmSk0XYTONeHU+d2Mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792976314;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=V6XEtkWxuej4IEYIwv0eUDHd5HsULUW/pPlJVdLGiWU=;
	b=sOzxIInX88V137VoPuLCgxlVLB8FWpjBsmLSsri3QWYO8+P/7l33HncXy3zHgDgMlWlE
	 26N8x87cX3c/715lvdx5jCROfwttQ4AWm6VrvkPxHOqGvkxpjJ7/xwVtUd7lDp4qFvvPQ
	 pwBuSMhlOqaPIniBAlb6AYJfBZbdOMxAMt6pQVuO/vq30gmQS0ConisCtcKX1FaNk9hkF
	 O9sA715QN9xZ4s41sJOSH2dToeUrwfls6moKfMTgNAEmtqaN7rai/oc2I5Ai8hDsbBBLJ
	 SprCY4vRoayupJU+sOrppHkO1tIicUT8b7D7ga1b868x8ne3/O7pEiwRzKTJZr8WPQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=f+CAz1ZK;
	arc=none smtp.remote-ip=209.85.210.171
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1A39606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 00:58:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1A39606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=f+CAz1ZK
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8a064dcfcfdso720739b3a.2
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 17:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792976313; x=1793581113; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=V6XEtkWxuej4IEYIwv0eUDHd5HsULUW/pPlJVdLGiWU=;
        b=f+CAz1ZKWhBKwDsPwUx64Uky52lZvae9T64JKjHaNee/0bBgrRCJvH6GzFOuPRcqNJ
         fWNWnsv4fLDSSgDXv/1mStQdRmFa9tY44zaBzg6/xQeeDNcTYHTbfdzp+dmwLLRbsEtk
         BTRCD7wZYH9sOuf17HIgIq8Y4lOuZGRjLHYIdaeRLOv8oJw3rx84/DTPLOTxPCpiFZml
         EfOolz6iO7kdUQdV5abRQFVvcxrUw3RDv0LDhRAfEe24zkWqRlqF/Xea5VgZ+4zI69Gj
         qok77+IPJX8463Vi7CGb19Jdecyci/xtKFJLijT0b0kC3TgsgfF15SyAbrxo+odt/9cy
         g96g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792976313; x=1793581113;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V6XEtkWxuej4IEYIwv0eUDHd5HsULUW/pPlJVdLGiWU=;
        b=vZrwOl9X8cOiE8xUIZegvFvEdeeK/pL7hqXrvLhMiJn2IdosLLC6ieCLPZ5ok2ODM+
         fYelHvVg2tWhdDufH0fzp6FG/AYgWn4VCGaWyNY1DfiXKIHXOHeS4lZuA/Vk8Iju3BE5
         rB6nNs416QZALfX+8x/BwaVxFk4k7EgrmqO4UzE/N6RBdyNuJhk02d1URXerpNKYlU84
         TAZ1g9KIjpvOcY/NkoLHQfvU/+S12SRYQVtmRE1IANdFdnj1k4GtVBHVxteZ7lpvgBup
         O5OnBAut/ShCuffYjfqW3pml86iboPf5U1tQU9NEUyDGArcpHg8gPFXHT8lv0Gzk0XWZ
         dgew==
X-Forwarded-Encrypted: i=1; AKwUvByaYCHqcGqzWPSS8tGyAbtnOhae6i/CYfjZAbhkvL1LvWnt5XrVr/YOrUCieDPqJBAiDmuun/BJK3XVFz4=@vger.kernel.org
X-Gm-Message-State: AFq9FYK3gPSgdSEHP+dQ0tNuEuhtqDxi9ZNy4YIytv02O3mAHD76/+Ql
	Czg8IQWq1Tf79iEH6pvUk+LPhxGb11TG+gaCztIq+ShW+Snd8WT3DVtO
X-Gm-Gg: AYBFou3f5msorDf2BwXvHjC8pFBL+cwkD+4QuD89gimOAo6bkOYTVUdW1fhjiT05j6u
	i9dWZbikYoZB/IPUe/450vSZIitjcVo6oeXKvo+38xBEV3uN9TH95neDSp6TK9LhX5U/uvc0ylX
	OsqmyR8S8qfFIuDtVrO2RW9D+wxzM4JnZ4TZryzPSbrhDuQfkzZC4HR3Qz14SQrnSkM1A5bquV3
	EsxpKEKa/M/JE+KBBEst/XfPIQcM/8YRlmvQH7LoljctH5Tl0SwJcFAp5bsT/9qDSYDIBc0uNg2
	ucgMMrmuRBGQbVz1T7KFhLvNR7wwPAIMzvrUPBX22mByQfezE2P5TTefedichQDHosAoMItIAPH
	Ag+XBedoRZ/wKhq/lFfHjOrf2DlSYsRfb06rLe2CWwD2aiYnV5bsEvh/ED7yVGu7iRx+eRT/6pX
	jhM9o+ML1PjHzNOrLcL9qb7lFFOw/hVQnRX2KgdB1GLmO/jG9NjPowNfkZSdw6y/xRg7FyZUtbs
	aB0G5KjztzxOMoenF7T340PadDOg6ZpKbUNIf9b0Urdpx8svCndaDZTv0evmf5c3zSwtw==
X-Received: by 2002:a05:6300:388:b0:3dd:85aa:4524 with SMTP id adf61e73a8af0-3e7bfac61c2mr3509972637.31.1792976313097;
        Sun, 25 Oct 2026 17:58:33 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8cccd4cfbsm1063454a12.28.2026.10.25.17.58.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 17:58:32 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 25 Oct 2026 17:58:31 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Jiale Yao <yaojiale02@163.com>
Cc: Aleksa Savic <savicaleksa83@gmail.com>, Jack Doan <me@jackdoan.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] hwmon: (aquacomputer_d5next) reject short status
 reports
Message-ID: <aa00972d-b3d7-43df-bd0d-0778e3336a04@roeck-us.net>
References: <20261021120408.48495-1-yaojiale02@163.com>
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
Content-Disposition: inline
In-Reply-To: <20261021120408.48495-1-yaojiale02@163.com>

On Wed, Oct 21, 2026 at 08:04:07PM +0800, Jiale Yao wrote:
> The HID raw_event callback runs before HID core validates the received
> report length. aqc_raw_event() reads device-specific status fields at fixed
> offsets, including multi-byte values, without first ensuring that the
> received buffer contains every field. A truncated report can therefore
> cause out-of-bounds reads and update hwmon state with unrelated data.
> 
> The required length differs between supported devices and cannot be
> derived from the HID report descriptor. Define the minimum length needed
> by each asynchronous status format, select it while configuring the
> device, and reject reports that do not contain the last field accessed by
> that format. Keep the published length zero until probe configuration is
> complete, which also excludes legacy devices whose status is retrieved
> through feature reports.
> 
> Suggested-by: Guenter Roeck <linux@roeck-us.net>
> Fixes: 0e35f63f7f4e ("hwmon: add driver for Aquacomputer D5 Next")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jiale Yao <yaojiale02@163.com>

Applied.

Thanks,
Guenter
