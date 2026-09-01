Received: from mail-pg1-f227.google.com (mail-pg1-f227.google.com [209.85.215.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 035CC339383
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 08:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788252973; cv=none; b=Vds1m8RE68ehuayCzZcADqI1g01ZK1P+EOsh2d1WGWIFNwRbIUxom7k210nfKg+sjWNLiXJCCEutXYVQPisAWeFpLaAcNmTfX2Vc7JOgKxzXBKffJtJQaTgY82L+E4lhCNvEa69fCBvR19bNB1N6v5NwKovisaPs8tGujw/8caI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788252973; c=relaxed/simple;
	bh=HKyQHdR5ynNMus3ZIXulcMT4jzgy3T8hMGmMkl2nc8c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U0CW3F+8nnOk2O/29MpzgRiHD/gZTqUXBUHFvwzRpyT8TD7FR5iFpY0FxJXmnwn+wJEfd75u4rrkO0fBO5Frz2egZrFas/oY6at0CI5MD+DPYNFBFsoZ8ugfXbjgcL7MjsDccwZFpTaEKdgkQBOrvZBF7Zg6X1aalrX5xFJ+jx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=eOr3c9ob; arc=none smtp.client-ip=209.85.215.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="eOr3c9ob"
Received: by mail-pg1-f227.google.com with SMTP id 41be03b00d2f7-cb5b8572b70so4631459a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 01:56:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788252971; x=1788857771;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=E+KYz0np7Sxg5cuxvo6xZsJdgBW3ZsGYJ2wUIRvt5rQ=;
        b=RAJn3zdfaS5aZim2QnZE5usB5LsF3RegPuY5+8SxBVBSl7hXp2cuBkdFRnMEKQ2N7h
         1VFxB28BrfDAfn3Jf3PUUEVQVzafo4hw+vmlaACJg/UB5UEWfJs7HTjIfuP7tQ5rXsZo
         GqfkBWq3cqhkumM9gztWWS7LSiSREHSGikS3R2Of02WiHw88oleqSWfvxHZ+UkiSGux7
         xuZo/h4ANzxPPgU2hQdq18AqxqZV3Shpa1HLeckeFI+l4orp9SRaUnuF6/RJTVpzXZwe
         Ylu2XM8sWTICwIH6dNaROpX5G+LXTDUQq+eCt+9N9fiXXQMlg94KmQlTt026U/28cfAR
         SbTA==
X-Forwarded-Encrypted: i=1; AHgh+RreaefohES3sBhc59dxlvO4nVwpELJXBDpZF4xL0decIxvL25Fo6o0NsMtvAea6oXev9e1goOq3OmcHfLo=@vger.kernel.org
X-Gm-Message-State: AFuF++mpCMN3kuyqr5Bvftpz+DY91orI6MyfLEQCEvSt7kxh7xAIbqjC
	mOys1XOvdYWKqmNZNl3XhWs9Hn74AQFiDNpO2Katt0OQ/ASj7ORbMkeartW1/YbnRMhSl2cFRdp
	M1PyFOGF8v3GvANfyH6MSSOGjdhu9nKTNstNkYvixOHnAoyv+zGcBqIa+qIvkB/xHot2U2AvTnC
	NTE2UXa8CB+oriJVkDlQj2ES4ADo8O0QJ8cSTlMh7IYrwBU9vmLKEWvUSRGVF5GZ3EOeJ9H24T1
	okhva4PjeA+N2hIcAabk7pdUw==
X-Gm-Gg: AR+sD10TOuVXW+NmSafP4iqtjS7S6+V0IMwc9u6CaZE7SgkLljHKXG3qpd+H2uhL4cr
	d2EUoLnc/46fGKWc6oyKwC7uarRRezn9B9tpPJ67eS6/gsXrDQqwMazd8xsv7gN4tj0w8vSQBrc
	8ByA25LSle0AWLIlGIpKPyIT8Vyo6UBjaXTqZ8g12SVZfHTVSngrGotH4Z8qEwDv2iCU2N9aZiN
	w/k0KEHVjAihm9lzYa9hVJYaoBb159bF5r963r8xg3NjnbPAuOhM/YCi/Kx/zI41CwW51GihDMj
	OH2JGWXN8+mEfEGuLyEaRQ8QTN11al09aNP5fsMz0MjsRRo+HfkxrUCWr5PzB8Sh7wLrM6Yt4pG
	Mgihm9Yw3yDRx7Q+xAdl+8n3ME0hln9aBElEeZKrgX+NCBvNrOX8ql8QOWKxhhXq0YYEAD5uJl9
	rc4T/9jbTr7UKKWXLC46jd/GVnxu3dbB8O1cEOUGE=
X-Received: by 2002:a05:6a21:9087:b0:3cd:67e9:8565 with SMTP id adf61e73a8af0-3d7ae4f3aecmr10886210637.9.1788252970882;
        Tue, 01 Sep 2026 01:56:10 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-20.dlp.protect.broadcom.com. [144.49.247.20])
        by smtp-relay.gmail.com with ESMTPS id 41be03b00d2f7-cc1f36e67c4sm2757035a12.10.2026.09.01.01.56.10
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 01 Sep 2026 01:56:10 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-90e869793d3so8495386d6.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 01:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1788252969; x=1788857769; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E+KYz0np7Sxg5cuxvo6xZsJdgBW3ZsGYJ2wUIRvt5rQ=;
        b=eOr3c9obqgK08XzVH8UoY0XUHdLFBh8SbFPxf7mVeWj/JFJlWviUV6ByYjh7Tq3c00
         4P9y1K103fRMOMPIjEE4vA22LtEoOMGS+OapTU/kEHorf4QV2csx/iHJYQHqfQDSNH6W
         Tgef48+5PwqbefxQEqnPK/rkiUx9MlT/lcH04=
X-Forwarded-Encrypted: i=1; AHgh+RqQt3Xe7iPxLrTHoPWa0mJ2S061Ru/4QF1IPLc01utwvaadDuhv9cwoIPG6l4zVSHRiBevUPvNxjzdEhAU=@vger.kernel.org
X-Received: by 2002:ac8:5cd1:0:b0:528:3471:937f with SMTP id d75a77b69052e-53021ce5310mr90233211cf.29.1788252969512;
        Tue, 01 Sep 2026 01:56:09 -0700 (PDT)
X-Received: by 2002:ac8:5cd1:0:b0:528:3471:937f with SMTP id d75a77b69052e-53021ce5310mr90232781cf.29.1788252968989;
        Tue, 01 Sep 2026 01:56:08 -0700 (PDT)
Received: from [10.176.5.153] ([192.19.176.250])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52ff6f363fasm74787291cf.16.2026.09.01.01.56.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 01:56:08 -0700 (PDT)
Message-ID: <02c6f660-68f7-488b-a600-279e3a7f272e@broadcom.com>
Date: Tue, 1 Sep 2026 10:56:05 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/5] wifi: nl80211: add roam offload extended feature
To: HungTsung Huang <Jason.Huang2@infineon.com>
Cc: linux-wireless@vger.kernel.org, johannes.berg@intel.com,
 johannes@sipsolutions.net, hsin-hung.li@cypress.com,
 linux-kernel@vger.kernel.org, brcm80211@lists.linux.dev,
 brcm80211-dev-list.pdl@broadcom.com, wlan-kernel-dev-list@infineon.com,
 jeff.johnson@oss.qualcomm.com, Carella Chen <carella.chen@infineon.com>
References: <20260821-upstream-wireless-next-main-jason-11r-support-v1-v5-0-eeab4fda0f31@infineon.com>
 <20260821-upstream-wireless-next-main-jason-11r-support-v1-v5-1-eeab4fda0f31@infineon.com>
 <382c3dbb-ff32-4e62-9b79-c6e4cc6273ef@broadcom.com>
 <8a866e2b-8802-4a8e-8421-2732da5f5c8f@broadcom.com>
 <20260901071424.GA1876155@ISCN5CG5251XQT.infineon.com>
Content-Language: en-US
From: Arend van Spriel <arend.vanspriel@broadcom.com>
In-Reply-To: <20260901071424.GA1876155@ISCN5CG5251XQT.infineon.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 01/09/2026 09:14, HungTsung Huang wrote:
> Hi Arend,
> 
>> Actually there is a checkpatch warning that line with the STA_1X check
>> is 82 characters. So my suggestion please make it FAST_ROAMING instead
>> of ROAM_OFFLOAD and swap the two checks to fix the checkpatch warning.
>>
> Thank you for your suggestion. We will rename it to NL80211_EXT_FEATURE_FAST_ROAM_OFFLOAD.
> The name reflects that userspace offloads fast-roaming handling to the driver/firmware,
> and it covers both FT and OKC. We will also reorder the checks to avoid the line-length warning.
As this is indicating a driver feature the "_OFFLOAD" part is implied. 
At least that is how I look at it. With the 80 char limit the long name 
can be a drag in places.

Regards,
Arend
