Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792460388;
	b=MRI/ZLu2SbIiaDAnG3g4TvbVgYN9dlID7xuPIjERH0hqdhoWBducly1OAwhoea3/X8zt
	 d7NXIzYt9/AUFWGR7jqE5+pVstFuNVG2vcgvdWgmJAKJoH3cbK/c6pBI5SnbN/342QQyY
	 T7HlPijqywN/iwuvQhW9iwb7mjmWEaj+IXhxYVV6ekK+xTPiZB+dJgfpXi9BlunoAgdAF
	 bGd/lj2BNVmBqm99zPb/gy/NF2jAxDgkECteBdmXyen26l4JdKsB/bX/noqNwUWXEGquE
	 JxcSFGZ9NG9iMnvcToX9YI3b/KrWZ7PrXLQ7JkahKFmPCt6qOW+nGBeIOb7x38Hi4+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792460388;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=RnAh5BgwbBUv22MFv8wV5yaYN/qwaGj857cNozmhPaE=;
	b=uv3U1XLAx5m/IkuCVCKLjHyf6OrZL1+nqhGxqmgDAeSDXa1KauluOnwCgUbtrrgA9sFs
	 MChYulHwm1kx+ddedFtw52DuXc1qrumR533VY5DyoFqoDot4uEmi8VzDy3qraSY/2SiTx
	 QblrW/+hfllHgzP6CWJR3IUGImwWG6q2eqQJAIgUZTMmnsfr3ySgB2T39yQNCPyu10vKZ
	 5jOfYBXwyeI2NvHYJzBtVXCs4egwULl+eN+57cnUHqk+ObEORrb+VN5kOCNcSxFKu0GcT
	 us75bL0OiIyJkHs4D5iXgAG9YuZOmvxtRGPysdLRH11SF69bGjhcB8ltoRi82+C4fow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RkcZ5cU4;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50EEC60A261A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 01:39:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50EEC60A261A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RkcZ5cU4
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3535bf8b3e0so5820113eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 18:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792460387; x=1793065187; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RnAh5BgwbBUv22MFv8wV5yaYN/qwaGj857cNozmhPaE=;
        b=RkcZ5cU4XWT+80H9xiHfw/ZuxBl6gyGBS8H5OG1Ui5ovV0ctyZ8z4qUpRFqR9Cw3xk
         cE1gBX1g/vACLt1CLIrwHL8EmS5VeFqqrm0ueJiNdaRG5pmtJcXR9T0nI7/4wPFmx2Fc
         P6NuIHhpjNjq4DlS4dHIFp7F86kFVhySspEVGioyhs5SYNt0R0L1G+hf/6crdY5kskpr
         nh2IfgchMcIyBNiXQy8wSrHaA5HKlohWQIHEC0fRwpOhVMISs9wo+dk/5Oz2XD2EB5Cq
         WKb0vsQRYsDrrlm5Uw96Kk4QP2RpxUG/EAN5jYsQhxtaIKcG4NpiN9GSXndRffebXt6E
         7YOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792460387; x=1793065187;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RnAh5BgwbBUv22MFv8wV5yaYN/qwaGj857cNozmhPaE=;
        b=WncNDrx0kwwVpubfVcmsCOWZeOEK4e0jnyd/nrG7IDZmd6JOwN5HBUJ5NnfQHcMgL7
         MOdm3LRcBBPRWB4g83Utal7cDUAUPVVYiPGUrv8ExI7RDh3EsQl9yQPZIwktZXE7LdJx
         3L2jgMSKmVphTA9ZAJp4OaenzZrvZkpM2SZ7HzFhftDsvi6s+CfFhm3Lksqsh6oOTB9U
         nlLdaO0t/U8nNlNBq+AGVjEpbHbwuXGIs40OS7t/cI0174ywKlh7PbCXs2r3WH+cbAIY
         X2O4Py3d1w1x1oPqelOb9we22E4HYwMv2e9gjCxQjkB0xnD6ChoBY6jQIN3Kpax77cDX
         +oeQ==
X-Forwarded-Encrypted: i=1; AKwUvBwAOaLCLyLQBkS34PwW+TV+T8UUuD9w/GsDz6NGwaUEuoAWgzxYh8wFEBb5A4ETFp3EvA90JDhnqYYBq5s=@vger.kernel.org
X-Gm-Message-State: AFq9FYI6Y4mVa70Y8zZt9tPgu0XGYyS2rb9FLGQvcAdccHHg25B8ZYx8
	C31q32oNAADzqILCxDrGPEpu8e1xQCZOAsEBgdncGc8lP7lJlBR5arW7
X-Gm-Gg: AYBFou2uYDa4VNF72xsYN6zuryJJnrWzfKWJZ4KVSNFnpPfuh7MTFE/a5dJ2ulpp8ux
	yXssEWBiGUHK7K5ycd/pwrWfGFtWpcUf2VBSLigD7qqK4ICph/0xrOG8wCKvexdJ3tfIEzWQx1p
	E1N6t9rFt9b0BG3ZmWJ7B+/+9jFv81xBjlVjHtgFYCW6gA1HibVbE8QSUZxxFUk/RkgTVjlqlmD
	23TMh9dmOl30XyDgSMSmwzdAVU6YUvlfB5yPEVbBoFiTV2ynKZUCc7z6ert3h92s3yvVHwtvsww
	rq13vVRJq0fMGHXKSPBisMhb9QGxuGYnwE5AETLwmDF5HYIomNP3baSPH21Okkj0ELZ4c05DzUA
	lePvwS9RjchD1dXNlwpuQquDN7gGcQhUZltAcieC7M1Pd3U9DCJXBJfSJ2JAKG6Lk15A/yHDxo7
	wAMeLRwbg6DRG77qURyoTS0CoXu6jIgmknikzh01DLCUkbLly5QcVh7Mcfaq4L+tjCoGvM9NYHZ
	aA4MpdPUl2N
X-Received: by 2002:a05:7300:7a99:b0:358:f678:46b6 with SMTP id 5a478bee46e88-361a2343165mr14073141eec.22.1792460386817;
        Mon, 19 Oct 2026 18:39:46 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3608258aa66sm45216643eec.20.2026.10.19.18.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 18:39:46 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 19 Oct 2026 18:39:45 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: linux-mips@vger.kernel.org, Wim Van Sebroeck <wim@linux-watchdog.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Eric Biggers <ebiggers@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mingyu Wang <25181214217@stu.xidian.edu.cn>,
	Robert Marko <robert.marko@sartura.hr>,
	"open list:WATCHDOG DEVICE DRIVERS" <linux-watchdog@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, manuel.lauss@gmail.com
Subject: Re: [PATCH 3/5] watchdog: gpio: Support watchdogs with a minimum
 heartbeat interval
Message-ID: <cde332c2-3628-4bac-9a4e-55d85fe06628@roeck-us.net>
References: <20261016221617.2223004-1-f.fainelli@gmail.com>
 <20261016221617.2223004-4-f.fainelli@gmail.com>
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
In-Reply-To: <20261016221617.2223004-4-f.fainelli@gmail.com>

On Fri, Oct 16, 2026 at 03:16:15PM -0700, Florian Fainelli wrote:
> Read the optional hw-min-interval-ms property into min_hw_heartbeat_ms so
> the watchdog core defers keepalives that would toggle the GPIO too soon.
> Reject zero intervals and intervals at or above the hardware margin.
> Devices without the property retain their existing behavior.
> 
> Remove the arbitrary 65535 ms upper bound on hw_margin_ms as well. There
> is no register width to constrain this software interval, and the MTX-1
> watchdog needs a larger margin with a 1600 ms minimum ping interval.
> 
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>

Applied.

Thanks,
Guenter
