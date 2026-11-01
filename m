Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=5.75.144.95
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793562273;
	b=eReD996CjNtitjzFtfyqB8evzDipmym5vY9CeS7nqTTYzJgjRO73VCp1XfM4FS3Sv0v+
	 afsfYN+0CNeakvime+mKCN4iwVn+yG6Fj2tHNnTEw0uyynMtrFDmA3WsMNZdy6e93v17m
	 yq+mqHNHafy/7XYOPMcufuq9oaJ59rYg5X11wfhJLUatq7LSybNQsAhmQrfLAj7vBKMnH
	 rw/crURQkKSpCZkZHPcZAm+w+I8+ggGQOUiG2OVMCLpNcqw+jGLE5IPVUFjKBPRnUGZeA
	 C8D36ptKQSzmUW0rrzHY9TZmRe9ypasc52fTlZiOeeqUlXAzIV3ET+we3EBwCEZq3QA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793562273;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:MIME-Version:Date:From:To:
	 Cc:Subject:In-Reply-To:References:Message-ID:X-Sender:Content-Type:
	 Content-Transfer-Encoding;
	bh=vZQyTpU9Icu2HSISAcfZwpsG6IToGvLeX9PW7kPGqag=;
	b=VpmtoWiMn4AIH/wJa6pYysDxOcLgnEyT0DUv856/DRa4DJbcgMEnugPUoxTbcWKPbMdt
	 4/XNvDORVbyKj//QCqL3qkQSVuwfga14yEDO4EyOgyygu1UUPCkSUuFtZhmAB8ZUBeJhU
	 leHA+mI6MfoYN27sg4wkuyQGCpW71XYR4ugIlJZ4v1JB1d/BM62sr+vMLmQRhpJZI9gni
	 qAEpXxEEUbCOhE15hi5xlECZOToY5MOZ05/t4RyO4iqKBVtoFK04AY1j2OBF0U0G032eN
	 tefo2M0eA5JbhgD4z/1wfIKWm2w6sWxkm4x+IrVGsXMbiI9yn/7OQ9xrCxPOJqSIOGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mainlining.org;
	spf=pass smtp.mailfrom=mainlining.org;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b=MneB7DBc;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b=U442302s;
	arc=none smtp.remote-ip=5.75.144.95
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2822E606A324;
	Sun,  1 Nov 2026 19:44:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2822E606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b=MneB7DBc;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b=U442302s
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1793562269; bh=vZQyTpU9Icu2HSISAcfZwps
	G6IToGvLeX9PW7kPGqag=; b=MneB7DBcjOrpLrDeCLkagxtkg0LXEDxeuUwUz23SkC0O2bsCY6
	3lNucIelaIZLJWGhd7h7uPVMZiV0A6u4p1E4CeXMka0USUVeY1v0b3sBlJTQoYfXF9PszdcFHCV
	s9Qv+/O/5ekctZ4DcAbdFxN+fsI3grc5jEuylEW+wF021q+A0zdQ8DcxxHYq1e6inAlrVJ6dWJ6
	ZvdrppkJPu8YDmql2LeaErGKar8LxilxQxmFZHzFT3+ihSZD5icplZynm/OLS5d6eShxAqxcIUp
	dgioMaHRfGydF1Qs7CGTYCXADZnwzHW+R2iqiVeBxrHA7GF82qOBWId96KYFNLrzgxw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1793562269; bh=vZQyTpU9Icu2HSISAcfZwps
	G6IToGvLeX9PW7kPGqag=; b=U442302spwE5+eArYoQIsrdcxkr36Dtfm+ZVoG+QSXt9wedX1A
	jZY7rMGTwtbUmTEKXaV9mvXpXnDb57Z9kOAg==;
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Sun, 01 Nov 2026 20:44:29 +0100
From: =?UTF-8?Q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?=
 <barnabas.czeman@mainlining.org>
To: Amir Hanip <killdeath104@gmail.com>
Cc: abelvesa@kernel.org, andersson@kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, konradybcio@kernel.org, krzk+dt@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 robh@kernel.org, a39skl@gmail.com
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: Add Xiaomi Poco M3
In-Reply-To: <20261101164930.17976-1-killdeath104@gmail.com>
References: <239d46726c0aad84feccc3def4eafab2@mainlining.org>
 <20261101164930.17976-1-killdeath104@gmail.com>
Message-ID: <9304e75396496855881251cac2edb0a5@mainlining.org>
X-Sender: barnabas.czeman@mainlining.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2026-11-01 17:49, Amir Hanip wrote:
> On Fri, 30 Oct 2026 13:30:28 +0100, Barnabas Czeman wrote:
>> Poco M3 (citrus) is same HW like Redmi 9T (lime) and Remi 9T NFC
>> (lemon) basically is a lime with NFC.
>> So i think it would be better make a common base from lemon's
>> devicetree instead of making the same devicetree again for the
>> different variants where only the compatible and the model property
>> will be the difference.
>> Check sm6115-xiaomi-gingkgo-common for example, it was the same case
>> for Redmi Note 8 (ginkgo) and 8T (willow).
> 
> Hi Barnabas, Adam,
> 
> Thanks for the review, that makes sense. I am preparing a v3 that
> moves the shared parts of lemon into sm6115-xiaomi-lime-common.dtsi
> and has both lemon and citrus include it. I used the name lime-common
> following your naming. Happy to rename it.
> 
> Plan for v3:
> 1. dt-bindings (unchanged)
> 2. lemon: move the shared nodes into the common dtsi, no functional
>    change intended
> 3. citrus on top of the common dtsi
> 
> I can only test citrus. I do not own a Redmi 9T, so lemon is untested
> on hardware. Instead, I compared the lemon DTS before and after the
> split, normalized with dtc (dtc -I dts -O dts -s). The only
> difference is the numbering of two auto-generated phandles. I will
> describe the check in the cover letter. Adam,
> would you be able to test lemon once v3 is posted, or look at the
> split beforehand?
> 
> The IPA carve-outs (pil_ipa_fw_mem and pil_ipa_gsi_mem) are identical
> on both, so they now live in the common dtsi.
> 
> I kept the following per variant because I cannot tell whether they
> are real hardware differences or just differences between the stock
> firmware images:
> 
> - ADSP carve-out: 0x53800000/0x2200000 on citrus, 0x53400000/0x2600000
>   on lemon. Both regions end at 0x55a00000, so only the start and
>   size differ. I can only confirm that the citrus value works on my
>   device.
If there are no overlaps the bigger range could work for both of them.
> - GPU carve-out: 0x55a15000 on citrus (right after pil_ipa_gsi_mem,
>   like the SoC dtsi defaults), 0xfa400000 on lemon. The citrus value
>   works: the GPU runs with a full DT that includes the display
>   pipeline, which is not part of this series. I cannot verify
>   lemon's value. Adam, is 0xfa400000 intentional?
> - PM6125 regulators: seven have different voltage ranges (s7, l5,
>   l7, l11, l17, l18, l22). l24 has the same range, but only citrus
>   sets regulator-allow-set-load. lemon also marks l5, l7 and l22 as
>   always-on, citrus does not.
You should check where the regulators are used, at downstream many times
driver bindings are overriding the ranges. You should check properties
like these:
		-min-voltage = <1800000 0>;
		-max-voltage = <1800000 0>;
		-load-current = <180000 0>;
For the always-on it could be a bad habit from downstream
where they are not leave to the driver to set the regulator on/off,
keeping always-on properties not always necessary with the upstream 
drivers.

> - citrus deletes cdsp_sec_mem and the orientation-switch property of
>   usb_qmpphy, lemon does not.
I think it could be just left over from the reference design since
these devices are not supporting DP.
> 
> Barnabas, Adam: do you know whether these differences are real, or
> whether they only come from the firmware of each model?
> 
> Thanks,
> Amir
