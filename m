Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793044586;
	b=XNXatSbYeSa8tdj+lAq0Cjb93l8cce+Ogz7BejSHffLbpQ3BYzuqGBl+wvCj8ytlCb99
	 YZDQpxptSolfc3BlsZqgtapXzP8SO2tD3suYO1YrWB+asF0wjiuH3bmZEUzkGMqiwOqn6
	 7J8a9hxEpFFZEdJ39HnKfRkw1U9QumCuAlBBs3lXF4jwf9cpMNinfV1hRERo+ZGaxtZkM
	 9WGouWP9x+nV1+vK5SyboxGNzh5b2d+g7qeL0EVHp52OnJBRvfK0u3cg6uG3ZmUQS8Owo
	 fWddjAKD078cYsYmwZdKmfQitSwLQkrCNmYboryd6+DRyqihNTg/8lijlCiO+NArxLA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793044586;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=bw3zcs9OCbVxPKXmVvvf6x20lJj+kiaqirGUqMRcsac=;
	b=bIIfyNm6swrdWi4T0c3mvfOnCqqdNJJ0yOh6HqvXG4UzuCZxEHHcl3ots4mWYSjjhU34
	 A+/YvREbt87asYkXL97IC24+SZ+OKzocgiRr8jogUqjl8X/3b4/gCn3KVnuZ7lvAFb89q
	 tyfd7q4qFz4rd0fwj3DQVIvt92fzAUFQNC9+t1VzsvkHZY653o20khR5NDD5Evq9fn2bo
	 4rKEZRyTYzY6/mKhntGNdX7lOJmc98S0rJ+WejQY2ef4eAFO5RPHSJF2/TPNXnVYdtCRH
	 PDkVmln1OxSln1lIHEx051iwurZsV9K2gNUuQKg8DloL+HXxxnmVumBo5MGVYa899Ug==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=miget.com;
	spf=pass smtp.mailfrom=miget.com;
	dkim=pass header.d=miget.com header.i=@miget.com header.a=rsa-sha256 header.s=google header.b=FjhN2fOf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.50
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA4C1606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 19:56:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA4C1606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=miget.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=miget.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=miget.com header.i=@miget.com header.a=rsa-sha256 header.s=google header.b=FjhN2fOf
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-847ac7ccd85so2048547a34.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:56:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793044584; cv=none;
        d=google.com; s=arc-20260327;
        b=m4JDVXnSf9LDoU28CX7JUSC6fIRu9XvJPmZP5z0Xh2uHF03CDZH+cRDBqaXGS4s7q5
         1LRElU00nPCEBn7nRCQB8cPDCQzYDI3Dn6cAOoxurndg95q2XQd8sa6T7j9DuKvPWKlU
         i9DO45dWiE74GOXm9GzmQ0mWRElqsPXUVHxSTc3Om5O8yDPdtbpNOOYktUmCSi8qEZqm
         GInXu1lRYFcsAf3hMsuzi3iRv/nSd4Us39Y8Koz2rcB3YKwBODZinJsRzyDOj9repyUl
         pDiRDAda6l4keeKtTa6GH717Hxh62i9nNmmb4f2juloUR91ImNfdDc0IXKyRI2AW58ro
         Y/Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=bw3zcs9OCbVxPKXmVvvf6x20lJj+kiaqirGUqMRcsac=;
        fh=ly2sjeDV4RoSbpwlLZI5VSkS3TnLk+8yT2SdH/2R27Y=;
        b=rAZ5FksnsUNDhD8nL+IifdO7wQiBgbElCNKpdcKzNW6EL8k2/xCc0q7sViZ5SCJdb2
         VtJ75mFhFEwsGBj8W4NHQmGTQUGCPxCdpHO5IjeJEb6mooY6vRXZUYH7VQinxxfKv4LI
         kBls4x8w6HVzKtuqM1IKh5X/JF0WAZaurkc7NdLuQkrru1wKAAUXa7jieBp7QHJI5DBw
         HpNw3aannTtsuOQliYjCfsrQxoegkvlWsFKubfZxtOElChbaMHcX0M/hrJ/v/WAAoWH1
         kDAqfWLhiq1B9T5cETcQ+btrrf5d6JbFaygiZ/JwOiIwITpQeLp4drmTEVGSf+mZYKyP
         1mmg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=miget.com; s=google; t=1793044584; x=1793649384; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bw3zcs9OCbVxPKXmVvvf6x20lJj+kiaqirGUqMRcsac=;
        b=FjhN2fOfBpI+cGXLqptMyf5A3sfLAycYcl/1O/P8veG5Wrp5iImAZYwHLYg52VIxzo
         XCsoJvap1YePFVeOH7weMMUUjTw6LH8qriINxJYH56dnO/SaM29W7qUFLptNqBEApdJl
         CeZQpPFJfzd+kkhA5pNd8K8scvu42pKl1os6M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793044584; x=1793649384;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bw3zcs9OCbVxPKXmVvvf6x20lJj+kiaqirGUqMRcsac=;
        b=gg0CQVSLmRd6rzT5VGF+KJdaVCVqR6VBPkGCQue2ZxVtnALh4LCBHrIl7Idnp6dvQR
         sPSiq9NneefjZ9uhSyerQd1TYA5mSHgxud4WtI+PCULEcZGRyEwi0yxk89tTSbwCLSW3
         eapvXlMJZ46UaW/RdNXHNavzyGbGtk6BPSHCvw2Yo7/0DTk64l4RFk9mp1NcFlPb13cG
         qkZlssrcnKxV8zH00BztbjvL1A1WBw/Zobp33bMBW7kWp5ntJFtWn7IqA//ZLGut2jgG
         zG+afDyn1BPiwX8zH/zds24OeUkKYUQRxntS7TiPw5ndsv8myYeH5RMYjeuPwTtDF6xg
         EZwA==
X-Forwarded-Encrypted: i=1; AKwUvBy034DTlQOSs/8scVAuF9lox8dcDw3xZGe7QrAuToXd/v0JGrP3wqN2DfuLMppzKycIjE4+zkeu8BU5zuc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIM4UcHLS85FUIdEQtwiY9Dz+UgaQa0l7alDeHVMrfmPEDuaPCU
	tovsyQRfPqJ86bghCIaQI12rUMlg9shYDgdTKISkcxKcfkmJocfodTvbM9kUF24t/7LbLX5ySPw
	lDsI13REZ6VvKSV4Y10w4G4FMg2IQxTPz2YXrySP1gQ==
X-Gm-Gg: AYBFou3GTEZz0JJ8GOcUl7Oyr5OtC1xspTTsSFkLVuskOhzyWfDjGTzsOQOg+nOxVQV
	Ru7dVq8Aqkhwiu2HAuUtbrrlh2GwqjfUFvASUthDEUaGmkqxZy8wR4Yxv/c/iqeiGZAwMlqbYw4
	+2F3PTCuMkQzIYSowxAO7nUSoDtGEDD9IKLaxFsTgjpz+GE6L7HtdnLhBzFcUeaY9gixP6b5JMx
	UVGXpBtZmsFMZ4Na2t6yUbkpux+3lakmqa+TrUewC+VFdC38BeBQYqhzetkQhMpgJulxieB7Mh9
	JBAMh/Jxz6bPv1ihIYsJQdsYS5BFBnA+7THyT2cdvq02X9T2MUaVlr5Fyd8nNaa+vKgGbnf2QJA
	hhZ183u12rQTEtAmzys/2ujtyb79sntCVefDz4fg251evkvr/rbmztCf5STC94zJ5LS3Cg/sjNm
	dCnlXIY1RPPYLPJmYOjyIBKOaRJaw=
X-Received: by 2002:a05:6830:2b22:b0:81b:ac9a:5681 with SMTP id
 46e09a7af769-850ff682860mr6894572a34.29.1793044584271; Mon, 26 Oct 2026
 12:56:24 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026102101.224568-1-qby140326@gmail.com> <073e6aaa-12dd-4fc1-b7dd-4d27cb4e27b6@kernel.org>
In-Reply-To: <073e6aaa-12dd-4fc1-b7dd-4d27cb4e27b6@kernel.org>
From: Chris Taraszka <chris@miget.com>
Date: Mon, 26 Oct 2026 20:56:13 +0100
X-Gm-Features: AclHuK8ub8G2xNuOS2jgi3E8TzEpZ4ExekjfnHkszraiohKuf5vnnUyhTeV8DHc
Message-ID: <CAAcRvKNvBKwVcPQ6vv-+OGZdL2Gxd-ocNyvZO_q-g083QNfR5w@mail.gmail.com>
Subject: Re: [PATCH v14 RESEND 0/6] Merge redmi-wmi into bitland-mifs-wmi
To: Hans de Goede <hansg@kernel.org>
Cc: Mingyou Chen <qby140326@gmail.com>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Ilya Gladyshev <ilya.gladyshev@linux.dev>, KentoNion <kento@kekto.ru>, 
	platform-driver-x86@vger.kernel.org, ted eric <ericted8810@gmail.com>, 
	Armin Wolf <W_Armin@gmx.de>, linux-kernel@vger.kernel.org, 
	Matias Civadda <matias.civadda2342001@gmail.com>, =?UTF-8?B?6auYIOS/iuaWhw==?= <btx342@gmail.com>, 
	powerfullz <wleizc7319@gmail.com>, =?UTF-8?B?5a2ZIOiqiemTrQ==?= <wolf109909@outlook.com>, 
	=?UTF-8?Q?Milo=C5=A1_Vlku?= <vlku.milos.fun@gmail.com>, Rsplwe <i@rsplwe.com>, 
	Bozhen Peng <bozhenpeng93@gmail.com>, Anton Karasev <uselessfire@gmail.com>, 
	Jame Jao <jaojame6@gmail.com>, Serhiy Shliapuhin <shlyapugin@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 26 Oct 2026, Hans de Goede wrote:
> 1) This assumes the event indicates a platform-profile-change has happened, if
> it is a request for a platform-profile-change then platform_profile_cycle();
> should be used instead.

Hi,

Some data for this and for Mingyou's KBD_BRIGHTNESS question, from the
Xiaomi Book Pro 14 (TM2424, BIOS XMAPT4B0P0A0A), traced with a kprobe
on bitland_mifs_wmi_notify() with v13 on v7.3 (v14 has the same event
handling):

- Fn+Space (keyboard backlight) sends no WMI event at all, neither 0x05
  nor anything else, and does not change the backlight under Linux. So
  this model cannot tell whether the firmware handles KBD_BRIGHTNESS.

- Fn+K sends event 0x28 with value_low 0x01 on every press (01 28 01 00),
  not 0x16. The firmware does not change the mode by itself: the
  SystemPerMode value (EC 0x68) stays the same across the presses. If
  0x28 is the performance mode key on this model, it is a request rather
  than a notification, so platform_profile_cycle() would fit. 0x28 is
  currently logged as "Unknown WMI event".

- On Windows on the same machine, with Xiaomi PC Manager not running
  (it fails to start on this install), neither Fn+K nor Fn+Space does
  anything either. So Fn+K looks like a request that Xiaomi's software
  normally acts on, not a mode change made by the firmware.

- Mic mute sends 0x21 with value_low 1 and 0 and is reported as
  KEY_MICMUTE, as expected.

Thanks,
Chris
