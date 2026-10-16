Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6742F3A784E
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 14:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792161231; cv=none; b=KJR3rqNDrFYd342cxPNwwgbrNNQ3LWAF2htUfQBl36GsRxsZEEBnrUKk+3WBDc9b5oVtPLbJRKXFV2QR9PqzEozO2CJCbIN5DEbEiBCX/aa2jU81MEM27OAhMY+Ewvc5jOnOZSdDbhwSXgxDiys7I/AiJ/OC6zD7zjxkGXlzmzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792161231; c=relaxed/simple;
	bh=QSVM91zrGm4qnssPxMt8adG1wTh5Gl2O5ZTVucNf80E=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=qYp7TuAEU1i2zs4I6E+725lBfgYRd7x2tQi3y1byJ/wGvq8TjKXLdDrOzFDYyUJ4/lD7rAyKOlHWWZwVLCUcZG/HvzPfX6Ig7usZfoAo47ApBk82rJ9anuDHcd2546S0eeK8rJZkTtkxZhJBg1X3/CRjJkojnpqiBQFL0vAtMgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IKaq96GS; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IKaq96GS"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-35cd4e8bdbdso8832185eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 07:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792161229; x=1792766029; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=QSVM91zrGm4qnssPxMt8adG1wTh5Gl2O5ZTVucNf80E=;
        b=IKaq96GS98nryJH7BlQfIW0Sj5M6HG8x3l89+qxBL3oatXi5TcMorN9+I9Orf6ndj+
         XKYmx/e+CHa+yQMUCHT+ivPUheyK6bvKcsLRlmtXFH7XmU/6zOgJXYLGrFxNtVwlSdHn
         +6hBATKkHk8E/c9HCyMfCcDJGU8sdx/hGahoY0SyAijlC7NP/brRwikSB801H5RcY6+r
         TYL/pLWn6QAhrvirqaLHPBy57xPeClWHfjx0XWMaDPQA8dhl1USOTIBTFd+CMdn/ZV1y
         /B/6x20th2THaEwd9NUcOmxaL0mJBabJ4LQs6wphbcftdBn+NxGkZCXCfpoX48yw56OU
         qsrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792161229; x=1792766029;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QSVM91zrGm4qnssPxMt8adG1wTh5Gl2O5ZTVucNf80E=;
        b=UTGMMITzyPRsCz4gkwcBBD6G93a1Dl8kK17diy/gjdTiXXa9LQ/MfVHv0OSFW2mvf5
         GJLc/d0ACsV3P2Z8Jbbvu7nFcrKL7SCN4Bgb+4vcP+FVwo29XopAzGitI7IqDWoOZF0p
         J6ukF3uGZdu0Au3381TTa1G8wEuK38ZmW7S0Sb30Q8S0EHrtShQr5uz+RSw3qO+YxEsJ
         wPdWaW+fffZdCVjMtNpDocoTsrXqs1qKY8Lm6X88dhqLiQEmY84w0qlg8pKe0g54ma6G
         XynZX2q86qJNhTQK8dCBf5nSLvon1i2LIsoIyqHRGmFf3n0uZr81FofNnJTvA7Yoy5Zu
         arhg==
X-Forwarded-Encrypted: i=1; AKwUvByCr6U8+7sjhCFOH/3x0vEyaBsUO67QjRiBy//SlIG1L20U9SiZ6+CZjZYqtxHwzzv7riKCZlTVFUOaxRg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIdnQbf3cinDJWzSbfaPP1nAX9D5hfftgMyddoz7V50IaqKn3VI
	Id9ZVxxfsJdOncQSPqxSwH7PiogjLaD37aF0wNEJVZMFMC5uslSmavL/
X-Gm-Gg: AYBFou2c/U55m+5eXBr/GTVfm+tVlS4hjnKqBih+lWl56X/TilC8IhDWV+viHrkaus4
	84I6u+vz2e/BVIkrEyDGSgmuukStUCTfclFqqqQai0QnJOiOpULHYg/RudQMsgFZqIp7aRsGTRX
	mEUcuYShJjWqg2XCBOEWLCBXbwx/faMiE07bGSjkM4P7Iv4VlXtW1IHBUq0ji1UTpJJ5qn7OLVF
	/OCR1Ea9XJ3A+00dKqYg7lgZhsVHHjGEW2KvohoShXjbUgHSuGhIfeJWyDmT7LKpwNwQsN+vj60
	OY2VrMqHI9b5lgrSwpX7s+4SGDi97hzBoXbFymLeSCmM7TZoEnmv2SscwfVhLSWACGbm/mZjKHC
	JqRQAgXzUnOUHhtBL+89nO/7uLGQMUtyzmfJMxcjmnNAkrYbqzn99MliqhRV2qx/h8nLrd4Di/2
	YQW7Imwtvh+Vit1KX2cfLDa4wBeuD08CVARfRu6F0Aj1fJwMVVzuKuljPM0g1AltpGYagVra/TQ
	Du/mQst1BeyUHqJVDGcZD7fqqyftBHVZvMuaG04kQzuyR2nfTPwK+1sq/JTIEapbSAibA==
X-Received: by 2002:a05:7022:ea46:10b0:144:fb31:a597 with SMTP id a92af1059eb24-185150c9622mr124919c88.47.1792161229304;
        Fri, 16 Oct 2026 07:33:49 -0700 (PDT)
Received: from ehlo.thunderbird.net (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831c5cb39esm6787446c88.22.2026.10.16.07.33.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 07:33:48 -0700 (PDT)
Date: Fri, 16 Oct 2026 07:33:50 -0700
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Jiri Kosina <jikos@kernel.org>
CC: Benjamin Tissoires <bentiss@kernel.org>,
 "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel@lists.opengamingcollective.org
Subject: Re: [PATCH 00/10] HID: hid-lenovo-go-s: Fix various bugs
User-Agent: Thunderbird for Android
In-Reply-To: <7s882475-7947-nsq0-60s9-9s52981s18p3@xreary.bet>
References: <20260914225303.868569-1-derekjohn.clark@gmail.com> <7s882475-7947-nsq0-60s9-9s52981s18p3@xreary.bet>
Message-ID: <07187173-AFEC-4500-BD17-2A55BCA71FA4@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On October 16, 2026 3:03:06 AM PDT, Jiri Kosina <jikos@kernel=2Eorg> wrote:
>On Mon, 14 Sep 2026, Derek J=2E Clark wrote:
>
>> This series fixes various bugs in the hid-lenovo-go-s driver
>>=20
>> Patch 1 fixes a dropped error on return from mcu_property_out()
>>=20
>> Patch 2 creates a mechanism to ignore stale responses if they timed out
>> in the previous command=2E
>>=20
>> Patch 3 fixes a deadlock if the device is removed while cfg_setup() is
>> running=2E
>>=20
>> Patch 4 adds missing pm_ptr to the reset_resume function pointer=2E
>>=20
>> Patch 5 adds a kobject_uevent notify during reset-resume to ensure the
>> os_mode return is caught by udev=2E
>>=20
>> Patch 6 adds a suspend callback to cancel delayed work and re-queue the
>> cfg_setup if the device was suspended prior to or during the work=2E
>>=20
>> Patch 7 moves attribute init to the end of cfg_setup, ensuring the
>> attributes can only be used once the MCU is ready=2E
>>=20
>> Patch 8 reorganizes hid_gos_cfg and renamed it to gos_cfg_drvdata in
>> preparation for later fixes=2E
>>=20
>> Patch 9 moves the static led_classdev to become a member of the drvdata
>> struct=2E
>>=20
>> Patch 10 moved drvdata from a static global to a device allocated
>> struct=2E
>
>Given where we currently are in the development process, I've queued the=
=20
>whole lot in hid=2Egit#for-7=2E4/lenovo, thanks=2E

Hi Jiri,

I've fixed the bugs Sashiko pointed out locally yesterday (a few of them w=
ere quite valid) and have been waiting for my local sashiko pass to submit =
v2=2E I'd recommend waiting to merge them if possible=2E I should be able t=
o submit them today=2E

Thanks,
Derek
