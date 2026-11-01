Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=176.119.200.166
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793571842;
	b=EKaP9y5y4TSN0I12VF4aV9X2r6eA+tK7QXaarP4DHLLSsSk6jxpNXlOdsGSQvFgJhDbG
	 +NFTTUTgLJgoGxEvOxN7yqN+pUFPQi7nLokn9gmN1AiBhb1KvOCCeZF5VbeiGDmGTnlqB
	 +aljbQd4hhyV1YtKYiUJRyQ9jev31z40NbGqFPxONBk+EdAVnE2ESGtBfMgYrtprpGy0q
	 nYKgL8qchGKQX1MOks0LSREW05FDbNRH2YfsK3vQkPXcwx8O091DVdqdexgIl7a42mbsV
	 7VLMSagqIIfOL5EYkGgtZ+335ZRYxGSandzfa9Pb8nuZamyIBjxBJt+aW/bS9wZwSQw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793571842;
	h=DMARC-Filter:DKIM-Signature:Date:In-Reply-To:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:From:To:Cc:Message-ID:
	 References:X-SimpleLogin-Type:X-SimpleLogin-EmailLog-ID:
	 X-SimpleLogin-Want-Signing;
	bh=XmkxEUyDLhutAtoF1BW6+bQZx7sL3ODVy9iJp9IMcMQ=;
	b=lt52oK2TMPL0zbVt9UpkMTsZr5GWYuKUggylTGjII6PfDdJwGlLTSKstXmZ33YTMT8L1
	 iIlhIGMzu6WVyFbVa9Q+rWbq+NVEEMZayFnAX61zvbmbimeQRT/LGTWp0gfaxKvm6iVma
	 qo54k4o8AFhlWaWcNghDReZVKeRBRp5OkpGWSMJ6E7GrKdh6lH5zWbvQbzZKoRSsIlxn8
	 d602FjAfc8WjYn39CeyXo/MXrKiJdrkHwYxZn/wQ8rGNw9VTa7uk5V5Iv84hJjTERuKnz
	 nEIBvBcfmJ8BCbSAoy29r+SAq/zs/UnpX2LLpPFXEZ6DbRbIrEhAgDSeXCD/2SkD/Xg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=8alias.com;
	spf=pass smtp.mailfrom=8alias.com;
	dkim=pass header.d=8alias.com header.i=@8alias.com header.a=rsa-sha256 header.s=dkim header.b=T6TNXF84;
	arc=pass header.oldest-pass=0 smtp.remote-ip=176.119.200.166
Received: from mail-200166.simplelogin.co (mail-200166.simplelogin.co [176.119.200.166])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2EDC606A335
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 22:24:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2EDC606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=8alias.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8alias.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=8alias.com header.i=@8alias.com header.a=rsa-sha256 header.s=dkim header.b=T6TNXF84
ARC-Seal: i=1; a=rsa-sha256; d=simplelogin.co; s=arc-20230626; t=1793571833;
	cv=none; b=TKAcSkXDkMBG1x/jkuQ1r05JapF7fvASsoRKVfvdSCpZVGKbS/fxsYtXSvEa8l7AYgom60JcBedGbjW+BfTTiI0I91wge8KFe1Hp5TURLHZd5yVPbV8oZxBc3iP3JKOsJwmScrcpLc2gihvqvuI2x3hNSKKc/Ad9z9wSIfINYdA4C/ZR7PQqFIAxn1YVXB8w0NoInAPsgDADoljK3EzmCIzpLAqI4WQ8Sou7HkcHmRweP9XmOfMpM2Ri3gQFXjASzNLa9cnmU2NvBDnB+j9PR2aEr3RAp8UTxBghneZF5g2m481Xx1Zkl1H+yT3/qyS/cWyCsMlZkqslpwNOtTz9ew==
ARC-Message-Signature: i=1; a=rsa-sha256; d=simplelogin.co; s=arc-20230626;
	t=1793571833; c=relaxed/simple;
	bh=VgX+PmkF5PZySZVrNyMesJ62oduLpFWpQgpB8NDgA4M=;
	h=Date:In-Reply-To:Subject:From:To:Cc:References; b=ZcoJ6BroRmUWmwDB+Zq9AF/xJmzgFFeARtB/Y5ovACE/KyawYeakgljrjLlZonTWHabDqWPshf+3qj60dozFy8+PjJnzO+hsskbmKNrUm189BKJDtY26iGBee5z2CdGYsjdH9SMxvVgl6lXBuqaNTkDpbkHdl57N5gHFx4puS2SNvNlLg1m4RhtxCh3h72pFxMuo7S92M2qfR3ibYB+UFCm+qCxiJ9IfwsJjoc0JR1TErs4KEg7ckiUf+CDiIw4zAbFfd1utgj8Vc7vV6w9x7H5/+ecH8FhKueTSreSxFfaLYX0i+7qJsxSC52MvHVVDc4HpKw8prJBMzuYB5tjjVg==
ARC-Authentication-Results: i=1; mail.protonmail.ch
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=8alias.com; s=dkim;
	t=1793571833;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XmkxEUyDLhutAtoF1BW6+bQZx7sL3ODVy9iJp9IMcMQ=;
	b=T6TNXF84fMHn2g1sAX3XnGPOUFXcEoitQYQbCbhlx/s3Phy+8MN1j6GEjDKIPQIPUzSlv1
	DtJH8XT4vZQUCD5VZHcyANagWQEbxgU6a2P9sT5i7vmfRa1nl4mlfLDsOkuuwTNErrHU7o
	GpBHFJ+sSjIH3EzqNw2xZGEltJSzYpc=
Date: Sun, 1 Nov 2026 23:23:51 +0100 (CET)
In-Reply-To: 
 <CAGwozwGQvRbwg82M4Myv4GQJhCPEhjyN__6DJ8UdMb8o0V_Zcg@mail.gmail.com>
Subject: Re: [RESEND] ALSA: hda/tas2781: TP3407SA evidence for the January
 custom calibration address patch
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
Content-Transfer-Encoding: 7bit
From: linux-kernel.supreme403@8alias.com
To: Antheas Kapenekakis <lkml@antheas.dev>
Cc: tiwai@suse.com,"Ding,
 Shenghao" <shenghao-ding@ti.com>,perex@perex.cz,baojun.xu@ti.com,kevin-lu@ti.com,sen@ti.com,matthew.schwartz@linux.dev,linux-sound@vger.kernel.org,linux-kernel@vger.kernel.org
Message-ID: <179357183245.7.3137161079355845805.1738723974@8alias.com>
References: <P3C8cUq--F-9@tutamail.com> <P3CEBDi--F-9@tutamail.com>
 <CAGwozwGQvRbwg82M4Myv4GQJhCPEhjyN__6DJ8UdMb8o0V_Zcg@mail.gmail.com>
X-SimpleLogin-Type: Reply
X-SimpleLogin-EmailLog-ID: 1738724005
X-SimpleLogin-Want-Signing: yes


Hi Antheas,


Any news on resending this patch? Is there anything you need from me before it can move forward?



Thanks,
assembledev



> On Mon, 5 Oct 2026 at 20:04, <linux-kernel.supreme403@8alias.com> wrote:
>
>>
>> Hi Antheas and sound/TI maintainers,
>>
>> Resending as plain text because LKML rejected the previous message for containing an HTML part.
>> ...
>> Limits: only the primary amplifier was read on hardware, and the final register snapshot was taken idle. The listening result is subjective; there is no calibrated SPL measurement or controlled same-volume A/B. Current mainline and for-next were not built and booted as full kernels.
>>
>> Unlike the January Ally X test, this machine's OEM and firmware layouts differ. This report does not claim to fix the Ally X's separate symptom. Commit 4fe238513407 introduced the custom-node parser with the BASIC-only assignment and appears to be the appropriate Fixes target.
>>
>> DSP SHA256:
>>  a29f522c22cdb203eb1af84846838b5ef76c3a2c721760c7a898dd35f9ce1430
>> Public firmware:
>> https://gitlab.com/kernel-firmware/linux-firmware/-/raw/20260410/ti/audio/tas2781/TAS2XXX10A40.bin
>> Original patch:
>> https://lore.kernel.org/all/20260107093134.583873-1-lkml@antheas.dev/
>>
>> OpenAI Codex (LLM) assisted with diagnosing the quiet speakers, validating the existing patch, preparing a local reproducer and drafting this hardware report. The kernel change is your January proposal.
>>
>
> The Ally X had a different issue so we never merged that fix. The
> commit body would need to be amended but we should be able to merge
> this.
>
> Does anyone else have any suggestions? If not I can plan to resend the
> fix in a few days. I will not be able to do the testing for it (no
> affected devices)
>
> Antheas
>
>> Assisted-by: LLM
>>
>> Thanks,
>> assembledev
>>
>
>


