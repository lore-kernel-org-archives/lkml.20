Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch [109.224.244.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 865A14A7C86
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 11:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790595120; cv=none; b=HjEagdRKZ/Pg5MykK71fZa16p4S1SLN4DpKjAXuewhZ0F2qlSHJTygOVclhA7YIIs8KIdG5emr32Gq/COr8WKcJ3uQkfVVQyQWE1JmrO04O6KI6qAoNFnIwUoX53G8dqpYZrColuTnOawmaxSA5tT3w5PIbbZ2g9DNGZ84XbcbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790595120; c=relaxed/simple;
	bh=6n8VlIQR4RxEU97JfR+BbO3o2h4EONnXlUmRE2Ejn+c=;
	h=Date:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=joJ9T6G70NI9lrxk3hA9K+S/FoO0ZhJFY4UXWqB5fKWuSBve/3yhWvp40pxxhFkmRZZJHT5lJ8hy9r0I2o25PFhXkndBh4nD5ZddqOKN45DLTEP3kHJ2wM80UbgANefFunqK8DJ/TsNq4XIvnrwwaefqtqEt2qxe8lTUkYRlS/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=oCdFRTBQ; arc=none smtp.client-ip=109.224.244.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="oCdFRTBQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1790595113; x=1790854313;
	bh=6n8VlIQR4RxEU97JfR+BbO3o2h4EONnXlUmRE2Ejn+c=;
	h=Date:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=oCdFRTBQ4Dhz6vhV05iatfi1Y8IgjBIbZH0S0sTAxm8cbn6z9co9jrPC3niduZZP9
	 dvlrEnA0GwglrdyBd4Zz6C1H+TXSNVGwvWQl+BRxEf2V3OYtGXqmR9pCLIfHRwCTny
	 lAMr97LIchUr1w7vHJfcXVvn75oxGO7LMnopOY/p6DOVeQvBGORjIx92m4Uhu+Whbz
	 gDVwAZGwaI5GiKgBk3S2FVkFqZXe6HwYO5VOll4oga+G+Ltia1oyrdJnTu8rR2N8E3
	 iCY55UvirRN5Le1Ue8ng7KBLEUoAywf8k3L4w4bYFJgUhgoauDqbWBofq4lkLXL0Ig
	 zeat1KhJZBYAg==
Date: Mon, 28 Sep 2026 11:31:50 +0000
From: adisveletanlic <adisveletanlic@proton.me>
Cc: Johannes Berg <johannes@sipsolutions.net>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, Adis Veletanlic <adisveletanlic@proton.me>
Subject: Re: [PATCH wireless] wifi: iwlwifi: mvm: fix self-deadlock in WoWLAN key programming
Message-ID: <7iFmIPid2uOGjWVohSqEyxjzfMI735hdqbZHZ2A5Ba80dkouT1t2tn5vLG4QULDQ5YUYXMqvB0pgrKHJZBSvyN0VC2LoUTNOmc79PPNv_QE=@proton.me>
In-Reply-To: <20260927-main-v1-1-0d59a25f0373@proton.me>
References: <20260927-main-v1-1-0d59a25f0373@proton.me>
Feedback-ID: 138116827:user:proton
X-Pm-Message-ID: ce3f491479aec2f5af5631f0be6be783f9ddb2fc
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Please disregard this copy. I resent it a few minutes later with the
iwlwifi maintainer in To:

https://lore.kernel.org/linux-wireless/20260927-main-v1-1-660ffbc9837c@prot=
on.me/

Sorry for the noise.

Regards,
Adis Veletanlic
