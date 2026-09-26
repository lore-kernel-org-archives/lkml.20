Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C23B6243964
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 02:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790388044; cv=none; b=X/eKTmPtiYGPI/sRult15D6WfZ8AuWC47pLHOEsW2YRqJUam9NXf7CypqfeyyZ6rLoUeEnaAw8b+6xLAP+Lmgzvr3MawJoNAjFegwCw+Wj69GPS5Y1maY5ABBkAWiLKMixDfeUB3R/SLI5T9kwzzeGX448aLzg0v/F2yw6MkX0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790388044; c=relaxed/simple;
	bh=0vjNW6Z/VkAoXl22hdO6l846oxvS2SwLTPDA8B+TIy4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fWcFU4sSxiHfwZ37qd+atIF/VBqjfemU0sYbjFoue9z7GCG3RmpY7gbFhPFgTfCdhsM8uX0LZuzeqMfslgPXsOPsDrk5RNQi2ChMYiNFkTARGQuRGk77H+Lz8KbVq9i66w3S668zOBSwVFMjY2PR5AIENMtQhYVYRTQAJZeyeCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=exabit.io; spf=none smtp.mailfrom=exabit.io; dkim=pass (2048-bit key) header.d=exabit-io.20251104.gappssmtp.com header.i=@exabit-io.20251104.gappssmtp.com header.b=hfEjIGMl; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=exabit.io
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=exabit.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=exabit-io.20251104.gappssmtp.com header.i=@exabit-io.20251104.gappssmtp.com header.b="hfEjIGMl"
Received: by mail-pj2-f42.google.com with SMTP id 98e67ed59e1d1-398cb5615deso1206372a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 19:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=exabit-io.20251104.gappssmtp.com; s=20251104; t=1790388042; x=1790992842; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=O/YZLqOMBC+Sifkt4qt6EWSQit/1O8w6WyxcrkXOcWo=;
        b=hfEjIGMlVOzjoLvEqA2WuZXqC/7MPvlRk1Buzd+YOMvq4S+2NgPi2A9WxNDuQ61N4P
         vypjJkpR66Tx7KcqYTohuXmj1taF9zeZ92OBNY2a9M/lH+n42ExTiOw3OU1jcF+QP7qx
         1PNH7YaTcXaq+BEqnGI394eicmNvrUppMApsOSAZlaeNEvdV2brw6/IJ6TLsU5j4IkXt
         rHPh4bwMeac5xAiZkjVT3Y6llhcSbQNl7MK26iaBEYrezMVC0GRjL4zJqKu7N5Yk46EG
         ozhp1jKLWbmTEoNVFBEGz3My3U4gn8tC7vqNQx2SlQ+QjFTxMFfTzfNNZzqZUyUk7UP8
         zx7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790388042; x=1790992842;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O/YZLqOMBC+Sifkt4qt6EWSQit/1O8w6WyxcrkXOcWo=;
        b=JDFZ77h/52Sqe4S+qTLweaj7TvwwspduL5bUzHROtmyxuCS+fFiKmSHIlkYGEzeszt
         rtR345QDXE/h9DO4nSGhm78An+3TSdnCBfEpvsaiktu+aNYY5VIY/PRvOaL+erlgzhH8
         Jp6wmhoAGheGo4SPRCB4WKHUgVFm0igoKKW0TO3l3FO91TsMGgXrxMVoIQWqNOjFx0F7
         vdOqcdblP88tAcDD2PurgYuh+1+LairZZIC7pCJYlMpHMn/Rrq2ng/Ji8IPfeMMeNIJE
         Q3nZB4dEkvtphfbv1r4+f4rTqONCLZJ+rgTxT2Sjy9lueO0rK+cUzjoiABvYSjon8t7p
         xIGw==
X-Forwarded-Encrypted: i=1; AKwUvByZVl4Y2CeiZjkWjSPOUidAW2qRc96wDUYA1OYkirRNxAj3AJEE1QBJx2jEOHAifdzLkABLoWsv9prR9/Q=@vger.kernel.org
X-Gm-Message-State: AFuF++khvNGManSks5E6H1aibDihyaBS0MULvUlRWkxXX7iaggb94uMI
	3zXEVY/tVQGijTjEZYffC+W59rv16dbeWxwo00kv2GUSXKNghZI5Wk+KLgRZoLy4Ilg=
X-Gm-Gg: AYBFou2M45Qf7HHXpgwb4WBvGQ0Q2JRFXI9C24Vp+Pf9/8SWARuD6nAA+hcjavnqMSx
	YX8loNTOsOxsEa22JaCCveqVLs7jZ+dtl/i5FOjWm9aNP0Uf0Kz6L4uJx4n3VgDMAEkbhz5VAF2
	al6scq+B7mKC6s2b03g1cAAHJ6w0Z4O//E+gTny7C/LR357pvLcpwbOnaEDjHer+0QjQFyYJ4Fm
	LZzU2YCeQt2UCp7nO15swApXI1Bq2XO1D3tvk94mNwgV1MiT8ddAvYo5nhqCWKdBMVNBuSNoCm2
	ToCVHMubFzGYNG1h3i+MgIsghgpL6/wcrivRXQO8ggKoYlCp9a6FVBMtXVrnaBPII7Xz+VaNRrQ
	OZwCr1JY7ygj/vBAnKs3LO/bD8+Ty3YnLywF0RKY0tpKPv2ZhVmj/E54w2rjtvJYZwynQuuIExB
	xke6oHX/4YxWOCJH2I4J6FHcMQqfqAeT2hW4xA5QU/hKGf30gA/wyyBQQ1aRNWi8rnAsvWGzJi0
	KE0o95vCnx1a6C7ky5ZvXxR6WWLk/V79YPQVMwvW3Ywc7DQFxI3GP/ljnCwHQLyQX2liEyk5BCF
	x5ZXvuZiK+J4YtoD2tMEsBTJM8xO1G4p
X-Received: by 2002:a17:90b:2ccf:b0:3a0:cc33:22af with SMTP id 98e67ed59e1d1-3a0cc33259emr1890297a91.2.1790388041938;
        Fri, 25 Sep 2026 19:00:41 -0700 (PDT)
Received: from macpro2019-01.. (c-71-236-167-8.hsd1.or.comcast.net. [71.236.167.8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0df64b233sm422959a91.2.2026.09.25.19.00.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 19:00:41 -0700 (PDT)
From: Nikolas Joshua Britton <nbritton@exabit.io>
To: Ilpo =?utf-8?q?J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Maciej Grochowski <Maciej.Grochowski@sony.com>,
	Geramy Loveless <gloveless@jqluv.com>,
	Eric Auger <eauger@redhat.com>,
	Alexey Fomenko <alexey.fomenko@intel.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof =?utf-8?q?Wilczy=C5=84ski?= <kw@linux.com>,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] PCI: Resource placement algorithm fixes
Date: Sat, 26 Sep 2026 02:00:40 +0000
Message-ID: <20260926020040.8750-1-nbritton@exabit.io>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923131757.7792-1-ilpo.jarvinen@linux.intel.com>
References: <20260923131757.7792-1-ilpo.jarvinen@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 23 Sep 2026, Ilpo Järvinen wrote:
> In addition, the series corrects composite resource sizing to account
> for gaps that have to be added due to alignment constaints and
> remainder space not fully connecting (filling space all the way to
> the bridge window align).

Hi Ilpo,

Thanks, the series fixes the Mac Pro 7,1 case from my report. That is
two Radeon Pro Vega II Duo cards, each with two GPU dies behind one root
port, and BAR0 resized to 32 GB by setting the ReBAR control and
rescanning the root port's bus (booted with pci=realloc).

I tested all five patches on top of v7.2.8, where they apply without
fuzz, against plain v7.2.8 built with the same config.

With plain v7.2.8 it fails as in the report: the root port window is
64G+4M, and the second die gets no BAR:

  pci 0000:06:00.0: bridge window [mem 0x90000000000-0x910003fffff 64bit pref]: assigned
  pci 0000:0b:00.0: BAR 0 [mem 0x90000000000-0x907ffffffff 64bit pref]: assigned
  pci 0000:0e:00.0: BAR 0 [mem size 0x800000000 64bit pref]: can't assign; no space

With the series, all four dies get their 32 GB BAR0, amdgpu binds all
four, and they form one XGMI hive. Each root port window is now 96G
(my one-liner gave 128G). The second sub-bridge window starts with the
die's 2M BAR2 at its left edge, and the two nested bridges below it
(0c:00.0, 0d:00.0) carry the same range:

  pci 0000:06:00.0: bridge window [mem 0x9e800000000-0x9ffffffffff 64bit pref]: assigned
  pci 0000:08:08.0: bridge window [mem 0x9e800000000-0x9f0001fffff 64bit pref]: assigned
  pci 0000:08:10.0: bridge window [mem 0x9f7ffe00000-0x9ffffffffff 64bit pref]: assigned
  pci 0000:0b:00.0: BAR 0 [mem 0x9e800000000-0x9efffffffff 64bit pref]: assigned
  pci 0000:0e:00.0: BAR 2 [mem 0x9f7ffe00000-0x9f7ffffffff 64bit pref]: assigned
  pci 0000:0e:00.0: BAR 0 [mem 0x9f800000000-0x9ffffffffff 64bit pref]: assigned

The second card (root port 16:00.0) is laid out the same way. No other
device lost a resource: the only "can't assign" messages left are for
the same I/O windows that fail on every kernel on this machine.

I used v7.2.8 rather than your v7.3-rc1 base because v7.3-rc4 powers
this machine off during boot, with or without the series. I haven't
looked into that yet.

Tested-by: Nikolas Joshua Britton <nbritton@exabit.io>
