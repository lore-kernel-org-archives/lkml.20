Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838124973B3
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 08:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792398701; cv=none; b=Ck0FIjMyHd9gYuFvUXl9FN89RspsLADKEgV5hee2MVL5ns9bsd5Bzr6CRjf39u7EDDd6zEuv2AXXckezbS8WaJaUgZI4hdC+YmuXrKsNW7RAwZwybSLpOudEbvu0QZ3iVsWEbnDO639ULoqCeO6xbZXJlnnm0l6uSyiH7OnRo+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792398701; c=relaxed/simple;
	bh=F6GGwF0UndXrEOdTW5UOAWuVGc3KPqmnTmyKeAgfJao=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eLReXLBvqGuD+ZcJvCMnQw9E0cuH8HYhGKl/Y11n2StxsP0RDEvfnO5Wn1H8qXaakgbj1NeYFZvRB4cg19zb3H+8O8AvdAyXHMPn4+fbGqeKgxcI34w0oeO+2FstuhUAEMcKf6kdXc3NlLGDhd+faXc/OJkCyhXc1/2V0jI2cCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vl6yU5ie; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vl6yU5ie"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso983899f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 01:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792398698; x=1793003498; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F6GGwF0UndXrEOdTW5UOAWuVGc3KPqmnTmyKeAgfJao=;
        b=Vl6yU5ieq4TN+jZPAxwre+U8IwR5yIBxoAl3gnQKPP4VUUP7mIJKGbd3Fuz9NkPg3g
         J/9uOwoLIUIbav4KYZ4ENhoCuYesk+juuX80n2i8zFn3yhBaznHOZFy3hjqVb/N0euGl
         jM+nKVgVg8acyRvlU6C8HQkvtRvE5p9OS0IOFsAvRisZ0hr+85nECmIeGtfwOr0JMa5j
         HvwR9RjE8+C34obWHXw+4s+EpYD6/+9WKQGFSoxm6L7r6wiEAinvTZeu25p5MQ1VXltq
         agen/UAop90gaC1ciLTq8oDCjyzZnFdTfcVdbl8F4VSbUb1/LYBvgyp6RIUlNwKzeUiE
         ewWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792398698; x=1793003498;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F6GGwF0UndXrEOdTW5UOAWuVGc3KPqmnTmyKeAgfJao=;
        b=Gf2OkPXegN8YPCdXFb3s8JtFMQvsL1znuF+ZQoqpam3pbZpgZgzBrumgYzSKSgo8tb
         QHO+055nJ7Qyb2Ciunu0E48Y9tjOlofEaT79OBMRw6LgowKizm6404NUkX/T2fkBCA6C
         u+eEDKMegyFAMBkihEMH6QeTgcQy1nmE6Cs2cY1EPq5Rmw+I3NLq8t2TUAqYhINNj0V/
         JPcwOj+SOJS54DmUINziogJscL8LOdPJ+HUucN0iUFSXrq+rxO2TGJiZrunIEBTJCCny
         WN7hmdu735jS5FuEOIr9kAw5HGCCK2Wwlucy30QImBnMk++xhEDp1TUZIzmk7jvUQR7/
         3PLQ==
X-Forwarded-Encrypted: i=1; AKwUvBzE8wqFpWRpl3P/4WZQEwZjuaGXbe+mvTjtGTKA3dLmDBKgaBVZXFVncJjACX+53Y3yXwCBBZnEcfXayVE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLYqKxguXjF6bVr/6VoNTU+tsSHmoQ7aMgKsNFtOSkvuNvJZKpP
	FaARLrB5S48YxCxbuWNop27iWufvWM5PWJBjUj1jTejB+9uaxPpmEpmd
X-Gm-Gg: AYBFou1tR8MfakNrrphXTgSBdGykSgoJJFfvLdQqnN9SzS8NxlfE4LgwT5iW5osMSq/
	Kq0AQdmJnp9Np5pZNrcLAX4ziN+IsQ8y9/o5T97bayFJYyx18CpH4uAZoBbvsInD7DWGwtddhiJ
	vljZ7uHZRun6/b3c3vSzofiyBrgyJ9tKAK6D/K8DndivEul+gvd+zI/dsSqk/LGXm0roF6a9X4U
	Zev5AblbGL4EStGX6/PDbJbEIBdokmpL6wt9CN8wA6iqGejDHm12eDjupWiM9qL9OtNEVA5yA8q
	oRiMa1oTRpz07FZ4SA8A7VwH5OnTdzlKGgll+FKe4qP8/XtdmVeNULghJha66qBXJuYOqBa5Tf2
	jF1akhte66teJY1sMATS+lv/H4VV7rxIX9HPNsdiE0zDQ+lxTEAjzaORZneWzTZ7pUmfKnqYe4Q
	uys2JYhwqXFPW1shUe8z81cy9rNpjj1ds4c1t56Q0bppjBuysgWxIkOSdyH5DCK2hSPRcXA1lSE
	Y2obS9qfUS1lueH
X-Received: by 2002:a05:6000:200e:b0:48e:e9e:129 with SMTP id ffacd0b85a97d-48e0e9e0142mr8100420f8f.29.1792398697381;
        Mon, 19 Oct 2026 01:31:37 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd50d1bcsm22222268f8f.54.2026.10.19.01.31.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 01:31:36 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: Re: [PATCH rtw-next v6 2/2] wifi: rtw88: support channel switch in AP mode
Date: Mon, 19 Oct 2026 10:31:35 +0200
Message-ID: <20261019083135.3251458-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <b9bdebf6dac043ce9b3e285e0d12209b@realtek.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Ping-Ke,

On 2026-10-19, Ping-Ke Shih wrote:
> If you download beacon to firmware twice within a period of beacon_int,
> a countdown in the air will not present, no? Like this
[...]
> The 4 is missing.

Yes, when a download runs late past the next TBTT. The absolute due
time keeps the pace, one download per beacon interval on average, so
the AP switches when its stations expect it; v5 queued relative to
the previous download and drifted 10 ms per beacon on USB. The price
of a download that late is one stale beacon and one count never sent.
A station takes its switch time from the counts it sees; at worst one
whose first count is the stale one switches one interval late.

Forced on an RTL8821CU with a 90 ms delay on every second download: a
sniffer saw 9, 8, 8, 6, 4, 4, 2, 2 for count 10, the AP finished on
time, and a Windows station followed ten such switches (counts 10 and
50) without a re-association. Without the delay it happened once in
nine switches.

If you would rather not have it: timing the downloads from the TSF,
10 ms after each TBTT, leaves nearly a whole interval before a beacon
goes out without the download. I tried that briefly on the 8821CU;
with a 60 ms delay every count stays on the air. Which do you prefer?

Thanks,
Mehmet
