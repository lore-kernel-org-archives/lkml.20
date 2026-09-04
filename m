Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 298AB3559CA;
	Fri,  4 Sep 2026 16:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788539567; cv=none; b=nJ71S9KA0paaMzQE9dN2DBWeG/KdY2ul6mnNpL4A5kVgl4tRm7Rb1Oc/q8v3PsYinFtQi+0MGd3ta6rpkYf3ybz3+jeZ/j+hL9VbAOYDDtSgBEMiIDKUYZuujDugQoyLsqMYioMFJoZ1M0Ct5FabQlPK+BCRtOJt2ZQlizCiWNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788539567; c=relaxed/simple;
	bh=rgSIfBXdNfXfrMr1jQPADSdpyQ3KyWMfeAtmtaYettI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PZ5SzU3+YX+4HRGeGQmNdueH2dZ5KYRra63a1J9UIkCNBvM5a20x3LMuuMZ5CQfc0HaoG3FK1bwmfB1xMzIOmwPsPxikNFWflcluJpquKlGTkZhfLNCTOcHctqUQ93nPgJtJVjTPT2vq1lQ7LvcbQiXp0EubDGewdWQE4xfu83Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=ZbJsPGir; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=wKnfNL+3; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="ZbJsPGir";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="wKnfNL+3"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4hc27T0HBpzMlGj;
	Fri, 04 Sep 2026 18:32:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788539557;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2XT4bF97TwJ+BMG7sv8bPOMc55lgJqA/dzf9RhM662U=;
	b=ZbJsPGirnOdRmhbCxudK4XNCp851qfc0olUajC5eaMy9smSwLpkDDJzlI8J6kbIVeiTzBM
	WuZt0p/GLdXiUKdbsF27HtdAHefSmfmWW27P7UY9kA1THTd4tINRlq721MCjTaoPValdCK
	gx1clNhZbG2nlXkB4nrk6FZpNjxuwvCPFFPh7A/4EORkD+66Xpp45z9d2PeKeCt12AJj5G
	u9cg9NKP03/7ut9hzcGZznqsUBf3fuYSPAf0Hv2QiAyLXWfI1UkVAHv/TaBrARjgmtVlVr
	1Bf4+o763fRDI8622qbLNhrRJr+RPLr/VHeolKF0nLBzyZzepOUcvDAc/3gJ5Q==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=wKnfNL+3;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=marek.vasut@mailbox.org
Message-ID: <7771adfd-7447-4802-ad75-7c889ad32ee7@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788539555;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2XT4bF97TwJ+BMG7sv8bPOMc55lgJqA/dzf9RhM662U=;
	b=wKnfNL+3jEJBhn3mMmlf8XXjgR83LAFahECiJViB9FtlJXK+Tijyix8UPyWW81GZwS8AN5
	9yq1iAmCkSE0o3+lgtgdxVdMXidcXEKbJJl2WIfcxWpZvZDKl77oBkfBTvBK5S76X9XHIu
	LQg8+HjhYnveoqJU5sJialHKlTn/ibOpbSlMjDEpghhrU+D37fUG+W0bNIqDK7O4RpXVK9
	7E4z+FrfU5B2C8EqtsWzoXkr6tWcNo0aZ+0X0p2PyPCEHc1iJfOWDVSBPnDa4DGoiIGHCF
	RujKJqtk4T4zdRkZ/WBuvQYpCZ2ay+rV6eP8AXXanZ59dmvZ2Txj/kXZcRWH7Q==
Date: Fri, 4 Sep 2026 18:24:04 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v7 1/2] dt-bindings: usb: dwc3: Document Renesas R-Car
 Gen5 DWC3 xHCI USB controller
To: Conor Dooley <conor@kernel.org>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-usb@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20260903213031.314473-1-marek.vasut+renesas@mailbox.org>
 <20260904-colonial-wimp-b37c27657664@spud>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20260904-colonial-wimp-b37c27657664@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: pyimr16sbrza84wiqupizfwwerkrhorp
X-MBO-RS-ID: 853489d916b77e12eeb
X-Rspamd-Queue-Id: 4hc27T0HBpzMlGj

On 9/4/26 5:32 PM, Conor Dooley wrote:

Hello Conor,

[...]

>> +required:
>> +  - compatible
>> +  - reg
>> +  - reg-names
>> +  - clocks
>> +  - interrupts
>> +  - phys
>> +  - phy-names
>> +  - power-domains
>> +  - resets
>> +
>> +unevaluatedProperties: false
> 
> I said this elsewhere today, but this binding has lots of "distasteful"
> properties for things that should be determined from the compatible

Which properties would those be ? (it seems 
reg/clocks/interrupts/phys/power-domains/resets really need to be there 
as separate properties, but maybe I am missing the point?)

> , so I
> would appreciate it if you could use additionalProperties: false here
> cite the ones you need to use explicitly.

May I ask, what exactly is the rule of thumb for 
additionalProperties:false and unevaluatedProperties:false ? I seem to 
struggle with picking the right one for a while now.

> Sounds like dr_mode: true and
> maximum-speed: true are all you'd need?
Ah, I think this also answers my previous question a bit. And, as for 
limiting the properties that are really needed -- this pulls in the 
common DWC3 USB IP core properties, which all do apply to the DWC3 core. 
They might not be used on current hardware, but they are still valid for 
the DWC3 core (IP).

Thank you for your help !
