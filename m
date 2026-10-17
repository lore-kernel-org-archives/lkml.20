Received: from mail.fhannenheim.net (mail.fhannenheim.net [188.245.251.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A063B19B9;
	Sat, 17 Oct 2026 18:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.245.251.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792260903; cv=none; b=ivQ9CjPL5nOFPD/yCbUDfVKnPSCGUYWUqByBV/ysQ1Et0LhvFs/9T/pe11ebys+NSCgYKzGn0K4T2PxRvQQ3uDN3kukbJ1zuU1WOqYGfrRFpIUrdMvQlRr1zCVP9Xv/+peGm6X9E+tfJE+AvlMq1TZDLLvmX/48Jy3eHLtHm/aE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792260903; c=relaxed/simple;
	bh=8rk9WFfhUH3H5MLKvBiEVg4lpYZXCbuYeHlpG+fXlAQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=mtKPoVxUEMSdBjLiun0KPJRr/cerivL/s+HoYXcYKxrLJ7BNz2GZ40GZGwIWg8DEktcH+DMxH3K5MrpfH3FvOz3ZDG13demkRQu+wV35DS2EqPXqU88owkDMZg4i4GjvdVanpSqIRyP2VvzNExXjkEubLi0sCBITDwZpfXnGTNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fhannenheim.net; spf=pass smtp.mailfrom=fhannenheim.net; dkim=pass (1024-bit key) header.d=fhannenheim.net header.i=@fhannenheim.net header.b=hsOQ5EH5; arc=none smtp.client-ip=188.245.251.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fhannenheim.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fhannenheim.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fhannenheim.net header.i=@fhannenheim.net header.b="hsOQ5EH5"
Message-ID: <a39ab904-261b-4b2a-b0d8-8d921deee61b@fhannenheim.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fhannenheim.net;
	s=mail; t=1792260893;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qzHaB0X+KV5t8edmPsMWxNUH83NXenQRQ+qPmcqrKt8=;
	b=hsOQ5EH5ho/hvKeCRtZ/gygr55+TjG96TvZKpEupinTwHo9Atkxj/hBHc/OyJ87OqI6gB0
	polo/Mux1cETAFzl+I3mt1ZyoqFV6K2zg5c7IX6Q1x/GArP6AH3YNCXa8zbTYERxv3SR4y
	eI6IwhHr9mYCZXQhMiXolbCawu1dvoU=
Date: Sat, 17 Oct 2026 20:14:50 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Frieder Hannenheim <git@fhannenheim.net>
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: oneplus-kebab: new device
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Oscilowski <drgitx@gmail.com>,
 =?UTF-8?Q?Jean-Fran=C3=A7ois_Bobier?= <jf.bobier@gmail.com>,
 phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261015-kebab_dts-v2-0-e783463bffd3@fhannenheim.net>
 <20261015-kebab_dts-v2-2-e783463bffd3@fhannenheim.net>
 <20261017-lively-trout-of-hail-8fbaed@quoll>
Content-Language: de-DE, en-US
In-Reply-To: <20261017-lively-trout-of-hail-8fbaed@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17.10.26 18:46, Krzysztof Kozlowski wrote:
> On Thu, Oct 15, 2026 at 02:32:37PM +0200, Frieder Hannenheim wrote:
>> Add initial device-tree for the OnePlus 8T. Downstream reference is [1].
>>
>> [1] https://github.com/LineageOS/android_kernel_oneplus_sm8250/blob/lineage-23.2/arch/arm64/boot/dts/vendor/oplus/kona-kebab-overlay.dts
>>
>> Signed-off-by: Frieder Hannenheim <git@fhannenheim.net>
>> Co-developed-by: Robert Oscilowski <drgitx@gmail.com>
>> Signed-off-by: Robert Oscilowski <drgitx@gmail.com>
> 
> Your SoB is the last. Please follow closely submitting patches document.
> 
> Please run scripts/checkpatch.pl on the patches and fix reported
> warnings. After that, run also 'scripts/checkpatch.pl --strict' on the
> patches and (probably) fix more warnings. Some warnings can be ignored,
> especially from --strict run, but the code here looks like it needs a
> fix. Feel free to get in touch if the warning is not clear.
> 
> Best regards,
> Krzysztof
Hi Krzysztof,

thanks for pointing this out. I will put my SoB last. I have run 
checkpatch (see the output below) and it has shown me no warnings that I 
deem actionable. (MAINTAINERS does not seem to contain other dt 
maintainers and wrapping the link would break it).

Kind regards,
Frieder

$ ./scripts/checkpatch.pl -g HEAD-3 --strict
> -------------------------------------------------------------------
> Commit 3b78f6c36076 ("dt-bindings: arm: qcom: Document OnePlus 8T")
> -------------------------------------------------------------------
> total: 0 errors, 0 warnings, 0 checks, 7 lines checked
> 
> Commit 3b78f6c36076 ("dt-bindings: arm: qcom: Document OnePlus 8T") has no obvious style problems and is ready for submission.
> ------------------------------------------------------------------------
> Commit 485091777ce8 ("arm64: dts: qcom: Add sm8250-oneplus-common.dtsi")
> ------------------------------------------------------------------------
> WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
> #18: 
> new file mode 100644
> 
> total: 0 errors, 1 warnings, 0 checks, 607 lines checked
> 
> NOTE: For some of the reported defects, checkpatch may be able to
>       mechanically convert to the typical style using --fix or --fix-inplace.
> 
> Commit 485091777ce8 ("arm64: dts: qcom: Add sm8250-oneplus-common.dtsi") has style problems, please review.
> -------------------------------------------------------------------
> Commit 72db2e5d2c06 ("arm64: dts: qcom: oneplus-kebab: new device")
> -------------------------------------------------------------------
> WARNING: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
> #8: 
> [1] https://github.com/LineageOS/android_kernel_oneplus_sm8250/blob/lineage-23.2/arch/arm64/boot/dts/vendor/oplus/kona-kebab-overlay.dts
> 
> WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
> #32: 
> new file mode 100644
> 
> total: 0 errors, 2 warnings, 0 checks, 137 lines checked
> 
> NOTE: For some of the reported defects, checkpatch may be able to
>       mechanically convert to the typical style using --fix or --fix-inplace.
> 
> Commit 72db2e5d2c06 ("arm64: dts: qcom: oneplus-kebab: new device") has style problems, please review.
> 
> NOTE: If any of the errors are false positives, please report
>       them to the maintainer, see CHECKPATCH in MAINTAINERS.

