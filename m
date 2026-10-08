Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E821A43499E
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 13:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.63.252.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791466513; cv=none; b=eLVM18TaVrITd9zKLjcHizaZM5QIc8vFjJS/2gVNFzBMONrW2g8LeTnDdpcCDju/OIhDcI2EUK5QUSadfA12uGm9E7zsBpp/d8vjMhcRLUNzZwR9y4LM9RE+GlMaOPFfRCXWfrwmyTAlsvk7qpPUehraiSexrJCPtZb6EcModpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791466513; c=relaxed/simple;
	bh=nuzqgYUhIR28zRa2Dk9s/4YeY1yw+w6r01DpZVXDwz8=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=CsAja+Cb7K17LCROZEYHe8wjeDbbJR3KpO+uBQyi81Xt4wzKNVfS6euYAXpGiULWYpH3t7RXZhq3Yz39MCHR6luWJSgfSG+dodl/jk8uVxKv1D8ef4n6h06wwhP2ntGIOd1uYj1WPZgmx2336szz+TsncOR6H7zX1jYj+WGfYfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bit-imam.nu; spf=pass smtp.mailfrom=bit-imam.nu; dkim=pass (2048-bit key) header.d=bit-imam.nu header.i=@bit-imam.nu header.b=V3/3BZnv; arc=none smtp.client-ip=194.63.252.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bit-imam.nu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bit-imam.nu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bit-imam.nu header.i=@bit-imam.nu header.b="V3/3BZnv"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=bit-imam.nu
	; s=ds202606; h=Content-Transfer-Encoding:Content-Type:Subject:From:To:
	MIME-Version:Date:Message-ID:From:Sender:Reply-To:Subject:Date:Message-ID:To:
	Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=aSFQxJJX70TfFUvkE0jXTrot5kbyRgt2x3qH7bjbaCo=; b=V3/3BZnv5v6sln8DrMxwNvyOg/
	oTOVezqjnG0pG2Mnfoyujg4o5KDQsnDxVnsHlQ/zfkvfiYycgbr23opHyCpj4U3CREQcclcPeOf0x
	MABOn8PJ6E3bOc5arz1BcxFqWFh0JOc/h7K7es9EnbMC8hy635jXyZEMsqEjRSTxp6z2HIb6qUDF2
	pCLmF3MLzeUV5SckWrST4ElD8yFIHjuFQQeTE5boFtWX3nQRCJyqJPIO04cxG3x8qDlVvCfyqxHJg
	UY1Ab45KP/QiWFxLYSvp/zA9UjbeBhsxuQN1WBg6xxOEtiwEdLG4st/wVrAso5gsq510sb0PsWrhF
	iGzuYknQ==;
Received: from smtp
	by smtp.domeneshop.no with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	id 1xEoGz-00Acio-ST
	for linux-kernel@vger.kernel.org;
	Thu, 08 Oct 2026 15:35:01 +0200
Message-ID: <ed403944-4c16-4ba9-9682-0cc723244d12@bit-imam.nu>
Date: Thu, 8 Oct 2026 15:35:01 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-kernel@vger.kernel.org
From: =?UTF-8?Q?Ywe_C=C3=A6rlyn?= <yn@bit-imam.nu>
Subject: Imam FIR as IIR ++ (was low jitter, fair pay philosophy)
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Updating to the standard term Imam, to cure deafness in some 
islamophobes. I think this is best associatively to avoid "some other 
philosophy" claims, if using other terms.

Imam also represents the correct branch of all of this.

Updated: http://bit-imam.nu/IMAM_3-Bit_D_A.png

Non-Islamophobes may have the lead with this. IMAM being also perfect 
for FIR as IIR filters, and what is better done via IMAM.

Also: youtube.com/@Bitum_Bitstreams_Bitstars
with a little bit of background and interfacing information.

Serenity,
http://bit-imam.nu/
