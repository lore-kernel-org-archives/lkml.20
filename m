Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CC9D36AB61
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 05:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789795955; cv=none; b=X2TW/Vr12bWClBMzPz+0xKE+EUNjx30z+HFBmJZVX4SeYdZq0UfdyWq8KvwOa3j1OgqVLg4qy6fLfUQUeJiTIMABHcuTjS6egG/tkvT20PEKwp89XbGcSNqDyvgx2LqWyYJHjn0kSqbS0kD3w2x5bcFkg+zh93WgRpjF8BSXQwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789795955; c=relaxed/simple;
	bh=Z7Vrqhz4zZTyEAjiYZc5R2ZjTYR1ZaAGalKcjp8AZGQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JgN6KWRlsl7iMjk6fPMiCeERROMXn3zmVxozIn4KjUEmCePlS+VHriLDQ1MkzP8ZB6nttnS9jCzUHQ06UjeikTUht6+cna5k96VqCj38O3H2xCFASwD5WAcwZ01FMU5HZ7PAddb9u8vkTHVIkUuqkrcg4wDb8Jo+g5jlgNl78/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JPeXe53u; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JPeXe53u"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7bcb94d3so9687145e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 22:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789795952; x=1790400752; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z7Vrqhz4zZTyEAjiYZc5R2ZjTYR1ZaAGalKcjp8AZGQ=;
        b=JPeXe53uo9G+uAj2RQGc2oGkSUmoP5E4RvydCiqXTpgEZ39zTtYDeHt8LzdQpNUjPu
         MEBX3MeIeTZk3ihePLJZdmdDsGmRRly7nIaD9QJtD98CpReLfJSqK05E4inmeNLeQpsz
         +gZsp91vfn2ceCWoCvUlWu9ZfKcFlngGmiT1WLGlt5YD0TUlY/eHhrqKDyQSvfFQPEC8
         whge6LPjMDvRlcBRIJ82UXcpzeN63MpSI5wf0RQjZ1SJxNkbB92a4dVXaIpwTSL1gYIy
         pBp4Ra1RzioxpPfXJrp79hj3ScXJmsXQXbvo0kmcpeJJOOik/I9MbyuC2Jp3ADoXu71k
         04Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789795952; x=1790400752;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z7Vrqhz4zZTyEAjiYZc5R2ZjTYR1ZaAGalKcjp8AZGQ=;
        b=vL8GKD/juNjRzAx7U7wKS2oHDIR7z7PaQzLirkdP/ss9xl7g6PA0fbQ1RyN6wq53u+
         9/o6wb5dRzG+21dbtWICVLcjeTfjBOL+O7LWeRYCe+ct2TA8EfZUXmv4mUpq734BUyeC
         8dGt6ZuVbk7jClne11Hte51NgkupDiorxp3joBV8FzFTtW3VPLATFiFXD9D53d5BX+N9
         SUxrW5a+gQvTyhLDgSjagV6dXdEWceWG7jXqH32Ji+8AESx6327vIy5j+EMwNPj9tydr
         qim96hqbExPHkrNTmY30OvvRF8PGTv4dD2pibxIE8Vjz01Er+AaiMQmFsFajDF0izTZO
         ioCQ==
X-Forwarded-Encrypted: i=1; AKwUvByjpDTPnF9fkHf67PCYwl4ItLjREU76LhbYj1ypNLrhsK6goV9z9e3Fwx90glEd9QpVAI7vydHw3qBNmW4=@vger.kernel.org
X-Gm-Message-State: AFuF++kjPS9st9uRg2dZfQwogeMrvEvXZo1X7tM4ZslEJEJHAW1lHwIn
	Oxx4jWzj56TfxgV/ZawD8PriSszxcNMMsBqsktfrX+bRFJaQZx84xttH
X-Gm-Gg: AYBFou2haD9kWsSuEH6fz5gf0cADCz8uh0oh1gcdXecztmjMoGu6KOJadNKH9YSdWY1
	ArgSPRj/GNiA8L/ywpri8DKFhsY3f0FgOtO+NNcL+YgeD4rCkqVGHXvERUL+nUEYKFiAKXMHunC
	3E6BgFUYe70kUawja3fbqHji5U+m5obJmOt9WqlqjR2czOpffBHUEkozpQVN1NFSjipZTDOUXc0
	RCk8Ld370Lmeg7vPMljFJtGQmq6m7otrf8XTS7WRMXfksds+Jd8Kgw+luOxU9j16smh7AaL7/SR
	qnuky25xyPSX0GvaluSzuDgrAVzEmmNWgM0Jv6PBp395gRGR9JcYbMT0IHGa06gFjM5nLmXSJeX
	mjSy4K2O0epbJuKyuSdDo3fa8g2dd/lis8YEvgG6D7AWoUCqOhaQGAxxibPqJ0UsCt10X7jqXrT
	n4x4LwWngKHVB9HpKjeZwYZ/GH1QKiD2PWLJVeoysR92MBcc9JzM5g5KMsjnqIeTOkWz/iUwzGh
	wfWkBsqIk3xPDEefQmzPkBxexhMcHB6MYqddJZOd3uNX5KKnrXyHyJQH5TtLz1RPSAL6/B4oMTT
	QHw7V6DzdEC5sSXSD0Y1/UfJXMKycp/cTVh8wfNMhCU4zcrnPFcJZNCTTYNhJlCt+y4KaWuLhEy
	M5JODx5HYrGGRGeaZ
X-Received: by 2002:a05:600c:310e:b0:49c:f4ff:e872 with SMTP id 5b1f17b1804b1-49fc5681249mr61632675e9.5.1789795952410;
        Fri, 18 Sep 2026 22:32:32 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-2a02-3100-a017-2b01-05fe-203b-7cd2-a640.310.pool.telefonica.de. [2a02:3100:a017:2b01:5fe:203b:7cd2:a640])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd2f7ef3sm40674185e9.0.2026.09.18.22.32.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 18 Sep 2026 22:32:32 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: docs: fimc: Update module build options
Date: Sat, 19 Sep 2026 07:32:30 +0200
Message-Id: <20260919053230.26339-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260822090647.98016-1-kmehltretter@gmail.com>
References: <20260822090647.98016-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Sat, 22 Aug 2026 11:06:47 +0200, I wrote:
> s5p-csis.ko has always been controlled separately by
> VIDEO_S5P_MIPI_CSIS, so building FIMC as a module does not produce
> both modules. Describe each module with its own option.

Friendly ping on this documentation fix. Is anything else needed
from my side?

Thanks,
Karl
