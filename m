Received: from chaosmail.tech (chaosmail.tech [77.81.229.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 799A449B209;
	Tue,  1 Sep 2026 18:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.81.229.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788287074; cv=none; b=GFlDecuMoPCm+OJ/9z1gpTW6f9kF3Rn1MqLHZUdwhBVb5d2A11AsFLQKxCquvQ4dKUPs/rv/WybamSfGKCWWUMgW+mWh1ogQUR2qL781702TfWSkuwAyJfd4I5fQCFAF0dXQiu435bAQB2/0XmtUVTskFFR1YUTCjHl/sDanlkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788287074; c=relaxed/simple;
	bh=Dbvx0sDSqnoFXbOknr7ZXcd10mndDk1sduAHZUxLQcw=;
	h=Content-Type:MIME-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=uVxlP/gvLWI1Ve0lfbYsNCxTDu1XpHOx37mcjysUPT6TM766tgaUNX/4XgH2W8oc9I0/S3CW6qqJlRSsRPMPJWdyy6a1HMoMZW88YHsTR7Q1sQJHAs/WCeCNgURXOGnqMm4JT3d2E8yXEuKf7lVfrvkWv9NiHzvhmP0CddXkU4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech; spf=pass smtp.mailfrom=chaosmail.tech; dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b=C47RqzGM; arc=none smtp.client-ip=77.81.229.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b="C47RqzGM"
Received: by chaosmail.tech (Postfix) id BA34B1C7E88;
	Tue, 01 Sep 2026 18:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1788287070;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gYkD1BDeagh/tU4CJQnf9fXkpvpMWmQPMRYmn9m9tvY=;
	b=C47RqzGMBN50QFiqeZghBFTLkfNglzevyGvp/t34nae41elfZ3+0Zyn4D2LV490ecC4wvk
	3FEW5djWGgMi2I3m1/DHHZCvzzJ85AiUeq6lc3q5fRrPggF3dwZ7SymBOkYxUQkkjokhHA
	+vf3qHLjjqkOSPkF7syqqnIwo2uUB3A=
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v9 1/6] dt-bindings: spmi: apple,spmi: Add t603x and t8122
From: Sasha Finkelstein <k@chaosmail.tech>
In-Reply-To: <20260901-clapped-fled-2ae6126df5cc@spud>
Date: Tue, 1 Sep 2026 20:24:19 +0200
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
Message-Id: <F6BE1957-CB62-4D6A-ACA1-1521A14A3E23@chaosmail.tech>
References: <20260901-t603x-spmi-v9-0-09e702e3b153@chaosmail.tech>
 <20260901-t603x-spmi-v9-1-09e702e3b153@chaosmail.tech>
 <20260901-clapped-fled-2ae6126df5cc@spud>
To: Conor Dooley <conor@kernel.org>



> On Sep 1, 2026, at 19:41, Conor Dooley <conor@kernel.org> wrote:
>> +if:
>> +  properties:
>> +    compatible:
>> +      contains:
>> +        enum:
>> +          - apple,t8122-spmi
>> +          - apple,t6030-spmi
>> +          - apple,t6031-spmi
>> +then:
>> +  required:
>> +    - interrupt-controller
>> +    - "#interrupt-cells"
>> +    - interrupts
> 
> else: false?
> Or do the existing devices also support these?

Yes, they do, we are just not planning to use that.

