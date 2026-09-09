Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945493E2747
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 23:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788996957; cv=none; b=o904bks52+czf7q865jNGyiGSj3qNQq7objjpP5/5mNr9elBIHDwuL70qnnF63WR15soaDpDMEHqz9rDuJvlK88qgfFC9710f4xAp8CUbbBa4KOLJQqWbgie682FE1PN7xLpHFvvbajonAnkDiwmhJcWYc51NsU5ntw02EoM2bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788996957; c=relaxed/simple;
	bh=2/FWvLxK2swVY7Lkt27lEOw4+Yh+lP1rcCDSm2BzOBw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uJOP2u7PLWUAo3efixlzNP65BEwsVIzSvC9Zi/fXlBCKejqxOPTLwTJ8RPLaC0UC9h4CJ/U2AhBueSZVN3PGnhOcN0ZC2mXHCbxSqfjBAsE38B8+tbQJprHXZtdcuLRgJOW/TOHwoCQHl/RCAdq9dR1dprGo6pMstwbEOnkoR/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PViaICfh; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PViaICfh"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a6249b76a8so1300538a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 16:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788996954; x=1789601754; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2/FWvLxK2swVY7Lkt27lEOw4+Yh+lP1rcCDSm2BzOBw=;
        b=PViaICfhutJ+YQf5pwd/qoi3l1rlxYUJGyJPz0sii9qCtdcbMORZOyhg/yqL0iAvli
         a+XEZNv5INYGWlqR2rHT+XqSxtwVaIt74lS4jBT2TGZoetS193DfuZNl0ln3FeC8k0We
         Gbg1O0KKdUD0HSCRLQwKpUKZMEFgJoIKSTqvqstDGeJ9rUxhqKu83lL2Z/E/z4exYFm9
         l30JwYxtcz6cIwr7ftErD/6b9oQEYQH1jzZyr+DuZDpi7mBys0Gap16GETgiEbvx6151
         v1Dq5cweYYcYJ1GSwjxVCZq5gOwjzQoZMfBd2+KCXeX1Q00N2Ph/uXwoc+uMbc79qYXZ
         89KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788996954; x=1789601754;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:mime-version:date
         :message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2/FWvLxK2swVY7Lkt27lEOw4+Yh+lP1rcCDSm2BzOBw=;
        b=bPW7+KuAelnHuf8b4cToV88wKyfUw00xiiC8xE259le0XSl7xkLmIhODqIrmkNZJuH
         je+u7ikexN30fGUfTZvBXQKQPNcLkdbNSSWoIGgMsRY/clIE+vzY93qM/AOe1FzGEcki
         Idu94lBuLbhH35W1p/x33+3k+wyWNS0dH5QkJb28JYEGy7Y16+QP/QtD6LWS+/LbCGdy
         GG2jQ+cnU14Yl6BMGqHZ6IhoExUdlCVksu0n/M6qMnJ5m/eNV/XSKAiEzc3voLNWXeBL
         GixOJAsG1qmlsxxV8D4qiVbmGeH51zlz66E78vqlGrc5zSv2M9/NNvGUYC2cGqBLqrFP
         lCnA==
X-Gm-Message-State: AFuF++nAw13+d/h6PeDd4fdTTobNTvvb1HIBcdA9M8fqb7kO6vMGx7E5
	ffErbChlPoP+YLDgntZ8JTInWZZfDSjFREM0UcUhyzt3msjWNRC8QxcEFEGRbXzquyGiyQ==
X-Gm-Gg: AYBFou20ohsemwi7tuSPSjIaGZKwj+YHOr+fzVoFNQcWNYxENmixM0afAO6uVzbcrSF
	nYlERw7VGMlUAgpyt+T0mVT+cjJYAGFrb1YBfYxHZ/iSpW9n9s0kInaJhs/2SqUE7G4ykxxtPie
	rgDnyGNdu5elhcIHhpTFwXqtRKf8uOemoZHy4u6rUyy8XFK/jwriQEOmsYEbYws7+54lh/bfId+
	e8W68SP3MCA7qjEFjWcpQwJTIxVlKL/1cnREpw5iFUfG327goLxyrHe64QvyyQu7vazW+gQYKhq
	qnfEczq8fsJD0dY6QTe6zy8JEPA256XbShCYSSunJUFbpCNxlwUEO9EbuxzhLC0/eSDrEe81UNa
	hbADQjjpbPKoXqMI+gNXDiLNJ3aRG9QInXxJfaW/9rcNNRIl2u9UvcpaCu+J7f7S04WtPW165Cv
	WxVxFfHbZf1qx/7CQo4t/1SSCzVQ9988iJ5rnxm8zTp7BqHSAHzhZg47N9XDv8FZApY+F5fjwWa
	N5SN2eYXvc5kkBGBQc=
X-Received: by 2002:a05:6402:5389:b0:6a9:98dd:afd0 with SMTP id 4fb4d7f45d1cf-6a99cd22660mr1588083a12.40.1788996953572;
        Wed, 09 Sep 2026 16:35:53 -0700 (PDT)
Received: from 127.0.0.1 ([94.41.86.134])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a7e6c20c0fsm7819222a12.30.2026.09.09.16.35.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 16:35:52 -0700 (PDT)
Sender: <irecca.kun@gmail.com>
Message-ID: <d27ef15e-2b34-4113-8913-93f4387fb48a@gmail.com>
Date: Wed, 9 Sep 2026 23:35:51 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: commit 108cc873398932af589c295f78c348513b8d70d9 breaks
 update-grub on btrfs root filesystem
To: Qu Wenruo <wqu@suse.com>
Cc: linux-kernel@vger.kernel.org, linux-btrfs <linux-btrfs@vger.kernel.org>
References: <CAKLYgeL7nrA4nXcewdv9Fqg_s=3GS=vmoypnEiZBKQ7rySZFuQ@mail.gmail.com>
 <20260909002506.GF9053@twin.jikos.cz>
 <7c331e23-d0ea-4611-9bed-d7099dcb41ab@gmail.com>
 <9ca6e653-f89e-4ed2-8f97-783a5663f97c@suse.com>
Content-Language: en-US
From: Hanabishi <i.r.e.c.c.a.k.u.n+kernel.org@gmail.com>
In-Reply-To: <9ca6e653-f89e-4ed2-8f97-783a5663f97c@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

I think human reporters deserve more attention than bots. But anyway, thanks for responding.

