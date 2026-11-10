Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794339049;
	b=Up9rnj3WPHZ2T6kAS8W3W4es0H9h3qsDoL8Ec5XI9QFmflTnuWuJAV7QPM08gvQm3Sg8
	 gQDd9pSZ8krel5Kfo8qY8aZ3mKH0QnSl8+8RoH4m//GpodDsCo8eXJImBDLuNIOzJocmm
	 /Un7lfO0Of9QvnN9YvKgBOA0oHWc0NZGF5UyVNSMBwUvKKr5f7cwjvcw3yCrLk3sT1DMw
	 VFQlnfshs4k7ZDMVJ0YOw7yZCwFcxa/LbxWonm51tmA7OyCvrppodCC8t9wpE3L0gEi0Z
	 9q7kL3SH25Poz8CFmAMNwjjq5fFJUtG1A9gZR77cfnOAUOyMmjH2lPKa5RibcSf1LXg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794339049;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=bxDwPFOXkyRkRlbGoiQb8iudRyw26lOximDKyM7mel4=;
	b=JeLDWR2aJzF2QVZXfYVyonzkPmJAuBDMvCyngz95clMyYZRVos9HKAZAT1M+saqGWp1J
	 0IHBUISYUYOgiX/lqcV5KGj7EuXnW53iwAZttlXfeu1xf8jxHkTSxaAamNvhm507cNZvm
	 4xHIMvZfd1tcZ2b9GzfzyRu5i0VMefjGQ9yPdkjiHzbXMuKLFS2oRmAgiOWkkZVisOeZJ
	 /rCOu6sBLsaPNt5LNDfu+fbA5hTTvVJ+M5Hwt3QN0Iq1x9L8dR5ygdF6QA6ghtSd8/zOI
	 Pk2LZJk0bkkZZpmREKtrMUdAwYqC8hkb5fc9mWdxYTC+o/nKIFjUiIzZVp08M22EElg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="lCMkQx/c";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.174
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F02C606A33D
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 19:30:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F02C606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lCMkQx/c
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-8b30477a320so19356407b3.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 11:30:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794339047; cv=none;
        d=google.com; s=arc-20260327;
        b=HsatkllBomVpk9tJqhYBFUJSvQLzIJ5fL885vG/0CSdZkZPgrn4IJHoYE8cMUK29zB
         WC5LQp27lgZoAyCKi6NB36CDo9wN3RCrYi5aqyy29xZBEtuYS8MEUOE9/JDbWcDh876M
         0dFsK1Hf8pcswun0+UtIB48x1//3lo0/UYuJ5a6in4aXJ204mNqPWruaPGPCiHo5OcHw
         eK7OhQiyjWoUeQF6K3FbF5LX26MdADYAzBQpJ2OKE59Ds1jPrrB0uwH0j81Seeqr5YqE
         yPMqfwxx+cEYjcFmPQcGdWHAHcDo1eOsykppd7mWswLWSoxqgbYdgU252zmT/sFxazJe
         ONJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=bxDwPFOXkyRkRlbGoiQb8iudRyw26lOximDKyM7mel4=;
        fh=QXADKmOwaorv3VaolyGeZzYkiXpRP8Igze+BkVC3rdo=;
        b=Bl62u6jZFW3ACJASGkae8NzpmKraH9GcbEGMVBAjTVPVXZi3Aqed376t/RQVl+oGel
         IGjVS20usnbZxysTkJUp1dWpHWTHoUB0t8F6uG/SO2frBWh+Mexo4tc2bzU5/sb9Ekuk
         qnJDcP7ilMiBzqRa69EZMMmRAxxoaSQg5NrRPwqgfutJ4F0Jodc19joqDMfLMaxWzSAh
         lky88hUT7TOSjjScxJwjZtT1kGgDa7hNbwdKqzpi5kn03Kh+bHZqSzavA4FkYCs0jtNd
         hAYM3z87uz3EG+/gnjPKGbA1UEKiZqPBJl6WnPHxc7qALOvimf7NFPJkW/O5hvS/xriI
         /p/A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794339047; x=1794943847; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bxDwPFOXkyRkRlbGoiQb8iudRyw26lOximDKyM7mel4=;
        b=lCMkQx/cZj1NAfy6KCYTYzp6/8rt5qKzirF4luXEwMlX15auMOwo4DXzGTYCJFsuhF
         LdSMJPnmoMuvTRSAtAl0t6sB8Iy1zED/Y3Ocv3jPh7yB+k5tV7sPSQT3flZdd0KNIXtW
         PFHTYQPN/UMIKrbvGsZ41ybtXUmtbryWrKi4kF9MzhyKWlIh+/lbxONEwQKzikfuUxH4
         +c9LMpcV0Xb8ZM2ofRqI6gk4FVqvMSrhlcLPOMyUEGEUzN39EJxw08QElFAbKVcT9qEN
         xr+XNcrmjfiDFxpP5BjKQFYEACIZOtbmqjJR0fo/FSQCU8QJBx8GBawJ6GHVNWzbSkai
         38Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794339047; x=1794943847;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bxDwPFOXkyRkRlbGoiQb8iudRyw26lOximDKyM7mel4=;
        b=QrhCwdEVBUXQNItns3SYYrSKJ3r25iLmgsSn7y4U8JqqGL7rWbOSBBvAO62JtkcdIN
         K8QTAaQ9EYRuMd/zI1b9nrj1KcPEvlSl9jJBX/iwbCzTsbH7XrBm/BksasObWsmy/GOg
         mAnf84lLlwRpD8KUj9s9FySdG08RQqawxSDpdOzmWr2+rvYcwBP3VcZJeWczmEA4Ni2b
         MU3roTeF6rrgE3MIFGVIX81Y173Q30POkXL+J7oI5PpRkOAA0BJzGRmUdcI5Op62S7nz
         A5n8ewxX4gjK3lPlESpMWTxRhw3wHtuujmNSj2dCp5ekec7YlXDY6EdjtNb2HbKFA89a
         m57A==
X-Forwarded-Encrypted: i=1; AL+hErFPgdq5UUKYENdXG1jIu2xJMEZY7f3rDAAWBcvVwntFW4yymVj7ZBmJUbOTdFfMnMvJoCuY8cONO1e8Rx8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/oX0KrLN7ArCOa5MQY5fE+wNWbQOJy3yi4HSUJma43K23hA4nA
	pMzIaXuhGbXpGqhOc6iSzHzIddWlrBdIL8sTqprSsVZ7dF9y9KogI2C1HaHytRlfkaIxSotrY1K
	FuEc7f4fJcCoyUftr3EyET21cM0Q/SXo=
X-Gm-Gg: AYBFou2yIpgFY+D1uNC+/wQ7FudeZ82zDoYzw3RAfOiShtk8MdSvTu05ebC+7a2Ak0Q
	6Dz82L5LBqY+0pJ53ioUE4A+IxOTCx57CP4KXs6YMA1wROah0oSSqjENRTP3qLj3tuEdi/8TJtg
	aOcALd+SsDuix+qNCBOIuO72uWQ13Kzd7O6iEfjr+6AcaTkd36xGPb/29PcHaphJZ12HVT7K0pQ
	SFl+U7KcLDNyQ5QyId2WvioduxubfXvQSZmifxlmMU7fw6cyUPYp0FKh1h8ImqOkVrQeSFQDnDq
	vSQ0+35w+W6KybLuy7IX20K9ZHnzRoPZBr+V7WtXA7lOBfVT8RSr8+QsFUUjcFJGazhvYUX4iKG
	yRoQ8TLleo0aBxiZANdCN3TnKfT2eivMd4YLN2w==
X-Received: by 2002:a05:690e:43c1:b0:67c:2804:fa9a with SMTP id
 956f58d0204a3-67c67fd7c9emr126041d50.36.1794339047361; Tue, 10 Nov 2026
 11:30:47 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015-orangepi-gpu-v1-0-03566a615660@gmail.com>
In-Reply-To: <20261015-orangepi-gpu-v1-0-03566a615660@gmail.com>
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Tue, 10 Nov 2026 20:29:00 +0100
X-Gm-Features: AclHuK-V5XriYQc7jPlMOpsvH2O8V3xAiSzCm-87ylsSLg9H0W8yUGZ1h1oG_o8
Message-ID: <CABdCQ=N8afBsoZcTA7He3FOR9D2K-yieb9i4cAa=WksjoHm5aQ@mail.gmail.com>
Subject: Re: [PATCH RFC 0/2] riscv: dts: spacemit: Enable PowerVR GPU on
 OrangePi RV2
To: Alessio Belle <alessio.belle@imgtec.com>, 
	Luigi Santivetti <luigi.santivetti@imgtec.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Yixun Lan <dlan@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: imagination@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi all,

A friendly ping on this RFC series. Any feedback or thoughts on this
approach would be greatly appreciated.
