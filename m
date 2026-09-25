Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F373286425
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 14:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790346148; cv=none; b=OxfLGIYawsC+H7a3hB44yiog3fY8xGy8RECb7QgrBlzioIJInM6+RaUXb+rEKlvZyPHCDLaftvCQAfMpUDtUp6xDh2dm3YdiJ+dt6zdbb+4i43Z+3zin5nw1zoXEPx+zfQ6JMDufMrJSFUZGNGW+dutS7xUiAX/UvCP5E2tvIoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790346148; c=relaxed/simple;
	bh=d5uDDZqpgCCF8ojhypKkg1mxed2A2EO+LI5JH4IuU90=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=LcXvWCqV1+2aNRhP1TcIg3eEycrnpKHPArk8515M9me9oFGLw2u1I0R3TMMD+UJitJ+VzMptN+vyHg3NxRvk8wcE8A6Jt1xmTZGwjmjQgbIlHeXpbcgUnbS4H1rzIZ45XKs3FRJFaGuVVTdFLo1JYiqkVLuXTYnC4OkxBU+xmXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=HubwWeC7; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="HubwWeC7"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843c3ea1f6so526131f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 07:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790346140; x=1790950940; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rPNL1M3jOjQFzxSJPuEX1QG7QhoNHxjdxEWAOGyxkfw=;
        b=HubwWeC7jF+9b/IB2A+RGD8cWmyBpNGrMhldVdU3rCcVRwHrMmlhaIoWm7/qu3v7PO
         SAEAvknUCue7nQBGnx0jEDEudwP5d7PlM6hMSlxus/iGWfhTM00fQM6ElkgOqmNMElF9
         v6DGW9mb445hjlGTfL+L3BbwCyYftEalOz91EagrSqLvItR3rBXWII/QJcNg7dbvVBVX
         3AutFrKg+2BoviaGMvtasyTVRYhkdMlalWraaUrjcDq6z3kO8jYDeKF6bKIq/pjGeXft
         26smmi2eSD3GGvLK47Sd2EWQpezFVyMugsz69Zi2iJd/72mIsM++eGW32bEpZMMVAnWj
         oVvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790346140; x=1790950940;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rPNL1M3jOjQFzxSJPuEX1QG7QhoNHxjdxEWAOGyxkfw=;
        b=k/SwRkBAPKWnsEZgrFpQhEQcagDKRJe7n+O2dUPHp+k58t00bK+/YJX0vTPlu02TC1
         Q9OvAVEb3fSDyTOf3xkD3MYNrqZ97TfMpxLWguFGCK2nNM1aStVi8MaUPGuNmsu0vH81
         ODV81EIW5l0v+ecgRa24WjZYpfzK9PHAK+k8CJ3cf5jRuPD7tBM/1EB8xzpnyA0zMyvG
         DBx/+SyUSyMGy+0+gspbh+ySxlslKxGK48Fj4G0l0sgB5BfG0pyUlMD/DwZuCvcwnw4n
         kPOUNKJ1lstN/BKCNJyKbM+b4BrXWkSH72kYp5g7f7eh4lyPK58gxSvgD6Kqdd2p35k0
         kbsw==
X-Gm-Message-State: AFuF++kCEVlyUS4GPEbviLcwBvvdMefoDdW1WZjDTdqZ93FG+U/CZmr7
	XoX8LPMX+HJrbhhPk4B11PHtbxc7LCn6ASvpk2/tx0aJaPU94/GqBHwOu26yabANw5U=
X-Gm-Gg: AYBFou0/tyd7d/nFz0nNLWOpiYAyYadrSFUwLU5yMhQJ6LaWuh7cJQHuj5Kt6JHr6Xj
	k5mib2WmzmEmAdSv8HRuDgCt2cEqlz03+Q+zXmcJeslmrILZMSGiqei1M7Q/Ry3jSaxiET4u1Hz
	qx3/RJHMZvE8OhdcyMHp8rJKAGVqk7XuTLxF1RwFVOOEhNqAEkMVmsap9NJJZGHpdxGQeAqaQXo
	1F6JpNxHlUbQjdgSffCxRkVlyr7CxiABA5irx7YwWtTOc0T6AXmroah4ZE8QP8j9+RlaqbMocH8
	k+CSikDCOReEBguT9QXqfpjPTDHfXwGTU0P274/+x9UhB1eaataJgjXaRzojyaujsa1FdiHHxaC
	at11B9dxd9apEvf7MQ8p90NTUdLC9zbIdf/6rh0oKgEPS0MztErg6rOwSZSP71Zw3+Al45XDo1b
	ePegT4Wq1hDQHme/ieFWyPYS95FtTbRBzFh54UxKWqic05BdFlZR9sNcRe0OpM+igF5lf52ZIdT
	PZes60KOfuK6Y4G4A==
X-Received: by 2002:adf:e186:0:b0:488:80d0:873a with SMTP id ffacd0b85a97d-48880d089e8mr3037468f8f.5.1790346139942;
        Fri, 25 Sep 2026 07:22:19 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a30b9aesm6834677f8f.5.2026.09.25.07.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 07:22:17 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Vyacheslav Yurkov <uvv.mail@gmail.com>, Vyacheslav Yurkov via B4 Relay
 <devnull+V.Yurkov.EXT.bruker.com@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Brian Masney <bmasney@redhat.com>, Brian Masney
 <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, Jyri
 Sarha <jsarha@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
Subject: Re: [PATCH v5 2/2] clk: Add gpio-locked fixed clock driver
In-Reply-To: <a5e76452-1fa1-4675-9a16-8683702ff4d0@gmail.com>
References: <20260915-feature-clock-guard-v5-0-42ab5dc3a6aa@bruker.com>
 <20260915-feature-clock-guard-v5-2-42ab5dc3a6aa@bruker.com>
 <1j33vaesh7.fsf@starbuckisacylon.baylibre.com>
 <e697d892-fbd2-432a-b71c-8547ead22ea0@gmail.com>
 <1jtsnpcn8l.fsf@starbuckisacylon.baylibre.com>
 <39fdddbf-0fdb-40e7-9cd5-c8f857ee8b9d@gmail.com>
 <1j8q4p8rxl.fsf@starbuckisacylon.baylibre.com>
 <a5e76452-1fa1-4675-9a16-8683702ff4d0@gmail.com>
Date: Fri, 25 Sep 2026 16:22:16 +0200
Message-ID: <1jzex576nb.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On ven. 25 sept. 2026 at 15:15, Vyacheslav Yurkov <uvv.mail@gmail.com> wrote:

> On 25.09.2026 13:57, Jerome Brunet wrote:
>> On jeu. 17 sept. 2026 at 19:05, Vyacheslav Yurkov <uvv.mail@gmail.com> wrote:
>> 
>>> On 16.09.2026 15:57, Jerome Brunet wrote:
>>>
>>>>>>> +/* We can't enable the clock, but the Common Clock Framework calls only
>>>>>>> + * enable() not is_enabled()
>>>>>>> + */
>>>>>>> +static int gpio_locked_clk_enable(struct clk_hw *hw)
>>>>>>> +{
>>>>>>> +	return gpio_locked_clk_is_enabled(hw);
>>>>>>> +}
>>>>
>>>> You need to explain your problem a bit more because this is not OK. Your
>>>> clock should really just provide .is_enabled() AFAICT
>>>
>>> When a peripheral driver uses devm_clk_get_enabled(), this is resolved
>>> to clk_prepare() and clk_enable(). Neither of them check for
>>> .is_enabled(). Is that a flaw in the CCF or expected behavior?
>>>
>> 
>> .enable() does return an error on failure. It is up to the provider to
>> return one or not. In your case, it will be probably be necessary to on
>> the gpio a little.

it will probably be necessary to poll on the gpio a little. (sorry)

>
> I'm not sure I understand what you meant.

>> Note that if the GPIO can sleep, interacting with the gpio must happen
>> in prepare (think i2c gpio devices)
>
> In other words, I should only provide prepare/unprepare instead? Do you 
> think is_enabled can also be replaced by is_prepared in this case?

It depends on the GPIO API used. have a look at clk-gpio.c

>
> Slava

-- 
Jerome
