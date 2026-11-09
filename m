Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794217315;
	b=CZFfMb89ipvnT7XAulkYumqAHUwJJMDvNDt8YzLjgHBXDGx+odgDuFGYweyvFd6LkIBm
	 3UnUNJ4DfU9uzWnY0CzaryLyFsBDLLQias9+88+X9CDhOGJBNXnGsjNyTa2Kz2LXrZFav
	 YPx2/Z3TpsB4Aq9L2e1lkQpcb6B2X/I5W1kAo1974We8mCVILcTP/QSqKXDblBhZhhhGt
	 8BCk0ajbfBEyo5IuQPyrqjP+VvcCDvd29eInRuf7ag8EDthIwWs7pwbWUor+DM4lN6PFR
	 KZAXp8MNDEzaNe4hvgKfqt5CZEUByZ2YVD2dBcupGI3Trw+Z1cE62paSoVlnz0lYq1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794217315;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=OxNDojNk4xU4HyXcTA0bs35MHLi3QbYkHxDUvC4/Ink=;
	b=DyFubThTOh6QB8Bpe+m2eEPD9K2PsKvGDHjelnjuHCRHAdv3q5vyYFaRWbXnHmBu4LlC
	 TCKJY8nATb1pzCaiwd2cUdg1AGXj/2nu/lBC9ISZoSrtFMSR56p3f4PDfia0YIXVKeC3R
	 0VIG69OJXqlz1G6NwzyDBSUlYNlgonktBvu1dcEaXfwLJMNiiCtMM/U68TKA7JsQeGwJq
	 Pi01wSyuumyEyVvVgM38Mg57zeIHlEMBgsJ1tCmlV8kpxPKlJkgkyd9/wcEXGrFzEep95
	 FQ5uLc/66dnit0pCg+jxSux71EzXn7q47PdlrUyVpzw5pazdU6DyUVOm/2vaqlKEeyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=23oAPPjV;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F9D3606A322
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 09:41:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F9D3606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=23oAPPjV
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-490d59c3edaso478006f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 01:41:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1794217314; x=1794822114; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OxNDojNk4xU4HyXcTA0bs35MHLi3QbYkHxDUvC4/Ink=;
        b=23oAPPjVuoyJSsO6zIw9EtgP7YPqi78BBG2FKZBW5WVw95R8MCQ7Vo9HrJkkKGz91+
         4ZpDawTEpE8LE8RhIffrlBr3LRTai/ndQ3YU489ImxInXWjIaitfD60i+qb2iT6fFwt5
         egEi6IemEF8Gr2WxG5z499SZ1s3dkeDWYtU+/qW6FibUwYZc+dRDRH1v1FU5Q5e03LgB
         rm/ycVY+em2qzVbRZB8fk1QkcBOBCbzoxif0PS/uh1BnrEQFZg5izhTgAlVulpSrfhol
         n0qpy6YNCPbHZYmAU29OUWLup1cwBCnZHXjEqUNeToQbY1azt2883uopiTv/qMX1OaTQ
         hxdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794217314; x=1794822114;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OxNDojNk4xU4HyXcTA0bs35MHLi3QbYkHxDUvC4/Ink=;
        b=Z8V09dOM7HND7rx7I62Dn0oYojmgi8hMYoKhnfDVi+QqCw5goaNhoQWMf2DajqpWsm
         sifV9BfM1VkdhYFKSMLm2zYe1GfYTzoTzyjEVQohaWmUUuS6zZdROiJvBplHmnv4c9Nn
         rv+mzpeStXen5GRPRfUpJ4qxH6OsxayvYkKQGa7D5KxVNwJKBpDUp5Pyp6mUYeMpoESn
         nD8vIQd38G2eJXjw0z0xI0zWtAgE3XdhuwjiuBvW3c7GX3PAcZtihMltMMVWwg7Y2zql
         YZFHHc2dVu6+tda3E38KGiXYwPdXRt73qJGmaH7VEKils+ftIIvYwY3GblhV9zFoyR+/
         zn4Q==
X-Forwarded-Encrypted: i=1; AL+hErESh184hzqsj8TwGNereUeHubYqzRl0aciFLkx22XacS1+nJT1peTYhQEGlaF6AJyXcs24L2CtK/4OsG4w=@vger.kernel.org
X-Gm-Message-State: APuU4Z8TSzBokC7WV8KUm7eTD1kpQFpaxhdCWVP+TbD7FMLanZ8xwk+z
	WYvl5CC0Q/k9KAB5j7U/szG7lN1yGFkT9jOnoyGvQ3cKW9wCE9dDWNFpruNe9ZPLI9U=
X-Gm-Gg: AYBFou3fJ/ZyFRFT41CXJEI3jZip9nJ9G39P9yy4oUPaxN9puWhbHCwxnfUmjaK6NOr
	+ewN1ppZIYVQvRVcZ/vd5EfNBXt9V4IIov0qTY1+u7k5oh3vSggIwEraTO+aqtzquZaPoQOXCN9
	UWbZVQKHRBu/CSwQk4rxACNwM/c+BEC5MuHrH1Pl3YFw/IahCHi2cb41eFoz5YKSGJoKXbFAA0C
	7PW3+4QhWQbiH4j51b1ngVdxRDAIJRVzT0eJ192+CuzJp/0pslAkelC5iBmzDpH7Bv1tcZDCcvB
	1CkIRmKrHYCHg3/pvZCVNFAsOPBtnbRdeZdrN1c/RdG7vMHWuuxom+68gx/bkCDxhGKBjXUfbOw
	WNllueKFbQ7b0NMrhftndOkY+kjB7yu2VCDZzr4xS341Kd9N9DAFliDrv2441T1o/RImw8gAPRU
	1eyhVoSeHzF3fniN11YmcN3OEZZ0ZJWhqzokZU8JOl9QW1KcKWBGg/OlVV4pvukYtf2izrkAhpw
	OIM5391fukFYgroRKpjx+U7FbrA/NWZMEBPmcsx0FPMfKkPtra8ZQtu/3V+zdjaYUh7szZNx85q
	gziG8wYjbrPm5gzD1M3FFMyVDHia/CT95l9kJpCLzk3KEVyJLQxby0GAWGwTvhsDNeNotEGBS4A
	iv29NcvGV
X-Received: by 2002:a05:6000:26c8:b0:48f:bbb5:61c2 with SMTP id ffacd0b85a97d-4958852d3b8mr7998933f8f.4.1794217313738;
        Mon, 09 Nov 2026 01:41:53 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-496150c6e90sm7278409f8f.2.2026.11.09.01.41.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 01:41:53 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Subject: [PATCH 0/3] power: supply: battery: Allow separate charging limits
 vs. discharging
Date: Mon, 09 Nov 2026 13:41:47 +0400
Message-Id: <20261109-battery-charge-temp-range-v1-0-a967abd8b80c@flipper.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWM0Q6CMBAEf4XcM00oRYn+CvGhlEWPRCTXSiCEf
 +fEx8nszkYRwoh0zzYSzBz5MyrYPKPw8uMThjtlKovyam1xM61PCbIataI24T0ZOYeu7sOl6io
 470j/k6Dn5Ww3jz/HbzsgpF+Q9v0AQllllH0AAAA=
X-Change-ID: 20261109-battery-charge-temp-range-37fc54d4e3a3
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1478; i=alchark@flipper.net;
 h=from:subject:message-id; bh=+odnf1TlzZclfLwdtnwN+ooYti1FGicx+mmm5eDR3iI=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWR9nBrfpsZzxLjaVyC47kzHj5OLZBo+2d8zemZWUB3zb
 PkB24nbOyayMIhxMViKKbLM/bbEdqoR36xdHh5fYeawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyMdYx0jBi5OAZhqdTNGhusuU2+Zfn3Z/YS3ZtH139My3ltUZgZfv7fmxO+8Hclt9QaMDBM+TWn
 P3Vl4xv5whvveTU+yfH4GTlHLeFH+caH8/+f9b3kA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

Some batteries specify different operating temperature ranges when
charging vs. when discharging, e.g. charge at 0C to 45C, but discharge
at up to -20C to 60C. Current DT bindings and power supply core don't
allow that, so extend them with additional properties so that a separate
limit could be programmed for when a charger should cut voltage going into
the battery vs. when the system itself should shut down.

Additionally, allow the DT to specify voltage/current limits to be applied
when the battery is being charged in the "alert" band (either high or low
temperature, which often requires derating especially at the low end).

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
Alexey Charkov (3):
      dt-bindings: power: supply: battery: Add a charging temperature range
      power: supply: core: Read the charging temperature range and alert settings
      power: supply: samsung-sdi-battery: Set the charging temperature range

 .../devicetree/bindings/power/supply/battery.yaml  | 45 +++++++++++++++++++++-
 drivers/power/supply/power_supply_core.c           | 16 ++++++++
 drivers/power/supply/samsung-sdi-battery.c         | 12 ++++++
 include/linux/power_supply.h                       | 16 ++++++--
 4 files changed, 83 insertions(+), 6 deletions(-)
---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
change-id: 20261109-battery-charge-temp-range-37fc54d4e3a3

Best regards,
--  
Alexey Charkov <alchark@flipper.net>

