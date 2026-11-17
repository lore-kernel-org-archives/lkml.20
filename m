Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794922320;
	b=EtOJ0foGXTEG6xrpyQNy/s69kEMVjq6EhEgfOhgjK7trCFafheQFWiN9ICyy2jY24uxB
	 hZjr5fTOxKVYd3cv+G4a48AlK0/H00pxemBLxzcpzld7EG0j8jX1A2bcATXV1/ccN0i+l
	 geKuYYQBRRFipOpu7ykp2c/6/qgTiWnf5oWiPKsOeSaGr/eXfuWZVSdoXNAoRi6bvSA9M
	 jStSmHFCqUe99+0PHwFc5vn1MZDnaBYm/Mu2IvMqotrwnX/5aO28jD3Cfxh6u3IDotZyw
	 pxmydlHo/jORMw6VSol1W9MReb1Z101V5MxGbug6E51df0MFicuEJyyYyKg0qCga+OA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794922320;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=ZD6TBLmK/IIZSnjK7MAJYBAkHQUcSU3Vb9rupdsZ2as=;
	b=r+wMOpGNi7gU6v5AqcJl2JQyVYObgCVqs2wX8a50apxaXKf2oeNp/rCCD99oHh8aj4gI
	 LYbYvcirmImy3gkR584FYIrK1ZgyUE1j/UX5kmxhFVR2rpb32BkJ6YWrSbrchF3DatmVL
	 aLZPs15y5NTJemAvQtcagEnTpSK7Szg9ndKH9F60McanstZZTQvvlXOmtoV7KRjxt0uRT
	 bVHQGcCS8HSK0rtejXwwQpFahhQcoUw8CLx2lR61GcOmQ8natKJdm+Rxy+y00awRz5Ay7
	 4L7fD+TvKm3uscVqupmlIRJRBQVBPg2UJG7LVdVnyzvWiYvVWdDh7cg0pPY+kJs8Mrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=PlRC5AOQ;
	arc=none smtp.remote-ip=209.85.216.100
Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C55606A323
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:31:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90C55606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=PlRC5AOQ
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-3ae6b4c669fso638289a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 05:31:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794922319; x=1795527119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZD6TBLmK/IIZSnjK7MAJYBAkHQUcSU3Vb9rupdsZ2as=;
        b=21c37016gi9SqvN9r7tyXu0s6WFjI6zJ8imNkUJPlmBNcFdM8t9Dl0kx1+17uDJY+T
         b9EoHS+PPyOt8XdK77INMxj8PofXuNTXvaTo6fQeO9mxtvwDvuOknBI2PumtfK37/ULH
         CHawY0v1sAE3/TB4/ufvIxpvuBzVexI10hyjLrQvXFiW3Tsb+b6YzOR+pCDJlHsVsZas
         S9CiLMHNuIsjMz8fM9c/Dd2A9pSCqBaBdd7dj/2cntk4hk2ls4kXJfpc5BswLNlGF+oL
         uVTWhXRtcB0txdizK4lbNXqCjOGCV425oDwLCODeV8uD2mCR2IziuT60/aEW+5IPNap/
         xp/g==
X-Forwarded-Encrypted: i=1; AL+hErG7w28YspK36ALFLkLYUMOhuE7IYOmLdqmVuu+bZJ8zUuZ1/8IZx52kbFsvCkA3V0CfnCwHwvIFWjGsabw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+/XmsoaH/ZyVIzjN6j5Gh7XypmWrOtb5yr1CCwtQWtysueSrzW
	H/EHWCkrsAU6zdyAapdFYxkKhBUJJDO+JAo+0SY9hyGXkCg/x9+1T/BclHd3oKdYNx0bR9y8dY7
	IDfPqLLJAjzbMS4MtRH9uM4SVq2VePYUEuDDH3P6sWaa9GyM6SKnM12/QHTEkqz7v1YzF2CLs/O
	Mj7SlYOB/hLfYuf9VHXtMZkhmJs6qv5C0SLCkdhou+wMGl1lcANaZFedr1XaSKP6DHdz1JE3b9d
	9VV+eWY3Lfm3aaPHdX+Zq0KFQ==
X-Gm-Gg: AZFdTZct6jg2/3rhaF/hwUhfu6wllERRmcWAN1MJ72DpLCAurlm7ffLt9alA1wUqFvi
	0vQNDShdg1p/NjTZnNwkh6Bhw4SgtFEhJD2lmx8u8150pn14igfrwh/SkEXExMu3fKzKDYW7Ad7
	LdaCUweTqy+sDIFHK/Ijp2yxoWhFsA4Q7OG1Bc4DiddTwmmkWoCvADOdKZgS39IXpA916MnBV0U
	847J1V3YCE4GTupRIyeAHlaEKc0a/3KBrKRu1puOpaAZqh+sO3SKmbzxm4SPA4MLZiQCowpXakT
	gnlJP8OH3d0glALNPlM3AuifOJLqAFHDTXbsvMLGAGg1tC/MhXSBsvr6dW7ZvAbIRd1X7Q6BYRn
	YGCia1jRm6XMTW7jpH+2R2E+VUoD9Mnk2u+XLFp3L0p1lbQiKUFYublF3Fsh1b0uHbaNd4EiyKJ
	elc/EZVQqgnvB4Na0v7eAUh6Tz2GDp/ib207OpHGI=
X-Received: by 2002:a17:90b:3b4a:b0:3b0:9409:6969 with SMTP id 98e67ed59e1d1-3b3abb5c83dmr1768654a91.19.1794922318960;
        Tue, 17 Nov 2026 05:31:58 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b3c92ee62csm180435a91.8.2026.11.17.05.31.58
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Nov 2026 05:31:58 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f5844cb60so184763985a.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 05:31:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794922317; x=1795527117; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZD6TBLmK/IIZSnjK7MAJYBAkHQUcSU3Vb9rupdsZ2as=;
        b=PlRC5AOQNvEEaNBPtfiIa4RVRyTwv7qbsHSPRupzU3gKwwSE7zLAeWYy/asMaw/bEL
         LL7kpo+CJw1xgBJE2GOrK639lT56hdsBFX4ENLjGNz0qumDJOA4N4uhbK8ihzZHeMo5g
         LbALfNvQEBLTNy3yGDDjcthShA/LT2npqM6wo=
X-Forwarded-Encrypted: i=1; AL+hErFOXRofLhSy688SAHY/UZ2DunDxUcYYUy9ovx/SE2H0hH8olrWRWcm2AcsqFIUT7W4vDIU7ClIZ8H6b2U4=@vger.kernel.org
X-Received: by 2002:a05:620a:17ab:b0:93e:c853:fc07 with SMTP id af79cd13be357-9498b826e55mr385556885a.32.1794922317142;
        Tue, 17 Nov 2026 05:31:57 -0800 (PST)
X-Received: by 2002:a05:620a:17ab:b0:93e:c853:fc07 with SMTP id af79cd13be357-9498b826e55mr385552685a.32.1794922316505;
        Tue, 17 Nov 2026 05:31:56 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c8fd141sm1094292085a.43.2026.11.17.05.31.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 05:31:54 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Mariia Nikitash <nikitash.mariiaw@gmail.com>
Cc: arend.vanspriel@broadcom.com,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	morbo@google.com,
	kees@kernel.org,
	justinstitt@google.com,
	codemender-patching+linux@google.com
Subject: Re: [PATCH] wifi: brcmfmac: Replace strlcat() with snprintf() in brcmf_fw_alloc_request()
Date: Tue, 17 Nov 2026 14:31:50 +0100
Message-ID: <20261117133150.817227-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261014005553.71803-1-nikitash.mariiaw@gmail.com>
References: <20261014005553.71803-1-nikitash.mariiaw@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Tue, 13 Oct 2026 17:55:52 -0700, Mariia Nikitash <nikitash.mariiaw@gmail.com> wrote:
> From: Bill Wendling <morbo@google.com>
>
> brcmf_fw_alloc_request() constructs firmware file paths by chaining
> strscpy() and multiple strlcat() calls for the module parameter path,
> separator, base name, and extension.
>
> In preparation for removing the deprecated strlcat() API[1], format the
> complete firmware path in a single snprintf() call.
>
> Link: https://github.com/KSPP/linux/issues/370 [1]
> Cc: codemender-patching+linux@google.com
> Assisted-by: LLM

Is this Cc: line necessary? Can you clarify its purpose? No need to clarify
in the commit message. Just an email response will do.

The Assisted-by: tag shows this change was produced with an LLM. Please
follow the guidelines in Documentation/process/generated-content.rst so
it is clear what was tool generated and what tool and/or LLM was used.

[...]

>  	for (j = 0; j < n_fwnames; j++) {
> -		fwreq->items[j].path = fwnames[j].path;
> -		fwnames[j].path[0] = '\0';
>  		/* check if firmware path is provided by module parameter */
>  		if (brcmf_mp_global.firmware_path[0] != '\0') {
> -			strscpy(fwnames[j].path, mp_path,
> -				BRCMF_FW_NAME_LEN);
> -
> -			if (end != '/') {
> -				strlcat(fwnames[j].path, "/",
> -					BRCMF_FW_NAME_LEN);
> -			}
> +			snprintf(fwnames[j].path, BRCMF_FW_NAME_LEN, "%s%s%s%s",
> +				 mp_path, (end == '/') ? "" : "/",
> +				 mapping_table[i].fw_base,
> +				 fwnames[j].extension);
> +		} else {
> +			snprintf(fwnames[j].path, BRCMF_FW_NAME_LEN, "%s%s",
> +				 mapping_table[i].fw_base,
> +				 fwnames[j].extension);
>  		}
> -		strlcat(fwnames[j].path, mapping_table[i].fw_base,
> -			BRCMF_FW_NAME_LEN);
> -		strlcat(fwnames[j].path, fwnames[j].extension,
> -			BRCMF_FW_NAME_LEN);
>  		fwreq->items[j].path = fwnames[j].path;
>  	}

Please address Kees' comment and collapse this into a single snprintf().
Note mp_path points to the firmware_path array so it can never be NULL; an
empty mp_path simply prints nothing, so something like the following would do:

	snprintf(fwnames[j].path, BRCMF_FW_NAME_LEN, "%s%s%s%s", mp_path,
		 (mp_path_len && end != '/') ? "/" : "",
		 mapping_table[i].fw_base, fwnames[j].extension);

Regards,
Arend
