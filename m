Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB2CB331EC0;
	Wed,  2 Sep 2026 12:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788352031; cv=none; b=bx7I/yAK/RvzTyWz/IVbx3Xd80PrKHvc+wy17YcwAeFa9w3D1rlu7JEepkICPZaWnHEzk8MrWOG3+P5+zei+LTGJ3edYseSpuexKQQGovm0foSVnFAKVPUlkZvOTh1xaYBLl3sMJ7FW5FFCaoBjhy86zhZ1OeZ/tTLNSyxZifXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788352031; c=relaxed/simple;
	bh=6NvYUQ4nau1xNTXr8eWwYqaayehAfFtZgdem+eEQx9Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GTSUAn9t6JBvFqpbjcTg39IJlPdDTFrW8xaiSJzoOLkUZi75Td82A24JJuh239UdG1Lp3ARVSEltXnylqexDpCYn1MuP4vVhVe1TMAzjbJ0P42osBfKl5is4cwaabP5os8Z55+6Q5E0mNu/rKlKxFn7d+J5i8n17hyMK3FqV8uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D1IMJPRq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D1IMJPRq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E61A71F000E9;
	Wed,  2 Sep 2026 12:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788352030;
	bh=QvDOl7Usw11X3HQoAMiPbLNE1GZkyjEIgO9Js4U3JaY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=D1IMJPRq9XmC2M6KwIi+V71a46JPZuUKGh9MnJFvw5U3Ad7MTyWVXrLrOWIXu+xqt
	 VEYfiFYH5Egl02iROUGbDxSTnU/bPM9QMv7bUhWsLUhPTHFb7Z/1r84DpYaaZdZz+0
	 KAxbSFrrk+xkpRXt84w6TR2fn9Xyc6Elo/eVPqvpkHfWAvDYhKLfm7pojYbvtIzKRE
	 eoWaFquMUh8s16eg0LhH7cm/OVj8y5r8UcU7FWwa+kC3QcqUI903sMSxGY/mMHzb0Z
	 q8usExgzUyVOIYFUbddF4Blo82IUUCTTqJEOFbMvxa1+mDAdMyTus2xgYN+F43HlMD
	 wJHkDt4GsiDLA==
Message-ID: <9e70c154-fb66-4316-a778-7b271f110dda@kernel.org>
Date: Wed, 2 Sep 2026 14:27:06 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: add Abel as reviewer for linux-arm-msm
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260902-maintainers-qcom-add-reviewer-v1-1-82d6126df520@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <20260902-maintainers-qcom-add-reviewer-v1-1-82d6126df520@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/2/26 1:57 PM, Abel Vesa wrote:
> As agreed with Bjorn and Konrad off-list, I'm stepping up as reviewer
> for Qualcomm SoCs support.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Acked-by: Konrad Dybcio <konradybcio@kernel.org>

Konrad
