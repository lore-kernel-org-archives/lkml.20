Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793736275;
	b=F2E2Lk5KuYUkkDhfY166U7L+GrqyE/651ZXivDMseY1voaYVFcUufjjFLn47XjutTTkP
	 1yKe7kuChq1O8HwUcEAg8l9LBn0D1eqA9jlNlLnjC3lskuNDPEEkpQI3fpsIXQcyoOD0l
	 30K1Nz0QZ0ypeAawd7TI72frB9yp3gm6TFc0qhtNDVDYjS3WDPPA0RdEyRU6VNlLkCqYb
	 sNnNKdnzbuC5qEgiVUfL+ZI9xSe/UzxK61i7HXZzfVY9WW5EPP6JnkeVRLO5sV11C5dsy
	 AMCEX9WBp4mRHlnBeoaqygez95sPxpC02MmfhhLcNRurKWddCi7T178del99m8PUfDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793736275;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=go4AIpvhBkoC7ZGd8wKwZdjhT/BPEGzJrSrX2YZDWhc=;
	b=ziU7UfCrEk6zLF372VXWvoGj+AN7fLCONt3lVsSmPLQ0pZmUQEPGi7XBT0FJtu+tkWaH
	 WtkuuvBGxTbtM/j7/GFuEJ5Td2jqug0RlkHyzKTnkU2z5tHsnyhmQEmDiixZPuVKAwXE3
	 GK7bv9BF5+hHLjWN7V8iyyaj+PVpj1ePZNp7f1N3g7nETiuqda4RPbjx9JulE9NJnfecQ
	 F2Sr+t0alT+oE1gMm/BfRnre0vrpudkyg6soo2PkBaF3fvfNttLhDcPLY6w+q6ucl3WQH
	 aaLdE2zeCAQbTo592mp8hCUbWO/uvjOTHC4sQJoyn0AYDYTcUzv7BaIczJLw3ax8c3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MY3vc6Gb;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D7BD606A336
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 20:04:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D7BD606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MY3vc6Gb
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-36a18fc7a38so8824257eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 12:04:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793736274; x=1794341074; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=go4AIpvhBkoC7ZGd8wKwZdjhT/BPEGzJrSrX2YZDWhc=;
        b=MY3vc6Gbvvfq42ubgxn7ZiALrft/xLB+7RdNtGFpyhdTAWULvE/ASxqtUVijeZaLAG
         pFKwTl7Old40mDX8hTr504VOvLwRmf6WVo0XKxWHImHyLsyuvO5cI1YC7tyUOb9E2Ov4
         ZupY/VOPLYTmU/TSmjc5sIO5R0nqbRrhc3gWtc1PAW4PGvUZRAa5TTXXr/Ol/wguGV04
         /NyrkwL8H+JcKuFKPUwQu2sHRwhVoxKd3+a7lgDpWBVwlzlTOj+u8qnjv3odQL7LHfl6
         id4GY7sKuMug1ts1LrY+1VLRHv5zI9HugBWlvGhAGFXapCIpnKpd9Sz4vKeVcJt7nGUP
         lk5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793736274; x=1794341074;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=go4AIpvhBkoC7ZGd8wKwZdjhT/BPEGzJrSrX2YZDWhc=;
        b=oeB5iBVkjsoEx60xm9Was+lVx0FiXwy6pPJD8eqFtz76HjxeRe0HHB+ZQtcGwsZOiv
         AWCMtxhO6PEkm5Cp3SPv2yXuaSeRgruJcHRf07XkXrjlAbXIsaJ2IYdCd372JVVaNxyY
         0lUfSlL04pQu4Z043d02EDnkvAx1aWdMdhRzI76CWPIMptT1pc/ooksvg3TtT6omU8mw
         5CBCKwEnggQyqPP7/wixN7clQy7M0+LWgNlZG6a1z/xuKwqMBMuEPWZMRq7ssfrQl87S
         zSBhuT/CmyE/3o2gBa9NKPvZwQ3s9+hZufKXq2cLVHd/KVnwVhKpD29zi+WeJ8s+tC2p
         aenQ==
X-Forwarded-Encrypted: i=1; AKwUvBw/5mM46RdktWbaHcyLiX1Namat6zQc1gb7dtjZOYqnI2RwHZZY6jBnbwMk7jSAgMf+dAznMZOQ87zK/TM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Fl9EtUySXlEPHdDw6s4SWe78er1HnF7IxygAZ7PTB3IcxEoId
	kqzD4m2TjSOSGuhtQ2HXL+yONW884vxN4jm3z1U9WsTt8tJjcUnv5Ta4
X-Gm-Gg: AYBFou09TUBNRCuim9I4HBBzCRxL6kz/VMhPLcmGbtRqh1ZYBs1LFhOpua3KR8VQP5G
	NHmovIZHTTLRLouNc+BSdTmlpE2aZ67DIIE3iIAyp130WRR+piBBCRMejTEO3o2/Jqt80Z8fSde
	AvxtcVN4fJDhN1ceRtYmM2Fq9XX3YdraF2NRpxhtPIe4zQl5y2O6m6Zouz0rQ4uGfYW4rDQ0e2Z
	kIIQwoxZsfmmwAX9yeFxRzdgp7j5/4d7gpTNiwIqBOaByB4lehh5J+yF8B90/Vm/VCd3eKQDDlc
	RBuqOjuDEA6KSe71J0Rgrp4JsWKpeAhoWtUxv5+4/llrGIyuz86FET23smHv6N0BqI1OM7lIW/O
	yKN3dGS8OmvYaIXqWmlETLOVx95d92yMzq1tZpBO+mtv0D07mUb43k/HCVpS2E1yP39flPO7+wG
	xRuFbAql7WUoRTIp0leswQA7z6I58QYljAJkssNUHAVkqyFSGX8ONL8jDkc3kHPZHcugaQQ7Jgf
	eQJ4kO0JCoJvhGZzz8GI2ECtk9oroZBVS8qBscedpnr9uauobvCmsOTSoggchiFZEli3aZ6Tfkw
	CYLW7LvRbEWW9Rz+s9k20G5E7K3BTZ+06mcHndLsRhkskB3q747BDlPFmks85gdzfSYr
X-Received: by 2002:a05:7300:824b:b0:36a:1c75:8ca3 with SMTP id 5a478bee46e88-36a4221b3b9mr19658147eec.1.1793736274072;
        Tue, 03 Nov 2026 12:04:34 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:88b4:22ec:d621:c1b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38a6160sm368905eec.9.2026.11.03.12.04.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 12:04:33 -0800 (PST)
Date: Tue, 3 Nov 2026 12:04:29 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Mika Westerberg <westeri@kernel.org>, 
	Corey Minyard <corey@minyard.net>, Hans de Goede <hansg@kernel.org>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Sebastian Reichel <sre@kernel.org>, linux-i2c@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
	openipmi-developer@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH 2/8] i2c: docs: update i2c_smbus_read_block_data()
 prototype in writing-clients
Message-ID: <auo-JCn9VES7OwX5@google.com>
References: <20261024-i2c-smbus-read-block-data-v1-0-19bb97467982@gmail.com>
 <20261024-i2c-smbus-read-block-data-v1-2-19bb97467982@gmail.com>
 <auI4Qq1KUo7YYVtG@zenone.zhora.eu>
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
In-Reply-To: <auI4Qq1KUo7YYVtG@zenone.zhora.eu>

On Wed, Oct 28, 2026 at 07:00:49PM +0100, Andi Shyti wrote:
> Hi Dmitry,
> 
> On Sat, Oct 24, 2026 at 07:48:42PM -0700, Dmitry Torokhov wrote:
> > Update the prototype of i2c_smbus_read_block_data() in the SMBus
> > protocol function table to include the length parameter.
> > 
> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> 
> Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Andi, so will you be picking up the patches affecting drivers/i2c?

Thanks.

-- 
Dmitry
