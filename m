Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CCCC477991
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 11:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788778959; cv=none; b=n2O5sAgM+5KtxAtsWxGHQkkK49nD3D3vI4YK5oGlkJ4b0EtsdRPj6dVO6cfZnyzTKdg0LFUYrsLS8pq3HYZ6/f9eqF+GdCfejCp2H3vhHQ5WYMfXTUKZbhad7+4CrUvYPzt9IxLot6tE5UuQlrgJf96aj2JhLYb+QdwM8GwsVt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788778959; c=relaxed/simple;
	bh=cyNAgS+LY6NkA7zAwdAWlAf0LD7Ox1jZEAYPWX/rymc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=leakmBjPbXr4SWd98KICL4PH5CrIxgz8udiI10cVevpSNDhUJGFN0+JQBu8e5kvW7x4rpYBdAX6pMU5e51JsMxFIY9jdrCAOLuUJWXwiri0p4x5hEtayFR1J3A8RSd8E4ML/XPZYKNJpk/K+6etqD06enLE2zRIPIUtsVlvPJSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QNI1e1Rv; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QNI1e1Rv"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-482f9309813so3022578f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 04:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788778955; x=1789383755; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cyNAgS+LY6NkA7zAwdAWlAf0LD7Ox1jZEAYPWX/rymc=;
        b=QNI1e1RvhVFJrPOS0JzMSgIwXf8xVKmc+kpVePpDmIZnaf0IaK/8ojO6m/TqlWzlaS
         tI95bf/DXhKaDgY09pF+4GAcl6yUh+WH0KXjjZpHYPdYjAxB+I/grCh/lw0QigdALGrQ
         2K96dg1HrFQ9A89xfnIwQfDpaKUvWzOOEBNNN6h5npeLsn3EChPPaoZbygbW4UnRVU+E
         e+1ASwWCIq22Gapv4o8S+ubSIMo82r9sEaDYko4c+Dr/uZpikNQh17FhY8MIijujP4j/
         2Mkj5d4fM6qbFf98T5FBH7fzhZTwsVeyZy6o97Ubj1c3aHuuk4bvP/KOjNrRbcWrQWOg
         iQEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788778955; x=1789383755;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cyNAgS+LY6NkA7zAwdAWlAf0LD7Ox1jZEAYPWX/rymc=;
        b=jmU0846oyMhwcwPAUHhX74mxIYxznbHiqukS54s2AcoYWXT/ClJf78+fA0M7SuH4mE
         pdxqOBGGybDeA1eVsIoGLHQ2+TvuxY/03VJ0LXStrCxzZY+Ula51Y7OPvEiIEGb/Ou5+
         XhaswL+K/lvs2dktBUXiABVsmcazaBV1LArmk4qcjoggcVa419xeP/pdWoi+TOW1qk2D
         AzSr4J4pezDpspYWAtrSGie5h0bRwkJLrwxD9bOjLZjMRW8PwcLQnHrG9VpkTTq1IpCQ
         WOimgjWDgO0GxulqpOT2Ov52OmB4PNmrmxqy+DAnIiiY7GVGq56EqGNvRqp/0yHcU0Wc
         ta0g==
X-Forwarded-Encrypted: i=1; AKwUvBwff6aARs1Qqj7oXApxXQJ0OcTSekSDlqafpeZOSZeteH5H4jzOnoRh5Y6LndcH8D62GEPyB6WwHyG3kUM=@vger.kernel.org
X-Gm-Message-State: AFuF++myvj3CWV+/POjVe9GbE2waIHjZ1y7wqqFTA3NhZBl7yIveMDDw
	lFqzHnmBqfzlNr6HQNWq8RUAnQuOPImJYfJ3BJEknffdL9EpK4snfJ6X
X-Gm-Gg: AYBFou2rzt+Vol0if89HtF7IxiPmptJV+dNJIhLvqYdMHO0LRNYCWRqZWEvkujDAOXU
	ddzy/Sk/d3RXxxYmpqHvfqQtk9VY19IpVUDr0nqWr4p/sjym/J+y2WmBAtU8BKRWUmuboLHVOnD
	MLhMamT+Rqnq8gUkgY96NMTZIyNBbifNQAEB2HmzWN9tiSn/Th/CfE9gJkSgIi5630nsMqUjHD1
	b4xsPJqzpRhIOe9dS/TU5nBijtuReEBhGK9rv/gEaZfbJoqZFxs6Z9gmWkUoQDwHjiioIXMMVDY
	Kezte1YoWUeeFRPc9BizxKmS4F50wGRhVapay8QMIwT6cGtm/wfUWvyvii9Ss/BMbbUwey2TED/
	6JxtbOcLRqsT25d0ZhOlZM+dce/WJIe8IBYXr5Vd+k+Ev1VZMSHS6xNSfeCMKXqWVi30hzIoqwn
	wvKpNbNaJ0cC/kaO6GciJrkrvybx+kS0LDQPSvTClxUXSMuSqdI5CIABrvV/nACUbWngRirGaaV
	3miwVVvRFxgI0h4UQn7BXpRUjk2Hi6juvkf6dXNDfVGhBUx8qKrlpKlyTHM32ruZ8xAZ1JkwKF5
	lWEtiCphsA==
X-Received: by 2002:a05:6000:4812:b0:485:8c16:5ee9 with SMTP id ffacd0b85a97d-4858c1661f7mr19695223f8f.35.1788778955023;
        Mon, 07 Sep 2026 04:02:35 -0700 (PDT)
Received: from kdev ([81.56.8.150])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858bc74298sm24660979f8f.6.2026.09.07.04.02.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 04:02:34 -0700 (PDT)
From: Fabio Cesari <fabio.cesari@gmail.com>
To: Joshua Crofts <joshua.crofts1@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] iio: light: isl29028: fix runtime PM reference leak on error paths
Date: Mon,  7 Sep 2026 13:02:26 +0200
Message-ID: <20260907110226.244314-1-fabio.cesari@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260907091938.00006748@gmail.com>
References: <20260906131203.125407-1-fabio.cesari@gmail.com> <20260906223737.206730-1-fabio.cesari@gmail.com> <20260907091938.00006748@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Joshua,

On Mon, 7 Sep 2026 09:19:38 +0200
Joshua Crofts <joshua.crofts1@gmail.com> wrote:

> Please don't send a new version as a reply to the previous version,
> it breaks certain tooling and workflows (b4 for example).

Understood. v3 will go out as its own thread, with links to the previous
versions in the notes below the ---.

Thanks for the heads up,

Fabio
