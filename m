Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793815596;
	b=AbS2eR/mu7tRt7tg+yGwFLtgTQ7UiQsVKqIIzqR7AFQmyXRjC0yKPMOY/fa5EIYz2wKT
	 nBFVymjqUQhc9WTvmGiTXFl8nNUT3DheVG+fLqd7bUVdD3mGXQq72Z3BGd0oJfakhzRjX
	 pi5TS/dneK6w1YBRuapCek6sxo8rZfdN0SCcVapz/cD2rxXzlunIxqwHsFAMnwEt0Lxo9
	 g9hF7US5W/tUh4ZM0B3L5nMU+KLfYhxYUCHXc0Yf09syQTLAcZo1Y51S7k9xmCtK2TSL6
	 qFTo6pQAqHVEKCLLreVccF4p/PZFEor1q9O1S18CjUAwBWkEHmM1OZkBxvIBcYtL9XA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793815596;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=GRG5s9Ykm6gdotG16z6YfBmoncjsZwUpCfdfDleiz1Q=;
	b=TudHm1oxE+KMO+6LvUZg78JRwVhEg+7c5WxtS2F8AXw/6wlim6CPNZMw7f6loADMAK1D
	 Ka/m9lb2M0ESxJPftDXBz1TUMftGXntpG85rOF1O1fWx2lPgx2M15T6Ixrk7PmPteTPW+
	 0Bu/0Z9KonPn8SBe9Ci+s1qpmYVugV6pgb2sc0tKENuDadUnIg8neT13XUt5vA6jVpVkU
	 4rQbcRgTGs89ta30o9/lknG3D85AT6reOeciA2QaCt4MOB22gEvkzA7BvuX2xLOk9+U7i
	 o/lj12x6Nx4NddmIgDA0wpklx++xO8oU07AOiw3SgsJRrtoIoaO92oWZ4RCCxlSP/aA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	arc=none smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF72606D810
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 18:06:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBF72606D810
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cdb1199bfd8so460347a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 10:06:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793815590; x=1794420390; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GRG5s9Ykm6gdotG16z6YfBmoncjsZwUpCfdfDleiz1Q=;
        b=WliIYQRYHNdchsLq7SQIkvo/eS23FuBDujIvZwfiAhbl1fJdFHV3CQ3WnIHjP0/A8X
         RC+UZxPyOIZJwQi8Q1/saKu1y5dPGuUmaxotbeWEjNu+dZGDNJYHzYIf1c4SCLBP/BhQ
         C/k6PeRYrCFEMtB6+YicL2zlEPPWKalYa/voigHvz9GObPPZei1JLW1Jos3kRtmRe4Jy
         IQqXUYnJ37WC+ljY9DquIcjkKt7VD6xGb0Z5UzdaZr0vy2jkaqwbvP9EM0kBLl04JHK4
         lhCi4WxBcwkiLLvTqKtokv9DoGjU+IIvUPHJSDnco6EMxQjmST+K+yaVMjlLPxA5uvWb
         jF1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793815590; x=1794420390;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GRG5s9Ykm6gdotG16z6YfBmoncjsZwUpCfdfDleiz1Q=;
        b=pd1LEY6EcVJY7jjxINVjVM6io+6dVtMHvIIXROJWrP24debL2Jpc02SA1lAZ4SX8RN
         sJVYRxVm+fg3RtjUnbS41D/NJKBLHJBZ/rxa8DlSlgJjl1dKK+VilWRVzmAS7PqjzYXG
         HT+KWieYu5oz4cYnvxb83jjX/URnOulMmM+S1MGegsNG4K+2e/T3xrQa31pEk4uQa2Db
         KJZ8okfG0joLjm4MLSVW1REFnOsGyZN2pUcqR8Y4bI60OrsbfdfG0+u+3c9uEwR/6iAS
         v3okB2RXuRf5dblJ3yKwoBvELHzCxBFDJX4dtZXP5HquFZhlrewb07TIIkpLvfCbynZ2
         RNlA==
X-Forwarded-Encrypted: i=1; AKwUvBxCo02ZZzxI+jn5VS/EsGST8piaTEJXkEIS64I4FMjDZ9PdYbxb/MfNylL2q8HknkcBVOUgS5X8tteUUJ4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9+m+bcdAo/3urPwaSeV4w4ix/gibs7a4QFPK6zSXfL4cbT9rat
	yi3Nc4PCvJgOjVFoTW6bupOrK61kFHCkhuTm2ek5dtgGBGvcI1jxZ2npo2SW45C71w==
X-Gm-Gg: AYBFou0hB5o+84CuXdqLIEa8rCXYjgm/1+RYaWborzfkxzZnEmpzvooBcEn1SQ/ksrJ
	vBylB6j5PDd224qmeYzYE2vdnrYbac0v6NXjx9wRjuE03sORpzaIdvLAtBhQuijlllPYd3R41FK
	Hnh+4xbvzQUD79fAd/zqs/945QZtPTF+C7pfDqtlssN0WLB0lNO86ZH0kqdIN0qdraUquPujv5g
	kEn1dxWdsXfydu5Tml+Vbl//8/qYHvVDaC1BZp0u5Q/APNbQzCLzCMdCrum4qR0VEiJGVRZx97z
	RjKU/CSK2P3TGWx4w3NDT9IaoQCLdi6+ESfCTareaG2r8JkKT677EeTeWWsd1NaX+j8P4RcM5lL
	fMkFvQ0dCBAwQhgzOBKapjoH3qeDRiQPk4Rwjinf1IYgv2/8NJ5PbSJiGoB0msGgHZI+QQRuH16
	/6hrReJRXXidY9c0fcHgyf2xnEW/9pZQ0qFuHfHYr4KQzRLCs5PJ+1m/JaSYGACyZHNEfRwrwds
	ZWrCr6R0zSY5oXUwegr10610JhnzqQTq1SF32Wnt3yqo+KsZnlJzvPsuPExmWOUAAQ3hm0yWN/C
	7lOMeEjBsMMGM+/9vTljzS2sjTh8InmgOgz3y+Yl/D00DpF65Cvaa2uCKjDcZ39X
X-Received: by 2002:a17:90b:180d:b0:3a4:8c41:fab6 with SMTP id 98e67ed59e1d1-3ae8983f058mr13975312a91.46.1793815589132;
        Wed, 04 Nov 2026 10:06:29 -0800 (PST)
Received: from google.com (33.79.127.34.bc.googleusercontent.com. [34.127.79.33])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb4694a0e0sm1481545a12.20.2026.11.04.10.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 10:06:27 -0800 (PST)
Date: Wed, 4 Nov 2026 18:06:23 +0000
From: David Matlack <dmatlack@google.com>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, kexec@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-pci@vger.kernel.org,
	Adithya Jayachandran <ajayachandra@nvidia.com>,
	Alexander Graf <graf@amazon.com>,
	Alex Williamson <alex@shazbot.org>, Chris Li <chrisl@kernel.org>,
	David Rientjes <rientjes@google.com>,
	Jacob Pan <jacob.pan@linux.microsoft.com>,
	Jason Gunthorpe <jgg@nvidia.com>, Jonathan Corbet <corbet@lwn.net>,
	Josh Hilke <jrhilke@google.com>,
	Leon Romanovsky <leonro@nvidia.com>, Lukas Wunner <lukas@wunner.de>,
	Mike Rapoport <rppt@kernel.org>, Parav Pandit <parav@nvidia.com>,
	Pranjal Shrivastava <praan@google.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Samiullah Khawaja <skhawaja@google.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Vipin Sharma <vipinsh@google.com>, William Tu <witu@nvidia.com>,
	Yi Liu <yi.l.liu@intel.com>
Subject: Re: [PATCH v10 00/13] PCI: liveupdate: PCI core support for Live
 Update
Message-ID: <aut0H65XKAHUqPR9@google.com>
References: <20261013162529.1928093-1-dmatlack@google.com>
 <autxCZPJ9yiE2ucq@google.com>
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
In-Reply-To: <autxCZPJ9yiE2ucq@google.com>

On 2026-11-04 01:00 PM, Pasha Tatashin wrote:
> On 10-13 16:25, David Matlack wrote:
> > v10:
> >  - Save and restore the ACS Egress Control Vector along with the ACS
> >    Control register, sizing the save buffer from the HwInit Egress
> >    Control Vector Size field (Alex) and drop Bjorn's R-b tag
> >  - Make CONFIG_PCI_LIVEUPDATE depend on 64BIT from the first patch
> >    rather than adding the dependency later in the series (Pratyush,
> >    Mike)
> >  - Reword kernel-doc comments to read better in the HTML docs and
> >    spell out "reference count" (Mike)
> >  - Replace the version number at the start of struct pci_ser with
> >    required_flags and optional_flags, and record the size of struct
> >    pci_dev_ser, so that the PCI FLB ABI can be extended (LPC BoF)
> 
> Hi Bjorn,
> 
> I am planning to target this series for the 7.5 merge window through the 
> liveupdate tree, as we previously agreed. However, there are still 6 
> patches that lack an Acked-by from you. I believe you might have 
> reviewed some of them before, but the tags were lost during subsequent 
> refactoring. Could you please take another look at the following to make 
> sure everything is in order for us to merge the series:
> 
> PCI: liveupdate: Set up FLB handler for the PCI core
> PCI: liveupdate: Track incoming preserved PCI devices
> PCI: liveupdate: Document driver binding responsibilities
> PCI: liveupdate: Auto-preserve upstream bridges across Live Update
> PCI: Save and restore the ACS Control register and Egress Control Vector
> PCI: liveupdate: Adopt ACS controls in incoming preserved devices

Thanks Pasha. One more for Bjorn's list:

  [06/13] PCI: liveupdate: Preserve bus numbers during Live Update
          https://lore.kernel.org/linux-pci/20261013162529.1928093-7-dmatlack@google.com/

Bjorn's Reviewed-by on it was dropped in v9 when it changed materially
(albeit based on his feedback).

Alex, could you also take a look at the two ACS patches? 08 includes the
Egress Control Vector save/restore you asked for in v9.

  [08/13] PCI: Save and restore the ACS Control register and Egress Control Vector
          https://lore.kernel.org/linux-pci/20261013162529.1928093-9-dmatlack@google.com/
  [09/13] PCI: liveupdate: Adopt ACS controls in incoming preserved devices
          https://lore.kernel.org/linux-pci/20261013162529.1928093-10-dmatlack@google.com/
