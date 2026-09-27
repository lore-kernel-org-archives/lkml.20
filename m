Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB6A3C1963
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 07:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.63.252.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790495010; cv=none; b=CW6dKENYwh93QcIedQ80ImrNrJxmOLWqVPvU0IZpwFwPA1r3oclDc1vCcMRo4qXCtPqfsEdCyVlBEkBjigwvmxybujZXKtUvt2Br/HOuADnyz20AjK2LQq4fKTIYpQW0Euz/a9wpa+NyHXsJhhmLesn1gxpPgL1TWXd9Sz4T3eY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790495010; c=relaxed/simple;
	bh=5VqsFMT65IEWnR1+qJLlyUWIgF/jp/CBCsk273aWztM=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=ApjT+6O+LX3ucP5Gcp7lChKi3bjCBRwmPa+KkNIIjWX9AdLQkre3lwENlwvOYjC16NZMwfdKhLWWcR/vx/gfsBDVG640eOYW8WaO/zFe9rhRwBcU3HrZaa7HhgMt3nrUVaTBThrb4ub6gHSGTizSv67cKRsUE42ulUKHX8zP2T4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bitgur.nu; spf=pass smtp.mailfrom=bitgur.nu; dkim=pass (2048-bit key) header.d=bitgur.nu header.i=@bitgur.nu header.b=Y3E9Ala8; arc=none smtp.client-ip=194.63.252.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bitgur.nu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bitgur.nu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bitgur.nu header.i=@bitgur.nu header.b="Y3E9Ala8"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=bitgur.nu;
	s=ds202604; h=Content-Transfer-Encoding:Content-Type:Subject:From:To:
	MIME-Version:Date:Message-ID:From:Sender:Reply-To:Subject:Date:Message-ID:To:
	Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=HRda/ePnEVmd4eVqjf+HdjLtPkKatpC2rK+855vhQK0=; b=Y3E9Ala8958my2uMASq9S1Rb2c
	0yEH9cVlrPBAQQ+YNHCN7toukbkTBRyLPd5rTSmeMQP2hlJgRWQpSMYR7+XzZVJRFxN4Q5TvwXZ/E
	oVUvd5uyEmMbZmn0k8MI+37K6TgsAv0CDkKXdc4FV9pQmHIZDSXb+H03EYXRLTO08qs9u9lUFkJcK
	rB6AINgnEKcWudiq4vNTBncLK3PpRs6+jJhCxhWlM5V4zXY/ayqnnWTNIigz2jLQ6a80RIYn587cu
	Ubivsy94DtFQ+VhiTW77vxhbi5pdRaer2Qjwm9zLRjx1JQoNoNYwzglSaEyesKiRysdYof3LiLgLP
	frNGbdFA==;
Received: from smtp
	by smtp.domeneshop.no with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	id 1xAjXZ-003Yeh-7t
	for linux-kernel@vger.kernel.org;
	Sun, 27 Sep 2026 09:43:17 +0200
Message-ID: <6a943328-d332-41c7-a3e9-bfdc63b2ad1e@bitgur.nu>
Date: Sun, 27 Sep 2026 09:43:16 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-kernel@vger.kernel.org
From: =?UTF-8?Q?Ywe_C=C3=A6rlyn?= <yn@bitgur.nu>
Subject: Fi Wave (following Low-Jitter, Fair Pay Unity)
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Fi is an expression similar to Hac'er.

As our Kawai Computer Bit says to make ITS,
( https://bitgur.nu/Bitum_Icon.png )
so does this, WITH fair pay politics, and possibilities for Fi Wave 
mascot culture, keeping the relevant developments only, and shedding the 
negative rep. Bitum ready.

Serenity,
https://bitgur.nu/





