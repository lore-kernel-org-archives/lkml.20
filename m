Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBEDC51D504;
	Tue,  8 Sep 2026 15:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.126.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788879902; cv=none; b=ilopTdarCj842dr9kOASq3kFJaotYsdSvGdYxB5FU+q57LsfsutK3u6gNU1SvxC3cXtZYgXsxTuAKdPqJHx1aUzwptPiq5mWspQxbM8Nx6vMwqebn+pBY4B3MPDuBTqArPx4T4ngGuP7CxZ9LKAX8TBD0Tq2aQ4ho/COdjwoAM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788879902; c=relaxed/simple;
	bh=VQwFcIG0mlhDqruqmvZIwl89H/SmpDtWHncAWwcIHCM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Pr69VwUMIbXl6s37EpwH9VholQQLBj2o7dyurAZOO8FiA13eYpZiw/aAv+lNnBoiundpGAHxjXOgEGsXiunJxF8Dub8A8gV1mKdAucl16fHcXNKaxWZcyG7uqNkrXILu0sGB+mDlc5hdmtQZIRda/pLJMUMD8rtmUbtn1GwD0DA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oldschoolsolutions.biz; spf=pass smtp.mailfrom=oldschoolsolutions.biz; dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b=OgtXdJX9; arc=none smtp.client-ip=212.227.126.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oldschoolsolutions.biz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oldschoolsolutions.biz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b="OgtXdJX9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oldschoolsolutions.biz; s=s1-ionos; t=1788879885; x=1789484685;
	i=jens.glathe@oldschoolsolutions.biz;
	bh=VQwFcIG0mlhDqruqmvZIwl89H/SmpDtWHncAWwcIHCM=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=OgtXdJX9ivF1QhTUJ7yeXGw5gLnMDyrKt4tYZXtZnFYwjTc/m369Z4qxNaYhp2T9
	 DFYrBie3WL8PbwZ8rOW8h6ulzVWWATfbP8dzJdK10SVH49fHg3epVx+PdSwrt5EVy
	 nIasT7wRwyxDtEWRcTRPESNE/KNyjwtBBMHjOu/hsGbn0X3x0z6UTy2fTrFqILrwX
	 7hWvv66v8bFqo8YrFfJR8yTeblXapApRm3Thjl96KJ0vSCgLhOFdSpV4eo2s97kvN
	 Hcb7aZlEf/+kRReS/7vF09vEHIQdH/odMTmVXT+ICWXJoV9Ykz0jT7n9JkDd5VVUm
	 ykuV3QcMrk7rRUtNoA==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from client.hidden.invalid by mrelayeu.kundenserver.de (mreue009
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MtfRv-1wqhHO0PxX-00uYX6; Tue, 08
 Sep 2026 17:04:45 +0200
Message-ID: <9762659c-fbde-4887-8da8-200db7dfad09@oldschoolsolutions.biz>
Date: Tue, 8 Sep 2026 17:04:44 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] arm64: dts: qcom: IdeaCentre Mini 01Q8X10 Hamoa +
 Purwa
To: Mostafa Saleh <smostafa@google.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260905-x1-ideacentre-mini-prettify-v1-0-9a87882973bb@oldschoolsolutions.biz>
 <ap_PdUrwLIVGJ3oG@google.com>
 <dcae935c-ccbb-4cb5-a184-eb5dc2cc84b8@oldschoolsolutions.biz>
 <ap_qwdz-3WibXRjq@google.com>
 <364326dc-9715-4e77-bf25-4d0a30179826@oldschoolsolutions.biz>
 <ap_69OsnAOwQyo50@google.com>
Content-Language: en-US
From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
In-Reply-To: <ap_69OsnAOwQyo50@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:e9tUctOy+043yboOdiR/TmKWOYTort7SN+XLJY5LZ2c9rMGGlxy
 1QCy4GzldVfgq002jL42kZJbFQl/yPefG59vEAYcuMTYPycMTD9fPRq11js/MWPyOZLGsy1
 CGH17dsRH/e/VFz8Qxe6F0hgDCXBBMoQW+gpO7OmzL9aP9hnY+Gg6RtSNt1VhTad4E/WQ11
 g+TxuFoi8PS07GP7lahag==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:kuGATbkN5P4=;1JmaugvcsxG2j1F2X8v2R5FWkz3
 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

Hi Mostafa,

On 9/8/26 14:09, Mostafa Saleh wrote:
> I don't have a display connected (never managed/bothered to enable it).
>
> Can you please share your .config, I can test with it, just to eliminate
> the possibility it's causing the issue.
>
> Thanks,
> Mostafa

This is my .config [1].

[1]: https://pastebin.com/QhDizqCB

with best regards

Jens

