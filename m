Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10A4255C332
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 13:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788959650; cv=none; b=jfa6+uKPmYL+4d89+RkvMLEukyyQr0UgPGngyQFP3n1MN/DI5GdqrRCoFts2t+rQjvYpHBFx1iDUuAlskdts4kMp9q/aGZukZ81jbShaz+h+Kwflo/B69hMgM4W3hUuYoKUiK01Mi2ryRP0ug1Vs8Wpdl7kAEqsUcgSoo194HdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788959650; c=relaxed/simple;
	bh=tfrBPSnwPBntwOURsH/DrlgfLQDZ4UyfPmQwS0LjAkQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hrBrFcHXC0wnEwGs2xGKLqv1tdmJIv+IVYPYba1ki+0786Gtc302XUuCIuQAYYri/YpWBYwL9VNwadw3/xrh376KRXGf1fMuX6zEqVwVmLZmQAI1fepXGz57xS86pZNX9aq6OU2+KxmRr6Mco4Sog08sUlWb4HlfpCtJg+qSmvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ABEMO/+8; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ABEMO/+8"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49d05d51553so35223855e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 06:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788959647; x=1789564447; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tfrBPSnwPBntwOURsH/DrlgfLQDZ4UyfPmQwS0LjAkQ=;
        b=ABEMO/+8u6MdXIPqCd9/gXfySlo79YooZZdMWvzfd+e8co6mZboUQXP1rS286AutwT
         kAKkZS9Gf9EkUqC+mT7KU+eRBvvmmEBwoWgAdR/q2PtSuYeLmBs4+CXsQy0heZ3LN3X6
         vMazlRvk+7+HLlSSL0N5vF6Sm3Qwb9KXreW0B8Ka1ORkWcd5pX0b3yxS7+2i4+GnqLAJ
         rrjAfMyMDihjtYpJLYn332ttpOsirGz2aH/O7dBae0OGn2Udkyz8uqsLy6LacuHI4iLl
         1ELLr1XHCPySaxIA21li0A32y8bJD86qGawIedpd6r24gs20nzk1NUm5o5ycePpCR+jy
         q6KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788959647; x=1789564447;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tfrBPSnwPBntwOURsH/DrlgfLQDZ4UyfPmQwS0LjAkQ=;
        b=qlGK4bRds4lI/MF0zr5cjExGLIR4nfRP6PC0j7pnplo5S6XgdZ/XCkJ9OR6juxXEIO
         DvvCsZGTJGDJ7Sxq5jGv4sbRBX66UGFCOJvNaI9FioP+oF+cQ27AeMnszQljhEbWkh/5
         50DsA+AfCNLegkZccAqJL8QC8KYajEdvZtL/epJvanCBUJ3RlWL65ajvFchUSiSIn2i5
         cKRlyP15HG25YXf0sYGO95aq0Ig07OVbzfgx4ThRUbSUELhdzsyJMV4BMwp+XqVTRa5f
         YnJgw3MpQLPABou3P4HeU1qpV0/2n3qlzz3NrEIc01M1uBCztPj8ZSJ+tWeDY24RD+jN
         fBlg==
X-Forwarded-Encrypted: i=1; AKwUvBxlRhz68PhATjg+UcWSTlhDMxgKXHSz+LezCu6C2/aOpFxGeszKPAwdva6tlcBMdasey60TVmI8Y8yOQ64=@vger.kernel.org
X-Gm-Message-State: AFuF++m6J3aSEywu5st76tOfARhOVNq+nzXLHpWTOnz6zl1lX3DXgHiR
	lmU0NybVA5TBRajDWedqUY3UYUc5T855xUyF9toEcjuscHgwlLoheAQb
X-Gm-Gg: AYBFou14inw+9QXJdLbLPprVNndfTlBaTKY4t+8vcigDs1vIuLN0ub+TMkdu4tAguWG
	kiBeQ9JLawBdf+CMqwNQnM3PovFRkr/8Zu9DUHeyIhqnVAkeGP57MwCUQy5hATl1ClU1WTmzZq1
	JZ2hR72JhWRVGxkoCIQIjFk2EI0y3f3lMZNwk7412AyvHqy/vgMqkdHgrMr6aml1YL0sFpxJAx8
	JwCaOoxMVy8Hh443RblYywhAq+S+rR80SiPXikSyqk05rMM+da5cYB7kAkjKffKtkdAANfI4Rcl
	aVxvbGTnnI/UcoQ4hcdL4Ektm2MdRs6yfkKc50axa58VL+ZYw0es7g2hSMrP6llkMlVmv8J6W+j
	oiBDODloBKrq3bvfWAA1iKpvf1Io86DDK+gn0C1VGaD61yaDy7XjMfu43KLde4SbywuhSIkj/XZ
	5NKXP2xsD1xi1i5iw/G3MxhOVCsa7MdDG8GPVu2jgrIdAyJEDMQyC514Yt4Na/Z46S8vCqUWXvM
	SafkzOj9a/3dZUT/tMeL9EKU6tMibCINymScb5fpnw1c8wMKj2z1ugdo8rG8tgvvnQ=
X-Received: by 2002:a05:600c:a05:b0:49c:fc6e:a3dc with SMTP id 5b1f17b1804b1-49cfc6ea772mr319402535e9.27.1788959646961;
        Wed, 09 Sep 2026 06:14:06 -0700 (PDT)
Received: from [10.128.10.232] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d03543064sm379749195e9.13.2026.09.09.06.14.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 06:14:06 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <817a7f41-832b-4993-94f8-ed926403b035@gmail.com>
Date: Wed, 9 Sep 2026 14:14:05 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH] ALSA: ASoC: fix unmet dependency for
 SND_SOC_DB1200
To: Mark Brown <broonie@kernel.org>
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 ckeepax@opensource.cirrus.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, arnd@arndb.de
References: <20260909125636.3560050-1-julianbraha@gmail.com>
 <b15e44fa-fd2f-4165-813c-68f590ae02c9@sirena.org.uk>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <b15e44fa-fd2f-4165-813c-68f590ae02c9@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/9/26 14:06, Mark Brown wrote:
> On Wed, Sep 09, 2026 at 01:56:36PM +0100, julianbraha wrote:
>> SND_SOC_DB1200 selects SND_SOC_WM8731_I2C without ensuring its
>> dependency, I2C is enabled. This causes an unmet dependency when
>> SND_SOC_DB1200 is enabled without I2C.
> Please submit patches using subject lines reflecting the style for the
> subsystem, this makes it easier for people to identify relevant patches.
> Look at what existing commits in the area you're changing are doing and
> make sure your subject lines visually resemble what they're doing.

Got it, will do better on this. Thanks for your feedback, Mark.

- Julian Braha
