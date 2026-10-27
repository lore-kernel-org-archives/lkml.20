Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793096313;
	b=W/Z1wIwefDYzL2tlgt2xxj20GnC8AH/+MABmjZ27AEXPVRYYMnc2A5Ndw2no9Joq6t3N
	 d95pUKzpfiHEof1SibrvoPGZOi6xyd34v3ezNTvGb7PulM2Ip/nbjpd0bfeFWau0GOI2g
	 QmoS9oFy3UxLDeARO58Ux1elG5JRH+SK3YerisciBlSDfqWsQVX2AueZF5oj4sNedmRqP
	 Zq5TkJCx4ZxlJRWx7XRhnv3qc45fazq6kl5tlWkVqsRLOv2ODjfYu76xoCPsTz8VYCVa0
	 wlLBxrN8K7uY56f/ZF2tee+B4FisMM0LcRlMfcW8YD5F92UvDzN7z2hT+QNO8I1+Kzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793096313;
	h=DMARC-Filter:DKIM-Signature:X-Pm-Submission-Id:From:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Content-Type;
	bh=SC1BsGXyB6CzybWZf1MnM1dhxpFm3P6mATHYwTP3CFU=;
	b=KPU74eo29k0L4q312Hx9X6sB32I7/Lt/NrwQL3+cGTrsaHMqmbbX0cccVREpbU+5JG6f
	 WLQ2lHC6/VmAkFOEIkfudp7/o1XuuShOrvH+mZsbKLxqgOTTFQj/cpX5PDsUgRCgJl21T
	 g6rtiZlq7qUiO+ojXicgYl0BxoqPc6izSvzj13Ru67liG5gbOF8GF/jZfqfF42FJebZTf
	 G/r0Cz4MQQ+1r+7mRxRRu1G8DmPweoLhaQnIrAhsXuuNSxJogzVzldj+e7oNVInA7tJTN
	 hSpibKqEJHxtUYOTS8Y8z6MIFG1k+WV2J8BU+1UGAOdyjSngxaJKF0xncMtcowYJanQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=geanix.com;
	spf=pass smtp.mailfrom=geanix.com;
	dkim=pass header.d=geanix.com header.i=@geanix.com header.a=rsa-sha256 header.s=protonmail header.b=Bhx+Es3h;
	arc=none smtp.remote-ip=109.224.244.108
Received: from mail-244108.protonmail.ch (mail-244108.protonmail.ch [109.224.244.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3DFC606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 10:18:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3DFC606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=geanix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=geanix.com header.i=@geanix.com header.a=rsa-sha256 header.s=protonmail header.b=Bhx+Es3h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail; t=1793096309; x=1793355509;
	bh=SC1BsGXyB6CzybWZf1MnM1dhxpFm3P6mATHYwTP3CFU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=Bhx+Es3hhN7lDEmYmva6k8/HHO59r77Xy4tNTZCU7FgqkL6ux34D11fZcaZ+YKyms
	 irRN9iaUzTM45GXmzd5rY3ftUHRpGCM0ZaouV9RGV1n87wxUI5Nm0j0JEl373UgVLv
	 NOqW2bIcHs1YYfstogSjqxhXtmaAoD9ijiIQvyEhr60woYCTNOuykIKkjCiqMHo1Az
	 OFb7EQIiTqRlmR07eUEVourplHBNKJqeFKTzMNEQIy0jtMK+U6q+S3o0oQg/UESs2r
	 AG0TzAJvPq5ob1Ve0K3HDmizR2Lswewf/PTHg2Ovg6sNYdjxP00l0dQ3pxyGYV7YGn
	 aVYpi6bskS1sw==
X-Pm-Submission-Id: 4jDRKF0pKhz1DF7H
From: Esben Haabendal <esben@geanix.com>
To: "Liu Ying" <victor.liu@nxp.com>
Cc: "Andrzej Hajda" <andrzej.hajda@intel.com>,  "Neil Armstrong"
 <neil.armstrong@linaro.org>,  "Robert Foss" <rfoss@kernel.org>,  "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>,  "Jonas Karlman"
 <jonas@kwiboo.se>,  "Jernej Skrabec" <jernej.skrabec@gmail.com>,  "Luca
 Ceresoli" <luca.ceresoli@bootlin.com>,  "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>,  "Maxime Ripard"
 <mripard@kernel.org>,  "Thomas Zimmermann" <tzimmermann@suse.de>,  "David
 Airlie" <airlied@gmail.com>,  "Simona Vetter" <simona@ffwll.ch>,  Guido
 =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>,  "Fabio Estevam"
 <festevam@gmail.com>,  "Robert
 Chiras" <robert.chiras@nxp.com>,  "Sam Ravnborg" <sam@ravnborg.org>,
  <dri-devel@lists.freedesktop.org>,  <linux-kernel@vger.kernel.org>,
  "Oliver F. Brown" <oliver.brown@oss.nxp.com>
Subject: Re: [PATCH RESEND v4 4/4] drm/bridge: nwl-dsi: Correct MIPI DSI
 horizontal sync timing
In-Reply-To: <atH4i_KcmccKb8Ge@raspi>
References: <20261014-nwl-dsi-fixes-v4-0-b9138ea5e12c@geanix.com>
	<20261014-nwl-dsi-fixes-v4-4-b9138ea5e12c@geanix.com>
	<JYYZZ_8h4tOKBjhbfQG_VuFESQDdQRt7TE7Ef0eJ9F0gQgyRrEJ5LIi6scY_48ggvsikFa5QZB3uEHaRUDdosQ==@protonmail.internalid>
	<atH4i_KcmccKb8Ge@raspi>
Date: Tue, 27 Oct 2026 11:18:24 +0100
Message-ID: <87qzhbbg5r.fsf@geanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

Sorry for the premature send of the previous reply.


"Liu Ying" <victor.liu@nxp.com> writes:

>>
>> diff --git a/drivers/gpu/drm/bridge/nwl-dsi.c b/drivers/gpu/drm/bridge/nwl-dsi.c
>> index f3f4334136c0..eb604733eea0 100644
>> --- a/drivers/gpu/drm/bridge/nwl-dsi.c
>> +++ b/drivers/gpu/drm/bridge/nwl-dsi.c
>> @@ -22,6 +22,7 @@
>>  #include <linux/reset.h>
>>  #include <linux/sys_soc.h>
>>  #include <linux/time64.h>
>> +#include <linux/math64.h>
>
> Sort the header files alphabetically.

Will do.

>> +	hfp = roundup(hfp, 2);
>> +	hbp = roundup(hbp, 2);
>> +	hsa = roundup(hsa, 2);
>> +
>> +	/*
>> +	 * We need to subtract the packet header length: 32
>> +	 * In order to make sure we don't get negative values,
>> +	 * subtract a proportional value to the total length of the
>> +	 * horizontal blanking duration.
>> +	 */
>> +	h_blank = hfp + hbp + hsa;
>> +
>> +	if (h_blank) {
>> +		pkt_len = min(hfp, roundup(((hfp * 100 / h_blank) * 32) / 100, 2));
>> +		pkt_hdr_len = pkt_len;
>> +		hfp -= pkt_len;
>> +
>> +		pkt_len = min(hbp, roundup(((hbp * 100 / h_blank) * 32) / 100, 2));
>> +		pkt_hdr_len += pkt_len;
>> +		hbp -= pkt_len;
>> +
>> +		pkt_len = min(hsa, 32 - pkt_hdr_len);
>> +		pkt_hdr_len += pkt_len;
>> +		hsa -= pkt_len;
>> +		if (pkt_hdr_len != 32)
>> +			dev_warn(dsi->dev,
>> +				 "Unable to subtract packet header length fully: %d left\n",
>> +				 32 - pkt_hdr_len);
>> +	}
>> +
>> +	DRM_DEV_DEBUG_DRIVER(dsi->dev, "Register values: hfp=%d hbp=%d hsa=%d\n", hfp, hbp, hsa);
>> +
>> +	nwl_dsi_write(dsi, NWL_DSI_HFP, hfp);
>> +	nwl_dsi_write(dsi, NWL_DSI_HBP, hbp);
>> +	nwl_dsi_write(dsi, NWL_DSI_HSA, hsa);
>>
>>  	nwl_dsi_write(dsi, NWL_DSI_ENABLE_MULT_PKTS, 0x0);
>>  	nwl_dsi_write(dsi, NWL_DSI_BLLP_MODE, 0x1);
>>
>> --
>> 2.56.0
>>
>
> Not sure if the fix is 100% correct, but it is a correct direction to
> change the blanking packet payload size from in pixel clocks to in bytes,
> so better than no fix:
> Acked-by: Liu Ying <victor.liu@nxp.com>

Thanks. With the information available to me, this is the best I can do.

/Esben
