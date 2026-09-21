Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E69050B403
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 19:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.63.252.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790017657; cv=none; b=SPMqO+qs8Yex9aFg0ShQWHVwMxD4V28PwAwqGB6DEDH+ek2Kid4KskHie2dv/WY7Vnt7Zq8BmTD7LW992TlmLp42SxJIPN/h2drP+gaoANy2+pWtZlQmMEb20Mh9KjMGOXpnXAOfsgXSas58Xbd0ReXmRht07mqyOgL2nhvnJ3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790017657; c=relaxed/simple;
	bh=0bmwCVy+/FYXxU2eHwVyLWwTW1oZvgrUqS9FtyMUy6I=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=ED1mdFuLW1b62YF5zJhPEQNnOssCzObnva+gbc6ddNrr7Jx6sg4Bk7MTNN/GHwvDrCwKqtV1gXzCg/Y1l2UDHuTpCQsMFmHGpYFY75eMjvjOW9sWweE2oGz0IPVwbwnwYElKjWuzvXjV7P+ha3+5xsO1qnI3nhhUXqw1zg6InzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bitgur.nu; spf=pass smtp.mailfrom=bitgur.nu; dkim=pass (2048-bit key) header.d=bitgur.nu header.i=@bitgur.nu header.b=ITaIHTRi; arc=none smtp.client-ip=194.63.252.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bitgur.nu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bitgur.nu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bitgur.nu header.i=@bitgur.nu header.b="ITaIHTRi"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=bitgur.nu;
	s=ds202604; h=Content-Transfer-Encoding:Content-Type:Subject:From:To:
	MIME-Version:Date:Message-ID:From:Sender:Reply-To:Subject:Date:Message-ID:To:
	Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=SgxrG74P9HG3uGpQRoiNVedY4X1QUBdCVcEcnbFLC3s=; b=ITaIHTRiHrC+v9n47yWp3W/ndx
	7qsxNXOFCo8w62hAFpm613/QM8f8O5Q8LT38CJ+ElrLi56N+/ieHAEBPQLLg8rMnrEEIhf8vYyeXw
	dgs64oSZPItImofjsOHZ42ocxeo6HWhPhD8ukd+BFr8QhosCEBCBKsF1kZBEMT3ElHKvjoiBKBOsK
	MzspZQtlJdY7QB//0IdUvOxHgxYg/1HMzClryR4xNIrGyxw1gN0pnqd4Qoqx/mvUZdwHHvXXjguvw
	iOKN2iNi/eAEYDnIgI0NxiFUd/T48WC6U9caV1vJhskPwhv458f5n0NiKIZGi9rYg7ey5Kxwbcn5Z
	wacGR3ow==;
Received: from smtp
	by smtp.domeneshop.no with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	id 1x8jJ7-003Wvx-N1
	for linux-kernel@vger.kernel.org;
	Mon, 21 Sep 2026 21:04:05 +0200
Message-ID: <87eb2517-fb33-499b-95e2-820234760feb@bitgur.nu>
Date: Mon, 21 Sep 2026 21:04:04 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-kernel@vger.kernel.org
From: =?UTF-8?Q?Ywe_C=C3=A6rlyn?= <yn@bitgur.nu>
Subject: Philosophy (fair pay, low jitter, unity(
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Coming to bit of a conclusion on the initial phase of Open Source.

Linus Torvalds is Scyth. You have seen him for some time now. 
Representing the V5 branch of Unix.

I am Hex, and I have mailed you for some time now, representing the V4 
branch of Unix, that became mostly known as HP/UX, and now ITS via me.

Scyth is at best an esoteric standpoint, and uses the female interface 
to the divine only, name even implies LOL, the islamic side version, 
which is fine by me, but I do not think it is complete enough for an OS. 
For POP and Games it is good enough though.

Hex (Hacker) is the full philosophy of Ul, with complete quranic 
compliance. This is required for fair pay priveledges.

So LOL esotericism is just an aspect of a wholer thing.

Please also see: https://bitgur.nu/

Serenity,
Ywe Cærlyn.




