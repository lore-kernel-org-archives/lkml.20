Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1882C4AB3C0
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 08:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791967568; cv=none; b=Y5FcHGwSYdrJhIOmwG13KtOI9wzp75FsqoOyM8LsQowi2tdhc9540RPHVZBc2SHvb1mXdT8ZuNpSP0rFm6Scw4hkfGs+Ho0Pj/wVw4nol66Tm7545f4RlGUQFKJct2/Wqz988+ZZovTSYhU4V2jkOq4shVKoC1yp9aPwqry7FS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791967568; c=relaxed/simple;
	bh=O8tF/HPLFeW6J7dCFif3ccmo5wAopSQx7sXQ0OlC0MA=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oPVdI2yvDw4HxQuosZtxJnnttglTnSiWs/5NxQr3Df+8Vjqy3gSOSZJTmrfKSjpTBIWuYszOmzxq+yy+iKmIEXeyIod0r9NWus3Lg3FB50m7Qmt/JXykJffwSxVfMQ11xjbyOk7RiK5lDYpmiCMNGt9qIgZm/zyziqPpMXG0+1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=EEKmrU+f; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="EEKmrU+f"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a061a13884so32858415e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 01:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1791967565; x=1792572365; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gTcZlVZHtfHgTFtg74Em9s1Nd3UsxFPxwG0ZexEQEaY=;
        b=EEKmrU+fPqHq9sas5Px93aqf8lKyLONDPX8/p/YD13L4Pn5TUB5qX6bCfnvz7js5L4
         ZCTcXRQ9ujt1gLIySe0uOqLN5OQc+v3DR8pIupe3IjXYcMZVN82j/bZ5Pnbm5zPldkw3
         oJhbjW7lF1msONFNx9ww4w2fc6bkWwTfEtcRoqV/97ov7APzcWNa3GYciG/S057PX2qu
         McomIUU0glNw/AVACBPSRPzcQHEjEhkIckXk9t0S3FrA+4xre+DkpoiFbNOpuxdlV5Ha
         ku1R/rfJQ8qjTKggZvbcPfejRfOQ+Ibls3axRZeDdsAjeZ8nPOXiRyfUOC62mG5z3IxH
         AP3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791967565; x=1792572365;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gTcZlVZHtfHgTFtg74Em9s1Nd3UsxFPxwG0ZexEQEaY=;
        b=GuuVGr20tAi0WfK5LyrqAvCUUp6xJCrd9hHIsIkd6Z54nyPkZ0ZQzgXmo6PfjX7qw+
         bgm4zDhl4xNiuUoKgsunta0wFNILjcFfjD0u6GzMtiO/mUMwNwNhZcwtgyk5eKeRfq7O
         6sdQ/JyLJddn1h2NzwWSyDoRGZacZ8ikw5eo1zkJIh/uB0adjPllJHRZ4779OuTyVtdc
         LRnL2ZRM1IXrGQn3o/TiwW8NOchKpvaZ4l4k+BndGHqzBcfiW0lAKlCndhCgQdtaWF6A
         GdPL3bIj8yAZYB1Lj3VcxIpABy5LqEhAa/Mpojw7mXBa7YJHPesjYmFcGhVElvJjSUmB
         JDCw==
X-Forwarded-Encrypted: i=1; AKwUvBzgAURbnF8ERMLzW/aM+w9ahCfX/KvCkQSf+T3QNrmvv/qWRwjChcFDvKaCJ/C6e8XgWurTGtFL2+53AEw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKaLBD80hn1HLg5ivorYksaAQYA/P1s4vjraOJgzcS0OuxWkd4n
	zjGIzcS3ffVHTNlVGH8+50RNkcuVSWq2vp4NZeg/gwu9WLOPcKhnFYTYtWtgleIcYNI=
X-Gm-Gg: AYBFou30gZZKlIsq9ElAXAZwwHC20tnb9nZLhbT2NJmphmeGH7yAz029ZyUyJrERhed
	koKA5wTmTfzP55F5tTB31wpj8vJllsUb9AwW37CVadQ7wpmu3sOul7B/JMQPSwHoDMy+MZItQ+Y
	Ar5O5nf4CQWyh9fFL5c+/PNQhN2WO/VQby3yAShdaGHTPr6y2WbIRzYp30t281mQLe40oI8YTP7
	r97++xCTdLlI56BJo4Gl4fRlPTW4/XOvAZARUMELgwWgDPINJDOznn1YnQeZQpHINJN1ONF5pi3
	9rrGTqU9/6DrBhuFM4pglT8B6/rby+xiWWV2G8UeJJczTEgkFO3y/3dVRqsGlmDXNhH965rcT2K
	+oHpuOCPtOtOzyQVTALxkP4oH9gnzrUhBCa5Biz7gWowuahmY6IpcELXiwcGQS6Cqaes383cZl9
	cfh72H8GUW/JHtMu6vZrI8jdZAeUnsxBz5HHhTFsn59T0HePGnSK4CG12dAqN3a5VkQ8G/7Zrrd
	SRnWHzF
X-Received: by 2002:a05:600c:3554:b0:4a0:1b14:e283 with SMTP id 5b1f17b1804b1-4a18e43a1cemr302541435e9.1.1791967564294;
        Wed, 14 Oct 2026 01:46:04 -0700 (PDT)
Received: from localhost ([82.192.120.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1b2ec47fcsm41079755e9.1.2026.10.14.01.46.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 01:46:03 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Wed, 14 Oct 2026 10:49:52 +0200
To: Alex Elder <elder@riscstar.com>
Cc: Andrea della Porta <andrea.porta@suse.com>, bhelgaas@google.com,
	lizhi.hou@amd.com, herve.codina@bootlin.com, daniel@riscstar.com,
	mohdayaa@qti.qualcomm.com, lbiancon@qti.qualcomm.com,
	mani@kernel.org, robh@kernel.org, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/3] PCI: of: update endpoint ranges dynamically
Message-ID: <as9CMO8gODU-jazS@apocalypse>
References: <20260924222444.1351466-1-elder@riscstar.com>
 <ase6toUhGn0XD0v9@apocalypse>
 <223c5189-bfda-4c63-b09f-4ebd01bd144a@riscstar.com>
 <asju_HpgXpIyAFdf@apocalypse>
 <a8f7eb6c-69d1-468e-b7a4-7481e429c1cc@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a8f7eb6c-69d1-468e-b7a4-7481e429c1cc@riscstar.com>

Hi Alex,

On 17:30 Tue 13 Oct     , Alex Elder wrote:
> On 10/9/26 8:41 AM, Andrea della Porta wrote:
> > Hi Alex,
> > 
> > On 10:55 Thu 08 Oct     , Alex Elder wrote:
> > > On 10/8/26 10:45 AM, Andrea della Porta wrote:
> > > > After a quick test, it seems that it's not working out of the
> > > > box on my RPi5. Let me investigate a bit to see what's wrong.
> > 
> > I stand corrected: it works perfectly. So:
> > 
> > Tested-by: Andrea della Porta <andrea.porta@suse.com>
> 
> Sorry for the delay.  I'll add the above to v4.
> 
> > I think it should even be possible to tweak the static RPi5
> > DT in order to make it work dynamically with your patch. Can
> 
> I suspected that your static definitions *happen* to work,
> but I never took the time to confirm that and understand
> why.

As per your design and as expected, the static range is preserved
since the conditionals make the function exit if the device is a
bridge or it already has a ranges property,o it all works as before.
Right now the RP1 is acknowledged as a PCI bridge.
what I meant is that we can maybe amend the RPi5 DT getting rid
of the static ranges and tweaking the reg offset in the subperipheral
nodes. I will do some experiments with this, but not now in order
to not clash with current downstream DT. Definitely a thing I'd
like to try in teh long run, though.

Cheers,
Andrea

> 
> > you please provide the relevant PCI DT nodes (from PCI controller
> > to pci-ep-bus endpoint) from the output of:
> > 
> > dtc -I fs -O dts /sys/firmware/devicetree/base/
> > 
> > taken on your reference board?
> 
> I'll send you that in a private message.
> 
> Thanks again.
> 
> 					-Alex
> 
> > 
> > Many thanks for your work,
> > Andrea
> > 
> > > 
> > > THANK YOU FOR TESTING THIS!!!
> > > 
> > > My hope was that the recent change (to avoid doing any
> > > updating of ranges property unless it was found to be
> > > "empty") would avoid any trouble with the RPi5.
> > > 
> > > I'm eager to hear what more you find.  Please let me
> > > know if I can be of any other help.
> > > 
> > > 					-Alex
> > 
> 
