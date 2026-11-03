Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.214.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793726905;
	b=P0XN7bG20qKavpMtxkDHgYpSrqjuIWdigDp4J5HnW05Q67VV2viWkS5zFAUFz+RTUGwO
	 oag4p3IVClP4Q0RS38lFGFXBNXahv37oBGDidogIU1YlSv73ThhEyM7XT1QjFaCVRcmZi
	 NIAv6tQfTDkfYfTIpg5mgp02NEO6ZYujOKgmVFgolXLVGsw6P1nEgal54NEUqj9c6vmNc
	 Xf7VnrprynVjrMxZAuSg7DONvveoAU/xZiT/LcsJV58YnCl4zhS3F/uMRqfJtFeoZlKVk
	 THiImCbV19kuDna9FDhL+AIg+X/WbaAZdxl2uwdEXvxeRNp6ruY8l9JORMeC0oDXNrQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793726905;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=kEBpiJ283G+BfgzwSR839fsCo4B4rRemOVjloruxGD0=;
	b=NbgaDjPa6sSS9b4wiBRNRlPRtnM1G3sqEI2ckw9ueo479AmZIDK4SCSPdIblQXBVDz2o
	 9P8wJ9ymby+FdjataXn3WnkRSNKTKrdvSxH/el8uPu4vLJTi/ZkR23s9EYYKLNBiJsz7y
	 A53JHsTIDuybSh4oL1jU/SxKbV+ukeVJd9SKCG4x7FOy7suI8zN0rJqYYyzW4uegAduwp
	 m2U3wqaEGmQdHWR2Rh4nH6rXNOKGySO1baRZbivPFjB0ZxzV6f2e2nz/Jvsu1ILb2JEHW
	 KQPq51ox/KRRJZbOYbYUT0UP6LBf+jsiSD8isNTRqYnUemxFmxjOgxrkXJYv6u3KEIw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pm7yUVKT;
	arc=fail smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 110C4606A32F
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 17:28:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 110C4606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pm7yUVKT
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2ea19c28a50so8350325ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 09:28:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793726904; cv=none;
        d=google.com; s=arc-20260327;
        b=RMR8VxtRPcjZXm8PP4Ur3+/UJZg6co2EeLuEE79PWtp6wxghtDd56IvLmCONIciBTW
         eb9YTLblThBNQ6t1Ws8tKG7gR0oy2DJPu8NSOtsf4gxoY+Xch15w6zwI9Oeavj+ubMVO
         P8naNqO1CHBIUHI1YltV7XrcZHq539AFXuTQJHMHn6UJOKoUHU6dYeqn5WwKRDgR2Nsx
         aXCmv7qluSq8/FhOkBJbO93iVbyC69v1SO6lMlRZl/9gQOZkGlBGqL5tw5S/1cyq5wuJ
         p/dQcdykZXE6TYvvvFb4YL7gxCg/ba6PL/wPMaCAJ17QpfTUB5TqsiOtE87yLguxH0IY
         cPcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=kEBpiJ283G+BfgzwSR839fsCo4B4rRemOVjloruxGD0=;
        fh=TWMaOw7BtTg4PNhasFD3Nxfg0BwLbxNqEHGzmoHR8tk=;
        b=HnjAyg7bb4zBMyTYUJEr97XqV6CyPV/05xrF+9Xbu8dXy10lcOtjk52N9WSWRIHRDM
         sWaEGR8oefOF0X6TbFzVtsKu4WYuAh2gyplnItUsCb07nsEWZiz5J6ZVQsQA1zf/8YLS
         gBngs1/7zOfcxSaPhWnY2jKdodCbIT7QzsZfMWipza+nQZYtfiysZEeQLziwoYjL69l6
         Jzxyop6MtkXz2/MzZgh+2avbjmcLDaG/RqORjbWl7tClV6RKKJeuEt4oRsXasT/wjLAY
         ChVc93Zcx3bTnRm7KlrVsjFDkl1KCYojRsV2SOFWLOU5bd8T50p4YG+/JcrJGV4w8wbx
         G5XQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793726904; x=1794331704; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kEBpiJ283G+BfgzwSR839fsCo4B4rRemOVjloruxGD0=;
        b=pm7yUVKTVW4vYTp5NjisHiNHUFnL7AWIT/WL5HZRoMFc05srdUqWbSnEsSR591BxHh
         yc4WOM9fxBBMX0GvTFmStLicbokwtMCSPOewUrK77znTj5lyDTIIpxUyEgHkpSDOT7tv
         RaK2JNx81XtrnMCkL+co47eOPrEPOFE1HKFQ8pyPerayqhkitI4ToNOZdHcL0IVwwtP7
         zHhWaA/AFBlvBoroWircj7OqHUMfsVF7raExvoyEwe3sfKPtoFZPdUIAaO42CF5CAhpc
         Le+wo83jFyyZiY/5b9xiO5/yN2LZWLthcXdxoLZjfLwm9GEmnW8YjXaIn1WpKvgaT5il
         1eZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793726904; x=1794331704;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kEBpiJ283G+BfgzwSR839fsCo4B4rRemOVjloruxGD0=;
        b=nnN5Okqstj0FkW0aNm5dPQ9xhZCFjcMICRBzkI9y9M/fdEqKGMugTbGYkicr06JpA3
         41+dZ42D5wpoCrgfUTvN8g8cRmlY95kfqmMNG5ybQ0+UKmIjvAs1a3tzobwvudURFn6L
         +6YitzbA4KHMz7WgpcZF3omivTKSd56nxnlv3KAoQZJaPT4Ullwv353NhGC6TU0xWjm0
         wjY47h/5QTfxP5zt7h2M1JjznMoHukzPUoWM1o1BerK0MFlHoXDDO/o6BahTJZCZ6tdQ
         VDlDdmQJ2neWWRMMa9nVabRI9O9JZvbxCde0d8Pi37PJigTfhMHl/Y0KIEMqxs5z3RS1
         qULQ==
X-Gm-Message-State: APuU4Z9/sv6hdD9zPo9A8R87V08/oap0BdNIIB7etOWjqYGFtKt4//nG
	8OlSw2CiA3wwNXylvUSFEvAkkVTVRxMqxVQXxOzwp6/ZcctsXkGORBlE/KjMJA/PQsrARM1e4D+
	NjSGy9AcMixQJ78o8/KBPwQQj4K1gNxJlNMCOuU4=
X-Gm-Gg: AYBFou2GtFrbHqsOBXie6AF+m2A+uQddE7NPbo9d8CNHYZ8/V/c2SkKZqJLuGNSUuuW
	So/kWjH6A1vywN9kM0zDATmERzMFQubp/djy555+6iyy2uzzbqqWok97/McwouK0r8QlGnMP5iw
	YJDGlt0l/M068fKncVURUsr/QUl60uBvnvw1UllppIMiSvfCH2wz6L0EdJW/SFgH3KrL/KkdKXh
	oAXe1uV0s+zMe4v6sOuTfoExdoiuf27uDiPdA1fChiBvjgOtHHk+bDpB/YDKxz3GI8R/Et70PLu
	xuUjPM8sGOf654ptHqq+mb++oi+bhDszOgWQxNpVO520sg4e3OHcqmG71soA5nZg9CRuMfhZ9oQ
	0MlTdZL2Q2HdFRfH/g/nOMDfU1PBzcOyFyGj2Lw3FjLZlks/0ngli9dDdumMl14gJ/qdIhA==
X-Received: by 2002:a17:90b:4c07:b0:3a7:a463:54bb with SMTP id
 98e67ed59e1d1-3ae89849bd3mr20177808a91.5.1793726904268; Tue, 03 Nov 2026
 09:28:24 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAH78Gvtz15Q1icWZFpB68CY3xhdyddw41XCDR8BRS9zwA8EyWw@mail.gmail.com>
 <20260902161840.75210-1-q.h.hack.winter@gmail.com>
In-Reply-To: <20260902161840.75210-1-q.h.hack.winter@gmail.com>
From: Qihang <q.h.hack.winter@gmail.com>
Date: Wed, 4 Nov 2026 01:28:12 +0800
X-Gm-Features: AclHuK9UhaaoZiz6xdLTBcXFgRxd8zBDXrDfftklHx4HcmQXAI2sdQsSHQFwHbI
Message-ID: <CAH78Gvufhaj0Cm9A3tgC1qKq3pR8TeOB75zr_knZcxeE7P=W2Q@mail.gmail.com>
Subject: Re: [PATCH] apparmor: bounds-check the OWNER companion perms entry at
 load time
To: john.johansen@canonical.com, georgia.garcia@canonical.com
Cc: linux-kernel@vger.kernel.org, apparmor@lists.ubuntu.com
Content-Type: text/plain; charset="UTF-8"

Hi John,

Just a quick ping on this patch.

Thanks, Qihang
