Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD8D32D8385
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 06:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.63.252.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787812249; cv=none; b=NZUHYNnzICzXKLqMfNnSMAOyRf6p2X12Yl8uggScQXwn2h2Tcw8K7qRAkIBBba8Ue2sRqDXy1yMifqerkKckdqMHJEiAwVyQP503WgE7bb/8gaW+CumYZzXJr1VVwE4tY2t/FRQWOawksR4mxveIg3bt3kpFpXdFpa0Ig5DdMzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787812249; c=relaxed/simple;
	bh=vYlw+yoDo94J1djbsp89GGZe6PpoQNV/EiITRv9otXQ=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=OBcMvSzZRXI9eh21VeO2KJRaPJegj0vMt1y1ikZIVHCUe9YCUN3M602+H6S0i9rCi3U68IAW4bWhJKbpoq4snJ1O4O2uBhe2deRuDGco7Lci6N+kHGjckYevpX0oZiZPOZDd8s/fXC7U2aRg7PgQ6jYxLQO1VHXAaMPGHUbdRDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bitvisir.nu; spf=pass smtp.mailfrom=bitvisir.nu; dkim=pass (2048-bit key) header.d=bitvisir.nu header.i=@bitvisir.nu header.b=l/2IHJN7; arc=none smtp.client-ip=194.63.252.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bitvisir.nu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bitvisir.nu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bitvisir.nu header.i=@bitvisir.nu header.b="l/2IHJN7"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=bitvisir.nu
	; s=ds202607; h=Content-Transfer-Encoding:Content-Type:Subject:From:To:
	MIME-Version:Date:Message-ID:From:Sender:Reply-To:Subject:Date:Message-ID:To:
	Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=KAcKaRU0OoMgU5Owi+vF4uHlaalbqO8MSSCJvkuVGgM=; b=l/2IHJN7zWB/EqZt1LbvSzLH78
	5hsO6pL4PRvJVAzCHxsCGs3tV2JsMqi9xjAU4Ske+VUIJ4SwImiiXsBbVOQqtOwQV8TcPMacOdbyn
	tHUIpV9E5Y/Ze7NWAkeQNLUouFyTXXJrg34bHjlpEVwPTfU4BRiGJcVaHZbniKQPiwsAjmYIVf/Mj
	zc6Q2sQ4wJrDDUfqHX4ylfnD53HK9KDPTvKEAqck/g+JKc8P+DShxSgHmJpv6E77wDZMZ+8O8w32Y
	Uxd+sJ8ntrYfuvP4BF9g4dqDMVeyxqSOpYkloGqhR9niWK4Zwihsv/o7EtEbvhPfCE+Qavu9lFyPf
	ge89U1JQ==;
Received: from smtp
	by smtp.domeneshop.no with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	id 1wzTdN-00EnWB-Ss
	for linux-kernel@vger.kernel.org;
	Thu, 27 Aug 2026 08:30:45 +0200
Message-ID: <80ee9755-81be-4f97-9c5b-1fe78244042d@bitvisir.nu>
Date: Thu, 27 Aug 2026 08:30:44 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-kernel@vger.kernel.org
From: =?UTF-8?Q?Ywe_C=C3=A6rlyn?= <yn@bitvisir.nu>
Subject: Philosophy (was Low Jitter, Fair Pay, Unification)
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Philosophy updates:

Now using the label Fidel, that is completely accurate, and a variant of 
Hacker (Truther).

Bitcurrency is a variant of Bitcoin where the amount is adjusted for 
correctness in accordance to Fidel.

OS's such as MX Linux, that claims Muslim (translated: Fidel) is not 
supported due to the fact that they believe in schisms in that concept, 
between variant labels. Fidel is letter pr. letter correct, and all can 
be done according to it.

This is now the only version really, since Mandrake (Linus version) was 
ended in 2000, according to his own wishes.

Inline with HP/UX really.

Serenity,
Bitvisir,
Ywe Cærlyn
https://bitvisir.nu/

