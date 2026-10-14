Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B75AE282F29
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 02:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791943836; cv=none; b=m40dTZxcHkMwulvWopd6/AY52IxbFJT1THURNlVQw9/3Yb749EkcgeCCAkTuiM9lCtEAug7YiGJMmIk6KlNHcQVWEyNlvQHihv/odW4BK98jRXvNjckeLcym8HlWGMXYL/Vk+7dhOA3qSCiR+yszWiJmnVglyaOCHnbeVBCaK+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791943836; c=relaxed/simple;
	bh=KtaEU7sj2PuGXbpfM+LYFyZ89q0BnTG4FcH/WMxLoic=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BnsPmiokS8QtFxl2qjO9Lnhk85o6pTpU8wyk/0vE2mchgokoqKL0VLzX/7VL7D95y9geQFtTQJ0urg2mMcgKveUzNc/+j2dkbLVDnVif7Sn7g+fEE7aLyk5e26D5afsQstpiTxCsa4j89vPyknd3mYGs45qiOOC13Mlm/UCi/ZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W+hhKPxc; arc=none smtp.client-ip=74.125.224.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W+hhKPxc"
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-6798c43a3d6so95548d50.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 19:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791943834; x=1792548634; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cRjP8gjRhD2hEIgMLkkzEH7pxode4Ix444M49K9RQmA=;
        b=W+hhKPxcYsH8ndYoCGFNnvzAYAGVoT1AMS0vbdF8gvMuVBr8U6GQ8z5e/CaH9jCuob
         5b0xMclUhqtzHRiu54phDUip2DNmgcBt+oM6v4hCCnRNlR6EZ2BOCIeBvITCgLbJF/Yp
         tPMoQK9TRIoXkGJBPw1UpAIQivN/+/OFC/QjPpj9cvsDfVDXUTajqxwr4XQ9RmLzcjeT
         ExUAk74kSucSSgbeaQiXGJF6bEMaY9t5VpzHfRdu7jxcTfqCfgjmT+rGgPn4w96hRrmJ
         sa+XIQhsdDcNZSPyXgR4KlXC5QvJtzcvnoqDleoBFmz9V4ovrgpoXq7TnaM6R9D852/U
         aT4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791943834; x=1792548634;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cRjP8gjRhD2hEIgMLkkzEH7pxode4Ix444M49K9RQmA=;
        b=Y+6OjQvS1wQavrOuL7I7Kjuf+wly082Mj51tgZOzg6Czv455cWwXbxa8WtaZzhwiOW
         ffEMhroq/mqJnpNKvIMNbt1yGtqmwr9/jup9NWLEE5wrtE1RLAwSEgJ78tPLzZvd7+qM
         yXUOGwXwutdaUaYT0NRMDR0wMBZ3UoF13VaYoKG44+X0P6le1DZTE2ZVmDkUDovI3c5k
         zs3O8/PHMHRIL+MOQAIMtKF4hb0BTkH7FUexMSE10M2XkRztrwJB/+LKlYI0L5d9Q2MX
         X5AXhRa7ZO8MlrA48+dcCsMDTgayuhkp8IeSRkqWOxbOlPntNKiP4kjMUnPAsEflTBCI
         1JYw==
X-Forwarded-Encrypted: i=1; AKwUvBxgiJ2F18iINnoYypl47vJ08f1WtOZh9y5FCV/fadgyJWVUoZ9OC1mNP4+V+0kmDtn6+wb7IdxQ99KVX58=@vger.kernel.org
X-Gm-Message-State: AFq9FYKDZxIIv3IhwO4cUAn8H3oG/lrWKsX3UMkBd+9kEL1EdFpWsaL2
	F0AgBWba6/gZnSoXLUgOQwVSxCkMHmGp7pvjoEm0ItuVtTqxHorzCoT3ZbqYjg==
X-Gm-Gg: AYBFou3bfNG0q4h/baYbUDUC9AWAHAHW3Yoft55YKJrxzwUHA0ZdOvGtg2xNMGqKdGY
	6hggyHtW1UI31Zx+Zw/Qa+zD3oSDNAUikau49oNLwdhWkGMNR26iZwizCtOXQLbsRRXK4/9OXme
	Cvf2lTBrJrsdsrl1abon6fBW0ZsHcbZOP11MB2wwBHE8UUXHwhDJpxJJGUFxVJLnVm7526sxmTf
	+0tqV+2x7VPVFp5uyiwmqocs+YKZGElLXA+/GXyjKR6u+818aZyLyL7I0s6alQ2H73UBOGcMhfH
	FcDDlDTpGBeBVZFpMPjwuVtn4jgraRYLqw9w8luNnfiRx1ns9aF8D8nodZuRUajzBegelm3/DKI
	1lxWEqbT1aIC3tpcHDb7pfVHZB0G6kBWznMI1blmxTDwZTpmMl5kieOWTsv7R0kt7eUsO+bJYLE
	P2qKplomSUbzrn/tCqkoBgHAH6wA4kyUnqESDuhYqLiLhwCtjuEmmyfirtuUFhnTWxzfPfdY3JD
	bbz05QAZwdMtJHVD1kXkiKNCErxV9CH
X-Received: by 2002:a53:ac94:0:b0:677:d477:b9f9 with SMTP id 956f58d0204a3-6793632c3e2mr4573867d50.142.1791943833687;
        Tue, 13 Oct 2026 19:10:33 -0700 (PDT)
Received: from localhost ([2600:1702:d60:1bc0::46])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67986ab3554sm529677d50.20.2026.10.13.19.10.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 19:10:33 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
To: Magnus Lindholm <linmag7@gmail.com>
Cc: richard.henderson@linaro.org,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Subject: Re: [PATCH v7 4/5] alpha: decode and acknowledge Tsunami system machine checks
Date: Tue, 13 Oct 2026 22:10:19 -0400
Message-ID: <20261014021020.3842132-2-mattst88@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261013211551.991723-5-linmag7@gmail.com>
References: <20261013211551.991723-1-linmag7@gmail.com> <20261013211551.991723-5-linmag7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, Oct 13, 2026 at 23:15 +0200, Magnus Lindholm wrote:
> +	/*
> +	 * Table 10-42 selects the ECC fields whenever CRE or UECC is set.
> +	 * Mixed ECC/PCI bits do not establish which error occurred first.
> +	 */

10.2.5.6 says the register freezes on the first error and only LOST
can be set afterwards. So mixed bits were detected together, and
ordering does not come into it.

> +	/* HRM 10.2.5.7: PERRMASK gates latching, not just notification. */
> +
> +	/* Preserve each chip's transaction and the NXM source before clearing. */

The first comment is not attached to any code, and the changelog
already makes the point. I would drop it.

Table 10-43 gives the PERRMASK reset value as 0, all errors disabled,
and Linux never writes it, so all of the PERROR handling here depends
on what SRM programs. What does PERRMASK read on your ES40?

> +	draina();
> +	tsunami_clear_errors(&live);

10.2.5.6 warns that PERROR read before the error reaches DRIR can
come back with INV set. On a 670 or 630 that races with a new Pchip
error we would acknowledge it with INV set and lose the transaction,
along with the 660 that would have reported it. I would leave the
Pchips alone outside 660/620.

Reviewed-by: Matt Turner <mattst88@gmail.com>
