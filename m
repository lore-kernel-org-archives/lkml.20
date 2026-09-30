Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E933D3CE5
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 19:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790795937; cv=none; b=hBDbACHzyWexSqF6cGwTqBcelz9S1aWW0XEbxr0u9x6VA7cIIMYJ+caus7MkVBQFQd4XnNeRuZyqu92fu8QlE3h+AIhxW7ryMHgRCHa6nMVLwSRPdhsEA/nq42GNRy6hXzVG1P2sTPsIJwnBhA/Z9bkAAUBy2Hj70E2VFEhzGao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790795937; c=relaxed/simple;
	bh=eX9TtBllmCyIZ0O8Pa1CHGXLav0s39iWyvD52Oi6rrg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hcohWpfZPwNyzJj8QoQHObw7SvnD/Bti/lf5wTFRDPwmgUuhw7Y8ILYnDE7GwUtSsavh83KQkVvEoypHTQgtqPi9S5KyY3+npbnoQEX2R4YfnBfXnyiwLu97i/cot+t96EJCqt7oPbDak+5vuOwX3q6U/Ffgy1z+EBHqPwnfIBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l+0stosp; arc=none smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l+0stosp"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5ba44044ff8so22641e87.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 12:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790795934; x=1791400734; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eX9TtBllmCyIZ0O8Pa1CHGXLav0s39iWyvD52Oi6rrg=;
        b=l+0stospN8B934lkRUkLj9xd6JsECHdRpf+0rV6USZPPbJIRurjZZicq9YVDVDWIYx
         G5ek5DiseqF6Hbm8w40hVrNPE03NdyLnp8aR8uU7UBqJtoklgPJdwLuO0EL8Wdtd7w6s
         mD8pZMJA2r+XQkQzDqLP/FqkVa2gr/PwEzx5OUIJHmEVnvvBdmqYTddaIL/Uu+hBJciw
         LAskc+dcBRT18GuZmLlkrPQzG/tjm2lxRTsxoApwznXjyUD3RxtVct8zIhQ/UNBFYHfq
         304lT7v6eaL1vlMC6kOXwLD4J6hTUh6osZf7nsXwwyCOPvsR2bkFd03fBhOL4O0QPzHn
         D87g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790795934; x=1791400734;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eX9TtBllmCyIZ0O8Pa1CHGXLav0s39iWyvD52Oi6rrg=;
        b=bcpztvz43b+sqhUovCY3GN/9aoDV9Zp79nQIk6bBwPRhL+E+r2dvI9N0/d82WedhKH
         gFIGY14npMrZP2lKgLvuc8YoUQtvCF1qgh6Tz/ugeUkAi1e47SraM+qlky2FxkczPSnf
         1lmDDLoOP7VB5iHmmOWZmAD6XZEdlSP3toPrGrwLskyoJBQsz4d9p5UagMdJeOekx0j2
         a8NZhPD42GNGlwns+h6Nj9c4zEMY8SuOvNJ/GNUXZ5nf0v7uUAhSLW7O2pJqpoZI7gtg
         WN7stFCkQtBPkmn/muIKdwcxnAWQ/azcv05E8yoECU330lQq7dtoC++kmoyRO9yA813C
         PZEA==
X-Forwarded-Encrypted: i=1; AKwUvBzH/M1rPfEHOlHTFSO8doc4J36lCsDKIJdNdn6Jk04WKpulDdD5gULLMHnV49rmm58DLLHPSCOpTZexC0g=@vger.kernel.org
X-Gm-Message-State: AFq9FYKdbfyL560mFan3kQTgEF67E5fhL4HWI/NPU104ysd8jE5m8G+t
	LsOl4aQWF+Zf3XBCJEww8Z0y8fVwpiC6YtxoYnkhvl6QK/3GJRhbN/7R5oRO5N0TCCk5ug==
X-Gm-Gg: AYBFou1leQRi5N6YPmm/QpmzyxoY1baavG1dXd4j2BpD0Ne8R//u3H4Wm6SkxKqS6eP
	bhqkrodm+FieSu7v7rAMQEY9zeMhcCFToFFRpxWL7zurEWD91IbaVXngBrAvn6bxjVZrl4d4Q/2
	MFWAOtAZ1tiDDRMvs4I5C2N1nIjbhJ+xX1Vu64191vRCv92XDDcwKACdDpbw3pKnCdfgr4xQ2lt
	fz4VZa0Kz+e7Ms1fucBBj3cw4CjWd7J4WBTIeNCBYLzxKDs74cTdiHRJciS8dLFDxGU1D2xXRk8
	gzy/dUa1QkY10f3VeQBwRydSlMhvEv1uQXD7pKdjvgWjRSYJMb2HVP04WnUoE70mSBrm+RUE8JJ
	bnRqB4OMHHR95uJJnvg9Jb5YHduiDYR1tHFsnxaihFE8HhlR5odyypCFUS1jZTyC0JBjZuxBkMm
	0qDrZtdulgvQZ4jtXC6/PrGEwi6OW6l+OQCTprIDvxafQA+kq+hLJ1d+MugYrma8WCZprj2vgJo
	g1Lze78RI3TMvdb5lOPuGh0MB3Dlzk=
X-Received: by 2002:a05:6512:39ce:b0:5b8:bc5e:b57e with SMTP id 2adb3069b0e04-5ba4061991emr1049016e87.54.1790795933835;
        Wed, 30 Sep 2026 12:18:53 -0700 (PDT)
Received: from [192.168.1.123] ([95.31.11.153])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ba42fb2095sm176712e87.36.2026.09.30.12.18.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 12:18:51 -0700 (PDT)
Message-ID: <43209187-780e-4e09-a648-a4eef4a12d8f@gmail.com>
Date: Wed, 30 Sep 2026 22:18:46 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Bluetooth: btusb: add ASUS 0b05:1825 to QCA Rome quirks
To: marcel@holtmann.org, luiz.dentz@gmail.com
Cc: linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260930181104.3375-1-qwertyuiopyyy@gmail.com>
Content-Language: ru
From: Konstantin Nazarov <qwertyuiopyyy@gmail.com>
In-Reply-To: <20260930181104.3375-1-qwertyuiopyyy@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Please ignore this patch, it was based on the wrong tree.
I will send v2 shortly.

