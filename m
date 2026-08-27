Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05F9A49480C
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 19:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787858219; cv=none; b=mod8vsL08JcrKW40QxKsmdN67EHAXy66MzObsPZiD4aTs/3xtg3dNeeRqjGn6NhSztLM45X/hcIJLnnE6pvi/m/WHEoS1JyYNxBAZLSYifwL1dm3MjpY19oSpS6FWGdS358ZbqxBOJEaJN4+WI0vJBN12JnrvPnV/uncm54yhsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787858219; c=relaxed/simple;
	bh=W65090XdDBw7UhVDTVjxJFTTrT5+H9xvtxq4LX1QU9A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OXQaVZOGk7V2i5vOqhK/Xkf8MxaRXh/xUHMjKQnjkFHXYyQqD3fKfzMWAI3KRCXFv8cAvqHI3UAWxNhB+a/Cao/vyzga7H35TOCe8MxAZSSb1QZ/dIupn7s+X0odndAokE4uAWuze6+ipVRehyPDWfGhiQi0VkaBtOziduKjgqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GW8W0t6t; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GW8W0t6t"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-47fe89fb333so119587f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 12:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787858214; x=1788463014; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W65090XdDBw7UhVDTVjxJFTTrT5+H9xvtxq4LX1QU9A=;
        b=GW8W0t6twdwAwLTLmEFFYso9t53eB4DYNG5Jl6InpAiPhtoLrqulQ8Q7HYCexTRJnl
         qpq9hsFycSUNuqH3FuzZH9BJUbKOsoLuNsg3RrQENKG2zv4Gbzd7oaB7UM2TXRIEqkrG
         ABVoR8qctgtdkXDboWNhbuW0lKmnyLJHWWMVy2FZqbLoJoDnVTMvksZmXPSEhbv8Q7k6
         ljmEb9l5sJOrGtphawVzDsVaNBGCRtg056ovub4SBtU4JP/jmNh5OtWPCj3axfQVCQEj
         bG2YCQvk0ifJiH/PCn8hvTpe1Cqb9RX+wCaiHO7wEB43GnTzieKamLmA/jzbBtCaMMNZ
         zg6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787858214; x=1788463014;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W65090XdDBw7UhVDTVjxJFTTrT5+H9xvtxq4LX1QU9A=;
        b=jdmK5s8OuXdbVJ6OC6ztqPAbhXeKiYc3/Y6DNcuN2XMaepr9K8P2Nxw6JUgK2zIapx
         J1Qj4Lu5JsbIPEB8/osZr0YHCDIE4crgXQrUVQs+Bk+jygYuCQIeNh2iIq/zrOu41URe
         uExlp3zk/f+plkFfFSICnG6yT37Hf3QKP9M3ROdDPMQYkSIhB5BEr4CRTwBS73DuhC9Y
         YrQl/HK143DfN5FP76MORTJGsPLwxEI6yMOcUdPpq5lktXG+zkWudweVa1SKSPi0HVlm
         rnW3k+XYn/rXBUvia1m2G7uB3CjtinfyWlkFWoTqN4H+6Z57e13IncFqMAcE1dyAb+A9
         iY3w==
X-Forwarded-Encrypted: i=1; AHgh+RobcFaYJpKT8L0z1zt14TO+nNY0ZAXRevbXhRtSCJYlOVUg92sBejqTs3Le7zw83wKvHjrT5ENi4vbRP9k=@vger.kernel.org
X-Gm-Message-State: AFuF++kbLXaHnN4b++9j74So4WUq50uAJcnU8I7v/6XbW0/YWoYNNjJm
	VPvePrV5KuUprs7Ha9/QmiTFUV+IiCL5iWCxtvqLF7IrWWN5dyAeKOfI
X-Gm-Gg: AR+sD11ZVZwpoTb1UJleg6+D91eyPgW7Q9OrFOz8HaJ+S0//5QFT4fiFYScjgedqzML
	pQFRpZsfxnUDDfki22NWifMQwvSjvG6hfzAX6HKoJe6tUP50DgIU9Pfs3YZqTImlAS9UzQEU6hH
	Cmmt3reBwLCdxHVtatFERgnGDSIz/t005x2FjmK7WY/Py+yZQTcsyxY61+wVvBS9yzLMdT3/hMt
	34i4hYrl1AfoD2A5nhHbmLEj8b/xjni1/iH4gBSwSRMbhCBDr4DQ+SVF/l2/7HfRs8krAbubfeJ
	1KpqZ8CnZBESPDGhscKT7SnhiRmdPGnFFNthWrNT0j5llilYOX1ZnY4IHNWVx/JbM9IfXtQJfit
	C1l99bPgmEppqvAOkpuZ3ikVsma6ST406E+bH9HPy52++h764RrL9UlR7hPgsf22W6mo4uCH+LF
	ee24s7YTMQLCPrdA128o5u0cvpyVe3TOiwpC4mkB8afRGZhv1SknJuxnLGlm4=
X-Received: by 2002:a05:6000:2489:b0:482:e4bc:51a8 with SMTP id ffacd0b85a97d-482f7992e40mr1312918f8f.7.1787858213511;
        Thu, 27 Aug 2026 12:16:53 -0700 (PDT)
Received: from m2.. ([37.142.156.156])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-482e27aa050sm10505002f8f.12.2026.08.27.12.16.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 12:16:53 -0700 (PDT)
From: Michael Zaidman <michael.zaidman@gmail.com>
To: linusw@kernel.org
Cc: bentiss@kernel.org,
	brgl@kernel.org,
	brunoceg1@gmail.com,
	contact@christina-quast.de,
	daniel.beer@igorinstitute.com,
	germain.hebert@ca.abb.com,
	gregkh@linuxfoundation.org,
	jikos@kernel.org,
	jirislaby@kernel.org,
	linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	michael.zaidman@gmail.com,
	rio@r26.me
Subject: Re: [PATCH 01/13] HID: ft260: add serial driver
Date: Thu, 27 Aug 2026 22:16:40 +0300
Message-ID: <20260827191640.11725-1-michael.zaidman@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAD++jLmCVfG4AQ_pTkYouGCcKgN-eh0wsRGQby9dPvZVFMpMDQ@mail.gmail.com>
References: <CAD++jLmCVfG4AQ_pTkYouGCcKgN-eh0wsRGQby9dPvZVFMpMDQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 25 Aug 2026 at 09:49 +0200, Linus Walleij wrote:
> What kind of "enum" is this that re-assigns 0x00, 0x01 etc to
> several enumerators?
>
> Either this is four different enums or you should just do a
> series of #defines instead if they are all really coming from
> the same place, because using an enum like this does not
> make sense: it's like numering pears, apples, oranges
> and peaches in the same enum or something.
>
> Also use the UART_ infix as mentioned in the GPIO patch
> so you don't need to immediately change it in the next
> patch.

Agreed. v2 will use #defines with the UART_ infix in this
patch so the GPIO patch does not rename them.

On Tue, 25 Aug 2026 at 10:12 +0200, Linus Walleij wrote:
> You need to CC the TTY maintainers and linux-serial on patches like this,
> just keep in mind when resending, thanks!

Will CC linux-serial and the TTY maintainers on v2.

Thanks,
Michael
