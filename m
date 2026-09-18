Received: from mail-lr2-f33.google.com (mail-lr2-f33.google.com [74.125.230.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E1E4EB866
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 12:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789734268; cv=none; b=DChyyz8gMWqD4UshTOB2Ic/ypTy+6TYUSm0kVCHeE7HoSPv1fEoii2F9+EC8br24BYqptL8ToI0ngf83akopCX0WIuZgw777E7Pv8EHBY81G7kmcyhYut82F+os0klvs6xi02c47MhUbpPyhhm5eKsbzILgqwEAjkfGxMq7Yn1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789734268; c=relaxed/simple;
	bh=0EUv+GanEqAn1JfFtrxNqUFwolRcvTRXOT2sLEu+pVg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cS8ulQaoUrH+VDe/YgFcK/C+QveEsEVGWToLlbpnSE+6O2E1vIfi/narSwjF6AKHl85MkUMXNxntKdMbeXmZK4VsHBXVfEAAPKURKKwQUmnhr6WmdmXG6FSOqLHVvxLTjrdc8rjp3rLma3xCvVqRjHHy/pvGQfrRTHWqF/hKrEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oTu5ojSy; arc=none smtp.client-ip=74.125.230.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oTu5ojSy"
Received: by mail-lr2-f33.google.com with SMTP id 38308e7fff4ca-3a2ff16c0e6so4829951fa.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 05:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789734264; x=1790339064; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jXA5dsmKNEnAug+zqks6Fez66gO7qKGJLh9NGBSeS+Q=;
        b=oTu5ojSy+vFsMb2aYIMouVUYShkXf+/soY/Og3hlw2QjBAhuFiLKLkHVVUeZKxf0OR
         RFICmH21xAWOc2SmGfT4tnHHL3Y5wSEKtMfrM8W+BjERj9WF7mTtT1AvpFhPT8QjXhny
         EPtZjqchjicUMrdgvbpsM1vPZZUisXUcTI8QZIm8oax18NYxqn81PS7y6cZKYA/0JmKF
         +AYVemn+NtE9eydvuykE4N2u3Rf6C7j0KCjCtrQIpGS0AsJdbjeHt02otnCfcjM35K7M
         Q4XrhdQh6J6QaAqftVuNfXCWl3sGGRunF+Er4/bcM3dasbQoshSyKLk1ktUiaCbDJxFh
         BD+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789734264; x=1790339064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jXA5dsmKNEnAug+zqks6Fez66gO7qKGJLh9NGBSeS+Q=;
        b=qiUh2tOfAbWsTncImEUykTBFfSn1vnsOumcwKqmqJq2/uUMq7W60SXMMSn8MB5crz6
         fz8TWbXXiK4KFzu1SspHVpVoQfyrAmSREjYmLMQMUD36UjxNaZE+Obqdr1tOLbJUhON2
         dE9LcnfuALURxyGdlvZlOB1Zu/wlZCyuTVhUTLiCWgh1Zi6nVeFPl3UY18VhjdaRrEVV
         Buvu08Qp9KDM8U1PSXqpHT8Lu2yLk9SfUF2e2XVjEJPfgmaUcFwFDHtzLqmMZOX/Eo+l
         WVfVGEPm/TO5IHEktOsPR8U/NIjvC2qC9j38oOMMq3bz52zvTOTvoyJkLQ95Duc2uSJl
         PK7g==
X-Forwarded-Encrypted: i=1; AKwUvBy+EvewFfcO+XjLh8r2IVDrzL3DuE7Y1YEyEshpEJYkxlW9xjM47ULgO5slU4UBY+KpP8YqoHoEcrBohdg=@vger.kernel.org
X-Gm-Message-State: AFuF++kO0SpdW1p12BHCmh2SkzmaZBGNpsWgbTIXJElMMajjeMq8H1TS
	62F+7IVv9yELIVWhH1wb5L80wnGDHLAPliMhM0JV1JG3a3yfdXy4h1ju
X-Gm-Gg: AYBFou28U5C1raxpvniHjxyzo+1Ki/OkI0QfjPEazFBmra+AWE1kVx0SsnlpWVKPAXg
	TdVQ+zMOo/IzfYT3KLhzyxhgmk7YFpm1s9OtridoZgIMnTghP4lRtdDQQ/iy9xgPzJdGaeSKtj5
	Ycs/2fihsHjYDSOCk1MwXmNlyBSSBGukfHVmvK/hpHl/nVi0rlih4Z+8wYi06CAdcFi+kdBqTRe
	X2GoLjhxYRLAUGuIloLF9u7s2wJOaWdnQgWReRFPQQ2cHhR6vHuMcu8GFfw2JyGcss/UuBE+bRD
	7K1Heg6uU7XyXlD+JagJuc5ZP+ah7ewXlpQl/fP6DHlmeZc5erHvqfnO2GAigkAfaExsu2VAQy/
	qC77vjPP538GX60oNhBCDacTAhq0aOiI6UGSSLuIvLXiNlPQnMSzhUcF4yqeQwUfqHLfYRuogfu
	zZIs3XcJj1NjDcjSDtDCOsUQvHZCiMgu16DiFiUWi6xZV9BbKmabhAyMKs0HoN4PTSTeanPBj19
	l4+RIhztIS5Gci0f0yYy7nhxU+wIJ3hULFSJoVasedIgg4/wrHCYWqKoNXRtOc0k9oUSw==
X-Received: by 2002:a05:651c:2113:b0:3a5:db7a:23b0 with SMTP id 38308e7fff4ca-3a5fbfd830amr4870991fa.22.1789734264223;
        Fri, 18 Sep 2026 05:24:24 -0700 (PDT)
Received: from yantra.. (dsl-trebng21-58c187-236.dhcp.inet.fi. [88.193.135.236])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a5fd7b7248sm4526681fa.10.2026.09.18.05.24.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 05:24:23 -0700 (PDT)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: jic23@kernel.org
Cc: Andy Shevchenko <andy@kernel.org>,
	Bill Wendling <morbo@google.com>,
	David Lechner <dlechner@baylibre.com>,
	Eddie James <eajames@linux.ibm.com>,
	Joel Stanley <joel@jms.id.au>,
	Justin Stitt <justinstitt@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v6 5/6] iio: pressure: dps310: add hardware FIFO support
Date: Fri, 18 Sep 2026 15:24:22 +0300
Message-ID: <20260918122422.375244-1-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <178813888151.2788519.16547013180884814648.b4-review@b4>
References: <20260824201203.396651-1-zoone.rupert@gmail.com> <20260824201203.396651-6-zoone.rupert@gmail.com> <178813888151.2788519.16547013180884814648.b4-review@b4>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 31 Aug 2026 02:14:41 +0100
Jonathan Cameron <jic23@kernel.org> wrote:

> As before I'd have the structure locally here. I really want to be
> able to see what it looks like.  Don't worry about the small amount
> of duplication this will entail.

The FIFO path refuses the timestamp channel now, so the two channels are
all that is left. It is a plain s32 channels[2] there rather than a struct
with a dead timestamp member. The trigger handler keeps the struct.

Rupesh
