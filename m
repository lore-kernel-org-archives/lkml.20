Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793352290;
	b=XcmW9ZzhIXun8XXKNheOgJkiJ5bMVxUchJjGHlnw/GgIB45kzlU+4A+cP0GNUvILmkgO
	 6PXoku4k9SYEw83IotIHJXkhg2LysWctIYNcAn0T3dl4Iye6mCyZEESvswVVkXwYe1wX9
	 OvURtF5S07cvx4tbm9bouceojJIR1I9HogI0VLlSBjM+Qb4hSUJZx0RpC/i1X7BQxANOB
	 icjnPbt6LM0qIcQJrZvwLFWllIAL3DlDTUqggr4Afh9vqKXLBtnMeIqv31tbW9nS1zdJs
	 ryj/AsvgUOcapPE1QzO12uzSw7Pl8k8/t8MuLGivpSQlA9Tm1519A1nvVH7aUY2iilA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793352290;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=RapgeB9lnSOOHM+Q+Ek+TouLYSIIJBsaMcxUoOZ7Uqg=;
	b=XyF0kgFXxLX3R+l2XpkmG9hKvrMRkzqsqzVAdLwdmT40di4puAg13XULPWUj5NdKjfT4
	 JVIiC7xEsafBB1uRA4NHMqKVkh9Q3HlekhNRFaG4ohDlO82HHVzF7ZA1sq8UiAGDbCPEY
	 flMEvGPQHiQ4tURqiOzVJoVaFJs76TjXuyijVRt/82ZfppWiy2DyejHeJVFur18mG3O++
	 qxVYwU2UhaI89EGtQ/VFgCbys0BqADVqsTVXfpwtc0B8kCVLRm05Ci+bc9A0zpcQ0Q8ft
	 cuWNMy/26KWsh8q1XO87878/udzEFRN8RlwPr+k/YdVvb0KyJlyTAb9NGDcVkkiHKtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cs.unc.edu;
	spf=pass smtp.mailfrom=cs.unc.edu;
	dkim=pass header.d=cs.unc.edu header.i=@cs.unc.edu header.a=rsa-sha256 header.s=google header.b="M9/OslpQ";
	arc=none smtp.remote-ip=209.85.160.182
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3776606A324
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:24:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3776606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cs.unc.edu header.i=@cs.unc.edu header.a=rsa-sha256 header.s=google header.b=M9/OslpQ
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-5367cc15121so5772591cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 02:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cs.unc.edu; s=google; t=1793352289; x=1793957089; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RapgeB9lnSOOHM+Q+Ek+TouLYSIIJBsaMcxUoOZ7Uqg=;
        b=M9/OslpQ2iWiPNnVacSyrTONqsDdV7XepJ8yNTeTlisIJU+N2zQzmJDwLU+wgcleOL
         +mOvyk8VBDCv3PnlITOWQdW/xntxHpXYuRjJP67kmBzXAelwgXQeSTPyfaeeFnbiI/fT
         5e9r06ZahMJDOskNQcXsiMSQC6pL1vPom0YVK9MxrSMufJ5svO1s/uSrtOISek/AD2aD
         ijkv1JKsUH3+sVoM4Qs5SU0H9HSHgdTAh6xv8nmSBVyYZi68SRM8sftAZNqwkixIXIXa
         5jtjyEbaQ/fd9qLwI3uXl0MEZHyjlGB7n+Okp3AWNq9Lrl8JBrxY87ECN/KNp00nDdzL
         eueQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793352289; x=1793957089;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RapgeB9lnSOOHM+Q+Ek+TouLYSIIJBsaMcxUoOZ7Uqg=;
        b=CJQRCgtna0qcl3G1t7K8D0iDVCJyBRf56rpcnwEethO/IMEgmTAok8ppP23hU+RzAk
         VrI7eNotI3qh/hKq1JLD2jL040o6AtcjoKjbsd8/YDr8k0WHyBmF+d2uZAYUIW1XIz+S
         B2SlftpaI7WqDV5JLih+CtlW/S0IUXtACbv7l7Q2bEAFlnBjV5qeA7H7EeR/mDN+KgAV
         vXlbmIiGLqZn+XutvhGoZsEv1/xWKOcov873PqcCopT2qoOSz8Ky1Xv25yhK4yamymjn
         AdQxtiFns3tbyHO7o7TjFzmATubxkX8Ro8bn60A66fE/q+0D7YcGCwRxOdrUHdTOlkfp
         txmw==
X-Forwarded-Encrypted: i=1; AKwUvBzxgCsnMtamV/2Ax1Np6NQ7pDgX8V5zmLDV4Y3dgIpTBJvU5PeLHf/EupmSIpU6WgnRJfUOFLcUHu/0Li8=@vger.kernel.org
X-Gm-Message-State: AFq9FYI9IMvcTv+F5aBfw2fEWkQvwC7oFFKmM2yRUffnrE3o5RnugqK7
	10IWS54dPCPYtxZUbt9sik984lKhF73vBzFcfPNtNS+JiaNXpFnQnNASPxHmXBT7Ww==
X-Gm-Gg: AYBFou0N2JLR6o3irr7dSttbnyYQgE2/fHBCixTdMYqSAdhJxCipkTJd9CPt4fgYGhb
	GSkoAB1bu+D83oarYUSN2TwjjeguSXCnEfytpO0FC5OHXBaUrzmlF6nDaUUSYwkepEHvdB9adGK
	hJxDdrcLaIE9/EdIYyKyeMVrPOyZEeP1puUgQkJTUrBErANRkJxi0kI6psF8ei4vNn54hvyjPpt
	g8cnHXnkyJzniJbea3PXzFy7DgGNFYCRqXWlzcy1ZxhgvluLSVR4X4rlSSLXJmoq8BD336Pkk2L
	KoGkkgQZO7dt6yVQWVRd1lb48sgAzoUlWTEOCqRv9cK8avfkQxf3AQPwrMv3BLbknUlcJFGWXBd
	tWttmfRj/TTTZl7A/OSuYyubn2SoFjhgI9Dsoo4kC7nXGgtqpYHrnbPeJVwmEuF+vicJfJfXS8L
	17EqY3gCgHH0k75dlIhUhpiGJR3hAAAEkunsbh4PlFT19Xmvl5/tR7dfsTJ0kSbPrK6+LnShOEr
	eY57EN0Tnnlaa8paJtg2h+dO4/M+GN92+FECOY9MkXx+xN1pZE38T7/xl6KY5wtBwzGQdUWWl3a
	At5jN0gR5bwoTJiLDK7x6eTtA/MxihHKayexLcnTAGc2OjagLywc
X-Received: by 2002:a05:622a:1f12:b0:537:deab:afe0 with SMTP id d75a77b69052e-542b3e68d89mr22133521cf.10.1793352288578;
        Fri, 30 Oct 2026 02:24:48 -0700 (PDT)
Received: from cobra01.cs.unc.edu (cobra01.cs.unc.edu. [152.2.130.143])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-54311f775a2sm8848351cf.14.2026.10.30.02.24.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 02:24:48 -0700 (PDT)
From: Hengyu Liang <hengyul@cs.unc.edu>
To: tzimmermann@suse.de
Cc: x86@kernel.org,
	bp@alien8.de,
	mario.limonciello@amd.com,
	aaron.ma@canonical.com,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] x86/video: Preserve the default VGA fallback for legacy modes
Date: Fri, 30 Oct 2026 05:24:21 -0400
Message-ID: <20261030092422.300856-1-hengyul@cs.unc.edu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <4379fd92-ac4f-45c2-9f4a-eaabe4b7f981@suse.de>
References: <20261029162311.3389523-1-hengyul@cs.unc.edu> <4379fd92-ac4f-45c2-9f4a-eaabe4b7f981@suse.de>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Thomas,

On Fri, Oct 30, 2026 at 09:48:19AM +0100, Thomas Zimmermann wrote:
> Am 29.10.26 um 17:23 schrieb Hengyu Liang:
>> However, screen_info_resources() also returns legacy I/O and memory
>> ranges for VGA text modes. These ranges are not PCI BARs, so the resource
>> lookup fails and the default VGA fallback is skipped.
>
> If the BIOS booted in text mode or VGA graphics mode, the rsp device is
> still the primary display device. So the current matching code is not
> necessarily incorrect. (But also not necessarily correct either. :)

I agree that the device is still the primary display in text mode. The
patch gets that from the vga_default_device() fallback, since the legacy
ranges can't be matched against BARs.

>> diff --git a/arch/x86/video/video-common.c b/arch/x86/video/video-common.c
>> index 8ed82fff7638..b8f83346dfe8 100644
>> --- a/arch/x86/video/video-common.c
>> +++ b/arch/x86/video/video-common.c
>> @@ -45,7 +45,7 @@ bool video_is_primary_device(struct device *dev)
>>
>>  #ifdef CONFIG_SCREEN_INFO
>>  	numres = screen_info_resources(si, res, ARRAY_SIZE(res));
>> -	if (numres > 0) {
>> +	if (numres > 0 && __screen_info_has_lfb(screen_info_video_type(si))) {
>>  		for (i = 0; i < numres; ++i) {
>>  			if (!(res[i].flags & IORESOURCE_MEM))
>>  				continue;
>
> Further below in that code is a call to pci_find_resource(). [1]  Why
> does it match with vkms?  Vkms is not even on a PCI device.

It doesn't match vkms. As you say, vkms isn't a PCI device, so
video_is_primary_device() returns false for it at the dev_is_pci() check.

The problem is on the bochs side. In text mode, screen_info_resources()
returns the legacy VGA ranges, pci_find_resource() doesn't find them in
the BARs, and the function returns false there as well. So no device is
primary, and fbcon stays on the first registered framebuffer. In this
setup that is vkms (fb0), so the console is never remapped to bochs (fb1).

vkms only makes the console part visible. Without vkms, tty1 has the same
size with and without the patch, but boot_display is still missing without
it.

Thanks,
Hengyu
