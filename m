Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793657115;
	b=2oitwV5TM4pUK+TvFu4N6+2ep5eLenpIFNnRLdru8CvOg+O4K7NvgqilvyA+NwRiYh/h
	 XZymFVwklwzh0kxcq+0csVtyDuo/jkyElvx2e5WEppFkPDe/RrcukkjrTLtj7VVH+BfHi
	 VbQJkvsJNwztSi65sblKLoKi2j2zT+Y/h/SZLETc8CoKa5UUonwd3cRC9ljigf7gXa55W
	 IqbtEmo/8ESHYr6Kt+IicRcvBUv+acfYJyFwArs+vC+FA2w7mP4VOQQ66YxIF2Nh3zA/n
	 5gDGE4anBhfcQzPXsUl1PiZSzoScB9NL8ZrB9elsxNOYON3co2NGM302AWBLMN35ehg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793657115;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=po9LaFR4COBNDjXRaH0sos9yo8To8XsMCK5cpaZoeE0=;
	b=jwwu7tHYe9v/SSBU5rezVkMSYrtxBX7b0mwCwTz85oU6+8Zx/spAr8UmQDIQ5lO4RCKg
	 ZqoRE5Pw8zv+uWloXFnkThCJ05tE668uqFqQ66cQ5bM5HlsGVNuzbAz1vTYCrWrieFVgV
	 NS2TxwuDnEnLtOBfZpVShtnmXTEnPIVsjMwMI+w296XH8UiTDRB7QH6euG25/Ej9HltfA
	 7zLa19KDVqLQiNVfZXZWqpWUxR7Z2Bqra1vTDqUrmQFUoIcZV0eXf6nEeEPN1JXudJ8xZ
	 jBJLkkcn//ILR1mhXcesE523l8qtwdB1od2hap80GP9aK37o7NR1CbRuYTGw5h/G7Pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JgsAov36;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33DDF606EEA6
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 22:05:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33DDF606EEA6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JgsAov36
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-35829219da8so116496eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 14:05:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793657114; x=1794261914; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=po9LaFR4COBNDjXRaH0sos9yo8To8XsMCK5cpaZoeE0=;
        b=JgsAov36eHCi4xcxestGz2HdshrJ6ho9n42lUOpL6lQKXpCOfBnFjnryy5u/3Azz2R
         QBtXmKBE3qHG+ej0F5TintEHwkU0I+8of94h0KvhAr7BAoyXbzqsaz3k0dHYzSvxt0mh
         o9A8yJabfYDnFshUU1blgx1XfoBhbZJKvCM2n/P+aj3JfgvU5o8LMzckGXLJRLE8RmOb
         1+prHhFrgG8VBkIw5oi/uib42Kh+n3PbXGiU3YCJX/Oqyel0V0ZDbMGMO+s/L4PS9HIg
         lWFDXvfliB3FFhQThiqrrtnABhPt+I2JzcIfkxI0MRNb4e8X8kTqIoLfG9HDNyaGjXPM
         X3iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793657114; x=1794261914;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=po9LaFR4COBNDjXRaH0sos9yo8To8XsMCK5cpaZoeE0=;
        b=zF97nLOobjkC6v8Cp7aKAgIFxGoa5P5krysnig3cLO8ssgdJE4YYleeLUcTlAYev0s
         6f8As6QuaLyfbhhjVs8YKJ0TvrCMKyPsTmHpH+Z9CiKko8/NTMU+B+ro8U1hQuPqLexG
         XdFxSOelFCBy/Yab4p1kiVcM3XqChiwYMP5TSm2gVdIxz1sb9BBzS9fNn1n+4t4H/k60
         OOejF0I9qkGaJFxp+kBJq51s6ZLBz3Z2Obh4iKcgjy03YwRzpjwIOFoQPL96Ug4cb9Hn
         Q7vY2/RBC7Nsi6sxpY9k+JBQA7gakfTrjzovZtUa6XWNRp0itg5671zJZYn4wA9hM/X3
         Jpiw==
X-Forwarded-Encrypted: i=1; AKwUvBwlGdtV54MqoFjQXlruZp7wA1p79NF0RQhUL+754mS+zIVrAQjXVxHG/yKfK4/UZSZ4SVSxdOzjhmWZobY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8eoxeURZBeHcaynkiiz86H0XQssTvrZJzyENUDbXpfSLdcBrkq
	CO9t4ctgLSxPHNNQM6fy4hJFgsHkAr+bd7xCExFsbsz/bmWYOvVs32Eq
X-Gm-Gg: AYBFou2fPe43IoHeQMF3MJouKyxsKxylYuKo8itzud6Oh/k1aZY22xmMbvFRh9Rdw+5
	SZkipkNkTs5FFkf5lDQDv7LDCg14Ma2qwh56b1WrRN8AYbkuJ5Pe4GXg/tMghhV6v0Zg8xx66aR
	+fU+N7fgpEOk9zMSjyEAtO6r+Nco3PNxR67q0DBqQGmHcODLud/9Qg1IGLXv5/7KKKwcpufUMv8
	Kxz9gtmJdx0eLI2wTC0RmsMbXaHq/fpd1v5JrjYeoYIup8hY9T4fcpUZlHPIuGA3dvg/2AZO6dF
	Lm5eRjRZecs9IeuoQyn3q5Xu7zcVa7j4DScwHmg3wMl5cw+9SnYcT2RRiVLZwaofnWM8xzMcgqQ
	nOtcGNpTXO7Uhseg0ldHgpNV+x7cOC773vqVudgHrvrl+GS47DCczmGtXTeIP/WHK5xVQ/jdlna
	7Lm6GK51akaS/vviJxZ0eVY+OvpSiYbIsvyC15abo5cSitXZKLWGqSeT9btg1wob5mVEd7NWc8g
	16aP3JpCDHedd9c2vAqMsxx1LW2n/vp7KGa9JcbY9aLC5dv/LztSR697EVBrZReMPuP2JZqrTZk
	Zwaic6IvizERrDJ/caKQHOmClYKymDWOTS6mP1I34sbMO65g5J+QwkdtbMzw2qkzuA==
X-Received: by 2002:a05:7301:4d12:b0:369:dc59:7a6f with SMTP id 5a478bee46e88-36a422042d2mr15983030eec.1.1793657114197;
        Mon, 02 Nov 2026 14:05:14 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a4291e38fsm46670346eec.15.2026.11.02.14.05.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 14:05:11 -0800 (PST)
From: Joonhoe Kim <26rote@gmail.com>
To: Vladyslav Tymoshchuk <tvlad744@gmail.com>
Cc: andersson@kernel.org,
	konradybcio@kernel.org,
	abelvesa@kernel.org,
	heikki.krogerus@linux.intel.com,
	gregkh@linuxfoundation.org,
	sre@kernel.org,
	krzk@kernel.org,
	lumag@kernel.org,
	casey.connolly@linaro.org,
	johan@kernel.org,
	jishnu.prakash@oss.qualcomm.com,
	kamal.wadhwa@oss.qualcomm.com,
	daniel@quora.org,
	neil.armstrong@linaro.org,
	kees@kernel.org,
	gustavoars@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 0/4] soc: qcom: pmic_glink: Hold back notifications over system sleep
Date: Tue,  3 Nov 2026 07:05:09 +0900
Message-ID: <20261102220510.1721-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20261022164151.592-1-tvlad744@gmail.com>
References: <20261022164151.592-1-tvlad744@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

I tried the series with suspend-to-idle on a Lenovo Y700 Gen 5
(TB323FU, Kaanapali/SM8850, FSA4480 on the SBU lines). This is v7.3
with out-of-tree board support. v7.3 does not have c7c56b6ec077, and
I left the UCSI connector work on system_wq as well. So only the
series kept the workers off the suspended devices. Without it, this
setup crashed on a DP sink unplugged during suspend, as in [3] of your
cover letter.

- Monitor (pin assignment C) unplugged during suspend, default wakeup
  settings: the UCSI notification woke the system within a second.
  The held-back notifications were passed on right after the tasks
  were thawed. The altmode worker, fsa4480_set() and the UCSI
  connector work ran only then. No I2C errors, no reset.

- The same with ucsi_glink wakeup disabled: no wakeup. The
  notifications waited until the power key and were passed on after
  resume.

- Charger plugged in during suspend, qcom_battmgr wakeup enabled and
  ucsi_glink wakeup disabled: woke up 0.3 s after the plug-in.

Two things I saw on this board, both the same without the series:

- Plug-in of a DP sink during suspend (two runs with the series and
  one without, each after an unplug during suspend in the same boot):
  the firmware sends an altmode notification right away and a DP one
  13 s later. The UCSI connector change only comes 13 s after that,
  so the system wakes up 26 s after the plug-in.

- After an unplug during suspend, the DP controller is resumed before
  the held-back altmode notification is passed on. It tries to train
  the link to the monitor that is gone (about 10 s of timeouts), which
  delays passing on the notifications by as much. It also leaves the
  DP PHY initialised. So on the next resume the USB PHY init times out
  and the dwc3 resume fails with -110. The plug-in runs above ended
  that way, without USB.

A plug-in during suspend after a fresh boot, without the series, does
not hit the PHY problem. It still ends without a display, for another
reason in UCSI; I'll report that separately.

Tested-by: Joonhoe Kim <26rote@gmail.com> # SM8850

Thanks,
Joonhoe Kim
