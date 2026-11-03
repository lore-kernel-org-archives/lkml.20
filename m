Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793743030;
	b=a+81w+p6fUYd6boGGhgBhrcd1VgFdQc75VtDEvfvrp+Kr9Kr0dfiP7h4ixdd1viJgsBa
	 hihfLhN3Va3Ar2B1BtEJFdyxyY16Vy27Aot8A2f0K5DQSURWvlSSmu7g6pSSVNklvydLK
	 jZQsinm7rbi0Htub9qRw0M33xGaRIP4j5C7CK2xuHzUPt2G+1dbAUKDAsFfbT/FBf6PYh
	 5SN3dZRdE68nW7UQJlh7QgKvhssLPXrnP5S3gRE+WEXEzwyRELsr16W6AL6LKrdlEAx/6
	 W4ZjKQyBR2lbBjRU0viWWbmwUJWhIQvC3rqbEiXwPCEXsWes03XqcjtUxKzHyTnbcbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793743030;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=aPYR7zTfRsNXlDBSGzOY2duMQ2hzSOH+insezsayCR4=;
	b=BJ3MCmot5rwziW3+iVl2olxnbTkJdqyHdc+/a8ON5q6hBwoLiCasmx9ZBuaY3ohfx6LG
	 P2bGa5+IAWf0nGCIsLjIzAMU9o2Shx8ag0q3WDbOZhu3TVnlpn3HMiEWN6RY0voSpxW79
	 2duIcjH0+y46r4GJJzacQsuBQu1W+Li7u2tcTNHp34MwKfImeCmo6vjRrqSh6CxNpvAjg
	 OQLV2O4HUIMoWijp1DPDzmxpWBP9c5a17XZR7pQLInXlVQUoMJDKki1FjW4rcMmOsuJk+
	 eruY5Xdf5GKkID6nZ+FKKmCt9na1fcXrl8mFZ55/+Cl6z1FQmKdr3wpKpH2S4y2IWeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tubLW7bn;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A258606A32E
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 21:57:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A258606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tubLW7bn
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c434376dbebso273303966b.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 13:57:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793743028; x=1794347828; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aPYR7zTfRsNXlDBSGzOY2duMQ2hzSOH+insezsayCR4=;
        b=tubLW7bnYjfWqdPm2oGDw5PfxnGrX3czHSKi31HUXnFOcrxrOa6+OLs95+7frtrRyq
         GhtrNCDB/x8RvE+XHeqfkuxc4V2DejccpHCwOIrR65Bwf1Hy1URQ3Th/iEPrrcDS8M55
         iuUYRl5p0RoSaJ0W77WD6zp6+wYSAlO/NrTRlOpVjHhZUMBpfTzcgaQM/mn32v3R4EJP
         k7IBLQs1uXMTjduHml1DmTXVrptlDT6F3vYg3hdWTTgrjUqYnaafou2TRwUM8DdxUnkd
         5P7/Mw9VGFSDvM8FTs0dEpf4e79B0LF5V8yvbxNUa2DeLyXc7HFNXH/TwxDaQ6CU0NU4
         oSaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793743028; x=1794347828;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aPYR7zTfRsNXlDBSGzOY2duMQ2hzSOH+insezsayCR4=;
        b=A1cXYf90HPzy/y0+R9leiYiKkPK0PrhGPDX5XKQe0v84ddJ7fMdS1BOO/ldUfgCWID
         n9z0Y6C8JVOiGf72tyECmzUAxoQgzw/KYsgtvS+7tFLLlNSaR5IBQKbTNXAnhqRwcEbH
         p1heEdUyDh8vK55HKw8xglRW3Gkv4ppJ6/oIgw28RdVSiLxdpVtCXefIfHkCbPtNRHBG
         N0Mn0+96DrUxkD6Ofq5I7arIwZMIjoZvVaCDHL9GUIO8OLTSRmeMxUw9llO+tqgdedpj
         D0Kh/3RkUVjmprLSd7dCRxBnJR5Nb/0rmig97ntMBwIu4GR+a9L5Sa8q+0GitzAXwecn
         ejIg==
X-Forwarded-Encrypted: i=1; AKwUvBy1303dG46hvjJbdcQjUTLNKPxgY2oAkDwONkP2sbEMeJ+H07iP0s517lszI/E1eLw6cKhTrog03BZf+Yc=@vger.kernel.org
X-Gm-Message-State: APuU4Z90beFBwvbIaFckyRcrnTw7RlHYTtdPRvqPHWqlbD7pydULEexp
	7wnpSe95BkYOa1EOMmaO+ItKMdyk5vwoykEHq8fv5rvaiF7YMb8Iye+5SS+XZFeHCiQ=
X-Gm-Gg: AYBFou2ZbdRJLosPI6lrZJBXX2CoweV0mhiLsP1Xx72od4ornxCpznzGqeYwKUwkaLq
	NmtuVkGUzd+5vqFDcHso8FG+U/D47YBBTzNbzqGTJx08vVQNTCxYxjEAeH+FtXpae3dwtRmy5/N
	mQ3b48hNNRdSxOOgg2Ud5NmvFoVUCyQWB4CWQNHo8UwHIwrntr+2KH2nkRRxMytEU0ZDYZ5uHFC
	NFIQC1udtnRREGysgahsnsYbuZ1RQBBCyScE3JY8a8cpxlC+Qpl8HhRjXv7gzkTocoZYM+sEylB
	vR9ki1Nhuz0BJysif4PM2YiU7ilsxbmZg3xasat8zngsTUteiyuVDn2CTbWgclWV1NWKx2cUKsd
	WGn7uy3WNXdl0GMzJSvhcddHP35fWYyTCad4dEgkEXzuxcwf3Pbv3ZQH1aNVKinfj19HsfkjALm
	D4y4Gfy9y0WrqGYxp74DGpDN6Wgde+jl7Nvz+b3UbmLOPW23Sc9M+DlqG1PVKsoov3U41/r1YdM
	9hMbYXlkCcz/xXPhuZ7oHIiCS1C0bu9C4Fx3Ddz3HTrmHm59Mh1T5NYka8V2kYrOeLAUF01iSjM
	kHws9WYCAUigenmGkyKAnedPVTpQBKIReJx4PYPx0zBK+/yUJ5wmhAI1gUNvrQAjCMamidB235y
	6sJZusJb6XNLK5qqFbaRJLDs=
X-Received: by 2002:a17:907:7247:b0:c46:7de7:e41d with SMTP id a640c23a62f3a-c49d13b3532mr1528577666b.18.1793743028344;
        Tue, 03 Nov 2026 13:57:08 -0800 (PST)
Received: from localhost.localdomain (87-205-122-125.dynamic.inetia.pl. [87.205.122.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d0e495f70sm3697866b.76.2026.11.03.13.57.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 13:57:07 -0800 (PST)
From: Kyrylo Biryuk <illofspeed@gmail.com>
To: cassel@kernel.org
Cc: rylos78@gmail.com,
	dlemoal@kernel.org,
	linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] ata: libata-pmp: disable the SEMB port on Marvell 88SM9705
Date: Tue,  3 Nov 2026 22:57:06 +0100
Message-ID: <20261103215706.508495-1-illofspeed@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <aui0uB-EkF7MKOGb@ryzen>
References: <aui0uB-EkF7MKOGb@ryzen>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Niklas Cassel wrote:
> A Tested-by would be nice here :)

Happy to test, I just need to prepare the hardware first. I will send
a Tested-by once that is done. Please do not wait for me if the patch
is otherwise ready.

Kyrylo Biryuk
