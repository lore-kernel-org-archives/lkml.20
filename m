Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793804344;
	b=YMd54f8AvVtKbcnbjnX0W5f2nIKkJ8R/byY2UN8xknez93S1pjUhhJ0O8jmhOiPYnnRq
	 dpxRS9iM4fwm/APMk5z2njbJ8+/kQ0h9I0vgIJw+71s+xe/mXdF+y3AWclViZG7dsEVqX
	 1B2pxxdL7ubbxZKKyzo1A2+YxfYsq+PQ4kBWytYD3vLlyWweibFOCvFQkDNGTkeMqrLpr
	 g9MB0VCa3U1D//wIlZs1W0tAY9NUiPFi4Cq2LbVzxzTLjtHJoaXwRuSKqSodtxnHiw9Lb
	 IvdyzSM3vf/zkBiqylQgJhz/8gV+YR3Hdee0Q7qT+DaXW9cLguP8Ye5BNwmU3uNt+Rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793804344;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=7D6x1Dp6mI/Rlx/vQP/e1zXfPUoBpQC6+8DIs4MGR7o=;
	b=CK2up50a23LslWRO0iJHCtnB4polPb1bsGVP16y0sVCFcGk37ULPK8Kul7Xxqq05ZLPu
	 9J3jSF+WKdgze7mjxOeU/EafEGeUg8Oq5wb6IiEtr8acGTF84kfUDILqbuLHuFC5v8Qh7
	 T/6X2s8Su2IkRVdRs2uny/TG7P+nzpfHqPVT51WZa1a/z5eHnEhl2/7p4cNB6LWK6NCoi
	 e0NTEMfcrz8f/TGxtoNbrD3wEwGJW4z/s1eIZCWylZOfcp4iGfmKW+qw2+nVcn5Vv1kFZ
	 Xv1kjHvJZrblrkuvlOCbx6Zr5CpvqJQ5OYBqjh5hETjxyLHP45pTcWC2OXmXYBf2HHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=evalinux.com;
	spf=pass smtp.mailfrom=evalinux.com;
	dkim=pass header.d=evalinux.com header.i=@evalinux.com header.a=rsa-sha256 header.s=google header.b=gAF7700m;
	arc=none smtp.remote-ip=209.85.161.41
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6757606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 14:59:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6757606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=evalinux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=evalinux.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=evalinux.com header.i=@evalinux.com header.a=rsa-sha256 header.s=google header.b=gAF7700m
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-716d052dc23so17514eaf.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 06:59:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=evalinux.com; s=google; t=1793804343; x=1794409143; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7D6x1Dp6mI/Rlx/vQP/e1zXfPUoBpQC6+8DIs4MGR7o=;
        b=gAF7700mkg0MgjE7QcFfit0kgEiol5BK7FjqB/jMsx/yv3o1/HO+qcVuNUImPd9YgF
         Jlr3/hxQvUIUjpDIZsPrr2cJg16Yx8hZPnBaCbVgcov0maksQ84D8S8L/6fTLf+nAZ9g
         YqFkuqqyqtKP3jF93Jajjp+DfgCkTOJsVrq5olUvWJYWyk+Sr1JIiHp8sCitojeQJc3W
         NRzvGMoe2oJtrDXth+O1NfVUBhm2aSOjPTW2YdtbxvLRzhhv3ehInxOurUUt3/hutFNz
         9DdhBWw2J+/CpE3wLu3Go0paJV5dEpzmmfNld4KNlwHBj0e2g2SEim0bNwxt4VxT5eFk
         qtsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793804343; x=1794409143;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7D6x1Dp6mI/Rlx/vQP/e1zXfPUoBpQC6+8DIs4MGR7o=;
        b=zSvhR35xfa7z7NGwTo/m+hDZb1/syCTWwyzh8cGm/LisGrUrlLpc15w9FW4Ri0XaX9
         BFctMLKEYsAXJbFJbxV/ot5aNhgBolaeBRiQEigH26BLEcWPA001Cg/OUfan+W2mq5Im
         lVpcYVo9ED9cQZAIsSjn3BuazzwkJCeBJM2/VBwzjDprQSwPXihY9TAcRFzbvsr4sKvo
         qLklUl5vwZuvmc2nrJBdUZ+XIB2x7m6Z41gnpSiOl8vtAGRhIP8eiXiqO21DjbhzIcGE
         9sQ8bDzc2fdOeZtaN00AQk+ezOZIcwLsdzDy8WGCovdvF6NbK8UsXPZZ6X0MfFaN6f8i
         7EDg==
X-Forwarded-Encrypted: i=1; AKwUvBx47yta5WfUmcjVFzHBeU3BFVEfmxYymMgRujZVrybuf0zrFsNWM33KdeLB9jD34pJsOvRcGD59dStbkn4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8HECzPOcKE4AqUjhrz1HiKuuBMP843HsB3FIYH7lEdvDsxofSW
	aQPiEaM20TGd7l0jU1JS2KPSduHehOT+cm71mSQK6nF3yPw9Y4w1tQJ/Z6I2CEszP4bXVSgNRBp
	I9d/oYxVz6g==
X-Gm-Gg: AYBFou2ksZrV0Wo8P2E5Yl56yzCxkTNA9rh1+wP0vUqMMUUDZAVBM9UCicq133fAGoJ
	VAAmGBI4HGsIgYaqgsD2MkXWvWxG/P6XB3CjYZgyvls1M7AWdma3J7+S1ca+BHqRkSBeg+MgTe7
	8gGc7hhy0csVVGG2o3iDDit9M+h4Im/t5ygPgWQKvfs5wYRkuwWxyEwYJ+Co/yfVOUuWqLL1Z13
	oHmEgPicjXDIotCBqDe3JIhVwyN/s8qObcfoezKno6SiUO4/bI28jEyyeI7GdJ4PRlxGfUlqMn5
	JKJmQqe1SgOc/cEcyvIic1XpPoNrM0Ek6On8Y1ot6/97mFCRC8d3iLCsEyuA3HcEgveeXF8tEUf
	3NGLuDkKaFSyG00jRTwuwmnsad5fNHypnYS0nEQ6FhCleH9MMtNzM7Bw+2OafQjriQolM6l1Yls
	ZnR3xpzLeKTaiCxzYYig/EFzgTGbn4dRkGXGwqYJNFVSdSw4Ws0/zHkyYuXhWZzT+7lOx2LL3HF
	InBN5fePGs6u54RilLmO9BCYXlLzfSdOdLuZ2b/OdtBR4EfDnS4GWPDnX/HNQ/JL+IV1VnA0AfW
	dnVJj4gvoRKroq7N+rHi912MY13y1BozgTa0o0oiDsqyR/duQrFVs2pfyQ7abs4r9/t8AdLT47F
	Qo5Rf5b5csYlFiTkD
X-Received: by 2002:a05:6820:c3c9:b0:6f9:91c9:4e55 with SMTP id 006d021491bc7-714f29730fbmr5644169eaf.47.1793804342753;
        Wed, 04 Nov 2026 06:59:02 -0800 (PST)
Received: from desktop.casa.g02.org ([187.247.185.7])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85ef3dd8e0bsm2019853a34.11.2026.11.04.06.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 06:59:01 -0800 (PST)
From: =?UTF-8?q?R=C3=A9nich=20Bon=20=C4=86iri=C4=87?= <renich@evalinux.com>
To: Weijie Yuan <kernel@wyuan.org>,
	Dongliang Mu <dzm91@hust.edu.cn>
Cc: Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Steffen Klassert <steffen.klassert@secunet.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?R=C3=A9nich=20Bon=20=C4=86iri=C4=87?= <renich@evalinux.com>
Subject: Re: [PATCH] docs/zh_CN: fix stale :Original: reference in xfrm_proc.rst
Date: Wed,  4 Nov 2026 08:58:59 -0600
Message-ID: <20261104145859.766328-1-renich@evalinux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <autEFEW15g5I0oVT@wyuan.org>
References: <20260920073144.546566-1-renich@evalinux.com> <78d0a4ea-d621-4408-8efd-d8c9bb1f6841@hust.edu.cn> <autEFEW15g5I0oVT@wyuan.org>
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
Content-Transfer-Encoding: 8bit

On Wed, Nov 04, 2026 at 10:41:24PM +0800, Weijie Yuan wrote:
> On Wed, Nov 04, 2026 at 10:32:43PM +0800, Dongliang Mu wrote:
> > I have proposed a patchset to revise all the inconsistency between the path
> > of Chinese translation and English documentation and these invalid original
> > fields.
> > 
> > Please refer to this patch - [PATCH v3 8/9] docs/zh_CN: update
> > networking/xfrm/xfrm_proc.rst translation
> > 
> > https://lore.kernel.org/all/c641a11c-39c8-40c4-b162-10f3a3db57ff@linux.dev/
> 
> Ah, I haven't had a chance to look carefully at your series yet. Then
> this patch can be discarded in what's-cooking.
> 
> Thanks, both.

Makes complete sense; relocating the translation to match the English
directory layout in Dongliang's v3 8/9 is much cleaner than updating
:Original: in place. Please go ahead and discard my standalone patch.

Thanks for the review and follow-up!
