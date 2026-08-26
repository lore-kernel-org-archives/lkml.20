Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B876A472F71
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 18:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787767886; cv=none; b=lrSwgY55jIwTq0rajlZwDSVI6quLI18sYly3W0sy8YPWQO6OpFB/gHMDe6EPt5RSYXnO5C4VHZ2t2870qKEgDQph4yUSK2z9Re+AvnoF+QKb7eJkm1ULA5FepPkSupEksbMSV0T8Og02BMumLmODWokWZZWMlVDp3lNCdqFAzn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787767886; c=relaxed/simple;
	bh=hTwLH6239DZe5yRPzb2V1G2GAB6G4ulnXpvuKPufiFg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jKiClNj4lNaY19EcJS7gzJF3ziKDmixrjU9DWtaUjSCsvPbsrh3BywmvjNhatGsxvakkUeI5tuK+nDop/xSUc+qnk95n4N23evVeV1v8C6sqcZuuZmS+dzN1QLYmPubFt41axMr18VU+yR2T3wBm/fxcVhBsKSCWV+ChAujbwpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RuAY91T2; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RuAY91T2"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c9d1fff21edso831051a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 11:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787767874; x=1788372674; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cD3ENK5Zz4cqB8cAmknAH7JmVcmInLZ6RJTKj7LW1gE=;
        b=RuAY91T2VT7db4CGw4AR51PDL+85j6oXkjMPaLH2/s1nxhrYPR8B/EXMR32BTrWAiv
         15TIkfG3CpxQ0TL425qNPYlA1xVp/lY93yC/KTzu1adajr0zloMRzEeiJcs0V63QmZxb
         53Y2F4nhZWzC5N/YRjPDS1X5IfdsA5FFJVNOJsCd8dyOtYYz4jYoEzLnpZP9rBSZ0LcF
         RDvr4gqCw93QoJZHC82D8ksZsFBbLWm8noxekevS0Bez3Y1H34mfK/KSQ8QauLLxQ3NP
         4hHpBWmsXDTbvb5jn7P6zLmMtL4lNbvBpixJcR1oY+1rLNaNRGEzMhHfcUOlZLBZTSvJ
         I5Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787767874; x=1788372674;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cD3ENK5Zz4cqB8cAmknAH7JmVcmInLZ6RJTKj7LW1gE=;
        b=dyVJ2g7y7RhMDQd0nmaRpeC2lM1Yrz2vCHkOA2ZN7ad9j7h0FCqzdkF3j31/BmGrAM
         celkYpQ3Ub56CGvh2P/QM/g96/MMOYSHvX+0yDEowXbwFx3j71DoIcfXEskzGiwoWC9B
         sLroSi3YDUQ9Gh0HOVP7h3LLtuHLDNY+NFjk2GxkmdqHT73WpgBE2UsB29X38+QlLzjC
         EydBXCnMyjguikD3sPRIdGi31zwg966fyyMXTq65w9yQY3pXQ1mtzy+HvCZPBFlo7DGS
         Bh4zDL+41RdcomYZbLlnxddK19MQZmmNVXmsWGnMXt8LFDcVydXHdgVzad0c8hM6VSwd
         0jkg==
X-Forwarded-Encrypted: i=1; AHgh+RoLsnNvQEgRfotzph4znuHgvNqMwDaaZNxFN0wex4hMt4GTKntBtzU8VSzVdZIHZN/ZtoHo4lvTj3qwtqU=@vger.kernel.org
X-Gm-Message-State: AFuF++niSi+tXISOc2eg2y9GIXKo57jBDH5fpixim6PZwvw4npG0ASxG
	snJKkuY3Da9BqkwMqfvtDBbtK9jTI5BMtPcw/3lf6t6AceRnUFUi3Jj9
X-Gm-Gg: AR+sD10DYFsqp9DJuZIZLhT1L1JZYFhKVllX9o5Hk4xdMAnFkzXQk4s+TBvB24gDp0e
	dQ5L7S+Hu/97fntxttfyLIrBz+Qf3w1g/rJC4P56fGVAmQZ1PN7nLPGeXTh2ixG+fjto2uAwDGj
	YfY/nCBw88/35X8lo2utqd+rgxZoturo+qcmAZUXOgRrG9S1VOu+WDeWIuSinSncaMfLMEw5kLV
	Z/IXxyrochDe3El+EaAFxAWYh/fzFA9IPHM+/l6PRfu+RAJbMSNSeF/bKOf/H+ynJquGZ4PUU7i
	quob8z4vFJcC7eAAorbV+YkQN87WWJpYkRCLN3tQkfQcDn1AtzN7F1EGJ5wKPx9Y8A8H9eE2wPa
	12RarXsc27mLbHx31NPXgCmq2Eo58/gynCjENiXlsh1peko/CIHVDaugbNLPY5vj9MDth0jgYOo
	u7Q9KjgJPJTmyuEYxtK9b0iKPA2ANR6pH2Wk1U7ymXBcGnAeFAXBQyF0zJvb2I7V+b6VdESDmfm
	j8zwLEa443waoq5wtz+kN7zVkVLv0ll
X-Received: by 2002:a05:6a20:6a09:b0:3cb:8810:631d with SMTP id adf61e73a8af0-3cf7596814emr15778521637.1.1787767873764;
        Wed, 26 Aug 2026 11:11:13 -0700 (PDT)
Received: from localhost ([2409:40c4:3158:4e86:4090:3289:19be:7446])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32854db74eesm957162eec.18.2026.08.26.11.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 11:11:13 -0700 (PDT)
Date: Wed, 26 Aug 2026 23:41:09 +0530
From: Lovekesh Solanki <lovekeshsolanki00@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Mathieu Fluhr <mathieu.fluhr@gmail.com>, 
	Michal Pecio <michal.pecio@gmail.com>, Thorsten Leemhuis <regressions@leemhuis.info>, 
	linux-usb@vger.kernel.org, regressions@lists.linux.dev, stable@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Mario Limonciello <mario.limonciello@amd.com>, 
	Forest <forestix@gaga.casa>, Slavik Dev <developer.slavik@gmail.com>
Subject: Re: [REGRESSION] 6.12.36+: usb: hub: post-resume delayed work
 triggers > uncorrected MCE / data fabric sync flood on Threadripper 7970X >
 (bisected to aec11e5f9c45)
Message-ID: <ao8bM2SrASNh2u84@eggarch>
References: <CAPyJwA9P48LDcOr7u_iT1WPFBCHxh9w6cxFvyi5GS3syM6crbQ@mail.gmail.com>
 <07435e6b-ee30-4c85-8c8b-0ce3a4ead1d9@leemhuis.info>
 <aosGtkE_diwVJJtB@eggarch>
 <20260823174059.46fec036.michal.pecio@gmail.com>
 <aoser8dLytrwqBC2@eggarch>
 <CAPyJwA8m_Xd2oyV1i9k+-6f7A-j0FiC97yXL=Ci8ZAErs5W4vA@mail.gmail.com>
 <ao1ovvdPAy6n_F7I@eggarch>
 <CAPyJwA-QALkCQn8J1+=U-nuE_7WSEPhVcUEKb+MMYMaA_1AVjQ@mail.gmail.com>
 <ao7aLXk9q_v_jEyX@eggarch>
 <d5a395f7-06ad-401a-b026-e975f620f017@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d5a395f7-06ad-401a-b026-e975f620f017@linux.intel.com>

On Wed, Aug 26, 2026 at 04:40:14PM +0300, Mathias Nyman wrote:
> Roothub needs some time to settle as well, but 200ms might be excessive.
> 
> xHC can triggers wake (PME) when a connected USB3 device starts signalling wake,
> but port registers changes are not always visible to driver before link training
> between roothub and device is successful.
> 
> My educated guess is that 120ms should always be enough for the roothub.
> This is also the lecagy msleep() still apparently left in xhci resume
> to detect port changes in xhci runtime resume if there are USB3 devices.
> That msleep was supposed to be removed now that we got the hub changes.
> 
> This 120ms can probably be further tuned for roothub in some cases,
> especially if resume is due to userspace action instead of xHC wake signal (PME).
So the patch I sent above unintentionally brought the total hold from hub
and xhci side down to 120ms, which worked.

And the correct fix would be to bring USB_SS_PORT_U0_WAKE_TIME down to
120ms and clean up the msleep from xhci_resume?

I can prepare a patch that addresses both if you'd like.

Regards,
Lovekesh
