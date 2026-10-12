Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A3303A9D9B
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 18:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791831082; cv=none; b=Toyny2A3UrORGB3iaU1bq9tth8acWFfYlU/GcW5qeTqz2hzdQ/M3ejqaZTJd4Jv6vej+SbO4yV92SNS1wDukl2WcyWJ5HtBlNjHWUVZSForSR/wkSZeP0j5shanMh0OuvTnM76DPSd5wafCBz7eMmpX53zS9lTlTiwmhTJ2b3yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791831082; c=relaxed/simple;
	bh=tV93B2USbWXjjDndwiQAqRO3pt+vPvH7KAQSCxUonWM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=V/AhgoESjrfgyIfnzfqjvUlZSADOq8Cflil0P/fHakh+cQxOQHJ+x2GTAYmnZVniNB7beTavUFfjNzKr/F3ydh6KJVokpZhkc/SBC/pMbIZ+V+DLJhVtUDziNlBykxQE7cL31w43Q+5wuLaxT4NbtkW5hqQdJ9ABbhHZ+pk/v8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=pozQDRlq; arc=none smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="pozQDRlq"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1433e7b057fso1505170c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 11:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1791831079; x=1792435879; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dCiWRkzKBlt1QS3CoF+R9/K21AAXjdQ5fMMqNpuft5k=;
        b=pozQDRlqvuHymaajl1aljEAhNvTDxDVaRPtk5izULri5xkLeiPo15CZmxYVFHmvAG+
         P1sd2U9RPTAn7iRYnKhxr/IqKQhnP28/Qjga+8yDuZpD4WsLnNbghBjCnWkJMBrZ74HD
         MIpFJibtqCxEYPKrHauMLwUUGHNSo8ph1okGL0oH2q5RzJQFiFQGeelPAHZ7EbcjYfo6
         cjBw7HFiSpJQvFINj/KO0f+whxLjcXb/0HiuflAR5CY4vtqsKQgEymPWQmBJuka6argQ
         3q+xKlOB95B82SqZJUT+kI2wcw3daC4YKhzi1B/tiNj28dOmb3DcnaX0pw/X4uarO1R6
         5nTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791831079; x=1792435879;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dCiWRkzKBlt1QS3CoF+R9/K21AAXjdQ5fMMqNpuft5k=;
        b=AGT4xzuxReGoLUhnvF1iUt9ZuIJ1llO8Lh7djJNaZD/9srDk0XnKthyOzfftrzQALg
         +9120m3Gs+Qe46qrAw73RDR6RsArR7uM+Acp4Z/ZU9XCKBdPXB8dA9VWMifNIJ79MEy8
         8DYqJieZDtEetOlHaEIqiqV6Yu4UqlNWLY2mLwm4J1BmjAkZowa9JuX+QAXGgl/MaqjG
         0cZFbOspAoP2SuF0VqEdnxfJpdTHs1Sir5zqbUJ7YtFLcLfAtlgj7y1NMs/bxmuRFYgf
         i71VxuflKqb5gV7U0CZYYKr1RahSruc+yqWbHeLCrxQlLIaQfVz5H/TQv7GRv7lZWNe1
         PwCA==
X-Forwarded-Encrypted: i=1; AKwUvByFuYc1+Vh3JHf7gLDZmTDI6FP12iIXA6DNy3Lv/ZCMTMji4WXIcBcXPrNxJSfIhENBjRYbVI6lc9i5n+w=@vger.kernel.org
X-Gm-Message-State: AFq9FYIYAH0oAo/IpsJKBuOSKMMqfQTDNUtDZpW6fnSbCacA6wTnziaQ
	7KhEzoBE84NusopSNrTzRfShBvFzJLLQ6HbLkSzr6siemufE4fFGkZzT1zP91Fj9Xhoi08mlgKB
	R4X76Gf8=
X-Gm-Gg: AYBFou1m8FAO1oY2rYIK/EkFtV6XV3n5VlRMqTbch/qXg0ut7wJsnViLrDRpsgHtfkn
	iIUHjuPll4M90XI/V62RFvJdZHronDSifQzkaqwQo9L25lycUXrIg41OuLQ3r2suDW2wa7FEB/o
	mMXJlauV+l52Gf5IbFFO6lq/YtKQPX98wAqWRymbCHjgWfZu2IMrascu0vfUfT/nGWhe/D2Vena
	dMr9MSWIYAZj+owzHX4S8opGfUfPEJWzMaDqMqkCbE1qTU/asf+dpS/UM1zZHS7YYEOm5VqUe8m
	tRjC4K3OF6G6IyoZOHj0laYq/n31lAzoSv5GDhDP9Ak8gVgXehArMXplHbXzUDF3GUHPe7QhP+J
	3YY4T/5jfRgTZ7y5mxM7uQ1ji8g3BWE4pqGAUfSF/o7Qq9XhqTCuTtN06hn+r03l7RO4LIlkgnF
	aF5ijDdM1KW0lcfehndeOsgKZb6QJJTxxKZhX1RBTikpVtKpbY0AK1T8W6A6GGbeBwoUNGBEyyv
	g89hDe8yASbHJssWCSSA8CDvVykjBF9QepboJfjuVFnz3Fkpvin1TWL3Q==
X-Received: by 2002:a05:7022:296:20b0:175:c19:93f3 with SMTP id a92af1059eb24-1750c199477mr4258063c88.38.1791831077751;
        Mon, 12 Oct 2026 11:51:17 -0700 (PDT)
Received: from [192.168.1.106] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a2f17feasm41738221c88.9.2026.10.12.11.51.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 11:51:17 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Chris Mason <mason@kernel.org>, Jan Kara <jack@suse.cz>, 
 linux-fsdevel@vger.kernel.org, Christian Brauner <brauner@kernel.org>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261012-work-loop-change_fd-v1-1-3cf4ec349bbb@kernel.org>
References: <20261012-work-loop-change_fd-v1-1-3cf4ec349bbb@kernel.org>
Subject: Re: [PATCH] loop: remove support for swapping loop fds
Message-Id: <179183107703.215281.4436365988182227970.b4-ty@b4>
Date: Mon, 12 Oct 2026 12:51:17 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Mon, 12 Oct 2026 14:47:08 +0200, Christian Brauner wrote:
> LOOP_CHANGE_FD swaps the backing file of a bound read-only loop device
> for another file of the same size. The comment above loop_change_fd()
> says this is for installers that want to free the original image and
> for HA setups that want to switch to another copy of the image. When we
> discussed deprecating it in 2023 (cf. [1]) we found no users at all:
> zero hits on codesearch.debian.net, GitHub code search and
> cs.android.com. The only things that exercise it are strace, LTP,
> stress-ng and blktests. Everyone agreed to drop it. I just never sent
> the patch.
> 
> [...]

Applied, thanks!

[1/1] loop: remove support for swapping loop fds
      commit: d4fabede1da0be116fd4cbd34ffd275e394526eb

Best regards,
-- 
Jens Axboe



