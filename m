Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C95894A6CC6
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 12:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788440337; cv=none; b=aKAfR0kD5wUQdGDbtiDMgqf5HNbvWR83ESgLvRd3xwGOu2rmHhBvSSYzltCH4wiEw6UpA+Wj2fNlxxF+maN/Xk2L9kc4JNZkXf82II6lTUVvkb53IIuBSto2w6zLgPvPTdW6A751TuTVu/frwdlbaaodaPUmd/reXtr7kdgBFdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788440337; c=relaxed/simple;
	bh=kIf/5SJJtGo1RiYkQqnGmcJ4G6mmuPYq6VWJp6j1Gfk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=VCyom8tctwEsYgYbEh35+HbyqBLM8E5xA5JVv5DxqIodRn5MxxF6ZKBaQTStd+Zuy4nUFGOs9hCBrup6sm+fCFJqDPGVxsxSw9KFFUuVhELeGZIG/XDsqgJbCVeOG9usd31f4MZEbVX8IU8wROWkj3Ez/Y0cG8xUa9qYXOaaDzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=SPbgY895; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="SPbgY895"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49557167508so23502895e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 05:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788440330; x=1789045130; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fUOhnrIRug8NhLOWvB+hNSnIHP5x1LfuWaznHtYn7Ag=;
        b=SPbgY895cr6WExgVy9G046xElGP7xbC9h3mS0NIGr07A/Xkz6D+ggcCZl9RlUpekTs
         Cqlty0W59oUb6rUTJrkX3AyrEGw2u6Id+ppWMvrLHBc56543/ya5f576L18jcVGNZmS/
         jNIgMYRLF0s5KtnIe7VbHJH0PylGJQMF9uQTDcRSrC/Zwk7wz6BapGvgsnMy+qFP4CdI
         JoQkALurra/Uqn7LJYAd7xjJGcIuhgjCFttVeqnAtwEMMvWyKoC+9lzCIA0p4zr9Hkn2
         YLHBohwO9u/Ew/RzqDkyHGQHvBpwQajaO1NZsBNzIbwmAmYPF+nFTzzksSkoiDO+eU+u
         Bt6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788440330; x=1789045130;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fUOhnrIRug8NhLOWvB+hNSnIHP5x1LfuWaznHtYn7Ag=;
        b=bSBeJP3E27xPf+fWXOJxig36tbTK+vsYSItRHbzk3vP6NXHvNezp93IvjlCf+yXqZQ
         ZLktWMJkNCnW7MviadXD9Qi+A+9UB7n81M/mO8OT9lkcoTcpua/R3mmXTfXGNAOW9V73
         6NRiTXJ9lv5WPewE3Yp+P7WGtUJKntM2jC3qIkMXdqyQC6QWiNJ19wclV5Y4nXkpLf6w
         UB7T/Wx2fbMIxYaW+Tx2vPY8VLt7ws6X50wvrL0LUW1UJShAJOokTHD7MxRxTCmeh6Ps
         ZBnL8BQnzlXZIWF3j1yDq+P10aIC17FtDCZmIP16zHdlyEldAoVgEMDo7O/vSggn+eC2
         qcoA==
X-Forwarded-Encrypted: i=1; AKwUvBw6Hj6zGthcwXxBPkRkffEO2xV54zzqvKD/zNz8L30wXRSOrPutbbA3ebHe1vvcW+DME8DYuEysZgNbilU=@vger.kernel.org
X-Gm-Message-State: AFuF++njFd7vnMB0XfZIFYuwMRJFACiB8+a2G5z4inmEFxfh5xY098+W
	uaRV+QiSxp3xM+HrXy93zkV9a1beKkS+E//GNfp5NPvpvu+n6qQ78dypVBoWP0FjOgY=
X-Gm-Gg: AYBFou3ZrQuq7dWuqgQj715KPyVJJ2tw5GHUZgc9VF+/eN53N6rkBXjpgI3TnBdP1QI
	sWFr7LkLyIByrjTwwgabPBOk8trMAzA9RhNFg4hZvRZGKzmbaAC/u25AbXeyOCLtq9s3SCx77mk
	FsBaJ14iCqoytV0D3ZHmyZHW1vDvgaEI6oWCWJDkk4KciJr7Tvh60QIQeSVXrfPtKKf8zPT7AYK
	T/u4pddYBd0BBkKoUYIW4yXp6WX+caXDeKCV4W6XI437V1tmTGuKYm9F33jaaw8kQDzDZWRQrWp
	JLlvIhujsp4tGVXTUc1+6oORNgJ+0SdGOw0ke4pGieHGFQgt78aIYz/A6NalHzNwWxxMe2iKOX0
	iI0vzs9DMbPAW5Bhy0L0PIj6aH5EKFtStEIBwg606+XDoxfzLlBsarmsfGHr8mo/3QOqUDdeVuE
	GQXIzO7O2lebQMH7btQSK8QyHl/f7XmJVIP0jNeAe7ioOoPbch+Yk4gzP33rcoO9C68nIc4fEeM
	bpHaRY=
X-Received: by 2002:a05:600c:83c8:b0:49c:d52e:d0ea with SMTP id 5b1f17b1804b1-49ce581779dmr225433345e9.4.1788440330042;
        Thu, 03 Sep 2026 05:58:50 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee6023edsm67989285e9.7.2026.09.03.05.58.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 05:58:48 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: tanure@linux.com, Neil Armstrong <neil.armstrong@linaro.org>
Cc: Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Jian Hu
 <jian.hu@amlogic.com>, Ronald Claveau <linux-kernel-dev@aliel.fr>, Brian
 Masney <bmasney@redhat.com>, Chuan Liu <chuan.liu@amlogic.com>,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject: Re: (subset) [PATCH 0/4] arm64: amlogic: t7: describe the VIM4
 supplies and keep the fabric clocks running
In-Reply-To: <CAJX_Q+17CLQ_4-rcj0KD6kzPWnChQfD3irCR7-h1bGH9hWiD7A@mail.gmail.com>
References: <20260829094758.23248-1-tanure@linux.com>
 <178818026093.2318126.3676223463693214854.b4-ty@b4>
 <CAJX_Q+17CLQ_4-rcj0KD6kzPWnChQfD3irCR7-h1bGH9hWiD7A@mail.gmail.com>
Date: Thu, 03 Sep 2026 14:58:47 +0200
Message-ID: <1jecfa8pa0.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On jeu. 03 sept. 2026 at 11:05, Lucas Tanure <tanure@linux.com> wrote:

> On Mon, Aug 31, 2026 at 1:44=E2=80=AFPM Neil Armstrong
> <neil.armstrong@linaro.org> wrote:
>>
>> Hi,
>>
>> On Sat, 29 Aug 2026 10:47:54 +0100, Lucas Tanure wrote:
>> > The Khadas VIM4 has needed clk_ignore_unused to boot reliably. Without=
 it
>> > the board hangs at random, loses storage and corrupts memory, and the
>> > failures move around from boot to boot.
>> >
>> > Six of the SoC's PWM outputs drive the board's voltage regulators: the
>> > always-on domain, both CPU clusters, the GPU, the NPU and the DRAM. No=
ne
>> > of them were described, so Linux saw the outputs as unused and switched
>> > them off about a second into boot. The regulators then drifted away fr=
om
>> > the levels the bootloader had set, which is where the corruption and t=
he
>> > random hangs came from.
>> > Thanks to Chuan Liu from Amlogic for helping me indetify which clocks =
are
>> > critical.
>> >
>> > [...]
>>
>> Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlog=
ic/linux.git (v7.3/fixes)
>>
>> [2/4] arm64: dts: amlogic: t7: fix the pin groups of two PWM outputs
>>       https://git.kernel.org/amlogic/c/ae7be5c58a819259e5eb98a3abfa60842=
478f2ae
>> [3/4] arm64: dts: amlogic: t7: khadas-vim4: add the PWM-driven supplies
>>       https://git.kernel.org/amlogic/c/1e5a53bd16ac501e68463e84023d1bff5=
43cc696
>> [4/4] arm64: dts: amlogic: t7: fix the pin groups of the vsync PWM
>>       https://git.kernel.org/amlogic/c/406292fd75f95aa3010fec95b5beb5a8b=
7e3ba3a
>>
>> These changes has been applied on the intermediate git tree [1].
>>
>> The v7.3/fixes branch will then be sent via a formal Pull Request to the=
 Linux SoC maintainers
>> for inclusion in their intermediate git branches in order to be sent to =
Linus during
>> the next merge window, or sooner if it's a set of fixes.
>>
>> In the cases of fixes, those will be merged in the current release candi=
date
>> kernel and as soon they appear on the Linux master branch they will be
>> backported to the previous Stable and Long-Stable kernels [2].
>>
>> The intermediate git branches are merged daily in the linux-next tree [3=
],
>> people are encouraged testing these pre-release kernels and report issue=
s on the
>> relevant mailing-lists.
>>
>> If problems are discovered on those changes, please submit a signed-off-=
by revert
>> patch followed by a corrective changeset.
>>
>> [1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
>> [2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
>> [3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>>
>> --
>> Neil
>>
> Hi,
> Please don't take this. I will submit a better version.
> sys_ampipe_nand should not be critical.

Please submit a fixup change on top of what you've already sent, with
the proper 'Fixes:' tag.

>
> Thanks,
> Lucas

--=20
Jerome
