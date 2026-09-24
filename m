Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8B492E5429
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.63.252.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790253320; cv=none; b=I2I5mu+cprHKb786miMyvFvsQSbLPO0j4+thwCKANBekPUpf+qW2WlQgTqUU7G/EIt89c66jVuiejkVKAzwEyFwLZ+zINgWkZT/tsen+RogN8bFiLaAUJ5yJOlPijoWXRpXyBLs8n4rk9wPQzN+SyGQ93qUOcDxi555QxmwE/Ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790253320; c=relaxed/simple;
	bh=CFTnrDS6JLo1+OVVI5MGDkJMNUS1XRhoezsJn7N2SxQ=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=SZjC9Kr8bS26r95JnRuJZ+s3AyOGqg4a/Il1Ugg1leYCivMbrGnM2c10UhNPFUYDDr1UVipfglwO8zCC4x023FyfYg5pQWTyHSA/738WcUp3As+tQ+IVZMvJovEGjOjAvMxp/IwmG1pKnbsAQF7T4pdkrjkg/BC8XaArQ6da7kE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bitgur.nu; spf=pass smtp.mailfrom=bitgur.nu; dkim=pass (2048-bit key) header.d=bitgur.nu header.i=@bitgur.nu header.b=Wl9kYh4Y; arc=none smtp.client-ip=194.63.252.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bitgur.nu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bitgur.nu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bitgur.nu header.i=@bitgur.nu header.b="Wl9kYh4Y"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=bitgur.nu;
	s=ds202604; h=Content-Transfer-Encoding:Content-Type:Subject:From:To:
	MIME-Version:Date:Message-ID:From:Sender:Reply-To:Subject:Date:Message-ID:To:
	Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=kg7TzyCKMBu5IMUBpWDkxVJz3mJoXXcPBUpYwpNYofY=; b=Wl9kYh4YVv76p/vtrDPcDtS9XL
	VoW4k4Yc2gYlNMDzVzPWhk+e37wFXr+sNFu+yrdkTLUT9y25Liow7pF4tllK9v4zrH+tW0vBzwTRA
	rjjCBcKYsb1wRPtRlpTF/NvioDxiaa8aVrY9OOwvNjCbbSL8b62qtZnBsfZWFhSF9sm4fw1t9u3r7
	wdR6QufXsdWqazLnY03VBSTBBntMr++VD26J5X0tnStsu+iocaEcf9frGXtaQghy7xxWH7twyi61z
	DTK0EFEhFcMMAFSFtAqOO07xNEBqJdAqtE/yGO5Q2eR9zesX3Ee1YWAbXJ5zRXauGEX+4Gas40A22
	QaN46BnA==;
Received: from smtp
	by smtp.domeneshop.no with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	id 1x9ifO-005TXl-1s
	for linux-kernel@vger.kernel.org;
	Thu, 24 Sep 2026 14:35:10 +0200
Message-ID: <76c745a6-704d-40fc-a6aa-b96c905d8c17@bitgur.nu>
Date: Thu, 24 Sep 2026 14:35:10 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-kernel@vger.kernel.org
From: =?UTF-8?Q?Ywe_C=C3=A6rlyn?= <yn@bitgur.nu>
Subject: Fair Pay Philosophy Maximally Perfected! (was low-jitter, fair pay
 unity)
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

I found some amazing semantic correlations.

Hux (label) extends the hacker concept into fair pay space. Everything 
can just be set up like our Kawai Computer Bit
https://www.youtube.com/@Bitum_Bitstreams_Bitstars

Ul would also indicate so.

I think this is now maximally perfected, and only enhances the current 
state of things.

So this is now the ultimate philosophy forward. And as I saw a long time 
ago coming, perfection wins ofcourse, regressiveness looses.

Linus really has been a representative of the Sin side, me monotheistic 
side, and now should be concluded.

V4 is the branch relevant, ITS represents this. HP/UX also did this.

Philosophy restores relevant monotheistic branch aswell.

Serenity!
https://bitgur.nu/

