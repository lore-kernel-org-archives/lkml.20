Received: from chaosmail.tech (chaosmail.tech [77.81.229.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 640BA380FF7;
	Thu, 27 Aug 2026 09:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.81.229.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787822266; cv=none; b=kEEBATE9SLBhTSkcUsGpYXiGPI7xopPoudXHlh1n70KoOeVuvk1a1CH4rYJDIpPAKE+o7EThKpaPlTLLbKmk4bzApDfdZLIag7MtojJGb9b7HfxFKFBCRaaboM8eycAzKGOmIYvQDDTZ1E/2yZEULWKZmApRM4SmV8Gk62NBPEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787822266; c=relaxed/simple;
	bh=M4JL2DDh2kFEEIBztGWVHhTHMhrmj6tjJLoT35GI3g4=;
	h=Content-Type:MIME-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=HM2wyfpado/20mABZdvu5jKdq+AmcA5u4pbhc2tqmyxI9YxYpap9q4BgK/peamT63HrnNWdSZ4z95sv9os6qO0G0Mbr+nPct83vs4bss/fUZ82qUfDYFkUv8G3EuiWaBSDPUcuWWpEe+d7g9uX8SU4/wg6L8BaVEzQMYD7NY8JE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech; spf=pass smtp.mailfrom=chaosmail.tech; dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b=RTM768D6; arc=none smtp.client-ip=77.81.229.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b="RTM768D6"
Received: by chaosmail.tech (Postfix) id 0B8ED1CC004;
	Thu, 27 Aug 2026 09:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1787822258;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B3d6qXAoH2ydeKOTX+N21t6om6kaUfysJTrx7H/1Esk=;
	b=RTM768D65uV9EGE7KIHZHXEhVA8fU4yBLezNY2ButWgK+qMZkKwAETCTj8wIp+DumjX51z
	hgdse1rrUH9++OWsmH35RBcoDRLakI4cGy+3OBM58tHSmY7TV68CK2JKmKAZwesmemOL4k
	06UqESq2A1V6t55Qd1/9nmXJZfUDYfI=
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v7 1/6] dt-bindings: spmi: apple,spmi: Add t603x and t8122
From: Sasha Finkelstein <k@chaosmail.tech>
In-Reply-To: <20260827-curvy-competent-bee-fcd81d@quoll>
Date: Thu, 27 Aug 2026 11:17:27 +0200
Cc: Sven Peter <sven@kernel.org>,
 Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>,
 Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <E0136D1E-4CB0-44A8-BB70-D499F113D211@chaosmail.tech>
References: <20260818-t603x-spmi-v7-0-dafebe6e7739@chaosmail.tech>
 <20260818-t603x-spmi-v7-1-dafebe6e7739@chaosmail.tech>
 <20260827-curvy-competent-bee-fcd81d@quoll>
To: Krzysztof Kozlowski <krzk@kernel.org>

On Aug 27, 2026, at 11:15, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> 
> On Tue, Aug 18, 2026 at 08:32:40PM +0200, Sasha Finkelstein wrote:
>> 
>> -required:
>> -  - compatible
>> -  - reg
> 
> This stays. Which device does not need reg or compatible? I think none.

I have moved it to the else: section of the if/then below, so it is 
still present

