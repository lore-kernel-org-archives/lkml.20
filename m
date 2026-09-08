Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAA8949EC7E;
	Tue,  8 Sep 2026 10:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788862705; cv=none; b=j1wVUK//BJYxywWSyoH+7wx/ZhCC6/eIdTtVV6GWnlon34jsMMIEoB+PoiT/Mt93YbEPPTMRY+nyLeIlbuRCJH7+OEzh+tjyyVrS+2SmrnC9s2i1U1gNETxYMrFPgSh6fv2v9s7oVjWqLxIkc7bYtF7Wtb7wODP3lXgy4Vbsz/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788862705; c=relaxed/simple;
	bh=G1o2hbMY2VerLMAQ6xju5Dmow6ftpwxoblq765jwMzI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Sv6TrDxNzYJ8FNtha5/CdBlWoSFmd27HUUJIEvmuhuHuFDBIt/2PBSReJ423fn4RVUx1May3g+Bt4d68TBYCDvgEVrpqj3ICwWLoouhVRW+gS0Ot3ecUirTGzrw8ZMeY58esR3GWk0fUcSgflqhFcKdz5XCE/o/a75km1ttcom0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F12C21F00A3A;
	Tue,  8 Sep 2026 10:18:22 +0000 (UTC)
Message-ID: <114057e1-f35b-4ca4-ae8f-dd2fd66180b3@kernel.org>
Date: Tue, 8 Sep 2026 05:18:21 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: altera: move all SoCFPGA device trees from
 dts/intel
Content-Language: en-US
To: evon.chiam@altera.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <802bf0d27fbff9b1ddb6b9fc323a1a9f8f050f74.1788512748.git.evon.chiam@altera.com>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <802bf0d27fbff9b1ddb6b9fc323a1a9f8f050f74.1788512748.git.evon.chiam@altera.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/4/26 18:06, evon.chiam@altera.com wrote:
> From: "Chiam, Evon" <evon.chiam@altera.com>
> 
> The dts/intel/ directory contains two distinct families:
> - Altera SoCFPGA platforms (Stratix 10, Agilex, Agilex5, Agilex72,
>    Agilex7M, N5X)
> - Intel Keembay
> 
Nit: replace "device trees" in your commit header with either "support" 
or "files" . The "dts" in the header is already saying these are changes 
to device trees.

Also replace "from dts/intel" to "to dts/altera".

Dinh
