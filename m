Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 884E543175
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 01:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791768376; cv=none; b=HinpqXGsVJhwlYfWwHyWXcDWX5ORe+bunUxnqOZ7azd28+hq3PO0rMNcvW3bGLAoLTLagi1JnBAm+7ltdWc7tMqwjFg5XfPMJFcqQB2KgHbL7tkW1C/kzNh+O+ySAzsUhR3olSH4/TLpo4GA3yWIALA+UytYSL3hQF0mwVJsFyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791768376; c=relaxed/simple;
	bh=7yjAEKuRmZZSVW1wABNqX2gPlNcusDazDo3bH3zKwTY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oKL+dM5PO9Rd/blfY/SYkNRDsfOfDt++5D2PAfEXcjjPVnWh7MvTSyIbjEOy7X/I/J1Yep0XeUI87EeDEaodjZZitm7uoRwHZ6ohKx8kHKlsXqThk8hokBAzk7R3E7IWcYhZAjmy4si0bdMXgOjrk3wsc3xMsX2T1e9sWA5A9HQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com; spf=pass smtp.mailfrom=openai.com; dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b=H/H8/mTL; arc=none smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openai.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b="H/H8/mTL"
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-6b8e2d8df4fso1097456eaf.1
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 18:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openai.com; s=google; t=1791768370; x=1792373170; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7yjAEKuRmZZSVW1wABNqX2gPlNcusDazDo3bH3zKwTY=;
        b=H/H8/mTLkyXvpKmYhg9xcirznaALpC4U1xW9lVzwYby8Iqd5A03o3rjoSNmrU7geV8
         TRKXpdraFBaCEkaSf4iPuyNdyciT++UrQjCcMb4LHQdlb533vkyEORPNcGrfM+eCFkV3
         xkqg7no1nZp7IV/hlM1lKa4rfzGnCJGgynHdE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791768370; x=1792373170;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7yjAEKuRmZZSVW1wABNqX2gPlNcusDazDo3bH3zKwTY=;
        b=uLImXPuSVPQzty7jt1TPUf7QRQkmaCxqyMG21yPNImHyIZRizrbCcL7HkVinR3MYmD
         nJrCUSJLzz3Dj0CR+crypGlaS707mcED53O04Klh5hwF4HWVXDklKSMhxIEhLGxslkju
         yQQ51qA5JQnzgNwtd0oABosWGzpIAw5yt3teUl/PGHxi+ssBCC2kTUW+VZ9EiiUzwrCS
         UNHkn9yoAjpqatQS/GAvO/GOr/6rSDcg1d4oxipDa2kwpo5Fr47M1HPH1oY3EobZIcpm
         d+l6sracHQbiPhGg4ZDS6VMSJfvjupuWR6UbBvCMJmk8x64Y4RymfE7+fBt2sAx5c1ei
         lWqQ==
X-Forwarded-Encrypted: i=1; AKwUvBy5R8o2jaeJhH8BUAH2xdshmrsInoefk7oeIkWgcwxwWN+KzbL3DxQ8BEoErXzeJw1Og9TwaAucKmOqLbg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLDwOjzjFL0GHkwAGw/S+2BJxamwpc///369vGO04GLz/ytvWTT
	gk8xd2Ly8A3FEBShEkUFfCtXYyKhI9fhll8wxi9GjcqXHVGJxf559BaOno5IJz5IvLI=
X-Gm-Gg: AYBFou0gyPkxLHJTl7DFVw0qotbN6yVyV1GVG5yvwEsiCrqKLCmvviBGQRUhNe1tIGz
	2NamernaiTgJSibCiHRtPzBc3hVfW6g+Un44YkVn9pgS6UmxL+bjkCRYDZ+SkzuSbAbaOaVIMMp
	9ktXhYnsrnw9X2ZwlvUU2XFwxF7voDOqJWRYXGm2nwp3Uu0xFbq3Cn/5dqXiiYWtJSUcfGEwaCU
	eUthglPm69oLWHTdCf5oT8VecQJpAB0LV5vVkhFexoRXxJoC+u9buHMNmG6TJv7mqiKiN1DrMoM
	VA20KBlyI4RPMm7dul4VJbKYtR+C/hnXcdnUOkyu0RwxJGlL72VW8BCuTOb4jUqBA9NeBcw7gKg
	KHdw3sc8zWvZpqze4NhsQh3+qxVNmXIqYwMtcQ50olFWZqVqpW4BBv+/KBlyg2gLrhGdUIBVc+g
	/uiT0cEGQg2aX0HWDpzp7/QgsEfQU7QzG2cgG3RSGz7eEsFR86zzSq1JxBTsPTHCyqIJ0mUSsui
	HTmXgw2D1NqTfcfcR5N1nVZ/Iprx1VguAoqVcsc+NwToSTLmlJtnlv4owwIdGTVlz9jCa7L2tqD
	jkuqccHoxNzcJXY5Hou+AXEWolPS4fvc68NeLg==
X-Received: by 2002:a05:6820:a291:20b0:6f4:eca8:b1ee with SMTP id 006d021491bc7-6f4eca8b8d7mr1090389eaf.25.1791768370024;
        Sun, 11 Oct 2026 18:26:10 -0700 (PDT)
Received: from com-68297.corp.openai.org (vpn-centralus-01.tradc-corp.com. [172.169.249.3])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6f634860481sm1584254eaf.13.2026.10.11.18.26.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 11 Oct 2026 18:26:09 -0700 (PDT)
From: nramaswamy@openai.com
To: Eric Dumazet <edumazet@kernel.org>,
	netdev@vger.kernel.org
Cc: Neil Ramaswamy <nramaswamy@openai.com>,
	Neal Cardwell <ncardwell@google.com>,
	Neal Cardwell <ncardwell.sw@gmail.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Yuchung Cheng <ycheng@google.com>,
	Jiayuan Chen <jiayuan.chen@linux.dev>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net v3 2/3] selftests: net: packetdrill: test RACK after partial undo
Date: Sun, 11 Oct 2026 18:25:57 -0700
Message-ID: <20261012012601.27658-2-nramaswamy@openai.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <5ce181b5-af31-48c4-9199-feadf24af27a@kernel.org>
References: <cover.1791506907.git.nramaswamy@openai.com> <d0c538a03fb1cabd090927cb30a3b78fb485ba72.1791506907.git.nramaswamy@openai.com> <5ce181b5-af31-48c4-9199-feadf24af27a@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Neil Ramaswamy <nramaswamy@openai.com>

Hi Eric,

> Was this test changed since last time?
>
> I thought I already reviewed it.

Sorry, I only changed the comment about partial undo to align it with
the second implementation. Nothing else changed. I'll carry reviews
foward in the future. Thanks for the review.
