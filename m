Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794333988;
	b=VGf+L89uNb44pNtqg98EA0vvbbx2i/l7udk8+Ouh/RQPmpVe4riJG9hOXRc1jmkW2Blo
	 snFSDgqI1xvBKo73fCrYovzCjnBF+jPYP1JfHhfSwsVRnKsthmn1/nph3NsXvvs/xlzTi
	 vsQjMQnV6FnLvrU51MGJjk/OyZQBDfxoEuu2j8R89V/7N/RQkiA/q9w06YS3yrTCoB/8P
	 gR5o/5J9dbADJKPfx8J3TKSDE5lXXO341uoamnISplYKHeMa7dzBM+97TL6mvX7k+gQ64
	 uGALVvG6heb6qH71HnnoqKDf426pJJgqhnKnxNjMvc8s9lAKpZ1oNaW9UY25SMlq9lg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794333988;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=SfoLXtHqjGBdWNvjzeRsPhMhyNnS9gocssbFMuTMFA4=;
	b=t7TgE7fRn+ClJkleL9KaXP934STLEc34+evVKPaYCNqd7t528nVJsEnJwvDe6MqVKl5+
	 HXDUYIO1miKc8s3WW27mFrl1BYNxxRxkqema5noBOTwLbek5b/2rD2ifL6NQdu3hHmKFD
	 zoejH2PktbUSvfQy73Cyixp3MObWxI0YDQRpOsPc/BByevhhQ4y/y58wy01b+C8GdAOe9
	 /bzwMxuAzug1W90KvrFeB1FaVOJkg0uNvfYBSBRs4lXkxvaRZd68z52glNwy/nILJoi/s
	 2Vo0mNyPdRnwEeS18/G2Kn7Bxwa8Hb9AlHzHEgbtbXc2I177GKrmv9dOwXJKthxaFmA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o8h9kxx8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.174
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC460606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 18:06:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC460606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o8h9kxx8
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3ab27e45e7cso17820361fa.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:06:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794333986; cv=none;
        d=google.com; s=arc-20260327;
        b=H/aQfbgVpw2d0Y8TrdbobbYF3MTFj44cF++TFp/42jd/auVF9TnfEbImSW/EciBsv3
         32AR7d0UDLzW7Zo556G452ktybvYosmpAt2MOmxBitgCtejqLBewlfC/Csd6Zt9n1aDm
         pRnqPvpddQzI7ZrA+ONwQvbyjv+MPvolw0wE4zv/WhTPVWJw/a76f/s1hA8DodEaxPTk
         G13/4TNPwe6MTgr+NaFUG0Ur82MDC69Mdasp2Ju/AEkyiKE2RQ3ZcloIu8dB1ylmhiSF
         mJFhBpqzF4CQfo5Gfv+TH9rE/m5EWMZfpYHkXTzafWOVKcZ8BItH9561EhNwSQI0vwDO
         saXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SfoLXtHqjGBdWNvjzeRsPhMhyNnS9gocssbFMuTMFA4=;
        fh=FnvoH2NmydCfF0qx/cRa6lYYGiL0x2yi2asoHfWFyVs=;
        b=XA5I0VihCfbwRta1joLiUCCY9jnMBbUqha5TDNEa4IKo+1EAkAciNxIlsu0biS8kKO
         dh0mh2d+BABKBxzvGgdG4YSXvIC5FtjJc64uxRbyUKRbUGbG3RFHv79u1nQwQYocsv9E
         pIMBPx+ajiSL+fP/N/+NTuuaPoEk7O6cEslKxSMzJ5HANbfcNURUdc+2qWVUspvh6V6I
         D2KK8dvcda1+3A1eOvHHpOhsSJqvqHXe7UKc+Y0DBxygizRaGTj3mL5Hy0PnN0s5vZ37
         b311rKlS/K5B6Nw3azzMmRZ43OibQaIFBTAgc09Zxpp3JQj+Py7H2uMIf09eCKN578jK
         oaRA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794333986; x=1794938786; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SfoLXtHqjGBdWNvjzeRsPhMhyNnS9gocssbFMuTMFA4=;
        b=o8h9kxx84PGbW2rpni7hxvpfcNJwXYKUoMbKQU64yIBjjuHJYIU1Mu98UU5WoAF65f
         JKLS23xoha8B8XfKn5IT5Cko5JUBHH10YwDLthAVhFeA9npZoKH0FnaMQ0ZCealdMDbj
         K3CG9/8GoJqtJY8aDDy5euBXgZDgOsiFxCDZ6HnrVSGoXeKNE60X3kKjGe6RMc8LPmCh
         eyPCW6zZMvvaSZvWj08Lf022fqoC5VuCL+fcvnEMz+cBb3c3EP8VxV9OIRTQQvxWjgVj
         gIE54XvpJx/tH8IJ1UKBJRQUfZo5S3+UrYFKpwdPSHtXUyVHhXVH/KM3AHeX5ISfOcG2
         IDOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794333986; x=1794938786;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SfoLXtHqjGBdWNvjzeRsPhMhyNnS9gocssbFMuTMFA4=;
        b=L4Ex2kQvhHqUR0vrdb0nl6OMU3PYo2rRf+myu0tSnXdI0EaLXa2TxV05iFheEdxm6P
         CwEY5NW3kxWQURLy5+jQujVgd9V2pwPByUQl9n1dbVoZXayIcYnlz1oE6z37KDzFUmI5
         4TGEdfQR7U2tRrq0aATSuHMJI+kp3HUyw/DaMaMyKcQidEodrztLR6Dvwykuq0IOE7qX
         9M1uA0pO2bg0+84vKBzUOkUD4qf8AjPssNmZT3n/rQL7j6FchXBhxiBIZgQHmgtHQ3Tj
         DwhBloJEocDhjAJZsF62Bl3tsukGi72bgh6jSXhYi93dV5ho++tRQppnKwioxmJqMVJT
         6dqA==
X-Forwarded-Encrypted: i=1; AL+hErHqB3OeJMcXBBRRjZjukpbF8tQrPX8jl4ZaY/NIc79TeWY7jATUSWzo5T491/KX843xyDVElU+xQQHJ8IE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8xsizUpR5dpsUpADOz97lqmpCMOZjOv8mIPgBTGrxdfGjS8RGE
	7I1NpUo4JxEl80vvG7Y0sxqGAyg7IFlGlRZ7KxqcI4wVjWzIBwGFJ1HXbLKh+5w2RK1Q09z2Voc
	xz2gex7J907G4YG6GW/Zk9mLns5QHACk=
X-Gm-Gg: AYBFou15dW9EaWELORL0esIu2yJ/NijK3lDxE6YkeMRP4oYKjQSH+PS7cKQZ9H1BX3x
	3vrFMMSbd8bbx5eMdEbXK8nVyK90qKgSrA7RIwRESD4DxBi23OLRYhU0LssbzAuVHah/XcLnWHP
	gywnToadccPFdvz3zkcaUXO/BLiSR/u83OvmUAD5+EJNqpEKSWpObb6wby3hrgQnLKonqw9ZvqW
	WwRLUrQiYYn+67EPjmuGb7m8jIWMTHFNf/lgAxFQVyvZmmlf4w5S/+/yDzGvilh8IBKreI8aTMW
	mL5rvk7mQY7JNqZz9R63t2MlziBPSIW3zqW7HCtXwmrSaQQGVIz81MZ/XxA7Dh31Fvt8PskjxWb
	rAzmGiAwSl400JttgpR/1cCuoDsRm5Nv+RMyOYrQt1IxxZx2bmtdeYPoePjWTK1hRx6d1fRqVGL
	+mmbFXvTHnexhIYHHH4AjWjhP3V4m6LeZ2fdwsYgCbtmt1tSfWGB9p
X-Received: by 2002:a05:651c:888:b0:3ac:e902:f22d with SMTP id
 38308e7fff4ca-3ae09650574mr6624441fa.27.1794333986106; Tue, 10 Nov 2026
 10:06:26 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110054836.1515030-1-senozhatsky@chromium.org> <20261110054836.1515030-12-senozhatsky@chromium.org>
In-Reply-To: <20261110054836.1515030-12-senozhatsky@chromium.org>
From: Nhat Pham <nphamcs@gmail.com>
Date: Tue, 10 Nov 2026 11:06:13 -0700
X-Gm-Features: AclHuK_swjugJ8PYhgUUzKQzdHDuV10SGT2tfqTTSkLlpXsGrfb9HF1M_R3wmdQ
Message-ID: <CAKEwX=NvOym=p+pU-nxW9hdrf3wq+Ns6TGFqmjqHw1rY9ELcuw@mail.gmail.com>
Subject: Re: [PATCH v2 11/11] zsmalloc: populate new zspage outside
 class->lock in zs_store()
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Yosry Ahmed <yosry.ahmed@linux.dev>, 
	Johannes Weiner <hannes@cmpxchg.org>, Brian Geffon <bgeffon@google.com>, 
	Minchan Kim <minchan@kernel.org>, Richard Chang <richardycc@google.com>, linux-kernel@vger.kernel.org, 
	linux-block@vger.kernel.org, linux-mm@kvack.org, 
	Yosry Ahmed <yosry@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 9, 2026 at 10:49=E2=80=AFPM Sergey Senozhatsky
<senozhatsky@chromium.org> wrote:
>
> A new zspage is not on class fullness lists and is not movable until
> zs_store() calls insert_zspage() and SetZsPageMovable(), so neither
> other zs_store() callers nor compaction and page migration can see it.
> Nobody else has the handle yet either.
>
> So for a new zspage allocate the object and copy the data before we
> take class->lock, and don't take zspage read lock.  This makes
> class->lock critical section shorter and saves a zspage lock/unlock.
>
> Suggested-by: Yosry Ahmed <yosry@kernel.org>
> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>

Reviewed-by: Nhat Pham <nphamcs@gmail.com>
