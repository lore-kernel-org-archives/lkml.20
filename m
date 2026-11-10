Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794321399;
	b=rDrIIOJ5ZW2vLcsIpr6z4YUm/LAT7fhh6x/D3xZZfrpwqjuAYk2nNwcSdfq9FJgyHfnt
	 rtSyCNGAxcMTIfHFycFjVIpUVfrg3ojMmnrgRqRkiF3IpSSefkmUxMbJ83AWHohLRVtBL
	 AsQAmXI0hFEmEnuwmzu929k+6+0igvLgAZraBc1bwuf5npLu8wh7yCH/xkf6vJ3dLNplI
	 i+3uQHMTenz7EGqjjOpADN2IbPBOwBTzKn5UbjMMO9//+LaBW+T+6u2/Hd/55UHPDnZPS
	 AXauNU5JFw93zvKKtTMqA9HA3nhpIlnT7iJmiFZORgSMYuYtBkamSIXx37FlSDzOG6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794321399;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Subject:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=r1q9uCh2Ub/6jdRiey2I/jj9py/sllPqUb+7EdBZ/WM=;
	b=JZx1GFGnR8pEzjgbbLCd9hdK5h54f5Cis3tVnbovxMCP11vqTCdyJG43SrEohNBUpSr/
	 QleRENeKQyg5MUvUbCXTQPjKkJ+RUwnShKOY710kRXpSxqGMODi3Ygttf65Zj9MlFMQHU
	 yNG07lOGBbcI3F36DfCH2n59LNB21w7/sjxMKs7ky54obveRe868IpgWm0XHoZD1a14Eg
	 +31i4mwz60zs6ZFQo4Hh5AlVRTcKFWucdlJw/1UcO8vjBDAhRfTi0zAbzWiN9V9ka3Os8
	 51ANcDat3Pb8Fk+RCP9KeNv9N9nQWVE7fK+sZ+iuK4N49hNGFOf81SRu8p5N5zedMZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Pz+ivFZT;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C161606A330
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:36:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C161606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Pz+ivFZT
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso1821082f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 06:36:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794321397; x=1794926197; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=r1q9uCh2Ub/6jdRiey2I/jj9py/sllPqUb+7EdBZ/WM=;
        b=Pz+ivFZTu5cafYZ/TV/v6NQLhQMOrajdpOQdyJO9UUbouYEHJN/LHPLbInUHZ02IFM
         KL7aHFdYURc5p5IGu7GInwBhFMMr5v4Mb1tII+e2j+LzoP8aDNQ6tyiPrijZZkukByiV
         X9trbqe3voo2TfCRm2riB6nV+PlpllS5pic8aRlsc32tn74dGja/dhThWdv8Vbq+jNUP
         HrCC5yZ2Z29/bkXDRGKk+ph/JCv8NUc6dk5l3nnNjExHpik2EKlUJ/KNd2vBjOuJff9r
         PhlbmkYVjuF3lmC2E/zBfQYiYVapZufMil9sEXCpUjgH3D9hGVXnM6DI1m04jaVrs+Wk
         no3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794321397; x=1794926197;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r1q9uCh2Ub/6jdRiey2I/jj9py/sllPqUb+7EdBZ/WM=;
        b=XAvtpDlBJ8UiVvWiJKe/FD1vkBRo/fgO96F88PCDZyOTCEVe8fnXa1IkPeGDI4vE72
         4WYhqVpB5jYuXnmpHARXZbn7aPY3EYtl6ptIy8AMof7fcw6bu/AHf0CBJX2hZ0QCUFp4
         Krtj5i0z8UhZKahV1IkKCxLl2P454xBQRXs7G95kFCvUr0TkOIivvWg7HYspfpqOVAG0
         tojmLacFvheG0UjgJPehAKrgkuAXdu59m1S4ibPcw2AR+ibnyyWH6tF3JWZ04HUfX/2Q
         qD2P00c4qOrtM2ENATzD4LPiD3fr4/IYJVeDlwRrTwxK6LGPtcnHHpUp9VyR5DyR42w5
         SwFg==
X-Forwarded-Encrypted: i=1; AL+hErFGeg+Fn9UZSn6B0oid14RtDU6WY+oEF34m6/IQ1ErsHPymVjOsv738FDT1/Uyqa3jbF5PGW/3/BudWvEs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/+ZJeY29nV+CGRDbyU3sQLEECe1UjM4BijNJtw+vQ4xUzPhxc/
	G3y3Gvs/eWcaqNzFm48zRp7bzwvcyuHlZQb2oNHQ2OeSl8sPRxph9WZJ
X-Gm-Gg: AYBFou1uuK/MPf2NNP+0AwrkoY+cUhp6J7v4ppX4ykCeqVuLePkhVMhk/2bf0SIhezX
	6xt16JHqJcnv4edwIjNqegbglVJIG0zDOdyYZr7SQWogKb3ZXsRs79KzJs7z+1hlExkHCPckrst
	7Q70z4Vrc732awFAzzeLnsdwaaXY3GHaJxKZi9t0Iz7hJ2eVWkmwpFmNJgfdoM9WQhsR5CJf5ke
	YY3r6GIy2wHg/I3g7ANSLWuFNV1N7BOA7Qlk5mnn4H6fTeJUeN6eR4EJgOIpaxZ46N5XdfuhICK
	fe72r2ACuAYNU/6gl4vpGhMDiv2AB+KjZRgZ8MhDBUSdfm+38/WOg5voAkFXftl1kIb/WCtAf/c
	8Lib+xdoxmTStU9xf1EH2OLb33LmXoqp6bgveqe8VtgGa57GIA3MqN7KCPlHcdvzUdCYNEV+mN1
	Ig1eYTcOwX/Hr+Kl8e2GzGu6/b/MK9FKuMRLCllhv7m9IEES82b+EDKzdCjIaA4LJ7yh+silLT0
	xcdyfqR9f9n7W/kWvTXVK3EJQyTrbJphBjzneNROGu0ryY2jAMfEgO9zNovp0UuZB4RAqRM+w0l
	qM5YHJ6fZn/zKi/OSE10xsNdIeXjqK1KtdHxzcUO
X-Received: by 2002:a05:6000:29c9:b0:48d:fbdd:4132 with SMTP id ffacd0b85a97d-4982ecf6aebmr3458602f8f.18.1794321397525;
        Tue, 10 Nov 2026 06:36:37 -0800 (PST)
Received: from [192.168.1.50] ([188.27.124.137])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498362eb158sm5319955f8f.36.2026.11.10.06.36.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 06:36:37 -0800 (PST)
Message-ID: <45407e4f-9009-4f0b-a9a8-58b7052d25a1@gmail.com>
Date: Tue, 10 Nov 2026 16:36:35 +0200
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Bitterblue Smith <rtl8821cerfe2@gmail.com>
Subject: Re: [PATCH rtw-next v2 6/7] wifi: rtw88: 88xxa: adapt channel sensing
 to receiver gain
To: Luka Gejak <luka.gejak@linux.dev>, Ho Jie Feng <hjf3108@gmail.com>,
 Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261031070950.425176-1-hjf3108@gmail.com>
 <20261031070950.425176-7-hjf3108@gmail.com>
 <4ada79186cd882a6d3344c43579e5addc4d4e644@linux.dev>
 <3bd7d396-bb54-41bc-890a-bfeab90dca3a@gmail.com>
 <1d7fe388a84ba7a078efbf1972869d63cb8234ea@linux.dev>
Content-Language: en-US
In-Reply-To: <1d7fe388a84ba7a078efbf1972869d63cb8234ea@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/11/2026 22:27, Luka Gejak wrote:
> November 6, 2026 at 8:46 PM, "Bitterblue Smith" <rtl8821cerfe2@gmail.com> wrote:
> 
>>
>> On 06/11/2026 19:34, Luka Gejak wrote:
>>
>>>
> 
> [ ... ]
> 
>>>  
>>>  Bitterblue, did you turn EDCCA off through the edcca_enable debugfs file?
>>>
>> Yes, that's what I did.
>>
> 
> Thanks for the answer. So I think EDCCA itself is fine with this patch,
> and it is the lower thresholds of the adaptivity mode that keep the
> firmware from leaving LPS.
> 
> To me this looks a lot like b0435910e47d ("wifi: rtw88: 8822b: Relax
> ETSI EDCCA threshold on 2.4 GHz"). There an RTL8812BU running as a 2.4
> GHz AP wasn't seen in scans and failed to get TX reports under the
> ETSI threshold, mostly because of energy from the adapter's own USB 3
> link. The fix was to use the normal threshold on 2.4 GHz under ETSI,
> capped for EN 300 328. Your network is on channel 13, so that would fit.
> 
> The 8812au vendor drivers don't use the adaptivity thresholds by default
> either. Both v5.6.4.2 and 8812au-20210820 build with
> 
>         CONFIG_RTW_ADAPTIVITY_EN = disable
> 
> and as far as I can see phydm_adaptivity() then stays on the normal
> (mode2) thresholds.
> 
> Jie Feng, maybe doing the same as 8822b would work for v3, the normal
> thresholds on 2.4 GHz under ETSI and the adaptivity ones for 5 GHz and
> JP. Bitterblue, is the adapter on a USB 3 port, and do you see the LPS
> failures on 5 GHz as well?
> 

It's in a USB 2 port. I am seeing the LPS failures on 5 GHz too.
Channel 100, 80 MHz wide.

> Best regards,
> Luka Gejak

