Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B936840801D
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 09:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791193882; cv=none; b=WAL2kKbvUdyEmi4IPOlDm+JjdUVrg2o9IT+6YT/7iumtx+4prC6ap3PZfHR0Aa1MNT0JmhJM3izSb95JbJd7me2GpLlvTHpoOUdRoqehFXrorvCUgootiDmnfVRymjKSZCKPWipKAh12z+CnTneCA+MD3kKaWEOo6/p+LBI+x+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791193882; c=relaxed/simple;
	bh=ZjAV1Hrwb3f8+S6+XkTUs1o41gse77Cms6u2uyzXKhY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JmlYZKw7dUdxLJ+rCN2jpsaXb6qnBwpeb1/ENtzC+qx1KVzHeMMsCu8T3Fg+3fLhYixxPw3CR6LfHgIkGlAlJsJs8K1GbOXxL6N8CK1aQBbmfATZ/KWZ/5C7B9621UloB9zSZ/y/PHny9PoDnmu8aQW4IAD3KKGfHyA7Xcxxzro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qwsXueMg; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qwsXueMg"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccf3ca626so10340765e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 02:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791193879; x=1791798679; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZjAV1Hrwb3f8+S6+XkTUs1o41gse77Cms6u2uyzXKhY=;
        b=qwsXueMgoLros3npUj3UTsUl11PlxGKNMmeUyxjA1sFBzp29R9Jc6PAczZBhFfxrBm
         0I8UarpI8Kxl9iL03jmTOzX0LlI0GW8DIZuoDKSKWspmcBjotp7aN9r2WBf3DNhyPTKu
         YsOVIiMiJVMgWALNRogaHoZ22lXxpG/zdZZLDlRL0BA4iXnnZEUSTRzSEiig99D5UwCB
         iiSOdhNvnBkOVqSvICXgcPDRN2PVM9LkdlPwutn6pTC+hRD/s2+cPlWGjCOVd8MG23Zt
         Xy7ZatVvxkFyEWqTrjvsf9RB/SKeAmAmQJJV7tnaSZhSSClrwX87PiUKah2xl08Om1Qr
         5V1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791193879; x=1791798679;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZjAV1Hrwb3f8+S6+XkTUs1o41gse77Cms6u2uyzXKhY=;
        b=LogkWC+UQnY03OSLY458H6pqB7CFFYrV1FRtST0U9k55d8/O1tcQ0cMYI0dlW1OT68
         O1lUpUB1pwTe1HAABZa0WOVTRqGNPS+R5d4T0mGJ5/Nl1NyRA3Y4IK8ToECJNvrcuSoy
         h8Kj0hbf0cfTYz1IIsL4+c/tcB4zyXg5N1FypvB1w7qKS4LLPEijVtGyHGkOF4Mi/T7/
         xCDl+KLKIu4LkERwmbIfNqUlyGr/xNUl6T7SKcWDy3XlGgmTb3edTE7yCIqR7cVXXJvx
         qhl31fVlL9BxncsZ3XZuazP6CJoiulirnaF/0b5FsDCoz2pyXocZSjiRcypE5Ko5G0lZ
         bImw==
X-Forwarded-Encrypted: i=1; AKwUvBytvU69FFDttt2KFBzbHMRo2BHdhrX9/PxgLKLFt0aDmf44goFg7GnIZO2PAU2j3OT8nyhEQX7tMbdhsEA=@vger.kernel.org
X-Gm-Message-State: AFuF++lUX13RW5VeVOHrFlZo1jRV6oPks/3eoPM/4SFYBKMDXBcJLcNR
	MMd+C+lrSj4e/6xKskqkF4VwpJNvodWz/9cAQBJPDoSB/d23cWCU3pbPUKY7Sw==
X-Gm-Gg: AYBFou0u75wb8Ddd24/B4KzoiKFiLawZ60gNlZ0wSZIKo9y+1ExvYg0OxPi04Xu9XxU
	sJsIO09qfATCcYaRu9TQeH99O7go5O0bHqB0gREjoeTJCqbwa4K/SwIPwFcavv/4uuMifxs1I+d
	I4Y1yovnZm5KllWGLTDx5RQKFFb4ZZ/VjYOep7mXNpJSLsTIIy3F3TzluLoemW7zLi7EDdmso2k
	lgcAXk1tqAYnwf6OoEU6jy+GnYW6fL8tL0qMFt9gHWGNTTC60THNbpArbo+1QSP75dSIhz6V8F8
	NbreP1dW6EJBhrJvYccenYPK9Wf2xS1rmIvGxDLc5M/4IZCHhczZTh6yx1vxWdy7PRO0Jb6ZhLO
	A/nP4QR42LmrQw8zjWAfeKDCfqTXhmDL9VU7y5L6f+D3Ef/vZSHBI0j8LkR3X+xdezbXl9ewRmw
	SdY+x/9/sRXCHrLV5ZCo6eh5bFhGPqropkPCR4zrpli1c6z0QNaxUicCAI+iwVgbGwIF7mJ64Hk
	iWCzA==
X-Received: by 2002:a05:600c:1e0f:b0:49e:6249:268b with SMTP id 5b1f17b1804b1-4a027697ef2mr166332585e9.32.1791193878854;
        Mon, 05 Oct 2026 02:51:18 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a03ff6a82esm133721915e9.4.2026.10.05.02.51.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 02:51:18 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Luka Gejak <luka.gejak@linux.dev>,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: Re: [PATCH rtw-next v2 2/2] wifi: rtw88: support channel switch in AP mode
Date: Mon,  5 Oct 2026 11:51:16 +0200
Message-ID: <20261005095116.22186-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <135e11c2a24642d0af774d6fd3c7f5a2@realtek.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Ping-Ke,

On 2026-10-05 Ping-Ke Shih wrote:
> Should we define csa_beacon_work by vif? Then, here we can get rtwvif
> (and vif) from work context.

Yes, v3 moves it into struct rtw_vif; the ad-hoc check and the wrapper
go with it, as do the comments. The hw scan refusal is in the last
paragraph of the message already, so I take it the inline comment is
what should go; done too.

v3 follows once the hardware scan path has run on an RTL8822CU, whose
firmware has scan offload; the dongle is on its way here.

Best regards,
Mehmet
