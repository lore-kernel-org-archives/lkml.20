Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF0F25B0BE
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 18:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789841356; cv=none; b=Iet1dbcw2o0i9AeJ6e6ognoY5DkkS1HMcw2BeQ0r0rspS9AP4ys6JqMoT+k6enDqdB1GYY/Drn0sGSCJwnbXMAS6Pgf1bi/xugjDKMcRQh3bevYRJQ61COM3fZcDgyOPQxI+g3jN/LqQytgrG5Wyj1C+9M57aecUuENOYPjn8bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789841356; c=relaxed/simple;
	bh=GNQgwpsmu+MroGLaEFGUtpm8ba9OaOuFh9h6nC5SlSM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GCD1QXHwDAk61r85p1LvR4FXb8V3l1SxBFwopp+e5Ed61Zua6MGiF6Pnd7Q/rbGiuKM+61VTtHRf+yzrNkFsoqQuOUM23ZFe9BzHVHUQFO/jl8DMdnFRUhq4kOSLs7RalkmN9KScq0IXQBcIfdSs5vaonSiB+UN4qjnBfBWCUz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DzzPF2AZ; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DzzPF2AZ"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e6c0fce17so8854995e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 11:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789841353; x=1790446153; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xpY6V415b91DqiPof+7OhChgdgeSAFqb9K0yJJZu+s4=;
        b=DzzPF2AZPKpE51ySP1tACySPkP8WN31g/nfyiAnY34dbtvGwzwG+aIPUDQcn1Co3Ef
         nX7DTIVCzuY1Bd7SdrAnocJFHYovxImDIZE5j560j8UNql04pPrqUDhHBe85QlX9U/Pm
         w0u90Am5Qok8Lnso8FrnMnpdWEJgbt2iRiu92oYBCpR1Gs/z0yW2MNlwjdJ3YY50Z2cI
         i2YTlhj7eHiQGO8fWSxYhiVKtnyN8YPkJwCpR2BQpAdAScDeatSNBwatMcjo1WspdnGs
         RFKxILtze2h4qcN7z5VmdM+0OLwrsKU3nl8ic0jx6rODuFKE8OIOSAZ6AxeMXdPuG+Mk
         qg/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789841353; x=1790446153;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xpY6V415b91DqiPof+7OhChgdgeSAFqb9K0yJJZu+s4=;
        b=ZVKn9RMyF7P6S9ZKfPfMeNNssVQCe52F+WZ9h2pjZThwjcU9b/JIUuxHLMueqaxH0i
         LyL0pFIPM319fLaZYPdQCZs3C+NWhoMwZ4uX0OPrGEBHR7FMlLTNoK+RLC6kKX9aY8dD
         4QvZr53DYw2jUoCQCfJgFbcNDW+4jocRrHMuuNy7/JRPNY5PVLIyP+oPeVayf8MwmHr8
         QvdTN3R4aZQuF+2rIyGrQi6ovpXpv90+ZJu88LaJcKSTjym0DLQjRd3UeSIjlxZGphUC
         E1QPQbWOiy9BoPFlu1KeYS1TyIt+GvtBbUFMKzSqK2vfQHGKQntX6ywbLDHJjMzbIcm3
         TH9w==
X-Forwarded-Encrypted: i=1; AKwUvBy/JWIv1uwRIgYGj/zVvl73RN4esCmdWrAAdk0JCgPHUzH6NNuJvM7w5MPu0oOzFnjkcAuTG2/DvdjqTVU=@vger.kernel.org
X-Gm-Message-State: AFuF++lfFoHpnqSxtFrPoiF67IaYBbj1eTb7ojTbuILoA+xuOGY19LUM
	MQQuPpGpE467O0AsbweHBThBwN84tzzH0AZFrUdwZTXFD0dtC7UxCAqOUsuu/11G
X-Gm-Gg: AYBFou3PnK+vQHnouu/VqcLvCdHBQzPcIp//sdN3PqNxf0w7RRdKz4XFVANg5a5tpHh
	bLzWSWGFv+P2noIbbjZBVPDiuep3CQNRiHB4TRw2tcrkynazbU6svJBbtb+RbktuWo5Bx7cfBNG
	1YaqsAwleTz2+7yJ0TUSC4yR3hCU7ubIuLQ/QaAjSpucxBSQzKdHYLUDHqrrtDKcIT4yvKwMe4F
	0B+YT3qHmIJNRwePl9XUyc8GnwAwZyxkrPGMXv1gGAqzHW999ViuCnl6J1+2pOif+W0n1xT0jRS
	Zr1hsUq/smqOX5o68NRORh5HebJKJag+EmEQqqIVLQSs0J/KhsGCawBTfPaiukO96NNO35fW7wB
	VIAatc9XnEoRVHn4Me9KqF6j6fV72cew5Ez12CDg6IzqkBz9s/w/8AiMvxGmw4O7oQizCqK319L
	mHtKwwyE5VNEcHqCL+/kuwPCcejnBydi2Qcf3a/efT+NEtuiVXUtTYWS4EwRsAiU4JBF3g6uXSp
	DnR9/2rjmZ46fTTwMa9Qfe4nU09prS/M3jTbYs9dzj4U2Omd1Z+6WuHHqJAZMIl3b8=
X-Received: by 2002:a05:600c:3584:b0:49b:96a0:5c00 with SMTP id 5b1f17b1804b1-49fc57227b7mr111630595e9.13.1789841353464;
        Sat, 19 Sep 2026 11:09:13 -0700 (PDT)
Received: from [10.128.10.232] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd115d78sm87499995e9.14.2026.09.19.11.09.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Sep 2026 11:09:13 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <24810830-b625-4219-818e-c3f9bcbbe41b@gmail.com>
Date: Sat, 19 Sep 2026 19:09:12 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] kconfig: tests: {old,save}defconfig: Forward dynamic
 keyword arguments
To: Nicolas Schier <n.schier@fritz.com>, Nathan Chancellor
 <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Pengpeng Hou <pengpeng@iscas.ac.cn>, Ulf Magnusson <ulfalizer@gmail.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260917-kconfig-tests-minor-updates-v1-0-286e5c985244@fritz.com>
 <20260917-kconfig-tests-minor-updates-v1-4-286e5c985244@fritz.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20260917-kconfig-tests-minor-updates-v1-4-286e5c985244@fritz.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/17/26 14:38, Nicolas Schier wrote:
> Let kconfig test framework forward dynamic keyword arguments for
> 'olddefconfig' and 'savedefconfig' and update the _run_conf() calls in
> warn_changed_input to use the corrsponding wrappers instead.
> 
> The warn_changed_input test needed to use _run_conf() as the
> {old,save}defconfig wrapper did not provide the necessary flexibility
> for common calls.  With dynamic keyword arguments, there is no need to
> use the framework-internal _run_conf() any more.
> 
> Signed-off-by: Nicolas Schier <n.schier@fritz.com>
This is certainly more readable, nice cleanup.

Reviewed-by: Julian Braha <julianbraha@gmail.com>
