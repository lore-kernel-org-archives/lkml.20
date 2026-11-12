Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794491200;
	b=KZ9Ib4IVasQ5D70jdaIwUDwXumy7xjq+NVUwR+ENBP1Sr859J7QevPJbJ90XtzcwVRrM
	 bsnFo10RtADPPm1tXa25FgzcOsOiTGZ+7HiEaq1Qv/av+k6dRrrtxRHyfjLDbsmc7a/7W
	 aVXHd499I3qWtryWQUA1foZ0r+hz/265ZqprftEqlWnkKcd1Epony3BjE2FpQgZpgmg7X
	 UYU28BByzdr4pdDtNzaa+Z0vgD7nTjDRmpur7dr6bQBYXnDd+fM1hRZeexksTh04ISjtl
	 lt7yTdMAitXp2JOVjbWC9pw5et46oGfNXOLamxAn7hL0TxLtUTjXYA6m+8o59k8zCmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794491200;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=2yGUa3yvv9BwAmjth7xVSNIdT1WjubKlsaL334MWC0w=;
	b=lpgT5uaQ6Cx2M/XL0T2zTVPAvXL78TJXOIwAnXQKXtRZtmr+w8rBwK+WstgpKHKW1agC
	 qk21ZAseRjtAKGTHTW/SAT4PMFQ+P7y4o9n1QghW34yG0jUrWW2foNxtYG3vT9X8JpYbZ
	 0602dNITCJuOVCyGUIa7NCeAMaJVHBLIylNz+Q6E21D9HZk3nVfHn+aewggDCRK4gdv79
	 01J6HAEexuuJm8D84gDt+PPno2gbo1eWAxLP6/0i3TFyvh1qKF+SQBkI/jJESFnly4Rb2
	 EBEG5Qc4kE3bxoToeC/CktkXsXHSk1qsY9nD4F1Rc6kqaWZvmX7ISxZUiyvym92YB7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ursulin.net;
	spf=pass smtp.mailfrom=ursulin.net;
	dkim=pass header.d=ursulin.net header.i=@ursulin.net header.a=rsa-sha256 header.s=google header.b=M35LRWQM;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39DA2606A331
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 13:46:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39DA2606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ursulin.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ursulin.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ursulin.net header.i=@ursulin.net header.a=rsa-sha256 header.s=google header.b=M35LRWQM
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c4d2b741ed9so675752066b.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 05:46:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ursulin.net; s=google; t=1794491198; x=1795095998; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2yGUa3yvv9BwAmjth7xVSNIdT1WjubKlsaL334MWC0w=;
        b=M35LRWQMrNcnZaf9izfF5L/wkiTPEnRJx/eRvDaNfpJBY1/h8gufbYUi3BPcZnP1Lw
         HRdkM95xUNpJBGKuIaU6Bhhfne8TOE7e4ILfhaKOQdjLQgzvHBNNlxB7m5VVYJsSNS3Z
         GrpcAFxsgeIjvwJfpExEXIXU8qqqnkZbfq9uBetitGS/hAtMNNwD4wZ9idVIt8CMFKSr
         j2AYz6dKzOt9EkKi+QtL+R5jvl01hexjRgP2+JthKkfiYX8o+k6HLgCiuSss/UieWTfj
         F6rIg8nsIuhxJ5GxWoQz/LCKdn5i2YmFMoTyN8bU45Rhy/Kv3Nlm0pZnzHWbPWQfaERT
         bchg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794491198; x=1795095998;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2yGUa3yvv9BwAmjth7xVSNIdT1WjubKlsaL334MWC0w=;
        b=cUyg8iNb88XmMLssnBILXMYjELMn7xqqpGJSsrwWrrahMKQBBrNbIf/eGKZKpgvCfy
         hpaANV46YEJKGEoF1IqhUI6L0vur0Cy7qQxPl1KRB2gZSXuBWyzuwHqBOdTT6S1KlmTJ
         d7z/uEln1gwLPZrIOuP/thL5T58AflAM/6RS0URNYMX+/o8wX6GOE6Rj+aHWG46zy3No
         uA/n/vNLBDFlUPcL7v74wwFHU5a2p1+f1rAruODP/CSGY4+cbx7Mdezyzkjp2C/1pvhJ
         fP35NvCiaX7DLH6traQ5g11a7ManjyRip6ah3ixsDL5EDdYinQZABiAnC2t+qcRgXRSN
         nrhA==
X-Forwarded-Encrypted: i=1; AL+hErFgNYr2pMvJD791gkUDQXYi5wXGokSfroDERdFCtRr+kKuYMpXxZfrDKCBmIR8yTD95LchCYZ/I0PZkqD0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Pj1CqjP3someRERbdY/fXcwcfyca0RByt7vPHIrKSxIBudoqo
	PcUxmvDx208NlfFw6nh6ByULGm2RqGoiSbQ/XDpgb/pb1J/hkz+goXyBcWmKIRPDVYw=
X-Gm-Gg: AYBFou2edSRiZG5QxsjbbbLtpiDMDF9tncQ+5XlkT+tkksfEfB+rAyRqHPEBd9tdE3e
	mcyOCYT6tGyILxNiFjrFulShE/W0Mexn3sjSu5o7Y3hk8l6fvTy+KhExcpTQbm2Fds62BfhqG+I
	L5+xiC4RjK7oROQXcLwvlgxcZoab0v7f6XUinIzITBF8+sNUmEbdQj3cfofo5wDkmaaWt4INRbZ
	/20fiwNpN5tL45kiE5TQWl9xk92/gI4Qw/cjp3cMTUCDQOJTOnM8AkW4b361Vtr+Zl8G2bgIzv7
	GcQKWC60418Kduj6ooWawBmErDejjKwLCzXU1fm4We3HxU1jUKafdPTU+7DnvcRh0vu7bjB6T4y
	H+6qSafE5Bj6Jj5UrbS6y5cInmpygpPqLvhAIAWGdh4uyAxnhHx8jc9sYFCyEq/aKCnS+PKSg4K
	WyLZgyR+nf3zsFKuGVzjagvQoLdvjW+X7u/b4K2/Qdgb08yA3Zb7KqYuQOMpzRvYSUxW+oW4yV3
	7F9VyQa3Xm/DO6Fh+sYuKoA/N2D7+b993/TUxBHYeEh/Ryn4o5h4rjrB2PO6A+MV0dpeXFel0SV
	I/PHCQ5DWzspWpsYEw121Yjxy+mSPqL+us1aJe+ghqLy8w==
X-Received: by 2002:a17:906:f587:b0:c4d:31c5:cda with SMTP id a640c23a62f3a-c5066ae249bmr493311766b.21.1794491198313;
        Thu, 12 Nov 2026 05:46:38 -0800 (PST)
Received: from [192.168.0.116] ([81.79.79.1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a5d54bbsm349754666b.48.2026.11.12.05.46.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 05:46:37 -0800 (PST)
Message-ID: <fc21d057-be4a-4cea-ab92-0951c4eb7de2@ursulin.net>
Date: Thu, 12 Nov 2026 13:46:37 +0000
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
Subject: Re: [PATCH v4] accel/rocket: Report NPU usage through fdinfo
To: Sidong Yang <sidong.yang@furiosa.ai>
Cc: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>,
 Gyeyoung Baek <gye976@gmail.com>, Philipp Stanner <phasta@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261103155338.1949294-1-sidong.yang@furiosa.ai>
 <a9f016ce-f086-412d-9ca6-6608a41840e5@ursulin.net>
 <33ccceef-3498-426a-ae7c-a8bafbb88992@igalia.com>
 <2ca12f1b-89f6-4069-aedf-4e5d645e8deb@ursulin.net>
 <au31m2jC9SmQ6iZh@rock-5b-plus>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <au31m2jC9SmQ6iZh@rock-5b-plus>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 06/11/2026 15:44, Sidong Yang wrote:
> On Thu, Nov 05, 2026 at 11:04:29AM +0000, Tvrtko Ursulin wrote:
>> It would just be adding u64 drm_sched_entity_get_runtime(entity).
>> Nothing else would need to be exported and the implementation simply
>> locks entity->stats and returns the runtime. As long as the caller knows
>> they haven't destroyed the entity it is safe since entity holds a
>> reference to the stats object.
> 
> Thanks for the suggestion. If Philipp and Danilo are fine with it, may I
> add drm_sched_entity_get_runtime() and switch rocket to it in v5?

I am neither Philipp nor Danilo but I would say go for it.

Regards,

Tvrtko

