Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794593928;
	b=VfHUq6CAHaXgVEAMxUd94FYPgHyKV9UsFb4Z+FUdwkeDbCPApqeeEaWZXczOu82xb/qa
	 tm+QgXX9EWwQPTpIo0Qi07aQgUveM06GkivQC2KW9+EPb+F8urZVSiSxwufwcohdTz+cF
	 wv1H0cLlR+OjQi6+NBsgdv26b+pkmwA95vMBUlqyqH58YRLN6BCcRUxXhgFynjtONt3pX
	 1nTIOBoBjTDDyZRGI1tM1vwCJ596dtx6Y/LxkN/zWT1c9PUuTsKLmBNeS/M7rdrFkNvMP
	 3IZZ3UzZzRyjyzAy3lweQPU0F7wUSppKR+S+NmoTVZ7O99sRl6lnv2Yy6NPGC/mFkeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794593928;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=nqq2fVahmDvYhU4otqdzJt7uhBld6iWpTWhwJ5Rm+1M=;
	b=zup0Bz/6u6sRqHxvlxGSoTViCeXoy0dnjKW8blDWbK9H2on0cIDm54LVk2J4NhQmOOMT
	 cOSaitXjm5U9XFikv8oMEWq2Lbx4T1cRGthYMSk5iALvRoFbiI4LbqHDkQoVurCCfJFqY
	 RsQMpSb6fanz4IfA3M0k8HEqDrrkATHqbylSqvmH7sV8ot+ZD8D0KfHribCtzZPNv95ou
	 HI/3Rm/LHkccuoU8owUBtt/nhCN7p0QsVtpAUDXv9xxDlVhh9w5QaxEGyc9JdvVnU47mj
	 tOjvU9wyJa1PKa7QjQRi+aOtPkGfMD9NdU9FV8iLnIY/h/zyJpHQGiQSirPj4c7NF+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b="QIl/ku5k";
	arc=none smtp.remote-ip=209.85.216.97
Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A86606A327
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:18:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7A86606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=QIl/ku5k
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-3b09c07b3d2so774520a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:18:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794593927; x=1795198727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nqq2fVahmDvYhU4otqdzJt7uhBld6iWpTWhwJ5Rm+1M=;
        b=ALG//e6sFOnVDS2xiKQKXay0EObf8uz9T82EZvH3tUUDhJX1f/jVj/41iyZ7IAlO+y
         U0H45AawIKYpleb+gh2ppmNQO2j8L4CR8LCUGb6GqrvHxn/G3s6D/SGZz3wDp/pfMVs+
         SFxS32rzmCTearGplcFa5ZB0YaltLHoEkBx/kbh1+MLRJp5ZXll4T22UgzQAPwXDMy5+
         sUgvR8cjRuCZrMFho3iMPjsNtC/Lsv4Kw+f7O+EFKEur+fIYO7BGuVl5S8tbrq9iXpol
         VyIPQhoFjETjzdkNUuLIbo5K6vvS16oBkJQqXfVq445f1GhPy9AEAQ+ncz5ocbIcoiI2
         d0gA==
X-Forwarded-Encrypted: i=1; AL+hErHVaJH9zRFDOm4n2/R7RcZabUwbk/q/9ndENsq8R2qcx8EywtmqCnuf8ntFTLdfLOVbLdH4cZbdeL4dhMU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/UeA92muw7NegyYJWIpWLen7fKejNkryqLdyLlOpJRi2u8sQYI
	pQY4+P2z32uEVVthdFRflQCxk0ZTGFg5gor5hRFo82PcPg//zlHMCwlZhtIimp9s3bz3f0QbXzb
	pOU3ws4wW0rZ4RkVEmJ5uyrrtyO1qzOvbw0LUyEDm0WRGpofb8YvQZBcBF2bVfCtAoPTgd77kRm
	Py9YBI8Z7T4FeKCL5jsa1XZ3kq0xnESezzaf7pbKSx9/l7o4AEgMObMOEDTvFO3rsAi/yfPt5VV
	PZSQ13JCtFAbcqloyyZt8Bw
X-Gm-Gg: AYBFou3okV+kHCFVm9ZADSUi4kvhGEUGVFYV3leC/izLJk22EaXfKTh5821sdCXSkQ2
	wHrR6/PZE/9qO90RpTWDfFe1FsnuratdqX9nIamSUWAKdybWoeGgdP80n1Oa5shLI14K1StbkD6
	tasj0DVSQ2b39VMYvbPpvhanT/QALlP5RZlLPRh7QQwWaWwfH9QhJWLwUIJH//05ypEz5QqnWEz
	vlJk3OQJ28PsPV91P9QcIvk57DtF4p5BAs3X86NmQZr+Fou0ajJGNQ2pawVagqwUhEq5FRUQD87
	3t6uWKLuxFL+h9Izd7o1Ng9ds4t2yr0xIDVzCmje09OmHyHVZxarq+15X9iIIoHj5K3b9FuGO3r
	fJ7Vc/N7/dNHwgvT2UtbDD/iJ6/P8qceGcTAc4TbvXGFxPuARfV3gB+reL/HAMIMBXsgeby8LmL
	xK7A40TcQVFxLFCvHX+vAOcJd/8OSbbNGpOCxkEnQ6ZWE=
X-Received: by 2002:a17:90b:584c:b0:3a4:b8dd:1447 with SMTP id 98e67ed59e1d1-3b1b0b5f9a7mr3091964a91.34.1794593926914;
        Fri, 13 Nov 2026 10:18:46 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-119.dlp.protect.broadcom.com. [144.49.247.119])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b19db1fd6csm7075620a91.1.2026.11.13.10.18.42
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2026 10:18:46 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f2c0e6653so112628185a.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:18:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794593922; x=1795198722; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nqq2fVahmDvYhU4otqdzJt7uhBld6iWpTWhwJ5Rm+1M=;
        b=QIl/ku5kJQ4HJzTFpqP7s+iDUu5Umu2uLvFZUDj009AL+rsREai3zQRI5+7DPh4y4K
         9Oc5RX0R3d3PMXLzIhksZuuVHdQ1SGo89a6rz0Ws7BXRRWO8UVSyyaImsNErzTH8aclf
         nWlwgGqJNwnBdB74X0jn2uzu2/bS4rSo88Osg=
X-Forwarded-Encrypted: i=1; AL+hErGS5gaDrjqQLhPpF6KtVQ5Akh3Cdac72LZaXdTb92+6RmESFHXtyXg7bBdEJEv3Hb4IyN4xNy2JnYRamsQ=@vger.kernel.org
X-Received: by 2002:a05:620a:27cd:b0:93f:167e:d990 with SMTP id af79cd13be357-9494bb94556mr556607285a.50.1794593921896;
        Fri, 13 Nov 2026 10:18:41 -0800 (PST)
X-Received: by 2002:a05:620a:27cd:b0:93f:167e:d990 with SMTP id af79cd13be357-9494bb94556mr556604285a.50.1794593921481;
        Fri, 13 Nov 2026 10:18:41 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c6025f5sm237554985a.5.2026.11.13.10.18.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:18:40 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	torvalds@linux-foundation.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Scott Branden <scott.branden@broadcom.com>,
	Ray Jui <ray.jui@broadcom.com>
Subject: Re: [PATCH v3] MAINTAINERS: fix bouncing {sbranden,rjui}@broadcom.com
Date: Fri, 13 Nov 2026 10:18:38 -0800
Message-ID: <20261113181838.594023-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <510bf9b037c522ccfba270926c95170291115ef3.1793602003.git.jirislaby@kernel.org>
References: <510bf9b037c522ccfba270926c95170291115ef3.1793602003.git.jirislaby@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

From: Florian Fainelli <f.fainelli@gmail.com>

On Mon,  2 Nov 2026 07:47:06 +0100, "Jiri Slaby (SUSE)" <jirislaby@kernel.org> wrote:
> Both emails are bouncing like:
>   Final-Recipient: rfc822; rjui@broadcom.com
>   Action: failed
>   Status: 5.1.3
>   Diagnostic-Code: smtp; The email account that you tried to reach does
>     not exist. Please try double-checking the recipient's email address
>     for typos or unnecessary spaces.
> 
> According to Florian, it should be first.lastname@broadcom.com.
> 
> Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
> Acked-by: Florian Fainelli <florian.fainelli@broadcom.com>
> Link: https://lore.kernel.org/all/688738af-100b-48af-bee1-4bcbe4422f94@broadcom.com
> Cc: bcm-kernel-feedback-list@broadcom.com
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: Scott Branden <scott.branden@broadcom.com>
> Cc: Ray Jui <ray.jui@broadcom.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/maintainers/fixes, thanks!
--
Florian
