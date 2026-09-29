Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4568539791
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 16:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790700779; cv=none; b=DYdtIoq5DLpqO3mv/hPr3aVdSukTJFOq3kbvKKnGU0UQm5DLwO54btH/VVAjkuF6NsHjdkvmXqYOZBiUar73pF/NVxEOu7F5Uwii1Jqcn/8l50nCdY6yeerWSSUADj5QtNqK2OkrWkUlRAimEYiFLuA39gCfnWs030dXkHmYKjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790700779; c=relaxed/simple;
	bh=qaFCsp8c7CGfKFzZ18kTQk2ARCzvSbrZ20wb3yYF6SM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=I8SRIl9H4Jq2CgCDoRmrmO5cydSAj6KPX96oKp6IoJW7X3tf33ISGAVXgX+zOYBSYaUb3Qc9QRsjrmvTCoU5JrnHWWwz2JXnkKbMSaUsuDc0ZsFnpEG9ypJOrlMzAAm5MH8SRgIUZvbFL+iOkiHh6yOpKSt3+wpN7GcgTHdKBtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dUcghjw9; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=egRAHL+q; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dUcghjw9";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="egRAHL+q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790700776;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6o1EgwQzbNDEuQMqlYhAahN+QI0brKkw8w3Pq8/8w4M=;
	b=dUcghjw9gZVrWVqhnBexcq9veeCro3FTcgwcEutZxrnS+sips9AMeQZ915hQJkIHtf8SU/
	gEnKbsBypd3YhJAE7QU7IDAKBnIc00o2yOpVWVlyGu9+ONKeAK0c9PsnwQXVTqCkIl9FTf
	A/twVWewIOjCZ0fM6WIVxJPsuCKsI9g=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-110-qYti6g5PM9-P3PMEn3ot2A-1; Tue, 29 Sep 2026 12:52:55 -0400
X-MC-Unique: qYti6g5PM9-P3PMEn3ot2A-1
X-Mimecast-MFC-AGG-ID: qYti6g5PM9-P3PMEn3ot2A_1790700775
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9175cbd3beaso41519666d6.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 09:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790700775; x=1791305575; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6o1EgwQzbNDEuQMqlYhAahN+QI0brKkw8w3Pq8/8w4M=;
        b=egRAHL+qQ5CsChrxeHhQheTQlicf6Zg5ZZZ0h4csWN29n8Jl3FgT0q5I+5Q51oOimO
         qCDCsJvFpt/iGoRiGOv31u+KmRrRxXVyamegl8jj3aD7X/hIf7hbjs7wI9gKaocBAd38
         75bf1arsMHLrg9FEZkhg2PCidZVnb93XFAR8dxWuhTBfWaZEt25rhv8xo7ONYtqcNS67
         AYn7sjQuMLbUaI8LYHvriFz866tzGfyjsX6Pk5T0e9BQhNi3EDxBJjh6gmUhgH9XgxQ7
         nwcBAhoUo4n0rGN8BZ/AeP7WJyO16RauklOZMUtYpxa8hiU5vX8SI5BCohZ98/Bz7oxL
         JuqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790700775; x=1791305575;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6o1EgwQzbNDEuQMqlYhAahN+QI0brKkw8w3Pq8/8w4M=;
        b=Hn5U8Q4U9XZymKnC3CwezC6sTZwOKplo8MyyLXa4tpvrVeyOTzjodNHMPKtTe62+O4
         0UmI8Kerpl1c6G5ghEALgqUGW87A4XvokJY5/0nD1DsJmROLNSTETXqyaP3Z6mbQpChD
         DhwsGGbhUshZ6y4O5ESHVuTDcmncMqQnUb5u405Me1ENLF5P5lM0GSWski66F0IK4uF+
         smlatHq5Yevwta4xIz/QAImbg2i7kVhi4YebnYuJ8x164Qgu7IZgOcVvCDy7FXJD5jtX
         1/l6MWMTwzHgN0rsRtAHDEJsWf8P/zyyc/7JXwxNZZfeDSzVkbKVAaBJKdyw6Y5K+Cws
         yx2A==
X-Forwarded-Encrypted: i=1; AKwUvBzfQd+OMgarkoWuMAM+kOLO1wSb4A9kY2jVtt9oA/OhiDWYV+cJD+2cQki050KmDM7MiGhkqyZbwymRSSs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJKvn25+NFoAuKdaRZsjA6/qPT/sr6mkPZXM5D20PuLZE5rKN/d
	psMPiq1d82HeB8Ek47YC+frWcebN+aRY8PY2BZVJTmhmCd99nN81MI1E2WYojc8OoOqkARzyftG
	sidv9V3VV9abjHfx3rQ0Tq+VBw1ARXTij/iQZTd8TBMA7+DmWhc8EKJJafrxLI3yE5A==
X-Gm-Gg: AYBFou0aCy71xWwE9trP/nbLl7W4VEhiMo71oAlC+xf6EK20XAfhEbrTNtFnDvYzy46
	A0rPrY6jtV808o5Z+gVcRTMrdsVYSxceli9uaVKgSQm/VRbFW6wpmgE6p4riVi1UXOI4iPKbZ+q
	EbGdpYr5D3Zn0Vd9ajo7qyEUyb8uvx1oV5sYlFgHYLDISSm5AobRDayuHMttImkZrmCyQxj2V3l
	J6B5wGv5tnxftlZQrZBmNWiH0Y8kIfnWiZx6bpdB6/q4+ZVEorJfKmOrpkH2gjcaYD2U2s5eOxn
	04FFoLMIxB4ux/YfEx+wgwgyiwHCHRp23HoiF1vZu9nfJWVBFesNGoFkdb1qO7Wzto7iy+Jg/2V
	Xw/lO2989K5bFfZMbs1b5Agp6BYSNJfJGQXwXdjoTGFMDjYzB6EI=
X-Received: by 2002:a05:6214:2f89:b0:914:2b93:3f3 with SMTP id 6a1803df08f44-9142f6ea654mr302167356d6.14.1790700774726;
        Tue, 29 Sep 2026 09:52:54 -0700 (PDT)
X-Received: by 2002:a05:6214:2f89:b0:914:2b93:3f3 with SMTP id 6a1803df08f44-9142f6ea654mr302166736d6.14.1790700774056;
        Tue, 29 Sep 2026 09:52:54 -0700 (PDT)
Received: from bmasney-x1.rmtuswv.csb (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9178d343c11sm14454746d6.25.2026.09.29.09.52.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 09:52:53 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Tero Kristo <kristo@kernel.org>, Bhargav Joshi <j.bhargav.u@gmail.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, goledhruva@gmail.com, m-chawdhry@ti.com, 
 daniel.baluta@gmail.com, simona.toaca@nxp.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260906-ti-fapll-clock-v3-1-b0ded340c62b@gmail.com>
References: <20260906-ti-fapll-clock-v3-1-b0ded340c62b@gmail.com>
Subject: Re: [PATCH v3] dt-bindings: clock: ti,dm816-fapll-clock: Convert
 to DT schema
Message-Id: <179070075682.199845.16100370158110486691.b4-ty@b4>
Date: Tue, 29 Sep 2026 12:52:36 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=329; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=bJDs7mdWAsDC2TJlkeIHEoIE2dsMin2hdtYBCmAzCEU=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLJ2v3m0NebrBsm9mQ4Hl9y92DZzMu/iiz+4DlU0rzR9M
 1FA12daXEcpC4MYF4OsmCLLklyjgojUVbb37miywMxhZQIZwsDFKQATuenP8M9CTMaqS9xVQDf2
 cnxPoWMZh/VbFoG9r95JzwtcvCnyym2G//7vCvlD08qexIVmN324cEI2b/GkzxeO7uRkE1lgW8F
 bzwQA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087


On Sun, 06 Sep 2026 02:52:04 +0530, Bhargav Joshi wrote:
> dt-bindings: clock: ti,dm816-fapll-clock: Convert to DT schema

Applied, thanks!

[1/1] dt-bindings: clock: ti,dm816-fapll-clock: Convert to DT schema
      commit: 64461f89a37a788789a1ce22979e3c0695ae0497

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

