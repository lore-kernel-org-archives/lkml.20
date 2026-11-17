Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794933808;
	b=AoTZibXJPr6T32t2WaBB6ZUNP6fi53+o1LILa2+yoy+Zzv7HhXlAJT69WPql+aopiNKC
	 5vIG4sE+5+EBM0vuKdvijrIG+FPbGsHijYU7DBDNWxGahbTy5Af0UKneBCTeqP1bdkFtI
	 +yM2suiUvCVt9qgWTvw+O2qTd7LGax4fplJ5bzGKexVeKwRXB94gihndRZ3On6TcCcFPf
	 z2xzaAN4jsZUAXuaoK0J+yo8hotAo3mogMs3wp/anz/IqnziDTIp4dizqbdJ3N37L3YL6
	 I4wH6xiueyOAFFqES0ToWgk54cAPGAes9oSknGTpjjDX/b9IS+xWQFhX4TrSdTQMyvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794933808;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:Mail-Followup-To:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=0efr/JUIIgLD0b1S3wAOzRoCj+AKw4Bk4eSMefVZLyw=;
	b=hBgrhJM5hMlJPD3ndHVvOwyIeQHfQq4b5tHcA+Rj4iLMXII59EY9Ssix4a9hRw0ZaErm
	 nNrJ240pAbdYdmkAzu2lb1BF1dUdztIRn3TRLo5IwlQaBaP/GxnxFCh27ZqbR5uY5D893
	 eJ6K86mNIdDgUox19dSM7HPEynWoNDg0fhNhbjoYMXTt1lP9PaUksAk+4XgUa4p3zlQh9
	 61q/DDn20HhKhkJrDDXnK3CqEIOErhxc/x4fNWGAkMqaotHFZv19PibaBI8azASXdqqyW
	 LcDGlRHPV1VcHU4Bj1wzb/Uhr5q+dDK7tT8GYCr2gkHidmARYgkPofZS1iAoxB+fwMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dama.to;
	spf=none smtp.mailfrom=dama.to;
	dkim=pass header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=OR4ma1Y7;
	arc=none smtp.remote-ip=209.85.215.177
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6094606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 16:43:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6094606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=OR4ma1Y7
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cd6028ff33fso48092a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:43:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20260707.gappssmtp.com; s=20260707; t=1794933807; x=1795538607; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0efr/JUIIgLD0b1S3wAOzRoCj+AKw4Bk4eSMefVZLyw=;
        b=OR4ma1Y72AX3KcOvan7+4WNvwMMwgvYtPZHJTZ5irPUQrkckqFV1T4JIA4dHr6ICsx
         EAS8r8tqd+R3V0C7yvCR5UHTtiqrJdmMPFOdJp/vm34+YdVYhUDlXTdaPaG9qCOiAVab
         2/BpcG/H36J/BoWInWKsr7zB+0jiH0gSmwgj7vNnjfwDAtSHNY9+n7H1wXvFUJoLyeFj
         5yPH3ynqIyj7/IcC1V68NETT/L5ztfdfXc6BGB9YbmTjaG0kHaII2/HWQHhC0ywFNA4g
         /SoM+WEUCubqThc/MjzilDes2AEvElroTaD9J/JaKfa1y1bfssc8pf46feJgVqhPCz2B
         RLBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794933807; x=1795538607;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0efr/JUIIgLD0b1S3wAOzRoCj+AKw4Bk4eSMefVZLyw=;
        b=Z0Av5A7XQv0WMOCWw6Byi67TW4Ie5jWLg/fSc5vWNWFoO8q+UDp4tZRMoFsqmWtrQC
         1KRfm7Esai5KdQp/zIdE7TBmWisRu53KmODDgpvExX0m/RlYDQd0S5R0WDA8KMebLdYy
         mTL+DfnYtly9xRnoaaJN6jKsK0z/RhZvQRVavNNHw384KJ1vvjjALhmoijBA4Phf8ejn
         Qe0N0FWR/9KcmpQ+fIX70RZjT4bdG2tRunQEMEVvwhhErVAbi1xHWrzxPlUSd5IKzLh0
         RfhRH7SdSUW7F/OUEoMtBXFFmFyi8mTruuxr5SrRtSAYLM7uEkZEv3/fXa1KWZWHuJZs
         hOmQ==
X-Forwarded-Encrypted: i=1; AL+hErEiqmT72iqVZ77e9kYGaK3VCU3aVOMD82+RVYT6dJcAKJKPogFMTy1WoLlmkZGTQOMq/A1E+yK6j12dC+c=@vger.kernel.org
X-Gm-Message-State: APuU4Z9UqPWZY3jOZ4UHLu5uT5zOcAeYmFfuRpCR9JuTcls7BrJ9qmv+
	GRlCnCZzq3/XyG4hkQm3rSkQOyKvHC4JSnIiEjRyyuuqLLKIDPEZTOgu/lZIcGpnXJA=
X-Gm-Gg: AZFdTZfJiM97K9ou9ZOeUAVHAf/j6oFJ/0zrZlL7jmmZaXplVb3F4Vuerp6tZ0hbMlt
	meb7wpFgbsOlITqTycBTQF3tmKb6B79yi6diC8YFfeb39KXndohdge+LDw1KKHLfoc7FfGB9JI0
	/owlxksxtkJxZoTYIsbc+9bxOZKnRtYn+4C0F0mishGuOZMSUmJyu4rUAR1lYv3viV36pB+oavs
	lr1uT0dOaa41J6dcgqAORO3nWFGBXjVM3VgJ98a/bSNQg2odsV8Y/jlXvN2Om0kWvoQCW/6lC9N
	GpuxcysxpWsfiUqK9m+EvOKq11Vqw1mAXOkcEhe4jLn7KcB9z7+UKCw0Ta1+5cyQ4QTfS1iiVog
	DNx6GlQXh5aww8INKk9nd8arVTqRVWkDLfcSxp1f7jPtFhnnG4r/ZqbaEgHWqpV5GbFrQfa0izS
	PQrTAOEnVAjmhMBfU33Mo0aCC/HBvi3IrE5vYb1PAMLvToVYlgzh5bBjj80yrYXR84cphJMOziR
	3bxNBVa5+2noHzCvtU1Nw678fFRhXY7SMrztkZoz3mksD42Rgto6PYif/XyWpF3TCgIedD4FyHl
	ETciyfcle+wPUM0vWQPx23bDS+Miqbsh1xB0SsDc3oI=
X-Received: by 2002:a17:90b:3985:b0:3ac:9d83:8861 with SMTP id 98e67ed59e1d1-3b1b0b8775emr14549361a91.67.1794933807157;
        Tue, 17 Nov 2026 08:43:27 -0800 (PST)
Received: from localhost ([2a03:2880:2ff:42::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3abbad610sm4886608a91.2.2026.11.17.08.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 08:43:26 -0800 (PST)
Date: Tue, 17 Nov 2026 08:43:25 -0800
From: Joe Damato <joe@dama.to>
To: netdev-bot+sinfo@kernel.org
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	horms@kernel.org, linux-kernel@vger.kernel.org,
	daniel.machon@microchip.com
Subject: Re: [PATCH net-next v2 0/5] net/mlx4: TX helpers and deferred
 doorbell fix
Message-ID: <avyELebAXqr4y1Yi@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>, netdev-bot+sinfo@kernel.org,
	netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	horms@kernel.org, linux-kernel@vger.kernel.org,
	daniel.machon@microchip.com
References: <20261117155353.2250540-1-joe@dama.to>
 <179493106742.3291.11434436383058043225@kernel.org>
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
In-Reply-To: <179493106742.3291.11434436383058043225@kernel.org>

On Tue, Nov 17, 2026 at 03:57:47PM +0000, netdev-bot+sinfo@kernel.org wrote:
> Hi!
> 
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
> 
>  - What hardware the change was tested on. For driver fixes please
>    mention the device (and if relevant firmware version) used for
>    testing, or say that the change was not tested on real hardware.
> 
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account.
> 
> *IMPORTANT*: If you do repost (for other reasons) - please include
> the relevant info in the cover letter or commit messages.
> -- 
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.

I should have updated the cover letter to address this, but I forgot (sorry).

As I mentioned in the v1:

I ran this code as part of a larger series that also includes SW USO
support on an mlx4 machine.

The only fix in this series is the deferred doorbell flush (patch 5), but I
need the other code (patches 1-4) for SW USO support I plan to submit next
if this series is applied.

Since patch 5 fixes an issue I've never actually seen, I am sending this
series to net-next without a fixes tag.
