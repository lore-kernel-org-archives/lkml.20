Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794253214;
	b=ig5lt/ZyEOp+KozRbSxEYDabJvBag97/7Lc+eym1zN5jB+5uHTn5daivhfsQ9mbmneKo
	 nLWLo8Up1GMmv6FNlG143qYSIQ3nVSpxuwvo6ZbP8TRx5Tdk34y6zYt/9PWJdG24zqQ27
	 CtklBW9pdWN/Tp1kQRJU1JHcKRZkn9pUGChn65zBp28tAgsK1VJpked8o4kcYVmLAnEaB
	 ybFSb7/46rirQMEr3svjslQx/BrxNUhRPL9paC25D0WAcGLELyDXeSMklGbPF+kr0MqSZ
	 JsI4CrbnEf9D22nLfZYu/SXhTjtKalFidbRknF9zAUbOHjQuIUThJjBJM9Rc2jP+nGg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794253214;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:In-Reply-To:References:MIME-Version:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=UTqecpq4mCjlHgsqGbaWqa8tI9zFEKPt/FYnQB8tTfI=;
	b=cvegSvH+1JFolxFQS2vcogJkiRzWiBPY57O17kkRtXu2WcSGw8XSGDjnEvM+WaQIT31H
	 EhJPzetujniWYzNXN9QzGUyA8ooWtPHMcO9vwMHFk6HgSmz6k6KLQY3J0pWKHHTw8rCj9
	 xRx1dHzn79i4+BGtAN43TlCCNuyT2bAmzLAgMxF5sLF8OO87/wyUXc2F4AvigGZoPUbn2
	 IcmdUs5oyf99OztpQ/rGvP2VuZX/kfw2o6K9JfoDaxfq4hlDMRiV0TZqgqsSrj8hU3VWd
	 X1clqCvzyxdL2gToPXJbTPbcnBGRTIMRvKRUzBo45Ton23icBwZgrz08Qfo0pbOSjzQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=OZgOtFqT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.50
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E253A606A33B
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 19:40:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E253A606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=OZgOtFqT
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-91ccfb88e4dso16209216d6.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 11:40:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794253213; cv=none;
        d=google.com; s=arc-20260327;
        b=gdpaA1prQbrw8d0LI5jONGiN5ITZz/zN0blWbY4DVk1akc5V4cOGzXlFSU9qCvem5A
         v6WXtgTRXFaaaRsxClHid/fsl39BaOVLZW3o3M1YsKBW1sCjVyt0BoRtC6XqR73zEfFE
         ltk3Fg1hg5/h5POdSx0jfDUG1Pa8p8xT1ZPvztXIdLYrywZOjSIwSGHFoxLTgJaKWLBz
         TUeDVPZZyiVpcI3ImszAh7janDGON9fYMlrKmGWKrpGjufJL0/Ew8Dq8xINghA8fJpnU
         JEoer2NtRk4Cvq5/uaBYBuZK1k4h+rMXvhmfEWOOuQiOpTbw0B5T0wZmRtD5vMSZLKF5
         LUpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=UTqecpq4mCjlHgsqGbaWqa8tI9zFEKPt/FYnQB8tTfI=;
        fh=/P9BHHBM6jP96IcLliEwE48InllWMsVuBSbM0VxqDYo=;
        b=ntBTPueP8+codYPFuVKUWZ+AiPdAdDI5brUHOjhjMC3te1sK2Cuv5Nd4IvH0T1Wc//
         RmdxQgeqEq/2vRU7WESQUX/NuzzQ9xEyXT1Gd571eGRievF7hwoDy4loJApiO0euU1yd
         TP6LHErxsI1b6yCJclu8ir4P+VeDZrsNKCcSxVlHYwTmGGSJHVebA/5A88RcutGp5OSz
         o8qrKRd2WAJoHZHPDQ0S88V5wRoUt96QerpNX9kWa/A54edYLaTjiiAHciyte42DpJxC
         U/cVEYZS3sek/su0pwM2jc2ej7ys00y00frBdFNFlumw8rqR2Hb9ScWDX08uUpU9Ah15
         Vphg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794253213; x=1794858013; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UTqecpq4mCjlHgsqGbaWqa8tI9zFEKPt/FYnQB8tTfI=;
        b=OZgOtFqTTqmNU6HzUDZ04a/TGSA38D4fixpZoEEPnUj4KhhafT25CiiDv9VDIn0ImT
         0cDtb7mJ40WUX02kyX3M9uTJYK/hWi+KE+AQxYnEPKSELhMlAFsEfyVg982+N37Ogsil
         5TWhUdm1q0b/x4tVdvupVgshnkw9azWKDnI0XbEnPcWSTqLHILPj6otmwaGVgynJrY4F
         CZbiG5Ae6S89hHcC0i13A5tRNpDtLxLKlLrWkC7eDJLbij7XpUM7kfbtZ1eHulY008fD
         hmShvcVU9R/KWfN/IdSRoCw0oGMBP0uhvZPA1AmxzWcM0ymFk+8WSS0Le3ZigH04eTQ9
         +RWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794253213; x=1794858013;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UTqecpq4mCjlHgsqGbaWqa8tI9zFEKPt/FYnQB8tTfI=;
        b=vwgiPMQvtdOTTeGwfdypcZIgJgrU0W/H0hJHuTlU5KkKWT92zgV0VbMpUZ/jZly8FZ
         wmybItH1I4/LNxLLLlzPxHAnqfcIyvt0mc1kblERtae/L2sO1Z8CU6DFw/3dp0NaeyEO
         6pFDqhZyspoj/gzhXpEB9ZbO4ICtrMiuQ8sRiIuG3t3fAKoVqiprZnsDbm1EiHb3Xihx
         0kuPi/Ie88XP/sy5SvfcGDj200vLWR5LWOZCeL67zOqHruW+E1nrDNkORwfSLEyb8iAk
         U0Iam8Q4wCpKdsnnFOqon5MtdYnCpHm7D1Zw/55R1YdMawMrxZhHFBaptBYT7bYwMJw+
         4VwA==
X-Forwarded-Encrypted: i=1; AL+hErFjGF7/Ciyt8YA5Bx3Zpjln02wVMkYx+kz/j4ZwwJAaohU4GYxwREgwxUJgziWu4Jh2C9MQf9uIZe2hYZU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/B8WspkmE0M7YWcavqH00EzaRnn6LSzgbxAtoUxSO2Uwd7rSIy
	hLLjj/mywP3zn/Lqs3jStVIAq+2x8Xut/QkP/pHYNGyzTx2eENSyszwLzPRT/2T9oV43oR7S33d
	czuY4TtwQidaw5BAm2D0WBQE64H1gW4rUnzJDFUtQ
X-Gm-Gg: AYBFou3A9w/nAFBRPIMN6wNpRBV9w6fE7Zt1pXcIeL/T8TKEV4CMeiiczi7GaKDdQiw
	k6/5UpPoZtf/Y7h0RiAAi+txC2C1f2FZZqSGjTxgrY5sOI88nNK6Af9eaVQPi4OWxOQH9GxQM0Q
	4CHc4S7uHrQ5njZz4+mx+4Pvv39q4wetCR1JB+sAMlBQb3pTkKdJYhTFJ/IC66QhMPtUQ54C5Nx
	eVLYH4XJl3KukP+b/MVeNL7d0uYJdSBf9NqdJGCV35F/5ybD2R6Gjz1nxp2/WiFGXezY7ltQWDG
	lsjP785pOY666pCESvi0PYhexFCr/ubVwyMAutUj4EGQWgaD1pp7uF0WR+oYiN/bTrXH7yyGzM4
	AtNLAjTSBmbnR+Lv0H26bYdhrIUBj3CN5K0V8R4l4Z12uwh7eTa7lacuHMZD+sWmW5RZlzyJfTV
	zvV/0PUqq26L0Nx8jEBbpO5OU=
X-Received: by 2002:a05:6214:1d2f:b0:91e:9437:95a6 with SMTP id
 6a1803df08f44-91eef866f62mr11481566d6.47.1794253211943; Mon, 09 Nov 2026
 11:40:11 -0800 (PST)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 9 Nov 2026 11:40:11 -0800
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20261105-tdx-selftests-v16-8-2024e8fa517a@google.com>
References: <20261105-tdx-selftests-v16-0-2024e8fa517a@google.com> <20261105-tdx-selftests-v16-8-2024e8fa517a@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Mon, 9 Nov 2026 11:40:11 -0800
X-Gm-Features: AclHuK_q6pntXPEETCsk4rrzlvTAf21VT6IGAyCXiwifcwkt004hhyyHMGQSvVw
Message-ID: <CAEvNRgGL7B_5q3N0Jc1dtSj=J+ywOXaSBDx+x9OWn5odMKN5Eg@mail.gmail.com>
Subject: Re: [PATCH v16 08/20] KVM: selftests: Expose functions to get default
 sregs values
To: Lisa Wang <wyihan@google.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>, Chao Gao <chao.gao@intel.com>, 
	Chenyi Qiang <chenyi.qiang@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Erdem Aktas <erdemaktas@google.com>, Ira Weiny <iweiny@kernel.org>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, Kiryl Shutsemau <kas@kernel.org>, 
	linux-kselftest@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, 
	"Pratik R. Sampat" <pratikrajesh.sampat@amd.com>, Reinette Chatre <reinette.chatre@intel.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Roger Wang <runanwang@google.com>, 
	Ryan Afranji <afranji@google.com>, Sagi Shahar <sagis@google.com>, 
	Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>, Xiaoyao Li <xiaoyao.li@intel.com>, 
	Oliver Upton <oupton@kernel.org>
Cc: Jeremiah McReynolds <jmcrey@google.com>, kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

Lisa Wang <wyihan@google.com> writes:

> From: Sagi Shahar <sagis@google.com>
>
> TDX can't set sregs values directly using KVM_SET_SREGS. Expose the
> default values of certain sregs used by TDX VMs so they can be set
> manually.
>
> Signed-off-by: Sagi Shahar <sagis@google.com>
> Signed-off-by: Lisa Wang <wyihan@google.com>
> Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
> Reviewed-by: Ira Weiny <ira.weiny@intel.com>
> Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>

Reviewed-by: Ackerley Tng <ackerleytng@google.com>

> ---
>
> [...snip...]
>
