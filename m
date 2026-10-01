Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2255D369990
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 18:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790880753; cv=none; b=YK7DUDua0HbKalXfB6Q5UkLgZlyeLxSy+V2CjoIoeOuzEggVlVmKZaxXxB4+b8OKtKdI90tGKV7DFPjbZ+LYNC8g+5unXpDy0wmq/gJXRctoiDCa5sGZcVZd3HO2lgWxBuZrXmXQNcYJe3rYHH+mr40XJC6garnSt3Dg8js+uao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790880753; c=relaxed/simple;
	bh=NzLZKjU8ptejrY+87RgUK703ZHzae+j0fTkW4FgVOn8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GfdsZ3YMOhy4HGFfSq3iY6L2/8nCcix6aLTYhuzKJhvxtocUAIEQ+jmaVZieksok8GfRU5ZhZu8TH+biHOgsaKKxUx0fTXBuo03GlGMquD5FUVlH+I4Xd+IRVEwzG8Xl21TAIij1uBzOEi7zNski40COFj0j/Vnxt7I31+G78xU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BuHRCdDv; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BuHRCdDv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790880751;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NzLZKjU8ptejrY+87RgUK703ZHzae+j0fTkW4FgVOn8=;
	b=BuHRCdDvv+kRg0c5tGM5vjWKu96AzFCGGFPczGPifHUNFRdUCtwsJMT1wBdt/tKB8uYma4
	2i+25e6UIHur5a26mHvIPF3RlQlIcNqW6bxW3wGO/1OIxtsGXVF8yAj93xCykvETHXx/6Q
	uZzW8O9v5ZucrFNoe8xwdHDmnCr31yQ=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-659-hxfPdkq5MC2aPInYBxrjgw-1; Thu,
 01 Oct 2026 14:52:25 -0400
X-MC-Unique: hxfPdkq5MC2aPInYBxrjgw-1
X-Mimecast-MFC-AGG-ID: hxfPdkq5MC2aPInYBxrjgw_1790880744
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 23D531905692;
	Thu,  1 Oct 2026 18:52:23 +0000 (UTC)
Received: from jtornosm-thinkpadp1gen7.rmtes.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9106D1956089;
	Thu,  1 Oct 2026 18:52:20 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: johannes@sipsolutions.net
Cc: davem@davemloft.net,
	emmanuel.grumbach@intel.com,
	herbert@gondor.apana.org.au,
	ilan.peer@intel.com,
	jtornosm@redhat.com,
	linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	miriam.rachel.korenblit@intel.com
Subject: Re: [PATCH v2 0/5] wifi: add opt-in FIPS exception for iwlwifi
Date: Thu,  1 Oct 2026 20:52:18 +0200
Message-ID: <20261001185218.189030-1-jtornosm@redhat.com>
In-Reply-To: <eac35c39724254fe0b208d50130cd6a6737ee407.camel@sipsolutions.net>
References: <eac35c39724254fe0b208d50130cd6a6737ee407.camel@sipsolutions.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

Hi Johannes,

> I don't _think_ it does that. It does behave a bit differently for MFP,
> but that's wrt. management frames.

Good to know. I will re-test with just MFP re-enabled and no data
keys to hardware, adding more debug logging to understand where
data gets stuck. Something else must have been wrong in my v1 test.

> Fundamentally, in this case the driver (even mac80211) shouldn't install
> (data) keys to hardware.

Ok

> I'd need to sit down and (re-)derive that, but I don't recall it being
> particularly tricky - just boils down to the various dependencies
> between features.

Ok, I can assume there are no other dependencies to start with.

> Presumably that would mean IGTK/BIGTK can be offloaded and remain
> working, but TK/GTK can't be known to the firmware since it's not FIPS
> certified.

Ok, I will take this approach for v3: IGTK/BIGTK offloaded to
firmware, PTK/GTK software-only.

> I mean, you _could_ push this further and keep almost all features: you
> still give PTK/GTK to firmware but don't use the offload mechanisms for
> data frames; though presumably then you'd not consider the result "good
> enough" since then a non-certified component (the firmware/hardware)
> holds the keys...?

Ok, for our customers having the keys in a non-certified component
would not be acceptable. The simpler approach is better for this case.

> I have no opinion on that, I guess the crypto folks should chime in
> about that. Having something very obvious makes sense to me, vs. having
> it at wifi or even driver level.

Then I will keep the boot parameter approach and make sure to Cc the
crypto maintainers for their input.

I will work on the feature dependencies myself and come back with
a cleaner v3. Thanks for the guidance, very helpful.

Best regards
Jose Ignacio

