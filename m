Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793986910;
	b=lv4GwROdDXLEhyTGP3pftQWNcIgoVnA6XoqNmUKRcDYmb3dBdEMCD8sjt7gEiwJXA/BD
	 ktZ659yZGyRRiWZ6u7YVmxzhvNO5NIvjeCa4XvB0IPhIYC6vQ/4XaUHUl3+xyFha3O+FB
	 zMdyircqeLU/lS6x98BpqtGGYG+105ZBQsCU9BrfLGar4bDZaBG5E9kjQ/qPYmoKTjhGO
	 dEuuwQYMi8UQES9n8IouOPvEHfCgzTK9tx45IaAVcS5MHKzAhEtbjacawET+GCOHjB5tR
	 9G6UlTlGH1R+yvx1XhL9DDQCAFQoQwftrzQpuVz1NpWzlzkpWhrjRl6dSAkPqghdU9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793986910;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=NbvnOhYR3ZfcLZphPp6VAqzXuqxR3rkqGX+oafzOp3g=;
	b=iSyCoLvmaNfeStBNCe1C85tlh6ToI8rxoIFxbTa/OuFuNxM4xcGLHLx5N3ap7QBK6jDB
	 1uO216j/LnSbSR8+FOhQojnef/hi0DjHfLVaaaZmpzW+y19NWXT5x9GzpKFqxh7oGLu3j
	 0JYlo2t8u2o9L8m717dW89zkeT4ZeNEick5x7aWW9q3kEpSyBqJmwkDyIxPj38f/txA1Y
	 I6W+xCX3wijBB+v2k5nAfT+zWlV0DjfSszWiH0C8IfFMd7LmZ4yJsHhcDRY86o40ncDsG
	 VKRWTXtSorGJcKJp1Vs5z8y+AQLmxTVTkkp9rVKcInfS5Cej3nQySpFqhZ2qYKZhJ8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--sgsatyam.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=cnlwgDlz;
	arc=none smtp.remote-ip=209.85.214.197
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1D7C606A334
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 17:41:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1D7C606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sgsatyam.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=cnlwgDlz
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e9d52f684fso8355165ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 09:41:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793986909; x=1794591709; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NbvnOhYR3ZfcLZphPp6VAqzXuqxR3rkqGX+oafzOp3g=;
        b=cnlwgDlzU1lWqDXCYRUfzFw+0Yb74ZTl+REefg7lcvHxNCpVZteWyaChywzWRuKlJQ
         +AoTBakvnTsfnRT4Z/uICZ8tUU0RlvNM2t2PDVGuNgwTrB6mO7aRHSY/9hC0+n2W5ALw
         obwKmsL5l5G1gwi+s/vCXQjVjWu0p2be8uPqw8efFaRBLcCMtmt0pa2mFGyCZJWDxhwu
         HNtaciIFu0ce0b+cbU/2zdw9UQEb4O9Fb8s4tQ1zMYBXLq2wVTo4Os2b+EM4NFtQKz5Z
         uD6sNWr6qSnM9e1Mf8VDX5ZrVuRXVgFcYqPKX7FZah+AGHGuaAcc/tHRkImihzMudBvK
         E49g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793986909; x=1794591709;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NbvnOhYR3ZfcLZphPp6VAqzXuqxR3rkqGX+oafzOp3g=;
        b=od3WbdY+XbdsKsydMgIM71PSWqYThvtKy+HLjaydoqK7CRVen+cbO48z25v19uKJxi
         c0nNs3pdRrJvWClVWV8DAVEc5nJ9L34G8PBWSWbK1OGgPm5ukk87+b+kZ6TmTjPk6uuO
         auJ8OscZ3YghkCgYs/wHmaxFbP4ggudF4u+5XcjkZdCPJ92qQa+BDcB+20oInIC+Q/Nf
         ebZzu6UqgVDvc6uONfoSpoN2Ovz+4+/kJgQe3WIXqJ45Ok7MpMxt7dUXbduXCjIsUcR+
         CG91CW5/IAd04zFeUB+Khv8pZgAhpJADLjkTserNqpSTerBibEBhzf2285sR58SyKLZR
         vFmg==
X-Forwarded-Encrypted: i=1; AL+hErHiOsW4AZU1PA8p+T9WdvuFNm5om1Bh1BglrNsApSkx6fqFh6KP/gmQoDAQUFwtJfLCVVWZsMCZESt8RZE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9xhJ0SazmYOLiEeOF4yrkbPlDo3eFkmhBOZQIPFdBDTQeKvuHc
	fzetqLQ2AfbrZr8TSDbg5H9FDcp7+DmJnH21llTcpuZG+DCL+P5a6oQgER/Ck7u9DCvyxYaYFQB
	lJHxYjiR3HEE4RQ==
X-Received: from plnu5.prod.google.com ([2002:a17:903:1a45:b0:2e1:326b:da73])
 (user=sgsatyam job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:d58d:b0:2ed:128f:73fa with SMTP id d9443c01a7336-2ed40ddeb74mr41588915ad.46.1793986909095;
 Fri, 06 Nov 2026 09:41:49 -0800 (PST)
Date: Fri,  6 Nov 2026 17:41:47 +0000
In-Reply-To: <20261106102217.3bd67592@systembl0wer>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261105073107.172121-1-sgsatyam@google.com> <20261105132057.2429385-1-sgsatyam@google.com>
 <au1FF5K9EALuqnNR@google.com> <20261106071904.142937-1-sgsatyam@google.com> <20261106102217.3bd67592@systembl0wer>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
Message-ID: <20261106174147.1351648-1-sgsatyam@google.com>
Subject: Re: [PATCH v3] iio: cros_ec: Use platform sensor_num to unregister
 FIFO callback
From: Satyam Gupta <sgsatyam@google.com>
To: Joshua Crofts <crofts@kernel.org>
Cc: Satyam Gupta <sgsatyam@google.com>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, "=?UTF-8?q?Nuno=20S=C3=A1?=" <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, Enric Balletbo i Serra <eballetbo@kernel.org>, linux-iio@vger.kernel.org, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 6 Nov 2026 10:22:17 +0100, Joshua Crofts wrote:
> No, don't send a new version of a patch as a reply to the
> previous version, it may break tooling like b4 for example.

Got it, thanks for pointing that out. I will make sure future revisions
start a new thread instead of using --in-reply-to.

Thanks,
Satyam
