Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3483385539
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 22:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788301301; cv=pass; b=jKKFNrNjUlOC2ASLmwBVYNo2HGqlUiVdO2vIfU3Wzt29OOalTOIGb5PFbkvlmsAampkfvyRssfr+8+kAS0tmkqNF51AOb0MkldnA+jetPuZCOuRm+qupqhFMuUBzsuWUaz5D5uePRtpBvZ0FRau2MHgl25DmmRdpuLHYtvnSxE4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788301301; c=relaxed/simple;
	bh=uzN6h4kPkqG6EgPNMNwQb+OlvA420TzhuXeECiWI50A=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Muk2EPnvfnf2tlDd+Uxug+xrMd3qSrLvWxMAstbyzWQmFam77mdh5Ij4AicyNRkWlRDRAnR9CdwNBdPu2M8YcKQyJqx2cU+DjMZucvgj+nFwwsiFmAzdKl52CngSIY/tlnufdaO0eOKmvTU/BNahjt9VN8gYN1/B88xrSGSkcDI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X3yd/61V; arc=pass smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X3yd/61V"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7f4e1568932so252427a34.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 15:21:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788301299; cv=none;
        d=google.com; s=arc-20260327;
        b=owx1w4Lr7niMU6JnIqW35CLsrTKMxBfoKc6qc1nBghNE4zz9S+Wxqop8IFeOTyip3a
         DGhoNiZdRlAJ4CD2cNbzTbWBRo35GzmtIJ21vVq2658L4JksfHMr86NrAt7obzewSh/R
         PRSvI79US6zVxh9Fli7XfJXt66EeTPLeAylGk+mxBK2IaxabEDQNQhUbBbdgiqK4RXvk
         l6UYDY2+DLsmDOMsNp6zSH2dCp51xscrol/fsgn2sJFTbIiwxfAd4XZ+yOkjhokoylxI
         ga7eCzEMd9FkxkATg+Uj5zNewcUt4OGDNqzn/uTzLcZ47e6og+YE0q1EDKzz7+oaj3gg
         ZN2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=uzN6h4kPkqG6EgPNMNwQb+OlvA420TzhuXeECiWI50A=;
        fh=mjsN/jAUeXUJNi10sjubcMAvHYsDyA2mQsLy7ibEu60=;
        b=RAZZYnEOnxcyYmybzlut1Snws8cgthSIYY92lMtbXdInUeqo8KoqSwZ+wbh5omFBi8
         1vj715GygJ9O23AAGEfF+BLLKViBx1dY+TqoQmYw+bYqMg6EsdqsQ9oJhl4cD3OrV+hp
         c8RoLTabggKlUBpLK8nuQeB5H9de1r+nC+l0Som2RJOo14wQYG8lDJAdAfg7SelH4uw4
         3MVO3XoUx6Br93viyas78GHOOr6oE2yDGOHGm9BjkO5OjOBBLMUmxlvr/i+ttvoXKafq
         fATQqlrr84rJf75VtwzTbese/R6BSJksnjissyA4MPLunZDqlCz/gnstZs5uBP8TjmtD
         s6qA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788301299; x=1788906099; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uzN6h4kPkqG6EgPNMNwQb+OlvA420TzhuXeECiWI50A=;
        b=X3yd/61Vvl8U6gtWqu6+A+k74tmkNsZLW1LBSPWQaFLBLP9F/ioT0mFTHx/Cu3PfWj
         4zxybiXwb04QbM5oqMxCrRaQYzM1OI1hxA5kT4WfZYaQqL1qYoJiOXnYnc0QfU0X7/tY
         tSaILGDYJQ/knj9bKV31OBjQ4JEqifksba8QkejuXEm1rY9vpzYhq8/gI9CrqAGVlrca
         zTVDKAMRJXlxztCFvPIDB0WO96g+fDF2pKr/lY42KMxwnVN9KVmgixIRInsnKewTk6Ck
         8UiqofkpciX7yLnxvjXUCN/fI1komOKqTuUeCT5mK/I8jSsEhfDlU7tVZLWiENedBg4R
         AKqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788301299; x=1788906099;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uzN6h4kPkqG6EgPNMNwQb+OlvA420TzhuXeECiWI50A=;
        b=p7qJTcJYR9f4YlowV+FgQKrbt2aK11pxSYx1lgqMX28v0RBvdmuFdlsUOiXkUi1Xvi
         myUIDn03DvmgSs5uhBQCUs/w6P6rIeXr98C6ejc2pzuXbFqgd6c+Kp6sF5N4xB2Decll
         OT75JBoIV5L09fUJyU14LhICvJG8BEz7iZUrzVupqPFJHmsjck0m5YNq91aXV681zSpo
         Sfk9K2xpj4sdCmO16dzvVMKos1OTKkEoUh+D+LN2rab4ZZNX2MBhImc025AuJOGxI1y7
         8PvBZDaAzHPayGstRoFY78om7nGepOOHvcwCowcrdwQRZTaqpn6VU0W8bGjv9PVjpOOU
         QNpg==
X-Forwarded-Encrypted: i=1; AHgh+RoMUNmXjgnbJITsF2/N66Fy3TDUnpZU249kPO8XjELBdRh/rgMdwDz65f8ZoBLe7Z+RrplUjdB3mUkK9ME=@vger.kernel.org
X-Gm-Message-State: AFuF++m4c45yESx7HbJ0tUuM9WPn8aSqt/YggtIYsGbwGh/gekPpPXxp
	j3aFIh2b1qph+sVManNFG8YntqNL8C8c8DIFrwU1ImY8JKt0RJsy4yBDqD8vE2gJtrNgCAFx2FP
	HWGzJbmYAE5LqMrK7AXOLuLnmwDehJ08=
X-Gm-Gg: AR+sD11jNeDXGqsvxzb/8vAFEeNVTQ51sdtqw8s4eMXdroHGLzhH2PN7Y/bo3WuI6nK
	Dq5smygUvdx8iQQf+2elRUUJnrisVF2Bqx2Sei+rTEaGpsV0/BkudrELorhrsaBKxgkGA13/EGB
	RO4+/AZj2Q2fLmoHWo4Mx8p7G+q/01aGb3J/nvfwVxjFGVt42AhnylhnsqaHs6mjSuUFVFqnq6h
	ePoCjj6n4heuvdgDDhM+Q4oKgQ7ST710pbSKWEhGRMFOkyadpKKDzXNovjJiRI1pvGy1mJ1ojOQ
	Fwkcd7e03iYNNNUKUUXVVplCAmz45ymfSb4ff1f1RjvLK40qUGtmvk7Q2y6fgwZBNCJONTbLTMz
	XFRI/hai/RyUGqTor5ds03R8=
X-Received: by 2002:a05:6820:1c95:b0:6b1:7251:41d5 with SMTP id
 006d021491bc7-6b47e9b10b5mr78023eaf.3.1788301298588; Tue, 01 Sep 2026
 15:21:38 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 1 Sep 2026 15:21:38 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 1 Sep 2026 15:21:38 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <932eafc6726b4e5d062a0166dc4b5e1594025fd1.1788286339.git.mauriziocasciano7@gmail.com>
References: <cover.1788286339.git.mauriziocasciano7@gmail.com> <932eafc6726b4e5d062a0166dc4b5e1594025fd1.1788286339.git.mauriziocasciano7@gmail.com>
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
Date: Tue, 1 Sep 2026 15:21:38 -0700
X-Gm-Features: AcwNN1VeCPBM8HQqPnfBAdek2MH5-OmaaKJ-LDFTDljCuYh5s49MMUrA1HfUgKw
Message-ID: <CAO7O_xjyMujSdFsj6JZL3hYhaz-1fJueJ9gVV7-Y268jZeZT0Q@mail.gmail.com>
Subject: Re: [PATCH v6 09/16] media: intel: ipu-bridge: allow sensor-specific
 link frequencies
To: mchehab@kernel.org, linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com, bingbu.cao@amd.com, 
	jacopo.mondi@ideasonboard.com, nicholas@rothemail.net, andy@kernel.org, 
	andriy.shevchenko@intel.com, hansg@kernel.org, gregkh@linuxfoundation.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

This patch is unchanged from v5 and I accidentally omitted the review
tag provided by Andy:

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

Andy provided the tag with the caveat that this approach still needs
to be confirmed as the right one. The review was posted at:
https://lore.kernel.org/linux-media/apa2u8qJm6IZ5N4X@ashevche-desk.local/

Please retain both the tag and its review context when applying this
patch or carrying it into a subsequent revision.

With Best Regards,
Maurizio Casciano
