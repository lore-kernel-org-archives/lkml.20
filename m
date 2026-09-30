Received: from mail-dy2-f16.google.com (mail-dy2-f16.google.com [74.125.229.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F0A944A708
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 16:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790785587; cv=none; b=oUnBPP5zLpgF+BBXhC9a0yl5MExsBrsQceId5qotyOeEEMFPAAJvfhWauD8B/K4KOxE+VvABP0/cRlC4Kgn1HR6GNBpNYtwzVhhVjnyPXiiLbw7Qxt19TmnDwzb/dbGjm5atq/ofaI9f8YExb9xxFdP3RWsbWLzCmy4YNV8nJ8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790785587; c=relaxed/simple;
	bh=PN+fvX9EsQhTbNuuNDPU0CH3hQrYoaayFN3eSFZeTJs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DukFu3StC2UFuzpDUiz9BxFPAu4uwM24OhA3T/8xHHem8iqIe5H/Q3Ckq11zbpoBby3XPTrlJEib1yVzKv4u2S8JjbuIKBHO2LrR9kFV5O0XND6TYTq13WVtpjDL7Wf+V6GeXY9NYOpDftRYuDsxznlz8/TR3dtU+TjqumGCNIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KDJySX+K; arc=none smtp.client-ip=74.125.229.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KDJySX+K"
Received: by mail-dy2-f16.google.com with SMTP id 5a478bee46e88-34b3a9cd8edso1016019eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 09:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790785574; x=1791390374; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WZZlK81/LOMpXc91kCxLooOgEsXss9MaFG6gLo7Warc=;
        b=KDJySX+KaOGeIFEXSxknuRIqGNeckBF3F8njVKeKHX2BhTSXkQFtymd64IBnUid8/m
         frqYwvY4M+xSywhfIDYgRe4IoC7q8ikYh5QlQbV07Pj36y4PsSNMiS3MBDtW41TXKmU4
         nxKGBMXEjEvyCQAvi9znbB1X56bdrecS0WULoWKMj02UjNo9eKNOrg3Y2e9c6WXRWYG7
         A3hrIFfqUjHMr8q2l3+TgNQQh+SUvDwYu/K4nNSkHp4Nht71/Q8Adcq/YeYeTCaKvKOb
         hZ3MAsvsVigxwXBTne6R67VAppbgohstYBDxVkkAxLjj9aFJlaGSoUABx0U80sGmU++8
         ahwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790785574; x=1791390374;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WZZlK81/LOMpXc91kCxLooOgEsXss9MaFG6gLo7Warc=;
        b=sJLNNc6Xz58utA7JMsCZNRjM0ayi3g0imTfRa5/82a3G1P0j/uqmKarpiyPfx6xT+e
         d18q53FqUhv3XbgaFYJwpnOw3d4c/N4Z1moM7sENIUWCYTdqV1y9l8eb7LVil6xoMSft
         m6RddPE9qzX+QOYOR4tNo0DDD4f74fd5DKY/KMDdS7FM8SxrNPF2QVccqecPkZ0CZ3p9
         9WZa9wsTBGmf1U2tBGX3TnN1Wfvn5WOkLKuKQmnjt6o4aphL0MsX5bt+MHrn7bf2aLKL
         F4dY+/XwZkQUwkDvbDUPbQ4TBvJ58k7Xd4riR6cGEorwNoKh5rezytFVnVVYKWAr+n69
         IyDw==
X-Forwarded-Encrypted: i=1; AKwUvBxoMmIQL5VBVknIK7JWLYogiEELZXp/QigYRph28L5skoWI71ILepqml84mC9NRMIRdnak1RX1IrZM7CWA=@vger.kernel.org
X-Gm-Message-State: AFuF++maOE12oT0HR9rSeJCDwc1sTbsFgGFsW/zpLwxoZheyhuIl4Lep
	wCzwt5e4vufp3SATZaewAnmpdLZc7zaMeuiD2uAtc3GMnnqwy0HDr3ym
X-Gm-Gg: AYBFou1Q1iA96T0sYMSfpraNBMyPoP4jZuez7KUNkxanA+OnnWMH2EwosjT4iFQdl1m
	mvAMJdTgNGTNEHA0dRh+34/SUTjhNfo36Oqih8v6C1CWMEZmWlwkbHN7ImnSF9sS9qNsuq6f6yu
	KYlGD9L1Q17TWsDZP+qziLk0un2PYin6CwVm48kwLu4PrF+NMjA3UOnZfF63HN7HU/KeG1wRNY7
	QP/U2pqbuOuQAlBdBwP5+Za+dLxZs5P4UIXirnK3/zNBMyQ1UApfi5sWC5Yp/0orbOuXAtdvOU9
	6U1Vzu0zUH6S9DnBW5XdiR3L5L3ZJyzj39zK/f9wCaxOJTkc4F5CoLt/QZZy6IebCSUTtGEYDaX
	V9lY0GG0b1Mi4k2KMPIka3n24lHICv1Qsdzdcs10loUvNRonHDajBlTVs/GKDN/eHoExEV9zHHC
	HmISzhwX0QFjTgveNM1SQCm2pxTaTnKkLUUfqBU+opyTLM2jQjVNDYZ8tD6sy3ePvumVkMirwOV
	02UW5S8HF3xIKZ81We33nmsgQjFdOAt0gV50MTV
X-Received: by 2002:a05:7301:dc3:b0:347:a3d9:dfa3 with SMTP id 5a478bee46e88-34db859bdeamr84512eec.7.1790785574210;
        Wed, 30 Sep 2026 09:26:14 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:f011:1d53:dc9c:51d4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34db4c1ef93sm209318eec.28.2026.09.30.09.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 09:26:13 -0700 (PDT)
Date: Wed, 30 Sep 2026 09:26:10 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: David Heidelberg <david@ixit.cz>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: s6sy761 - fix error handling in power management
 paths
Message-ID: <ar039bFIInczb0o4@google.com>
References: <arya1u_Rqtt85lyc@google.com>
 <3c06e10d-7259-4b7b-982c-f31c3779506f@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3c06e10d-7259-4b7b-982c-f31c3779506f@ixit.cz>

On Wed, Sep 30, 2026 at 06:15:29PM +0200, David Heidelberg wrote:
> On 30/09/2026 07:18, Dmitry Torokhov wrote:
> > In s6sy761_power_on(), if any of the I2C operations or status checks
> > fail after enabling the regulators, the function returns an error while
> > leaving the regulators enabled. Conversely, in s6sy761_resume(), if
> > powering on the controller fails, enable_irq() is skipped while the PM
> > core still marks the device as resumed. A subsequent system suspend or
> > driver unbind then invokes s6sy761_power_off() again, attempting to
> > disable already disabled regulators and incrementing the IRQ disable
> > depth a second time, which leaves the interrupt permanently disabled on
> > later resumes. Additionally, if restoring sensing in s6sy761_resume()
> > fails, the controller is left powered on.
> > 
> > Track whether the controller is powered up with a powered_up flag,
> > unwind regulator enablement on error in s6sy761_power_on(), move
> > disable_irq() to s6sy761_suspend() so it is only called during system
> > sleep when the controller is powered up, and power off the controller
> > if restoring sensing fails during resume.
> > 
> > Reported-by: sashiko-bot@kernel.org
> > Assisted-by: LLM
> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > ---
> >   drivers/input/touchscreen/s6sy761.c | 59 +++++++++++++++++++++--------
> >   1 file changed, 43 insertions(+), 16 deletions(-)
> > 
> 
> +<<<<<<< HEAD
>         return s6sy761_power_on(sdata);
> +=======
> +       return 0;
> +
> +err_power_off:
> +       s6sy761_power_off(sdata);
> +       return err;
> +>>>>>>> Input: s6sy761 - fix error handling in power management paths
> 
> doesn't apply cleanly on linux-next, against which branch was it build? (I
> don't see anything touch it in input)

It's on top of your change, I just pushed my queue out, should be in
next next.

Thanks.

-- 
Dmitry
