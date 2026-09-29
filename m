Received: from mailrelay-egress15.pub.mailoutpod3-cph3.one.com (mailrelay-egress15.pub.mailoutpod3-cph3.one.com [46.30.212.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 397BE4E780C
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 21:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.30.212.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790717847; cv=none; b=XhsVwHBC+2sMp+1i+VGEbZ1uIUGyackTXMCTY6U09vKoZY3XVXpiDRieQLOBYBdoGFP2yu2mzWa+wzXveY9ETehltMZ+SgtPbPEECMd/V9HZjTkBSzMx0Hr3iYeNXWPJrILPD9JUESydqxWJlRbt2aDrpGwPY/9xMQM4IWUuWWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790717847; c=relaxed/simple;
	bh=FWvf5mKExUXW4t1zSIEm0xSZHVU8CRXMPVsW4x3v47g=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To; b=eFF4lSQ/LPdKoUJjozKWkZDATdEhPMLGjuQA/hDY6wfiKp9hNkdGxgKkLwDNCFyvwmHf3mTugqCZiJz/Z0jGZvegOYjyfdHRiacHHQFutdX89eg9KFjbrO+z42rkHIZ0wy8HsCHWnjo8aN1ij5E+gW1j4Iqbl7CfOYWtl0V0yBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=androscientia.com; spf=none smtp.mailfrom=androscientia.com; dkim=pass (2048-bit key) header.d=androscientia.com header.i=@androscientia.com header.b=U65NBXs5; dkim=permerror (0-bit key) header.d=androscientia.com header.i=@androscientia.com header.b=zM/9YVnb; arc=none smtp.client-ip=46.30.212.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=androscientia.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=androscientia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=androscientia.com header.i=@androscientia.com header.b="U65NBXs5";
	dkim=permerror (0-bit key) header.d=androscientia.com header.i=@androscientia.com header.b="zM/9YVnb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1790717771; x=1791322571;
	d=androscientia.com; s=rsa1;
	h=in-reply-to:from:references:cc:to:subject:mime-version:date:message-id:
	 content-type:from;
	bh=FWvf5mKExUXW4t1zSIEm0xSZHVU8CRXMPVsW4x3v47g=;
	b=U65NBXs5PPO+fPSLYL17gCncqDhKW5J7ZvIFIz75pTryGeFS1tSWcA5NHxeCN3pM6kqMMhHaVk1ke
	 z1EBH2ovaEZ/g/JHo9JyECoTe71MB15Ulhd6HRmXoYcuJ8HY7YRJynLrHA6D+uf2lc8W1Dpi5aXNiz
	 L5bTjaNk9epTeZiGLrPoUeZPqKcH1j90XBLg/s6huZaEpHMSSXmWmBqf7EkvtJIhHua/jRskf6ZAiD
	 cFBOHRC/YZ0KRwE5sKD7IgftMRdpHGqkvCPmOV76gY2Ec7ikh7JZhkrMumOQH4HIoqkLqReeIjwynv
	 H8U76Oq37yVkqVf6Oh3+KzFngYStZgA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1790717771; x=1791322571;
	d=androscientia.com; s=ed1;
	h=in-reply-to:from:references:cc:to:subject:mime-version:date:message-id:
	 content-type:from;
	bh=FWvf5mKExUXW4t1zSIEm0xSZHVU8CRXMPVsW4x3v47g=;
	b=zM/9YVnbkqd4g9iracjZRObuPxlZ+ZswoYAVGiv/h5sAR94X2OMF22bjf7qO/v2i6kEamGd6DZvJ4
	 uRHp4tJCg==
X-HalOne-ID: c9dbf97d-bc4d-11f1-814f-1b46ed53ce32
Received: from [IPV6:2001:2044:db:f800:8ce2:8d8a:61f:76ef] (unknown [2001:2044:db:f800:8ce2:8d8a:61f:76ef])
	by mailrelay4.pub.mailoutpod2-cph3.one.com (Halon) with ESMTPSA
	id c9dbf97d-bc4d-11f1-814f-1b46ed53ce32;
	Tue, 29 Sep 2026 21:36:11 +0000 (UTC)
Content-Type: multipart/mixed; boundary="------------Ol9gdBx0akhCWiFRzfNcIc2G"
Message-ID: <d99d01e0-8ae5-4555-88cf-d7eb9afca692@androscientia.com>
Date: Tue, 29 Sep 2026 23:36:11 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: tas2781: Do not report cross-instance writes as
 errors on SPI
To: Mark Brown <broonie@kernel.org>
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <f39f2aa8-33f3-4cb6-b2ed-56254ad63f3c@androscientia.com>
 <aiqrzlIGi0ClnygD@sirena.co.uk>
Content-Language: en-US
From: Andreas Axelsson <andreas.axelsson@androscientia.com>
In-Reply-To: <aiqrzlIGi0ClnygD@sirena.co.uk>

This is a multi-part message in MIME format.
--------------Ol9gdBx0akhCWiFRzfNcIc2G
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Attached is the updated patch.

Best regards,

Andreas

On 11/06/2026 2.36 pm, Mark Brown wrote:
> On Thu, Jun 11, 2026 at 10:20:18AM +0200, Andreas Axelsson wrote:
>> On SPI-based TAS2781 HDA systems (e.g. HP laptops with two amplifiers
>> on separate SPI chip selects), each tasdevice_priv instance services a
>> single device. The SPI bus glue intentionally returns -EXDEV for
>> register access addressed to a channel the instance does not own, and
>> logs it at debug level as "Not error" (see
>> tasdevice_spi_change_chn_book()).
> This doesn't apply against current code, please check and resend.
--------------Ol9gdBx0akhCWiFRzfNcIc2G
Content-Type: text/x-patch; charset=UTF-8;
 name="v2-0001-ASoC-tas2781-Skip-calibration-data-for-other-SPI-devices.patch"
Content-Disposition: attachment;
 filename*0="v2-0001-ASoC-tas2781-Skip-calibration-data-for-other-SPI-dev";
 filename*1="ices.patch"
Content-Transfer-Encoding: base64

RnJvbTogQW5kcmVhcyBBeGVsc3NvbiA8YW5kcmVhcy5heGVsc3NvbkBhbmRyb3NjaWVudGlh
LmNvbT4KU3ViamVjdDogW1BBVENIIHYyXSBBU29DOiB0YXMyNzgxOiBTa2lwIGNhbGlicmF0
aW9uIGRhdGEgZm9yIG90aGVyIFNQSSBkZXZpY2VzCgpPbiBTUEktYmFzZWQgVEFTMjc4MSBI
REEgc3lzdGVtcyAoZS5nLiBIUCBsYXB0b3BzIHdpdGggdHdvIGFtcGxpZmllcnMKb24gc2Vw
YXJhdGUgU1BJIGNoaXAgc2VsZWN0cyksIGVhY2ggdGFzZGV2aWNlX3ByaXYgaW5zdGFuY2Ug
c2VydmljZXMgYQpzaW5nbGUgZGV2aWNlLCBhbmQgdGhlIFNQSSBidXMgZ2x1ZSByZXR1cm5z
IC1FWERFViBmb3IgcmVnaXN0ZXIgYWNjZXNzCmFkZHJlc3NlZCB0byBhIGNoYW5uZWwgdGhl
IGluc3RhbmNlIGRvZXMgbm90IG93biAoc2VlCnRhc2RldmljZV9zcGlfY2hhbmdlX2Nobl9i
b29rKCkpLgoKQ29tbWl0IDUxMzQ4MGRhNWU5YyAoIkFMU0E6IGhkYS90YXMyNzgxOiBGaXgg
ZGV2aWNlLTAgcmVzZXQgaXNzdWUgYW5kCmhhbmRsZSAtRVhERVYgaW4gYmxvY2sgZGF0YSBw
cm9jZXNzaW5nIikgdGF1Z2h0CnRhc2RldmljZV9wcm9jZXNzX2Jsb2NrKCkgdG8gaWdub3Jl
IC1FWERFViBvbiBTUEksIGJ1dAp0YXNkZXZfbG9hZF9jYWxpYnJhdGVkX2RhdGEoKSBzdGls
bCB0cmllcyB0byB3cml0ZSBjYWxpYnJhdGlvbiBkYXRhCmZvciBldmVyeSBjaGFubmVsLiBP
biBlYWNoIGluc3RhbmNlIHRoZSB3cml0ZSBmb3IgdGhlIG90aGVyIGFtcGxpZmllcgpmYWls
cyBhbmQgaXMgbG9nZ2VkIGFzIGFuIGVycm9yIG9uIGV2ZXJ5IGJvb3QsIHJlc3VtZSBhbmQg
cHJvZmlsZQpzd2l0Y2g6CgogIHRhczI3ODEtaGRhIHNwaTEtVFhOVzI3ODE6MDAtdGFzMjc4
MS1oZGEuMTogY2huIDAgcjBfcmVnIGJ1bGtfd3IgZXJyID0gLTE4CgpUaGUgb3duaW5nIGlu
c3RhbmNlIGxvYWRzIHRoYXQgY2hhbm5lbCdzIGNhbGlicmF0aW9uIGRhdGEgaXRzZWxmLCBz
bwpza2lwIGNoYW5uZWxzIG90aGVyIHRoYW4gcHJpdi0+aW5kZXggb24gU1BJLgoKVGVzdGVk
IG9uIGFuIEhQIFpCb29rIEZ1cnkgRzFpIChzdWJzeXN0ZW0gMTAzQzo4REU4KSB3aXRoIHR3
byBUQVMyNzgxCmFtcHMgb24gU1BJLgoKRml4ZXM6IDlmYTZhNjkzYWQ4ZCAoIkFMU0E6IGhk
YS90YXMyNzgxOiBSZW1vdmUgdGFzMjc4MV9zcGlfZndsaWIuYyBhbmQgbGV2ZXJhZ2UgU05E
X1NPQ19UQVMyNzgxX0ZNV0xJQiIpClNpZ25lZC1vZmYtYnk6IEFuZHJlYXMgQXhlbHNzb24g
PGFuZHJlYXMuYXhlbHNzb25AYW5kcm9zY2llbnRpYS5jb20+Ci0tLQp2MjoKLSBSZWJhc2Vk
IG9uIGN1cnJlbnQgY29kZS4gVGhlIHRhc2RldmljZV9wcm9jZXNzX2Jsb2NrKCkgcGFydCBv
ZiB2MQogIGlzIHN1cGVyc2VkZWQgYnkgY29tbWl0IDUxMzQ4MGRhNWU5Yzsgb25seSB0aGUg
Y2FsaWJyYXRpb24gcGFydAogIHJlbWFpbnMuCgotLS0gYS9zb3VuZC9zb2MvY29kZWNzL3Rh
czI3ODEtZm13bGliLmMKKysrIGIvc291bmQvc29jL2NvZGVjcy90YXMyNzgxLWZtd2xpYi5j
CkBAIC0yNjMxLDYgKzI2MzEsMTAgQEAKIAlpZiAoIWRhdGEgfHwgIWNhbGlfZGF0YS0+dG90
YWxfc3opCiAJCXJldHVybjsKIAorCS8qIE9uIFNQSSBlYWNoIGluc3RhbmNlIG93bnMgYSBz
aW5nbGUgZGV2aWNlOyBza2lwIHRoZSBvdGhlcnMuICovCisJaWYgKHByaXYtPmlzc3BpICYm
IGkgIT0gcHJpdi0+aW5kZXgpCisJCXJldHVybjsKKwogCWlmIChkYXRhW2tdICE9IGkpIHsK
IAkJZGV2X2Vycihwcml2LT5kZXYsICIlczogbm8gY2FsLWRhdGEgZm9yIGRldiAlZCBmcm9t
IHVzci1zcGNcbiIsCiAJCQlfX2Z1bmNfXywgaSk7Cg==

--------------Ol9gdBx0akhCWiFRzfNcIc2G--
