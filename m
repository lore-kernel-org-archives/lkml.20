Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E773B14D6
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 21:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790716471; cv=none; b=DZnmOUtlOU9yQpPyH9iVuB64BjO8weGt6o4jFN4jGQXhMLa0PCuW8Udris25pqHc02ONnuauZa1NU1Ogv4mqCHgf+FpiOoDdOCFPFVST+ypazscxpIszxUj1E3rDynka49/dzHd5xnSi+EkQ/j/Wlfnm9o2xwHvCGnogui/G2cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790716471; c=relaxed/simple;
	bh=5/togg/DPk0r7Ug8UPLdLx052cH0w1RAr3Q+/KhfwSI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KetpPJhzfhUQWvccdX1Gk0eEodV6ChQ34XU+RWJlJRrfRShMEsHhLd89LiUGZZs1DpG8TELlFhCuAf2mDsY8rJL2nSBfFa6S3YmTAHINpEhQGWFoLqV+NKLU3PQJbNadO3oJXcBeutxnmxOvJZN/XTHjWx8C/XSB9PPVNy8fRNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KhkW4pZg; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KhkW4pZg"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e66390995so26328355e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 14:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790716468; x=1791321268; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sHIA1C0brtLm631UlMCeHLnUCZCnWiJvHiU+FJfuc6o=;
        b=KhkW4pZgUg6TiFYMOVKH+LthuvHRINrTWEQwsyA37RNaAvEVTjs6YgRMTQ5xDmuUPp
         G4MaJ7+43FSbqeYQ/hkNFJGTlHNv4Y8KYpK3cUYPgHQuu5S7tDptdVQHCCwPPYV2CjdE
         zPkVFJIe3B41jUSKab7YWnNldj3VS/a2ELXPY365Uvm/Ur9AOSZyxE2/fDNv9ChpFiK1
         jPSMJourB6EJWIKVsdqj6E/mFwCCm/0Cj9zKDC4oXY1HUKo9bE5TyxfKwRyNbZrjoKxy
         o7VJYkHTCbZr7IWS11MMHLGbhGvwqs0MFJObrzarJ8Nh9ct6hIaNUsWx5K1OTv8oDF+a
         GwQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790716468; x=1791321268;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sHIA1C0brtLm631UlMCeHLnUCZCnWiJvHiU+FJfuc6o=;
        b=TctMP8oaZzl2mn9lKbJHqrHh7BulJ1YmCtD7DAV5oT5hbBDj1bQ4088wobwlVfB6Tf
         vVsRRhgJSrnwGbmrOiwyrV4pL5uTlnI2D4JABMhL3xeC3taMP2FWIRCDoSS97R7HmWoT
         l5NduFutXlMQ954VrWs4b9oVwK/+EM+Z3ec02VqswYADlj3Hvtj+UqlA8zopEsN7/La1
         GZqTXwwZpM8we1ahz/tMn1BxhcuwDrX3YAj6HGeUHAWIUyqOcVI2I4rzL5xPf/g5zzjI
         qM7WrCEakXfToRDHcTLlZMXj+s7BhdAYaljb/5NCpgfeNP3IcNJPgUPe05uoP3qNzjan
         QHYg==
X-Forwarded-Encrypted: i=1; AKwUvBxv4rMmgMriF/B/oKw7I0HHYYcolfs9lh2WptVjlZYDdU7ot1n3cb4p+OcvA1XUDcrHm5PuqnRhGwBiDhQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kJyDvB9bL6pcvvqbu/Rw2+ewr1IDzDWV7MvjJmoE/XkCkAckRS
	K+zYo7SVJwM3T9FRliHYbm0Gfz6rJ/qbLi3q7BHq6ZGu7NEOzPkkNHLV
X-Gm-Gg: AYBFou0ABtMDgm2CHkDMmEQbh5ZL/JbO4srckxSFeEyKtbywde1w0L17ksouv5/3eqp
	ZDKdMcKHasD/HlL9GyXhdvdfuhDbrMDqwQBvm/ftSKsoe//qCNeB/TQ+hmoCSTegDB+5BdOrb8+
	6jdlbrIax2WpKpAA//ajY1AdcYsjRe3aTnPzZPZXZVP+e1qshCuZq01NAPskq7Z4KUGs7Mgz6P/
	8g3aR5nGK6yXc9UzN+Xofb9vBj62Y9YYucpWUYlpXYam20erqqgVrbTLr29uVgLDlZSDBPFJicd
	zvqp+2fPqM+LOsyXqgTI2tYUpNcKo4HuFFwRmnEu/wlPmbLciOcMN8tv0/LaGIEBUxkcKDVz9Xc
	ERb+rDmeLOKsDC2N5Ox6YNp3TLmBwgKgj4stWpc9Bi4L2PUWQUylOfYsHKcyuS1YwiHz6XSujKS
	11m5+7K2XNImhRke7YFSfAMi8LpAl3IjQ82cSu5HIcD+xyMU2xhOmGftEJmdx+0JzcrKritD0h/
	g97MBFpk+y/X0pcqdRgUivZbtIli5/ZzEzfbw0W7lmpBeZk/S/pfp0z/3cnplJUK/sq2iA+gxoN
	/J9evgX/ARphui/n
X-Received: by 2002:a05:600d:444c:20b0:4a0:151e:f72b with SMTP id 5b1f17b1804b1-4a0151efbb4mr3025585e9.12.1790716468039;
        Tue, 29 Sep 2026 14:14:28 -0700 (PDT)
Received: from ?IPV6:2a00:1358:e0fb:c500:351f:e304:7fce:781b? ([2a00:1358:e0fb:c500:351f:e304:7fce:781b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a015cbc3basm366305e9.2.2026.09.29.14.14.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 14:14:27 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <f3a26a6d-e2ea-4d84-9e3f-fa8e0d891728@gmail.com>
Date: Tue, 29 Sep 2026 22:14:25 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] kconfig: tests: Reset all KCONFIG_* env variables
 by default
To: Nicolas Schier <n.schier@fritz.com>, Nathan Chancellor
 <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Pengpeng Hou <pengpeng@iscas.ac.cn>, Ulf Magnusson <ulfalizer@gmail.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260929-kconfig-tests-minor-updates-v2-0-c5902bee1d0c@fritz.com>
 <20260929-kconfig-tests-minor-updates-v2-1-c5902bee1d0c@fritz.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20260929-kconfig-tests-minor-updates-v2-1-c5902bee1d0c@fritz.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/29/26 08:59, Nicolas Schier wrote:
> Reset all environment variables with names starting with 'KCONFIG_' from
> the user-provided environment.
> 
> This fixes the 'warn_changed_input' test on systems with
> KCONFIG_WARN_CHANGED_INPUT=1 and ensures a cleaner test environment.
> 
> Fixes: 645323a7f4e5 ("kconfig: add optional warnings for changed input values")
> Signed-off-by: Nicolas Schier <n.schier@fritz.com>
Reviewed-by: Julian Braha <julianbraha@gmail.com>
